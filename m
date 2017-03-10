Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 06E1277706
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988217"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:05 +0200
Message-Id: <a22c578ae4006606ae87af2c086f90c652ec689f.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/44] testimage.bbclass: fix runtime test for rpm, port smart tests to dnf
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:54 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/testimage.bbclass           |  25 ++--
 meta/lib/oeqa/oetest.py                  |   7 --
 meta/lib/oeqa/runtime/cases/dnf.py       | 111 +++++++++++++++++
 meta/lib/oeqa/runtime/cases/parselogs.py |   1 +
 meta/lib/oeqa/runtime/cases/rpm.py       |  21 ++--
 meta/lib/oeqa/runtime/cases/smart.py     | 196 -------------------------------
 6 files changed, 133 insertions(+), 228 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/dnf.py
 delete mode 100644 meta/lib/oeqa/runtime/cases/smart.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 8d8443ca848..07744aff92f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -35,7 +35,7 @@ TEST_NEEDED_PACKAGES_DIR ?= "${WORKDIR}/testimage/packages"
 TEST_EXTRACTED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/extracted"
 TEST_PACKAGED_DIR ?= "${TEST_NEEDED_PACKAGES_DIR}/packaged"
 
-RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'smart rpm', '', d)}"
+RPMTESTSUITE = "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf rpm', '', d)}"
 SYSTEMDSUITE = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 MINTESTSUITE = "ping"
 NETTESTSUITE = "${MINTESTSUITE} ssh df date scp oe_syslog ${SYSTEMDSUITE}"
@@ -74,12 +74,11 @@ TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'cpio-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS_qemuall += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'dnf-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'ipk', 'opkg-utils-native:do_populate_sysroot', '', d)}"
 TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'deb', 'apt-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python-smartpm-native:do_populate_sysroot', '', d)}"
-TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-native:do_populate_sysroot', '', d)}"
+TESTIMAGEDEPENDS += "${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'createrepo-c-native:do_populate_sysroot', '', d)}"
 
 TESTIMAGELOCK = "${TMPDIR}/testimage.lock"
 TESTIMAGELOCK_qemuall = ""
@@ -120,7 +119,7 @@ python do_testimage() {
     testimage_sanity(d)
 
     if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
-       and 'smart' in d.getVar('TEST_SUITES')):
+       and 'dnf' in d.getVar('TEST_SUITES')):
         create_rpm_index(d)
 
     testimage_main(d)
@@ -324,30 +323,26 @@ def create_index(arg):
 
 def create_rpm_index(d):
     # Index RPMs
-    rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+    rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo_c")
     index_cmds = []
     archs = (d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or '').replace('-', '_')
 
     for arch in archs.split():
         rpm_dir = os.path.join(d.getVar('DEPLOY_DIR_RPM'), arch)
-        idx_path = os.path.join(d.getVar('WORKDIR'), 'rpm', arch)
-        db_path = os.path.join(d.getVar('WORKDIR'), 'rpmdb', arch)
+        idx_path = os.path.join(d.getVar('WORKDIR'), 'oe-testimage-repo', arch)
 
         if not os.path.isdir(rpm_dir):
             continue
-        if os.path.exists(db_path):
-            bb.utils.remove(dbpath, True)
 
         lockfilename = os.path.join(d.getVar('DEPLOY_DIR_RPM'), 'rpm.lock')
         lf = bb.utils.lockfile(lockfilename, False)
         oe.path.copyhardlinktree(rpm_dir, idx_path)
         # Full indexes overload a 256MB image so reduce the number of rpms
-        # in the feed. Filter to p* since we use the psplash packages and
+        # in the feed. Filter to r* since we use the run-postinst packages and
         # this leaves some allarch and machine arch packages too.
-        bb.utils.remove(idx_path + "*/[a-oq-z]*.rpm")
+        bb.utils.remove(idx_path + "*/[a-qs-z]*.rpm")
         bb.utils.unlockfile(lf)
-        cmd = '%s --dbpath %s --update -q %s' % (rpm_createrepo,
-                                                 db_path, idx_path)
+        cmd = '%s --update -q %s' % (rpm_createrepo, idx_path)
 
         # Create repodata
         result = create_index(cmd)
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 1dad763ff14..f7171260e74 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -128,13 +128,6 @@ class oeRuntimeTest(oeTest):
     def tearDownLocal(self):
         pass
 
