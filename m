Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B96C35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:13:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.31818.1742141585527225586
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tqexcfxi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso15234875e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141583; x=1742746383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqXvuoBGPI+RAr/ofb8h/UOIaNvZBSvY+LRqNpb9Z8w=;
        b=TqexcfxiSGLm2u4jhBKMDxY53zqETtlCNLow9sRiUt7YaQYy4ALpVmE6rjVaGcFmBi
         +T50PUjL5AM+9kXJ3+r9aR1boYwFpVRj3lNLmABQ3U4AEOHIXCi9S7rHTuKFZOJwKx0o
         OuFkV452xv/YmmxcK5XRhXKYw0pkEBxyWhRXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141583; x=1742746383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqXvuoBGPI+RAr/ofb8h/UOIaNvZBSvY+LRqNpb9Z8w=;
        b=FmAxrEZXrDC+QwWAb/2532JHaTTHeUBZrAd42IjqG8gOb14f+3ZRRuo4ArErDnTluw
         SQ9DNq4thTKY4YIwfHKKAiHMFHoQ/Snu8M/4T5kagB8fecwT31uPf2paR4KhJttJcZya
         aVSClovl2hzvXjeTV6DOudO5LNTkm4WyvvKOAMi23V5xGbCQeCkyuexX3wwmiZSVu6h8
         8ayItE9ysdX7pCrgja5r+crjXV1k4rNSICMfh2YJZWXKuUUxlT2NphGJ7vfGeeRuPWqf
         Jk/KB3xtFsQpnAYXXnx2Fe6fZ1xiDzk9bw+TYpVWJjnW6DeIRjYgq3uBhzHM2VxIUecG
         PUXg==
X-Gm-Message-State: AOJu0Ywvql5Cd1AaCblNaGFZWnw1HNOil5RzJ/RlCEbkKLTdzNjzPjjM
	1nwTDndt9c16K4cmCGQUouqiUQ74AWuqibv5n165vOKSx3sc7wYJoam7ebHsdyhuTZjd4YE6myT
	r
X-Gm-Gg: ASbGncvU2fhM9iXw743bYw3mFKU6o+geZhWL2HfrMdNMI9Rn74TVdQEFUt+PiogfNXa
	GXjB2BcfbhnvfDMlZ068AzbFTvZK5VsF+uB/ENUpUhChjYYgicXXy3LPnVMWrShJXxbQpVPFY1v
	usPK0HmWLKhasJR2KcZf+/3+dI8wNz8GBzcV27MMYpUqX6IAsTPgWqLBhCiQEH7ADLmrnTmQMJy
	bGYq3kkvg23BZLWlC7+ZTkg1WkBz5xV9l/N4+NEMqfuBKzmeX0uCz822QbBGkw3fGRJU1kmGkRv
	A5xjfgwKgMqoO0YmVlQsygT8++6jCQ+Pnu39I/LDIom4+KwLktFlrNa2SV8G468LkTNhqTR4Qw=
	=
X-Google-Smtp-Source: AGHT+IF0KzBMRfOYAAATD2KCWwmF0x4SMPz2Rw/Xzm+lyK6FwkdYsonkv2dBOA4BKajh/L49cwyVng==
X-Received: by 2002:a5d:5f4b:0:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-3971e972011mr11038837f8f.34.1742141583392;
        Sun, 16 Mar 2025 09:13:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.13.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:13:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 36/43] libx11: Upgrade 1.8.11 -> 1.8.12
Date: Sun, 16 Mar 2025 16:12:02 +0000
Message-ID: <20250316161209.3629986-36-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213039

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/libx11/disable_tests.patch       | 24 +++++++++++++------
 .../{libx11_1.8.11.bb => libx11_1.8.12.bb}    |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.11.bb => libx11_1.8.12.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
index c1b6cde534e..d2c5f5f1422 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -1,3 +1,8 @@
+From 37debe301336cfb61e7f81e9e47e5e1019177d8c Mon Sep 17 00:00:00 2001
+From: Marko Lindqvist <cazfi74@gmail.com>
+Date: Tue, 8 Jan 2013 09:16:37 +0200
+Subject: [PATCH] libx11: disable tests
+
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
@@ -5,18 +10,23 @@ Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Update for 1.6.1
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ nls/Makefile.am | 5 -----
+ 1 file changed, 5 deletions(-)
 
-diff -Nurd libX11-1.5.0/nls/Makefile.am libX11-1.5.0/nls/Makefile.am
---- libX11-1.5.0/nls/Makefile.am	2012-06-02 09:37:18.000000000 +0300
-+++ libX11-1.5.0/nls/Makefile.am	2013-01-02 16:10:24.960156131 +0200
-@@ -36,11 +36,6 @@
+diff --git a/nls/Makefile.am b/nls/Makefile.am
+index 7eda58e..4d4050b 100644
+--- a/nls/Makefile.am
++++ b/nls/Makefile.am
+@@ -36,11 +36,6 @@ locale.dir: locale.dir.pre
          < locale.dir.l1 > locale.dir.l2
-	cat locale.dir.l2 locale.dir.l1 > locale.dir
-
+ 	cat locale.dir.l2 locale.dir.l1 > locale.dir
+ 
 -if HAVE_PERL
 -LOG_COMPILER = $(PERL)
 -TESTS = compose-check.pl
 -endif HAVE_PERL
 -
-
+ 
  # Per-locale data files
+ 
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
index d7c34c74a16..5ce54817432 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.11.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb
@@ -24,7 +24,7 @@ XORG_PN = "libX11"
 
 SRC_URI += "file://disable_tests.patch"
 
-SRC_URI[sha256sum] = "3b74e82943924b45a0b778cc6842976909c3010d9445a8fd185e1dca4d380e88"
+SRC_URI[sha256sum] = "fa026f9bb0124f4d6c808f9aef4057aad65e7b35d8ff43951cef0abe06bb9a9a"
 
 inherit gettext
 

