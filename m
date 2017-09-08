Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C8FBF781F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:43:50 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r66so1386720qke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ybQLtUbO1DWraWzZkaLO+F6UcvitqVb7Bc1eEGSVoro=;
	b=dsmPATnIl+ASUZN8srbbHr801uRdQ7m8iQSEtyqOIpvsas+fNzi91eFLdnAMf3oRt9
	crqX8GGmAEnq0rRFuV6B0wsICVVSByAwOvLbTu3cV3zLiwbF+c6G1vqyiwvUungn34QD
	TG7gjfwzgkTShz+hH5unCKlFbm2R/nt7PyjdvYCd2KuPQW9Qa8L9ZgVK9aaqoFrTcEsU
	rVbA4a+RO7oxvWH++t9jEvw1xO+k7PB+dPrWqS6cQYW0Yp8N8kIy1qRKlQ1I5tKWgeGb
	nm7zr9/g6OBKq//V6HT7/AzM1dAnTyjIeW/ZzjuSvBe9MkIS7k4B3BPD6mWOlcOCdoNH
	kilg==
X-Gm-Message-State: AHPjjUj2QK0R9+3C+XLn9HJiE+A5H2IDfdW4Ih6bZe7qU/OKXA04S3vO
	doXHbvNlDlLKCu3M
X-Google-Smtp-Source: AOwi7QBjy6f2fiJL9DakYOdmB5XYSScDtIYHdYuLKbh3DGZWd7FWwjJuLvaCNLQ+PKXV/YURSQFJaw==
X-Received: by 10.55.146.195 with SMTP id u186mr3675856qkd.14.1504878231327;
	Fri, 08 Sep 2017 06:43:51 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	s124sm1264482qkc.8.2017.09.08.06.43.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:43:50 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:43:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:43:30 -0300
Message-Id: <20170908134331.6695-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134331.6695-1-otavio@ossystems.com.br>
References: <20170908134331.6695-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v6 2/3] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Fri, 08 Sep 2017 13:43:50 -0000

The Device Tree is commonly used but it is still kept as a .inc file
instead of a proper class. Instead now we move the Device Tree code to
a kernel-devicetree class and automatically enable it when the
KERNEL_DEVICETREE variable is set.

While converting to the class, we reworked the compile and install in
tasks as well as run the build of the Device Tree files in parallel,
if possible.

To avoid breakage in existing layers, we kept a linux-dtb.inc file
which raises a warning telling the user about the change so in next
release this can be removed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- Remove linux-dtb.inc from linux-yocto recipes
- Always inherit kernel-devicetree class

Changes in v5: None
Changes in v4:
- Rebase on top of 1/3

Changes in v3:
- rework compile and install to tasks
- improve commit log

Changes in v2:
- Wrong version as the changes were not staged. Sorry!

 meta/classes/kernel-devicetree.bbclass    | 68 +++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass               |  3 ++
 meta/recipes-kernel/linux/linux-dtb.inc   | 66 +-----------------------------
 meta/recipes-kernel/linux/linux-yocto.inc |  1 -
 4 files changed, 73 insertions(+), 65 deletions(-)
 create mode 100644 meta/classes/kernel-devicetree.bbclass

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
new file mode 100644
index 0000000000..04e2f2695e
--- /dev/null
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -0,0 +1,68 @@
+# Support for device tree generation
+PACKAGES_append = " kernel-devicetree"
+FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
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
+
+do_compile_devicetree() {
+    DTBS=""
+	for dtb in ${KERNEL_DEVICETREE}; do
+		dtb=`normalize_dtb "${dtb}"`
+		DTBS="$DTBS $dtb"
+	done
+	oe_runmake -C ${B} ${PARALLEL_MAKE} ${DTBS}
+}
+addtask compile_devicetree after do_compile before do_install
+
+do_install_devicetree[dirs] = "${B}"
+do_install_devicetree[umask] = "022"
+fakeroot do_install_devicetree() {
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		DTB_EXT=${DTB##*.}
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
+		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
+		done
+	done
+}
+addtask install_devicetree after do_install before do_deploy
+
+do_deploy_append() {
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		DTB_EXT=${DTB##*.}
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
+		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
+			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
+			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
+			install -d ${DEPLOYDIR}
+			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
+			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
+			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
+		done
+	done
+}
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 02a5e961cb..0ad522d167 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -662,3 +662,6 @@ do_deploy[prefuncs] += "package_get_auto_pr"
 addtask deploy after do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
+
+# Add using Device Tree support
+inherit kernel-devicetree
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index ca92822d25..f1912775ca 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,65 +1,3 @@
-# Support for device tree generation
-FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
-
-python __anonymous () {
-    d.appendVar("PACKAGES", " kernel-devicetree")
-}
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
-
-do_compile_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		oe_runmake ${DTB}
-	done
-}
-
-do_install_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		DTB_EXT=${DTB##*.}
-		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
-		done
-	done
-}
-
-do_deploy_append() {
-	for DTB in ${KERNEL_DEVICETREE}; do
-		DTB=`normalize_dtb "${DTB}"`
-		DTB_EXT=${DTB##*.}
-		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
-			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			DTB_NAME=`echo ${base_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-			install -d ${DEPLOYDIR}
-			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
-			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
-			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
-		done
-	done
+python() {
+    bb.warn("You are using the linux-dtb.inc which is deprecated. You can safely remove it as the Device Tree support is automatically enabled when KERNEL_DEVICETREE is set.")
 }
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index aec06c2427..afd0e53bbb 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -54,7 +54,6 @@ LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
-require linux-dtb.inc
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
-- 
2.14.1


