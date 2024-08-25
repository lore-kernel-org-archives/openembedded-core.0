Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19999C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.37013.1724611804685128706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DhhYcVqK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7cd830e0711so2754886a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611804; x=1725216604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1lopRC/reW/13oqb0mGLgzjNJen5adKOjogZ5MFNPw=;
        b=DhhYcVqKVQfhUppcY/qBFMshKhvFrra3v8+23geb56SlE+sGYJZ3LgIyQcfP5xxEmJ
         1lZljoyyL35RRGiBEFFIFCf+uuHz23Z1WgtXTxsk0i+/GBhzkwK9sSozYlei79x/MIuD
         iIJLfvS8IsX9cpS6ibGZ+fWdtWPvQ48ZJJhz1KIxPImG/lhKDT0wkKkyQ8TFonmYdNol
         ZR3/H4pjd7BS7rbpywosIVY2WEtRdL17HVuXca06ZsKyDGtdzfjopXSOGS7BwQW7MCbc
         jkp/rHWAtceRAMBqf0EyjJbKoqZARaoUF/c6oXfoND0kqtBn7jMuvIk7LfQMN5uSRGXR
         MbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611804; x=1725216604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1lopRC/reW/13oqb0mGLgzjNJen5adKOjogZ5MFNPw=;
        b=JXNq1TSSTVSYviryG1md5l5s4IhBTCke/SDNRsoEa3wGgwmxSnJjEC/Oh/Wzw47qKE
         rSilpy0eghrbSnVj/TBHfomsz/RKMoKa2bAzAhJi5oU2Ih02IpFaAsWZ7NL9y6OV5BrX
         ILDOHQgVcbLXtDD5WLUcB3xAGxdYxan/kDGlNnq/5LP2ivzq3clm5DEv53NkRu68jCjT
         TklWzQbbI7SFijWsXryCsvECYUb80E1ILPae0rtT1S1z6LHk1eoTYpapttsw3Y1rynFN
         m+AoJ0qXM11YHs9nLbSP87ttmdTViD+xJwRZgqj55wX47DMv4jjIJD78sYHke9rG72KP
         vEXQ==
X-Gm-Message-State: AOJu0YzuiBEjKjaz1JYFjFHhSwVKxa6fqwl/X9mmuYCzu4RxV3pkfXkf
	ACFxJSfcGf+DZyswjY3hb+BXuDROsE9r3xkSmZvLzyi9YcM/kwdOjznqWiglpx5PlzCBMxQDST3
	P77Z/EA==
X-Google-Smtp-Source: AGHT+IGgIFgqY74nrJJvu3ymMvfT+sTPpzklsIp4LJI5MKDH//ljjsZIAqSgrEZEwVzVKX44LxSLbg==
X-Received: by 2002:a17:90b:180f:b0:2d3:c365:53b1 with SMTP id 98e67ed59e1d1-2d6447b2771mr14306994a91.6.1724611803907;
        Sun, 25 Aug 2024 11:50:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.50.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:50:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] libsoup: fix compile error on centos7
Date: Sun, 25 Aug 2024 11:49:51 -0700
Message-Id: <963085afced737863cf4ff8515a1cf08365d5d87.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724611692.git.steve@sakoman.com>
References: <cover.1724611692.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203731

From: Guocai He <guocai.he.cn@windriver.com>

Backport a patch [1] to fix the below build failure.

FAILED: libsoup/libsoup-2.4.so.1.11.0.p/soup-address.c.o
In file included from /usr/include/glib-2.0/gio/gnetworking.h:40,
                 from ../libsoup-2.72.0/libsoup/soup-address.c:14:
/usr/include/resolv.h:75:15: error: unknown type name ‘u_char’
         const u_char **__query,
               ^~~~~~

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815ab667c

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-meson.build-set-c_std-to-gnu99.patch | 44 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-set-c_std-to-gnu99.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-set-c_std-to-gnu99.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-set-c_std-to-gnu99.patch
new file mode 100644
index 0000000000..4a7d189515
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-meson.build-set-c_std-to-gnu99.patch
@@ -0,0 +1,44 @@
+From c41784deb1d4a923007ffe14cfa676f785808f45 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 21 Aug 2024 06:48:32 +0000
+Subject: [PATCH] meson.build: set c_std to gnu99
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Set c_std to gnu99 to avoid the following build failure with gcc 4.8:
+
+In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
+                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
+                 from ../libsoup/soup-address.c:14:
+/tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
+  const u_char *_msg, *_eom;
+  ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e83f815ab667c]
+
+Signed-off-by: ￼Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: guocai <guocai.he.cn@windriver.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3cc56fb..506c5a4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,7 +2,7 @@ project('libsoup', 'c',
+         version: '2.74.2',
+         meson_version : '>=0.50',
+         license : 'LGPL2',
+-        default_options : 'c_std=c99')
++        default_options : 'c_std=gnu99')
+ 
+ gnome = import('gnome')
+ 
+-- 
+2.35.5
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 6ff393c9a3..be286e1849 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -11,7 +11,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://0001-meson.build-set-c_std-to-gnu99.patch \
+          "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


