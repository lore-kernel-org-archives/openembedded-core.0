Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B06DFF8846
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31981.1777064217538320876
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a/Gp+hCC;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so42145705e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064216; x=1777669016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnVwDhdt97HIlDMFlBREBoGIjAdn1DyMOVI4olZ4HgI=;
        b=a/Gp+hCC14QsiQGP99ULNUI9ZIstCXkx99aRsPlG2pPbyDDWPODeQWKdh5H+ZJwi0Z
         CBRCitdyMmauu5iS6Qb1X9A++wVzpnQVhRwihtBbAvp3wCFD5BhyW8mngFiY+q/aMPh6
         nOP3usUON3MTQrnTwKfue4IYuztqobI1Bz+Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064216; x=1777669016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CnVwDhdt97HIlDMFlBREBoGIjAdn1DyMOVI4olZ4HgI=;
        b=E2OiXX/FYCy/3wiNW/qaliIjZ8CSae4SpoJ7gege7JSdDw6RTxWQy2UbMLn803u9B7
         jMO6/A04gucfJxEz7wTBqg4NSTIQqsPenSVtRnD/BW7ji0/9gw6s33u8v14RDD4tuugh
         3hPACcHP4n+psIXELZJw+JovQ+D4uTZeLw7AWZhlbxlm4L1+R5dSBWOVeu8YGKzh35AE
         3ZpcqZQL+OSyqn3LnC//uaPs7LgTxJpWuWQLadBoiwBfjm1tjgY38zIQtBAsvDFwDhC+
         qtARqrJFQamSlkszFd2SEZoZnx7SJptUWfzTXTKn1ZdFP24vqbYYYDH+1qlhxQZFVnRY
         a8ew==
X-Gm-Message-State: AOJu0YxBvvPAtvuqERzScJP9Xrts0+5IooE7qzDc2SnvqblAYZ0YIXet
	nmiC0VGqRC8gfYAimTx3yDbreOqQdtch9t4VQQk1oEvYOHmvzqX0Bd77jgIk0fWWo72J5aVa1pF
	Rt7WjpgJmM1fj
X-Gm-Gg: AeBDietpuXjpxPNGcZ7rj1K8eNK2WoPun4v8Rz9c3HM8meDNJg7ET1LQ/DuFo9Jcr9q
	m3pXpoaM5/bKTspj67kWDs1hx2Tt/xHcIQJOmIt5W1PbDT0//KZZFWyrsSqmx8JpOseoUMBfzCz
	JLgdWHslqdfIOIsTUnuEWYAdSTWVftn2PbuSN5H+eazAyBEcXxSckQ8p3+LpBl1gQ8of7XBTYD0
	9RakYUvgNL5SKMoubMdkDwO8yqOg8VgEIfEbnuhqtlNTGesxgIIdWTsgJ+q5Wb+4xtwt6H+r198
	wWhJDnKTKPu/HeiGdr/Ch9psJ/OB6y+d5LD2kdyQZSuhIYzII/HhgKpBzSluLvGgZOMIEGCNXtc
	MNA5SyAAAc+haTus9kcvMEbs26v5VL/q1vsOwSXxw0mfJDPhfwXsKVqzRzixnZbkg9felREzTsM
	Ign+pjiieoAaZsWNWik/2kBO4/DuTNyZ6rs8era0i00ug1yGEQpW0hnKF68ixBU/JnvlkWNe3L+
	iww9GjcSNC8EC3RDKdOYV5D3aCeXOJ4SylAFQ==
X-Received: by 2002:a05:600c:19d3:b0:48a:55ec:c007 with SMTP id 5b1f17b1804b1-48a55ecc113mr232091785e9.15.1777064215737;
        Fri, 24 Apr 2026 13:56:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/66] libxcrypt: Fix build wrt C23 support
Date: Fri, 24 Apr 2026 22:55:32 +0200
Message-ID: <caab28b10a1f45981ab605d36a8707b63212e1f6.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235906

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
(cherry picked from commit a666b8e71ecda97db58c90d5af137671f9823f38)
[YC: fixed patch format]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...24d6e87aeae631bc0a7bb1ba983cf8def4de.patch | 29 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
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
index 11ec87c14e8..4e240f4d145 100644
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
 

