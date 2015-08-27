Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 200BD76E17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:31:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 02:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="776621071"
Received: from wneubaue-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.11.162])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 02:31:21 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 12:31:14 +0300
Message-Id: <1440667876-1024-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 2/4] package_rpm: support signing of rpm packages
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
X-List-Received-Date: Thu, 27 Aug 2015 09:31:20 -0000

This patch adds a new bbclass for generating rpm packages that are
signed with a user defined key. The packages are signed as part of the
"package_write_rpm" task.

In order to enable the feature you need to
1. 'INHERIT += " sign_rpm"' in bitbake config (e.g. local or
   distro)
2. Create a file that contains the passphrase to your gpg secret key
3. 'RPM_GPG_PASSPHRASE_FILE = "<path_to_file>" in bitbake config,
   pointing to the passphrase file created in 2.
4. Define GPG key name to use by either defining
   'RPM_GPG_NAME = "<key_id>" in bitbake config OR by defining
   %_gpg_name <key_id> in your ~/.oerpmmacros file
5. 'RPM_GPG_PUBKEY = "<path_to_pubkey>" in bitbake config pointing to
   the public key (in "armor" format)

The user may optionally define "GPG_CMD" variable in the bitbake
configuration in order to specify a specific gpg binary/wrapper to use.

The sign_rpm.bbclass implements a simple scenario of locally signing the
packages. It could be replaced by a more advanced class that would
utilize a separate signing server for signing the packages, for example.

[YOCTO #8134]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/package_rpm.bbclass |  5 ++++
 meta/classes/sign_rpm.bbclass    | 60 ++++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/package_manager.py   | 17 ++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 meta/classes/sign_rpm.bbclass

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 8fd0685..3e933ef 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -695,6 +695,8 @@ python do_package_rpm () {
     else:
         d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
+    d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
+    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR', True))
     pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
     magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
     bb.utils.mkdirhier(pkgwritedir)
@@ -730,6 +732,9 @@ python do_package_rpm () {
     d.setVar('BUILDSPEC', cmd + "\n")
     d.setVarFlag('BUILDSPEC', 'func', '1')
     bb.build.exec_func('BUILDSPEC', d)
+
+    if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
+        bb.build.exec_func("sign_rpm", d)
 }
 
 python () {
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
new file mode 100644
index 0000000..552af68
--- /dev/null
+++ b/meta/classes/sign_rpm.bbclass
@@ -0,0 +1,60 @@
+inherit sanity
+
+RPM_SIGN_PACKAGES='1'
+
+
+_check_gpg_name () {
+    macrodef=`rpm -E '%_gpg_name'`
+    [ "$macrodef" == "%_gpg_name" ] && return 1 || return 0
+}
+
+
+def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
+    import pexpect
+
+    # Find the correct rpm binary
+    rpm_bin_path = d.getVar('STAGING_BINDIR_NATIVE', True) + '/rpm'
+    cmd = rpm_bin_path + " --addsign "
+    if gpg_name:
+        cmd += "--define '%%_gpg_name %s' " % gpg_name
+    else:
+        try:
+            bb.build.exec_func('_check_gpg_name', d)
+        except bb.build.FuncFailed:
+            raise_sanity_error("You need to define RPM_GPG_NAME in bitbake "
+                               "config or the %_gpg_name RPM macro defined "
+                               "(e.g. in  ~/.oerpmmacros", d)
+    if d.getVar('GPG_BIN', True):
+        cmd += "--define '%%__gpg %s' " % d.getVar('GPG_BIN', True)
+    cmd += ' '.join(files)
+
+    # Need to use pexpect for feeding the passphrase
+    proc = pexpect.spawn(cmd)
+    try:
+        proc.expect_exact('Enter pass phrase:', timeout=15)
+        proc.sendline(passphrase)
+        proc.expect(pexpect.EOF, timeout=900)
+        proc.close()
+    except pexpect.TIMEOUT as err:
+        bb.debug('rpmsign timeout: %s' % err)
+        proc.terminate()
+    return proc.exitstatus
+
+
+python sign_rpm () {
+    import glob
+
+    rpm_gpg_pass_file = (d.getVar("RPM_GPG_PASSPHRASE_FILE", True) or "")
+    if rpm_gpg_pass_file:
+        with open(rpm_gpg_pass_file) as fobj:
+            rpm_gpg_passphrase = fobj.readlines()[0].rstrip('\n')
+    else:
+        raise_sanity_error("You need to define RPM_GPG_PASSPHRASE_FILE in the config", d)
+
+    rpm_gpg_name = (d.getVar("RPM_GPG_NAME", True) or "")
+
+    rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
+
+    if rpmsign_wrapper(d, rpms, rpm_gpg_passphrase, rpm_gpg_name) != 0:
+        raise bb.build.FuncFailed("RPM signing failed")
+}
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2ab1d78..936887c 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -108,6 +108,7 @@ class RpmIndexer(Indexer):
         archs = archs.union(set(sdk_pkg_archs))
 
         rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+
         index_cmds = []
         rpm_dirs_found = False
         for arch in archs:
@@ -127,9 +128,16 @@ class RpmIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
+        # Create repodata
         result = oe.utils.multiprocess_exec(index_cmds, create_index)
         if result:
             bb.fatal('%s' % ('\n'.join(result)))
+        # Copy pubkey to repo
+        distro_version = self.d.getVar('DISTRO_VERSION', True) or "oe.0"
+        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
+            shutil.copy2(self.d.getVar('RPM_GPG_PUBKEY', True),
+                         os.path.join(self.deploy_dir,
+                                      'RPM-GPG-KEY-%s' % distro_version))
 
 
 class OpkgIndexer(Indexer):
@@ -352,6 +360,9 @@ class RpmPkgsList(PkgsList):
             pkg = line.split()[0]
             arch = line.split()[1]
             ver = line.split()[2]
+            # Skip GPG keys
+            if pkg == 'gpg-pubkey':
+                continue
             if self.rpm_version == 4:
                 pkgorigin = "unknown"
             else:
@@ -864,6 +875,12 @@ class RpmPM(PackageManager):
         except subprocess.CalledProcessError as e:
             bb.fatal("Create rpm database failed. Command '%s' "
                      "returned %d:\n%s" % (cmd, e.returncode, e.output))
+        # Import GPG key to RPM database of the target system
+        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
+            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
+            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s > /dev/null" % (
+                  self.rpm_cmd, self.target_rootfs, pubkey_path)
+            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
         # Configure smart
         bb.note("configuring Smart settings")
-- 
2.1.4


