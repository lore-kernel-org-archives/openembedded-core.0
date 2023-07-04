Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2235C001B0
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.61502.1688484620507996669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=nSXbjelA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b890e2b9b7so12880145ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484619; x=1691076619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0yc151HJsOhnIaw58909l95PAN7dKUawIEYTp9yVs0=;
        b=nSXbjelAd9Bt8KtB4tTlkvYCI/90puB35VcfPd16GEx+aIx92jD22/MQZLPHsdbm4A
         CJImtkU8nFWwRpcVCG2iF5NprtczKdAAH4yrlpmewUoJl5Hsh+uh7SxyO97l2iVnL4R7
         Vebl1Lv9OR3x52ij+6DVywgnIwhzo0eRga+RPZpqatyPukfrYPDFbQkwDsAL0gT4sv4b
         ug+8DA+gEKilpEpbRkiqBo/op6k/whd349Heag2/G2aQWl7ucJrI9a6bBR4nkXEES18N
         FFzl2kKSP0spFPl1HtkdouWOW95uWxxhhQmeHcmDh0tvlAT5vbv2iWmdOYm9YbS1VhKV
         6LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484619; x=1691076619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0yc151HJsOhnIaw58909l95PAN7dKUawIEYTp9yVs0=;
        b=LsoYslJPKvk71pEYx/zlaRQOnaEGmhKInmgPQlMWxS6TCrw8gknKDRsMTks3FRPlsS
         YMxTa6+FhNVYH5bteEdpdOixbm+0PS9uIXmzrPC0tFgzjmXC6q81/dn6P7UK3orTMtB4
         4/JetTtn4YgQJFnksLQRpLIu0LDte2lfiNBT8OBC5xqCcocEyU8YALOnYhXzMHLnyii1
         AVKSMl9D2Aez1O64q/aWtH22JNRS8uV0z0M9bUsVhBAUN7D3gQnmrauKV80LgdgvqU7c
         5q+tAdDshSwd6spvKGUwKXQlOu2ob2mQJaWTmtxt3WjYFW8UZqcCJYHVSddyu7FSoHy5
         3obw==
X-Gm-Message-State: ABy/qLY8QGAVMsgTM7QFrKa/LNS1XbLGHWCBxArzluP71gCgLA5HufYJ
	guopbtXfcUtcY4oeFBzTg8hsWkNwLDm07r7lb9tMSw==
X-Google-Smtp-Source: APBJJlHvEpXdoUJfDmLGuYsfcx/MciKDqutRttpckhlWzKPN6C+R62ux3rbZUhZItqbWjMYEwTPBhQ==
X-Received: by 2002:a17:902:e74f:b0:1b8:7618:5414 with SMTP id p15-20020a170902e74f00b001b876185414mr11858536plf.60.1688484619541;
        Tue, 04 Jul 2023 08:30:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/30] zip: fix configure check by using _Static_assert
Date: Tue,  4 Jul 2023 05:29:22 -1000
Message-Id: <a54619ba8deb6731fdac97a1fe21e7a6ed2b5a75.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183855

From: Chen Qi <Qi.Chen@windriver.com>

It's incorrect to run a cross-compiled program on build machine
to check if some feature is available or not. As these two checks
in zip are basically just checking the size, we can use _Static_assert
and sizeof to do such check at compile time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dda778d855b1838ae3004a9af310724b913490b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...se-_Static_assert-to-do-correct-dete.patch | 96 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch b/meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch
new file mode 100644
index 0000000000..106f246a7c
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch
@@ -0,0 +1,96 @@
+From 9916fc6f1f93f3e092e3c6937c30dc8137c26d34 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 15 Jun 2023 18:31:26 +0800
+Subject: [PATCH] unix/configure: use _Static_assert to do correct detection
+
+We're doing cross compilation, running a cross-compiled problem
+on host to detemine feature is not correct. Use _Static_assert
+to do the detection correctly.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ unix/configure | 42 ++++++++++++------------------------------
+ 1 file changed, 12 insertions(+), 30 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index f2b3d02..f917086 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -361,6 +361,10 @@ cat > conftest.c << _EOF_
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <stdio.h>
++
++_Static_assert(sizeof((struct stat){0}.st_uid) == 2, "sizeof st_uid is not 16 bit");
++_Static_assert(sizeof((struct stat){0}.st_gid) == 2, "sizeof st_gid is not 16 bit");
++
+ int main()
+ {
+   struct stat s;
+@@ -385,21 +389,7 @@ if [ $? -ne 0 ]; then
+   echo -- UID/GID test failed on compile - disabling old 16-bit UID/GID support
+   CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+ else
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 1 ]; then
+-    echo -- UID not 2 bytes - disabling old 16-bit UID/GID support
+-    CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+-  elif [ $r -eq 2 ]; then
+-    echo -- GID not 2 bytes - disabling old 16-bit UID/GID support
+-    CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+-  elif [ $r -eq 3 ]; then
+-    echo -- 16-bit UIDs and GIDs - keeping old 16-bit UID/GID support
+-  else
+-    echo -- test failed - conftest returned $r - disabling old 16-bit UID/GID support
+-    CFLAGS="${CFLAGS} -DUIDGID_NOT_16BIT"
+-  fi
++  echo -- 16-bit UIDs and GIDs - keeping old 16-bit UID/GID support
+ fi
+ 
+ 
+@@ -417,6 +407,10 @@ cat > conftest.c << _EOF_
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <stdio.h>
++
++_Static_assert(sizeof(off_t) < 8, "sizeof off_t < 8 failed");
++_Static_assert(sizeof((struct stat){0}.st_size) < 8, "sizeof st_size < 8 failed");
++
+ int main()
+ {
+   off_t offset;
+@@ -436,24 +430,12 @@ _EOF_
+ # compile it
+ $CC -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+-  echo -- no Large File Support
++  echo -- yes we have Large File Support!
++  CFLAGS="${CFLAGS} -DLARGE_FILE_SUPPORT"
+ else
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 1 ]; then
+-    echo -- no Large File Support - no 64-bit off_t
+-  elif [ $r -eq 2 ]; then
+-    echo -- no Large File Support - no 64-bit stat
+-  elif [ $r -eq 3 ]; then
+-    echo -- yes we have Large File Support!
+-    CFLAGS="${CFLAGS} -DLARGE_FILE_SUPPORT"
+-  else
+-    echo -- no Large File Support - conftest returned $r
+-  fi
++  echo -- no Large File Support
+ fi
+ 
+-
+ # Check for wide char for Unicode support
+ # Added 11/24/2005 EG
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 1930a40140..802877285f 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
            file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
+           file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


