Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1918DE99074
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:06:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153079.1775815558497168169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LH6b/qYc;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so25387725e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815557; x=1776420357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fyyTVq8e8XuYXA844yDoJEYeGMSVdIMZTOmgyhTbIY=;
        b=LH6b/qYcscgIKtcp8yrrHX+U6OpTEFcXzmnjLHuxu6jgkcd/Kn0R6OqPig4iUeh50b
         8SNlTnmjaleL/sVLTYqCrksu9xWVgeQpjzFnzOgxhNl6DcSWugy9otiernZUeM0c35Sh
         TSX0/kuhz+p78xspYvP4XX0GQLj/M36rh2jypnQQnGOIkONH3Ab4A3HSq9tj174O8Prw
         BjLoDzrL7E9TBaHjL1C/8S9ymvzbDQ7acS6+0gegTNjWPUEaO0srFud8DjUG/tmhUgzQ
         TwqrULCWixBuwvNR2XZr3gKWucAvMoJH1H4ukQlTlLzWAi6raNq0cbD1N6HeqkOVC3uh
         57+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815557; x=1776420357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1fyyTVq8e8XuYXA844yDoJEYeGMSVdIMZTOmgyhTbIY=;
        b=nBlZqWPCeFMfngWvudrubwKuz0NkdzHIu1HHsOVizjYQp9Vp0ykcriEvUhR967NedD
         dXNUypFHs+ni6mBBWdSQ4O0nkzrtkmJ2rT4J3V5dgnT0AF13BvDJQ1WDi6tBeKcKwrIN
         q8idg1RO8mIF5XxFU7UmukI/lkqtYOMfX5cOaWJrXDKA9/zeJHz9QDExIeACIpE2RTBe
         8/x3SZI3Od5Xk5ihfiVuJZtVf3BVmlT4VWu7oFYUv2wmgcHTZ992xrIJ+HLVp6bRjgWw
         C7qcqXf5bFyjnAbwb/DMd3w3vzwugY/3ND1MjKKkO1exuxtqxvjZt8PmDA9uIQoxomJG
         VhHQ==
X-Gm-Message-State: AOJu0Ywd8d/KL1rbttGEDksyBKl4h66g9TkQKuDi2kC4/BMftzTpJsgb
	MFNr2GADEHbTw+SrKCQEEW5hkcFRWxloV52blVUcpAnXLcJZ5+DfiW+u0oKEjg==
X-Gm-Gg: AeBDieurQ7cY/IUYNGVgRbCIlgLJOwB8TEjOKEpcauFJ/AeL5XTlZ4UEymgto1odzYg
	Xx4JAlidBkn4o8s27mBOnvGPaf7GYPEVQZjN6huLDQ5JnFrhQuGBC+SPC3MMXOTb/ye31viUjq5
	Oioc0FDiy4/kOvV8xSVlxXyQvXz5lItewjfhDo3quTga4ClPMllbsWclIiAhwhus9r52jzVGD7J
	GQNTpEdygxdmzqFvgwdlPPAriOlyEzmfqhBI3do4kRvvBZnqiUh4M0dXpeAVc/+uADKCDegF/RK
	x28z1o1toKYgiN7PG+tq29qc1v9sfMoJpv3H8oi5RFqCBNOF9DslR8nyz0zPITZYR6Y7mu7K9jW
	LwTZekXZrxG/rccF1xK0bDiN+LfTA6cqlLFvaj+YCmtsvjmLslnHkuzuKMtGC/LYYBM6f1aZDfI
	veXT6x4evBboYejt49O0LS6h8Mg052QXmgKjI6fSmcw4/1qwasmJ48dCQrXk8iNeBtJDCXGggG0
	8CcTGAxNg==
X-Received: by 2002:a05:600c:a010:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-488d68af201mr32899895e9.31.1775815556741;
        Fri, 10 Apr 2026 03:05:56 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f1f9sm77551285e9.1.2026.04.10.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:05:56 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 3/4] libxcrypt: Fix build wrt C23 support
Date: Fri, 10 Apr 2026 12:05:47 +0200
Message-ID: <20260410100548.3944487-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410100548.3944487-1-martin.jansa@gmail.com>
References: <20260410100548.3944487-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235009

From: Khem Raj <raj.khem@gmail.com>

latest glibc has better C23 support and exposes this problem

Fixes following errors seen in nativesdk-libxcrypt

| ../sources/libxcrypt-4.5.2/lib/crypt-sm3-yescrypt.c:139:9: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
|   139 |   char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
|       |         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| 6 errors generated.

Compared to wrynose remove lib/crypt-sm3-yescrypt.c change, because
the file doesn't exist in the version used in scarthgap, it was failing
only in lib/crypt-gost-yescrypt.c

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch | 29 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
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
index 11ec87c14e..4e240f4d14 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
+           file://174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch \
+"
 SRCREV = "f531a36aa916a22ef2ce7d270ba381e264250cbf"
 SRCBRANCH ?= "master"
 

