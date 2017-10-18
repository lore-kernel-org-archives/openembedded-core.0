Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B2E9E6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 07:46:27 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l68so8283273wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=MmqmzCRx9hHolyZnT5fATHKYNB92jy9XXzccFDeUP/k=;
	b=dzX/9o/DopxrKq/Mf+cVWSLUWBOznhNHUhNBHKt04wK7WhEbFpKRIV1HutULq4SUHH
	WMNOI/JszSE7ydMrothU0+cHhT9WJ7/htBOlyInnoCY/34QsoBdqeqPeKGRC2xLn5Ept
	ONAmeTCL7EWFdbjEyUdoiSEHrogV/PoYbqofW4xYZYrFbNQCDTPl2N+1UcNa4Rnf2Pmx
	V1Bp7gTdOIOY/1EkEnQQ32t+XStcQN6p3bPwhNGp1X/P0Yay75BfvQ8tzLUsfpiyFzqN
	c4bPYzI0P5ZYimwgbVjRiNF5WKPfE7a0bdtOVhKfswrkG5sD5w3CD3CkjnziLPNIIZIJ
	UE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=MmqmzCRx9hHolyZnT5fATHKYNB92jy9XXzccFDeUP/k=;
	b=uEYWBBGq7f6krfc6dp1Pu6jQOKHhfAkDaC5wYA/rC2I7+dr7mEHR7z0KHS7MhSFhFO
	7jJdczFUCJKlkyG/D0MyT0NqYCemlHy4YHZfgpVdT0oVi055bB4T/HAzL9DFHVMs2hwZ
	Q+yBuBVPkpk8DcxDNjdm74w5fFSJTBYD+QmBkOoEiIa1Mpw9HxqRuJ4UermR8wln8wQL
	9y2txVnFamnrI0Uk9Vau0aHbVyhk6H0TFIFEYaOmAF3uCD5BJ7CoWI8DSE1wrlVeheWP
	o8vdkBh9cz56hsdxGOLX1Cq/itpt0+LW+qzKz4P7BbT5/0FqXS2vMC4NuWQMSy18Q09m
	TwrA==
X-Gm-Message-State: AMCzsaXGPIC4k1MkxiJvNIfdYlm1vTlZgnhBlRHx860fedqm0Q9vQJgb
	9Tuc0C3q7YUBf2tCvz9jBl+k8oFH
X-Google-Smtp-Source: ABhQp+S24t/hqxRlaMHMg5Zf2zxrBx4tErkuwHh5+8TXxPSjYhWbogXqHAkWCdS/LZSqes949wRSww==
X-Received: by 10.28.107.150 with SMTP id a22mr6009961wmi.41.1508312788078;
	Wed, 18 Oct 2017 00:46:28 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	v5sm10938867wrf.29.2017.10.18.00.46.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 00:46:27 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 09:46:23 +0200
Message-Id: <20171018074623.3461-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 18 Oct 2017 07:46:28 -0000

- Bad image type replacement for aarch64
- Fix DTB path in fitimage.its
- Ignore fitImage type in do_bundle_initramfs task because the packaging is made by do_assemble_fitimage_initramfs

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 meta/classes/kernel.bbclass          | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47316..abbc309b09 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,8 +7,11 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "x86":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "x86":
             replacementtype = "bzImage"
+        elif uarch == "arm64":
+            replacementtype = "Image"
         else:
             replacementtype = "zImage"
 
@@ -351,6 +354,7 @@ fitimage_assemble() {
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
 
+			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
 			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
 		done
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ce2cab65ae..a8b0d0a061 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -219,7 +219,9 @@ do_bundle_initramfs () {
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
 		for type in ${KERNEL_IMAGETYPES} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			if [ "$type" == "fitImage" ] ; then
+				continue
+			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
 				mv -f $realpath $realpath.bak
-- 
2.13.6


