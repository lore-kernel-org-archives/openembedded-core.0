Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571B6C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11399.1634657695788944834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SRgwPWmP;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3324328wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oUWPWjoHWUSMOS1VxvteSqFp/FBnjUFDAN5c9UXQi08=;
        b=SRgwPWmPN2kPs01i0MqlMUijEmZHgfzwTf2kXB2zTtQ2fLXiX4f+lIX/rcqMbH2cFw
         HWS83BRCH9+JGJytUkGi7hPQ0xwElNskK2X8reRRvyNhxN06f8diRtH04ybcvLGdOiGy
         r3eI7qx4OYXQ5+vF/yKPJkoYvYcN6XrxBt8unVrgswOwBBapskrOPL6E5QY6CR3G1FAD
         uyBZ/y1GIuitSL+eGs4p8BC9Yyh25P7LspHBU3+io+sQ7krQ8PZCOJyksFhnOIxncECE
         5tNVSLUdDfZZDsXWRL1jzRBhBdEm73D0HiidbECXwyiqAOtN0R9mqxdnmDBgzS+T5G1t
         gHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oUWPWjoHWUSMOS1VxvteSqFp/FBnjUFDAN5c9UXQi08=;
        b=29WboOGRIQTlS4V2jW/NGaqcVplKNbUhM0IkkknWFy7FAKyYDqd3zgwG1EmjWuuzUY
         xeEC7NHu7d8n4+acZk9+DRFHk8rhbWJ1pJObFUYWHHLv/+l7j/pVSOjjuw7Z/g0NPHdI
         oaWeFb1Y1PgeMdcvTzq1HjE9CuO2UfbyRf9R2Jb8arswsEwgbtSh6yVzVLyY7SsJa5hk
         9YPNh59TyNKbA9UXVrcmVGq97PphbaWIsxZDP464HXGCbAufZOjgHHD+naVo4E5+iCwk
         G5lZrl4Z9VTWykd8DNVOVxJuj8+sIplepYBVGQueX+ON5Ob6Q/6fB4vIkwqk89+OHjAN
         GpKg==
X-Gm-Message-State: AOAM533fVaWneACWogM5shNduDOJ/xbgPp//8YmdThyH7nk/lN5EzdhS
	o/Fhp53U/4qaW5iXzGTyXEMH6Y5PAhw=
X-Google-Smtp-Source: 
 ABdhPJz5mNW23W7BFZjDvB8Ir3Hu62OYeKtqXwXcQr1PgdcN5nit0CZMz/z72TDbojE96iq86A0R4w==
X-Received: by 2002:a5d:6892:: with SMTP id
 h18mr44354304wru.177.1634657694453;
        Tue, 19 Oct 2021 08:34:54 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 43/65] gobject-introspection: upgrade 1.68.0 -> 1.70.0
Date: Tue, 19 Oct 2021 17:33:57 +0200
Message-Id: <20211019153419.3319802-43-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157162

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Relocate-the-repository-directory-for-native-builds.patch | 4 ++--
 ...ntrospection_1.68.0.bb => gobject-introspection_1.70.0.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.68.0.bb => gobject-introspection_1.70.0.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 9071245a84..ba965092e1 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 5c606356523431769dffb02fffd2fbca8fb20232 Mon Sep 17 00:00:00 2001
+From 74a0fee892235c722ac60ddea6ee79bc3d7a93f5 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -62,7 +62,7 @@ index 7d03485..20f4813 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index c8ef6aa..b85ff7f 100644
+index 786749a..15cf2a9 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
 @@ -45,7 +45,7 @@ girepo_internals_lib = static_library('girepository-internals',
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
index b1d3d8abdc..d96caf08d8 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.68.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
            "
 
-SRC_URI[sha256sum] = "d229242481a201b84a0c66716de1752bca41db4133672cfcfb37c93eb6e54a27"
+SRC_URI[sha256sum] = "902b4906e3102d17aa2fcb6dad1c19971c70f2a82a159ddc4a94df73a3cafc4a"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.20.1


