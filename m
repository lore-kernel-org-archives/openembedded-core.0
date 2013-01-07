Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsArH-0003d6-9B
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:27:13 +0100
Received: from mail-la0-f71.google.com ([209.85.215.71])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 03:12:00 -0800
Received: by mail-la0-f71.google.com with SMTP id fn20so8268649lab.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=CQScIug1eQG2Eo47UUtkffDklA/AjUCgek6D86iqXzo=;
	b=E7CXASAmP3wP2CkkMvJsfD4rASeCvkKOd5YLKkynF/MfRXU88tOF1LlKeSCuykVHCg
	32UL9oQ2zHQNjgpmmfRIwvEzFGvL+HSx9hCkAr8PmaykuvPk3EErOBFxD/gQCzGzkB9W
	NgbufXbz2gRMdC/H9k0jp6a/+0RcU2snW+LDcNlmDuPAEGtuUQwwkqeqijxtZi/r0yWc
	ogNNUt0taEu/+TynZLayo6qFlJg0Xh6lFYjdh4WdDHNCmji99ZsvIUXVvm/x+PcJoWNf
	c5DBWXHRQKeRwTSyu265MT3QpBZHEPpYAr7RIpP9LTsoo/sAiJJgK5q/Z35LTuLfNhJN
	b1Eg==
X-Received: by 10.180.107.130 with SMTP id hc2mr8549539wib.12.1357557117932;
	Mon, 07 Jan 2013 03:11:57 -0800 (PST)
X-Received: by 10.180.107.130 with SMTP id hc2mr8549521wib.12.1357557117810;
	Mon, 07 Jan 2013 03:11:57 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm12993779wia.10.2013.01.07.03.11.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:11:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:09:56 +0000
Message-Id: <1357557002-22183-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
References: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkmMAeHk8W7/txmvhjMcd+HiwfLy6xU0sirubGLCZxKH9WGTmNbXp0VZCe1lQDvJFUCbE8EmI1aM96d2L6hTnZ3pDlRTFiDF1wOsVP4zKS1x4dQhrpig+HgGyAaiJ0xJBrJhTcIpDvuq5FCkcq+flv6B8EDG25s19LXkflQwujHX1f4wGEVyrDaRcsFI2AGwlnUXDGs
Cc: Przemek Czesnowicz <przemyslawx.czesnowicz@intel.com>,
	Darren Hart <dvhart@linux.intel.com>, Joshua Immanuel <josh@hipro.co.in>,
	Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 1/7] bootimg: Use FAT 32 for images larger than 512MB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 11:27:15 -0000

From: Darren Hart <dvhart@linux.intel.com>

Fixes [YOCTO #2138]

Commit 217584211625b1c496fe5b78aa4765ccf605d2b9 dropped the forced use
of FAT32 for the hddimg generation as it broke with very small images
(< 32MB). Unfortunately, left to its own devices, mkdosfs appears to select
FAT16 even for very large images, resulting in 2.2GB images being
generated as FAT16:

$ ls -lah core-image-lsb-sdk-atom-pc-20121010233936.hddimg
-rw-rw-r-- 1 dvhart dvhart 2.2G 2012-10-17 08:00 core-image-lsb-sdk-atom-pc-20121010233936.hddimg

$ file !$
file core-image-lsb-sdk-atom-pc-20121010233936.hddimg
core-image-lsb-sdk-atom-pc-20121010233936.hddimg: x86 boot sector, code offset 0x58, OEM-ID "SYSLINUX", sectors/cluster 128, root entries 512, Media descriptor 0xf8, sectors/FAT 138, heads 64, sectors 4502496 (volumes > 32 MB) , serial number 0x50761926, label: "boot       ", FAT (16 bit)

The result was a runtime boot error from SYSLINUX and a failure to boot
live images greater than 1GB in size.

While strictly speaking it is the cluster count that determines which
FAT size is used, that calculation requires more information than we
have readily available (such as sectors per cluster). If we let mkdosfs
determine sectors per cluster and just set a sane threshold above which
FAT32 is used, we get correct bootable images. With this patch the 2.2GB
core-image-lsb-sdk uses FAT32 and the 21 MB core-image-minimal uses
FAT16, and both boot in qemu successfully:

$ ls -lah tmp/deploy/images/core-image-lsb-sdk-atom-pc-20121212220835.hddimg
-rw-r--r-- 1 dvhart dvhart 2.2G 2012-12-12 14:18 tmp/deploy/images/core-image-lsb-sdk-atom-pc-20121212220835.hddimg

$ file !$
file tmp/deploy/images/core-image-lsb-sdk-atom-pc-20121212220835.hddimg
tmp/deploy/images/core-image-lsb-sdk-atom-pc-20121212220835.hddimg: x86 boot sector, code offset 0x58, OEM-ID "SYSLINUX", sectors/cluster 8, Media descriptor 0xf8, heads 64, sectors 4470304 (volumes > 32 MB) , FAT (32 bit), sectors/FAT 4357, reserved3 0x800000, serial number 0x50c902b7, label: "boot       "

$ ls -lah tmp/deploy/images/core-image-minimal-atom-pc-20121212220600.hddimg
-rw-r--r-- 1 dvhart dvhart 21M 2012-12-12 14:06 tmp/deploy/images/core-image-minimal-atom-pc-20121212220600.hddimg

$ file !$
file tmp/deploy/images/core-image-minimal-atom-pc-20121212220600.hddimg
tmp/deploy/images/core-image-minimal-atom-pc-20121212220600.hddimg: x86 boot sector, code offset 0x58, OEM-ID "SYSLINUX", sectors/cluster 4, root entries 512, sectors 41408 (volumes <=32 MB) , Media descriptor 0xf8, sectors/FAT 41, heads 64, serial number 0x50c8ffec, label: "boot       ", FAT (16 bit)

I have tested and booted core-image-minimal and core-image-lsb-sdk for
atom-pc with qemu-system-i386 using this patch.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Steve Sakoman <steve@sakoman.com>
Cc: Joshua Immanuel <josh@hipro.co.in>
Cc: Przemek Czesnowicz <przemyslawx.czesnowicz@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/bootimg.bbclass |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 11a29cd..83c8ac4 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -163,8 +163,15 @@ build_hddimg() {
 		# done in blocks, thus the mod by 16 instead of 32.
 		BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
 
+		# mkdosfs will sometimes use FAT16 when it is not appropriate,
+		# resulting in a boot failure from SYSLINUX. Use FAT32 for
+		# images larger than 512MB, otherwise let mkdosfs decide.
+		if [ $(expr $BLOCKS / 1024) -gt 512 ]; then
+			FATSIZE="-F 32"
+		fi
+
 		IMG=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
-		mkdosfs -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
+		mkdosfs ${FATSIZE} -n ${BOOTIMG_VOLUME_ID} -S 512 -C ${IMG} ${BLOCKS}
 		# Copy HDDDIR recursively into the image file directly
 		mcopy -i ${IMG} -s ${HDDDIR}/* ::/
 
-- 
1.7.10.4



