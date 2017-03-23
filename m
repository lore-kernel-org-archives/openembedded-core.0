Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A8F4977B27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:12:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z133so16256139wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FmUeBGNIuTCHkT0J8df4x75UNvoHfJ9BcBaF3IsXyY4=;
	b=m5LIOB6mxpZMLzh43DjNA+YsT5aqy5AB72irTMuumpk0gvcoBTlHyVsjjkff9dQ22b
	uiEFVrQdGuQcHPx2z/bhXbq7o/vcOSXEMX9iE5eOapvYhtP9McD9N/OE/AqIouBPUsAZ
	dzy9AdUKEO6p2gX8fTUaPy8n/g88KPhDgaH+tjknNCRmYHHHn8maHx0jvMT40J9lfnRd
	yffYUIKZS524NcbmnDdC0x4uqZAEWKeDjhpVBd657qXMQed6wTVft6QN8Cp2xiJeqYfv
	KQFaXaHbKZMximGaR2FQZoGdNMxiU0SLBpcWxZTs+iup4R/r+8IOFGG7mz006R1cSKLe
	CKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FmUeBGNIuTCHkT0J8df4x75UNvoHfJ9BcBaF3IsXyY4=;
	b=hXqfHjEOH8rrxuTVqWBR6aj64zl7t/8DCokLtnP8F21MVdINQufRCdoSdpjyO/85s4
	xPRketXczSAhj/imf+RxqrssbFzzGjQq3MNn44goFFqwo20vdpMcCTyPRAFFWK/6apA8
	Z0SIbrf8NNpMfutTupweoN1EdFep+1mHh9iBIxjr9MChiYPQAw66ohJ5k8drVDsVjbfr
	Oa7+5WhNFfQ13we+7HcDJm2Lx+5BzjHKLixTKmmKtG53dmA9Grg5qrVq/t1BpEooH1FZ
	+NhIXcN2We8F9EJ0D9vJ27Z1EeV6nqHBGoK4dPHaETzbcISmQJ2c+dClezM7x4gg+t2k
	EFhQ==
X-Gm-Message-State: AFeK/H1Ol95B0l00yXb0NGsJU8veYjylM8O1mOxd3bAzA8GeWYeNgWRHWO5QRX1Z+AcSuQ==
X-Received: by 10.28.194.7 with SMTP id s7mr2569249wmf.34.1490271126770;
	Thu, 23 Mar 2017 05:12:06 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.217.162]) by smtp.gmail.com with ESMTPSA id
	k190sm4093773wmg.10.2017.03.23.05.12.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 05:12:06 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:11:15 +0100
Message-Id: <1490271075-3490-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
References: <1490271075-3490-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V4 4/4] kernel-initramfs: add recipe
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
X-List-Received-Date: Thu, 23 Mar 2017 12:12:06 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To implement initramfs bundled kernel packaging.

The kernel images are copied from DEPLOY_DIR_IMAGE, and a list of
packages will be generated according to KERNEL_IMAGETYPES setting.

For instance:
For KERNEL_IMAGETYPES = "bzImage vmlinux"

the generated packages would be:
- kernel-initramfs (Base package, RDEPENDS on kernel-initramfs-image)
- kernel-initramfs-image (Image package, RDEPENDS on all sub images)
- kernel-initramfs-image-bzimage (Contains bzImage image)
- kernel-initramfs-image-vmlinux (Contains vmlinux image)

This recipe would be skipped if INITRAMFS_IMAGE_BUNDLE or
INITRAMFS_IMAGE is not being set correctly.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-kernel/linux/kernel-initramfs.bb | 100 ++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb

