Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7A195605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 13:58:43 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so3670015qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 06:58:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=YL8q0KrKj9/ax20E0m8/p7dVt1wT2jZf4fBUvdUzFVU=;
	b=ja3Yg2PV9mn6JudZcxVXoA7jpPXp6HnYBWQ+IJ1k0l+5SoHaJ0BsMzijRVJDvf+w9t
	AYred/Cc87et5LDa58BH/J8zhnPdT1juAo6wS/8mMit7UQNzt7sd6uktNySyTTqlclSb
	zX0uIXFuvyxwMJOl8iqH7KBsgtjey/8L1iKEZmdnrXQm8VZ/w+jjZIAg0/NRjVSaJcVo
	BROEsZfNonm8zA4F+qnXSAT2dg5h5V586+DrWlYcBKhtWt0oz/gBfhAWIV+U46A8E3z4
	ppZGYAoNKTwm7bs9Y83J5CnZxp6yD3e3McMIytTqxm/fawy6LtgXho4Oz9B5ObAqUBe+
	bPFw==
X-Gm-Message-State: AHPjjUiJPNHkvWGpgZ9VoolKyzPKN5f3eeqaIicdCJ06RWcD+nyR+bj/
	8ohDJiqnvxQC73g3tMkvwE/7pw==
X-Google-Smtp-Source: AOwi7QBzCvEB4WPZfiKrrP1paaHbkEUI6bSnSyI69/ZKx9AVg16YwbrXtjar+/13VlmHUc9Kf/BXbQ==
X-Received: by 10.55.139.65 with SMTP id n62mr3065147qkd.94.1506002324126;
	Thu, 21 Sep 2017 06:58:44 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 23sm981869qkf.68.2017.09.21.06.58.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Sep 2017 06:58:43 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 21 Sep 2017 10:58:34 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Sep 2017 10:58:33 -0300
Message-Id: <20170921135833.11007-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v9] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 21 Sep 2017 13:58:43 -0000

The are use cases where the Device Tree appended to the kernel is
convinient, so we generate the bundle concatenating the kernel (and
potentionally the initramfs) and the Device Tree binaries.

To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- Rework to not use tasks
- Keep MIPS support addition for later

Changes in v8:
- rework append support to support ARM and MIPS (obi)

Changes in v7:
- simplified code
- rename bundle to use .bin extension

Changes in v5:
- add support for initramfs bundle

Changes in v4:
- new patch

 meta/classes/kernel-devicetree.bbclass | 52 +++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 72814ca224..6e08be4b70 100644
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
+FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
+
+# Generate kernel+devicetree bundle
+KERNEL_DEVICETREE_BUNDLE ?= "0"
 
 normalize_dtb () {
 	DTB="$1"
@@ -20,6 +27,28 @@ get_real_dtb_path_in_kernel () {
 	echo "${DTB_PATH}"
 }
 
+do_configure_append() {
+	if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+		if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage'; then
+			case "${ARCH}" in
+				"arm")
+				config="${B}/.config"
+				if ! grep -q 'CONFIG_ARM_APPENDED_DTB=y' $config; then
+					bbwarn 'CONFIG_ARM_APPENDED_DTB is NOT enabled in the kernel. Enabling it to allow the kernel to boot with the Device Tree appended!'
+					sed -i "/CONFIG_ARM_APPENDED_DTB[ =]/d" $config
+					echo "CONFIG_ARM_APPENDED_DTB=y" >> $config
+					echo "# CONFIG_ARM_ATAG_DTB_COMPAT is not set" >> $config
+				fi
+				;;
+				*)
+				bberror "KERNEL_DEVICETREE_BUNDLE is not supported for ${ARCH}. Currently it is only supported for 'ARM'."
+			esac
+		else
+			bberror 'The KERNEL_DEVICETREE_BUNDLE requires the KERNEL_IMAGETYPE to contain zImage.'
+		fi
+	fi
+}
+
 do_compile_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
@@ -38,6 +67,12 @@ do_install_append() {
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
+
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+				cat ${D}/${KERNEL_IMAGEDEST}/$type \
+					${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} \
+					> ${D}/${KERNEL_IMAGEDEST}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
+			fi
 		done
 	done
 }
@@ -57,6 +92,21 @@ do_deploy_append() {
 			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
+
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+				cat ${DEPLOYDIR}/$type \
+					${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
+					> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}.bin
+				ln -sf ${DTB_NAME}.${DTB_EXT}.bin ${DEPLOYDIR}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
+
+				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
+						${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
+						> ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}.bin
+					ln -sf ${type}-${INITRAMFS_BASE_NAME}-${DTB_BASE_NAME}.${DTB_EXT}.bin \
+					       ${DEPLOYDIR}/${type}-initramfs-${DTB_BASE_NAME}.${DTB_EXT}-${MACHINE}.bin
+				fi
+			fi
 		done
 	done
 }
-- 
2.14.1


