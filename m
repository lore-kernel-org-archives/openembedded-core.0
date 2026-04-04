Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD95E63FFF
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 21:37:50 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24906.1775338668666363381
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 14:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JqlGfH+J;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c156c4a9efso3348530eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 14:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775338668; x=1775943468; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YteC6CfcuMV8FrMo3FJtoUVfrnjUUyzbh0HE6t1uxvk=;
        b=JqlGfH+JSJxz3lMfk92HNdB8RuJ44PWc47tn23vhUOdPrLVqgMpftuPpsbOtsWDVLT
         oMclPJrh5dAzwCobtX3VhXc5GT3r5QsByOk8+0B1FxqT7tqYzLzQa0AsDzAb4waiEBiZ
         ql4/pETZFg0X8jbYf63sMfmSo/pLr2VceSFoPU+5eUpeWPJBrP1P9qWxk/3c9jcf7O0P
         GFOTXU5RWXfBD+VeJLSozVxFTBVI0uL9kw1HB4MWMlt5MEkuK8aS5yyy0tg4PO4Io2PM
         StLms8spYpKpO4+VkQPkgbi7VJlGn/k5sMS2wghUWgjrDMfuJPfvjpwJjFF6NqHNDK3Z
         SOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775338668; x=1775943468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YteC6CfcuMV8FrMo3FJtoUVfrnjUUyzbh0HE6t1uxvk=;
        b=hZVMjAb6ilpYIssOqxwNTIsF5K/98raAWkeXegdHHLmnKjPe2cgwX80G1nMnBb3Lwv
         rIxeaSgMjq40nKT72blyMu8wbm/UScaCLyjO0LCfxAym1IcUaAP/lim4tR6u4y8404kU
         fh54f0F1k+USC+QEefWXCbCHcCx/9RNYB6E1Uo6sQgFJtIu2dOpjk4mBmReCT+FOgcfQ
         O2RvxY/zMWP6q651wW64Q7gHr6f2/qHz4YarPqv29qRkA4QyC1QxFhKzlvxtqP4nnpTq
         dPBjkKTECnsiFy9LgBknNF6O3Xx0gg/W+Ns7YaVTQs7WPYs6vqO/tHSBeAnVTxsWuPq7
         GP4g==
X-Gm-Message-State: AOJu0YzAeGCQ6evLLnhy1bNBIcXid7biubq8NvQpcvDgRS7ze6dUz5Wq
	pRqs8NXaKpFq+EHPmZ/Bagzt77DcA7Vg/KV0vs+69X/L5Yh27Kp/K8fZzZ34rE7M
X-Gm-Gg: AeBDievqdM1cRKoZk3M+euZP89LvoMO8V/9mwIcUeGYkghBPK5+Avmn1k1ZNs/d4arr
	an2PhQyDwVfBixqvv4fC3PBLEsZhlGTg8h1EDMp0KSdAWZ0Ljg2ysaQIvT2faClZkNdLQs0F5E7
	Ildj0+25HhBCOr80IMUjoJQN9XypxflALEdW0ZlBb/F9lRDHRiwEAn9v+h7rqZuyrgW+iBl6krr
	wFyKrbf96fc2CiLTZcOq5MMSTHX79Q5rJpVR/kjo+gjRoebsWTRLp/DLSdDjqlHlBD4JDr40ruN
	zceapRjb8hQY9pulrdwlhLdGsD3atppx496wN1QaM1adRRTavkwJ2rDkP4b33yS3NAGUk+xV/4V
	caGFgsO5UKNASI/feBwQz2tL/GfURbbrs6A05BUb9bfSbD6IBpr9OF83uGTlPUolZsqIDsTjOTo
	cbv7y57pgSgJiuUIlbGzsq3d1+VCBJUAPB4pd6q4RIEoNYEmF7v/0RAufXhZHkLNv5M9iEbBxRI
	W6Q6n2kXKPpYqkzxpHPfy2x60fwr6x/O/PmHAQK+R62DenfO3OU/kyjOHq4
X-Received: by 2002:a05:7300:fb91:b0:2cb:7663:322a with SMTP id 5a478bee46e88-2cbf9fe7dfamr4000208eec.13.1775338667461;
        Sat, 04 Apr 2026 14:37:47 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c3010e9sm11855740eec.14.2026.04.04.14.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:37:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] libxcrypt: Fix build wrt C23 support
Date: Sat,  4 Apr 2026 14:37:43 -0700
Message-ID: <20260404213744.3245076-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 21:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234622

latest glibc has better C23 support and exposes this problem

Fixes following errors seen in nativesdk-libxcrypt

| ../sources/libxcrypt-4.5.2/lib/crypt-sm3-yescrypt.c:139:9: error: initializing 'char *' with an expression of type 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
|   139 |   char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
|       |         ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| 6 errors generated.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch | 42 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch

diff --git a/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
new file mode 100644
index 0000000000..8868a5e344
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
@@ -0,0 +1,42 @@
+From 174c24d6e87aeae631bc0a7bb1ba983cf8def4de Mon Sep 17 00:00:00 2001
+From: Stanislav Zidek <szidek@redhat.com>
+Date: Wed, 10 Dec 2025 14:03:54 +0100
+Subject: [PATCH] fix -Werror=discarded-qualifiers
+
+On Fedora rawhide (to be Fedora 44), gcc became more strict
+wrt. const-ness.
+
+Upstream-Status: Backport [https://github.com/besser82/libxcrypt/pull/220]
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
+diff --git a/lib/crypt-sm3-yescrypt.c b/lib/crypt-sm3-yescrypt.c
+index 4f42aa66..17da83e1 100644
+--- a/lib/crypt-sm3-yescrypt.c
++++ b/lib/crypt-sm3-yescrypt.c
+@@ -136,7 +136,7 @@ crypt_sm3_yescrypt_rn (const char *phrase, size_t phr_size,
+   intbuf->outbuf[3] = '3';
+
+   /* extract yescrypt output from "$y$param$salt$output" */
+-  char *hptr = strchr ((const char *) intbuf->retval + 3, '$');
++  char *hptr = strchr ((char *) intbuf->retval + 3, '$');
+   if (!hptr)
+     {
+       errno = EINVAL;
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index c9cd5e6ef4..834f6e0c7a 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=b65434749329c34b5d32c2df3f1b4112 \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=master;protocol=https;tag=v${PV} \
+           file://174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch \
+		  "
 SRCREV = "db70b42bd7b2a5b00a8580c8dec0aa66791c950a"
 
 PROVIDES = "virtual/crypt"

