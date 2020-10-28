Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.3899.1603919173099248401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mW17i/CC;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t20so911396edr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bo69vcKHPzCW0DJXBaC9WRQBaojDU9jwm/9xI8V2ibI=;
        b=mW17i/CCDKtEL8h2n3px9bM7rALffEQY5NasHAfgbtmk4Y/yUJXabrZuwETY0e57eK
         e4jQ1aKjgysIQR8Czl1iiTCnlhrkUA+xyCa5u0vsiJIuGkT3ej+/WUGGx4QTFi7xjVHi
         N6A56Qa/NsC9luOlNoAOrzV83WwHH1ETHiFxNBf95/ENXvvojzrryIj0xqzfuY2q5+37
         QEubrTqT/7dQhfSaXoVrTENAf8b4arg27vRWEfAI2veLnBx8dWNEuBTamY88AUcqt/pg
         EIcWfF78fPTPHLAT/wJS0Sbg5x6pAPf1eh0a0JY/LBixO6UnQOZWelY+cefG54KNcap9
         eGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bo69vcKHPzCW0DJXBaC9WRQBaojDU9jwm/9xI8V2ibI=;
        b=W8T+2LVgYWhXrrQ2VxCSInE3oTKoZJ3juYDRLnjPHb4Wp8AqkNUc/4A+LKIeF5qRkr
         INEtRpI4oVV3yZmv/1MW2KbVZ4cPwwog5tb0kqAXAGbkMsTVWMQBliwNVuGXny8VZfEP
         KViiqA4CEHVSEvyy/8iZfxQVfcxkxhcRI8coe3E89wtBzbKpHZRohXDCtC6ETwMf88/b
         mgvLMFp3Bi/U7IQaJoZXpiQBl56RELlpjTJzVf6YatMmDnSDWg1+zFuzbBsuyivp/it1
         HlkfZEzMy4LbdSnE9iRVt5B5ZzJkeVFEsbERtt++Vj+3mDyZiNMr+oV5xqM0vcfjdP2u
         NiWA==
X-Gm-Message-State: AOAM533b2n7xFKg6C1Ss3fwLp6TGGrkqkrig+do+can0w5dRSX2LiHWq
	kBt2rctZf3dBmKkcTs7ZEw85aJaswoFwwQ==
X-Google-Smtp-Source: ABdhPJzld3SnizoAysIkPYhipwakhPPjHAmPV6xgakG3V2NNfcpYz3+5YoLfmKrvp/oY4DYmsv06iA==
X-Received: by 2002:a50:d587:: with SMTP id v7mr839064edi.38.1603919171373;
        Wed, 28 Oct 2020 14:06:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/33] gobject-introspection: upgrade 1.64.1 -> 1.66.1
