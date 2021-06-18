Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.12933.1624045429058367059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 12:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HgfmFiwf;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id c22so843703qtn.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 12:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZEAmFisMapfe6xiigYjrh6jWzb1mGCZav8svzfBJhc=;
        b=HgfmFiwfsC7q04ATj87O52PHSVumFPfmgiQZ2Uo5K44Aj9K1xh9GpEly7gdEl2lGuW
         tzuJv0t/9yCLkgaoWp54kaBWPbHd9NYxuHbROM81REbUuaJZHB2V7Xd4L5q1eSM8vq9I
         G/+XeBH2+F7PD95oX1CTstqS7BzkkGmrzMRSTtw5EpIWGkXWgHqRMzAbNUvqN5ZqKH3O
         ntuVKyIVbiz6gbeQ0V6nonmpwqbDyGTS9VrN2jZOh8fS3rE/JtctM3+BbFOOws11bTr+
         nctOIuCkE/6HKN+u7ZnRpvjLMpIpHitDnNbEw7XTB2obF/MLNLCSfD4hI5rpJLss59Ti
         kctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7ZEAmFisMapfe6xiigYjrh6jWzb1mGCZav8svzfBJhc=;
        b=hlD1fxtUd0gtpcM7QEIyNZDpoCTs6h9cT9ozXPL3L7WibhDge78xKJq4GK8uKSrRyI
         KL0mfZ+lmJ9DLv+gMjW3CRGm0AC9s6kRu5TdLpaodL+humrx6gQAOuhCVtQZEEnwYyxX
         svJRjMAz4DOwZi7VtnxiK1BWwArp2hTgG+Jha2wuFnPmDaDFcekz+0QOQkNBcpb4U8Rs
         nW63vtwGdLBYZVpp5SMpf+7ywBXfQL02qeOU17Cvy+oilsNXECwtlO0VOCL5yiI/kb64
         0UFnCqti0IVtvI6Oa0vjbbOoQjI6skf7UqOnPTd97ZCgs60O39JPoGnBAlfOAeXd9M5S
         LGtg==
X-Gm-Message-State: AOAM531MCi/hAvH9saR3EEq3DxPoP51iU05ocIowyoJmWxcANEbiajKW
	WLvW0v4BhyNed9NWFXFqs8M=
X-Google-Smtp-Source: ABdhPJzdEnZbNj+i85tiqpnxwCoqcX/7Yzsm7zFFsqYh9DiX+JcEikkKqCMjGgroLGTbHv+37rOkfg==
X-Received: by 2002:ac8:7d48:: with SMTP id h8mr2020623qtb.317.1624045427986;
        Fri, 18 Jun 2021 12:43:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id x12sm464377qtr.22.2021.06.18.12.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 12:43:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] btrfs-tools: include linux/const.h to fix build with 5.12+ headers
Date: Fri, 18 Jun 2021 15:43:45 -0400
Message-Id: <20210618194345.38131-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

btrfs-tools compile fails with mips, musl and 5.12+ headers.

The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
add an explicit include of const.h to pickup the macro:

  | make: *** [Makefile:595: mkfs.btrfs] Error 1
  | make: *** Waiting for unfinished jobs....
  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
  | collect2: error: ld returned 1 exit status

This is safe for older kernels as well, since the header still
exists, and is valid to include.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

I've started a discussion if this is required upstream, but didn't
want to wait on sending this.

I'm working on the update to libc-headers 5.13+ and ran into this
build error .. only on musl and mips64. Which is why there is
hesitation on if this is needed upstream.

Cheers,

Bruce


 ...ude-linux-const.h-to-fix-build-with-.patch | 42 +++++++++++++++++++
 .../btrfs-tools/btrfs-tools_5.12.1.bb         |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
new file mode 100644
index 0000000000..d7188881da
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
@@ -0,0 +1,42 @@
+From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Fri, 18 Jun 2021 11:10:36 -0400
+Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
+ headers
+
+btrfs-tools compile fails with mips, musl and 5.12+ headers.
+
+The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
+add an explicit include of const.h to pickup the macro:
+
+  | make: *** [Makefile:595: mkfs.btrfs] Error 1
+  | make: *** Waiting for unfinished jobs....
+  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
+  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
+  | collect2: error: ld returned 1 exit status
+
+This is safe for older kernel's as well, since the header still
+exists, and is valid to include.
+
+Upstream-status: OE Specific [mips64 + musl + libc-headers]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ kerncompat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/kerncompat.h b/kerncompat.h
+index df167fe6..254235bd 100644
+--- a/kerncompat.h
++++ b/kerncompat.h
+@@ -30,6 +30,7 @@
+ #include <linux/types.h>
+ #include <linux/kernel.h>
+ #include <stdint.h>
++#include <linux/const.h>
+ 
+ #include <features.h>
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
index 3fc959bf8e..d0c9cf2a99 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
@@ -18,6 +18,7 @@ DEPENDS_append_class-target = " udev"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
+           file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
            "
 SRCREV = "96d77fcefdd3b9fd297b5aabbce6dc43e2315ee2"
 S = "${WORKDIR}/git"
-- 
2.19.1

