Return-Path: <Fupan.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD8F860030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 03:19:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7J3JT5g012601
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 20:19:29 -0700 (PDT)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 20:19:28 -0700
From: <fupan.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 11:18:02 +0800
Message-ID: <1408418282-113361-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [oe] [kernel.bbclass] [PATCH] let the multi-version kernel header files coexist on the target
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
X-List-Received-Date: Tue, 19 Aug 2014 03:19:28 -0000
Content-Type: text/plain

From: fupan li <fupan.li@windriver.com>

When do RCPL upgrading, we want to keep the different RCPL's kernel header files coexist, just
as the kernel image does.

Signed-off-by: fupan li <fupan.li@windriver.com>
---
 meta/classes/kernel.bbclass | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6d9e646..e6ed716 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -75,9 +75,11 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-# Define where the kernel headers are installed on the target as well as where
-# they are staged.
-KERNEL_SRC_PATH = "/usr/src/kernel"
+# Define where the kernel headers are staged.
+KERNEL_SRC_EXPORT_PATH = "/usr/src/kernel"
+#put the kernel headers in /usr/src/kernel-${@legitimize_package_name('${KERNEL_VERSION}')} to
+#let the different RCPL's kernel headers coexist.
+KERNEL_SRC_PATH = "/usr/src/kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
 
 KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
 
@@ -313,7 +315,7 @@ kernelscripts_sstate_postinst () {
 }
 
 sysroot_stage_all_append() {
-	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
+	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_EXPORT_PATH}
 }
 
 kernel_do_configure() {
@@ -386,6 +388,14 @@ pkg_postrm_kernel-image () {
 	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
+pkg_postinst_kernel-dev () {
+        update-alternatives --install ${KERNEL_SRC_EXPORT_PATH} kernel-path kernel-${@legitimize_package_name('${KERNEL_VERSION}')} ${KERNEL_PRIORITY} || true
+}
+
+pkg_postrm_kernel-dev () {
+        update-alternatives --remove kernel-path kernel-${@legitimize_package_name('${KERNEL_VERSION}')} || true
+}
+
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-- 
1.8.1.2


