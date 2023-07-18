Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A6AC001DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9031.1689690435602762529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PwrV6SHC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6687096c6ddso3670747b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690435; x=1692282435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrL4hAyXflqP/pFawQn5LUZIaQ7qaJt6rMTjtY+uS4o=;
        b=PwrV6SHCxSJ/BVYZII2mKMUic/oW5gHa5SzxWjLCkE77b1ChDKLspAE424gvuEkCSj
         xMdxYBYvJOjAQ/FaBwXRIHr7PHceLIywECmpNTIXCly2UQhq948nNTep5nS3x1+AfF6/
         z3dJhPVTIt6cBfO8kLOZnd9N9VRMIyFNq/QEHmWmPjljQN1W0xGNOcOWj3eb3ZNumqNP
         Lk+nU2GEe2IVIV5e/Vw2guS03EFS9DxL+VVoCvohpvZbXldMglwfk7qhp7yoO+mQRVJG
         7qKHdSrq+DujPoWt+oDF8JcG/lfozYR93F9wsgtOYge7FIMNZqoFuYi9nPWwYBrkhPCk
         VXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690435; x=1692282435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrL4hAyXflqP/pFawQn5LUZIaQ7qaJt6rMTjtY+uS4o=;
        b=jrp/8f+M4kBiiXROzVIqrd/S4068GrTSaWt/3UP9GqdBUs0Az5WcfxnLRjFqrI27Za
         GI1IS30L/082kxXZtfWhmpb/qeMJn6U9C/BO3dHZyDV8a/8J1M817Xt0vMQNkXv7YtFP
         sK4LWRrQVBVqh44yy9RDf8Ym5Tr8NXvyvOvzgZErQ2OgQ3U95jMXNeXG80W4n8j/o5ip
         W8CZgMF298WM5GiNoXvXhi7vdgQ2GDVQQo78pBtVOlL2T37xYx8J3FVF7Yc6/h+5QL1p
         7zkhgoFAqoqf3BN/OI1Tn8sJaPNqsjr74WDW18MuAAw6PeXF73UDmCPNVAZuXk2RwePs
         zVGg==
X-Gm-Message-State: ABy/qLZcE4Wq/H0SXr+wCeSaIfW9OtMyclbHNkn4/jPjArgdO2a6oMft
	TaFqb0iIF7rJDKVLa7jWCxx4Oby91Qv7Cfm257M=
X-Google-Smtp-Source: APBJJlGPh5iwG+bi1gBtmx5al2OiiRRRdlBESzmxBDkQoD5zKlP3bWynyqx/c0DHa3W8laq18K8MbA==
X-Received: by 2002:a05:6a21:9993:b0:133:b3db:c78b with SMTP id ve19-20020a056a21999300b00133b3dbc78bmr12411073pzb.36.1689690434639;
        Tue, 18 Jul 2023 07:27:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/27] unzip: fix configure check for cross compilation
Date: Tue, 18 Jul 2023 04:25:58 -1000
Message-Id: <7d99f3a9a2a74fe2e8753b00553f07f305d14c87.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184528

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
index f35856cf61..e3fffa30ab 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2021-4217.patch \
         file://CVE-2022-0529.patch \
         file://CVE-2022-0530.patch \
+        file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