Date: Wed, 28 Oct 2020 22:05:31 +0100
Message-Id: <20201028210558.21070-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch to avoid build errors if building g-i data is disabled.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...pository-directory-for-native-builds.patch |  8 ++---
 ...ency-for-g-ir-compiler-for-building-.patch | 33 -------------------
 ...ude-girepo_dep-if-introspection-data.patch | 25 ++++++++++++++
 ...4.1.bb => gobject-introspection_1.66.1.bb} |  7 ++--
 4 files changed, 32 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.64.1.bb => gobject-introspection_1.66.1.bb} (97%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 9d6f5dea3c..185ebc154a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 8dfb44450ca9fffc15977e95eadcb7054ab60a9a Mon Sep 17 00:00:00 2001
+From 41c3ee549787333a073a3ce6303efef625c74dce Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
  2 files changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/girepository/girepository.c b/girepository/girepository.c
-index b7948d6..39a2586 100644
+index 7d03485..20f4813 100644
 --- a/girepository/girepository.c
 +++ b/girepository/girepository.c
 @@ -21,6 +21,8 @@
@@ -62,10 +62,10 @@ index b7948d6..39a2586 100644
        typelib_search_path = g_slist_prepend (typelib_search_path, typelib_dir);
  
 diff --git a/girepository/meson.build b/girepository/meson.build
-index 204659f..3e61d31 100644
+index c8ef6aa..b85ff7f 100644
 --- a/girepository/meson.build
 +++ b/girepository/meson.build
-@@ -44,7 +44,7 @@ girepo_internals_lib = static_library('girepository-internals',
+@@ -45,7 +45,7 @@ girepo_internals_lib = static_library('girepository-internals',
    ],
    c_args: gi_hidden_visibility_cflags + custom_c_args,
    include_directories : configinc,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
deleted file mode 100644
index fc37a5bb96..0000000000
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 56ba5656258b82dbc069ab3a61e597c931a16a83 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 17 Jun 2020 11:43:16 +0200
-Subject: [PATCH] gir: add a dependency for g-ir-compiler for building .girs
-
-meson inserts the dependency if the compiler is used directly, but
-fails to do so if the compiler is run through a wrapper. This leads
-to build race errors between building the compiler and using it.
-
-Fix provided by Quentin Schulz <quentin.schulz@streamunlimited.com>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/228]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gir/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gir/meson.build b/gir/meson.build
-index b37fdb81..557e5517 100644
---- a/gir/meson.build
-+++ b/gir/meson.build
-@@ -448,7 +448,7 @@ foreach gir : gir_files
-   typelibs += custom_target('generate-typelib-@0@'.format(gir).underscorify(),
-     input: gir,
-     output: '@BASENAME@.typelib',
--    depends: [gobject_gir, ],
-+    depends: [gobject_gir, gircompiler, ],
-     command: gircompiler_command,
-     install: true,
-     install_dir: typelibdir,
--- 
-2.27.0
-
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
new file mode 100644
index 0000000000..8fba0124cf
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-meson.build-exclude-girepo_dep-if-introspection-data.patch
@@ -0,0 +1,25 @@
+From ef5446af0ddad6a341b47957097ac40c6cb5e6d3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 20 Oct 2020 22:40:14 +0200
+Subject: [PATCH] meson.build: exclude girepo_dep if introspection data is
+ disabled
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gobject-introspection/-/merge_requests/248]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 14af2b1..a3c27c3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -283,7 +283,7 @@ pkg.generate(
+ # FIXME: meson.override_dependency() and declare_dependency()'s variable arguments
+ # are new in Meson 0.54.0, older versions of Meson won't be able to use g-i as
+ # subproject anyway
+-if meson.version().version_compare('>=0.54.0')
++if meson.version().version_compare('>=0.54.0') and get_option('build_introspection_data') == true
+   girepo_dep = declare_dependency(
+     sources: typelibs,
+     dependencies: girepo_dep,
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
similarity index 97%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index 4d80f00e10..ee0ab2866b 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -15,11 +15,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-${PV}.tar.xz \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
-           file://0001-gir-add-a-dependency-for-g-ir-compiler-for-building-.patch \
+           file://0001-meson.build-exclude-girepo_dep-if-introspection-data.patch \
            "
 
-SRC_URI[md5sum] = "3419dfd086efcf83768e0579ab6abd2b"
-SRC_URI[sha256sum] = "80beae6728c134521926affff9b2e97125749b38d38744dc901f4010ee3e7fa7"
+SRC_URI[sha256sum] = "dd44a55ee5f426ea22b6b89624708f9e8d53f5cc94e5485c15c87cb30e06161d"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
@@ -48,7 +47,7 @@ PACKAGECONFIG[doctool] = "-Ddoctool=enabled,-Ddoctool=disabled,python3-mako,"
 # Configure target build to use native tools of itself and to use a qemu wrapper
 # and optionally to generate introspection data
 EXTRA_OEMESON_class-target = " \
-    -Dgi_cross_use_host_gi=true \
+    -Dgi_cross_use_prebuilt_gi=true \
     -Dgi_cross_binary_wrapper=${B}/g-ir-scanner-qemuwrapper \
     -Dgi_cross_ldd_wrapper=${B}/g-ir-scanner-lddwrapper \
     -Dgi_cross_pkgconfig_sysroot_path=${PKG_CONFIG_SYSROOT_DIR} \
-- 
2.29.0

