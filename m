Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E94477F69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:28:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d70so2227277qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=6fBSbsYOn3OkJMg24ghggw8X4LvFG6yPyfk8BLmCuR0=;
	b=GxoeT8ZfefdUze8IE52vbGkscHzlEbmIczvm64w1xIFNBWkBNIFlRdQLg8XS5inoyr
	yEfJJ21VFDXmC2lk9hiy9mBcLzWAl6SvvfBulJ2F3rXGeMRWcRzPWOqLkBkTsm+Iyagj
	tihAcR5p927KocpfcxUps/NDM+TBAfWYaSEM1Kz+h+hs/9IhrGnnyG9SYr6/5UzOypQ1
	C9SSQA372gko/F9eDJXkgef9zcA8FMq6Qia87mUdBeoUeMgH4F/s5Ub4dM7JJ3/XoU80
	ZKd0cEBYHiVd0ICMgwDEDeGYTA+anE3H6Mj2XIP3fJbrCZrGVKWGRloivtT8bvhuv6YT
	MAOA==
X-Gm-Message-State: AHPjjUixraz7d7rIcg5uzB0Olslzo8KqqJQLX03BEo/NJbWRf26agdbV
	0gNK1k1ahDl+6lgP
X-Google-Smtp-Source: ADKCNb4mYOfhDP9EjQhzNpLUdiowApOsZPWSKWPdVlb/aCb6KFj2oHhdlfLB5lw6rDcECBRBTLMVjg==
X-Received: by 10.233.232.13 with SMTP id a13mr5594736qkg.83.1504621721714;
	Tue, 05 Sep 2017 07:28:41 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id z20sm482512qta.38.2017.09.05.07.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:28:40 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:28:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:28:21 -0300
Message-Id: <20170905142822.17693-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905142822.17693-1-otavio@ossystems.com.br>
References: <20170905142822.17693-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 2/3] kernel: Move Device Tree support to kernel.bbclass
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
X-List-Received-Date: Tue, 05 Sep 2017 14:28:41 -0000

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

Changes in v5: None
Changes in v4:
- Rebase on top of 1/3

Changes in v3:
- rework compile and install to tasks
- improve commit log

Changes in v2:
- Wrong version as the changes were not staged. Sorry!

 meta/classes/kernel-devicetree.bbclass  | 68 +++++++++++++++++++++++++++++++++
 meta/classes/kernel.bbclass             |  4 ++
 meta/recipes-kernel/linux/linux-dtb.inc | 66 +-------------------------------
 3 files changed, 74 insertions(+), 64 deletions(-)
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
index 02a5e961cb..8c01e90709 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -662,3 +662,7 @@ do_deploy[prefuncs] += "package_get_auto_pr"
 addtask deploy after do_populate_sysroot do_packagedata
 
 EXPORT_FUNCTIONS do_deploy
+
+# If we are using Device Tree support, inherit the class to enable it
+KERNEL_DEVICETREE_CLASS = "${@['kernel-devicetree', ''][d.getVar('KERNEL_DEVICETREE', False) == None]}"
+inherit ${KERNEL_DEVICETREE_CLASS}
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
-- 
2.14.1


