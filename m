Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 81A317198D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 09:47:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p75so1602274wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=YjhupWTZWcLbpxwwzbunl+0V6KNLp9D7FrAVCcYI+bg=;
	b=KO0ZzisZKYRVyGfQL2udC/1r8Asosw77/pNvxmFsOTraIV9a8HmvkGWktqVqEXaUbb
	ipw6iC53nhcAJbR8TXCiXRvQhSBCJQ12316YZtq0sCZygZUDNNWnPGYxvsU7d1VQeZ3g
	oeyE09lX/zdpKz78oaw2btr6Tx2bbP3Ah+F1MkP9LbF23ebCucXHDID1kz8ApmEmBIOj
	rs4g295yLCTH2CoabxS9nGFqN1n7qUP50IeKoOKEhyW2HGGxeir76Zjl8sdKGaEUNL0n
	oSItVXvz+cQRSpuZPo4EByygeDuxd5YCb9cGWDfFLScUzn0pCMca8RV2nwxuU9floMT6
	LvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=YjhupWTZWcLbpxwwzbunl+0V6KNLp9D7FrAVCcYI+bg=;
	b=lJIaVQToOeyHpyho0KSVkGNH2ZEqqkDLsU7ZCeGpGAxaCIVnzOBdeUi1Donownj7rc
	bAn7AVzALG8hT4SUN6pxmGaaUyJkoEVD3IQCRAN6+DRFZBmiQ8TIzN6JWYbx4LJ3zgkD
	wQYnFX+APi1SokjSWmHew8L0DxpQz8c6AALa4k59cI+zf5LuzFM+Gm0d2S1DgNlzliGi
	tPBc12Licbo/RnS6okWrhfDuTkijgM1j8Xr8vyrQaLjKuBoOxbSOXrplZf9o/oSw3TiE
	cn0dEkaT7nJGco3jWuk5E4uoAmuIg9/5M3l4nRimpKq6UV8qHwhvMASfb/vxvcgeJ2lj
	c/TA==
X-Gm-Message-State: AMCzsaXYyGiNIF19i9RzaUD0jTI5/zwQVMNDh20QkzTA6VOLW6VVLng7
	tGRDkWOxX7H+KwtdxIOgmCom8ZRx
X-Google-Smtp-Source: ABhQp+RqRMSyQ2gw1gZgMtAMeE0j2OnFaHLkEcawPUa2hqMX7L0aZbGAltTo5r9pg3L1zQ98v6Qy7A==
X-Received: by 10.28.144.135 with SMTP id s129mr1083849wmd.103.1508492832811; 
	Fri, 20 Oct 2017 02:47:12 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	k105sm1308097wrc.90.2017.10.20.02.47.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 20 Oct 2017 02:47:11 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2017 11:47:09 +0200
Message-Id: <20171020094709.27155-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][pyro][PATCHv2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Fri, 20 Oct 2017 09:47:12 -0000

- Bad image type replacement for aarch64
- Fix DTB path in fitimage.its
- Ignore fitImage type in do_bundle_initramfs task because the packaging is made by do_assemble_fitimage_initramfs
- the images for arm64 are not compressed the linux_comp variable must therefore be none

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass |  6 +++++-
 meta/classes/kernel-uboot.bbclass    | 11 ++++++++---
 meta/classes/kernel.bbclass          |  4 +++-
 3 files changed, 16 insertions(+), 5 deletions(-)

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
diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 868e97d7a7..940f91d90e 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -1,12 +1,17 @@
 uboot_prep_kimage() {
-	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
+	if [ -e arch/${ARCH}/boot/compressed/vmlinux ] ; then
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
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
 
 	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ce2cab65ae..14677ac0fc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -219,7 +219,9 @@ do_bundle_initramfs () {
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


