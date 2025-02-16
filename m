Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B4AC02198
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 04:20:00 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.23755.1739679593119528804
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 20:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZFv9IxYx;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f42992f608so5147782a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 20:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739679592; x=1740284392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8WHgokzJDllRQIRHUkmlUijhZde2WBLp8Q7XhuHSV8=;
        b=ZFv9IxYx8m7Pppy5x/EqgpSQa2Kq2VXfigML2nK7DEsaKTHBpKYow4iTR5r5FfRhjw
         UXn9BLnL3kEGjmwBovTzEEn91MgGdYS0R0kvrDPpCxYgmG8BIaTF4EgYyc9QLb5Kisoz
         ZJwdpn/qGy3Y2orVZBQteQvbIz9sw29xlmgv/nmxlZ/+qP8L6axPNlEPgq7dHw/fFGUy
         sOXe0nqNADkTGLYwl8TYUhbpIpC2UMO51Eii92qHu3MHjqQxiFD7+ZoIRxS/8SwOnP6S
         7vNQTQqIt3ti/506UYGJG6WFVfCk6GSeuXSZO2FDk3aiFYKTR2C+A6Bv6O4H6wR+xFU5
         msIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739679592; x=1740284392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8WHgokzJDllRQIRHUkmlUijhZde2WBLp8Q7XhuHSV8=;
        b=F6raRdmRXQyu69kDpyzm0CIW4Z8o4NMZ9t3EMDt5neNhVIp9Tibw2w5fxvSRFfkige
         IkuMKmm/XUlBaCB73Y8v36lXqTpMwtTYJ8j3V7gYVnSHbQ+q/0IjI6PyfEFjKxGyM9dK
         RMl0PqLpFWR9hdFux7E8uwzcN00W58c3w55tIVkGmcOIJKOL5efrW/ScYM6nXdmK5FXs
         0AUXHzG9fscUqv1324iFbrgofP94DClePDXftSAdqZOZsEhs9O9JQvqIu5vNV8JLlKO4
         2A+AEHxt0Gq/gvP2pGdkUDdv5yMnaqG+l9OE+Ko3+blvTjnU/n5Xl4QPdffnJlormrbv
         Kl4g==
X-Gm-Message-State: AOJu0Ywf8PV5m/x7rRenPMvBzLQMwJ5v+NsGaCaf0wAX1Z+RRtwWdKOa
	D9cJcTGQXY0Co5CKGIhnn1UhKoZsiE0GnMr4oJIlWKsx4Ft5uPhNZK5KfYhf
X-Gm-Gg: ASbGncvZJTyOPoDE51MM4wBWgqdOx8ndzJ7SGFzT/ukSCeMLI7DsJbd4GDX9Kcqu9Xs
	1dElMafoPVFOPi0zkwbCaiN0VwRzY0FBO0w157Alug0E6RbllxfZfp9PpliygaTZqexRz6UW7NC
	2u/RW/DHIXo4y0GftDyFJLBu5icDldhyUljgUPbl2twJEY1D5G1CZpxcmK1bZQElgJhgEekhYx6
	O+XG0icBaPxNeJbUIMYAmqFeHqJcT9IsixuYIqiv09zYvAf4V1xL+csmYH0F6c8Jzto2n5z+ls9
	lJ0mMaQ=
X-Google-Smtp-Source: AGHT+IHwoJZHZT3IwLd/mtwYPQtKfiiijDVaLOqYrlMqegf5aZk8elbqFiF7e0N6FiJOQ6V83ZycLA==
X-Received: by 2002:a62:b403:0:b0:732:6221:edea with SMTP id d2e1a72fcca58-7326221ee7dmr6871485b3a.3.1739679592157;
        Sat, 15 Feb 2025 20:19:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::b976])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326a6e5457sm1436363b3a.157.2025.02.15.20.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 20:19:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libxcrypt-compat,libxcrypt: upgrade 4.4.37 -> 4.4.38
Date: Sat, 15 Feb 2025 20:19:46 -0800
Message-ID: <20250216041946.2854447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 04:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211496

Drop patch which is already applied upstream [1] since 4.4.20

[1] https://github.com/besser82/libxcrypt/commit/fed81d1a98fab52839b60a55447d368899034847

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop doubly applied patch

 .../libxcrypt/files/fix_cflags_handling.patch | 32 -------------------
 ...t_4.4.37.bb => libxcrypt-compat_4.4.38.bb} |  0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  3 +-
 ...ibxcrypt_4.4.37.bb => libxcrypt_4.4.38.bb} |  0
 4 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.37.bb => libxcrypt-compat_4.4.38.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.37.bb => libxcrypt_4.4.38.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
deleted file mode 100644
index 879950bbe37..00000000000
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1e94a03541e35718dc1eaa8023e0ec3cf2de369b Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 30 Apr 2021 10:35:02 +0100
-Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
-
-If you pass CFLAGS with a leading space, " " gets passed to popen and convinces
-gcc to try and open a file called " ". This results in a confusing error message
-like:
-
-x86_64-pokysdk-linux-gcc: error: : No such file or directory
-
-Avoid this by stripping empty elements out of CFLAGS.
-
-Upstream-Status: Submitted [https://github.com/besser82/libxcrypt/pull/126]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- build-aux/scripts/compute-symver-floor | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/build-aux/scripts/compute-symver-floor b/build-aux/scripts/compute-symver-floor
-index 4ec82e1..8117342 100644
---- a/build-aux/scripts/compute-symver-floor
-+++ b/build-aux/scripts/compute-symver-floor
-@@ -36,6 +36,8 @@ sub preprocessor_check {
-         die "C compiler not available\n" unless @CC;
- 
-         @CFLAGS = sh_split($ENV{CFLAGS} // q{});
-+        # Remove empty elements, particularly leading ones which cause issues with popen below
-+        @CFLAGS = grep {$_} @CFLAGS;
- 
-         # Remove empty elements, particularly leading ones which
-         # cause issues with popen below.
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9ecb333fb96..55619daef7d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,9 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
-           file://fix_cflags_handling.patch \
            "
-SRCREV = "e5714d1f0a477f91ce3986fa63651c7710f0e183"
+SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
 SRCBRANCH ?= "master"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb

