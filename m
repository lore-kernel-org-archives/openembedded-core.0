Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AD0E6ADD1
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87691.1766434110776796389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iYfHmIZk;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b61f82b5fso5628765a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434109; x=1767038909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI/j2WziCaLNwNJ96VOtdHWoSg3xSz6Pq04oFCqlnxg=;
        b=iYfHmIZk/0hH5+iYHxBTWnVn0qtbV7PyO27+6bVBeed4Ft7Iq/UjuPkn/JTaT5sfW+
         zcosduTfulmOiGfb57axDZJlkLu7mTApxxW36qCJSmgVSAJLCd9uoKgtJwdeNRZFX9rZ
         Ci/T1GocEbs0SdQHG+vqZltp129yDzc3JMWTAmy9R4RKxegx1nQ/JZwyeZ7mG7A33yha
         yzulDFeJon+BIIUI3JHaEojyWNh1AysXHIwKI68rt8R3MbKrW8p/Yp/EzzRnEsvXPwFJ
         2lljcItcbTB3tbDu7ft6KY3a5ys62Gzapn8CuXPPTpm+dhtFpsQ8RVtzeM/BExa0tHgz
         TSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434109; x=1767038909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RI/j2WziCaLNwNJ96VOtdHWoSg3xSz6Pq04oFCqlnxg=;
        b=C4CVLc6T5wN592khfgHw7frrTeeqvxMQICOwS6Ki+ezfhEA2qIkOeDd5Sc9l0o5Ted
         bmKJIFWWOJTsuZxvsPhNuhR6HJBkOOQIGkhSvNyquPqY0bfGdHVWzzc46c3X5A1+xDKp
         FNHr0SFIW9buJlwCC6wxZD5YNXrPbmDrcD6YJmkg58vE025Bibz1PdZwRVEZdXWTpWz0
         +SBH47SgyuHxxf9yg4eFYZi82n/ST8pqKA/SPhLkkiHhAdB7Al51wbnh/vO08zp3KMrl
         GpvrRFd4STYadaTpwnV8Q1WNBobfP4dOFsMLOUBFSeLgXJ5g1aNovdK8Vp8tQ/qvbaRY
         BOsg==
X-Gm-Message-State: AOJu0Ywuzo6TkmNRdcbknzQmyQBwxNZF4DE178pXTmAtUKw0bnX6DahT
	GiHXib/PpgOOS2HQYxaWM3/+MMps2JDa0YCKG/bkABxcB4itfy7jrI69YA+oxA==
X-Gm-Gg: AY/fxX5uIxDH2VWLfQjOEUw/f/9OIyiRQH9GA9W+WZwvhOp+a5itW8jXubl+CBiT0JC
	v6E1d51TJVEI8Qz3r/ExwCAsseSxUJUBjNVaG1edm8c7CfxlaK8XqAHZslIZ4fvlZojKBlQRHyA
	ayxcpWIq7d0jNAQ10Wv784K5YOPw4VjH8H+jCVhtwLuWZ1OrUwxUhoxfrAPpLeCPNXLR3Ps07XD
	3FWtRNhIqXJBraHAV9K5L3if0xpnXX86W+BmKgfJjBi1splI1yKt1mAGkk8OxXWJDfyJ9RAriij
	X4IiU3QayAo7YRGbF59woULWLRYJJ9IP/JPGHBUiasDfrzey76fqqMih9+Ren0ngjbPhaV7Zbji
	eJAk3/kr0zyHlPbGwwJKRv9yKtY/U8pYe2clBmUnUq5XB2t9fUu1u6tW1RvKTNyR93OqgvBhXTB
	iH1QGZmVaY9brEUKJowMsW9FMjm7WOLKhQPSBAQCz2CBQZF3I=
X-Google-Smtp-Source: AGHT+IEqQyQxXYlfALjC/1+T5tTmD5vOkHjiP99P5OVnPZcARWrtQkal1Zm7QBcBIvVD6hllwcjJvg==
X-Received: by 2002:a17:907:3f89:b0:b72:134a:48c8 with SMTP id a640c23a62f3a-b8036f63805mr1306744166b.14.1766434108917;
        Mon, 22 Dec 2025 12:08:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 062/114] python3-numpy: upgrade 2.3.4 -> 2.3.5
Date: Mon, 22 Dec 2025 21:06:44 +0100
Message-ID: <20251222200739.2278706-62-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228386

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 4 ++--
 .../python/python3-numpy/fix_reproducibility.patch            | 4 ++--
 .../python/{python3-numpy_2.3.4.bb => python3-numpy_2.3.5.bb} | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.4.bb => python3-numpy_2.3.5.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index 3e08b43587..3a77ffa4e0 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From b036c984b019d941ead2efd5a05d1588c4bc193a Mon Sep 17 00:00:00 2001
+From 5cb7316128845e3da1ce1618a42b2e3222b59ba9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index 6478548..c0620e7 100644
+index e428b47..65d95ed 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
 @@ -326,44 +326,14 @@ def add_system_root(library_root):
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index 8b39b7bcfe..71b3634b77 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,4 +1,4 @@
-From 45d76002bc989a9098141f2bfcd2d2fabc5a04d5 Mon Sep 17 00:00:00 2001
+From 6fd79cbe7ae9f0a7a5fc4e5cd6c5c3da9ea09815 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 29 Sep 2023 22:53:24 +0100
 Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
@@ -26,7 +26,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/numpy/distutils/ccompiler_opt.py b/numpy/distutils/ccompiler_opt.py
-index b1a6fa3..7b0302b 100644
+index 4dea2f9..00f563f 100644
 --- a/numpy/distutils/ccompiler_opt.py
 +++ b/numpy/distutils/ccompiler_opt.py
 @@ -991,7 +991,7 @@ def __init__(self):
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb b/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.3.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.5.bb
index 520c567bd4..55b8091ff8 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "a7d018bfedb375a8d979ac758b120ba846a7fe764911a64465fd87b8729f4a6a"
+SRC_URI[sha256sum] = "784db1dcdab56bf0517743e746dfb0f885fc68d948aba86eeec2cba234bdf1c0"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.47.3


