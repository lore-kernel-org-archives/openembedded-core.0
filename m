Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04E56784A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 20:36:19 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id i14so7856686qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=QaoG1fxA6gSSu4TWUmo4aFmsMg4fB5Zx4YTCE14R+Hc=;
	b=l1Fv4VZJPRUld5h3VqbizqfNNRS16NML+/sbEUOIMG/UJsdaLxAv5ploh1gp7n7sEN
	tmPW9Y2RtFJsxtI/GX5AsQG+FakAufARMORofl872EYs6K4TS0VwGXGzIkn5yB9syQs3
	VyzfWao5a1u+1bZ3tQJKEy/TIeBnrsNK+CpUZg3J33tnbco6pSzzq3AfYiB5ra5H2HHM
	2Nhp6BJ2r1iculNqb94atIkr6RoK2Me8C2oalk+lwq6vCPHq8abHD5MgZYiKeIBlx1Lc
	/zsiwkvNUOnBPI3dF9eROsYgrQ7YQ9noRnpWLwT6DQNx98GA2UlgyFtX9Ra8BfRtR1my
	vHDw==
X-Gm-Message-State: AHPjjUi9U20yBPiMOJ+bWOU59jcOo2zooFnjsoI/BNBAYylQVcoKdC+b
	NS7ToC0KCvavVPAm
X-Google-Smtp-Source: AOwi7QCIEY776VgNDsuiKSvjcLFXcdz4KTz/cj2AY6H3kALyrubFYwr2wGwbetZBGD4uJloUnYQxdg==
X-Received: by 10.55.22.104 with SMTP id g101mr21315703qkh.306.1505248580709; 
	Tue, 12 Sep 2017 13:36:20 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	o38sm8731216qko.33.2017.09.12.13.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 13:36:19 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 17:36:10 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 17:36:06 -0300
Message-Id: <20170912203608.14327-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 1/3] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Tue, 12 Sep 2017 20:36:20 -0000

The Device Tree is commonly used but it is still kept as a .inc file
instead of a proper class. Instead now we move the Device Tree code to
a kernel-devicetree class and automatically enable it when the
KERNEL_DEVICETREE variable is set.

To avoid breakage in existing layers, we kept a linux-dtb.inc file
which raises a warning telling the user about the change so in next
release this can be removed.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7:
- Avoid changing logic when reworking to a class

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

 meta/classes/kernel-devicetree.bbclass    | 62 +++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass               |  3 ++
 meta/recipes-kernel/linux/linux-dtb.inc   | 66 +------------------------------
 meta/recipes-kernel/linux/linux-yocto.inc |  1 -
 4 files changed, 67 insertions(+), 65 deletions(-)
 create mode 100644 meta/classes/kernel-devicetree.bbclass

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
new file mode 100644
index 0000000000..72814ca224
--- /dev/null
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -0,0 +1,62 @@
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
+do_compile_append() {
+	for DTB in ${KERNEL_DEVICETREE}; do
+		DTB=`normalize_dtb "${DTB}"`
+		oe_runmake ${DTB}
+	done
+}
+
+do_install_append() {
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
index 1b8ffd0c17..9c1f61be75 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -54,7 +54,6 @@ LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 # Pick up shared functions
 inherit kernel
 inherit kernel-yocto
-require linux-dtb.inc
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
-- 
2.14.1


