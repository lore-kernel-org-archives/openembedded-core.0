Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92795C83F27
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.82371.1752510208737562878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pdlyPKP/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b54cead6cso3080970b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510208; x=1753115008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyL//Rquy15a1LMI+MlP6N2J7pXDv9j1LwklKH1sS+c=;
        b=pdlyPKP/4J90Oc67ku46HwoOZlnwR5fpghMGaQN+y9QU2uxYnsXyJ3uWew7kumGsxb
         PBvAkGmitaYe/DJ5cuJNcdRXSU/CfaunxJFpl2ob5cW43y4Ddn4LgOV24vwXboDVtIR3
         tYflqXcibG5yfjOkvZAOSa3IyEoOus2COF37AKM6ed5Ens1Wy++EDMM0HnicBK2V8kMH
         a22AfNJ387s6vPRncZGXR+u3W6sMium6zD8ZC3VPWkfyUleLjM6u/9TfxiY+SwBQg6LH
         xsn3yDGm5WHLWn3AO10aVYv8Rt05QiUygVxA3PPYWTWBEgdcIrc+IWA5HZv6aUozKAYW
         rRQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510208; x=1753115008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyL//Rquy15a1LMI+MlP6N2J7pXDv9j1LwklKH1sS+c=;
        b=motcpIf6etk1RTKz1IPLtAPij2ZuwkRcTdW2t/rparwlRcRWSZxbvwXI909lgt2/cJ
         Km8yxLROgME40VCw0/txc19CE7WzZmCEGWndPKQuArwA9hIdVmL0UjvzmwrysjkVh+jQ
         Dn5cHcFwV/+k9sGDAgIIlK+XnXtwE1CDBt8m6AQd6HX0C1sscMWYvjaVby6F8uxcNp+Y
         l2eXMu27i+TfnThSpZ8jwfCIDvVupgOmm84YNvLb1q8o8JKnkJfxn4Jumb2txE5Ao0mW
         8eyYzI7SdxcwIFE9OKPs+zD3/jV38+uKvs1woQ/LSOQznAiHzg8N1/m6By5rVm87cFU/
         +7Jw==
X-Gm-Message-State: AOJu0Yy2kFg9cX5JuaMRFRNi9/oLetuZ8uugcbqwgvX1lVnGkRGMhCgL
	KIQ+HHgFWTZgEKTJB/G+qveGZK1vwg7Tdph54JFFcRxe/MypQv+ze9cNL1LtogItQBhEOAnrWNQ
	bv1yt
X-Gm-Gg: ASbGncuF3YSXW4znpFwpKaTejeoCwyc8ePolfbfrgfr1Ti8w97vsmdw0bICEcVlDxB9
	sPGOvDTar53WYTx+/5Ylog1XrBsXa2OiBI5SwdlQBrsBqBVK7A+YTPcDFix59BgrLuFZ/nqtAhh
	fNrR9xJFntpWR9hAEF92WLbo545zpdNEFbTZl7Bu8V8w6YYNq7OJUGW3AUMq4HDfahGBsNUhOAx
	d23op8k5MwGXFSwdyQM9fch++YJxxJpBZu0SHRfSnnT2HmnHYXJlTR0APpfvo1JE9DIhdEHn2XA
	FK8UqcP/NZDlN23puFiHOmvsNf6b0R3W5q8Yp/yh8Kf/xXZ5E4e0mDDIKvoXFjP4l2G7Qa0pgIm
	AITI1oJavQUZH
X-Google-Smtp-Source: AGHT+IEYv6Q+srxMWSH53P6TDxfuQyctL06B5V/U6eBx4Z+8pKr7ReiAHkXWUBJ6tnXGw2bXTNbKxw==
X-Received: by 2002:a05:6a00:987:b0:748:3485:b99d with SMTP id d2e1a72fcca58-74ee30456c1mr18168865b3a.18.1752510207820;
        Mon, 14 Jul 2025 09:23:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/15] webkitgtk: upgrade 2.48.1 -> 2.48.2
Date: Mon, 14 Jul 2025 09:23:02 -0700
Message-ID: <800cac7cc914d9c307b0301dc380aabcf62d6e4f.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220246

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-24223, CVE-2025-31204, CVE-2025-31205,
CVE-2025-31206, CVE-2025-31215 and CVE-2025-31257.

Changelog:
=========
- Enable CSS Overscroll Behavior by default.
- Change threaded rendering implementation to use Skia API
instead of WebCore display list that is not thread safe.
- Fix rendering when device scale factor change comes before
the web view geometry update.
- Fix network process crash on exit.
- Fix the build with ENABLE_RESOURCE_USAGE=OFF.
- Fix several crashes and rendering issues.

Drop fix-ftbfs-non-arm-non-x86.patch which is part of upgrade.

(From OE-Core rev: f33b79a07117d4327949aa1661221a3b9bc0f7e3)

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkitgtk/fix-ftbfs-non-arm-non-x86.patch | 31 -------------------
 ...ebkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.48.1.bb => webkitgtk_2.48.2.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
deleted file mode 100644
index 2381acb1b0..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-non-arm-non-x86.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8bee9eb95ae24c6a410f9cd614976f4653d020d9 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Wed, 2 Apr 2025 15:01:55 -0500
-Subject: [PATCH] REGRESSION(290945.129@webkitglib/2.48): Broke non-x86,
- non-ARM builds https://bugs.webkit.org/show_bug.cgi?id=287662
-
-Unreviewed stable branch build fix.
-
-* Source/WebCore/platform/audio/DenormalDisabler.cpp:
-
-Canonical link: https://commits.webkit.org/290945.155@webkitglib/2.48
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/8bee9eb95ae24c6a410f9cd614976f4653d020d9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WebCore/platform/audio/DenormalDisabler.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/audio/DenormalDisabler.cpp b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-index 35715e663ce7e..44ba08a33d5d9 100644
---- a/Source/WebCore/platform/audio/DenormalDisabler.cpp
-+++ b/Source/WebCore/platform/audio/DenormalDisabler.cpp
-@@ -91,7 +91,7 @@ DenormalDisabler::~DenormalDisabler()
-     }
- }
- #else
--DenormalDisabler::DenormalDisabler() = default
-+DenormalDisabler::DenormalDisabler() = default;
- DenormalDisabler::~DenormalDisabler() = default;
- #endif
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
index a58b44440e..75a39558db 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.2.bb
@@ -18,9 +18,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            file://fix-ftbfs-riscv64.patch \
-           file://fix-ftbfs-non-arm-non-x86.patch \
            "
-SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
+SRC_URI[sha256sum] = "ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


