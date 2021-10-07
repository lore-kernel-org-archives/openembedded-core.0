Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40BDC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:18:11 +0000 (UTC)
Received: from avasout04.plus.net (avasout04.plus.net [212.159.14.19])
 by mx.groups.io with SMTP id smtpd.web09.11508.1633612688429957007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=LO24ouRd;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.19, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id YTHgmM2ok8YYhYTHhm69rD; Thu, 07 Oct 2021 14:18:06 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=PtkIkzE3 c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=8gfv0ekSlNoA:10 a=-An2I_7KAAAA:8 a=24MhaHH-nxbqBxyQ7i4A:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=D7zdoWHlvtGYb5OuynEzgz+MuLJediXFF+qMcJjINgw=; b=LO
	24ouRdXeTq83RZD3Rsa2Oqxc+lMjDwOvAmp6S/30rJXm6czum946RP59flfhSgxgsHo1C5R0Hv8gi
	PaxXRmLQSIYtEO9AoeB9m1ggt0SnwrEn586o37jPB9RstWPRvgeDYN0ie2wzYE189l5coHRboTsJM
	XOTonLNj3tbE8UHVdDOODysNFVq29L2JeFxp0hh0xBNxbJQMThw5yJP2BYTmyRyRMU5WaXc7OEbKC
	O7owp1UNtV0s6xZ+TW1njxNWwZBoC9a4KfGxDMdzyownFP8sCPSDm4PDWB2mbo+tN5G+xtgwoarjz
	pcv0RgO0n4vE5+fnTMnDS9mmhZynxwsQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mYTHf-007f4j-Ah; Thu, 07 Oct 2021 14:18:03 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] [RFC] kernel: improve transformation from
 KERNEL_IMAGETYPE_FOR_MAKE
Date: Thu,  7 Oct 2021 14:17:57 +0100
Message-Id: <20211007131757.1943461-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4wfAGkoTdL5oLyHbLQF8UPsKIgRbsJ90yJqnz1CmfLYXGpxlNwB7Pja+4ILOFjKmIceo4MDTkS2x6OzQoBl5B0xct5cFbtDZVPdov1MExVz9eRl91BFe3J
 lTFp8u8miyx6Cq7JJ4j62GqDY6d5CxaqD/GtgncJOIHL5D5B1I+r43g2exqLV8tJSjyeeGyiHddW2A==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 13:18:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156721

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
---
 meta/classes/kernel.bbclass | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4acec1877e..a91d248801 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -77,7 +77,7 @@ python __anonymous () {
     # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
     # by the kernel build system and types which are created by post-processing
     # the output of the kernel build system (e.g. compressing vmlinux ->
-    # vmlinux.gz in kernel_do_compile()).
+    # vmlinux.gz in kernel_do_transform_kernel()).
     # KERNEL_IMAGETYPE_FOR_MAKE should contain only image types supported
     # directly by the kernel build system.
     if not d.getVar('KERNEL_IMAGETYPE_FOR_MAKE'):
@@ -134,6 +134,8 @@ set -e
     # standalone for use by wic and other tools.
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+    if image and bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
+        bb.build.addtask('do_transform_bundled_initramfs', 'do_deploy', 'do_bundle_initramfs', d)
 
     # NOTE: setting INITRAMFS_TASK is for backward compatibility
     #       The preferred method is to set INITRAMFS_IMAGE, because
@@ -316,6 +318,14 @@ do_bundle_initramfs () {
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
 python do_devshell:prepend () {
     os.environ["LDFLAGS"] = ''
 }
@@ -355,12 +365,17 @@ kernel_do_compile() {
 	for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
 		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
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
@@ -612,7 +627,7 @@ inherit cml1
 
 KCONFIG_CONFIG_COMMAND:append = " LD='${KERNEL_LD}' HOSTLDFLAGS='${BUILD_LDFLAGS}'"
 
-EXPORT_FUNCTIONS do_compile do_install do_configure
+EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
@@ -763,7 +778,7 @@ kernel_do_deploy() {
 	fi
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
-		for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
+		for imageType in ${KERNEL_IMAGETYPES} ; do
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-- 
2.30.2