diff --git a/meta/recipes-kernel/linux/kernel-initramfs.bb b/meta/recipes-kernel/linux/kernel-initramfs.bb
new file mode 100644
index 0000000..91ea55e
--- /dev/null
+++ b/meta/recipes-kernel/linux/kernel-initramfs.bb
@@ -0,0 +1,100 @@
+SUMMARY = "Initramfs bundled kernel images"
+DESCRIPTION = "When built, it packages initramfs bundled kernel images of the \
+preferred virtual/kernel provider."
+SECTION = "kernel"
+LICENSE = "GPLv2"
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
+KERNEL_ALT_IMAGETYPE ??= ""
+KERNEL_IMAGETYPES_append = " vmlinux"
+KERNEL_IMAGETYPE ?= "zImage"
+KERNEL_IMAGEDEST ?= "boot"
+KERNEL_VERSION = "${@['1.0.0', get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}')][get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') != None]}"
+KERNEL_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
+KERNEL_PRIORITY ?= "${@int(d.getVar('KERNEL_VERSION').split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
+                       int(d.getVar('KERNEL_VERSION').split('-')[0].split('+')[0].split('.')[1]) * 100 + \
+                       int(d.getVar('KERNEL_VERSION').split('-')[0].split('+')[0].split('.')[-1])}"
+
+PACKAGES = "${PN} ${PN}-image"
+
+FILES_${PN} = ""
+FILES_${PN}-image = ""
+RDEPENDS_${PN} = "${PN}-image"
+PKG_${PN} = "${PN}-${KERNEL_PKG_NAME}"
+PKG_${PN}-image = "${PN}-image-${KERNEL_PKG_NAME}"
+RPROVIDES_${PN} += "${PN}-${KERNEL_VERSION}"
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-image = "1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PACKAGES_DYNAMIC = "^kernel-initramfs-image-.*"
+
+python __anonymous () {
+    # Skip processing of this recipe if INITRAMFS_IMAGE or INITRAMFS_IMAGE_BUNDLE
+    # is not set correctly, to avoid generating only empty packages which makes
+    # no sense.
+    if not d.getVar('INITRAMFS_IMAGE') or d.getVar('INITRAMFS_IMAGE_BUNDLE') != '1':
+        raise bb.parse.SkipPackage("Set INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it")
+
+    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
+    types = set((d.getVar('KERNEL_IMAGETYPES') or "").split())
+    types.add(d.getVar('KERNEL_IMAGETYPE') or "")
+    types.add(d.getVar('KERNEL_ALT_IMAGETYPE') or "")
+    types = ' '.join(sorted(types)).strip()
+    d.setVar('KERNEL_IMAGETYPES', types)
+
+    for type in types.split():
+        pn = d.getVar('PN')
+        imagedest = d.getVar('KERNEL_IMAGEDEST')
+        if type == "vmlinux":
+            typelower = type.lower()
+        else:
+            typelower = "image-%s" % type.lower()
+
+        d.appendVar('PACKAGES', ' %s-%s' % (pn, typelower))
+        if type != 'vmlinux' or 'vmlinux' in (d.getVar('KERNEL_IMAGETYPE') or ""):
+            d.appendVar('RDEPENDS_%s-image' % pn, ' %s-%s' % (pn, typelower))
+
+        d.setVar('FILES_%s-%s' % (pn, typelower), '/%s/%s-initramfs-${KERNEL_VERSION}' % (imagedest, type))
+        d.setVar('PKG_%s-%s' % ( pn, typelower), '%s-%s-${KERNEL_PKG_NAME}' % (pn, typelower))
+
+        priority = d.getVar('KERNEL_PRIORITY')
+        postinst = '#!/bin/sh\nupdate-alternatives --install /%s/%s-initramfs %s-initramfs %s-initramfs-${KERNEL_VERSION} %s || true\n' % (imagedest, type, type, type, priority)
+        d.setVar('pkg_postinst_%s-%s' % (pn, typelower), postinst)
+
+        postrm = '#!/bin/sh\nupdate-alternatives --remove %s-initramfs %s-initramfs-${KERNEL_VERSION} || true\n' % (type, type)
+        d.setVar('pkg_postrm_%s-%s' % (pn, typelower), postrm)
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
+		echo "Copying initramfs bundled kernel images from ${DEPLOY_DIR_IMAGE}..."
+		install -d ${D}/${KERNEL_IMAGEDEST}
+		for type in ${KERNEL_IMAGETYPES}; do
+			echo "Copying initramfs bundled kernel image: $type-initramfs-${MACHINE}.bin"
+			install -m 0644 ${DEPLOY_DIR_IMAGE}/$type-initramfs-${MACHINE}.bin ${D}/${KERNEL_IMAGEDEST}/$type-initramfs-${KERNEL_VERSION}
+		done
+	fi
+}
-- 
2.7.4


