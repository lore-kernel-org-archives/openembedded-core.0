Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D910BC369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 22:30:52 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.35701.1745793049787005154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 15:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B5rvGqFm;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so3754544a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745793049; x=1746397849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djJqpx1uoDMfapunguKT82JsyQweorTcolF/cuPdKvQ=;
        b=B5rvGqFmJPqbLkUI+itUXIfv09+8PtH1tW2fqp5JX4za8WwA99zIvqUhITv4ItHafy
         C3wV0KEGav/Uo8K1xPJzlnIN1RUqbYLkSfUmhikZfaGzNl5QBl6uFJk+xuu9lgVWOXN7
         DTE2QbtxZYy2fxgzg5nAdPpjeJRUtVCrVnuNdJo2KLl/WwvH3G5zpvtdC+/D5SsjHmUX
         Ri9SWYDVVYmA2/1PCl608gxh6yTLcI6RbF1ftTZU27dVtjet75t/i/PY4StEhjXsD6OX
         0m9rNv3sXIjYRV3jOKLXOsbgwwoCfeni2rUE+8jv2YxVcbggW8FXyyTUiZJEF/rO6C2i
         /piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745793049; x=1746397849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djJqpx1uoDMfapunguKT82JsyQweorTcolF/cuPdKvQ=;
        b=i0oY22VlLlFn7vo0UvwThhrKXwJ/meuwkN1knJ0gQQ0NGO88eGAYh3Jk7fPaBivHNo
         GGgidwOxxYZv0DWx83i5R2tAzH0h25Nu/kAvzPxCR1FGla0y8mtBlf1xy1uupZVfL5DR
         9ZjUS9ta6R/8d2BMemny0wUp+7thDShmUpPaGcwgIcaihpXGGWFUhzH/OlqL6Vc03AxA
         fWwd70mEAzctwbnYpXzg3LSJRP8zZO/75iafkQSuE8o4k0oBS7Jdi9sAicqtVW9KXjD6
         mFWay/NX7YaM6idN9R9N/B/3a0fZtm1yWjy/snhR0Eoti4+ZcXOomCRdsn2BV/UVZDaC
         qSVw==
X-Gm-Message-State: AOJu0Yxvmml4YQ6GOBQqCThOosv9N7YhyKYtEv3IWnmMuuPboMU8yJjC
	QjzKrGMjB2AT65H54QFLkxvSwgV6DUO24fYItZJGdBlAyUOmdEztQjwcBqtC
X-Gm-Gg: ASbGncvEMfcGZALMjpIv2Dbge1uj8nPCGsqTpRD/iRnvLBH52Gh54JSXTVX05MMpJJk
	/I4UI+cBuML/cHZSoAWlQgLScydmELznbmZjWWv0fS4T8Riy8YnGgS5Tj5cE2uCIfmd5+pnWPeq
	cklBxw5oTBoo+OHBzhXB8raKDGprL3vhrTweC9iL2ioyth6YtItpIfulPjMjKA6rFtbWuKLdUYT
	SlPhVY83ZnJh51O2m5CrBJaPrPz40YLRRQlM0zWY1xXETLMjITq87rAUqzzXFcEPanruMWKooa/
	CdGHV6vLsaPXi1CXfLj6LOy+PCoDY7uo
X-Google-Smtp-Source: AGHT+IFGwK3j1yK7ItD+wrWxaN3qGoCB4Q9qljWDRIzTTgrDkfRptAReEIOdbzSDSy/WRrUGd6Ey6Q==
X-Received: by 2002:a17:90b:58ce:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-309f7e04e7dmr12600535a91.21.1745793048741;
        Sun, 27 Apr 2025 15:30:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbcf7dsm68999855ad.69.2025.04.27.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 15:30:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] harfbuzz: Fix build with gcc-15
Date: Sun, 27 Apr 2025 15:30:46 -0700
Message-ID: <20250427223046.3447347-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 22:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215569

