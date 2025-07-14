Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BD1C83F2C
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.82434.1752510205929438692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cz3JCfYe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-75001b1bd76so1422029b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510205; x=1753115005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eobZDiZDz3JI/HXIWeokXkchD/qqPA0UfG9bN1u3mYk=;
        b=Cz3JCfYe8M+Ah4iPjlXBYG1xkqxp5NJmLjkszfJJRsnfkePaB69B0Ky1goRfyCY+ei
         jCzZhoj9DtmJTiCvXog+WFOghFLEQQe6DjkFAzxhtNOaS8kQuouLQpmVJQKiNwkYz7FR
         nMNSFkZfEbH5w5P0odinbPeH5drrf9Fp4fUXb+I9Amlm9Dzzud2TtdZlwG++R2XQuRj4
         kKx6pGIYb1a4SBEwLaT8uMesNRfvBPBAcwqqBNEdPqaaAVU71quXiV/XcvlTHjSC7kEd
         XLR/WrRWy73hbLrLz9Nw1l36KvDhJn9GFfdznzjr/+MI2DhTizRewOEDqV76pfCWvZ5C
         2tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510205; x=1753115005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eobZDiZDz3JI/HXIWeokXkchD/qqPA0UfG9bN1u3mYk=;
        b=PfFSg3hBxmH3wz5PqO9Bjekg5AVBWLaGkj0gTPgoAwVHJt3iWScZWqTuxA3TJ/FFfJ
         kAZhoosDXJ6YnvvvnymNd8n5Y8iWiYzrYd873O0pkD40wbD5ktnjiTOdSiX7EUqEcJFg
         duDPTWPf+vqjZddUyjrVhflhAEvVRFSLDaYU4CfM9RRTZiCHi46amn1q8r7I1lg1hToc
         eUMkZ+8DFY08gw4wgKVrwtX9yg6UH1/UN0EM0NBfy3+3yrga3V7/X7bvnMTS/ccmW3b/
         UZr5g0zdld83L5tbBtl/EbAfD5J+W/QxrddWDMO2e7kcIvnk+smNulFYPOnciBXV3ice
         GtuQ==
X-Gm-Message-State: AOJu0Yz0gaoIbjUxJubo+GBvs2fFHpL5ksypSJkTfZAi3qbFTgDhzkmc
	t5UaILA6ozRZQT3ObPnO3syKKxQRJUVcjhgChdzbbjFyZ8NlRRKgNwq0RrLlexw6ofBHWAjMhqy
	0cRgO
X-Gm-Gg: ASbGncvDdbiBY5PhtdXEZO5JjFoov4O/dicJxq0uVIy9ZsbaA3vxFdoML/iLgYJfzB/
	sgQIKGrTFEW2TN1v7YTbqNCvTtSFjjK7IV30Op35wjlquzyT4yEF1pFzkGITpXdIQQ3V4ZOVQPY
	txYqoUEQeS1mZPy50FgXVzu4k9tk8ioNFpIEqa1/Lfrp3AYm4sVS2DLu9HR6hHwP8GsECL6BoU9
	Dh1GtpsAZOMBLg/SfGO8GX37sTOx8q9eGpYpZ9Me53qW/Q8IDxc8vs3jOgIbwnPSx+PcWM9QULf
	/MJlSXG8LiAqX3yzpB9yBqnD2fLx9nusYqMBsaq7hzzmrYQ45c3r0QMk9mcLGCBztAnUWwEbnZy
	W7CGV0KePm+I2
X-Google-Smtp-Source: AGHT+IF3BM2vD6UHL2u+FH7X+R3xrQhKxXSi0U1dlfQ7y4LwuzAD2LKnFo8P1THkxIlZCFbhHyNFcA==
X-Received: by 2002:a05:6a00:2352:b0:730:75b1:7219 with SMTP id d2e1a72fcca58-74ee2557a1fmr18599859b3a.12.1752510204814;
        Mon, 14 Jul 2025 09:23:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/15] webkitgtk: Fix build break on non-arm/non-x86 systems
Date: Mon, 14 Jul 2025 09:23:00 -0700
Message-ID: <5066497834de8786520a1c6d3d7dcc22e81276a5.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220244

From: Khem Raj <raj.khem@gmail.com>

Fixes
/webkitgtk-2.48.1/Source/WebCore/platform/audio/DenormalDisabler.cpp:94:47:
   ↪ error: expected ';' after default
   |    94 | DenormalDisabler::DenormalDisabler() = default
   |       |                                               ^
   |       |                                               ;

(From OE-Core rev: 3325e4e7fc82861abf7505ed4f7926dacab96b30)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkitgtk/fix-ftbfs-non-arm-non-x86.patch | 31 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.1.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
new file mode 100644
index 0000000000..2381acb1b0
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
@@ -0,0 +1,31 @@
+From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Wed, 2 Apr 2025 15:01:55 -0500
+Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
+ non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=287662
+
+Unreviewed stable branch build fix.
+
+* Source/WebCore/platform/audio/DenormalDisabler.cpp:
+
+Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653d020d9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+index 35715e663ce7e..44ba08a33d5d9 100644
+--- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
++++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
+@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
+     }
+ }
+ #else
+-DenormalDisabler::DenormalDisabler() = default
++DenormalDisabler::DenormalDisabler() = default;
+ DenormalDisabler::~DenormalDisabler() = default;
+ #endif
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
index 58d0a11202..5b9846a6d6 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
+           file://fix-ftbfs-non-arm-non-x86.patch \
            "
 SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 
-- 
2.43.0


