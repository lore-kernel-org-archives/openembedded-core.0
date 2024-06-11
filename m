Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7CAC41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.9092.1718111254376943450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CdcLULHV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c348a263easo31363a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111254; x=1718716054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuq5TM9LTpEIiL6oKSxlOlsRcjN1LLr78mTdq8vhYFc=;
        b=CdcLULHVnAh44k4ZHw/A/VTL9qNPQsuSafx+qmW0O951oAtWqtKa3a4Hzp7JnW946F
         6u1SUl8akdcyjqNekogv9ymEB1b6nBD26/nru0tvujQh4Jda5Xcy4P/FUD3vHpa46Wu5
         +H4K7nM8mRAy0qBvlggJXt12cnErb5rdZJBxrAkaSCyt90/Pv/u37jD7j6hgAuJFE0LI
         PWRRtNimdJOVMBDdnuiXX34b6exj3pn3S9x2b1VZ9IqMTKI1qozsM/TqzsFZ/2K7Jp37
         ehXcdWyqQIvsYXHegxDJjXFMwizDTY6Mb0rnsG46P8If5AOEBtsztxTel9gppfmPPPP8
         zBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111254; x=1718716054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuq5TM9LTpEIiL6oKSxlOlsRcjN1LLr78mTdq8vhYFc=;
        b=knL6ZWcxBmQZURBuB+Cy/vCfphs+sF73q8CS1BoSo8NebwTjQSwXXb0g9ezVPmJrnF
         BX1tQdO1FS1ilFmr8H9nTxXa7DTERpNqWWkzSYaz+GECKPDqOXRMNRQzlsODTFiiMU/P
         UmMz5m4KIBLqulJVvN3l8WzPsUkJP34uscrLCg5yBowTrq6/bw+PdY4pRMQ5+RmY0MEd
         wfPsSq7GUTKR+7qIgPgMkwfGBhwbg1/eoO+/zDA0ACdKc4U2GsQkyO+wWRJjpLVPAPLg
         d2HhCuz5Hs1x3xW0xBzHTGx9duwG174rkmLLynVdMYgEa41nX9nsJCoN5s8dZhGLEbg1
         orLw==
X-Gm-Message-State: AOJu0YyAUiU1BwtM/W2wlEluAq+YUFO3fs5s4lflrcjVThuqh3RL2aEZ
	7DZrk7Y8A3tLV18eJcMNcfsE1guF7t8XA+xHPxD77/f4ScjxT/j2mRO5Yucv5zLKzFwFNOhRGn8
	h
X-Google-Smtp-Source: AGHT+IGzyQVvywJZZMh1w0loqcqRymbvQDmI1ImpeQn0PHcYEaCecaOJX4JdqsgOXFeyEEz9CH7Cdg==
X-Received: by 2002:a17:90b:3786:b0:2c2:c6c8:8fc with SMTP id 98e67ed59e1d1-2c32b469f3fmr3407308a91.2.1718111253541;
        Tue, 11 Jun 2024 06:07:33 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] gdk-pixbuf: upgrade 2.42.11 -> 2.42.12
Date: Tue, 11 Jun 2024 06:07:18 -0700
Message-Id: <246c1b01ca21a8102ab7a400f88621e8a95281af.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200512

From: Ross Burton <ross.burton@arm.com>

- Fix a build failure (Christian Heusel)
- Fix occasional build failures (Benjamin Gilbert)
- ani: Reject files with multiple INA or IART chunks (Benjamin Gilbert)
- ani: Reject files with multiple anih chunks (Benjamin Gilbert, CVE-2022-48622)
- ani: validate chunk size (Benjamin Gilbert)
- Translation updates

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5b202b0aef56ecf7982887c54b4ecbc4bbe73ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...n.build-allow-a-subset-of-tests-in-cross-compile.patch | 8 ++++----
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch              | 2 +-
 .../{gdk-pixbuf_2.42.11.bb => gdk-pixbuf_2.42.12.bb}      | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.11.bb => gdk-pixbuf_2.42.12.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 3d685db774..24edda8102 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 4bfb696fd125f044e3df9f6983c4ad518d9552c7 Mon Sep 17 00:00:00 2001
+From 325a4cde99a00b84116ab7111d27e6973f3c5026 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -19,7 +19,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 78f3683..e0feaee 100644
+index 3eb3fcc..dc7e790 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
@@ -37,7 +37,7 @@ index 78f3683..e0feaee 100644
  endif
  
 diff --git a/tests/meson.build b/tests/meson.build
-index 78d0ad9..0c9e64e 100644
+index 3781066..911b5fb 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
@@ -49,7 +49,7 @@ index 78d0ad9..0c9e64e 100644
    # Resources; we cannot use gnome.compile_resources() here, because we need to
    # override the environment in order to use the utilities we just built instead
    # of the system ones
-@@ -172,9 +172,11 @@ endif
+@@ -164,9 +164,11 @@ endif
  test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args = [ '-k' ]
  test_env = environment()
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 80c93e2166..3b4bf62861 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From 9b4f5738f8ac30f393b6163dcc84757976683d9b Mon Sep 17 00:00:00 2001
+From f78ab4edaee5f62663a9a4bcfa56e5c524da4474 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ef0f23f8f7..9f825a68ef 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            "
 
-SRC_URI[sha256sum] = "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00"
+SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.34.1


