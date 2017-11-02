Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com
	(mailrelay3-3.pub.mailoutpod1-cph3.one.com [46.30.212.12])
	by mail.openembedded.org (Postfix) with ESMTP id 45DB4606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embexus.com; s=20140924;
	h=from:subject:date:message-id:to;
	bh=jYll8dKUWxMeudsnWkI4shSGVg4oT2FmoUDZVx2Pm0U=;
	b=L08/dn2d27lwvOclFbIhKDBRwVLxIvLYpZDa3JkVBOMlCD06ZnNOPaRb1l3CvxdB75pRVtmvkzbWw
	fQKBlEIRN880UlffH9fOpkLE33IZpgJuw/RFJH4knPiHeCOuwAtCaw/zY879uwgtt4Rt0zQJIaBR7d
	CG7pHA75OMEkZiFM=
X-HalOne-Cookie: f3bd02f567a1ec51d59e316dde505cf1f619ea8a
X-HalOne-ID: 3f348983-bfe5-11e7-a38a-d0431ea8bb03
Received: from embexus.fritz.box (unknown [77.178.7.250])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 3f348983-bfe5-11e7-a38a-d0431ea8bb03;
	Thu, 02 Nov 2017 15:48:19 +0000 (UTC)
From: Ayoub Zaki <ayoub.zaki@embexus.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Nov 2017 16:48:18 +0100
Message-Id: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2] kernel-fitimage: introduce FIT_HASH_ALG
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
X-List-Received-Date: Thu, 02 Nov 2017 15:48:19 -0000

sanitize fitImage hash algorithm selection with FIT_HASH_ALG
switch default hash algorithm from sha1 to sha256

Signed-off-by: Ayoub Zaki <ayoub.zaki@embexus.com>
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


