Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AED74758D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:23:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 10:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,634,1427785200"; d="scan'208";a="729357434"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 10:23:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 18:23:27 +0100
Message-Id: <ba1e071d362644cc63f29ec9e3b0baccacf833ef.1434559829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] devtool: deploy: fix preservation of symlinks and permissions/ownership
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 17:23:41 -0000

It turns out that scp can't be used to copy symlinks because it follows
them instead of copying them, and this is by design (since it emulates
rcp which also behaved this way); the unfortunate result is that
symlinks that point to valid files on the host translate into the host
file being copied to the target (yuck).  The simplest alternative that
does not have this undesirable behaviour is to use tar and pipe it over
ssh.

At the same time, it would be even better if we properly reflect file
permissions and ownership on the target that have been established
within the pseudo environment. We can do this by executing the copy
process under pseudo, which turns out to be quite easy with access to
the pseudo environment set up by the build system.

Fixes [YOCTO #7868].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 48 +++++++++++++++++++++++++++++++++++++--
 scripts/lib/devtool/__init__.py   | 16 +++++++++++++
 scripts/lib/devtool/deploy.py     | 10 +++++---
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 4e22e1d..c4a0399 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -60,6 +60,27 @@ class DevtoolBase(oeSelfTest):
             self.add_command_to_tearDown('bitbake-layers remove-layer %s || true' % templayerdir)
             result = runCmd('bitbake-layers add-layer %s' % templayerdir, cwd=self.builddir)
 
+    def _process_ls_output(self, output):
+        """
+        Convert ls -l output to a format we can reasonably compare from one context
+        to another (e.g. from host to target)
+        """
+        filelist = []
+        for line in output.splitlines():
+            splitline = line.split()
+            # Remove trailing . on perms
+            splitline[0] = splitline[0].rstrip('.')
+            # Remove leading . on paths
+            splitline[-1] = splitline[-1].lstrip('.')
+            # Drop fields we don't want to compare
+            del splitline[7]
+            del splitline[6]
+            del splitline[5]
+            del splitline[4]
+            del splitline[1]
+            filelist.append(' '.join(splitline))
+        return filelist
+
 
 class DevtoolTests(DevtoolBase):
 
@@ -796,9 +817,32 @@ class DevtoolTests(DevtoolBase):
         console.expect("login:", timeout=120)
         # Now really test deploy-target
         result = runCmd('devtool deploy-target -c %s root@%s' % (testrecipe, testhost))
-        result = runCmd('ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@%s %s' % (testhost, testcommand))
+        # Run a test command to see if it was installed properly
+        sshargs = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+        result = runCmd('ssh %s root@%s %s' % (sshargs, testhost, testcommand))
+        # Check if it deployed all of the files with the right ownership/perms
+        # First look on the host - need to do this under pseudo to get the correct ownership/perms
+        installdir = get_bb_var('D', testrecipe)
+        fakerootenv = get_bb_var('FAKEROOTENV', testrecipe)
+        fakerootcmd = get_bb_var('FAKEROOTCMD', testrecipe)
+        result = runCmd('%s %s find . -type f -exec ls -l {} \;' % (fakerootenv, fakerootcmd), cwd=installdir)
+        filelist1 = self._process_ls_output(result.output)
+
+        # Now look on the target
+        tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir2)
+        tmpfilelist = os.path.join(tempdir2, 'files.txt')
+        with open(tmpfilelist, 'w') as f:
+            for line in filelist1:
+                splitline = line.split()
+                f.write(splitline[-1] + '\n')
+        result = runCmd('cat %s | ssh -q %s root@%s \'xargs ls -l\'' % (tmpfilelist, sshargs, testhost))
+        filelist2 = self._process_ls_output(result.output)
+        filelist1.sort(key=lambda item: item.split()[-1])
+        filelist2.sort(key=lambda item: item.split()[-1])
+        self.assertEqual(filelist1, filelist2)
         # Test undeploy-target
         result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, testhost))
-        result = runCmd('ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@%s %s' % (testhost, testcommand), ignore_status=True)
+        result = runCmd('ssh %s root@%s %s' % (sshargs, testhost, testcommand), ignore_status=True)
         self.assertNotEqual(result, 0, 'undeploy-target did not remove command as it should have')
         console.close()
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index ea0b63e..61b810c 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -80,6 +80,22 @@ def exec_watch(cmd, **options):
 
     return buf, None
 
+def exec_fakeroot(d, cmd, **kwargs):
+    """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
+    # Grab the command and check it actually exists
+    fakerootcmd = d.getVar('FAKEROOTCMD', True)
+    if not os.path.exists(fakerootcmd):
+        logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
+        return 2
+    # Set up the appropriate environment
+    newenv = dict(os.environ)
+    fakerootenv = d.getVar('FAKEROOTENV', True)
+    for varvalue in fakerootenv.split():
+        if '=' in varvalue:
+            splitval = varvalue.split('=', 1)
+            newenv[splitval[0]] = splitval[1]
+    return subprocess.call("%s %s" % (fakerootcmd, cmd), env=newenv, **kwargs)
+
 def setup_tinfoil():
     """Initialize tinfoil api from bitbake"""
     import scriptpath
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index ca74a8e..448db96 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -19,7 +19,7 @@
 import os
 import subprocess
 import logging
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+from devtool import exec_fakeroot, setup_tinfoil, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -73,9 +73,13 @@ def deploy(args, config, basepath, workspace):
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-    if not args.show_status:
+    if args.show_status:
+        tarextractopts = 'xv'
+    else:
+        tarextractopts = 'x'
         extraoptions += ' -q'
-    ret = subprocess.call('scp -r %s %s/* %s:%s' % (extraoptions, recipe_outdir, args.target, destdir), shell=True)
+    # We cannot use scp here, because it doesn't preserve symlinks
+    ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'tar %s -C %s -f -\'' % (extraoptions, args.target, tarextractopts, destdir), cwd=recipe_outdir, shell=True)
     if ret != 0:
         raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                            'error message')
-- 
2.1.0


