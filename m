Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B839C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:10:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4133.1645139435559322810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sn/EDOpC;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso6894770pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKNaSPBqkdcTWQK2AYmFXkxZ3Lhd6QCW3EY1YrVCa40=;
        b=Sn/EDOpCiBqODXxe82zjbJNtl34T/VdbFUwX2sV4GqBZzXwRWqOWHIG32czwL6JjO4
         JS/LVSq0j9eUmPZd9+DPNxr6NKPFa83hCwcrU/nNEYIvVHJK7xQd5ixvnGVrBbH3HAdO
         /NZtZz9yqtIQnMuit5ZnIR+a8vgfEKvX0S6bE0bjeB6uc3c1OWymJPnAnNpQ7Dct07QN
         Lzj9iPnJoN9aMrNcL74z5CIwdEuyLsn5OqpqDUPyVNdre45L0EN618p8kflxHMYrImTE
         ij3eVf+VioHpourOtQ88fVroipDgrBrf/0NIeV0LpX3xiAJ5DsdJq0jqzF8N3U3rtGHt
         xjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YKNaSPBqkdcTWQK2AYmFXkxZ3Lhd6QCW3EY1YrVCa40=;
        b=M4/YIVoKTN7nt54/ok9ODNqfv88DGxIBvbCopPQGPGtqma0fYpmTWgvBGsXx+gCWG7
         IW7ygvJwbc4DbPu+sHAOwezbhWFGF1E5m+u8f5jJdq/7ZqvyS8AJY1dtbmBtEoKQarVa
         V943f9MV7BMxHHUruzIkFBJViRokQpV0itwNS/jVAnUZAPbt4I8xNUP4gp/X8pJ10Viv
         6svAn1YI/aB0U3E0+5h+FgUEvgxxH2inWs64b2NHu1iRxz7/BNvW/wbs49KkIpWlxfAE
         UI+Y4n8iijqjm0Gi7iiuR4PKHZuT+OBonZugwXihUMJN1YbCGAkMhLtmsJPTSB8TIlFO
         l3Dw==
X-Gm-Message-State: AOAM531XfDGz9zk+M5rTrx/oNz7DV8TQ7reHvLFA2hZNhSlkSlslL/KB
	i+JfdBC/wruxwxBf5FKA87ygzQLm/sCVHg==
X-Google-Smtp-Source: 
 ABdhPJw8Bw43XFHDnSzZKwu1z7mswco+dM+EZvWknOKbaO5M7H3zFAKbVmA8T9bCWizfuRGD+/GQsA==
X-Received: by 2002:a17:90b:4f42:b0:1b9:5a43:2278 with SMTP id
 pj2-20020a17090b4f4200b001b95a432278mr9568221pjb.158.1645139434773;
        Thu, 17 Feb 2022 15:10:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id 16sm646854pfl.99.2022.02.17.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 15:10:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] grub: Fix build with bintutils 2.38 on riscv
Date: Thu, 17 Feb 2022 15:10:32 -0800
Message-Id: <20220217231032.1848317-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161872

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-_zicsr_zifencei-extentions-on-riscv.patch | 47 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch

diff --git a/meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch b/meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch
new file mode 100644
index 00000000000..c575a311612
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch
@@ -0,0 +1,47 @@
+From f1217c803cec90813eb834dde7829f4961b2a2e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 17 Feb 2022 15:07:02 -0800
+Subject: [PATCH] configure.ac: Use _zicsr_zifencei extentions on riscv
+
+From version 2.38, binutils defaults to ISA spec version 20191213. This
+means that the csr read/write (csrr*/csrw*) instructions and fence.i
+instruction has separated from the `I` extension, become two standalone
+extensions: Zicsr and Zifencei.
+
+The fix is to specify those extensions explicitely in -march. Since we
+are now using binutils 2.38+ in OE this is ok, a more upstreamable fix for
+grub will be to detect these extentions, however thats not easy to
+implement
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c7fc55a..072f2c9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -849,14 +849,14 @@ if test x"$platform" != xemu ; then
+ 		         [grub_cv_target_cc_soft_float="-mgeneral-regs-only"], [])
+     fi
+     if test "x$target_cpu" = xriscv32; then
+-       CFLAGS="$TARGET_CFLAGS -march=rv32imac -mabi=ilp32 -Werror"
++       CFLAGS="$TARGET_CFLAGS -march=rv32imac_zicsr_zifencei -mabi=ilp32 -Werror"
+        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
+-		         [grub_cv_target_cc_soft_float="-march=rv32imac -mabi=ilp32"], [])
++		         [grub_cv_target_cc_soft_float="-march=rv32imac_zicsr_zifencei -mabi=ilp32"], [])
+     fi
+     if test "x$target_cpu" = xriscv64; then
+-       CFLAGS="$TARGET_CFLAGS -march=rv64imac -mabi=lp64 -Werror"
++       CFLAGS="$TARGET_CFLAGS -march=rv64imac_zicsr_zifencei -mabi=lp64 -Werror"
+        AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],
+-		         [grub_cv_target_cc_soft_float="-march=rv64imac -mabi=lp64"], [])
++		         [grub_cv_target_cc_soft_float="-march=rv64imac_zicsr_zifencei -mabi=lp64"], [])
+     fi
+     if test "x$target_cpu" = xia64; then
+        CFLAGS="$TARGET_CFLAGS -mno-inline-float-divide -mno-inline-sqrt -Werror"
+-- 
+2.35.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index a3cfe82f010..313c9186096 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://determinism.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://CVE-2021-3981-grub-mkconfig-Restore-umask-for-the-grub.cfg.patch \
+           file://0001-configure.ac-Use-_zicsr_zifencei-extentions-on-riscv.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.35.1


