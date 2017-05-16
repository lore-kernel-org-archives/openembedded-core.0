Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF65177E26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711797"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:00 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:35 +0300
Message-Id: <b70cd990555c6f8aab642db86fda5cbc11d5dba9.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 05/20] devtools/images: add python-pgo-image
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
X-List-Received-Date: Tue, 16 May 2017 13:19:02 -0000

This is a special image for profiling Python in order to utilize
profile-guided-optimization. Profile data can be obtained by by running
bitbake python-pgo-image -c profile. It will be located in the directory
pointed by ${PYTHON_PROFILE_DIR}. The profile task that is run can be
altered by specifying ${PYTHON_PROFILE_TASK}.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
new file mode 100644
index 0000000000..af9da20338
--- /dev/null
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Minimal image for doing Python profiling (for PGO)"
+
+IMAGE_FEATURES += "ssh-server-dropbear"
+IMAGE_INSTALL = "packagegroup-core-boot python-profile-opt python-profile-opt-tests"
+
+LICENSE = "MIT"
+
+inherit core-image
+
+PYTHON_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python/pgo-data"
+PYTHON_PROFILE_TASK ?= "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing test_subprocess"
+
+# We need these because we're utilizing the runtime test helpers from oeqa
+TEST_TARGET ?= "qemu"
+TEST_QEMUBOOT_TIMEOUT ?= "1000"
+TEST_LOG_DIR ?= "${WORKDIR}/qemulogs"
+FIND_ROOTFS = "1"
+
+python do_profile() {
+    from oeqa.targetcontrol import get_target_controller
+    from oe.utils import getstatusoutput
+
+    target = get_target_controller(d)
+    target.deploy()
+    try:
+        # Boot target
+        bootparams = None
+        if d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'systemd':
+            bootparams = 'systemd.log_level=debug systemd.log_target=console'
+        target.start(extra_bootparams=bootparams)
+
+        # Run profile task
+        profile_cmd = 'LD_LIBRARY_PATH=/opt/lib /opt/bin/python %s' % d.getVar("PYTHON_PROFILE_TASK", True)
+        ret, output = target.run(profile_cmd, timeout=7200)
+        if ret:
+            bb.fatal("Failed to run profile task on target: %s" % output)
+        ret, output = target.run('tar czf pgo-data.tgz -C /home/root/python-pgo-profiles/ .')
+        if ret:
+            bb.fatal("Failed to archive profile data on target: %s" % output)
+
+        # Retrieve and unpack profile data
+        profile_dir = d.getVar("PYTHON_PROFILE_DIR", True)
+        target.copy_from('/home/root/pgo-data.tgz', profile_dir)
+
+        profile_tarball = os.path.join(profile_dir, 'pgo-data.tgz')
+        ret, output = getstatusoutput('tar xf %s -C %s' % (profile_tarball, profile_dir))
+        os.unlink(profile_tarball)
+        if ret:
+            bb.fatal("Failed to unpack python profile data: %s" % output)
+    finally:
+        target.stop()
+
+    # Exclude files causing problems in cross-profiling
+    excludes = [os.path.join(profile_dir, 'Modules', 'posixmodule.gcda')]
+    for path in excludes:
+        if os.path.exists(path):
+            os.unlink(path)
+}
+
+addtask profile after do_build
+do_profile[depends] += "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+do_profile[cleandirs] = "${PYTHON_PROFILE_DIR}"
-- 
2.12.0


