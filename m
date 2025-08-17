Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF41CCA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:50:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.60586.1755463843041243122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VqpsVMeS;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b0bd237so27448675e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755463841; x=1756068641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr2eh3/3qitbJkseIF/XB+S/Mm2YJ8Q/9Y3v4iuHJM8=;
        b=VqpsVMeSfd6biR6n4IER3//diD9RhUtB48z/I7n2Qn1TJKruhpQoIfjDl6PItWWZuj
         xX8DdSHdNz1t7HMUDXPyLNXY73nLi/wTGe1btKEFe2ddUfCR2ltNlK6pBdbLUzCSz3ih
         2463LyYLxlfwnAYumKnk4v5Q+Nsr3n3K8SecsFQLjqqrn0yZCb2RubWkl44Lcmx7wgkZ
         I4GcmOccGkdd0aB78RgsEc65ZPOLZJLt4aemTvVscFaB2x9gchUgiAw3g5Fnd/mHyCYk
         xbhVQJl5f3FSzQiSmSr+gI8mb30GY0CKtLbSBHWgwBkUldE59P9nTCd6s3RtXVschkNl
         nkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463841; x=1756068641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr2eh3/3qitbJkseIF/XB+S/Mm2YJ8Q/9Y3v4iuHJM8=;
        b=UbKfXhCSVeS5gp2WoeH5iHZIB2qZiana3p1Ow+VNJ/f99BJVbVy4bmXNd06LVyYVq0
         QA3Fu91SEgIXwWx6dFSm46dhgacsqQYthuv3yeR2ZX2Rt00s2GYv20FIA0unXtLTYe2V
         g1jVV4rRHXTi11Kgk/Bq/0pfRVjFewFumpiPGOmLEyo7SriZOzsN6B8fKn6feVScPo1C
         ABk1zuvTUmTP5YQhwd4zlBDcftN3YOwSxNdFE4PpkGm/Ai8DMD9FrbtylOpiXQtJ+8n0
         SoGXN8XHv5shJTQt8ZajJ40sGoLOBHS9Jic7UvSuKFasz8gZ0udih0h1hwL/wmSS0y1M
         CccQ==
X-Gm-Message-State: AOJu0Yz8Ke9BHmyzKkgZtEbQONF1zHsRvVMiidYgs1xj5+zfng1NHLs4
	43RlXT8/nCS4emHbck3J1Pls+reuY4TW72UtjKQUuAtT0p2dnXvtdAoAU1qaPA==
X-Gm-Gg: ASbGncudHp3xz0FiRX1+7z6WSGFUmquFvMZyBNZ4E7WahI64AZ5Mu3AJazKP7qJaDhD
	D8vk5cB74vnMjIvw/hIxyEtc3S/6NrkfaNqLbbCxf3pneLAOjl4y/fdEjvJXkl6c1XiXT7vZCRe
	m3bfJIfeFeRUvKtseNFh99cxxG3e6xZ4v7LA/VRvMZiYtJwBAQ0Ax0rgigyw27Vp/Evj5CoM7Kl
	rc0Sbvzywq9uUU4eULr1gSEXcUbjDGi+3IaRBhGnn6hhGj8v28LCAF+OMFK3mRsNm+vQVT4tu8w
	QuZttXiZhBwfOuuSkbQY1y/TYo4CCYsRX5RI5KoejG/Y5Qdsik5JsdC7tfpj13bl0/cq5gt1Mkm
	xuQp6d+Fo376eMITkABBuxn9zEw==
X-Google-Smtp-Source: AGHT+IH9h040tivV777wmjEs0fNIYiqxihMKC/8XA3FkWmkfSQWXS0xSFqV01kHDfxiTQC7tdkoSlg==
X-Received: by 2002:a05:6000:1884:b0:3b7:90f3:cd8a with SMTP id ffacd0b85a97d-3bb693b1f13mr7266456f8f.49.1755463841290;
        Sun, 17 Aug 2025 13:50:41 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb652f75aesm10337039f8f.23.2025.08.17.13.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:50:40 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 3/3] cairo: fix build with gcc-15 on host
