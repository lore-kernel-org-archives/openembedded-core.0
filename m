Return-Path: <hs@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B40077FC9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 04:48:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 46ZLnv2g4Mz1rG87;
	Fri, 20 Sep 2019 06:48:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 46ZLnv2S5bz1qqkJ;
	Fri, 20 Sep 2019 06:48:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id iVTl4bAEigNc; Fri, 20 Sep 2019 06:48:34 +0200 (CEST)
X-Auth-Info: 6+fJQJy/13weFa0Xv9MHbs9LyWPzZHZr0qJ9lS2LMaw=
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
	[87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 20 Sep 2019 06:48:34 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail-internal.denx.de (Postfix) with ESMTP id 5824818531E;
	Fri, 20 Sep 2019 06:48:27 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
	id 400C41A0093; Fri, 20 Sep 2019 06:48:27 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 06:48:26 +0200
Message-Id: <20190920044826.15452-1-hs@denx.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Julius Werner <jwerner@chromium.org>
Subject: [PATCH v2] kernel.fitimage.bbclass: remove ramdisk_ctype
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
X-List-Received-Date: Fri, 20 Sep 2019 04:48:35 -0000
Content-Transfer-Encoding: 8bit

set in the ramdisk node the compression property
always to "none", as U-Boot nowadays since commit:

b1307f884a91 ("fit: Support compression for non-kernel components (e.g. FDT)")

decompress non kernel components. Setting compression
to the used comression algorithm now, will end in
fail of your kernel boot with the ramdisk.

This issue is fixed since commit:

bddd98573465 ("fit: Do not automatically decompress ramdisk images")

which now prints a warning in U-Boot, instead of decompressing
the ramdisk, but we should setup compression property correct.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

Changes in v2:
- resend patch to  openembedded-core@lists.openembedded.org instead
  to Yocto Project <yocto@yoctoproject.org> as Ross suggested. No
  changes in code.

 meta/classes/kernel-fitimage.bbclass | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index b51882dce4..1bcb09c598 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -207,7 +207,6 @@ EOF
 fitimage_emit_section_ramdisk() {
 
 	ramdisk_csum="${FIT_HASH_ALG}"
-	ramdisk_ctype="none"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
 
@@ -218,24 +217,6 @@ fitimage_emit_section_ramdisk() {
 		ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
 	fi
 
-	case $3 in
-		*.gz)
-			ramdisk_ctype="gzip"
-			;;
-		*.bz2)
-			ramdisk_ctype="bzip2"
-			;;
-		*.lzma)
-			ramdisk_ctype="lzma"
-			;;
-		*.lzo)
-			ramdisk_ctype="lzo"
-			;;
-		*.lz4)
-			ramdisk_ctype="lz4"
-			;;
-	esac
-
 	cat << EOF >> ${1}
                 ramdisk@${2} {
                         description = "${INITRAMFS_IMAGE}";
@@ -243,7 +224,7 @@ fitimage_emit_section_ramdisk() {
                         type = "ramdisk";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "${ramdisk_ctype}";
+                        compression = "none";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
                         hash@1 {
-- 
2.21.0


