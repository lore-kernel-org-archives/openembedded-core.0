Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3A873182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 00:13:04 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id e126so202335729ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 16:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tFVZTKvUplog4WvnGOCgFNkgkMEbeAjI3mnMrkviuIw=;
	b=pPub+cpzS4ALPBZ8hngHul/pj3ql8iILuvlEnmA69oNNrcIa8aqxvFOUVa929Symn7
	/z3oS2vrHWrl9D1xshxndyQpoxoxKFvHhXmeWzZ0KqkMYRh+AURjh3sE8b68KT7zAq2o
	yiBt3z7wlp+z4Pb9FGQ8HbtrlFE+mDl1rw3cJEfHZuN9EYCf7b4uufLE4mKiwr5Aumyc
	adso82LhpLMpblbw2Pv1Tlp8RQqLp/tGFkxEtz0zaOv19+kUE5JwSmpkvFBStNmBIYTn
	rbDgTkisy29C1z0WXj0bGsehIZ9YawE0yqSJH7wfsKWpjxlBD2X+F/xvIaAMc0pa2tW9
	LFXw==
X-Received: by 10.107.17.92 with SMTP id z89mr32366624ioi.97.1450829585846;
	Tue, 22 Dec 2015 16:13:05 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	l21sm15032468ioe.21.2015.12.22.16.13.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 16:13:04 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:12:53 -0800
Message-Id: <1450829573-777-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
References: <1450829573-777-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] kernel-yocto.bbclass: move do_kernel_link_vmlinux() into kernel.bbclass
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
X-List-Received-Date: Wed, 23 Dec 2015 00:13:05 -0000

Move do_kernel_link_vmlinux() from kernel-yocto.bbclass into
kernel.bbclass so that it's available to any kernel recipe.

Note that the task is not enabled by default in kernel-yocto.bbclass,
so don't enable by default in kernel.bbclass either. To enable, see
the example in linux-yocto.inc, ie:

  addtask kernel_link_vmlinux after do_compile before do_install

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 12 ------------
 meta/classes/kernel.bbclass       | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3762d1d..558515e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -348,18 +348,6 @@ do_validate_branches() {
 	fi
 }
 
-# Many scripts want to look in arch/$arch/boot for the bootable
-# image. This poses a problem for vmlinux based booting. This 
-# task arranges to have vmlinux appear in the normalized directory
-# location.
-do_kernel_link_vmlinux() {
-	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
-		mkdir ${B}/arch/${ARCH}/boot
-	fi
-	cd ${B}/arch/${ARCH}/boot
-	ln -sf ../../../vmlinux
-}
-
 OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 KBUILD_OUTPUT = "${B}"
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4ce1611..2e60139 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -408,6 +408,18 @@ python split_kernel_packages () {
     do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 }
 
+# Many scripts want to look in arch/$arch/boot for the bootable
+# image. This poses a problem for vmlinux based booting. This 
+# task arranges to have vmlinux appear in the normalized directory
+# location.
+do_kernel_link_vmlinux() {
+	if [ ! -d "${B}/arch/${ARCH}/boot" ]; then
+		mkdir ${B}/arch/${ARCH}/boot
+	fi
+	cd ${B}/arch/${ARCH}/boot
+	ln -sf ../../../vmlinux
+}
+
 do_strip() {
 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
 		if [ "${KERNEL_IMAGETYPE}" != "vmlinux" ]; then
-- 
1.9.1


