Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69ED678516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 20:36:36 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u48so5146160qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Q4PdvPCC/HWWfAXtQ23mxPzd0QSy/q4BREeDYF+zR00=;
	b=dBfl5Mm14WTfaAcOh6+Hcf1mmp5/1vWVkXAZ2DMnNTJet7pLSsmfrrlRZjjILl8K8b
	0nMhTktdHjM6B3UyNt0/0riOQVAGb0Q6Nu+DbwalWytd3NB1v7Jnzg4a8ivpnOsnNVWs
	b/tFhekbDSf8WszxpJ0fvtNYV9LFaICmVOAUJ23W670q/qFYAJCNFoKvAXpEr2zxJTtO
	X/e83liZZdHhNVqz+LOgR5doRkzIa8D3G0YHPBqSKTABte2ZzzkAUAgA8oP3qWARwIGW
	udM8yMS1w76eRLYcSOK/3kTL5ph/niDHvolUOpNrR5qw5ls8u5X+lzpCugePvNyhfXI6
	NfPA==
X-Gm-Message-State: AHPjjUiHSOb7nTZJpjQc3ZogM+ZO+obHwVFeTUdnlupD+u4v6Mj1N5DH
	fLLRIoTQHbtJncHu
X-Google-Smtp-Source: AOwi7QBSLtA3jien/jNxVUTu3oOxmZf/L6pkR15t5gCESqcVLtlqBXwbqiQfu4ikhXNhmSKWiIDrcg==
X-Received: by 10.237.62.176 with SMTP id n45mr21931369qtf.302.1505248597927; 
	Tue, 12 Sep 2017 13:36:37 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id u7sm8655250qte.88.2017.09.12.13.36.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 13:36:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 17:36:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 17:36:08 -0300
Message-Id: <20170912203608.14327-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912203608.14327-1-otavio@ossystems.com.br>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Tue, 12 Sep 2017 20:36:37 -0000

The are use cases where the Device Tree appended to the kernel is
convinient, so we generate the bundle concatenating the kernel (and
potentionally the initramfs) and the Device Tree binaries.

To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8:
- rework append support to support ARM and MIPS (obi)

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

 meta/classes/kernel-devicetree.bbclass | 62 +++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 8723f24212..c618594c96 100644
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
@@ -20,6 +27,38 @@ get_real_dtb_path_in_kernel () {
 	echo "${DTB_PATH}"
 }
 
+
+do_configure_devicetree() {
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
+				"mips")
+				config="${B}/.config"
+				if ! grep -q 'CONFIG_MIPS_APPENDED_DTB=y' $config; then
+					bbwarn 'CONFIG_MIPS_APPENDED_DTB is NOT enabled in the kernel. Enabling it to allow the kernel to boot with the Device Tree appended!'
+					sed -i "/CONFIG_MIPS_APPENDED_DTB[ =]/d" $config
+					echo "CONFIG_MIPS_APPENDED_DTB=y" >> $config
+				fi
+				;;
+				*)
+				bberror "KERNEL_DEVICETREE_BUNDLE is not supported for ${ARCH}. Currently it is only supported for 'arm' and 'mips'."
+			esac
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
@@ -43,6 +82,12 @@ fakeroot do_install_devicetree() {
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
@@ -63,6 +108,21 @@ do_deploy_append() {
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


