Return-Path: <raltherr@google.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C71C471E50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 19:28:55 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id 204so25868133pge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 11:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=E3efkH9ZSbPd9eEEHKWmLl46YxYwYEnnYmNJr/e6lRk=;
	b=mk3KlljXXdzISWg/mFseQE/68SxhqlLFtRBiIEhw8YF8Curu3x8n9cN+X/4yEF7uYx
	nyp97VaGuK4YbdV+HkTj4P4ZIeMqHy+2UGHL/gUjbD/15xpAp2loyR4cKj0C/WDibk4f
	OMr1JPnxVXfXlkJjqjkfKNba7bKV9j/Khl5NhEqOZSTCUwW2ZEApxIaVVEEK07TFh7tq
	TqgFBn2jDKkefmOA+CHPGz9RRDvhLm2qDfezZuHkXXEHuRAD7TVeuU/0W7Da4vu5vwm1
	Zj+2zGwwsvxwzI6CMvq0hvt2LIws8zpASc9YM6gkeT2Ma+XZ6vBM1Aeafj4KIC1exm0P
	/3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=E3efkH9ZSbPd9eEEHKWmLl46YxYwYEnnYmNJr/e6lRk=;
	b=iUwtpPCcf6G0NBf05qtHWc5V0Joc1zXKlg08jcv0nMS9ILWs2LIvQjqLdpCGmMikzk
	jU1JTzCsbEUExa/+MUu1dBdyhccOUYjqojA1pbCbr69/kXbUAjSYwkKUcE/W77gN7IKg
	INeosRzCQXlv7qbsSKa3zpYTA5gONkpTUsuTtnL5ciMGlp9am9/hhfdn/KMh3ExsgkBN
	WosCB7mKScC0nhDyvZmQ9EctTtIwHOQZxI8GQvMYNZ9TEgqxgk4TQDDsgmoCXtP8Ao70
	hxhw16DYwQ4IZToTsgpt6Eo1uh/BJr880go68boMnQaspilZjM/H9vzFh0/k+6dtGGIk
	7Msg==
X-Gm-Message-State: AIkVDXJ2s+Qb06ab0E2WdOB+mH+WMuwxTCL1nG5YC9dcsJq03rgpbombfbtfotmUfHDHIXP4
X-Received: by 10.84.206.37 with SMTP id f34mr24115370ple.127.1484940535592;
	Fri, 20 Jan 2017 11:28:55 -0800 (PST)
Received: from raltherr-linux.svl.corp.google.com ([100.123.242.49])
	by smtp.gmail.com with ESMTPSA id
	r74sm18644288pfb.67.2017.01.20.11.28.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Jan 2017 11:28:55 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:28:53 -0800
Message-Id: <20170120192853.959-1-raltherr@google.com>
X-Mailer: git-send-email 2.11.0.483.g087da7b7c-goog
Subject: [PATCH] kernel-fitimage: Use compressed ramdisks in FIT images if available
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
X-List-Received-Date: Fri, 20 Jan 2017 19:28:56 -0000

kernel-fitimage:fitimage_assemble() was calling copy_initramfs from
kernel.bbclass which decompresses the initramfs cpio.  Assume that if
INITRAMFS_FSTYPES includes a compressed cpio, that is what it desired in
the FIT image.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 meta/classes/kernel-fitimage.bbclass | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index c15ded523c..1c3b4b7fb3 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -178,6 +178,7 @@ EOF
 fitimage_emit_section_ramdisk() {
 
 	ramdisk_csum="sha1"
+	ramdisk_ctype="none"
 	ramdisk_loadline=""
 	ramdisk_entryline=""
 
@@ -188,14 +189,32 @@ fitimage_emit_section_ramdisk() {
 		ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
 	fi
 
+	case $3 in
+		*.gz)
+			ramdisk_ctype="gzip"
+			;;
+		*.bz2)
+			ramdisk_ctype="bzip2"
+			;;
+		*.lzma)
+			ramdisk_ctype="lzma"
+			;;
+		*.lzo)
+			ramdisk_ctype="lzo"
+			;;
+		*.lz4)
+			ramdisk_ctype="lz4"
+			;;
+	esac
+
 	cat << EOF >> ${1}
                 ramdisk@${2} {
-                        description = "ramdisk image";
+                        description = "${INITRAMFS_IMAGE}";
                         data = /incbin/("${3}");
                         type = "ramdisk";
                         arch = "${UBOOT_ARCH}";
                         os = "linux";
-                        compression = "none";
+                        compression = "${ramdisk_ctype}";
                         ${ramdisk_loadline}
                         ${ramdisk_entryline}
                         hash@1 {
@@ -341,8 +360,15 @@ fitimage_assemble() {
 	# Step 4: Prepare a ramdisk section.
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
-		copy_initramfs
-		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
+		# Find and use the first initramfs image archive type we find
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.${img}"
+			echo "Using $initramfs_path"
+			if [ -e "${initramfs_path}" ]; then
+				fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" "${initramfs_path}"
+				break
+			fi
+		done
 	fi
 
 	fitimage_emit_section_maint ${1} sectend
-- 
2.11.0.483.g087da7b7c-goog


