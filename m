Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE34C001DF
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:20 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.9030.1689690433354053181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=H5ztIDYq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68336d06620so5805042b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690432; x=1692282432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLO6KEYMnyhBtAOgNLcJJBI0aCsbFpVtlqZftSoSqN0=;
        b=H5ztIDYqlWN4GcRjr50l2ySGibId8UTStvniiUiJZ98ecFh4K4aMvJ3W1TkzT1ZhhJ
         x6rShRcWrB5Jw2WYnO2KE3/b2IFe6SLq38qv5WqzmoanU1ZUBcRzjJHYNAVhBt3t2K6N
         Vtg6uD7nX8keQD0cKrScRMCwB1VSOG3Pl3oqXtFAe/bADH33+RQrDpB8HxA9T7+MkgmM
         S6zvKhZ0y9LNuBaIMoOU881D+qEA+qW02dhY56WT1xawxvGfvEXQdAG6jWAi0Wi/6X4e
         odbmyWgNkRK5PuwR/UkBW1hhRs53Ch17QchwV2PI32GL7g/ouDchDNrXChsd3UaCYqx2
         lSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690432; x=1692282432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLO6KEYMnyhBtAOgNLcJJBI0aCsbFpVtlqZftSoSqN0=;
        b=lgdemA/Q3zZC5qlEikAxsFKK29Th/JSbtAat3J/4vv7fhpO8U6CDfiXrZX50dafYe/
         iUL5LxPkwMW0FDDCVa5SSaDn0VTcS2gFOexQnO9W0WEhoMvS3WYuiVd+3ElqaL/r8ebF
         kAPS1XaNUqR18a2MhNRwoVsp9n1tNH14hsOpBUEFumypTlVn2AyxF78dK/z86wcbc20d
         TeOh1zm7fH4MvyyH3zjlp2FwWDTk7mxxXk1TKW7+BXPygq1VBXM2kJQOrIh6Vo0YDgbs
         dC1pl9UjaXy+jrXlZqZbDGhmYu0gqZSBkLFSrkjAQYpejhjF/s1K4CFlMTUFzH817Y1T
         eKNQ==
X-Gm-Message-State: ABy/qLZPIR8VQZ8bvmc3Y1ysDzYL7Z7TAJ+iAkK0Ns3gAmkcVuq42BoB
	gj9LYBr81IPJcjW78gRdDV2ROgZjaJKEkaVq8ho=
X-Google-Smtp-Source: APBJJlHfnkidyxnEw51ceKVV1gTqS2XQR8Zy8FsJZlSH+AhIQ0RP2Ymjam/R0tVJz4rFeY+VVOIPkw==
X-Received: by 2002:a05:6a00:1797:b0:64f:35c8:8584 with SMTP id s23-20020a056a00179700b0064f35c88584mr21904375pfg.18.1689690432385;
        Tue, 18 Jul 2023 07:27:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/27] zip: fix configure check by using _Static_assert
Date: Tue, 18 Jul 2023 04:25:57 -1000
Message-Id: <6f5986fb520ab89b0950d3e0fa8492de4de7798f.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184527

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
index 07a67b9634..83e1e52e97 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-configure-use-correct-CPP.patch \
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
+           file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


