Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE6977F70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:28:47 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h21so2280802qth.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=TIOAX6ICtRggXXQJtjkx+MwtbtXj5jZz4OI4123VElI=;
	b=Dbin8ycq3qn8wrFxkTe6Pc3WxmP4OlC7gRgzBghg2fhxhE9Mj2fCJoau3zKM0SMw3r
	yWc+fT9eLphKOjMkS/MEtwAdEuwO9PKsqY25MSDVIGJdyN5MLoHyo7siadJnWXCf+pfJ
	CB7kI+J/BtAPdHJHDGCbW6WG3GOkeC5HxS0nM59f+KIQDpkP0NtbYm0fohYIm1kMnGCP
	3vNvQpJhHGq8PQCfTUoVBgMAcRwAwUoqzIi1UG0NrBA89JlfWwNHkL53BzLyAO18dPOR
	ZxuxnVanZUPFN+rLX6Y7kcnItztNpyRa9mlqIhFGAT5GBU7FtuIE9kQflD4psrBn/v+j
	CQSA==
X-Gm-Message-State: AHPjjUgg9vTJGwNmQ9DcQCgsgG/eQheczOvyN6GBnGubPDIY7NPb8qJz
	HDta0XN34kHEKxl9
X-Google-Smtp-Source: ADKCNb5VmPvPd1VL/u1SOlYyl9L3o6oIPlx2HLO6Zqm8IjaBJd66U4mfQM1mL6BoTAmDVBdzWl190g==
X-Received: by 10.237.60.1 with SMTP id t1mr5278772qte.246.1504621728855;
	Tue, 05 Sep 2017 07:28:48 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id r18sm418975qtr.91.2017.09.05.07.28.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:28:48 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:28:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:28:22 -0300
Message-Id: <20170905142822.17693-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905142822.17693-1-otavio@ossystems.com.br>
References: <20170905142822.17693-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Tue, 05 Sep 2017 14:28:48 -0000

The are use cases where the Device Tree appended to the kernel is
convinient, so we generate the bundle concatenating the kernel (and
potentionally the initramfs) and the Device Tree binaries.

To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- add support for initramfs bundle

Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 meta/classes/kernel-devicetree.bbclass | 49 +++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 04e2f2695e..1499d2ba43 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -1,6 +1,13 @@
 # Support for device tree generation
-PACKAGES_append = " kernel-devicetree"
+PACKAGES_append = " \
+    kernel-devicetree \
+    ${@['kernel-image-zimage-bundle', ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
+"
 FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
+FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bundle"
+
+# Generate kernel+devicetree bundle
+KERNEL_DEVICETREE_BUNDLE ?= "0"
 
 normalize_dtb () {
 	DTB="$1"
@@ -20,6 +27,24 @@ get_real_dtb_path_in_kernel () {
 	echo "${DTB_PATH}"
 }
 
+
+do_configure_devicetree() {
+	if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+		if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage'; then
+			config="${B}/.config"
+			if ! grep -q 'CONFIG_ARM_APPENDED_DTB=y' $config; then
+				bbwarn 'CONFIG_ARM_APPENDED_DTB is NOT enabled in the kernel. Enabling it to allow the kernel to boot with the Device Tree appended!'
+				sed -i "/CONFIG_ARM_APPENDED_DTB[ =]/d" $config
+				echo "CONFIG_ARM_APPENDED_DTB=y" >> $config
+				echo "# CONFIG_ARM_ATAG_DTB_COMPAT is not set" >> $config
+			fi
+		else
+			bberror 'The KERNEL_DEVICETREE_BUNDLE requires the KERNEL_IMAGETYPE to contain zImage.'
+		fi
+	fi
+}
+addtask configure_devicetree after do_configure before do_compile
+
 do_compile_devicetree() {
     DTBS=""
 	for dtb in ${KERNEL_DEVICETREE}; do
@@ -43,6 +68,12 @@ fakeroot do_install_devicetree() {
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
+
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+				cat ${D}/${KERNEL_IMAGEDEST}/$type \
+					${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} \
+					> ${D}/${KERNEL_IMAGEDEST}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bundle
+			fi
 		done
 	done
 }
@@ -63,6 +94,22 @@ do_deploy_append() {
 			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
+
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+				cat ${DEPLOYDIR}/$type \
+					${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
+					> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}.bundle
+				ln -sf ${DTB_NAME}.${DTB_EXT}.bundle ${DEPLOYDIR}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bundle
+
+				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+					initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}
+					initramfs_symlink_name=${type}-initramfs-${DTB_BASE_NAME}.${DTB_EXT}-${MACHINE}
+					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
+						${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
+						> ${DEPLOYDIR}/${initramfs_base_name}.bin
+					ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${initramfs_symlink_name}.bin
+				fi
+			fi
 		done
 	done
 }
-- 
2.14.1


