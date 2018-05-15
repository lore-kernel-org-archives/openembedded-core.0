Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2F675093
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 06:11:26 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id y15-v6so14577237wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 23:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XnRSLawDmMFwl/dkTcQysBt6wIIAt/93ZFTipipQjQs=;
	b=PV61rqAebRKLgbPnpJw7DjtguFRqGqUAJubF1ZiHnvpLAnfS4kizg5hxMrGJl54PWb
	q3z4k7xPjybe6bGwq9Jl+aQHprrAhtZGiGK5/oh3tNq3fI9al6hlhjVy73Mqzgy1IHyT
	QMbeOfIyH/9xZTFphebp/OC3sLfAPD/J0/kEFTzeN5lbZQrdPLT59Wzl8kM8STyUCoZI
	zD6oe1K16BJewRED5/SKtIn1+XLjO+pub7V5dZ/1FzBghT4qvHvEahNdST9JfzDflOws
	YdUvPxDJ03DWCcV16nBSlhnfuSuqMTUKZbuYjpMNjua3sMbvUOx4sEkW54C5TbydN+6W
	b/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XnRSLawDmMFwl/dkTcQysBt6wIIAt/93ZFTipipQjQs=;
	b=UqfV4JV34bhaxthxuIpDqCacb1MspMnk7kvLPMz1WYzd/IAOc3RcJODzU8+39e0HOk
	4PkVXjqSm501ncuAnzcrMFByWC+LNauEVzmNP1CFTJTutz7JJD+9n/GQx30l0q/4B7W7
	GkPP0VEME8CFkw9G605Vw3zyNuXBsnM4xDPGDbLyPRVQPkdazWqytMDm49Ws1d6ZiRVb
	UufmcPcR5jvbKbSNfRvbqJRifH6pkxS9DzXGflYkdJjZwK+1LsZD+H09SpvUfXAN7A9X
	YBh75w8YoUWobEir2hH7ZgG1wjyn+uieAnwEWQGwp6azVpNHLPeLOJmbuw7k7AQ0nnRv
	wzlA==
X-Gm-Message-State: ALKqPwex2nnIYJuWjvcV4CnHdv4rq/nlKKmHVF34JmXiS8jNday2GUM5
	kvGcdgOaE0SuQ+hT8RPIgxzjMQ==
X-Google-Smtp-Source: AB8JxZrebdpxDtJwgfmyV4n8DqZLMdZ9sChYatHgpg8UL+UfSYnkuR3lhA3nh0Ufc6H6NzFAMk/h1g==
X-Received: by 2002:adf:8386:: with SMTP id 6-v6mr9113158wre.119.1526364686823;
	Mon, 14 May 2018 23:11:26 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([176.32.49.4]) by smtp.gmail.com with ESMTPSA id
	131-v6sm18086723wms.34.2018.05.14.23.11.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 23:11:26 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 08:11:11 +0200
Message-Id: <1526364671-29451-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
References: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 4/4] kernel-uimage.bbclass: support devicetree bundle
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
X-List-Received-Date: Tue, 15 May 2018 06:11:26 -0000

From: Ming Liu <liu.ming50@gmail.com>

This patch mainly aims to support devicetree bundle for uImage, when
KEEPUIMAGE is set negative, by appending some code to kernel_do_install
and kernel_do_deploy to check KERNEL_DEVICETREE_BUNDLE and call
uboot-mkimage to regenerate the devicetree bundled image if it's set.

Some common code is moved to kernel-devicetree-common.bbclass as well
since they are being referred now in both kernel-devicetree.bbclass and
kernel-uimage.bbclass.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-devicetree-common.bbclass | 21 +++++++++
 meta/classes/kernel-devicetree.bbclass        | 29 +++---------
 meta/classes/kernel-uimage.bbclass            | 68 +++++++++++++++++++++++----
 3 files changed, 87 insertions(+), 31 deletions(-)
 create mode 100644 meta/classes/kernel-devicetree-common.bbclass

diff --git a/meta/classes/kernel-devicetree-common.bbclass b/meta/classes/kernel-devicetree-common.bbclass
new file mode 100644
index 0000000..2216533
--- /dev/null
+++ b/meta/classes/kernel-devicetree-common.bbclass
@@ -0,0 +1,21 @@
+
+# Generate kernel+devicetree bundle
+KERNEL_DEVICETREE_BUNDLE ?= "0"
+
+normalize_dtb () {
+	DTB="$1"
+	if echo ${DTB} | grep -q '/dts/'; then
+		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+	fi
+	echo "${DTB}"
+}
+
+get_real_dtb_path_in_kernel () {
+	DTB="$1"
+	DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+	if [ ! -e "${DTB_PATH}" ]; then
+		DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+	fi
+	echo "${DTB_PATH}"
+}
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 4f80cc6..00c6210 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,31 +1,14 @@
 # Support for device tree generation
+inherit kernel-devicetree-common
+
 PACKAGES_append = " \
     ${KERNEL_PACKAGE_NAME}-devicetree \
     ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
