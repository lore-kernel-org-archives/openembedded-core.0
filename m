Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 366D5748A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 03:27:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4M3R8Gl018950
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 20:27:24 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 May 2018 20:26:46 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2018 20:26:46 -0700
Message-ID: <20180522032646.33000-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] Turbostat: add a necessary recipe to meta-oe
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
X-List-Received-Date: Tue, 22 May 2018 03:27:34 -0000
Content-Type: text/plain

This is an efficient tool to reflect the status of processors.
Turbostat reports processor topology, frequency, idle power-state
statistics, temperature and power on processors.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat.bb | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/turbostat/turbostat.bb

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/recipes-kernel/turbostat/turbostat.bb
new file mode 100644
index 000000000..f4614b406
--- /dev/null
+++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
@@ -0,0 +1,53 @@
+SUMMARY = "Report processor frequency and idle statistics"
+DESCRIPTION = "turbostat  reports processor topology, frequency, idle \
+power-state statistics, temperature and power on modern X86 processors. \
+Either command is forked and statistics are printed upon its completion, \
+or statistics are printed periodically."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit kernelsrc
+PROVIDES = "virtual/turbostat"
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+B = "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OEMAKE = '\
+    -C ${S}/tools/power/x86/turbostat \
+    O=${B} \
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+'
+
+EXTRA_OEMAKE += "\
+    'prefix=${prefix}' \
+    'bindir=${bindir}' \
+    'sharedir=${datadir}' \
+    'sysconfdir=${sysconfdir}' \
+    'sharedir=${@os.path.relpath(datadir, prefix)}' \
+    'mandir=${@os.path.relpath(mandir, prefix)}' \
+    'infodir=${@os.path.relpath(infodir, prefix)}' \
+"
+
+do_compile() {
+	# Linux kernel build system is expected to do the right thing
+	unset CFLAGS
+	oe_runmake turbostat
+}
+
+do_install() {
+	# Linux kernel build system is expected to do the right thing
+	unset CFLAGS
+	oe_runmake DESTDIR=${D} install
+}
+
+python do_package_prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+}
+
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.11.0


