Return-Path: <Fupan.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEE86B438
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 08:00:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J80dMb007835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 01:00:40 -0700 (PDT)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 01:00:39 -0700
From: <fupan.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 15:59:12 +0800
Message-ID: <1408435152-26287-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: make multi-version kernel headers coexist on the target
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
X-List-Received-Date: Tue, 19 Aug 2014 08:00:40 -0000
Content-Type: text/plain

From: fupan li <fupan.li@windriver.com>

Put the kernel headers in /usr/src/kernel-${@legitimize_package_name('${KERNEL_VERSION}')},
so that keep the multi-version kernel headers coexist, just as the kernel image does.

Signed-off-by: fupan li <fupan.li@windriver.com>
---
 meta/classes/kernel.bbclass | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6d9e646..9013960 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -75,9 +75,11 @@ EXTRA_OEMAKE = ""
 
 KERNEL_ALT_IMAGETYPE ??= ""
 
-# Define where the kernel headers are installed on the target as well as where
-# they are staged.
-KERNEL_SRC_PATH = "/usr/src/kernel"
+# Define where the kernel headers are staged.
+KERNEL_SRC_EXPORT_PATH = "/usr/src/kernel"
+# Put the kernel headers in /usr/src/kernel-${@legitimize_package_name('${KERNEL_VERSION}')} to
+# let multi-version kernel headers coexist.
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


