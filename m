Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.8201.1613246505474460786
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 12:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VEHxuXAb;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d13so1598569plg.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 12:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iZ275HI8Yza2txI58fPuT6CmOxi17/DJ1v4luqO5E4=;
        b=VEHxuXAbLCw+87JhTBwJs20/Z6d4kyCT+nrTgnwn0Kde7ST6sJERBYbS3FjNwVGWtM
         JPEWkl5NxMgkJnxhmQOcoAf7wMCUL1QHLpgJXHxZLaFxs4tQtf6QkBPr0e8XyTLyFeVc
         CxoYKxNdlDmafRTFuQcu3XUkuHcgKGn8MSZn8hKVULf5WvWaTcg6bHldZdrQVqxN4SMm
         TNhbDBZTp5TAASX2aczq9j4KTaZIcQtyM9rz9hoKS+VsoHn5YdZx0WIZjJE207rYldmV
         RlOowj2AUwFEB5ev92glLDnCL7kJpYO3IikoU8GMypzv9kBcC6yxj0vUBR2wun+wY8Q+
         zKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iZ275HI8Yza2txI58fPuT6CmOxi17/DJ1v4luqO5E4=;
        b=nHXre+Ui/DUZZmUEEAiu1MZaiSV6XbAgYswlOcx8UMmqySVGgSGH0a+iGayUp7S677
         9ilKHHUImCGbVdvd2mHsJz9Tp43LH/KlPX4akIVudJSr6rAbTayWLsnMCnlIFFojMmwv
         aVbuIXuymFHXIlnbO9EsVVhZjJAbsOPoUrDgZ+ekqBM1Wwp5YSIrzuoeIlXZKN5QSJh0
         fDpST1gI59yggBsqu+0NpEdUZ5tvZmMyGWweoq6otC/93BNpVRzouJUaar+AZTEy/AQf
         DBXo/F5aaFh0jNuRpOnUj/xGwmkenn80IZrE5dNg3X0TIXBPMuHdVwdFqr9rkihoAV4U
         EE6Q==
X-Gm-Message-State: AOAM533bT77YIUsj1IeBSmKbBTb916OC4MM+gdvisnd61fpwUP3KEDPl
	izPQyB/T8kN17UnIr/2yAaH9LNbTg1NKyA==
X-Google-Smtp-Source: ABdhPJy30LoSBEe772u4Vn6/nXv54sN1XFRmMULPEhvlCfU2XMbRknjdc1pfMy1K8A81zo0AKE4rDA==
X-Received: by 2002:a17:90a:c503:: with SMTP id k3mr8155066pjt.29.1613246504396;
        Sat, 13 Feb 2021 12:01:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3857])
        by smtp.gmail.com with ESMTPSA id j3sm13521260pgk.24.2021.02.13.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 12:01:44 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gdb: Drop SIGRTMIN definition patch
Date: Sat, 13 Feb 2021 12:01:41 -0800
Message-Id: <20210213200141.957025-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has been already fixed in gdb via
https://sourceware.org/pipermail/gdb-patches/2015-October/128532.html

and W_STOPCODE is fixed by including gdbsupport/gdb_wait.h in nat/linux-nat.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-10.1.inc        |  1 -
 ...-Use-exorted-definitions-of-SIGRTMIN.patch | 50 -------------------
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch

diff --git a/meta/recipes-devtools/gdb/gdb-10.1.inc b/meta/recipes-devtools/gdb/gdb-10.1.inc
index 4b8de2b4e6..07de17f84f 100644
--- a/meta/recipes-devtools/gdb/gdb-10.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-10.1.inc
@@ -11,7 +11,6 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0004-Add-support-for-Renesas-SH-sh4-architecture.patch \
            file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
            file://0006-use-asm-sgidefs.h.patch \
-           file://0007-Use-exorted-definitions-of-SIGRTMIN.patch \
            file://0008-Change-order-of-CFLAGS.patch \
            file://0009-resolve-restrict-keyword-conflict.patch \
            file://0010-Fix-invalid-sigprocmask-call.patch \
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
deleted file mode 100644
index 8cbc50b75f..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0007-Use-exorted-definitions-of-SIGRTMIN.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 53f694ffa1ee9893b834758413c23947957f0fee Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Apr 2016 15:31:40 -0700
-Subject: [PATCH 07/11] Use exorted definitions of SIGRTMIN
-
-Define W_STOPCODE if not defined already
-
-__SIGRTMIN is internal to glibc and other libcs e.g. musl
-may not provide them
-
-Fixes
-https://sourceware.org/bugzilla/show_bug.cgi?id=13012
-
-Upstream-Status: Submitted
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gdb/linux-nat.c     | 4 ++--
- gdb/nat/linux-nat.h | 4 ++++
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index b81014024c7..e0513d47122 100644
---- a/gdb/linux-nat.c
-+++ b/gdb/linux-nat.c
-@@ -4428,6 +4428,6 @@ lin_thread_get_thread_signals (sigset_t *set)
-   /* NPTL reserves the first two RT signals, but does not provide any
-      way for the debugger to query the signal numbers - fortunately
-      they don't change.  */
--  sigaddset (set, __SIGRTMIN);
--  sigaddset (set, __SIGRTMIN + 1);
-+  sigaddset (set, SIGRTMIN);
-+  sigaddset (set, SIGRTMIN + 1);
- }
-diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index 44dcbb7758d..975d7276f66 100644
---- a/gdb/nat/linux-nat.h
-+++ b/gdb/nat/linux-nat.h
-@@ -91,4 +91,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
- 
- extern int lwp_is_stepping (struct lwp_info *lwp);
- 
-+#ifndef W_STOPCODE
-+#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
-+#endif
-+
- #endif /* NAT_LINUX_NAT_H */
--- 
-2.29.2
-
-- 
2.30.1

