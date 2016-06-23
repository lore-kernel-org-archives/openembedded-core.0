Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 73BEA60123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730851"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:07:03 +1200
Message-Id: <10c9f0e4d8316f79212cb3d346e6ff5218edc928.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 07/10] classes/populate_sdk_ext: eliminate double execution on install
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:50 -0000

Use the new BB_SETSCENE_ENFORCE functionality to avoid having to run
bitbake twice on installing the extensible SDK - we can now do it all in
one invocation which not only takes less time, but we should also get
more meaningful errors for some types of failure, in particular where
downloading from an sstate mirror fails.

One result of this change is that you get the errors printed on the
console during normal output rather than this going to the
preparing_build_system.log file first. In OE-Core revision
227d2cbf9e0b8c35fa6644e3d72e0699db9607fa, we changed to always print the
contents of preparing_build_system.log on failure, but now at least the
error contents of that log is duplicated. Besides, I intentionally
didn't print out the contents of that log during normal usage because
it's quite verbose - the bug that we were attempting to fix was about
not getting this information when seeing failures in the automated
tests, thus I've moved printing the log to the test handling code
instead.

Part of the implementation of [YOCTO #9367].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  7 +++--
 meta/classes/testsdk.bbclass          | 12 ++++++--
 meta/files/ext-sdk-prepare.py         | 52 +----------------------------------
 3 files changed, 16 insertions(+), 55 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index b9d9543..df39ff6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -223,10 +223,13 @@ python copy_buildsystem () {
             # warning.
             f.write('SIGGEN_LOCKEDSIGS_SSTATE_EXISTS_CHECK = "none"\n\n')
 
-            # Error if the sigs in the locked-signature file don't match
+            # Warn if the sigs in the locked-signature file don't match
             # the sig computed from the metadata.
             f.write('SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n\n')
 
+            # Set up whitelist for run on install
+            f.write('BB_SETSCENE_ENFORCE_WHITELIST = "%:* *:do_shared_workdir *:do_rm_work"\n\n')
+
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n')
 
@@ -424,7 +427,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_INSTALL_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE"; cat "$LOGFILE"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py '${SDK_INSTALL_TARGETS}' >> $LOGFILE 2>&1" || { echo "ERROR: SDK preparation failed: see $LOGFILE for a slightly more detailed log"; echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 		rm $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 18f7678..0b8716e 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -113,10 +113,18 @@ def testsdkext_main(d):
     testdir = d.expand("${WORKDIR}/testsdkext/")
     bb.utils.remove(testdir, True)
     bb.utils.mkdirhier(testdir)
+    sdkdir = os.path.join(testdir, 'tc')
     try:
-        subprocess.check_output("%s -y -d %s/tc" % (tcname, testdir), shell=True)
+        subprocess.check_output("%s -y -d %s" % (tcname, sdkdir), shell=True)
     except subprocess.CalledProcessError as e:
-        bb.fatal("Couldn't install the SDK EXT:\n%s" % e.output.decode("utf-8"))
+        msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
+        logfn = os.path.join(sdkdir, 'preparing_build_system.log')
+        if os.path.exists(logfn):
+            msg += '\n\nContents of preparing_build_system.log:\n'
+            with open(logfn, 'r') as f:
+                for line in f:
+                    msg += line
+        bb.fatal(msg)
 
     try:
         bb.plain("Running SDK Compatibility tests ...")
diff --git a/meta/files/ext-sdk-prepare.py b/meta/files/ext-sdk-prepare.py
index bf0d033..3b33c0f 100644
--- a/meta/files/ext-sdk-prepare.py
+++ b/meta/files/ext-sdk-prepare.py
@@ -27,22 +27,6 @@ def exec_watch(cmd, **options):
 
     return process.returncode, buf
 
-def check_unexpected(lines, recipes):
-    """Check for unexpected output lines from dry run"""
-    unexpected = []
-    for line in lines.splitlines():
-        if 'Running task' in line:
-            for recipe in recipes:
-                if recipe in line:
-                    break
-            else:
-                line = line.split('Running', 1)[-1]
-                if 'do_rm_work' not in line:
-                    unexpected.append(line.rstrip())
-        elif 'Running setscene' in line:
-            unexpected.append(line.rstrip())
-    return unexpected
-
 def main():
     if len(sys.argv) < 2:
         sdk_targets = []
@@ -55,44 +39,10 @@ def main():
 
     print('Preparing SDK for %s...' % ', '.join(sdk_targets))
 
-    ret, out = exec_watch('bitbake %s --setscene-only' % ' '.join(sdk_targets))
+    ret, out = exec_watch('BB_SETSCENE_ENFORCE=1 bitbake %s' % ' '.join(sdk_targets))
     if ret:
         return ret
 
-    targetlist = []
-    for target in sdk_targets:
-        if ':' in target:
-            target = target.split(':')[0]
-        if not target in targetlist:
-            targetlist.append(target)
-
-    recipes = []
-    for target in targetlist:
-        try:
-            out = subprocess.check_output(('bitbake -e %s' % target).split(), stderr=subprocess.STDOUT)
-            for line in out.splitlines():
-                if line.startswith('FILE='):
-                    splitval = line.rstrip().split('=')
-                    if len(splitval) > 1:
-                        recipes.append(splitval[1].strip('"'))
-                    break
-        except subprocess.CalledProcessError as e:
-            print('ERROR: Failed to get recipe for target %s:\n%s' % (target, e.output))
-            return 1
-
-    try:
-        out = subprocess.check_output('bitbake %s -n' % ' '.join(sdk_targets), stderr=subprocess.STDOUT, shell=True)
-        unexpected = check_unexpected(out, recipes)
-    except subprocess.CalledProcessError as e:
-        print('ERROR: Failed to execute dry-run:\n%s' % e.output)
-        return 1
-
-    if unexpected:
-        print('ERROR: Unexpected tasks or setscene left over to be executed:')
-        for line in unexpected:
-            print('  ' + line)
-        return 1
-
 if __name__ == "__main__":
     try:
         ret = main()
-- 
2.5.5


