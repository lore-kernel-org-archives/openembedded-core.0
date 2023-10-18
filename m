Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD37CDB485
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.285064.1697644124014851376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1FUAkBKK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ab2cb900fcso3417475a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644123; x=1698248923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2RWij/YsGXkTfFS0bfu8fR6N8/5XpwvEa1RRQlZvDw=;
        b=1FUAkBKKxPmWDWJsD1eFMKwSqwGZtUnUPhJuxNWiTIgWskcnMsGUs9Om7cHAXw2I4a
         Dsx2fgZW6bkr0stcxohlh+XdqjtfoyF1w5D8lYFJ3O2t82gUuJXqmrERbQvcQ0xpStJU
         FAli8ZMLWrFb2LtZjCjhjW+fHke/I1QD8PNhaxu7JvWKnYjedhEwr9rHb1fyBFNrTXmR
         stmHJWHPbzvwFWjLn0qUG1K1s8xr8zNjcWhqzgZyFQZZZGMbZNJyllZAne1eqfkqq991
         0aXvQnLc+wiZp7CxExWBXJJHG1FWJJiLxK5+yRIgEjFjlVVzlNqnyhSCfr9leyFlFHWZ
         /Yng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644123; x=1698248923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2RWij/YsGXkTfFS0bfu8fR6N8/5XpwvEa1RRQlZvDw=;
        b=D5NMMFH/YHHpH+QQ3mH141zI0xftoyDKhZo8lTBiVnIpXFJO/LmIJxcoxKm/8eWYB9
         8Ci1iJzrg1SSpYJle8wxTNuCDeHjDWV9KOXY5JCcqV7O5GeqU18HQ33V3qypY1YUSzxX
         3eBLMzZD7TlHFsHNitGF2WFYvhb6ReZQNzclE+gIPiUdLuzw88Ubuimjgkyuk2/yHRlw
         M4XW7mxaEbObUvMg8I9pTd5MDrEVHKH/hvsxsPrFrsgTwcVQ3ffv1jiPIGYrEafedoNz
         E8GLuogqLKSkeVYZ0gx9L0wUpBOf4B+xhiz06tBOB6L9yUbwXSIGSIeiy34xoCsZ71nG
         x79g==
X-Gm-Message-State: AOJu0YwuZ6gdJEyvQIY41Kist842MtmIhPG/GjcJMLOGCoar8bIAYWQt
	bj5UATsblI+Y+Rv22L6I7h8ujmb7+9nTTtz/76A=
X-Google-Smtp-Source: AGHT+IF9ewY2SjX3dI7vwSu9zqvZ1bkIs/z8bjwljFe9lnZb4ojY/9cSMqHq+TNRVgHhVNJeRMEF0w==
X-Received: by 2002:a17:90a:854c:b0:27d:4ab9:fcd9 with SMTP id a12-20020a17090a854c00b0027d4ab9fcd9mr5475512pjw.21.1697644123114;
        Wed, 18 Oct 2023 08:48:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] binutils: Fix CVE-2022-47008
Date: Wed, 18 Oct 2023 05:48:23 -1000
Message-Id: <3a299d1610bf085790017569de090b0a41cf809b.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189403

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0027-CVE-2022-47008.patch        | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index da444ed1ba..125af13d74 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,6 +56,7 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0027-CVE-2022-47008.patch \
      file://0029-CVE-2022-48065-1.patch \
      file://0029-CVE-2022-48065-2.patch \
      file://0029-CVE-2022-48065-3.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
new file mode 100644
index 0000000000..a3fff65409
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2022-47008.patch
@@ -0,0 +1,67 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Jun 2022 23:43:38 +0000 (+0930)
+Subject: PR29255, memory leak in make_tempdir
+X-Git-Tag: binutils-2_39~236
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682
+
+PR29255, memory leak in make_tempdir
+
+	PR 29255
+	* bucomm.c (make_tempdir, make_tempname): Free template on all
+	failure paths.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=d6e1d48c83b165c129cb0aa78905f7ca80a1f682]
+
+CVE: CVE-2022-47008
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index fdc2209df9c..4395cb9f7f5 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -537,8 +537,9 @@ make_tempname (const char *filename, int *ofd)
+ #else
+   tmpname = mktemp (tmpname);
+   if (tmpname == NULL)
+-    return NULL;
+-  fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
++    fd = -1;
++  else
++    fd = open (tmpname, O_RDWR | O_CREAT | O_EXCL, 0600);
+ #endif
+   if (fd == -1)
+     {
+@@ -556,22 +557,23 @@ char *
+ make_tempdir (const char *filename)
+ {
+   char *tmpname = template_in_dir (filename);
++  char *ret;
+ 
+ #ifdef HAVE_MKDTEMP
+-  return mkdtemp (tmpname);
++  ret = mkdtemp (tmpname);
+ #else
+-  tmpname = mktemp (tmpname);
+-  if (tmpname == NULL)
+-    return NULL;
++  ret = mktemp (tmpname);
+ #if defined (_WIN32) && !defined (__CYGWIN32__)
+   if (mkdir (tmpname) != 0)
+-    return NULL;
++    ret = NULL;
+ #else
+   if (mkdir (tmpname, 0700) != 0)
+-    return NULL;
++    ret = NULL;
+ #endif
+-  return tmpname;
+ #endif
++  if (ret == NULL)
++    free (tmpname);
++  return ret;
+ }
+ 
+ /* Parse a string into a VMA, with a fatal error if it can't be
-- 
2.34.1


