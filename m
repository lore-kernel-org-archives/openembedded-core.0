Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.10550.1592494922151571474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:42:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xsQkZTcx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id s13so4871736otd.7
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+VVLf83e87zvEtdrCRj50aNdHWLDP+kvK4GJvL3EWy0=;
        b=xsQkZTcxbaCRti58d9tvVjkSmQt8t+T/TIT/K9CQKOhcISP/MOvgdW6fEydwU4CyTK
         G+mgqQ8nOw9S4eXD8dl1dEFElDzh13loitgGQBt76Cmm5kKbJjECzX4w17aTRzA/gf/q
         gAcP2dQkGNRDkwhHpzwmhKWwZykFu7oC3FMXaI7PDnKqJE00yewnsvwrZZYhNY8QyvR/
         WHF+hnv6g6Yc2pfAtYCCrbfJeXtOkmfDLDxEn+u0zRq3jxeaRVjoVLx0G1etxQm3bS3F
         +U5rOikre8KtQDDOj1dX9ghLKZmQfaVcIERL4cVPkWkaB6jUoAyda//R1hPqa6utW5Sn
         2BZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+VVLf83e87zvEtdrCRj50aNdHWLDP+kvK4GJvL3EWy0=;
        b=gCaxTD97TCqHrjeHl3NG/xMtyi3bZhM5C2HApFZArBrdWhcbDFXGHpqmpSD//iirxL
         2RbMsqQ6+NlLEFlMcEfAO5h3jejmaEnJOfjXWt+4dfcsznjzTQ5jdRTi2QivtzIGRRYi
         bHpkLxBXWkrO4i72BJHwpYW9mMzAaKsjsx4Us/LTcdesgXDfKAe2XrlP3tCUvchUtINu
         4l5M9hgecLsEbHxZRxSeed2fZXqm1YoGzk5Yq6KDRXD4lP2RBGNrXs8EC6Nv7shTGI+C
         x5oQS5cLPjCc6I0OS+zNo96YysWjathJVklWk2/zdIkKUCj9euUOC8RoZjoqHaOxcWIz
         YvJw==
X-Gm-Message-State: AOAM530ZCQXdc4DkvHHG9wMW3zZ/NH4B41l2RSmJYXUSl7mVPnSoBXz5
	Z1vnN9dk5Sa3wbyKWJt/UcXDQSneZdGyqw==
X-Google-Smtp-Source: ABdhPJy5M9lrZvL6X0gyPRq79FfIYJaZ3/tP+U6wBei07stVP3O0bDF6pU+uy30+1XSmtgA4VlCW4g==
X-Received: by 2002:a05:6830:1ad7:: with SMTP id r23mr3807486otc.96.1592494920459;
        Thu, 18 Jun 2020 08:42:00 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:59 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/21] binutils: add patch to fix issues with gcc 10
Date: Thu, 18 Jun 2020 05:40:36 -1000
Message-Id: <c41fe48f323a78fd0e205471362ecc6c66f87f45.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Richard Leitner <richard.leitner@skidata.com>

gcc 10 introduced "-fno-common" as default. Therefore backport the
according binutils patch to fix this issue.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fbeb572e1872cf64786d01d5c6408a6765f814ce)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 ...dundant-program_name-definition-fno-.patch | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 66a3850ef2..f65fdb7328 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -41,6 +41,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
+     file://0017-binutils-drop-redundant-program_name-definition-fno-.patch \
      file://CVE-2020-0551.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
new file mode 100644
index 0000000000..55af9abc13
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-binutils-drop-redundant-program_name-definition-fno-.patch
@@ -0,0 +1,61 @@
+From 57a3e055605b28a9449b1b27eda7125737c42b00 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <siarheit@google.com>
+Date: Sat, 1 Feb 2020 23:16:11 +0000
+Subject: [PATCH] binutils: drop redundant 'program_name' definition
+ (-fno-common)
+
+	* coffdump.c (program_name): Drop redundant definition.
+	* srconv.c (program_name): Likewise
+	* sysdump.c (program_name): Likewise
+
+Upstream-Status: Accepted (commit 0b398d69ac)
+Signed-off-by: Sergei Trofimovich <siarheit@google.com>
+Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
+---
+ binutils/coffdump.c | 2 --
+ binutils/srconv.c   | 2 --
+ binutils/sysdump.c  | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/binutils/coffdump.c b/binutils/coffdump.c
+index 531a4e46c3..336da57ca2 100644
+--- a/binutils/coffdump.c
++++ b/binutils/coffdump.c
+@@ -456,8 +456,6 @@ coff_dump (struct coff_ofile *ptr)
+     dump_coff_section (ptr->sections + i);
+ }
+ 
+-char * program_name;
+-
+ static void
+ show_usage (FILE *file, int status)
+ {
+diff --git a/binutils/srconv.c b/binutils/srconv.c
+index 5742b16759..f071794f0a 100644
+--- a/binutils/srconv.c
++++ b/binutils/srconv.c
+@@ -1687,8 +1687,6 @@ prescan (struct coff_ofile *otree)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+diff --git a/binutils/sysdump.c b/binutils/sysdump.c
+index d433e71ed9..7eebbd61d3 100644
+--- a/binutils/sysdump.c
++++ b/binutils/sysdump.c
+@@ -633,8 +633,6 @@ module (void)
+     }
+ }
+ 
+-char *program_name;
+-
+ ATTRIBUTE_NORETURN static void
+ show_usage (FILE *ffile, int status)
+ {
+-- 
+2.26.2
+
-- 
2.17.1

