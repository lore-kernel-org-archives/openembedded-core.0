Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FF2C4332F
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.177173.1672213052009431239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qywVU58g;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso7531986wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/etbPw8w3+sS/BPqt5usbE/X8NyPpxK6LOvs4UpJ+Q=;
        b=qywVU58gl4fpP12bq6yz7qpSBmO4Epc/qJXJ/kjXNFPj2FDCAxOFowg3J6f886+bWh
         UhHfcTi5YR5gOA6oTs6xvSgGgl2H2FWe7GlI6Rg+g7xBHw1Ivy30LibvsVi4zQzKkRYr
         ++cQzLE1hJsDl9lgeKR3dRvZvb/ZkiWUTd9u7qhgXGJX73UQx0pbAd9MnhNOGHgVI0nX
         BlXuRJFeR/Z1v3MnXnf1lzxmyqOnr5K5RzX15w0kJ3vWOnUWuTPW12FW/y8jVaEOCo5Y
         C7O8ASp71gGcdDRgKkF+DbNO9BAQ9BQVEk8L9MOm9KLIw9wg0rmAyRCBEmuJHd+0RKZJ
         DCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/etbPw8w3+sS/BPqt5usbE/X8NyPpxK6LOvs4UpJ+Q=;
        b=mNi43xfrOvKs+ugMJPucztjMJvZw17yl35H5bbF15A3Qfg9WgeQzeAyQ+YqDA7Xbia
         S7djzZmt0DpD9TfMXDqWyGUjxI+EA20FfhOQxPGV6h1qQ8xBtDTNIFxguIoocvXy+9zP
         iQd1/sL6kJ67MzYBV4OPoMQEuahObMJAOMD1qBCEchRETwBWjzcrmlqdmqbZ2ULU61HT
         Q18pthdWks6q7Yp9s8E25MwQ+lh4eyCxO2zdUf77o+SXvIEn0gf81snmyscMoNiYAgtk
         JxdvQ1MpdYPPXM2BgcSNyoBPtFnC3ecvw2vbxiHIgqqvg02FzgH9igkNno2/0Ztigh6J
         6o9Q==
X-Gm-Message-State: AFqh2kpFmDA+7dHLym8OOj14OIwKXZlYBaqMuuZ5DhLhX4jfKzLEFxbr
	ZchG5K4Nl2X85Uftq2Wh7oVhLrYKCus=
X-Google-Smtp-Source: AMrXdXszhmJd9lHD2E4M4XP7CShOtPs3oGTr+gr/1Z8QnQ9KHRIcU1ZYL6GVvCn/bUHwjSX/buNT+g==
X-Received: by 2002:a05:600c:3509:b0:3cf:93de:14e8 with SMTP id h9-20020a05600c350900b003cf93de14e8mr16611224wmq.39.1672213050103;
        Tue, 27 Dec 2022 23:37:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/25] dpkg: update 1.21.9 -> 1.21.13
Date: Wed, 28 Dec 2022 08:36:58 +0100
Message-Id: <20221228073721.3454255-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175041

libmd is a new dependency.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/dpkg/dpkg.inc            |  4 ++--
 ...uild.c-ignore-return-of-1-from-tar-cf.patch |  7 ++-----
 ...ts-expect-D-to-be-set-when-running-in.patch | 18 ++++++++----------
 .../dpkg/{dpkg_1.21.9.bb => dpkg_1.21.13.bb}   |  2 +-
 4 files changed, 13 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.9.bb => dpkg_1.21.13.bb} (95%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 0d17a98b80..b3e8c05d62 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "https://salsa.debian.org/dpkg-team/dpkg"
 DESCRIPTION = "The primary interface for the dpkg suite is the dselect program. A more low-level and less user-friendly interface is available in the form of the dpkg command."
 SECTION = "base"
 
-DEPENDS = "zlib bzip2 perl ncurses"
-DEPENDS:class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
+DEPENDS = "zlib bzip2 perl ncurses libmd"
+DEPENDS:class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native libmd-native"
 RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_update-alternatives} perl"
 RDEPENDS:${PN}:class-native = ""
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index dc0d9bfc2e..1b5b89644f 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From 839f228556c00739f72534e8635195935eb3752f Mon Sep 17 00:00:00 2001
+From 54ca20a18253bcf0915b2e2985bbee79bf881ebe Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -29,7 +29,7 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 76613ad..7c216d1 100644
+index 76613adec..7c216d1a9 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -482,6 +482,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
@@ -51,6 +51,3 @@ index 76613ad..7c216d1 100644
  }
  
  static intmax_t
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 75ae848264..bd4d5d5353 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -1,4 +1,4 @@
-From dd11ed66640f79143e42d778b58fdd5a61fb5836 Mon Sep 17 00:00:00 2001
+From ff325b35639a797edd92b373fbebf7b8b9f3f0c3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 16:25:45 +0300
 Subject: [PATCH] Our pre/postinsts expect $D to be set when running in a
@@ -11,22 +11,23 @@ RP 2011/12/07
 ALIMON 2016/05/26
 ALIMON 2017/02/21
 KKang 2019/02/20
+
 ---
- src/main/script.c | 54 +++--------------------------------------------
- 1 file changed, 3 insertions(+), 51 deletions(-)
+ src/main/script.c | 53 +++--------------------------------------------
+ 1 file changed, 3 insertions(+), 50 deletions(-)
 
 diff --git a/src/main/script.c b/src/main/script.c
-index abe65b6..0edb8f1 100644
+index ecce4d842..16f4e6ff5 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
-@@ -96,58 +96,10 @@ setexecute(const char *path, struct stat *stab)
- static const char *
+@@ -97,58 +97,11 @@ static const char *
  maintscript_pre_exec(struct command *cmd)
  {
+ 	const char *instdir = dpkg_fsys_get_dir();
 -	const char *admindir = dpkg_db_get_dir();
 -	const char *changedir;
 -	size_t instdirlen = strlen(instdir);
--
+ 
 -	if (instdirlen > 0 && in_force(FORCE_SCRIPT_CHROOTLESS))
 -		changedir = instdir;
 -	else
@@ -81,6 +82,3 @@ index abe65b6..0edb8f1 100644
  }
  
  /**
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.21.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.13.bb
similarity index 95%
rename from meta/recipes-devtools/dpkg/dpkg_1.21.9.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.13.bb
index feb579723f..8637dcfaf5 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.21.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.13.bb
@@ -18,6 +18,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "c2d6b7de5849c62d3a4f55f61dbc53c1992f74ee"
+SRCREV = "ff61d6d650e0455d4c070306a482cf757285d58b"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


