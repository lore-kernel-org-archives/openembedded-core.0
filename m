Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id B7E3278202
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:43:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o77so1545871qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Qzp0kFRUSGsat5eamu8HPK5stmMNHm+p/E5DyS+jEEY=;
	b=U75yp70l+AZUgun2+fqlON6QyjYd1QQl4neVIgPejAE7enxXe50nF1bAlhHV+ghRno
	gOqvbqQH+p+4Qqyw6wZhBGJ4RGz7MZx66CQoTXpGqhLiO7KqNeo6fvsC5Fw2WhBJUH78
	Msd/LjtYAENFJNzETB0xtK81zrtMeAjhUSdGKTB9SD0360XNaG9aLaNvgHoKg2c74O8w
	QRfU1arnINPhQksf6ru6gTYiRhe4A0DU7GwgphMOm4s6aRIrQoUB7qYP+QRyDeB0elLJ
	AQ3UKRVxuTCll/a8jpV/InvEl7EbsBrXL+9P7QFd+mu0yObvGAp0SoWOln97euhQ6eCo
	9hhg==
X-Gm-Message-State: AHPjjUhY9+Mee/Ti9g2SAxqZvLDnGsFKilvfAhFbJGZaADZF9ZLgi5NT
	7hlAN0PYhMybZIgO
X-Google-Smtp-Source: AOwi7QAPUD+mtR0/V7Tx4YXzk34u7AEVgl9SeKJrYEcrLiU551AWNCfe53vt8XadLJRZ4RVLifgkHw==
X-Received: by 10.233.220.199 with SMTP id q190mr3654580qkf.222.1504878238662; 
	Fri, 08 Sep 2017 06:43:58 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	v11sm1232971qti.95.2017.09.08.06.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:43:57 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:43:51 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:43:31 -0300
Message-Id: <20170908134331.6695-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134331.6695-1-otavio@ossystems.com.br>
References: <20170908134331.6695-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v6 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Fri, 08 Sep 2017 13:43:57 -0000

The are use cases where the Device Tree appended to the kernel is
convinient, so we generate the bundle concatenating the kernel (and
potentionally the initramfs) and the Device Tree binaries.

To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
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