-    #TODO: use package_manager.py to install packages on any type of image
-    def install_packages(self, packagelist):
-        for package in packagelist:
-            (status, result) = self.target.run("smart install -y "+package)
-            if status != 0:
-                return status
-
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
new file mode 100644
index 00000000000..77e7eb94507
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -0,0 +1,111 @@
+import os
+import re
+import subprocess
+from oeqa.utils.httpserver import HTTPService
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class DnfTest(OERuntimeTestCase):
+
+    def dnf(self, command, expected = 0):
+        command = 'dnf-2 %s' % command
+        status, output = self.target.run(command, 1500)
+        message = os.linesep.join([command, output])
+        self.assertEqual(status, expected, message)
+        return output
+
+class DnfBasicTest(DnfTest):
+
+    @skipIfNotFeature('package-management',
+                      'Test requires package-management to be in IMAGE_FEATURES')
+    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
+                      'RPM is not the primary package manager')
+    @OEHasPackage(['dnf'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_dnf_help(self):
+        self.dnf('--help')
+
+    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    def test_dnf_version(self):
+        self.dnf('--version')
+
+    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    def test_dnf_info(self):
+        self.dnf('info dnf')
+
+    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    def test_dnf_search(self):
+        self.dnf('search dnf')
+
+    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    def test_dnf_history(self):
+        self.dnf('history')
+
+class DnfRepoTest(DnfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-testimage-repo'),
+                                      cls.tc.target.server_ip)
+        cls.repo_server.start()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.repo_server.stop()
+
+    def dnf_with_repo(self, command):
+        pkgarchs = os.listdir(os.path.join(self.tc.td['WORKDIR'], 'oe-testimage-repo'))
+        deploy_url = 'http://%s:%s/' %(self.target.server_ip, self.repo_server.port)
+        cmdlinerepoopts = ["--repofrompath=oe-testimage-repo-%s,%s%s" %(arch, deploy_url, arch) for arch in pkgarchs]
+
+        self.dnf(" ".join(cmdlinerepoopts) + " --nogpgcheck " + command)
+
+    @OETestDepends(['dnf.DnfBasicTest.test_dnf_help'])
+    def test_dnf_makecache(self):
+        self.dnf_with_repo('makecache')
+
+
+# Does not work when repo is specified on the command line
+#    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+#    def test_dnf_repolist(self):
+#        self.dnf_with_repo('repolist')
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    def test_dnf_repoinfo(self):
+        self.dnf_with_repo('repoinfo')
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
+    def test_dnf_install(self):
+        self.dnf_with_repo('install -y run-postinsts-dev')
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
+    def test_dnf_install_dependency(self):
+        self.dnf_with_repo('remove -y run-postinsts')
+        self.dnf_with_repo('install -y run-postinsts-dev')
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_dependency'])
+    def test_dnf_install_from_disk(self):
+        self.dnf_with_repo('remove -y run-postinsts-dev')
+        self.dnf_with_repo('install -y --downloadonly run-postinsts-dev')
+        status, output = self.target.run('find /var/cache/dnf -name run-postinsts-dev*rpm', 1500)
+        self.assertEqual(status, 0, output)
+        self.dnf_with_repo('install -y %s' % output)
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install_from_disk'])
+    def test_dnf_install_from_http(self):
+        output = subprocess.check_output('%s %s -name run-postinsts-dev*' % (bb.utils.which(os.getenv('PATH'), "find"),
+                                                                           self.tc.td['DEPLOY_DIR_RPM']), shell=True).decode("utf-8")
+        rpm_path = output.split("/")[-2] + "/" + output.split("/")[-1]
+        url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, rpm_path)
+        self.dnf_with_repo('remove -y run-postinsts-dev')
+        self.dnf_with_repo('install -y %s' % url)
+
+    @OETestDepends(['dnf.DnfRepoTest.test_dnf_install'])
+    def test_dnf_reinstall(self):
+        self.dnf_with_repo('reinstall -y run-postinsts-dev')
+
+
diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index a53a3608bde..6e929469c4f 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -48,6 +48,7 @@ common_errors = [
     "stmmac_dvr_probe: warning: cannot get CSR clock",
     "error: couldn\'t mount because of unsupported optional features",
     "GPT: Use GNU Parted to correct GPT errors",
+    "Cannot set xattr user.Librepo.DownloadInProgress",
     ]
 
 video_related = [
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 532fbf82ebf..05b94c7b40e 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -102,14 +102,15 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
     @OETestDepends(['rpm.RpmInstallRemoveTest.test_rpm_remove'])
     def test_check_rpm_install_removal_log_file_size(self):
         """
-        Summary:     Check rpm install/removal log file size
-        Expected:    There should be some method to keep rpm log in a small size .
+        Summary:     Check that rpm writes into /var/log/messages
+        Expected:    There should be some RPM prefixed entries in the above file.
         Product:     BSPs
         Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
+        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
         db_files_cmd = 'ls /var/lib/rpm/__db.*'
-        get_log_size_cmd = "du /var/lib/rpm/log/log.* | awk '{print $1}'"
+        check_log_cmd = "grep RPM /var/log/messages | wc -l"
 
         # Make sure that some database files are under /var/lib/rpm as '__db.xxx'
         status, output = self.target.run(db_files_cmd)
@@ -129,13 +130,13 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
             msg = 'Failed to remove rpm-doc package. Reason: {}'.format(output)
             self.assertEqual(0, status, msg=msg)
 
-        # Get the size of log file
-        status, output = self.target.run(get_log_size_cmd)
+        # if using systemd this should ensure all entries are flushed to /var
+        status, output = self.target.run("journalctl --sync")
+        # Get the amount of entries in the log file
+        status, output = self.target.run(check_log_cmd)
         msg = 'Failed to get the final size of the log file.'
         self.assertEqual(0, status, msg=msg)
 
-        # Compare each log size
-        for log_file_size in output:
-            msg = ('Log file size is greater that expected (~10MB), '
-                    'found {} bytes'.format(log_file_size))
-            self.assertLessEqual(int(log_file_size), 11264, msg=msg)
+        # Check that there's enough of them
+        self.assertGreaterEqual(int(output), 80,
+                                   'Cound not find sufficient amount of rpm entries in /var/log/messages, found {} entries'.format(output))
diff --git a/meta/lib/oeqa/runtime/cases/smart.py b/meta/lib/oeqa/runtime/cases/smart.py
deleted file mode 100644
index 79bd9c8af7a..00000000000
--- a/meta/lib/oeqa/runtime/cases/smart.py
+++ /dev/null
@@ -1,196 +0,0 @@
-import os
-import re
-import subprocess
-from oeqa.utils.httpserver import HTTPService
-
-from oeqa.runtime.case import OERuntimeTestCase
-from oeqa.core.decorator.depends import OETestDepends
-from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
-from oeqa.runtime.decorator.package import OEHasPackage
-
-class SmartTest(OERuntimeTestCase):
-
-    def smart(self, command, expected = 0):
-        command = 'smart %s' % command
-        status, output = self.target.run(command, 1500)
-        message = os.linesep.join([command, output])
-        self.assertEqual(status, expected, message)
-        self.assertFalse('Cannot allocate memory' in output, message)
-        return output
-
-class SmartBasicTest(SmartTest):
-
-    @skipIfNotFeature('package-management',
-                      'Test requires package-management to be in IMAGE_FEATURES')
-    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
-                      'RPM is not the primary package manager')
-    @OEHasPackage(['smartpm'])
-    @OETestID(716)
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_smart_help(self):
-        self.smart('--help')
-
-    @OETestID(968)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_version(self):
-        self.smart('--version')
-
-    @OETestID(721)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_info(self):
-        self.smart('info python-smartpm')
-
-    @OETestID(421)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_query(self):
-        self.smart('query python-smartpm')
-
-    @OETestID(720)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_search(self):
-        self.smart('search python-smartpm')
-
-    @OETestID(722)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_stats(self):
-        self.smart('stats')
-
-class SmartRepoTest(SmartTest):
-
-    @classmethod
-    def setUpClass(cls):
-        cls.repolist = []
-        cls.repo_server = HTTPService(cls.tc.td['WORKDIR'],
-                                      cls.tc.target.server_ip)
-        cls.repo_server.start()
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.repo_server.stop()
-        for repo in cls.repolist:
-            cls.tc.target.run('smart channel -y --remove %s' % repo)
-
-    @OETestID(1143)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_channel(self):
-        self.smart('channel', 1)
-
-    @OETestID(719)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_channel_add(self):
-        image_pkgtype = self.tc.td['IMAGE_PKGTYPE']
-        deploy_url = 'http://%s:%s/%s' % (self.target.server_ip,
-                                          self.repo_server.port,
-                                          image_pkgtype)
-        pkgarchs = self.tc.td['PACKAGE_ARCHS'].replace("-","_").split()
-        archs = os.listdir(os.path.join(self.repo_server.root_dir,
-                                        image_pkgtype))
-        for arch in archs:
-            if arch in pkgarchs:
-                cmd = ('channel -y --add {a} type=rpm-md '
-                      'baseurl={u}/{a}'.format(a=arch, u=deploy_url))
-                self.smart(cmd)
-                self.repolist.append(arch)
-        self.smart('update')
-
-    @OETestID(969)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_channel_help(self):
-        self.smart('channel --help')
-
-    @OETestID(970)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_channel_list(self):
-        self.smart('channel --list')
-
-    @OETestID(971)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_channel_show(self):
-        self.smart('channel --show')
-
-    @OETestID(717)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_channel_rpmsys(self):
-        self.smart('channel --show rpmsys')
-        self.smart('channel --disable rpmsys')
-        self.smart('channel --enable rpmsys')
-
-    @OETestID(1144)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
-    def test_smart_install(self):
-        self.smart('remove -y psplash-default')
-        self.smart('install -y psplash-default')
-
-    @OETestID(728)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_install'])
-    def test_smart_install_dependency(self):
-        self.smart('remove -y psplash')
-        self.smart('install -y psplash-default')
-
-    @OETestID(723)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
-    def test_smart_install_from_disk(self):
-        self.smart('remove -y psplash-default')
-        self.smart('download psplash-default')
-        self.smart('install -y ./psplash-default*')
-
-    @OETestID(725)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
-    def test_smart_install_from_http(self):
-        output = self.smart('download --urls psplash-default')
-        url = re.search('(http://.*/psplash-default.*\.rpm)', output)
-        self.assertTrue(url, msg="Couln't find download url in %s" % output)
-        self.smart('remove -y psplash-default')
-        self.smart('install -y %s' % url.group(0))
-
-    @OETestID(729)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_install'])
-    def test_smart_reinstall(self):
-        self.smart('reinstall -y psplash-default')
-
-    @OETestID(727)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
-    def test_smart_remote_repo(self):
-        self.smart('update')
-        self.smart('install -y psplash')
-        self.smart('remove -y psplash')
-
-    @OETestID(726)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_local_dir(self):
-        self.target.run('mkdir /tmp/myrpmdir')
-        self.smart('channel --add myrpmdir type=rpm-dir path=/tmp/myrpmdir -y')
-        self.target.run('cd /tmp/myrpmdir')
-        self.smart('download psplash')
-        output = self.smart('channel --list')
-        for i in output.split("\n"):
-            if ("rpmsys" != str(i)) and ("myrpmdir" != str(i)):
-                self.smart('channel --disable '+str(i))
-        self.target.run('cd $HOME')
-        self.smart('install psplash')
-        for i in output.split("\n"):
-            if ("rpmsys" != str(i)) and ("myrpmdir" != str(i)):
-                self.smart('channel --enable '+str(i))
-        self.smart('channel --remove myrpmdir -y')
-        self.target.run("rm -rf /tmp/myrpmdir")
-
-    @OETestID(718)
-    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
-    def test_smart_add_rpmdir(self):
-        self.target.run('mkdir /tmp/myrpmdir')
-        self.smart('channel --add myrpmdir type=rpm-dir path=/tmp/myrpmdir -y')
-        self.smart('channel --disable myrpmdir -y')
-        output = self.smart('channel --show myrpmdir')
-        self.assertTrue("disabled = yes" in output, msg="Failed to disable rpm dir")
-        self.smart('channel --enable  myrpmdir -y')
-        output = self.smart('channel --show myrpmdir')
-        self.assertFalse("disabled = yes" in output, msg="Failed to enable rpm dir")
-        self.smart('channel --remove myrpmdir -y')
-        self.target.run("rm -rf /tmp/myrpmdir")
-
-    @OETestID(731)
-    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
-    def test_smart_remove_package(self):
-        self.smart('install -y psplash')
-        self.smart('remove -y psplash')
-- 
2.11.0


