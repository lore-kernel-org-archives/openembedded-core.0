Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0287BF8DFF9
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28261.1776378798284297072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h6qflklL;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso541675e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378796; x=1776983596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXzXM3DbToyzC5TpDNpfUuaOMlAQtMvX2S9gnLe3IMg=;
        b=h6qflklLwjAGgJQORL7J+QeJcSq8zCHOxFHuq36xVJmKvlgysytZKEhys11EXxCCke
         /0P/SBeHjM3ToBRKwaK0uu4rUevh4sAHmXinKtJn4MQPvYdlJgr1975PnvcCJie93Hw4
         RYMsLkEOoMlkgFbqaY0bbycrpxvcbty/za5BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378796; x=1776983596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WXzXM3DbToyzC5TpDNpfUuaOMlAQtMvX2S9gnLe3IMg=;
        b=ndby7b2QV9cn8wKjKOl7oNBe/cWYqGW7Pe44xni60gxGqr7l/Qv47+LkQXPUEdIhu5
         y10xKwex4Z/31bYum0Y4gYhJ5eRgz9X3uO9ks9lRHWCdIXpUEEjQeAsA1tGai/NxFQUd
         X1KbRS3f0Ws8znLz4zBfWvQBsbZSLRSkZcI1oBp8+qlLWmKDqINeO6eACuZkdXDRAQA+
         tuwM+BNpoE5qljzJa6OR7glYNzkXnvZUai97sFY8RLW0u65pSX8sYZ7HoHgGVQL8BzB3
         vE98pZzZjBmPSRjYkj3F7ljTiIAGAD80+oupeUSWfhjuUdD2gHgLnDbqVJ+TANFL1DUb
         MS4w==
X-Gm-Message-State: AOJu0YzQzJo/UQ75/B2Sspw/bmo/jLlLtHleU1+f+DcbObx71a2W2ihI
	ITP+uQ0bodQ6/sdIIrWwBsQ8bFis3q15gp/mIHwBAR2jU7XSFof/1YsgIJ8IZipX8Uroec4JIiq
	BEhAZG280y4RN
X-Gm-Gg: AeBDies6pSRnoKFYOhTKQbcX09P4KgoBrErisLFhbo+AKA+sI7n/dvQBqqfkze/dusO
	KqGVcrM28LYjEn0/cNgeX9MCNBsE/iF5LrqeAYlnOSoxwFdP/mm8mo6Se+RJX1xiynNMOVNwd7s
	4Fu5ZdLU8JmFA8fxZnss/+b6aGSJkRorzhibMQg12/jLAo7PIfgsS9DLZqfR8kF4aFTNxB4CkPB
	EFPe+oM6aCqYYnftz83Jv+KNcyxEJMkXqejdfVdUTcyKRY32XbHwPJ4DMlJ3NDA2v8fxO5CNGId
	gdBYv+36CYj8eKBLUvpjnJaG7b+oyVIC2ntzg2ywvceYImdOKtMfCnr86R75MZft4aON6oJHxYG
	CLmEG6msy+N9StzMHWeo84M8fdqnHWCOwyL+qQnjkY5LsLdwAiKsiekF/NZYkGCN0ZIBTf4/eFd
	pt3spFff2IgHIeE++W7Qs2nwAMjNge4vTyS9+iqqPtZu1jgtAncjUDp0RKQIgSFtNDkM2adLeTM
	5Gld6Sg0/w6/hAXA5bG21P0H5O3z7yFgxWM0g==
X-Received: by 2002:a05:600d:8402:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-488fb778740mr3702295e9.16.1776378796396;
        Thu, 16 Apr 2026 15:33:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 27/51] libxcrypt: Fix build wrt C23 support
Date: Fri, 17 Apr 2026 00:30:10 +0200
Message-ID: <e99b48a8e6b8a8ebc0b826861f4274c0cc44103c.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235456

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
(cherry picked from commit a666b8e71ecda97db58c90d5af137671f9823f38)
[YC: fixed patch format]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch | 29 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch

diff --git a/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
new file mode 100644
index 00000000000..75749c054a2
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
index 1292f4288bc..d84cbc9db39 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
+           file://174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch \
            "
 SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
 SRCBRANCH ?= "master"

