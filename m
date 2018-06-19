Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id E9E68754A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 11:45:14 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id v13-v6so20197704wrp.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WPkTq6sYkQz5C31UMqbBj+wUhcaKfb8/dbYxmE06gS0=;
	b=USkmue7XgOWYsh3Z7hvD2SjvN511tKNMLNIy2eHZcber2b/V3is/bxX/lLTXhpc5IQ
	8aBknH2VRZCT5o+rA1NH6Mpx3OQJvxCb781zJr5DdGa91Lsr7gfaheG1bpRvkPSkSuFs
	nbdQLa2wPKshohpEWof/CwJimA1Ly8zVsFqy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WPkTq6sYkQz5C31UMqbBj+wUhcaKfb8/dbYxmE06gS0=;
	b=m7aQcH3Bu5L1ncLFpoUu5I04W15sT7FYRxppfDXyWmz/T8lS8JL7yzJgYR5Mcz4ii7
	QS9hKj+QyYv9C72bVg/O/8YomNfwpDhcp2PmIwyVmZwsBGuHdM/FIzyv7snpf0k/zPzE
	tlSVbPubGrsQxqW7/70LMiih5mBLDRkHBjgue3ckGpg+5P5pESTobS/OOSJlkzOwyjpX
	gGQPMY08xnNvplxu92Lzb+6rya2PNgN55/PIKFBovOt7X2Q2kD5FOhqdCOrLzbVT3dGh
	f8VU5jolK5YEYZpaJ6hgRJubEni0fyoqEyEzpCGfWRjLsF7MpNIvZfxPgLXs+Cg0divX
	PvxQ==
X-Gm-Message-State: APt69E0Oh8fuIQOiWPB0yREfxt2u4JLSDIUtiV+KGR9xZwkSjcCnIgIO
	5RbQMPsbY5pnK/9n+scJ9dnTTTxKAj8=
X-Google-Smtp-Source: ADUXVKLVjHcuYRoKvwOSgrnWqCOgS7cLaKx8hZZAIa/0TsCLR0S/qgwCa3VgOWnom5oOoPbUQwrXyg==
X-Received: by 2002:adf:e94e:: with SMTP id
	m14-v6mr13837077wrn.126.1529408715206; 
	Tue, 19 Jun 2018 04:45:15 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n18-v6sm22065902wrj.58.2018.06.19.04.45.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 04:45:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 12:45:11 +0100
Message-Id: <20180619114512.11699-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] image/image-live: Improve handling of live/iso/hddimg types (drop NOISO/NOHDD)
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
X-List-Received-Date: Tue, 19 Jun 2018 11:45:15 -0000

The logic can be improved and the historical NOISO/NOHDD variables
moved into the class and out of common code.

The variables are also then removed in favour of directly controlling
the behaviour from IMAGE_FSTYPES in line with all the other image types.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-live.bbclass        |  8 +++-----
 meta/classes/image.bbclass             | 11 +----------
 meta/conf/documentation.conf           |  2 --
 meta/conf/machine/include/x86-base.inc |  3 +--
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 966277c6785..942298a7ce3 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -19,8 +19,6 @@
 
 # External variables (also used by syslinux.bbclass)
 # ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
-# ${NOISO}  - skip building the ISO image if set to 1
-# ${NOHDD}  - skip building the HDD image if set to 1
 # ${HDDIMG_ID} - FAT image volume-id
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
@@ -80,8 +78,8 @@ populate_live() {
 }
 
 build_iso() {
-	# Only create an ISO if we have an INITRD and NOISO was not set
-	if [ -z "${INITRD}" ] || [ "${NOISO}" = "1" ]; then
+	# Only create an ISO if we have an INITRD and the live or iso image type was selected
+	if [ -z "${INITRD}" ] || [ "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso', '1', '0', d)}" != "1" ]; then
 		bbnote "ISO image will not be created."
 		return
 	fi
@@ -217,7 +215,7 @@ build_fat_img() {
 
 build_hddimg() {
 	# Create an HDD image
-	if [ "${NOHDD}" != "1" ] ; then
+	if [ "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live hddimg', '1', '0', d)}" = "1" ] ; then
 		populate_live ${HDDDIR}
 
 		if [ "${PCBIOS}" = "1" ]; then
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cc889cf5dfe..c4fc457985b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,18 +1,9 @@
-def build_live(d):
-    if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
-        d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
-        d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
-        if d.getVar('NOISO') == "0" or d.getVar('NOHDD') == "0":
-            return "image-live"
-        return ""
-    return "image-live"
-
 # Handle inherits of any of the image classes we need
 IMGCLASSES = "rootfs_${IMAGE_PKGTYPE} image_types ${IMAGE_CLASSES}"
 # Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
 # in the non-Linux SDK_OS case, such as mingw32
 IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
-IMGCLASSES += "${@build_live(d)}"
+IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
 IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
 IMGCLASSES += "image_types_wic"
 IMGCLASSES += "${@oe.utils.conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 254f8f19604..3189dd39b72 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -288,8 +288,6 @@ MULTIMACH_TARGET_SYS[doc] = "Separates files for different machines such that yo
 
 NATIVELSBSTRING[doc] = "A string identifying the host distribution."
 NO_RECOMMENDATIONS[doc] = "When set to '1', no recommended packages will be installed. Realize that some recommended packages might be required for certain system functionality, such as kernel-modules. It is up to the user to add packages to IMAGE_INSTALL as needed."
-NOHDD[doc] = "Causes the OpenEmbedded build system to skip building the .hddimg image."
-NOISO[doc] = "Causes the OpenEmbedded build system to skip building the ISO image."
 
 #O
 
diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index f8aacea64cc..0edcea7f561 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -10,8 +10,7 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"
 
-IMAGE_FSTYPES ?= "live"
-NOISO ?= "1"
+IMAGE_FSTYPES ?= "hddimg"
 
 KERNEL_IMAGETYPE ?= "bzImage"
 
-- 
2.17.1


