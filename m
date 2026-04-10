Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18B2E99073
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:05:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152779.1775815524081172527
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lyto1PFx;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfd96354aso1147234f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815522; x=1776420322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk5G1KDkU4a8uYmSA8XiYTz/zaU1i7kxIjXcZpaSWkQ=;
        b=lyto1PFxNbZJlayii+DaM8HbK3UX8YZW34rVR31hNrxou6pLvZm2EUyYHin1Mj/xpX
         toDjuD/QRFwW4w1UtphIaF9Bf8gS7Iz1yyh//EmTrOKLm7pQpE5TS/VIDPp1Pnt7Mtc6
         2rqdragPTbcLAbTcHvWe7ME/DDTAP/wscCoTy6BTjCMvNd1A/tz2FaQVBD+B5B9FnzkT
         bqgAlJXqpOz6f5bkANCCvVcXSvrfjjkqKECqVlD3SFoV+CosSHP/sGZCU8SGmzGg2QdO
         36t7HYkNkkmCIWuG+IZ0T0Hff2caa/0cmab+cEPOqb3PAhRFuhczLecrlBwtEjp72ti9
         0aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815522; x=1776420322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vk5G1KDkU4a8uYmSA8XiYTz/zaU1i7kxIjXcZpaSWkQ=;
        b=UFcpWX42eG6feqWSbHmyxG2W5FPXvN2xPU7LcVe20WaLVDUnL7OPtk9pQeCHUsc+80
         TBm6qqU57tI7UBlPTElk7zlqC97eKV+U9FF0hfUyAlRvBDpF/KfLaHhNZ8iPF5WucRga
         cm/d2jrF2yiYyiI5uGNOJyUEnryUXAOSNXvL3Uxc+cCJmxlvOJc6S2mame48uK7FG2lq
         GbZbhHO8bKGxt52zzuMyNiWYRbR1pP+ca5BGJGzuN2xCSJFs/Niw2DHO2c3UraZfqjXx
         MZPOQgZPAfRHzXG2GAHTSohoiKAltcN0ONGbpO7sAQAcqou75hMECMgO9n8AO8/dvUrp
         JDeA==
X-Gm-Message-State: AOJu0Yw/BU8jGuh9lq9htRGZDMuTYUom2YvmYycoBs/R5p3fezuhen1I
	oWfDhXzmzqpl0MkzYd5iUye3zwMuLAauWWV4oZ3x288bbnU6JTnLCR+hQAtGeQ==
X-Gm-Gg: AeBDievARvxpGB9BjehAmd0DlPousvLDwzudpkYpkGPLaW3HizeS74WSro0ZaYMtGvT
	UfwOZMjfXf5WNX4v6oOz5AAWNVC28vuFx3zuqUkQ1RDNR9AmA+HepT953AAssI0xcgi0XDLBJu/
	A8CmvTsGXT1cb/gxveWriZztjfSYVLgQLkPuz9omN6fREUMvNVqVPsqastY4ZUJTpt6soSHkP1L
	vmHnDbAl0nqXuYYEsP6IlR4AekoRnq/AZwpSFudlidSDGwrFTF2hQKTsOM9GqNzxg94QZexMbhH
	kVWWpXVS80usqkpgwTVUR8TI+YmtHF7IaGQDZT6HIvs3H9EMjcReyTQi8CErRopNJ/gH03En61J
	uGYRqtfVwpLdkFNW3M3iGCk6e3XwFLQicsZEnZDwD/Owv8QSLxqOxAqH+Wgl1H0D5D3wv1dvzVC
	zIzQDTtcVv7Ue7EbTfcb3sotxlrKfgpIq/9jXcQw5fCZyWiUeNqSYw9P7/0fatv2bxfjvsUgh4Z
	bMwzresc9JGpHeg1y0S
X-Received: by 2002:a05:600c:8706:b0:488:b9c6:11ba with SMTP id 5b1f17b1804b1-488d6890cf9mr31341495e9.28.1775815522248;
        Fri, 10 Apr 2026 03:05:22 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5344e28sm67447075e9.7.2026.04.10.03.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:05:21 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 2/3] libxcrypt: Fix build wrt C23 support
Date: Fri, 10 Apr 2026 12:05:15 +0200
Message-ID: <20260410100516.3923530-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410100516.3923530-1-martin.jansa@gmail.com>
References: <20260410100516.3923530-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235005

From: Khem Raj <raj.khem@gmail.com>

latest glibc has better C23 support and exposes this problem

Fixes following errors seen in nativesdk-libxcrypt

| ../sources/libxcrypt-4.5.2/lib/crypt-sm3-yescrypt.c:139:9: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
|   139 |   char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
|       |         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| 6 errors generated.

Compared to wrynose remove lib/crypt-sm3-yescrypt.c change, because
the file doesn't exist in the version used in whinlatter, it was failing
only in lib/crypt-gost-yescrypt.c

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch | 29 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch

diff --git a/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
new file mode 100644
index 0000000000..456788e585
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
@@ -0,0 +1,29 @@
+From 174c24d6e87aeae631bc0a7bb1ba983cf8def4de Mon Sep 17 00:00:00 2001
+From: Stanislav Zidek <szidek@redhat.com>
+Date: Wed, 10 Dec 2025 14:03:54 +0100
+Subject: [PATCH] fix -Werror=discarded-qualifiers
+
+On Fedora rawhide (to be Fedora 44), gcc became more strict
+wrt. const-ness.
+
+Upstream-Status: Backport [https://github.com/besser82/libxcrypt/pull/220 without lib/crypt-sm3-yescrypt.c]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ lib/crypt-gost-yescrypt.c | 2 +-
+ lib/crypt-sm3-yescrypt.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/crypt-gost-yescrypt.c b/lib/crypt-gost-yescrypt.c
+index 190ae94b..e9dc7e80 100644
+--- a/lib/crypt-gost-yescrypt.c
++++ b/lib/crypt-gost-yescrypt.c
+@@ -131,7 +131,7 @@ crypt_gost_yescrypt_rn (const char *phrase, size_t phr_size,
+   intbuf->outbuf[1] = 'g';
+
+   /* extract yescrypt output from "$y$param$salt$output" */
+-  char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
++  char *hptr = strchr ((char *) intbuf->retval + 3, '$');
+   if (!hptr)
+     {
+       errno = EINVAL;
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 1292f4288b..d84cbc9db3 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
+           file://174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch \
            "
 SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
 SRCBRANCH ?= "master"

