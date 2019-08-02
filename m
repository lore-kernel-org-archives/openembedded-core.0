Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A7EA7EC4C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:57:54 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so62705126wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DkKzG5RkHfWDI0UPh0Z4o8y/IlpRVe2JIPfettNILks=;
	b=lcdrqcmzUfXlmgFTcXzfFkRYxqGaf+SRSR8jKAUihU6l+/e36whVp88jie+b1lQRJs
	xBQwZYeUcXaP29mZSfUltoa176yl8EqKXdUpkNaPnn9Oip6kvUiFUrwELdcjG7Tw9EvL
	dbJ/VxE1wIMOIlk5ekciVZ+hsqJdr9gEbFfzDCJpP48YJ2BoMqMmF8OWzqK9VMrCDbPb
	1GvayNQXjMOjhfow1O7RsGmjBrV+8ViMIx7xTNWuDGqVacKv/XsSETc7tp5w6zv2zMKI
	GdCfQLZYnXNYOdRlIKX4UjCDy0wzUejGuq5AHvrkiqBV6RKiT1tJn4Tj0BScQ0weLSkv
	30+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DkKzG5RkHfWDI0UPh0Z4o8y/IlpRVe2JIPfettNILks=;
	b=QFY6i70MK+ZlxR2L331xDH6aADSS2BLArM6R0cYNAaWemAVyR4oxJrzNVbje3+e22F
	ToWrtIexBVAFQbhJ0qnMEl1alusuZ3RRWeM179RPVJ87f1eRdzlp+ah+jak73eXVG1XP
	QZiYCvC2W78RZwQzTJGQIZbu22qSzx1A6xf/NMXOgZEBYS7rtp2xFFyiiI8PdOuJXHfB
	o9WEfmv99QnvkxZkCJZAvRME63D7FoSVn5PDhcE4G5qKDDbYODidi1zC760PgaGPqX97
	w507bdO2tadTjegc92KWAv83W/Yv/lnwTQhYKCwNdQy/MZxzwMGANQJYEGXUyC0VYrmL
	3L9Q==
X-Gm-Message-State: APjAAAVV0mcO5VLCQ5L8cVefldhBq8DzrpkVU73DBsX0hS2FNjofouk1
	tramsEWEqpJYYt61B8Gn5GLadHgbaZ0=
X-Google-Smtp-Source: APXvYqx+Tewkfb8scuDX1XJqu9LHFdpe6hWSZ7bKeu2gLynHMhwz3dkbt+q7bVYYHLva2rQbefHZdw==
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr5254413wmm.10.1564761474830; 
	Fri, 02 Aug 2019 08:57:54 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id e7sm64720690wmd.0.2019.08.02.08.57.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:57:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 17:57:47 +0200
Message-Id: <20190802155747.9285-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] meson: add a backported patch to address vala cross-compilation errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Aug 2019 15:57:54 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 .../meson/meson/vala-cross-compile.patch      | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/vala-cross-compile.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index b9a05967f46..662368e2196 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-mesonbuild-environment.py-do-not-determine-whether-a.patch \
            file://0001-mesonbuild-environment.py-check-environment-for-vari.patch \
            file://0001-modules-python.py-do-not-substitute-python-s-install.patch \
+           file://vala-cross-compile.patch \
            "
 SRC_URI[sha256sum] = "f27b7a60f339ba66fe4b8f81f0d1072e090a08eabbd6aa287683b2c2b9dd2d82"
 SRC_URI[md5sum] = "48787e391ec5c052799a3dd491f73909"
diff --git a/meta/recipes-devtools/meson/meson/vala-cross-compile.patch b/meta/recipes-devtools/meson/meson/vala-cross-compile.patch
new file mode 100644
index 00000000000..816f810c054
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/vala-cross-compile.patch
@@ -0,0 +1,50 @@
+From 77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d Mon Sep 17 00:00:00 2001
+From: James Westman <flyingpimonster@flyingpimonster.net>
+Date: Mon, 24 Jun 2019 12:04:12 -0500
+Subject: [PATCH] Fix two errors when cross-compiling with Vala
+
+- AttributeError: 'ValaCompiler' object has no attribute 'get_program_dirs'
+
+  Fixed by adding a `get_program_dirs()` function to the base Compiler
+  class, to match `get_library_dirs()`
+
+- KeyError: 'vala_COMPILER'
+
+  Fixed by creating the Vala compile rules for all machines, not just
+  the build machine.
+
+Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/77c3e6a4aaed07e626f4bf4deb7eb66e0f03a33d]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ mesonbuild/backend/ninjabackend.py | 3 +--
+ mesonbuild/compilers/compilers.py  | 3 +++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
+index a454e6ab5f..b830e377e4 100644
+--- a/mesonbuild/backend/ninjabackend.py
++++ b/mesonbuild/backend/ninjabackend.py
+@@ -1653,8 +1653,7 @@ def generate_compile_rule_for(self, langname, compiler):
+                 self.generate_cs_compile_rule(compiler)
+             return
+         if langname == 'vala':
+-            if self.environment.machines.matches_build_machine(compiler.for_machine):
+-                self.generate_vala_compile_rules(compiler)
++            self.generate_vala_compile_rules(compiler)
+             return
+         if langname == 'rust':
+             self.generate_rust_compile_rules(compiler)
+diff --git a/mesonbuild/compilers/compilers.py b/mesonbuild/compilers/compilers.py
+index 5855de71c8..86c1e33407 100644
+--- a/mesonbuild/compilers/compilers.py
++++ b/mesonbuild/compilers/compilers.py
+@@ -1117,6 +1117,9 @@ def find_library(self, *args, **kwargs):
+     def get_library_dirs(self, *args, **kwargs):
+         return ()
+ 
++    def get_program_dirs(self, *args, **kwargs):
++        return ()
++
+     def has_multi_arguments(self, args, env) -> Tuple[bool, bool]:
+         raise EnvironmentException(
+             'Language {} does not support has_multi_arguments.'.format(
-- 
2.17.1


