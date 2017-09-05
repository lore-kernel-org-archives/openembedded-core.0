Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2298377FED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 06:05:10 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d70so1546547qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 23:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=c8sAD+3FK5J5uuNcjMYwAkCFhyHO0XUPTGLSIFL56e8=;
	b=Pw1MernZhGKSJOkYuSg4xA5wmm/PJVfNXmk4t0Nnrr4tqTRsgN6vqVZ0lKKrqFKy59
	JaZgoV+BNsKhYGVF+25UQxAL9ykUvlxjO9tnSZRpjenkZILUsPreJFfQ8fgTQpqH3ggp
	Ba2+BbCbQb6v/vjjEv5g1BL+W7n7kHBn+Q671EzuvfIGw8ZcGGQV+rQARY987AvbHHA1
	+NOtMlviEMTsyITGDdvMVPA7YkyBsP2Ln6O9BkTF/FQDfMIbZy4WPSm9yq4EWR8+H9ch
	nwC5kRUW+cG1KV9g6AkZE+6bZ98PcuAPZrx8Bspdlnvx0rdq72oDYCpMc15SSGMUxh/0
	QE0w==
X-Gm-Message-State: AHPjjUjoLja/WUvdOU55fYzzHOPcAk0k9Zss46Wi8W0RjGDAclb8+P2y
	0p/cTut7z3h2ili1
X-Google-Smtp-Source: ADKCNb5Trj775hsrpZf3NBdee9hTiRxWS3WUOnRntC9PyOPkf6TrYn8D0H33aljGvNGBxj4qbpDlQQ==
X-Received: by 10.55.101.23 with SMTP id z23mr3544138qkb.257.1504591511847;
	Mon, 04 Sep 2017 23:05:11 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	x76sm2056685qkb.91.2017.09.04.23.05.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 23:05:11 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 03:05:04 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 03:04:46 -0300
Message-Id: <20170905060446.9848-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905060446.9848-1-otavio@ossystems.com.br>
References: <20170905060446.9848-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Tue, 05 Sep 2017 06:05:11 -0000

The are use cases where the Device Tree appended to the kernel is
convinient, so we now allow the generation of this type of bundle.

To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
- new patch

Changes in v3: None
Changes in v2: None

 meta/classes/kernel-devicetree.bbclass | 40 +++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 04e2f2695e..87243dde5d 100644
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
@@ -63,6 +94,13 @@ do_deploy_append() {
 			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
+
+			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
+				cat ${DEPLOYDIR}/$type \
+					${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT} \
+					> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}.bundle
+				ln -sf ${DTB_NAME}.${DTB_EXT}.bundle ${DEPLOYDIR}/$type-${DTB_BASE_NAME}.${DTB_EXT}.bundle
+			fi
 		done
 	done
 }
-- 
2.14.1


