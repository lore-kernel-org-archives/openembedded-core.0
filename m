Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AA9E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 04:24:30 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.122789.1734582266266661145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 20:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dF2tO8dG;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-728e78c4d7bso291917b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 20:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734582265; x=1735187065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pNebX7x7qKGnLlhbeg300vHNv7fLJ4HF/Es76UFJOjw=;
        b=dF2tO8dGVlcrnqzwivWwica5Cblzfs5Uh5KH3/cRj5gdbst4Fiq1PiNr61hjDoM+su
         4hAL+2ldoJxrgzJvrgV59EfbMm+vaf6kxMor1pfLg45ofwIZHWMOFSEZxADVk/6GoRar
         asO1cXDNIIWPqxcdz3Azi07gTAlzpE2kXxFy7suOWYHJG28fFjX4LvGvwL6DD59s1+I4
         Or8X+AFKbVUevvH5Qqjr3br92CivAkPyk8mGd0lnO9Jadw33xKL5JU5txv+MYyckanCs
         UpzwncUCtaoFc5pLy0iwckgOF2sgsmZMKPy/ITX4av3Q+7Glra62pjmfxVSO9eNyWm6P
         nW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734582265; x=1735187065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNebX7x7qKGnLlhbeg300vHNv7fLJ4HF/Es76UFJOjw=;
        b=V00pPNSM5+15elsue9XMX7Ib0dQTFQ2Si/VcyXA6ilHXN84U2C/kd/oyl1H2QLEYlF
         paw0beF7ulEAft8u/lCzUMc1fkOam9m6defLWBoXDKisXiAa9vpl9qBtBGSBV4eRPqUE
         AuPYEYKTmL2D7Ki15ZLuPFc/yXp9S5UeRKpqA5r8oWHoZTXVX9KH+vCLO5JAZSwgF/2z
         5smW/+YjEDwIXxtFRSDhG9bB598PH3bXW6DRoX2JeTqkm0Ihrk5dz0+KoddfZkqE4MZi
         Qx6RqPX48rSZ8dY0qitsZ4Lajs9xJJ10rCkSWHcov8Oz20eKcJuAhbJ4LsnW+tdDg4By
         6Xaw==
X-Gm-Message-State: AOJu0YxIqVbpP7LTtdQcpc24mVeVpOFg1TMNewepDQqDaiNOTqSjgZwz
	uGmaIRnNWLd/SODawL+P6kCiPfbcnq47gJWauyPJFGQJNiuMPt7wM3dsMmSE
X-Gm-Gg: ASbGnctvDgKYQHtOu37zioJumJyttAMHpNpaElH88ugNWWYIzUhednhaMNBA1lHrB2M
	HwahO/x3khY2W8TZuxEJHX3v0M2deX2Fiia6H8yaO526KGqti7yLr1tvjVxjA6xyoKV8iRnt+sT
	b/P6y5+GEcy6nsjCPV60DS4OHxh9tRFhpsGTBXTgED6Zw+extukUf4tWU0Lj7gRATKJ/17hBqQX
	CjybEh0EYkSZyoZU0u+UNakQXmPJv6oSr8DYXGwy/vwQamY/ziaebDhaA==
X-Google-Smtp-Source: AGHT+IFDSY8tQr+R1Zuyldf6RQlKB8NgATnIAOjcNRzp7wwwf6LnBWIa3DLKIJ3lzFttenlNTnaCRg==
X-Received: by 2002:a05:6a00:6103:b0:72a:a9d9:55ff with SMTP id d2e1a72fcca58-72aa9d95688mr2126828b3a.0.1734582265253;
        Wed, 18 Dec 2024 20:24:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::d5a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb88asm295819b3a.135.2024.12.18.20.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 20:24:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Fix build on 32bit arches with 64bit time_t only
Date: Wed, 18 Dec 2024 20:24:22 -0800
Message-ID: <20241219042422.25857-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 04:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208897

This is a fix needed in angle module which is vendored in webkit repo.
glibc does not define SYS_futex on 32bit arches with 64bit time_t only
e.g. riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../webkit/webkitgtk/sys_futex.patch             | 16 ++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.46.4.bb     |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/sys_futex.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
new file mode 100644
index 00000000000..19d18dea881
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/sys_futex.patch
@@ -0,0 +1,16 @@
+Fix build on newer 32bit architectures with only 64bit time_t
+
+Upstream-Status: Submitted [https://chromium-review.googlesource.com/c/angle/angle/+/6108397]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
++++ b/Source/ThirdParty/ANGLE/src/common/SimpleMutex.cpp
+@@ -17,6 +17,9 @@
+ #        include <linux/futex.h>
+ #        include <sys/syscall.h>
+ #        include <unistd.h>
++#        if !defined(SYS_futex) && defined(SYS_futex_time64)
++#           define SYS_futex SYS_futex_time64
++#        endif
+ #    endif  // defined(ANGLE_PLATFORM_LINUX) || defined(ANGLE_PLATFORM_ANDROID)
+ 
+ #    if defined(ANGLE_PLATFORM_WINDOWS)
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
index f7d0b5e0505..6e1b7939241 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.46.4.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://0001-Support-ICU-76.1-build.patch \
            file://bmalloc-fix.patch \
+           file://sys_futex.patch \
            "
 SRC_URI[sha256sum] = "0eff5f0ab0a2872ec87df62bc32e3289c8af625716ac71e94b298d74e0374176"
 

