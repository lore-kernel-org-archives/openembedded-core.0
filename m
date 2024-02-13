Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15400C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 23:03:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.29051.1707865415873069798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 15:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=jDgfqxDG;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-411c3b299caso8379515e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 15:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707865414; x=1708470214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=981aQ3qmc4reKZdkYoMsb/vk0kI8xVX9dNkfK5BFJzM=;
        b=jDgfqxDG8Kk/3MVhOGEAFLr3XWXuvFLht58yLEzAPoKHP/XBNZY7iUyHM7qrhj2kq5
         ffuS0dpYvVsoF+RuUBj51onRjgZ7tu3U2z7IBIRRlzAWjK5GN4kN9AQEFEGmwWpzH9Ay
         OC0x8mCc9BhevIz5HM3EnHyjDi3CnwkjPKtXj5cMQgqIUm86FqWSMzDL5bqtIobl2cmO
         RsmP14kn2qzlncLslA1dZRv92cuhb61rxz/LKTDE/rB29JwS+EJKKhYh/YhNwu6Ir1UL
         eO/aG0uWpgdDdowYg6pb+jnkwfBz5+0mfrHWDRvqEzkTWsMN/cy3nesEXjDdDz7YfyTg
         z06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707865414; x=1708470214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=981aQ3qmc4reKZdkYoMsb/vk0kI8xVX9dNkfK5BFJzM=;
        b=BzM4Ih0Waz9BF+aUp6NHzdzNvumWbiQz0Ke+IVf4MTbQsHjlEXAipYeBm280Pg57j6
         6r8CroXhePeOn2ZilSgAU4LlhJWlyYRtFLACm3ulcvIUjn6LgDmCTE4awZebWVAdEMB6
         hZHRiVIxBOtXiKD2bT6RsmmQ1w9r6/Xccdk7NncWrtEhj1LSLzfBFqH1AN5Ywj+sVq/I
         tKdIqV6HsFDCimSVdo3cYsakmeIGqskmhxY8fCLra8f+a3i6qlSJj1PPkzkE7oq8UYwc
         fLZqetmcru7TjwyEaSa07ev+uDkqP/rm+DTgQ1J2vLDnocpBpeq6KhQ9gSZ/rnDciG65
         JidQ==
X-Gm-Message-State: AOJu0YzvpbJ+xL9PDZ33nHdeqkI1J1Ys+CZ5V30YfrvPeBDt6HxDDjHt
	3umyjOl9HhY0impfFbZmb8JzGpdc9SBld8vKt6qoZZhbpylib5OU91GP7KNg9FdE4mwlagNeGv7
	UDt4=
X-Google-Smtp-Source: AGHT+IE2vcJiZvfmGgVZwPPo7Hsfo20fkeZS6Y0TGKhJPHE3PeFCQyIio4323TWESM+wRqRfouY/MQ==
X-Received: by 2002:a05:600c:a386:b0:411:e7d:9086 with SMTP id hn6-20020a05600ca38600b004110e7d9086mr702052wmb.15.1707865413613;
        Tue, 13 Feb 2024 15:03:33 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id l1-20020a1c7901000000b00410dd25407dsm565982wme.1.2024.02.13.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 15:03:33 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] kexec-tools: Replace a submitted patch by the backported one
Date: Wed, 14 Feb 2024 00:03:01 +0100
Message-Id: <20240213230301.2108262-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 23:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195446

This replaces "kexec-tools: purgatory: fix build on `binutils-2.42`"
(Submitted upstream) by "Fix building on x86_64 with binutils 2.41"
(which was actually merged).

Upstream maintainers found the second patch more complete [0].

[0]: https://lore.kernel.org/all/ZbopWV9qrxMME2hU@MiWiFi-R3L-srv/T/

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...purgatory-fix-build-on-binutils-2.42.patch | 59 ------------
 ...uilding-on-x86_64-with-binutils-2.41.patch | 95 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.28.bb               |  2 +-
 3 files changed, 96 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch
