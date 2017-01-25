Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CE7D8731C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:41:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 04:41:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="35260418"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2017 04:41:08 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 14:40:56 +0200
Message-Id: <20170125124101.29425-6-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
References: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 05/10] devtools/images: add python-pgo-image
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
X-List-Received-Date: Wed, 25 Jan 2017 12:41:09 -0000

This is a special image for profiling Python in order to utilize
profile-guided-optimization. Profile data can be obtained by by running
bitbake python-pgo-image -c profile. It will be located in the directory
pointed by ${PYTHON_PROFILE_DIR}. The profile task that is run can be
altered by specifying ${PYTHON_PROFILE_TASK}.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
new file mode 100644
index 0000000..1aabd56
--- /dev/null
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -0,0 +1,55 @@
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
+}
+
+addtask profile after do_build
+do_profile[depends] += "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot"
+do_profile[cleandirs] = "${PYTHON_PROFILE_DIR}"
-- 
2.10.2


