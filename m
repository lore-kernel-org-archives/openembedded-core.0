Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A71F781F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423541"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:13 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:06:55 +0200
Message-Id: <a877c994357151036438f4d676dc9c230e695986.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 11/16] devtools/images: add python-pgo-image
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:23 -0000

This is a special image for profiling Python 3.x in order to utilize
profile-guided-optimization. Profile data can be obtained by by running
bitbake python-pgo-image -c profile. Profile data will be copied into a
directory pointed by PYTHON3_PROFILE_DIR on the host system. The profile
task may be specified with PYTHON3_PROFILE_TASK.

The default profile task is pybench, although an example for using
test.regrtest is included in the recipe.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 92 ++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
new file mode 100644
index 0000000000..0dbe8fd052
--- /dev/null
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -0,0 +1,92 @@
+SUMMARY = "Minimal image for doing Python profiling (for PGO)"
+
+IMAGE_FEATURES += "ssh-server-dropbear"
+IMAGE_INSTALL = "packagegroup-core-boot"
+IMAGE_INSTALL += "python3-profile-opt python3-profile-opt-tests python3-profile-opt-tools"
+
+LICENSE = "MIT"
+
+inherit core-image
+
+PROFILE_DATA_WORKDIR = "${WORKDIR}/profile-data"
+
+PYTHON3_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python3/pgo-data"
+PYTHON3_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing_fork test_multiprocessing_forkserver test_multiprocessing_main_handling test_multiprocessing_spawn test_subprocess"
+# Exclude tests that are failing on qemux86
+PYTHON3_PROFILE_TASK_DEFAULT += "test_builtin test_cmath test_concurrent_futures test_difflib test_distutils test_float test_format test_math test_optparse test_shutil test_statistics test_types test_unicode"
+# Exclude tests that are taking very long on qemux86
+PYTHON3_PROFILE_TASK_DEFAULT += "test_lib2to3 test_buffer test_pickle test_io test_threading test_asyncio test_urllib2_localnet test_itertools test_tuple test_trace test_tarfile test_unicodedata test_decimal test_long test_zipfile test_deque test_descr test_email test_venv test_bytes test_compileall test_ast test_multibytecodec"
+
+# Change default profile target to pybench. Running test.regrtest takes
+# ridiculously long, i.e. around 4 hours in qemux86 on i7-3770K desktop
+# machine. Pybench "only" takes around 55 minutes.
+PYTHON3_PROFILE_TASK_DEFAULT = "${docdir}/python3-profile-opt/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"
+
+PYTHON3_PROFILE_TASK ?= "${PYTHON3_PROFILE_TASK_DEFAULT}"
+
+# We need these because we're utilizing the runtime test helpers from oeqa
+TEST_TARGET ?= "qemu"
+TEST_QEMUBOOT_TIMEOUT ?= "1000"
+TEST_LOG_DIR ?= "${WORKDIR}/qemulogs"
+FIND_ROOTFS = "1"
+
+def run_profile(d, profile_bin, profile_task, tgt_in_dir, host_out_dir):
+    import logging
+    from oeqa.targetcontrol import get_target_controller
+    from oeqa.utils import make_logger_bitbake_compatible
+    from oe.utils import getstatusoutput
+
+    logger = make_logger_bitbake_compatible(logging.getLogger("TargetControl"))
+    target = get_target_controller(d, logger)
+    target.deploy()
+    try:
+        # Boot target
+        bootparams = None
+        if d.getVar('VIRTUAL-RUNTIME_init_manager', True) == 'systemd':
+            bootparams = 'systemd.log_level=debug systemd.log_target=console'
+        target.start(extra_bootparams=bootparams)
+
+        # Run profile task
+        ret, output = target.run(profile_bin + ' ' + profile_task, timeout=7200)
+        if ret:
+            bb.fatal("Failed to run profile task on target: %s" % output)
+        ret, output = target.run('tar czf pgo-data.tgz -C %s .' % tgt_in_dir)
+        if ret:
+            bb.fatal("Failed to archive profile data on target: %s" % output)
+
+        # Retrieve and unpack profile data
+        target.copy_from('/home/root/pgo-data.tgz', host_out_dir)
+
+        profile_tarball = os.path.join(host_out_dir, 'pgo-data.tgz')
+        ret, output = getstatusoutput('tar xf %s -C %s' % (profile_tarball, host_out_dir))
+        os.unlink(profile_tarball)
+        if ret:
+            bb.fatal("Failed to unpack python profile data: %s" % output)
+    finally:
+        target.stop()
+
+
+# Profile task for Python 3.x
+python do_profile() {
+    run_profile(d, 'python3',
+                d.getVar('PYTHON3_PROFILE_TASK', True),
+                '/home/root/python3-pgo-profiles/',
+                os.path.join(d.getVar("PROFILE_DATA_WORKDIR", True), 'python3'))
+}
+
+addtask profile after do_build
+
+# Strictly, these are dependencies of the do_profile task, but, we cannot put
+# them in task depends because this would pull all possible build deps into the
+# recipe sysroot causing conflicts (python3 and python3-profile-opt)
+DEPENDS += "qemu-native qemu-helper-native openssh-native iproute2-native"
+do_profile[cleandirs] = "${PROFILE_DATA_WORKDIR}/python3"
+
+python do_profile_setscene () {
+    sstate_setscene(d)
+}
+
+SSTATETASKS += "do_profile"
+do_profile[sstate-inputdirs] = "${PROFILE_DATA_WORKDIR}/python3"
+do_profile[sstate-outputdirs] = "${PYTHON3_PROFILE_DIR}"
+addtask do_profile_setscene
-- 
2.13.6


