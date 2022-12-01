Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FEAC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:25:52 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.46692.1669908346922220572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MFT0pDe0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id q12so2155261pfn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5U/KEeTxFxmK/sYb0ng2XDh1Q4iHbyOwF8fdiiY78I=;
        b=MFT0pDe0gGYae1IlM/Q7SrqcS+4eLrCZhB5DXcxBEjwrh132iIDNY1RUWYsBmzGkcS
         MczIUkD1YMPd7XsIc46bPGMEHFM/+GnVK72PT+EFtCP3T1r6T8/VwwlDSK2Dh+QkJ28U
         QA6PVaayYqqtucmbckPs+lDFQx07/Nbx7jTbwJhlMzZoH/i8U0FmGzDkJ7i39xtmYtXy
         2nFgsDrS3IZkiIAhO8qfwr9yOOtG5CPhb7etg1zVqQ2MYhYHPEc4T+gUcDSqdONWs3vQ
         LHkU2gjei31ZhZIYwP8+3DY5cCOJFJxifIdkoJ8k2nO1vg0IWmkIiHsiI7Vdv5wbmW9U
         3CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5U/KEeTxFxmK/sYb0ng2XDh1Q4iHbyOwF8fdiiY78I=;
        b=VGvWh/OSIKSUme4Du5vUZOWRFSMFNxD6KPFBRs5Ws77xEHeJ8MMqMoNXaJSMgaGiKT
         B0aSLdaniMBWAlIqviBcOBapnnpKycEgeNiwfDkEuNr3DjkUUhUrvqPEpZhtPR5GhivQ
         fnM9zK+rOKp+anwP7B3OtMP+mLqpVSLEM9Y+xLYACRuzVDJhrIELdEAj5dDm4HEHi2nX
         FK2bkcGFLNGepPo+TCrWHX+WLX2iRVMxu4ihQgBOFKH4X/imE5oiYXt/rw+RAQgNYLmG
         X9tfHMZplKKBlwh/W6qlHd704q0eBN+uynX3RLFnTAQE7FQeqfL5CRBc67Xa4/zh3Q9N
         UNeg==
X-Gm-Message-State: ANoB5pnzDUp6UEnTZsHfcBNUw+19+XmN7dG1EZCJ1igZ4wNManX+k9lK
	DTwCERAF/qXVB6cHYsecR7T/wIiNlpHxKyLNong=
X-Google-Smtp-Source: AA0mqf5fCpffNsorJh974izO9ByOQkDQXAk8zPOZuIMKFXsXxWwAy2IKqEI4mElh4qYfnkb0oGq1IA==
X-Received: by 2002:a65:5601:0:b0:43c:4eef:bac7 with SMTP id l1-20020a655601000000b0043c4eefbac7mr42009849pgs.356.1669908345808;
        Thu, 01 Dec 2022 07:25:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id jc18-20020a17090325d200b001891a17bd93sm3812769plb.43.2022.12.01.07.25.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:25:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] kernel: improve transformation from KERNEL_IMAGETYPE_FOR_MAKE
Date: Thu,  1 Dec 2022 05:25:20 -1000
Message-Id: <8e6e5d8a9f0cb26caa109bd49f2165313de7ae8f.1669908167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669908167.git.steve@sakoman.com>
References: <cover.1669908167.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174119

From: Mike Crowe <mac@mcrowe.com>

In 526bdd88ccd758204452579333ba188e29270bde the imageType loop in
kernel_do_deploy was changed to use KERNEL_IMAGETYPE_FOR_MAKE rather
than KERNEL_IMAGETYPES. This broke the special handling for fitImage
immediately below because KERNEL_IMAGETYPE_FOR_MAKE never contains
fitImage.

It has always been my understanding that KERNEL_IMAGETYPE_FOR_MAKE
controlled what was passed to make, but KERNEL_IMAGETYPE controlled what
was installed/deployed. When the two are different then it's the
responsibility of whoever set KERNEL_IMAGETYPE_FOR_MAKE to ensure that
whatever comes out of the kernel build system has been transformed in to
the requested form by the time of installation. This is what happens for
kernel.bbclass's own support for vmlinux.gz.

