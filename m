Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 90AAB7316A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 21:20:36 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id sv6so113506345lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 13:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IdkkaosXYHlQUG3cPQU1vPZPueX1MZHTzrgnL5X7QpU=;
	b=Ua7PSVpkLt4/OxpCQJGhcDQoMC0NfAzm2tSHSIF0CUUSs75oT3CA1hWWNfHCY4jYVx
	0dTfaNPu1cOwRmgq8NhsX86vYN4weO+dnj9S4S8Gb25sKNs69uJo5nud2WGfcqixjNyg
	0ItQHrFn84+vjwlff19M8IKcgqtpQCzvpN1hLwfYYi0kMf/LGGaZyaVj0OoIn1oG2t3x
	U75cfUdw+E6clWS/5eH5fW5DiVRYVOkXkm6nLf+DTNFzC9CZwdUd7QKI8BQMD7RdHxlq
	LMMmeVQ/2zJHUABFbUxQMrg14mHBmG4E80qwFGh5XseAMUps2JDCw86KlQatkYdR0sek
	lGnw==
X-Received: by 10.112.172.130 with SMTP id bc2mr23391564lbc.132.1451510436714; 
	Wed, 30 Dec 2015 13:20:36 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	h82sm12247544lfh.27.2015.12.30.13.20.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Dec 2015 13:20:36 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 22:20:00 +0100
Message-Id: <1451510400-7446-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
References: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
Cc: bruce.ashfield@windriver.com, yue.tao@windriver.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V1 3/3] kernel-initramfs: new recipe, creates initramfs bundled kernel packaging
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
X-List-Received-Date: Wed, 30 Dec 2015 21:20:37 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

So far, there is not a workable way to package the initramfs bundled kernel
image, the only place is tmp/deploy from where we could get it, but if a
user want to add it into a certain image, there is no guarantee that he
will achieve it because a explicit dependency is missing between package
and bundle_initramfs, and this was designed to avoid introducing circular
dependencies when using kernel modules in the initramfs image.bb that is
caused by kernel.bbclass trying to build the initramfs before the kernel
packaging.

To fix this problem, the idea is to split the initramfs bundled kernel
packaging to a new recipe, make the do_install depend on kernel's deploy
task, then with the following config:

IMAGE_INSTALL_append = " kernel-initramfs"

The initramfs bundled kernel could be added to the image without
introducing any circular dependencies.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-kernel/linux/kernel-initramfs.bb | 69 +++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

diff --git a/meta/recipes-kernel/linux/kernel-initramfs.bb b/meta/recipes-kernel/linux/kernel-initramfs.bb
new file mode 100644
index 0000000..7f9d72b
--- /dev/null
+++ b/meta/recipes-kernel/linux/kernel-initramfs.bb
@@ -0,0 +1,69 @@
+SUMMARY = "Initramfs bundled kernel image"
+DESCRIPTION = "When built, it packages a initramfs bundled kernel image of the \
+preferred virtual/kernel provider."
+
+SECTION = "kernel"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "[file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6]file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+
+inherit linux-kernel-base
+
+# Whilst not a module, this ensures we don't get multilib extended. (which would make no sense)
+inherit module-base
+
+S = "${STAGING_KERNEL_DIR}"
+B = "${WORKDIR}/build"
+
+# we dont need the default dependencies.
+INHIBIT_DEFAULT_DEPS = "1"
+
+KERNEL_IMAGETYPE ?= "zImage"
+KERNEL_VERSION = "${@get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}')}"
+KERNEL_IMAGEDEST = "boot"
+
+KERNEL_PRIORITY ?= "${@int(d.getVar('KERNEL_VERSION',1).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('KERNEL_VERSION',1).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('KERNEL_VERSION',1).split('-')[0].split('+')[0].split('.')[-1])}"
+
+PACKAGES = "${PN}"
+FILES_${PN} = "/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}*"
+
+PKG_${PN} = "${PN}-${@legitimize_package_name('${KERNEL_VERSION}')}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Skip processing of this recipe if INITRAMFS_IMAGE or INITRAMFS_IMAGE_BUNDLE
+# is not set correctly, to avoid generate a single empty package which makes
+# no sense.
+python __anonymous () {
+    if not d.getVar('INITRAMFS_IMAGE', True) or d.getVar('INITRAMFS_IMAGE_BUNDLE', True) != '1':
+        raise bb.parse.SkipPackage("Set INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it")
+}
+
+# Need the output of deploy.
+do_install[depends] += "virtual/kernel:do_deploy"
+
+# We only need the packaging tasks - disable the rest
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
+
+do_install() {
+	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+		echo "Copying initramfs bundled kernel image from ${DEPLOY_DIR_IMAGE}..."
+		install -d ${D}/${KERNEL_IMAGEDEST}
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-initramfs-${KERNEL_VERSION}
+	fi
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-initramfs ${KERNEL_IMAGETYPE}-initramfs /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-initramfs-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+}
+
+pkg_postrm_${PN} () {
+	update-alternatives --remove ${KERNEL_IMAGETYPE}-initramfs ${KERNEL_IMAGETYPE}-initramfs-${KERNEL_VERSION} || true
+}
-- 
1.9.1


