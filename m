Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279CCC54E68
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:32 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.14879.1709739742259383366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0gwCz5e;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a446b5a08f0so195942166b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739741; x=1710344541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzaEaCsivYX/R2BU+jdtw8yCbPO+o6bEck4B9KWh3Cs=;
        b=R0gwCz5eGf4eAlnRTcpFpNtMiRQYFW35BjweJbofEUVh2+tOVMjkmeYDvARQbITkhg
         mvlPBgocpslstbWu+gsCdUN6kdrxUEZle2C0/3FPghOVHsiXZ6zTlTjTEO5VaRaB1/RI
         LI7rN7YlgtFR31lKUkzirRgu8P9+NDFW/2CqzHSsUc0aJi9CPNqwXZipsIvqjPd8LZIK
         J7GQLnuIpvAfC0nbOCCHDqC01pV6LsGRXaiI0njnvNj3hWPpEXEhvD1dCI6T16OTehZa
         YpqZ7xi6LmJ8r9gKahhb1ca2O4IFaIOMGxUau203aDPc+XhOHNUwa6R+amUqhSrwinRq
         q44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739741; x=1710344541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzaEaCsivYX/R2BU+jdtw8yCbPO+o6bEck4B9KWh3Cs=;
        b=Mnn9lLGjZQgRkLgEVKcJSq1YGckkRuPbtGaxkOKkOkifN0U3k+h36ESjZp3SzOYaJA
         uw/6yKKZr+KsaWI+a9uUzd/Hy9yQCC/80zsnL0iPElKImss5hssvUcN+uT/Q3gD1vkQg
         Sln0dl2jI18iS2S+iYKfFIEJob4ZDZPmq+Wm21bb5bgXWti/2zCsSu48jfWzIvieeQEf
         LiNlmP4x6aNu5OqBOs32ij+owY5yTue0ri9QpvmTPWQuJ7T4gSBooNzDWoaO6t0oBRgL
         lJXOcVxpL1LXXVirfQG+s6ReIkIHNck4Ict4sO6Mr9QHvGpN/8B4yqoKafwv3eYYM8z3
         Yojg==
X-Gm-Message-State: AOJu0YzEMs+75iSCiq7d6AxQIfKKCS8mcNHjsm1ZtGC/2PhsGUN50k5Z
	Mqrp0FtSes7LO0Y26XQqCdxCr0NO01qx80xr4eNlsv+J3ul3lgiPR9dbezIq
X-Google-Smtp-Source: AGHT+IFButuaepTj98L8Hxfoe+c0LmGrOuNp246Tss5lKteW+8y1F9nz1iNePfRaKMNHqufuzYtNPA==
X-Received: by 2002:a17:906:f355:b0:a45:b986:e1df with SMTP id hg21-20020a170906f35500b00a45b986e1dfmr2428584ejb.5.1709739740716;
        Wed, 06 Mar 2024 07:42:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/47] python3-setuptools: upgrade 69.0.3 -> 69.1.1
Date: Wed,  6 Mar 2024 16:41:41 +0100
Message-Id: <20240306154151.3741709-37-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196720

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...distutils-sysconfig.py-make-it-possible-to-substite.patch | 3 +--
 ...001-conditionally-do-not-fetch-code-by-easy_install.patch | 5 ++---
 ...on3-setuptools_69.0.3.bb => python3-setuptools_69.1.1.bb} | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_69.0.3.bb => python3-setuptools_69.1.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
index 7cafde4d5d7..0f6c9d250d1 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch
@@ -1,4 +1,4 @@
-From bfa655d63e79ba5a75441604ca14a70800794189 Mon Sep 17 00:00:00 2001
+From d393759315b189a738e4b6a2ce31dc18dbbfae29 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 11 May 2022 21:41:14 +0200
 Subject: [PATCH] _distutils/sysconfig.py: make it possible to substite the
@@ -15,7 +15,6 @@ would happen to this module in light of distutils deprecation.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  setuptools/_distutils/sysconfig.py | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index 9b17dba178e..2a3c71fb629 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 519e2845014f04b4c23b5cf8f92fc4e5dcf40f20 Mon Sep 17 00:00:00 2001
+From 40648dfa770f9f7b9b9efa501c9ef7af96be9f2d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -9,13 +9,12 @@ internet by easy_install.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  setuptools/command/easy_install.py | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index 8ba4f09..8ea40c5 100644
+index 5d6fd5c..377e575 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
 @@ -676,6 +676,11 @@ class easy_install(Command):
diff --git a/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
rename to meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 715c89338f7..77d4e0aa030 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.0.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "be1af57fc409f93647f2e8e4573a142ed38724b8cdd389706a867bb4efcf1e78"
+SRC_URI[sha256sum] = "5c0806c7d9af348e6dd3777b4f4dbb42c7ad85b190104837488eab9a7c945cf8"
 
 DEPENDS += "python3"
 
-- 
2.39.2