+    ${@[d.getVar('KERNEL_PACKAGE_NAME') + '-image-uimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
 "
 FILES_${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
 FILES_${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
-
-# Generate kernel+devicetree bundle
-KERNEL_DEVICETREE_BUNDLE ?= "0"
-
-normalize_dtb () {
-	DTB="$1"
-	if echo ${DTB} | grep -q '/dts/'; then
-		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-	fi
-	echo "${DTB}"
-}
-
-get_real_dtb_path_in_kernel () {
-	DTB="$1"
-	DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-	if [ ! -e "${DTB_PATH}" ]; then
-		DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
-	fi
-	echo "${DTB_PATH}"
-}
+FILES_${KERNEL_PACKAGE_NAME}-image-uimage-bundle = "/${KERNEL_IMAGEDEST}/uImage-*.dtb.bin"
 
 do_configure_append() {
 	if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
@@ -69,7 +52,7 @@ do_install_append() {
 			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
 
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
-				cat ${D}/${KERNEL_IMAGEDEST}/$type \
+				cat ${KERNEL_OUTPUT_DIR}/$type \
 					${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} \
 					> ${D}/${KERNEL_IMAGEDEST}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
 			fi
@@ -94,7 +77,7 @@ do_deploy_append() {
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
 
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
-				cat ${DEPLOYDIR}/$type \
+				cat ${KERNEL_OUTPUT_DIR}/$type \
 					${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
 					> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}.bin
 				ln -sf ${DTB_NAME}.${DTB_EXT}.bin ${DEPLOYDIR}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 4bd6c7b..103c779 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -1,4 +1,4 @@
-inherit kernel-uboot
+inherit kernel-uboot kernel-devicetree-common
 
 python __anonymous () {
     if "uImage" in (d.getVar('KERNEL_IMAGETYPES') or "").split():
@@ -14,7 +14,8 @@ python __anonymous () {
         if not oe.types.boolean(d.getVar("KEEPUIMAGE")):
             typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
             if "uImage" in typeformake.split():
-                d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
+                replace_image = 'zImage' if oe.types.boolean(d.getVar('KERNEL_DEVICETREE_BUNDLE')) else 'vmlinux'
+                d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', replace_image))
 
             # Enable building of uImage with mkimage
             bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_link_images', d)
@@ -24,16 +25,67 @@ python __anonymous () {
             d.setVar('KERNEL_IMAGETYPE_BACKUP_UIMAGE', 'uImage')
 }
 
+normalize_entrypoint() {
+	local entrypoint=${UBOOT_ENTRYPOINT}
+	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
+		entrypoint=`${HOST_PREFIX}nm ${B}/vmlinux | \
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
+	fi
+	echo $entrypoint
+}
+
 do_uboot_mkimage[dirs] += "${B}"
 do_uboot_mkimage() {
 	uboot_prep_kimage
 
-	ENTRYPOINT=${UBOOT_ENTRYPOINT}
-	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
-		ENTRYPOINT=`${HOST_PREFIX}nm ${B}/vmlinux | \
-			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} \
+		-e `normalize_entrypoint` -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	rm -f linux.bin
+}
+
+kernel_do_install_append() {
+	if [ "${KERNEL_IMAGETYPE_BACKUP_UIMAGE}" != "uImage" ] || [ "${KERNEL_DEVICETREE_BUNDLE}" != "1" ]; then
+		return
 	fi
 
-	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
-	rm -f linux.bin
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		DTB_EXT=${DTB##*.}
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
+		cat ${B}/${KERNEL_OUTPUT_DIR}/zImage ${DTB_PATH} \
+			> linux-${DTB_BASE_NAME}.${DTB_EXT}.bin
+		uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} \
+			-e `normalize_entrypoint` -n "${DISTRO_NAME}/${PV}/${MACHINE}" \
+			-d  linux-${DTB_BASE_NAME}.${DTB_EXT}.bin \
+			${D}/${KERNEL_IMAGEDEST}/uImage-${DTB_BASE_NAME}.${DTB_EXT}.bin
+		rm -f linux-${DTB_BASE_NAME}.${DTB_EXT}.bin
+	done
+}
+
+kernel_do_deploy_append() {
+	if [ "${KERNEL_IMAGETYPE_BACKUP_UIMAGE}" != "uImage" ] || [ "${KERNEL_DEVICETREE_BUNDLE}" != "1" ]; then
+		return
+	fi
+
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		DTB_EXT=${DTB##*.}
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
+		install -m 0755 ${D}/${KERNEL_IMAGEDEST}/uImage-${DTB_BASE_NAME}.${DTB_EXT}.bin \
+			${DEPLOYDIR}/uImage-${DTB_NAME}.${DTB_EXT}.bin
+		ln -sf uImage-${DTB_NAME}.${DTB_EXT}.bin ${DEPLOYDIR}/uImage-${DTB_BASE_NAME}.${DTB_EXT}.bin
+		if [ -e "${B}/${KERNEL_OUTPUT_DIR}/zImage.initramfs" ]; then
+			cat ${B}/${KERNEL_OUTPUT_DIR}/zImage.initramfs ${DTB_PATH} \
+				> linux-initramfs-${DTB_BASE_NAME}.${DTB_EXT}.bin
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C none -a ${UBOOT_LOADADDRESS} \
+				-e `normalize_entrypoint` -n "${DISTRO_NAME}/${PV}/${MACHINE}" \
+				-d linux-initramfs-${DTB_BASE_NAME}.${DTB_EXT}.bin \
+				${DEPLOYDIR}/uImage-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}.bin
+			ln -sf uImage-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}.bin \
+				${DEPLOYDIR}/uImage-initramfs-${DTB_BASE_NAME}.${DTB_EXT}-${MACHINE}.bin
+			rm -f linux-initramfs-${DTB_BASE_NAME}.${DTB_EXT}.bin
+		fi
+	done
 }
-- 
2.7.4


