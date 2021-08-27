Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.1398.1630087619110964610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 11:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mlk1/B0V;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id u1so632550plq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUXdZ2NLF9jwUE0d+mib8T3AEH0XWwSWtbBB6VPU400=;
        b=Mlk1/B0VkG6sk1eSl+XNUpQxhPvNHw5gVWD+pBB2BOJuhukw8GZhVerdwbQ8y3rFNV
         4oj1qjOKKTKpY7PCDpMLSaIoKKCeR0MKAumPDRPKeLr5Vf9K6iFb1xbzIPQua4JgxlnB
         VM18f3ow9TJx/0hH7qxiIBhQPPvq6maoZsfWEOpx6s7oZ9EVxbDoVQiAa+eMrI6H/HyX
         zCLXYErLb1Ls2ONMESmYp0jiPC2E574gxdmVWX7eubiFE7Sw6pMuKShbG39JEVTbv44f
         IjHmhX/zrDZ1PUpzjkYVQzBhvMPYWU5XErI9wt2SfiuH183KJM8evqQOLLk7KFQR5wwd
         4Ptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uUXdZ2NLF9jwUE0d+mib8T3AEH0XWwSWtbBB6VPU400=;
        b=axyRFx3mM1cPLqHGU/dKE/COe3DP6lINZrRMTnNNeD1ZzLDCzJLZuXVsLx8WU71ZTm
         UmyUhlCUWlh3e+HIIdcgoXiG6sA3vMJQeVimB0CQ9lD4AD+++8M2rtS9wb/6Zx6U1Vxz
         tDu9aZDgVVERoIs4e6WoMGTHlm7d3bRExAMW65kC66WIHXAkoyQtPtfu0DJOzk7xgBrR
         PfF1XEX+QtF9HuTBSjwXq0h1yn5sDnnXQg5trX43W04mJkRCVr0Py1cV5BKFouAQkiE/
         pLUb6nwRgGAF2Jq+G0onAklyMnKUN5bADsAXXp4RQi7l2hsrCt+CWVKooqmc4EiEecJe
         cnBA==
X-Gm-Message-State: AOAM533GYTKSXkxFarTwMVPTGSZ3KU3SAoxCH4KqeUl3VXm8GY3ThQoR
	O1kQtCQkCZLSwB4qCKTeEF8i9OL3WvT7Gw==
X-Google-Smtp-Source: ABdhPJy1AhK1RIWCjNWu5d2/LNjbHO7zcRldyBTfe305KXcj0Wko3cW/+wnBFsYkV7raY89Nm6kXog==
X-Received: by 2002:a17:902:c149:b0:132:86ed:3545 with SMTP id 9-20020a170902c14900b0013286ed3545mr9926676plj.47.1630087618302;
        Fri, 27 Aug 2021 11:06:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id e8sm8149984pgg.31.2021.08.27.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 11:06:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest tip of trunk
Date: Fri, 27 Aug 2021 11:06:55 -0700
Message-Id: <20210827180655.1411201-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstream patch

This brings in following fixes

  * 3f701faa (upstream/master, origin/master) fix libc-internal signal blocking on mips archs
  * 0fbd7d66 fix broken struct shmid_ds on powerpc (32-bit)
  * 4f3d346b math: fix fmaf not to depend on FE_TOWARDZERO
  * 937822ab fix TZ parsing logic for identifying POSIX-form strings
  * 1f0c7cb1 riscv: rename __NR_fstatat __NR_newfstatat
  * d8cb888d remove return with expression in void function
  * b7a130e0 remove unnecessary cast for map_library return
  * bd3b9c4c add pthread_getname_np function
  * e1a51185 fix popen not to leak pipes from one child to another
  * e74acd59 remove spurious lock in popen
  * 9a40e842 define __STDC_UTF_{16,32}__ macros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Rename-__NR_fstatat-__NR_newfstatat.patch | 32 -------------------
 meta/recipes-core/musl/musl_git.bb            |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch

diff --git a/meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch b/meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch
deleted file mode 100644
index 9d9f16cee6..0000000000
--- a/meta/recipes-core/musl/musl/0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 40732d03990632049d5ba63dd736269a81756b16 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 19 May 2021 00:30:05 -0700
-Subject: [PATCH] riscv: Rename __NR_fstatat __NR_newfstatat
-
-on riscv64 this syscall is called __NR_newfstatat
-this helps the name match kernel UAPI for external
-programs
-
-Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2021/05/19/3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: zabolcs Nagy <nsz@port70.net>
----
- arch/riscv64/bits/syscall.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/riscv64/bits/syscall.h.in b/arch/riscv64/bits/syscall.h.in
-index f9c421d0..39c0d650 100644
---- a/arch/riscv64/bits/syscall.h.in
-+++ b/arch/riscv64/bits/syscall.h.in
-@@ -76,7 +76,7 @@
- #define __NR_splice 76
- #define __NR_tee 77
- #define __NR_readlinkat 78
--#define __NR_fstatat 79
-+#define __NR_newfstatat 79
- #define __NR_fstat 80
- #define __NR_sync 81
- #define __NR_fsync 82
--- 
-2.31.1
-
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index f9c174d9c1..06b0e060d0 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "aad50fcd791e009961621ddfbe3d4c245fd689a3"
+SRCREV = "3f701faace7addc75d16dea8a6cd769fa5b3f260"
 
 BASEVER = "1.2.2"
 
@@ -15,7 +15,6 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
-           file://0001-riscv-Rename-__NR_fstatat-__NR_newfstatat.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.33.0

