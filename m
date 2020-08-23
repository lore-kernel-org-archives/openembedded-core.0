Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.181006.1598214092121118898
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jpuRbd+Z;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id b17so984861ejq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CjG/8mgAva+CxvCpHV8pUlHI9M+onEMyk4gEZgQLP5M=;
        b=jpuRbd+ZYimXY+c60JogPg28+rPrV7IIroXkzzvp3NLU7DiNs2sbu6xnDVNlFpqmvF
         zYx84qNMqO13asdMUMnBo9VbHMXcZ+Ta90eV1g2vrcUYr8Py3PBMcjvA3qhQcRIaTVFf
         lUottBEJDSgtgY1nrZ2pplazCN2v5ziCM+PG2/SLdL9NlP6zDTaavGVjxF5bmeJtnoXT
         egeiQen8RvtKzTXwbKnJGSKQso1O2N1i2Skm9pYKlIbBVFIHNBCueY81ftnqpQgYcV0J
         Cr3b2F16yAoYkbK2ca4BAl+JZNzCMHXH+garMtPTy/ZsxRr1ej6arh7rHqsWYiSObtrg
         9JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CjG/8mgAva+CxvCpHV8pUlHI9M+onEMyk4gEZgQLP5M=;
        b=ZsUgcVIfCygnzV5dxphQRlLyy7TXg53xu6InKYYyfjhJ49jIQ4EtVjcnRXQ1NnGq2+
         9IDlHR+SX2oExdNdxSflqT4rhRix0jFlm2jKK21YwinVsaDJc4V6G2ta7zvNcSFkj0P7
         jqf/4TVpJ3e3jwFPAEMrxqaLKEbnXsoF8rpxoPcaXVMNCau0JQm6IW2gVBUI/UTHE7sq
         SBiREd0ncUDEjLEFPcNI4L23tDQuS/WYYsS2jJw6FjPIzsaP96swcyZDpZZQ4X9+74Hm
         uhtQZZLa6UTF+i9WykGg/1M9YYU+VEMS5aTQKbT3hd0gbElrYTw8OMPOUx8wsVyzioVF
         OWcA==
X-Gm-Message-State: AOAM5337aE8+jMQZK+uZkOvCgs4ftqYaox6xk/tiCWsVHlTTGYCF+pol
	RYHGLdf4ArlMcRmBN4T9a/GvCnFSJXE=
X-Google-Smtp-Source: ABdhPJwBdeojL5Vrfz0TAMbedH4/7mGOOOGbk0ITvqfHZ6w56oz5iALg/h2MECIyn0+V9xvm3O6utg==
X-Received: by 2002:a17:906:81d3:: with SMTP id e19mr2611221ejx.51.1598214090294;
        Sun, 23 Aug 2020 13:21:30 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:29 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/37] harfbuzz: convert to meson, enable gobject introspection
Date: Sun, 23 Aug 2020 22:20:21 +0200
Message-Id: <20200823202031.24686-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latter is needed for pango update.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...isable-introspection-in-cross-builds.patch | 27 ++++++++++++++++++
 ...nums.cc.tmpl-write-out-only-the-file.patch | 28 +++++++++++++++++++
 .../harfbuzz/harfbuzz_2.7.1.bb                | 24 ++++++++++------
 3 files changed, 71 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch
new file mode 100644
index 0000000000..d00656fc88
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Do-not-disable-introspection-in-cross-builds.patch
@@ -0,0 +1,27 @@
+From df5848f423ec0f4b3e519900014349a0c00b1969 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 17 Aug 2020 16:36:03 +0200
+Subject: [PATCH] Do not disable introspection in cross builds.
+
+Yocto can and does support introspection cross builds, through
+running target binaries under qemu emulation.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 1865633..5e1787c 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -634,7 +634,7 @@ if have_gobject
+   gir = find_program('g-ir-scanner', required: get_option('introspection'))
+   build_gir = gir.found()
+ 
+-  build_gir = build_gir and not meson.is_cross_build()
++  build_gir = build_gir
+   if not build_gir and get_option('introspection').enabled()
+     error('Introspection support is requested but it isn\'t available in cross builds')
+   endif
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch
new file mode 100644
index 0000000000..4ba4f8b28e
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch
@@ -0,0 +1,28 @@
+From f316b794265f28e89821dfab0772caac1bb6b056 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 18 Aug 2020 10:31:47 +0000
+Subject: [PATCH] src/hb-gobject-enums.cc.tmpl: write out only the filename,
+ not the full path
+
+This is beneficial for reproducible builds, as build paths can vary
+between builds.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/hb-gobject-enums.cc.tmpl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hb-gobject-enums.cc.tmpl b/src/hb-gobject-enums.cc.tmpl
+index 2ffd1c9..87a11dd 100644
+--- a/src/hb-gobject-enums.cc.tmpl
++++ b/src/hb-gobject-enums.cc.tmpl
+@@ -43,7 +43,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN file-tail ***/
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
index 08c8f83239..42b3af1ff0 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.1.bb
@@ -10,18 +10,26 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f787620b7d3866d9552fd1924c07572 \
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-Do-not-disable-introspection-in-cross-builds.patch \
+           file://0001-src-hb-gobject-enums.cc.tmpl-write-out-only-the-file.patch \
+           "
 SRC_URI[sha256sum] = "e95ee43b6bd0d3d1307e2aacf0f9c0050e5baceb21988b367b833028114aa569"
 
-inherit autotools pkgconfig lib_package gtk-doc
+inherit meson pkgconfig lib_package gtk-doc gobject-introspection
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_ENABLE_FLAG = 'enabled'
+GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
 PACKAGECONFIG ??= "cairo fontconfig freetype glib icu"
-PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo"
-PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig,fontconfig"
-PACKAGECONFIG[freetype] = "--with-freetype,--without-freetype,freetype"
-PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0"
-PACKAGECONFIG[graphite] = "--with-graphite2,--without-graphite2,graphite2"
-PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
+PACKAGECONFIG[cairo] = "-Dcairo=enabled,-Dcairo=disabled,cairo"
+PACKAGECONFIG[fontconfig] = "-Dfontconfig=enabled,-Dfontconfig=disabled,fontconfig"
+PACKAGECONFIG[freetype] = "-Dfreetype=enabled,-Dfreetype=disabled,freetype"
+PACKAGECONFIG[glib] = "-Dglib=enabled,-Dglib=disabled,glib-2.0"
+PACKAGECONFIG[graphite] = "-Dgraphite=enabled,-Dgraphite=disabled,graphite2"
+PACKAGECONFIG[icu] = "-Dicu=enabled,-Dicu=disabled,icu"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 
-- 
2.28.0

