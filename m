Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD434C3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:23 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1412.1746804258208163183
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3NqXVXr3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso3104515b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804257; x=1747409057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgbyUvf4vgV5LCV94ghkCqWoxUnvWk2xmGsqo/1MF5E=;
        b=3NqXVXr3Ka7WSu9cPKoyLkZbi67Jz01KKnm058tvj7Xkrwv5CS5RWOLlvWSO3s5vTa
         gtPHAgKnurxQBdiiTS8mqphfM0hiWqk8MHu+rishEJB1SJBb8DoAR9rEJnYYSTQVcvxF
         Jta2mpi9rjZcgzg0sUpTSCfS0VGqOO/JzWr2IdK6mAv72EmdMHqN0btbfyXycyTlE/Qg
         GtyGAfafJeqVIdrzFON2Yx3pRIbvh3hT1zn6xLP7NC/bWD8c2jMaGiui9DupThfTiF0X
         DouuW+7U2SNKk2aDTApEtdpZ6tn7Cb4Ifq7TSLTKbYVbpt+UAhNG8pFOMObeFY1GQHio
         UZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804257; x=1747409057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgbyUvf4vgV5LCV94ghkCqWoxUnvWk2xmGsqo/1MF5E=;
        b=tcMmJPEQJ2ECiVQ+j1YZpxWX8rV5f3qeF6kjsXYq3WIbQ5z3aETZAcqzGqly+35qcL
         tMl1kg7T15pMXHRjUy5ICxUCvWS8wcZ6wp2V8PDkUaLuEwyOrsSFFw4GGdvOU6OoVcBb
         qjbOfjQ4VqSBZSQxxSEn2PF8YUJ+Lz0Mj+rBSwqGCbqeiw5nwrxO1a9WX01l8zJlxuEC
         jjrCJ6fV/bTh4TOOcVRWcIE3GRyA5B+N+hpHYxlwUU2x8I+8/4VYUv2dZozGgSd+cSN7
         6G+bqo1XhDqJmX50eFWnDxqPi+G8xGac0lCgXiNKFGFOuhnEOoP9Hg9utXLR2A97MUSu
         aeRA==
X-Gm-Message-State: AOJu0YytNKlyG5cM+1H0juuMQT4YVnwNR5HNVYQreeJjno1OyQcR7eSd
	TgNQHMwL8bRI1cqxwPSyIhIEK7S9dQqSBG/OcZ0u3gm3ivIY6Y2hcCRkDiYE67z7IOdA43wMhUj
	1
X-Gm-Gg: ASbGncvYTY+Q/FPye6tVQSB38XL2MaBx7POo2WUkyvm6ccNAuPT3RxiHwUQevthwkEx
	Fvbf2YlyIKZMb+yRa+sB3SqV3WNO9/VwY6k1//cYHd37hK28VBU1TfrXDV/ENJDE2rA7y9kda6p
	a0WwtO5GL/FJT609CbIMkKgnUuhjpfzj0S9y9xcJEWs5ZM1MxYZ9oVb8hqJUzTFW9lHl68+GiP7
	FbwbVaUajD4ANKMboQZpTdNFf+bOfzS6y2bRYqyDf5Ai7pto9ki4TXhp+7Mt21fUDI8dHjqPZ4q
	DJaEGFTEQZ2rL3oRbz47+2TGKDuzp28n
X-Google-Smtp-Source: AGHT+IH8FIEkyBPq/HhhX48HiUw3Xuj0MLxAvH9ON9/QjlrSSqHkNEqiJSTGLx+P/RL6Bo1xWUPzKQ==
X-Received: by 2002:a05:6a20:3d20:b0:1ee:e33d:f477 with SMTP id adf61e73a8af0-215abafb68amr5390153637.15.1746804257402;
        Fri, 09 May 2025 08:24:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 16/17] webkitgtk: Use WTF_CPU_UNKNOWN when building for riscv64
Date: Fri,  9 May 2025 08:23:32 -0700
Message-ID: <ac12186d16cf91d69f95254d47530561fab054b4.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216224

From: Khem Raj <raj.khem@gmail.com>

This helps fix the build regression seen with 2.48+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

(master rev: e06114af90b78abb3ba2e75c59fc4c60db8b6a9a)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  | 38 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
new file mode 100644
index 0000000000..e436896098
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -0,0 +1,38 @@
+From: Alberto Garcia <berto@igalia.com>
+Description: Use WTF_CPU_UNKNOWN when building for riscv64
+ WebKitGTK doesn't build on riscv64 even with the JIT disabled.
+ Treating the CPU as unknown is perhaps a bit severe, but it allows us
+ to get the build done until someone steps up to maintain this
+ properly.
+Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=271371#c1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/PlatformCPU.h
++++ b/Source/WTF/wtf/PlatformCPU.h
+@@ -286,14 +286,6 @@
+ 
+ #endif /* ARM */
+ 
+-/* CPU(RISCV64) - RISC-V 64-bit */
+-#if    defined(__riscv) \
+-    && defined(__riscv_xlen) \
+-    && (__riscv_xlen == 64)
+-#define WTF_CPU_RISCV64 1
+-#define WTF_CPU_KNOWN 1
+-#endif
+-
+ #if !CPU(KNOWN)
+ #define WTF_CPU_UNKNOWN 1
+ #endif
+--- a/Source/cmake/WebKitCommon.cmake
++++ b/Source/cmake/WebKitCommon.cmake
+@@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+         set(WTF_CPU_PPC64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
+         set(WTF_CPU_PPC64LE 1)
+-    elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^riscv64")
+-        set(WTF_CPU_RISCV64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^loongarch64")
+         set(WTF_CPU_LOONGARCH64 1)
+     else ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index 6eb80da1de..58b78b5f28 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
+           file://fix-ftbfs-riscv64.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 
-- 
2.43.0


