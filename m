Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7D178484
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:46:22 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u48so4489073qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 06:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=yQ0vK7FcOhUyurqu9xav9MONwtlgv+sQC9aMEIzlQtw=;
	b=Yvgq6/Wx7fx3X0td2/+aztwbCINSYb4N3ymnRh080aZ847+IjmvZpjBga0Gw/pH52O
	RJn5lEqjLHkjyr8Us7CJ0MVg5qCJVF4i6i04MkllKPtg7YATCmg0m15zrMNOx3J81uQa
	ZMslKeWz71tDrmgYi6+pOwvSUkbsFcQHofkP6Y+NYoLL5hltZn0DMzRI6J2sY5T4+Zv1
	LE7LVj0pkMoFxk8vnxoYSWsj1caF7Ob2GDalO1szOVRpErK4redjECVrN+NTsVdTur7e
	QtdaB2zH+6bzs53j7jWM1yAnQHpu2UnBxQaDpBNylaiAqsyHKpEsv1KNE+zrzCamFPOH
	6AkQ==
X-Gm-Message-State: AHPjjUhweaagl2fRKymWUvYuPrPQ73G0BbrxwOobB//Yt71o+ULTR8W6
	Osc0O09OW+u/MuEc
X-Google-Smtp-Source: AOwi7QBu4qPbtayoV5tZWUJzMwUHBnHM8pAz0mCbdD2RhZPDwXhWxZwyzZ0z4wh9l+jOxaZ7pZE3Dg==
X-Received: by 10.237.52.68 with SMTP id w62mr1617083qtd.217.1505223983128;
	Tue, 12 Sep 2017 06:46:23 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	z75sm7573845qkb.71.2017.09.12.06.46.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 06:46:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 10:46:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 10:45:51 -0300
Message-Id: <20170912134551.12678-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912134551.12678-1-otavio@ossystems.com.br>
References: <20170912134551.12678-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Tue, 12 Sep 2017 13:46:22 -0000

The are use cases where the Device Tree appended to the kernel is
convinient, so we generate the bundle concatenating the kernel (and
potentionally the initramfs) and the Device Tree binaries.

To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7:
- simplified code
- rename bundle to use .bin extension

Changes in v6: None
Changes in v5:
- add support for initramfs bundle

Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 meta/classes/kernel-devicetree.bbclass | 48 +++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 8723f24212..54bed5b4c4 100644
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
+					> ${D}/${KERNEL_IMAGEDEST}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bin
+			fi
 		done
 	done
 }
@@ -63,6 +94,21 @@ do_deploy_append() {
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


