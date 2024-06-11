Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD88DC25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.9091.1718111253113736693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e69wQkNP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c2ef6617bfso950972a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111252; x=1718716052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfVEMcDR1UHBbrKdJzYTt0+IsAnJKsH22v5gsNZk7WI=;
        b=e69wQkNPezbaWWKgJwG4oRpneE0FIj8t1O8vSYP1iYvhmCEGVUMOzgD4C/8ukEWTvx
         9p66CPjvKmf2EYCRay/IAJO5HlyvUaioFPHQ01B8qkv2qzKq5kPVBlahRVdWYUjI0Bst
         5I3SBJ7k3oGrQrl68XWvx1VV0xIHoQdgkXpK7tv86HoKXTl5y0ypCMhrW/vsoDvSzh1K
         s4s1L8xqvh1lqo601l1M8kHsVMpLPU6CCOpSAOlSzRP5Tm/36UdLg0J7KcvoqQQUj1g1
         OCN9W0vnGFQUuYMbLpR9RPEQnfJGUVRtc1AQThjOfH5y1BoCD5vPJ0tr+mL+1gFM8hNc
         Oe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111252; x=1718716052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfVEMcDR1UHBbrKdJzYTt0+IsAnJKsH22v5gsNZk7WI=;
        b=sXR5X84WyQx6t01bTumLM5L0xvNVy/29SwGBjwvHujCGAFHkR9hg8+p754jVuTFVL6
         gdXSipl0f/lxhiDV1xiBxqUXK+BcD4Q1t1RM2Cv1X81X2jrWfUwYZDP0ADybet61/53w
         paiP0A5LxgTH3V+IavYc9JkoWzqBjTt22f0h2gKib6+BE8x5xWEdHryOWcWp1AoaJ/pc
         pt28mpla0oczJ7pidBhroLvilvK5ePU9LhJU6bdRR6l39USrOZiD52Smtr45uE46GWVL
         jCAPtT6cllpcegVXQq72XpCdzSrC0XKK8DcmkKNVpMtyE13sYdM5G9/+PBEfd8GLAkc8
         WfXQ==
X-Gm-Message-State: AOJu0YzGcfxWvjDUXhoKjLtHyTm0uk4rYhgqORBpfF5NKt3gpCV4aK6n
	6x9w5ozA2Q+II1AYobgXpgQwbh08hubNa/4s4oEpET4Rg722JdvLZXRsPh9X1gqk7YtVT4zNsck
	I
X-Google-Smtp-Source: AGHT+IHCyqhipg/WrQst6ZZ09BP3XokklF0T7m1GyKVVT26MtlB6xrC68E8eirItYpy8TO9Ya/A5gg==
X-Received: by 2002:a17:90a:8cb:b0:2c2:f501:20f1 with SMTP id 98e67ed59e1d1-2c2f50124c4mr6983489a91.3.1718111252282;
        Tue, 11 Jun 2024 06:07:32 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] gdk-pixbuf: upgrade 2.42.10 -> 2.42.11
Date: Tue, 11 Jun 2024 06:07:17 -0700
Message-Id: <78d7d14194f25be800fb42c8e81f7709611d26cd.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200511

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
fatal-loader.patch
refreshed for 2.42.11

Changelog:
===========
- Disable fringe loaders by default
- Introspection fixes
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 243a6fce44882ff16c5dfcb518cafd8ee8f7ae24)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...uild-allow-a-subset-of-tests-in-cross-compile.patch | 10 +++++-----
 .../gdk-pixbuf/gdk-pixbuf/fatal-loader.patch           |  7 +++----
 .../{gdk-pixbuf_2.42.10.bb => gdk-pixbuf_2.42.11.bb}   |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.10.bb => gdk-pixbuf_2.42.11.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 7250fa3f62..3d685db774 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 9d3b374e75692da3d1d05344a1693c85a3098f47 Mon Sep 17 00:00:00 2001
+From 4bfb696fd125f044e3df9f6983c4ad518d9552c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 8a16c8f..7c8b20f 100644
+index 78f3683..e0feaee 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -369,10 +369,10 @@ subdir('gdk-pixbuf')
+@@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -37,7 +37,7 @@ index 8a16c8f..7c8b20f 100644
  endif
  
 diff --git a/tests/meson.build b/tests/meson.build
-index 28c2525..c45e765 100644
+index 78d0ad9..0c9e64e 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
@@ -49,7 +49,7 @@ index 28c2525..c45e765 100644
    # Resources; we cannot use gnome.compile_resources() here, because we need to
    # override the environment in order to use the utilities we just built instead
    # of the system ones
-@@ -166,9 +166,11 @@ endif
+@@ -172,9 +172,11 @@ endif
  test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args = [ '-k' ]
  test_env = environment()
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
index 23c68a0923..80c93e2166 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/fatal-loader.patch
@@ -1,4 +1,4 @@
-From b511bd1efb43ffc49c753e309717a242ec686ef1 Mon Sep 17 00:00:00 2001
+From 9b4f5738f8ac30f393b6163dcc84757976683d9b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 1 Apr 2014 17:23:36 +0100
 Subject: [PATCH] gdk-pixbuf: add an option so that loader errors are fatal
@@ -8,13 +8,12 @@ non-zero if the loader had errors (missing libraries, generally).
 
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/144]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  gdk-pixbuf/queryloaders.c | 19 +++++++++++++++----
  1 file changed, 15 insertions(+), 4 deletions(-)
 
 diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
-index 1d39b44..2b00815 100644
+index baa9a5c..9b6fa89 100644
 --- a/gdk-pixbuf/queryloaders.c
 +++ b/gdk-pixbuf/queryloaders.c
 @@ -216,7 +216,7 @@ write_loader_info (GString *contents, const char *path, GdkPixbufFormat *info)
@@ -77,7 +76,7 @@ index 1d39b44..2b00815 100644
                  }
                  g_free (cwd);
          }
-@@ -490,5 +498,8 @@ int main (int argc, char **argv)
+@@ -492,5 +500,8 @@ int main (int argc, char **argv)
  
          g_free (pixbuf_libdir);
  
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
index cca89a9059..ef0f23f8f7 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            "
 
-SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
+SRC_URI[sha256sum] = "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.34.1


