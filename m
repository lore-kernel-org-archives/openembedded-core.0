Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1339A78A2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 07:42:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w667g71N002832
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Jul 2018 00:42:07 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 6 Jul 2018 00:42:07 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <bruce.ashfield@gmail.com>
Date: Fri, 6 Jul 2018 15:51:58 +0800
Message-ID: <2756919e455edbd10cabd14ed1cb788cb501c7a0.1530863459.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530863459.git.dengke.du@windriver.com>
References: <cover.1530863459.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] kernel-selftest: add it
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
X-List-Received-Date: Fri, 06 Jul 2018 07:42:07 -0000
Content-Type: text/plain

The framework for kernel-selftest, this framework contains many aspect,
such as bpf, we should enable bpf kernel feature, this enable bpf syscall.

How to test?
    On target, enter directory: /opt/kselftest/bpf/, run "./test_align 0 11"
this command test all the bpf align testcases.

Results:
    Test   0: mov ... PASS
    Test   1: shift ... PASS
    Test   2: addsub ... PASS
    Test   3: mul ... PASS
    Test   4: unknown shift ... PASS
    Test   5: unknown mul ... PASS
    Test   6: packet const offset ... PASS
    Test   7: packet variable offset ... PASS
    Test   8: packet variable offset 2 ... PASS
    Test   9: dubious pointer arithmetic ... PASS
    Test  10: variable subtraction ... PASS
    Test  11: pointer variable subtraction ... PASS
    Results: 12 pass 0 fail

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../kernel-selftest/kernel-selftest.bb             | 94 ++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc          |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-kernel/kernel-selftest/kernel-selftest.bb

diff --git a/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
new file mode 100644
index 0000000..c976e7b
--- /dev/null
+++ b/meta/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -0,0 +1,94 @@
+SUMMARY = "Kernel selftest for Linux"
+DESCRIPTION = "Kernel selftest for Linux"
+LICENSE = "GPLv2"
+
+DEPENDS = " \
+    elfutils \
+    libcap \
+    libcap-ng \
+    fuse \
+    util-linux \
+    rsync-native \
+"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+inherit linux-kernel-base kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+inherit kernelsrc
+
+S = "${WORKDIR}/${BP}"
+
+# The LDFLAGS is required or some old kernels fails due missing
+# symbols and this is preferred than requiring patches to every old
+# supported kernel.
+LDFLAGS="-ldl -lutil"
+
+EXTRA_OEMAKE = '\
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+    LD="${LD}" \
+    EXTRA_CFLAGS="-ldw" \
+    ${PACKAGECONFIG_CONFARGS} \
+'
+
+EXTRA_OEMAKE += "\
+    'DESTDIR=${D}' \
+    'prefix=${prefix}' \
+    'bindir=${bindir}' \
+    'sharedir=${datadir}' \
+    'sysconfdir=${sysconfdir}' \
+    'sharedir=${@os.path.relpath(datadir, prefix)}' \
+    'mandir=${@os.path.relpath(mandir, prefix)}' \
+    'infodir=${@os.path.relpath(infodir, prefix)}' \
+"
+
+KERNEL_SELFTEST_SRC ?= "Makefile \
+             include \
+             tools \
+"
+
+# Add bpf selftest now, other can be added later.
+do_compile () {
+	# Linux kernel build system is expected to do the right thing
+	unset CFLAGS
+	oe_runmake -C ${S}/tools/testing/selftests/bpf
+}
+
+# On target, enter /opt/kselftest/bpf directory, run "./test_align 0 11"
+# The test_align testcase test the bpf instruction set, the testcase defined here:
+# https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/tree/tools/testing/selftests/bpf/test_align.c#n47
+do_install () {
+	# Linux kernel build system is expected to do the right thing
+	unset CFLAGS
+	mkdir -p ${D}/opt/kselftest/bpf
+	install -m 0755 ${B}/tools/testing/selftests/bpf/test_align ${D}/opt/kselftest/bpf/
+}
+
+do_configure[prefuncs] += "copy_perf_source_from_kernel remove_clang_related"
+python copy_perf_source_from_kernel() {
+    sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
+    src_dir = d.getVar("STAGING_KERNEL_DIR")
+    dest_dir = d.getVar("S")
+    bb.utils.mkdirhier(dest_dir)
+    for s in sources:
+        src = oe.path.join(src_dir, s)
+        dest = oe.path.join(dest_dir, s)
+        if os.path.isdir(src):
+            oe.path.copytree(src, dest)
+        else:
+            bb.utils.copyfile(src, dest)
+}
+
+remove_clang_related() {
+	sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+INHIBIT_PACKAGE_DEBUG_SPLIT="1"
+FILES_${PN} += "/opt/kselftest/bpf/*"
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 1ebfb60..362d6d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -72,3 +72,4 @@ addtask kernel_configcheck after do_configure before do_compile
 
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES_append_qemuall=" features/kernel-sample/kernel-sample.scc"
+KERNEL_FEATURES_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'features/bpf/bpf.scc', '', d)}"
-- 
2.7.4


