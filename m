Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id D6FE46FF23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 06:40:38 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id j99so1501477lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 22:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rrKLjwvBchQJauOnAU9REhKaaJRBDwIA2hZ7A6NyyBU=;
	b=N9mFl2XAVRLDYuDGOGm39XuE8y+Wg8Ipt4u2fE3jiE37/iBz7UsxT7mh/Mwt87Ayeq
	xLW19Bxkr9OuZXxNsSQF26iVOWgZFwmEzxluKvgKSE/k3wONRMjqWqnIb1uOB0N9uGnw
	0X3DonHGszu/bprGegisKS7he+o8V7E7BdVZ59DPL/B2pnMpVT8ebCDGdeUBoFz7m/cD
	DwQa7866PTxb1X2jCq2kYjrIQy64aIGr41HUNaD+5x4BnUU8zXj51HQ2NCHzFSq0zelb
	WYC4i6sI9hAXapJuxCQ8biSSNIhFr7Vkds7QY4duRZESBKZ5kd2aUO7uIrq9OGaaft6P
	QUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rrKLjwvBchQJauOnAU9REhKaaJRBDwIA2hZ7A6NyyBU=;
	b=MGTy0nGwGldiw50op2QseMgD9tzcgqjFW0PHr+5EHXxNgPhdUBZ6kutgd3/5x/+HkE
	mD6L0s2tn5zHinFXDuK+GbVotvDuBz7khwP5xMsyv9ySkhCzp9iN4FeOHrNm+rSXLiei
	9/XUgyF+nOk0a5XqmvUqD6qfcIvhFFep1q8dwNlorDo9ZwDl47uIsYajdbYL1qPX2WKF
	PsYkxUFOLXeTRM3tWq16Y+5EtV3T0r7jyP2c470BzVyPEr/Sk/8W7J7FHLYMijTNigeI
	B9cIFZIg60cMetC1Z1TKYfMPx6EIxBi8U4YrFfkNkr/3fJuE/TcTWd7gdqRUKqrFIOiJ
	y+1A==
X-Gm-Message-State: AG10YOSnmY4y9ARAk+PTAZmFbZA+qzkV7sXGodnjEEyINJxMjiiRh5gryuk6KfE7DUnyPA==
X-Received: by 10.25.28.134 with SMTP id c128mr2219185lfc.95.1454049639140;
	Thu, 28 Jan 2016 22:40:39 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	mj4sm1874949lbc.19.2016.01.28.22.40.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Jan 2016 22:40:38 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 07:40:19 +0100
Message-Id: <1454049619-22703-4-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
References: <1454049619-22703-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	bruce.ashfield@windriver.com, darren@dvhart.com
Subject: [PATCH V3 3/3] kernel-initramfs: new recipe, creates initramfs bundled kernel packaging
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
X-List-Received-Date: Fri, 29 Jan 2016 06:40:41 -0000

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
index 0000000..49d539f
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
+KERNEL_IMAGEDEST = "boot"
+KERNEL_VERSION = "${@['1.0.0', get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}')][get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') != None]}"
+
+KERNEL_PRIORITY ?= "${@int(d.getVar('KERNEL_VERSION', True).split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('KERNEL_VERSION', True).split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('KERNEL_VERSION', True).split('-')[0].split('+')[0].split('.')[-1])}"
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


