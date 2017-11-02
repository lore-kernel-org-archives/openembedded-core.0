Return-Path: <ayoub.zaki@embexus.com>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 02 Nov 2017 13:36:22 UTC
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com
	(mailrelay3-3.pub.mailoutpod1-cph3.one.com [46.30.212.12])
	by mail.openembedded.org (Postfix) with ESMTP id 7EFCD6079E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embexus.com; s=20140924;
	h=from:subject:date:message-id:to;
	bh=4OajRKQrN/043KcHNNZ6KJjrRe6+3xCWe0DeebsPcJM=;
	b=PXU/UoRnCtklCZY1WpWg6AvFtCOhms2vT+xhXORrKpTYvQ1dbmId7Zhfy2Eh/LlrT2tm+U5xfW5E/
	mPPa3Viap6n8+FTkqxQSG9asnF722zmyfI0qIib4E1Lh5nxLb9o0X4cMlG4dEfyvkDOcVgHKSpw2+5
	FrJQEPQvHQlb5pZE=
X-HalOne-Cookie: 4d64d5a96cfbfbf6eee7ae3d43c8c0eaa45d6358
X-HalOne-ID: 9256672f-bfd0-11e7-a38a-d0431ea8bb03
Received: from embexus.fritz.box (unknown [77.178.7.250])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 9256672f-bfd0-11e7-a38a-d0431ea8bb03;
	Thu, 02 Nov 2017 13:20:19 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Nov 2017 14:20:16 +0100
Message-Id: <1509628816-832-1-git-send-email-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Thu, 02 Nov 2017 13:36:23 -0000

sanitize fitImage hash algorithm selection with FIT_HASH_ALG
switch default hash algorithm from sha1 to sha256
---
 meta/classes/kernel-fitimage.bbclass | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b..3cc3a33 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -36,6 +36,9 @@ python __anonymous () {
 # Options for the device tree compiler passed to mkimage '-D' feature:
 UBOOT_MKIMAGE_DTCOPTS ??= ""
 
+# fitImage Hash Algo
+FIT_HASH_ALG ?= "sha256"
+
 #
 # Emit the fitImage ITS header
 #
@@ -95,7 +98,7 @@ EOF
 # $4 ... Compression type
 fitimage_emit_section_kernel() {
 
-	kernel_csum="sha1"
+	kernel_csum="${FIT_HASH_ALG}"
 
 	ENTRYPOINT=${UBOOT_ENTRYPOINT}
 	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
@@ -128,7 +131,7 @@ EOF
 # $3 ... Path to DTB image
 fitimage_emit_section_dtb() {
 
-	dtb_csum="sha1"
+	dtb_csum="${FIT_HASH_ALG}"
 
 	cat << EOF >> ${1}
                 fdt@${2} {
@@ -152,7 +155,7 @@ EOF
 # $3 ... Path to setup image
 fitimage_emit_section_setup() {
 
-	setup_csum="sha1"
+	setup_csum="${FIT_HASH_ALG}"
 
 	cat << EOF >> ${1}
                 setup@${2} {
@@ -179,7 +182,7 @@ EOF
 # $3 ... Path to ramdisk image
 fitimage_emit_section_ramdisk() {
 
-	ramdisk_csum="sha1"
+	ramdisk_csum="${FIT_HASH_ALG}"
 	ramdisk_ctype="none"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
@@ -237,7 +240,7 @@ EOF
 # $6 ... default flag
 fitimage_emit_section_config() {
 
-	conf_csum="sha1"
+	conf_csum="${FIT_HASH_ALG}"
 	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
-- 
2.7.4


