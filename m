Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id A684579034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 01:11:13 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id y20-v6so12845862edq.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2018 18:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lCBptmNwgkhbxEqJtlMRKIwF4deD+/YnjDqYyH00fPA=;
	b=Ki48Deh/2+2UPijRVSbrevO6f4BLItlMRvi4DKguo0u5FJZZBMMBhCI5evG1cVkyWG
	8o22iWSc46tIRGOtUx60qiXE80Qw9QsACnXcnapJYT2qHxLY5g00KsQCMHIq5EqFU5lt
	/vITI2Y7QoXQcy4cZx0K1gSDOcgpn6pWU9BZcQbXEUeuthlzW3hCf8GR9GtSP3PLRKpK
	VUfB4IvUTVFmY6P4V64iGTR7ZY+7TF9M1Jon//rwqvAmuIUuYOUQCV9zTSgzJmpPBBoM
	Zb8rO07COkCnCKrA3iNPfM+6zqKONF4kFTqR8R9k5iHex7GcOaOICAq3b9Fc9FGeoD6Q
	F/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lCBptmNwgkhbxEqJtlMRKIwF4deD+/YnjDqYyH00fPA=;
	b=B++Kc2y3QRUzXQvJ+iOu00AHTwZnQEfqWaNWVrNtx04CZHMr5ZHXy/0L/Me/hXzxjy
	w/bBBBziJkEJfI+GhXQkMOG/KoTn5tSrasZix59y5epvgQVUDWANscQW6B0UDuUP5tCE
	2Iwijs0PhgUxLV9Cljy47mW2HvbTVQoH0RE/KllSwCVOpibG/PMvKPWzQjNFd7E5VRfz
	0nWIFXx8O3WcveXWwT02dv1DbxjkQONncXwmCyRuB4Q1lbx9oxOPe6fzTqLQJgu4H3pn
	vQj/8oQ0w/d2x7yMMkGbwliZ+Y2uS9FxOijkyrRdlvgAdKglxWiSTcmgqylq2l9+71Ze
	4qtQ==
X-Gm-Message-State: APzg51Dx9nQJZ1t86MksssnMvK3CcaNkVoknpsMZ53f0Ma5dfllHVt9X
	4pE8C1j/7gHzTn7k8+LObsI23eukzHeqZQ==
X-Google-Smtp-Source: ANB0VdbsMyrj8ZayKbnuAMk/c0Phdokd/UJ7vBXgPaJw6kBVzIctnIZ3rFp5kVX9DU/9EPcGlSbR5A==
X-Received: by 2002:a50:bc03:: with SMTP id
	j3-v6mr29471102edh.34.1535937074141; 
	Sun, 02 Sep 2018 18:11:14 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	g54-v6sm8306251edb.47.2018.09.02.18.11.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 18:11:13 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2018 03:10:40 +0200
Message-Id: <1535937040-10025-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Cc: Walter Goossens <waltergoossens@creative-embedded.com>
Subject: [openembedded-core][PATCH] kernel-fitimage.bbclass: Handle bundled initramfs case correctly.
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
X-List-Received-Date: Mon, 03 Sep 2018 01:11:14 -0000

From: Walter Goossens <waltergoossens@creative-embedded.com>

If INITRAMFS_IMAGE was set, but also INITRAMFS_BUNDLE = 1, then
the kernel image already has the initramfs bundled inside. In that
case do not pack the initramfs inside the FIT (again).

(The fitImage name does keep the suffix INITRAMFS_IMAGE for all
initramfs cases.)

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel-fitimage.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 16499c8..6d02d74 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -443,7 +443,9 @@ addtask assemble_fitimage before do_install after do_compile
 
 do_assemble_fitimage_initramfs() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
-		test -n "${INITRAMFS_IMAGE}" ; then
+		test -n "${INITRAMFS_IMAGE}" && \
+		test ! -n "${INITRAMFS_IMAGE_BUNDLE}"; then
+
 		cd ${B}
 		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
 	fi
@@ -451,6 +453,18 @@ do_assemble_fitimage_initramfs() {
 
 addtask assemble_fitimage_initramfs before do_deploy after do_install
 
+do_assemble_fitimage_bundled_initramfs() {
+	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage" && \
+		test -n "${INITRAMFS_IMAGE}" && \
+		test -n "${INITRAMFS_IMAGE_BUNDLE}"; then
+
+		cd ${B}
+		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE}
+	fi
+}
+
+addtask assemble_fitimage_bundled_initramfs before do_deploy after do_bundle_initramfs
+
 
 kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
-- 
2.7.4


