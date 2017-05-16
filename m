Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 81A4577E6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 16 May 2017 06:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711908"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:11 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:44 +0300
Message-Id: <bbfff6ae606e93526b5101bcf71ac48ee2792856.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 14/20] python-pgo-image: profiling for python3
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
X-List-Received-Date: Tue, 16 May 2017 13:19:10 -0000

Add a new 'do_profile3' task for python-pgo-image that runs profiling
task for python3 and retrieves the profile data, similarly to
'do_profile' for python2. Profile data will be copied into a directory
pointed by PYTHON3_PROFILE_DIR on the host system. The profile task may
be specified with PYTHON3_PROFILE_TASK.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 57 +++++++++++++++++++-----
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index 05252a1a46..285e403d32 100644
--- a/meta/recipes-devtools/images/python-pgo-image.bb
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -3,6 +3,7 @@ SUMMARY = "Minimal image for doing Python profiling (for PGO)"
 IMAGE_FEATURES += "ssh-server-dropbear"
 IMAGE_INSTALL = "packagegroup-core-boot"
 IMAGE_INSTALL += "python-profile-opt python-profile-opt-tests python-profile-opt-tools"
+IMAGE_INSTALL += "python-profile-opt3 python-profile-opt3-tests"
 
 LICENSE = "MIT"
 
@@ -20,13 +21,18 @@ PROFILE_DATA_WORKDIR = "${WORKDIR}/profile-data"
 PYTHON_PROFILE_TASK_DEFAULT = "/opt/share/doc/python-profile-opt/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"
 PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
+PYTHON3_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python3/pgo-data"
+PYTHON3_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing_fork test_multiprocessing_forkserver test_multiprocessing_main_handling test_multiprocessing_spawn test_subprocess"
+
+PYTHON3_PROFILE_TASK ?= "${PYTHON3_PROFILE_TASK_DEFAULT}"
+
 # We need these because we're utilizing the runtime test helpers from oeqa
 TEST_TARGET ?= "qemu"
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_LOG_DIR ?= "${WORKDIR}/qemulogs"
 FIND_ROOTFS = "1"
 
-python do_profile() {
+def run_profile(d, profile_bin, profile_task, tgt_in_dir, host_out_dir):
     from oeqa.targetcontrol import get_target_controller
     from oe.utils import getstatusoutput
 
@@ -40,28 +46,34 @@ python do_profile() {
         target.start(extra_bootparams=bootparams)
 
         # Run profile task
-        profile_cmd = 'LD_LIBRARY_PATH=/opt/lib /opt/bin/python %s' % d.getVar("PYTHON_PROFILE_TASK", True)
-        ret, output = target.run(profile_cmd, timeout=7200)
+        ret, output = target.run(profile_bin + ' ' + profile_task, timeout=7200)
         if ret:
             bb.fatal("Failed to run profile task on target: %s" % output)
-        ret, output = target.run('tar czf pgo-data.tgz -C /home/root/python-pgo-profiles/ .')
+        ret, output = target.run('tar czf pgo-data.tgz -C %s .' % tgt_in_dir)
         if ret:
             bb.fatal("Failed to archive profile data on target: %s" % output)
 
         # Retrieve and unpack profile data
-        profile_dir = d.getVar("PROFILE_DATA_WORKDIR", True)
-        target.copy_from('/home/root/pgo-data.tgz', profile_dir)
+        target.copy_from('/home/root/pgo-data.tgz', host_out_dir)
 
-        profile_tarball = os.path.join(profile_dir, 'pgo-data.tgz')
-        ret, output = getstatusoutput('tar xf %s -C %s' % (profile_tarball, profile_dir))
+        profile_tarball = os.path.join(host_out_dir, 'pgo-data.tgz')
+        ret, output = getstatusoutput('tar xf %s -C %s' % (profile_tarball, host_out_dir))
         os.unlink(profile_tarball)
         if ret:
             bb.fatal("Failed to unpack python profile data: %s" % output)
     finally:
         target.stop()
 
+
+# Profile task for Python2
+python do_profile() {
+    outdir = os.path.join(d.getVar("PROFILE_DATA_WORKDIR", True), 'python')
+    run_profile(d, 'LD_LIBRARY_PATH=/opt/lib /opt/bin/python',
+                d.getVar('PYTHON_PROFILE_TASK', True),
+                '/home/root/python-pgo-profiles/',
+                outdir)
     # Exclude files causing problems in cross-profiling
-    excludes = [os.path.join(profile_dir, 'Modules', 'posixmodule.gcda')]
+    excludes = [os.path.join(outdir, 'Modules', 'posixmodule.gcda')]
     for path in excludes:
         if os.path.exists(path):
             os.unlink(path)
@@ -69,14 +81,35 @@ python do_profile() {
 
 addtask profile after do_build
 do_profile[depends] += "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
-do_profile[cleandirs] = "${PROFILE_DATA_WORKDIR}"
-
+do_profile[cleandirs] = "${PROFILE_DATA_WORKDIR}/python"
 
 python do_profile_setscene () {
     sstate_setscene(d)
 }
 
 SSTATETASKS += "do_profile"
-do_profile[sstate-inputdirs] = "${PROFILE_DATA_WORKDIR}"
+do_profile[sstate-inputdirs] = "${PROFILE_DATA_WORKDIR}/python"
 do_profile[sstate-outputdirs] = "${PYTHON_PROFILE_DIR}"
 addtask do_profile_setscene
+
+
+# Profile task for Python3
+python do_profile3() {
+    run_profile(d, 'LD_LIBRARY_PATH=/opt/lib /opt/bin/python3',
+                d.getVar('PYTHON3_PROFILE_TASK', True),
+                '/home/root/python3-pgo-profiles/',
+                os.path.join(d.getVar("PROFILE_DATA_WORKDIR", True), 'python3'))
+}
+
+addtask profile3 after do_build
+do_profile3[depends] += "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+do_profile3[cleandirs] = "${PROFILE_DATA_WORKDIR}/python3"
+
+python do_profile3_setscene () {
+    sstate_setscene(d)
+}
+
+SSTATETASKS += "do_profile3"
+do_profile3[sstate-inputdirs] = "${PROFILE_DATA_WORKDIR}/python3"
+do_profile3[sstate-outputdirs] = "${PYTHON3_PROFILE_DIR}"
+addtask do_profile3_setscene
-- 
2.12.0


