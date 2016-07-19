Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 46FCE60290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 14:57:52 +0000 (UTC)
Received: from nbhjo (unknown [8.36.234.10])
	by msfrf2624.sfr.fr (SMTP Server) with ESMTP id 5323A1C016007
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 16:57:52 +0200 (CEST)
Received: from nbhjo (unknown [8.36.234.10])	(using TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2624.sfr.fr (SMTP Server) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 16:57:50 +0200 (CEST)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
References: <1464681309-34628-1-git-send-email-herve.jourdain@neuf.fr>
	<1464681309-34628-2-git-send-email-herve.jourdain@neuf.fr>
In-Reply-To: <1464681309-34628-2-git-send-email-herve.jourdain@neuf.fr>
Date: Tue, 19 Jul 2016 16:57:48 +0200
Message-ID: <005d01d1e1cd$ec5a6f30$c50f4d90$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJ+nbadoJeL2J+HypR5EDgUxXo5/wGOJIFGnrnuwkA=
X-sfr-mailing: LEGIT
Subject: Re: [PATCH v3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Tue, 19 Jul 2016 14:57:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Ping...
This is needed for support of "dynamic" device tree overlays, with
extensions .dtbo (instead of xxx-overlay.dtb), which are used in RaspberryPi
kernel since 4.4.6.

-----Original Message-----
From: Herve Jourdain [mailto:herve.jourdain@neuf.fr] 
Sent: mardi 31 mai 2016 09:55
To: openembedded-core@lists.openembedded.org
Cc: Herve Jourdain <herve.jourdain@neuf.fr>
Subject: [OE-core][PATCH v3] linux-dtb.inc: Support for .dtbo files for dtb
overlays

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
b/meta/recipes-kernel/linux/linux-dtb.inc
index 74f5ef8..8528d64 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -33,12 +33,13 @@ do_compile_append() {
 do_install_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
-		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_EXT=${DTB##*.}
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-			install -m 0644 ${DTB_PATH}
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+			install -m 0644 ${DTB_PATH}
${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
 		done
 	done
 }
@@ -46,7 +47,8 @@ do_install_append() {
 do_deploy_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
-		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_EXT=${DTB##*.}
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
@@ -54,8 +56,8 @@ do_deploy_append() {
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${DTB_PATH}
${DEPLOYDIR}/${DTB_NAME}.dtb
-			ln -sf ${DTB_NAME}.dtb
${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
+			install -m 0644 ${DTB_PATH}
${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
+			ln -sf ${DTB_NAME}.${DTB_EXT}
${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
 		done
 	done
 }
@@ -65,9 +67,10 @@ pkg_postinst_kernel-devicetree () {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
$1}'`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --install
/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+			update-alternatives --install
/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT}
/boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
@@ -77,9 +80,10 @@ pkg_postrm_kernel-devicetree () {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
$1}'`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
"s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --remove ${DTB_BASE_NAME}.dtb
/boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+			update-alternatives --remove
${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
${KERNEL_PRIORITY} || true
 		done
 	done
 }
-- 
2.7.4


