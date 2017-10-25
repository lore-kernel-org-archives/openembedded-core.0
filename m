Return-Path: <vomegaz@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 05FA86069C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 07:32:51 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y9so10709533wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=41TNS+Dyw8hgqZv7c+Zy765D84ApObo59pfvA0SPsEM=;
	b=Ve1Bm3suC/DSs5hC72/xCpjHlxfTKy5C4TkuilhlhYeSRInu+td+wMTtTRnABiF97+
	GPkqgNJdGHSA8Lb5K187UG6jXwhCUqTLtAgWldGla9opNoRYOrQGM6T9ZcKga7iL6p5j
	MTueVJY7idm5bP8wc20F2Peo6plFbU1yIC4CACjYIGHydOuEH7LtRIYwtWD8I80JL9/t
	hSKmSEoMkijAQJHBk0zcRu5FUNvH7L6bhR995UxbMCw9jGV02G28vXrsfzR7lRaDSGNm
	MU0rjuQAsyH5ZqaDNBA/rp+W1D6+WzhLzVunXONqNZsYO0MYaBBXVYsxjreM0RfnvHE+
	srPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=41TNS+Dyw8hgqZv7c+Zy765D84ApObo59pfvA0SPsEM=;
	b=RaUv1HC6/BK+OCUxpFI4ImL87JxqpQb1TajmWJGubzcTAXZY/zpDO5LE1CquH8wmyP
	9HChyU0HWs/PMhEGDnleThuOQXfj3vnkW6Zp9nDIsomPOYtWf6Hd4pLS9ctIiHPpUr+y
	v5VKBMaNC4vRMo1XPMGOy/SHqmogpx71qwzDvWSzjjGwBrNX8wwnt5r6CP6Yv2Fj7azj
	i2t8DX1Guw/+29SiZLKZrIKl0SxAhGneV63dun8mrNAt15xX6fYv30lOq7WJXL4I0152
	YYhVprfut31aD76Sd7F2iqZ8VfxT4pV/fpVXRKEzeL73cecC3hyHvpmu6QRxCXvxiX3E
	NezQ==
X-Gm-Message-State: AMCzsaWdbUVi620HhDJJcsYZdcSfX4iWXECb91vyySbKOj4oQQVV0f2Y
	JM4jqw7FFO5XKmfIHkBQrBGsGnvu
X-Google-Smtp-Source: ABhQp+TwAUN9CbrQFsgtFLTaHdndSunq1fj6jTxW/bo9iHmtKM5oEQqFqnrXde4m83+ynU4LDO8ccQ==
X-Received: by 10.223.146.101 with SMTP id 92mr1055092wrj.21.1508916772363;
	Wed, 25 Oct 2017 00:32:52 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id h5sm1440519wrb.89.2017.10.25.00.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 00:32:51 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:32:47 +0200
Message-Id: <20171025073248.24161-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][PATCH 1/2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 07:32:52 -0000

- Bad image type replacement for aarch64
- Fix DTB path in fitimage.its
- Ignore fitImage type in do_bundle_initramfs task because the packaging is made by do_assemble_fitimage_initramfs
- the images for arm64 are not compressed the linux_comp variable must therefore be none

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass |  7 +++++--
 meta/classes/kernel-uboot.bbclass    | 11 ++++++++---
 meta/classes/kernel.bbclass          |  4 +++-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 179185b6b2..0789ba611f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,10 +7,13 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "mips":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "mips":
             replacementtype = "vmlinuz.bin"
-        elif d.getVar("UBOOT_ARCH") == "x86":
+        elif uarch == "x86":
             replacementtype = "bzImage"
+        elif uarch == "arm64":
+            replacementtype = "Image"
         else:
             replacementtype = "zImage"
 
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 87f02654fa..06d293039a 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,5 +1,5 @@
 uboot_prep_kimage() {
-	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
+	if [ -e arch/${ARCH}/boot/compressed/vmlinux ] ; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
@@ -11,8 +11,13 @@ uboot_prep_kimage() {
 		linux_comp="none"
 	else
 		vmlinux_path="vmlinux"
-		linux_suffix=".gz"
-		linux_comp="gzip"
+		if [ "${ARCH}" = "arm64" ] ; then
+			linux_suffix=""
+			linux_comp="none"
+		else
+			linux_suffix=".gz"
+			linux_comp="gzip"
+		fi
 	fi
 
 	[ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a3c2..7f8c8985f3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -208,7 +208,9 @@ do_bundle_initramfs () {
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
 		for type in ${KERNEL_IMAGETYPES} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			if [ "$type" = "fitImage" ] ; then
+				continue
+			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
 				mv -f $realpath $realpath.bak
-- 
2.13.6


