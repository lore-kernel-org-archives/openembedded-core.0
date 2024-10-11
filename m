Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710A8D0EE2C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 19:43:22 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.21052.1728675799299121798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 12:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MTM6rcvR;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso1707607a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728675798; x=1729280598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KBIbhHkR22V/0Qsu6GTkYlvWXCZfQ3T79AJU2Dor6Cw=;
        b=MTM6rcvRqD05ztLa4bMhSwI5s0gVXHuXIDYBRSDCLsV/Dq3FSnX/9TZLbSJmH2slum
         hUd+CvBiyHlhPhG6aQ0z/RE5vAmCAWSejZrolMsKY3e09g/vv1uwumRokS7bwSxAfIwM
         qv2WLY4/VFz+IJ7j2/aklyQ6s9w9WOoN7LW9tlkb/mGPsonQowO5OHVnrQAZ9m6OpP6V
         3DDW45fD0zMGFWDcOWVFsjzckCSb9fqSFopt/ZiP4H2KerJceMSzdqtVhvl8ijsXB7O0
         GQHinRMVDkzj/rLR7nDc0Q709i6ETbfgZxguG9BcOZE2whdhNKJ9qGtWtiViIFjV14CD
         IrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675798; x=1729280598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBIbhHkR22V/0Qsu6GTkYlvWXCZfQ3T79AJU2Dor6Cw=;
        b=XeipvWaq0+n0FyRgs1QHFjdk71ed3G57u9Bi5eLrOZyCB9LjQd90S9SrrBJErIgPUG
         K4erBSVkF/IjfUcSlc9Kh/kMrA4eY8afYGkiMHjeiMK8earzM//mxCwJvKzycmnIrHWL
         sZdgzwRfBEnoTDnVkgOzzsrpS7lf676CbTbtdcRzpjnLBPPf0LMZcKc7Z9WUR5Vp+vv0
         loKhUWI/0JWfzt3oEPCoGMzZ0sHW0BcyqjoumoVX3lCPVWs3KcB8Vba6SMKSwlBx8sIn
         TpeFKClOS0tIrn4pQs/s5VXBsYAlOk15W6iGNvXTMS4tsPmvpHGq1FaHBKN29skORVEC
         S/Fw==
X-Gm-Message-State: AOJu0Yx7fLC19n5fQj/7LNyGWsgNDHWizf71FQ4opXYNMnbiqQfWE+sv
	f7IDBYDKSb19cqD1ZF/ai1/TamCTIEbF7Sz+ee84S57HKHY6HtznBI5p8jEI
X-Google-Smtp-Source: AGHT+IGQXOL86hjPXtuS448mvIbvHsO2S8zc7Ty+J7HGu6+V0oSfjoFSWJR6Mr7KeotQlzqIHhxCKw==
X-Received: by 2002:a05:6a20:cfa9:b0:1d2:e458:4063 with SMTP id adf61e73a8af0-1d8bcfb26cbmr5058255637.33.1728675798449;
        Fri, 11 Oct 2024 12:43:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f083])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab0f1dcsm2948572b3a.209.2024.10.11.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:43:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Do not define sched_attr with glibc >= 2.41
Date: Fri, 11 Oct 2024 12:43:15 -0700
Message-ID: <20241011194315.1054141-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 19:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205698

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...ed_attr-Do-not-define-for-glibc-2.41.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2786eedd423..223de71efee 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
            file://0010-configure-lookup-meson-exutable-from-PATH.patch \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
+           file://0001-sched_attr-Do-not-define-for-glibc-2.41.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
new file mode 100644
index 00000000000..edb3e304c96
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-sched_attr-Do-not-define-for-glibc-2.41.patch
@@ -0,0 +1,47 @@
+From ddb27569449c941014fa44b1b542de0831d993a0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Oct 2024 22:40:32 -0700
+Subject: [PATCH v2] sched_attr: Do not define for glibc >= 2.41
+
+glibc 2.41+ has added [1] definitions for sched_setattr and sched_getattr functions
+and struct sched_attr. Therefore, it needs to be checked for here as well before
+defining sched_attr
+
+Define sched_attr conditionally on SCHED_ATTR_SIZE_VER0
+
+Fixes builds with glibc/trunk
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=21571ca0d70302909cf72707b2a7736cf12190a0;hp=298bc488fdc047da37482f4003023cb9adef78f8
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/project/qemu-devel/patch/20241011193140.1047648-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Laurent Vivier <laurent@vivier.eu>
+Cc: Paolo Bonzini <pbonzini@redhat.com>
+---
+v2: Use SCHED_ATTR_SIZE_VER0 instead of glibc version check
+
+ linux-user/syscall.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 1354e75694..caecbb765d 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -359,7 +359,8 @@ _syscall3(int, sys_sched_getaffinity, pid_t, pid, unsigned int, len,
+ #define __NR_sys_sched_setaffinity __NR_sched_setaffinity
+ _syscall3(int, sys_sched_setaffinity, pid_t, pid, unsigned int, len,
+           unsigned long *, user_mask_ptr);
+-/* sched_attr is not defined in glibc */
++/* sched_attr is not defined in glibc < 2.41 */
++#ifndef SCHED_ATTR_SIZE_VER0
+ struct sched_attr {
+     uint32_t size;
+     uint32_t sched_policy;
+@@ -372,6 +373,7 @@ struct sched_attr {
+     uint32_t sched_util_min;
+     uint32_t sched_util_max;
+ };
++#endif
+ #define __NR_sys_sched_getattr __NR_sched_getattr
+ _syscall4(int, sys_sched_getattr, pid_t, pid, struct sched_attr *, attr,
+           unsigned int, size, unsigned int, flags);

