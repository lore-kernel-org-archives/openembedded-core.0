Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A861C41513
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 06:47:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.2051.1720766851764018353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 23:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dmyy7F5q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42565670e20so16114415e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 23:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720766850; x=1721371650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnPAbidTcpZTDrujYemui3pMFyaYjqnlU+gygcJVUEI=;
        b=dmyy7F5q74+BAgfWZLdhXFKaYd83JubxEKpxMVaaM+PJPkBjRyqwBZ5p4sDmjguQu1
         efSuThJdViJJ+Op8fBk/8PvZBowy+rMUvsIuYpP06KxXrT70L/Y0SF/owRyx3+Wy24us
         0cndLMf7Q2CyBi5nA4YPZZHneovfJ07kZbCpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720766850; x=1721371650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnPAbidTcpZTDrujYemui3pMFyaYjqnlU+gygcJVUEI=;
        b=mATmAzYhMAtaaZ0HHY64CK9NlJ/hLSnx2Y4O0TSYoZBJMs18fOxW8ShvEdIDUYdHhk
         XpgmJEetYikAqX80elzRRBIJEmHOEhbKdL5jFBzrHVznoqvAm/kQg4tGX5ZDj+ZDnOe+
         4YgztM65Oo+PxNR6V/LuZrDUVwVBPG/NFYxlgeyKuSIiJ84shIxoOB1D9nSGk8WAlrCt
         WzYY6XvHT28RPFDQVoTaTODVrORo+G139vUKZLvdVqlbkHZtjIst9FgKuM1uE7lUcEJB
         InKhwZ/MzlhY9XCbf0lrezZmTpiDIjcTMOLXRx+vhUNyZmthfTzckqlsl6nod3EYUO3+
         4ogQ==
X-Gm-Message-State: AOJu0YwVYlcIppSLYiK7sNlFJI2Zqs0hQdb4Qr6lEjxZ4/DBOw6IyoQ9
	oWs3bxihuT6w/mTYO+s9C+yHFMwu+vAzlknMDUM8uOr0O49/uQjLTPyMzGe4VVVFwcPBd/LR067
	e
X-Google-Smtp-Source: AGHT+IGc8OhMBvT3nEvXwjnw/W/OepFiNc8iyRMyMveysN0Sl4v8r8kEVYQ8h85o5WQT59DOC0Ghtw==
X-Received: by 2002:a05:600c:68b:b0:426:5fa7:b495 with SMTP id 5b1f17b1804b1-4279daf4724mr14374155e9.15.1720766849807;
        Thu, 11 Jul 2024 23:47:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c138:9d7a:7e79:ba70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2448ebsm12139635e9.1.2024.07.11.23.47.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 23:47:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] bitbake.conf/webkitgtk: Rename DEBUG_FLAGS to DEBUG_LEVELFLAG
Date: Fri, 12 Jul 2024 07:47:26 +0100
Message-ID: <20240712064726.1448710-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712064726.1448710-1-richard.purdie@linuxfoundation.org>
References: <20240712064726.1448710-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 06:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201806

Allow the "-g" option in DEBUG_FLAGS to be controlled directly with
a specific DEBUG_LEVELFLAG variable.

We can then use this in the webkitgtk recipe for finer grained flag
control and it allows the flag to be unset easily.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                            | 6 +++---
 meta/conf/documentation.conf                      | 4 ++--
 meta/recipes-devtools/valgrind/valgrind_3.23.0.bb | 2 +-
 meta/recipes-sato/webkit/webkitgtk_2.44.1.bb      | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index aba560dd292..1939e26ec59 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -663,10 +663,10 @@ DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
-DEBUG_FLAGS ?= "-g"
+DEBUG_LEVELFLAG ?= "-g"
 
-FULL_OPTIMIZATION = "-O2 ${DEBUG_FLAGS}"
-DEBUG_OPTIMIZATION = "-Og ${DEBUG_FLAGS}
+FULL_OPTIMIZATION = "-O2 ${DEBUG_LEVELFLAG}"
+DEBUG_OPTIMIZATION = "-Og ${DEBUG_LEVELFLAG}
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
 SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
 # compiler flags for native/nativesdk
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 53170fd34e3..155353eafc2 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -132,7 +132,7 @@ D[doc] = "The destination directory."
 DATE[doc] = "The date the build was started using YMD format."
 DATETIME[doc] = "The date and time the build was started."
 DEBUG_BUILD[doc] = "Specifies to build packages with debugging information. This influences the value of the SELECTED_OPTIMIZATION variable."
-DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_FLAGS}'."
+DEBUG_OPTIMIZATION[doc] = "The options to pass in TARGET_CFLAGS and CFLAGS when compiling a system for debugging. This variable defaults to '-Og ${DEBUG_LEVELFLAG}'."
 DEFAULT_PREFERENCE[doc] = "Specifies a weak bias for recipe selection priority."
 DEPENDS[doc] = "Lists a recipe's build-time dependencies (i.e. other recipe files)."
 DEPLOY_DIR[doc] = "Points to the general area that the OpenEmbedded build system uses to place images, packages, SDKs and other output files that are ready to be used outside of the build system."
@@ -180,7 +180,7 @@ FILESPATH[doc] = "The default set of directories the OpenEmbedded build system u
 FILESYSTEM_PERMS_TABLES[doc] = "Allows you to define your own file permissions settings table as part of your configuration for the packaging process."
 FONT_EXTRA_RDEPENDS[doc] = "When a recipe inherits the fontcache class, this variable specifies runtime dependencies for font packages. This variable defaults to 'fontconfig-utils'."
 FONT_PACKAGES[doc] = "When a recipe inherits the fontcache class, this variable identifies packages containing font files that need to be cached by Fontconfig."
-FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_FLAGS}'."
+FULL_OPTIMIZATION[doc]= "The options to pass in TARGET_CFLAGS and CFLAGS when compiling an optimized system. This variable defaults to '-O2 ${DEBUG_LEVELFLAG}'."
 
 #G
 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
index ad9e26cb6ba..494a3c0df91 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.23.0.bb
@@ -88,7 +88,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
 # (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
 # which fixes build path issue in DWARF.
-SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
+SELECTED_OPTIMIZATION = "${DEBUG_LEVELFLAG}"
 
 # Split out various helper scripts to separate packages to avoid the
 # main package depending on perl and python.
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
index 29e12bb8c5a..d927d81a436 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.1.bb
@@ -93,7 +93,7 @@ EXTRA_OECMAKE = " \
 
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
 # debug symbols (4.3GB to 700M at time of writing)
-DEBUG_FLAGS:append = "${@oe.utils.vartrue('DEBUG_BUILD', '', ' -g1', d)}"
+DEBUG_LEVELFLAG = "-g1"
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "

