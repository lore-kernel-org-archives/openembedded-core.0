Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 507CB7317B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 20:04:59 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so108829705pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 12:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tFVZTKvUplog4WvnGOCgFNkgkMEbeAjI3mnMrkviuIw=;
	b=El8KEdrtFYIZ991qBHOs/nw+2JpyT2ghDqAMr4u8k731QaGIIgYKAScIOAf9x3p/ay
	VfTO4qWS2wlYEWMgiELbefhogtvxmIdhREFUJjBaI88ml0Y1jaYGJWqeGAOWyfzrXkcT
	xRmjdJk6zw8qdLsw5T0LLfMjyPj3nsoKcQjHcGoxX3VyxRgIkwTWqaGZvvCKyLh4WSOv
	btTSItIlqY2+eRIeQy/GP4MQx+BmKwXHVTR+hz+GPU6hSnSiBSHpIHeR2jW/azVJODA/
	8cjbDcLeODa7zGXyh3STSDDY472YQba+4ARcshopiXjyybN1qFr6aCjcyXevVKnfBjzA
	5tBw==
X-Received: by 10.67.14.3 with SMTP id fc3mr49193198pad.134.1450123500797;
	Mon, 14 Dec 2015 12:05:00 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ga13sm44660261pac.47.2015.12.14.12.04.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Dec 2015 12:04:59 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 12:04:50 -0800
Message-Id: <1450123490-3438-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450123490-3438-1-git-send-email-armccurdy@gmail.com>
References: <1450123490-3438-1-git-send-email-armccurdy@gmail.com>
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
X-List-Received-Date: Mon, 14 Dec 2015 20:05:00 -0000

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