deleted file mode 100644
index 6104a29d711..00000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2cdbb12f4b101c7ecb3a4791819d9269d4f07c19 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Wed, 31 Jan 2024 10:05:08 +0000
-Subject: [PATCH] kexec-tools: purgatory: fix build on `binutils-2.42`
-
-`binutils-2.42` introduced stricter checks on what `.arch` can be used
-in 64-bit mode and started failing the build as:
-
-    $ as-2.42 --64 -o entry32-16-debug.o entry32-16-debug.s
-    purgatory/arch/i386/entry32-16-debug.S: Assembler messages:
-    purgatory/arch/i386/entry32-16-debug.S:28: Error: 64bit mode not supported on `i386'.
-
-The change moves `.code32` before `.arch 386` as suggested in
-https://sourceware.org/PR31319
-
-Upstream-Status: Submitted [https://lore.kernel.org/all/ZbopWV9qrxMME2hU@MiWiFi-R3L-srv/T/]
-Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
-Reviewed-by: Baoquan He <bhe@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- purgatory/arch/i386/entry32-16-debug.S | 2 +-
- purgatory/arch/i386/entry32-16.S       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
-index 5167944..297d6f5 100644
---- a/purgatory/arch/i386/entry32-16-debug.S
-+++ b/purgatory/arch/i386/entry32-16-debug.S
-@@ -25,10 +25,10 @@
- 	.globl entry16_debug_pre32
- 	.globl entry16_debug_first32
- 	.globl entry16_debug_old_first32
-+	.code32
- 	.arch i386
- 	.balign 16
- entry16_debug:
--	.code32
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
-diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
-index c051aab..7a84565 100644
---- a/purgatory/arch/i386/entry32-16.S
-+++ b/purgatory/arch/i386/entry32-16.S
-@@ -20,10 +20,10 @@
- #undef i386	
- 	.text
- 	.globl entry16, entry16_regs
-+	.code32
- 	.arch i386
- 	.balign 16
- entry16:
--	.code32
- 	/* Compute where I am running at (assumes esp valid) */
- 	call	1f
- 1:	popl	%ebx
--- 
-2.43.0
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch b/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
new file mode 100644
index 00000000000..4894f044fcd
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/Fix-building-on-x86_64-with-binutils-2.41.patch
@@ -0,0 +1,95 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Michel Lind <salimma@fedoraproject.org>
+Date: Tue, 30 Jan 2024 04:14:31 -0600
+Subject: [PATCH] Fix building on x86_64 with binutils 2.41
+
+Newer versions of the GNU assembler (observed with binutils 2.41) will
+complain about the ".arch i386" in files assembled with "as --64",
+with the message "Error: 64bit mode not supported on 'i386'".
+
+Fix by moving ".arch i386" below the relevant ".code32" directive, so
+that the assembler is no longer expecting 64-bit instructions to be used
+by the time that the ".arch i386" directive is encountered.
+
+Based on similar iPXE fix:
+https://github.com/ipxe/ipxe/commit/6ca597eee
+
+Signed-off-by: Michel Lind <michel@michel-slm.name>
+Signed-off-by: Simon Horman <horms@kernel.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?h=main&id=328de8e00e298f00d7ba6b25dc3950147e9642e6]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ purgatory/arch/i386/entry32-16-debug.S | 2 +-
+ purgatory/arch/i386/entry32-16.S       | 2 +-
+ purgatory/arch/i386/entry32.S          | 2 +-
+ purgatory/arch/i386/setup-x86.S        | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/purgatory/arch/i386/entry32-16-debug.S b/purgatory/arch/i386/entry32-16-debug.S
+index 5167944..12e1164 100644
+--- a/purgatory/arch/i386/entry32-16-debug.S
++++ b/purgatory/arch/i386/entry32-16-debug.S
+@@ -25,10 +25,10 @@
+ 	.globl entry16_debug_pre32
+ 	.globl entry16_debug_first32
+ 	.globl entry16_debug_old_first32
+-	.arch i386
+ 	.balign 16
+ entry16_debug:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32-16.S b/purgatory/arch/i386/entry32-16.S
+index c051aab..eace095 100644
+--- a/purgatory/arch/i386/entry32-16.S
++++ b/purgatory/arch/i386/entry32-16.S
+@@ -20,10 +20,10 @@
+ #undef i386	
+ 	.text
+ 	.globl entry16, entry16_regs
+-	.arch i386
+ 	.balign 16
+ entry16:
+ 	.code32
++	.arch i386
+ 	/* Compute where I am running at (assumes esp valid) */
+ 	call	1f
+ 1:	popl	%ebx
+diff --git a/purgatory/arch/i386/entry32.S b/purgatory/arch/i386/entry32.S
+index f7a494f..8ce9e31 100644
+--- a/purgatory/arch/i386/entry32.S
++++ b/purgatory/arch/i386/entry32.S
+@@ -20,10 +20,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl entry32, entry32_regs
+ entry32:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Setup a gdt that should that is generally usefully */
+ 	lgdt	%cs:gdt
+diff --git a/purgatory/arch/i386/setup-x86.S b/purgatory/arch/i386/setup-x86.S
+index 201bb2c..a212eed 100644
+--- a/purgatory/arch/i386/setup-x86.S
++++ b/purgatory/arch/i386/setup-x86.S
+@@ -21,10 +21,10 @@
+ #undef i386
+ 
+ 	.text
+-	.arch	i386
+ 	.globl purgatory_start
+ purgatory_start:
+ 	.code32
++	.arch	i386
+ 
+ 	/* Load a gdt so I know what the segment registers are */
+ 	lgdt	%cs:gdt
+-- 
+2.39.2
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
index 4471cdf21e0..dec821ea883 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.28.bb
@@ -17,7 +17,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0003-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch \
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
-           file://0001-kexec-tools-purgatory-fix-build-on-binutils-2.42.patch \
+           file://Fix-building-on-x86_64-with-binutils-2.41.patch \
            "
 
 SRC_URI[sha256sum] = "f33d2660b3e38d25a127e87097978e0f7a9a73ab5151a29eb80974d169ff6a29"
-- 
2.39.2