GCC-15 inliner at O2 seems to be able to analyse more
This is a workaround to compile the one file where it fails
to use -Os

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-to-compile-hb-subset-plan-layout.cc.patch | 68 +++++++++++++++++++
 .../harfbuzz/harfbuzz_11.1.0.bb               |  4 +-
 2 files changed, 69 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
new file mode 100644
index 00000000000..2f984d7af83
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch
@@ -0,0 +1,68 @@
+From 8d876ea19579ee6b687668921c17be423cf7d6c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Apr 2025 15:26:09 -0700
+Subject: [PATCH] Use -Os to compile hb-subset-plan-layout.cc
+
+This helps compiling with GCC 15
+
+Upstream-Status: Inappropriate [GCC-15 workaround]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/meson.build | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 3d1c00d..fded728 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -393,7 +393,6 @@ hb_subset_sources = files(
+   'hb-subset-instancer-solver.hh',
+   'hb-subset-instancer-solver.cc',
+   'hb-subset-plan.cc',
+-  'hb-subset-plan-layout.cc',
+   'hb-subset-plan-var.cc',
+   'hb-subset-plan.hh',
+   'hb-subset-plan-member-list.hh',
+@@ -410,6 +409,10 @@ hb_subset_sources = files(
+   'hb-subset.hh',
+ )
+ 
++hb_subset_sources_os = files(
++  'hb-subset-plan-layout.cc',
++)
++
+ hb_subset_headers = files(
+   'hb-subset.h',
+   'hb-subset-serialize.h'
+@@ -618,6 +621,12 @@ endif
+ 
+ darwin_versions = [hb_version_int, '@0@.0.0'.format(hb_version_int)]
+ 
++special_subset_layout_lib = static_library('special_subset_layout',
++  'hb-subset-plan-layout.cc',
++  include_directories: incconfig,
++  cpp_args: cpp_args + extra_hb_cpp_args + ['-Os'], # <== compile this one with -Os
++)
++
+ libharfbuzz = library('harfbuzz', hb_sources,
+   include_directories: incconfig,
+   dependencies: harfbuzz_deps,
+@@ -645,7 +654,7 @@ defs_list += [harfbuzz_subset_def]
+ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+   include_directories: incconfig,
+   dependencies: [m_dep],
+-  link_with: [libharfbuzz],
++  link_with: [libharfbuzz] + [special_subset_layout_lib],
+   cpp_args: cpp_args + extra_hb_cpp_args,
+   soversion: hb_so_version,
+   version: version,
+@@ -657,7 +666,7 @@ libharfbuzz_subset = library('harfbuzz-subset', hb_subset_sources,
+ custom_target('harfbuzz-subset.cc',
+   build_by_default: true,
+   output: 'harfbuzz-subset.cc',
+-  input: hb_base_sources + hb_subset_sources,
++  input: hb_base_sources + hb_subset_sources + hb_subset_sources_os,
+   command: [find_program('gen-harfbuzzcc.py'),
+             '@OUTPUT@', meson.current_source_dir(), '@INPUT@'],
+ )
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
index 645e1e42163..9eaacdaa5a4 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.1.0.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
+SRC_URI += "file://0001-Use-Os-to-compile-hb-subset-plan-layout.cc.patch"
 SRC_URI[sha256sum] = "477f0d48c34dc32093b45304178eb9733361ca1832b5159879c99e6d40227969"
 
 DEPENDS += "glib-2.0-native"
@@ -32,9 +33,6 @@ PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
 
 LEAD_SONAME = "libharfbuzz.so"
 
-# Remove when https://github.com/harfbuzz/harfbuzz/issues/4671 is resolved
-EXTRA_OEMESON += "-Dcpp_std=c++17"
-
 do_install:append() {
     # If no tools are installed due to PACKAGECONFIG then this directory might
     # still be installed, so remove it to stop packaging warnings.

