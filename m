Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DDEEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.61415.1688484624662111778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=li+kC+38;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8054180acso45882045ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484624; x=1691076624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uR2VR55AhsCo6nnJWpoCBdlRJELBeRpnfVLzJZMzOIk=;
        b=li+kC+386cB6BbNALVkLKVSTST2+TY1rasL6cMtrg254PqhzvJ8thZhhi3yau7+Y63
         IGx30qmhi/B9sxtjaf94GbYNWil/jKRQ6XIm0LWKSdXtp9Tk9F16jCoSkygO5KwaZU/6
         l0tO4Pg+zsIOe/6pcOXUxEV1bMzuD74cTdAS5oUnCrv27fnB8c+PKcrj4omTbkLvLyOe
         3XnO0xfApUkei+LyKSDY8KvhcoUuaC1uvbptrbfGUxHCrkGyfuMb9hACvO+rJoPLOtj+
         773w2IRICxpvdU3FsSzQfW37Ct8PKwZwZlvTMNPLRJgLu5yBEr/QK9ny6NGsShVz2xmX
         qmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484624; x=1691076624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uR2VR55AhsCo6nnJWpoCBdlRJELBeRpnfVLzJZMzOIk=;
        b=Eqe6Vdfd63gSly6nIBqA6Uq3Mealorqep5Rhlkyoh2gLJrzwiPIhv6WDCfRAwq/n+S
         vDstvDxrKqFVxFm+HEgk0vPue4PoBNMQiiYj5LwbBLT/aW1xgR8N1n6/Wvd1sTlnqRzZ
         VKJgYMPumruAIV3U8b7LDOE/djNNnV7chUUhcemvbQwuWk8TwqexMUE4NkUFa0KV3O68
         VELQsAwOqjfyO8/1C0/B53BxbI5MymFp7laJC+Jn++uln/pfZQgvs12rcqaojSx/qzO9
         EFT0iZ7LbC7N9iXMChL0oai9phMS+BKJ4k3QpYo482SY/AF5K25lN/UrF8JarJB3uBBC
         a3Mg==
X-Gm-Message-State: ABy/qLZ7nN4ic2mH3x3o0FnvSVMrriOCHU8Os0M47u9VJ2joUaEFLQ/z
	5v0ihoJv+rKw5HUL8YEtmq8RomgENQ+MtVUNM7Tt+Q==
X-Google-Smtp-Source: APBJJlFBl7Ht4apLwLYGeJFGHx0TjfweQc1QYY2vHNUr69DB9uKpqUZYLey2+ZTeDeGErWu6DZw3HQ==
X-Received: by 2002:a17:902:ecd2:b0:1b5:5fd2:4d6e with SMTP id a18-20020a170902ecd200b001b55fd24d6emr16559673plh.58.1688484623777;
        Tue, 04 Jul 2023 08:30:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 22/30] unzip: fix configure check for cross compilation
Date: Tue,  4 Jul 2023 05:29:24 -1000
Message-Id: <ed61afde823bcd3eddb984a57c9dec317f8bbbf3.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183857

From: Chen Qi <Qi.Chen@windriver.com>

The original configure runs a generated binary to determine
features. This is not correct for cross compilation. So change
the runtime tests into compile-time tests to fix the issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9aca339b59238988c48b90ea5019bfc939ba4b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-fix-detection-for-cross-compilation.patch | 103 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch b/meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch
new file mode 100644
index 0000000000..2fa7f481b7
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch
@@ -0,0 +1,103 @@
+From 5cbf901b5c3b6a7d1d0ed91b6df4194bb6d25a40 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 15 Jun 2023 07:14:17 -0700
+Subject: [PATCH] unix/configure: fix detection for cross compilation
+
+We're doing cross compilation, running a cross-compiled problem
+on host to detemine feature is not correct. So we change runtime
+check into compile-time check to detect the features.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ unix/configure | 44 +++++++++++++++-----------------------------
+ 1 file changed, 15 insertions(+), 29 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 8fd82dd..68dee98 100755
+--- a/unix/configure
++++ b/unix/configure
+@@ -259,6 +259,10 @@ cat > conftest.c << _EOF_
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
+@@ -278,21 +282,10 @@ _EOF_
+ # compile it
+ $CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+-  echo -- no Large File Support
++  echo -- yes we have Large File Support!
++  CFLAGSR="${CFLAGSR} -DLARGE_FILE_SUPPORT"
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
+-    CFLAGSR="${CFLAGSR} -DLARGE_FILE_SUPPORT"
+-  else
+-    echo -- no Large File Support - conftest returned $r
+-  fi
++  echo -- no Large File Support
+ fi
+ 
+ # Added 11/24/2005 EG
+@@ -302,6 +295,11 @@ cat > conftest.c << _EOF_
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <wchar.h>
++
++#ifndef __STDC_ISO_10646__
++#error "__STDC_ISO_10646__ not defined
++#endif
++
+ int main()
+ {
+   size_t wsize;
+@@ -327,19 +325,8 @@ if [ $? -ne 0 ]; then
+   echo "-- no Unicode (wchar_t) support"
+ else
+ # have wide char support
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 0 ]; then
+-    echo -- no Unicode wchar_t support - wchar_t allocation error
+-  elif [ $r -eq 1 ]; then
+-    echo -- no Unicode support - wchar_t encoding unspecified
+-  elif [ $r -eq 2 ]; then
+-    echo -- have wchar_t with known UCS encoding - enabling Unicode support!
+-    CFLAGSR="${CFLAGSR} -DUNICODE_SUPPORT -DUNICODE_WCHAR"
+-  else
+-    echo "-- no Unicode (wchar_t) support - conftest returned $r"
+-  fi
++  echo -- have wchar_t with known UCS encoding - enabling Unicode support!
++  CFLAGSR="${CFLAGSR} -DUNICODE_SUPPORT -DUNICODE_WCHAR"
+ fi
+ 
+ echo "Check for setlocale support (needed for UNICODE Native check)"
+@@ -418,8 +405,7 @@ temp_link="link_$$"
+   echo "int main() { lchmod(\"${temp_file}\", 0666); }" \
+ ) > conftest.c
+ ln -s "${temp_link}" "${temp_file}" && \
+- $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null && \
+- ./conftest
++ $CC -Werror=implicit-function-declaration $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null
+ [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_LCHMOD"
+ rm -f "${temp_file}"
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index a4d10c30aa..391e5cd22a 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0529.patch \
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
+        file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


