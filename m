Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAA8C3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:46:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.15396.1721310374302283923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PrW9qFCV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fc692abba4so3900195ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721310373; x=1721915173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPkiMmex4JLoFM6IJA/3YBAjfsAMtq94TfBQ8SRhy8U=;
        b=PrW9qFCVnkzUvusSBrE8bGOfYVoS/AmC6qlB4z7BukEmHCXRIAOXtIYcEP7LwccjxP
         PaAMYFnOeFE37q0SRgygKOyO5oJ5rPRrS8aPjQz72tB/kwLeUnnukSLqeNl49UNYckpG
         wnZ37U7XFucE0R2Zpx2W8ZkfQIFOBU+VpLF2lcP+nt7wbrg15ly8CgOSWeq89A0mhc0T
         8012eFhckE0oqFYy44gaDIvORxZDveI3CdrF47EhK2apZX5Bh8jpWF1SoEpacZgZPMKG
         dXN7dVBXhD6GbL3JqKWYZRzNA74gV2UMNiZ8Us97K0Umj9oSF+E1mrvdygnlEMPhJMo2
         4C0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721310373; x=1721915173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPkiMmex4JLoFM6IJA/3YBAjfsAMtq94TfBQ8SRhy8U=;
        b=U3gh+MB78tB1tOSEJ0e+WduMw7f8Fkyec98kcdZgbxlr7KTY4YJg8KJuULWPLlRizB
         wV0qhv+DHHCJzLcRPheCaS8noEJ/rD2xVMMoHeFpn2kpmUMvtZONUqonignqpCm7nc7S
         4UYKJhqpiw220yIbFoh7QJgOL8lR3IAfnvaj4SuzTpY9qVtUPKIN3A8+yWwvuaY+Le6G
         1Rj3eUtnDYa0P6jg8wZ3R5X6fZ7jEUYpO8mydxzo4wa9wRt5C+hYH2ZYAMJDFcrEcZOG
         H4xwiWreLv7XykcmOQ9j5UT/qqwnP+5pqGeNWVQSI4jajeiX8dxCWM7mqqxTqYS5CZTA
         9zIA==
X-Gm-Message-State: AOJu0YzzSjzUqltDASRtsoh3GGa8JpC7Z1J53nM78XVMIoKODtvSHl45
	McP8b7COElofvUkV5h/rr6j549fgM3tKx0dWpA5tmVEpNvKnO/P3V0+/dHxyu4aLcWCwyNM8a2m
	0
X-Google-Smtp-Source: AGHT+IGqIxfCczcJbNEUoX9G5pXstsLYdjPgQGCHxoWIhLqL51N2QDkUhy6tuWs964mayyhoXm8gNQ==
X-Received: by 2002:a17:902:d506:b0:1fb:5c3d:b8ea with SMTP id d9443c01a7336-1fc4e135ed7mr42510255ad.13.1721310373517;
        Thu, 18 Jul 2024 06:46:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6ffbdsm93366985ad.60.2024.07.18.06.46.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 06:46:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/12] Revert "apt: runtime error: filename too long (tmpdir length)"
Date: Thu, 18 Jul 2024 06:45:40 -0700
Message-Id: <e0e9fe4efceb927cfe643b4566bca0b7bfd166fb.1721310237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721310237.git.steve@sakoman.com>
References: <cover.1721310237.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202224

This reverts commit dafdf9bb9e9d944b9f455c2be8cf698496200717.

Patch rejected upstream

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...he-filename-can-t-be-longer-than-255.patch | 40 -------------------
 meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
deleted file mode 100644
index 311c3664ad..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 18 Jun 2024 10:32:55 +0800
-Subject: [PATCH] strutl.cc: the filename can't be longer than 255
-
-The URItoFileName translates the path into the filename, but the
-filename can't be longer than 255 according to
-/usr/include/linux/limits.h.
-
-Truncate it when it is longer than 240 (leave some spaces for
-".Packages" and "._Release" suffix)
-
-Upstream-Status: Submitted [https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1073591]
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- apt-pkg/contrib/strutl.cc | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
-index 67100f1..5076b35 100644
---- a/apt-pkg/contrib/strutl.cc
-+++ b/apt-pkg/contrib/strutl.cc
-@@ -565,7 +565,12 @@ string URItoFileName(const string &URI)
-    // "\x00-\x20{}|\\\\^\\[\\]<>\"\x7F-\xFF";
-    string NewURI = QuoteString(U,"\\|{}[]<>\"^~_=!@#$%^&*");
-    replace(NewURI.begin(),NewURI.end(),'/','_');
--   return NewURI;
-+
-+   // Truncate from the head when it is longer than 240
-+   if(NewURI.length() > 240)
-+       return NewURI.substr(NewURI.length() - 240, NewURI.length() - 1);
-+   else
-+       return NewURI;
- }
- 									/*}}}*/
- // Base64Encode - Base64 Encoding routine for short strings		/*{{{*/
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 1eec7fe7a6..e688d30cae 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -14,7 +14,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
-           file://0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


