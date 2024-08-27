Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF64C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.70887.1724736257126102587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0gcdb/c;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-429da8b5feaso55853255e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736255; x=1725341055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxf16R8ko8Bdcp9SoOLORJl/vIqJoHt59j/WHlfAOdk=;
        b=D0gcdb/cF/e9fqsGOg4P0JA5A9hlyueaBPy45PQELhf4YAkACDK8iPpdYse4vIl4bP
         fJpyvYLYIiuxaJ0MHg7+OkEpMPOu/A6udAZifejDxHRbFqDfuFK/Wyq+qqqCmTCOCTv4
         tvf5/J559DrNqEormeaujXq8aixfZnRqlMcvTddfVWl0N5uxPKEMZEHenNF8Mw0BgY9F
         Ii+v5DaY/M4KWGG+Kbvyt6w/lj/yi9Ex/itcs1Pun4HiqcFH9MYCuLT5WRKLJf7G22nc
         AfGhGoJqPeevkaZVmmyOJAQef0KRSIUvPpgSI+RsFRMRKNGymwz0TyGPBgqyHP4Ms2Ls
         B1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736255; x=1725341055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxf16R8ko8Bdcp9SoOLORJl/vIqJoHt59j/WHlfAOdk=;
        b=OZW+0XN0r95SqAnqPQXq6xMLIgtEr6NLPLK0zlihokghYoHfDlIZeIHIhX+TFXknet
         MtUClsyDuJ333aG/oherVRdmoaxiGzii+gC8ldYiLdMySx9CB8ECDVTt9p69xPLZ/kRZ
         ssKDSHQA0nJtYDOB+ETfiCHMqtr6ZrYpyXxJP6ShxswSL03I7zVQvaqgviiCka7jc+Zw
         nnpblCmBaCzWRnPG/I2D5HEWBS5SREkjHwrizKeO5UuC+MJRKkQCQLd4IU09KhgR6D6q
         E5YNmOnVBFNSenUxFlfIQrhaPc8zZPIAEdWjBmDNZZ2onsfShdGRS00Y8c0v6r3u0yLO
         dgjQ==
X-Gm-Message-State: AOJu0YzUzfrmHJiggdzcnScrAaYf1FH/Iz0m7aM0uoAgeoNk1OSvnFNW
	xxXxt1y33RD3PuudwduyniElNJ4bRG294EDa0CKfbixzxgOryZ954V35pg==
X-Google-Smtp-Source: AGHT+IH2Nai1HvYn5n8sqyLMdx7n0PB2VAs612+fI/9xnQFCPht618mbQxbpLd8wXT+dwoFkC47F5g==
X-Received: by 2002:a5d:5451:0:b0:367:90cc:fe8b with SMTP id ffacd0b85a97d-37311863832mr9097163f8f.27.1724736255176;
        Mon, 26 Aug 2024 22:24:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/34] libtraceevent: upgrade 1.8.2 -> 1.8.3
Date: Tue, 27 Aug 2024 07:23:50 +0200
Message-Id: <20240827052354.1319810-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203806

From: Alexander Kanavin <alex@linutronix.de>

Drop backport.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libtraceevent/libtraceevent/meson.patch   | 45 -------------------
 ...eevent_1.8.2.bb => libtraceevent_1.8.3.bb} |  4 +-
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.2.bb => libtraceevent_1.8.3.bb} (89%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch b/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
deleted file mode 100644
index c723c236c06..00000000000
--- a/meta/recipes-kernel/libtraceevent/libtraceevent/meson.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7f88c9ba5f27276e844252500a9f0ba2b350b919 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Sun, 27 Aug 2023 20:57:44 +0100
-Subject: [PATCH] Fixes for the Meson build of libtraceevent:
-
-- Make the plugin directory the same as the Makefiles
-- Install the plugins as modules not static and versioned shared libraries
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20240311111140.1789879-1-alex@linutronix.de/T/#u]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build         | 2 +-
- plugins/meson.build | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 40ce38c..1eb7912 100644
---- a/meson.build
-+++ b/meson.build
-@@ -25,7 +25,7 @@ htmldir = join_paths(prefixdir, get_option('htmldir'))
- libdir = join_paths(prefixdir, get_option('libdir'))
- plugindir = get_option('plugindir')
- if plugindir == ''
--    plugindir = join_paths(libdir, 'libtraceevent/plugins')
-+    plugindir = join_paths(libdir, 'traceevent/plugins')
- endif
- 
- add_project_arguments(
-diff --git a/plugins/meson.build b/plugins/meson.build
-index 74ad664..4919be4 100644
---- a/plugins/meson.build
-+++ b/plugins/meson.build
-@@ -19,11 +19,10 @@ plugins = [
- 
- pdeps = []
- foreach plugin : plugins
--    pdeps += library(
-+    pdeps += shared_module(
-         plugin.replace('.c', ''),
-         plugin,
-         name_prefix: '',
--        version: library_version,
-         dependencies: [libtraceevent_dep],
-         include_directories: [incdir],
-         install: true,
diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
similarity index 89%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
index d4ace548840..68174305f25 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.2.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "6f6d5802f31992e7527a4c32b43a32fda6bf6bdf"
+SRCREV = "645a883516e343ee970ebb80398cfd7b7dbd227e"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
-           file://meson.patch"
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