I think this means that for KERNEL_IMAGETYPE vmlinux.gz, kernel.bbclass
is responsible for generating vmlinux.gz.initramfs[1] so that
kernel_do_deploy can deploy it. This means that the change in
526bdd88ccd758204452579333ba188e29270bde can be reverted, fixing
KERNEL_IMAGETYPE = "fitImage".

In addition, it ought to be possible for recipes and other classes that
use kernel.bbclass to hook into this mechanism by setting
KERNEL_IMAGETYPE_FOR_MAKE and performing their own transformations.

do_bundle_initramfs calls kernel_do_compile and we don't want it to
transform vmlinux to vmlinux.gz at that point, since it will fight
against the careful renaming and preserving that do_bundle_initramfs
does. Let's separate the transformation out of kernel_do_compile to a
new do_transform_kernel task that can be run at the right time. This
means that it's also logical to perform the equivalent translation for
the kernel with the initramfs in a separate
do_transform_bundled_initramfs task too.

This leaves two clear customisation points for recipes and other classes
to hook into the process and perform their transformations:
do_transform_kernel and do_transform_bundled_initramfs.

(I care about this because our recipes that use kernel.bbclass also set
KERNEL_IMAGETYPE_FOR_MAKE and transform vmlinux into a form suitable for
our bootloader after do_compile and do_bundle_initramfs into the format
matching KERNEL_IMAGETYPE. I'm unable to successfully bundle an
initramfs after 526bdd88ccd758204452579333ba188e29270bde, but I didn't
want to just revert that change to reintroduce the bug that it was
fixing.)

I can't say that I'm entirely happy with this change, but I'm unsure
what to do to improve it. I find the way that both the bare kernel and
the one with the initramfs both get deployed to be confusing, and a
waste of build time. I would like to not actually generate a publishable
kernel image at all during do_compile when an initramfs is in use, but I
suspect that this would affect valid use cases that I'm not aware of.

Signed-off-by: Mike Crowe <mac@mcrowe.com>

[1] It could be argued that this should be vmlinux.initramfs.gz, but
that would require another special case in kernel_do_deploy and the
filename is only visible within this class and the recipes that use it
anyway.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 10a4a132e87e835726bf5da81a60f6f509b90765)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2a3cb21fc0..a965e187e4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -75,7 +75,7 @@ python __anonymous () {
     # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
     # by the kernel build system and types which are created by post-processing
     # the output of the kernel build system (e.g. compressing vmlinux ->
-    # vmlinux.gz in kernel_do_compile()).
+    # vmlinux.gz in kernel_do_transform_kernel()).
     # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supported
     # directly by the kernel build system.
     if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
@@ -106,6 +106,8 @@ python __anonymous () {
     # standalone for use by wic and other tools.
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+        bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
@@ -280,6 +282,14 @@ do_bundle_initramfs () {
 }
 do_bundle_initramfs[dirs] = "${B}"
 
+kernel_do_transform_bundled_initramfs() {
+        # vmlinux.gz is not built by kernel
+	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
+		gzip -9cn < ${KERNEL_OUTPUT_DIR}/vmlinux.initramfs > ${KERNEL_OUTPUT_DIR}/vmlinux.gz.initramfs
+        fi
+}
+do_transform_bundled_initramfs[dirs] = "${B}"
+
 python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
@@ -329,12 +339,17 @@ kernel_do_compile() {
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${typeformake} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 	done
+}
+
+kernel_do_transform_kernel() {
 	# vmlinux.gz is not built by kernel
 	if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
 		mkdir -p "${KERNEL_OUTPUT_DIR}"
 		gzip -9cn < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
 	fi
 }
+do_transform_kernel[dirs] = "${B}"
+addtask transform_kernel after do_compile before do_install
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -576,7 +591,7 @@ inherit cml1
 
 KCONFIG_CONFIG_COMMAND_append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
-EXPORT_FUNCTIONS do_compile do_install do_configure
+EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
@@ -721,7 +736,7 @@ kernel_do_deploy() {
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+		for imageType in ${KERNEL_IMAGETYPES} ; do
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-- 
2.25.1


