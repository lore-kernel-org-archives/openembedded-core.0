Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F74C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:14 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.39305.1683653041433459721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=k/zNYNze;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9661047f8b8so713556266b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653043; x=1686245043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmVeQLjnSdMEgkQs44gZXjzekVJlfuRwAiiVkJdIKlU=;
        b=k/zNYNzemua8uO2VYpAb9yFtxiuIUpkIzjN78d+4i1JKFEl6akLSLY1w+z3ZXZZtRn
         ZkKUCFwTDUydINraO0ff91tIS1nuLfEZ4XRihx+vbo8Auc4VeA8CnpV1lh5R9Gyb8eZJ
         Eh28unkxI2uXIcv6oQFrYuxoXPUm5DB13gUHAgapUiT+OMqJCOvFUub/I2XzYdMKeiS+
         LTKOpFrGka+9Mj9mXuKgtjJsZJEfpavGu774I7b9Ej1TlSxNXU8Cpg96s2Ae6sZPVkk8
         /XbBCk7VyWM9Kcsq5F3GCiiVTWD5BtoegjHqrcWjTzA3nQuclSAfq9MrJdb3pVfhdcC9
         kixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653043; x=1686245043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmVeQLjnSdMEgkQs44gZXjzekVJlfuRwAiiVkJdIKlU=;
        b=V+7RRa6iWTtAuwPgPag3DKqwZglSYfUhPWWl2ggg191j6E0GyqN4VevnnYXZ9bnKsH
         t+wl4ADi31GE/cQ9Nt17pK2gKBIUBvZxUYk3H+NQS/1HTnSTCgw6q0wQQeL9LrRQCRW1
         UE3PqRdliIIgLWx9+cx5q3v5v37P0MrxIpxwc1/45PznMa+4fqBHLeU30a5rulm0r8GZ
         wPDK3kHZDFnzI4HpQB29phj20o9K7BZ9WAQp2yYU+dbwmKTJCDHrCA8G4g6N3YZoL3tm
         6lEvyjEnl4eNw7FAOIIeZ9e1XSHgdA3Z8PhwViEVdwfIobMzL7ELCXu5h1fy7zd0zaBF
         fx5w==
X-Gm-Message-State: AC+VfDxjO9LygKpC/mOmK0nXGrDsNT4YNTti9r0mlK4H0oI4Gy3fjSb5
	brgQ9NgZXW6hKBlluiSmppZ68TvVNT0=
X-Google-Smtp-Source: ACHHUZ55y1u0k+RADZOb7bOB+I9hEPqVJpqulckdcuGAscZ2Gyz8uyNjU6zOyOSTJ0SEZYC2x4WC+g==
X-Received: by 2002:a17:907:31c4:b0:94e:8431:4767 with SMTP id xf4-20020a17090731c400b0094e84314767mr11337080ejb.38.1683653043616;
        Tue, 09 May 2023 10:24:03 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/27] libgcrypt: update 1.10.1 -> 1.10.2
Date: Tue,  9 May 2023 19:23:39 +0200
Message-Id: <20230509172344.1516743-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181077

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-libgcrypt-fix-m4-file-for-oe-core.patch |  6 +++---
 ...pt-fix-building-error-with-O2-in-sysroot-path.patch | 10 +++++-----
 .../{libgcrypt_1.10.1.bb => libgcrypt_1.10.2.bb}       |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.1.bb => libgcrypt_1.10.2.bb} (96%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
index c873e24ed5f..cbfa30f0ada 100644
--- a/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-fix-m4-file-for-oe-core.patch
@@ -1,4 +1,4 @@
-From 839f38e5ecc22b7f1b837284bbbffac8cb32ab1e Mon Sep 17 00:00:00 2001
+From bcfd89abdb5110b93314297120412d4c7f2da313 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 29 Oct 2019 14:08:32 -0400
 Subject: [PATCH] libgcrypt: fix m4 file for oe-core
@@ -17,7 +17,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 4 insertions(+), 86 deletions(-)
 
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index 19d514f..21125c7 100644
+index cd4249e..e53a36f 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
 @@ -29,41 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
@@ -35,7 +35,7 @@ index 19d514f..21125c7 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"${LIBGCRYPT_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG libgcrypt --exists; then
 -      LIBGCRYPT_CONFIG="$GPGRT_CONFIG libgcrypt"
 -      AC_MSG_NOTICE([Use gpgrt-config as libgcrypt-config])
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
index f9c362431c5..cf9ebfb3e61 100644
--- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
+++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -1,4 +1,4 @@
-From 3c6c10eae0993c8ca60879494c6650f7b8f54ebe Mon Sep 17 00:00:00 2001
+From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 16 Aug 2017 10:44:41 +0800
 Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot path
@@ -25,15 +25,15 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index d644005..1cf5072 100644
+index c3d642b..88c883a 100644
 --- a/cipher/Makefile.am
 +++ b/cipher/Makefile.am
-@@ -147,7 +147,7 @@ gost-s-box: gost-s-box.c
+@@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
  
  
  if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sg][2-9sg]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/ -O\([2-9sg][2-9sg]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
+-o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
++o_flag_munging = sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/ -Ofast / -O1 /g'
  else
  o_flag_munging = cat
  endif
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
similarity index 96%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
index bf9d7cbd102..58f07a116d2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-bench-slope.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ef14ae546b0084cd84259f61a55e07a38c3b53afc0f546bffcef2f01baffe9de"
+SRC_URI[sha256sum] = "3b9c02a004b68c256add99701de00b383accccf37177e0d6c58289664cce0c03"
 
 # Below whitelisted CVEs are disputed and not affecting crypto libraries for any distro.
 CVE_CHECK_IGNORE += "CVE-2018-12433 CVE-2018-12438"
-- 
2.30.2