Date: Sun, 17 Aug 2025 22:50:33 +0200
Message-ID: <20250817205033.3845672-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250817205033.3845672-1-martin.jansa@gmail.com>
References: <20250817205033.3845672-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222020

From: Martin Jansa <martin.jansa@gmail.com>

* backports from 1.18.2 used since:
  https://git.openembedded.org/openembedded-core/commit/?id=070d79c8adec7e0a8862019cf61910a59b18613a

* fixes build on hosts with gcc-15 (e.g. ubuntu-25.10)

../cairo-1.18.0/test/pdiff/pdiff.h:22:13: error: âboolâ cannot be defined via âtypedefâ
   22 | typedef int bool;
      |             ^~~~
../cairo-1.18.0/test/pdiff/pdiff.h:22:13: note: âboolâ is a keyword with â-std=c23â onwards
../cairo-1.18.0/test/pdiff/pdiff.h:22:1: warning: useless type name in empty declaration
   22 | typedef int bool;
      | ^~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../cairo/cairo/0001-Require-C11.patch        | 25 +++++++++++++++++++
 .../cairo/cairo/0002-Meson-Require-C-11.patch | 22 ++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.18.0.bb   |  2 ++
 3 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
 create mode 100644 meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch

diff --git a/meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch b/meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
new file mode 100644
index 0000000000..a2e888e46b
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0001-Require-C11.patch
@@ -0,0 +1,25 @@
+From de2452228814e804b103dfa7c2d37b3a216c6155 Mon Sep 17 00:00:00 2001
+From: Adrian Johnson <ajohnson@redneon.com>
+Date: Sun, 28 Apr 2024 21:31:41 +0930
+Subject: [PATCH] Require C11
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/cairo/cairo/-/commit/b60f47dfd5bbe98aec43f6c356ba3be9a1b7989e]
+---
+ meson.build | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 9100152..f8432fd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,7 +1,8 @@
+ project('cairo', 'c', 'cpp',
+-  meson_version: '>= 0.59.0',
++  meson_version: '>= 1.3.0',
+   version: run_command(find_program('version.py'), check: true).stdout().strip(),
+-  default_options: ['warning_level=2'],
++  default_options: ['c_std=gnu11,c11',
++                    'warning_level=2'],
+ )
+ 
+ freetype_required_version = '>= 9.7.3'
diff --git a/meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch b/meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch
new file mode 100644
index 0000000000..b395fbbc8b
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0002-Meson-Require-C-11.patch
@@ -0,0 +1,22 @@
+From d9cc95b94b2bb1e67f2095cda484d4a8a63aba10 Mon Sep 17 00:00:00 2001
+From: Luca Bacci <luca.bacci982@gmail.com>
+Date: Thu, 16 Jan 2025 16:48:12 +0100
+Subject: [PATCH] Meson: Require C++11
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/cairo/cairo/-/commit/dfd06ab3884d79de3b5bac782d1e8b2a0bd791ab]
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index f8432fd..85434d2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -2,6 +2,7 @@ project('cairo', 'c', 'cpp',
+   meson_version: '>= 1.3.0',
+   version: run_command(find_program('version.py'), check: true).stdout().strip(),
+   default_options: ['c_std=gnu11,c11',
++                    'cpp_std=gnu++11,c++11',
+                     'warning_level=2'],
+ )
+ 
diff --git a/meta/recipes-graphics/cairo/cairo_1.18.0.bb b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
index 4c97e973d0..f1a87ccb3f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.18.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
@@ -30,6 +30,8 @@ DEPENDS = "fontconfig freetype glib-2.0 libpng pixman zlib"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
+           file://0001-Require-C11.patch \
+           file://0002-Meson-Require-C-11.patch \
           "
 
 SRC_URI[sha256sum] = "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"

