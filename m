Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A05C7EE31
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:04 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.39159.1683653036680957568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EZXcRuQy;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso11930678a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653035; x=1686245035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQhC1Qt3sCrlqtK76irsJwClLaiR4kAKAkR9RNxN49Q=;
        b=EZXcRuQyfGmrFmuIm6XLxh0D/MPWZ+jvoVyBjED23n+4emXwVYt3+yTL+QpdbcEBlW
         9B2U+AaeMfqC1qbQqEdmlqho0l0xz01n92EpnW8ULX1YYjkXGMQCiL4CSktY44GdTpVI
         XBsh8kcdhCm8KvcGjMT7TZVCNxqlUyx91Yy+Dgd/pas/kxsF0pQGs1HB5x50GTISOuRP
         9MCQhBo7qz4Vkt7P0lLiepq+UcNDA12cpA2wfcJyaCbhEPwvYZMNxVH+k7qMA4++Lw7p
         2aQ5nCCoSLdcLoVvQNl2vEwahL58r+1fDJ2l0AjuR7KIGDtWS4Vce9IRcfJWlk4ebXYF
         6oGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653035; x=1686245035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQhC1Qt3sCrlqtK76irsJwClLaiR4kAKAkR9RNxN49Q=;
        b=Di6tiG2ZqHunKkUio0E1kluzhkWRP7Vg4vCuXO/H8p4YELHtOeQLE6gUv73RJpsTM8
         pzLCRBZW6RYcKUMkzlQDLrvP+5JMs+EVDwkal8QYYN5Oi0bBakcWo9Ynbk+n4BzYDIz1
         ZPsDK08Cf+xUCgowTYANXudtC+DyJpfcE1ox8NTKAv5Tn6fb29NtaRCLv1E4WVQB6vNZ
         Iw+2elpjIIPTz5hpdcG/3AyvI33pH4eV8YweyHYPuGtgIpIO9kTQcny6C3O7UlKCY0ja
         ZvMK8zRzKs+8/2MiFzBhlHN23wim0FJSfmji7HLUBfrvgrBcdw5R6qqtww0OJIB9tZje
         nsBA==
X-Gm-Message-State: AC+VfDwL3NLn1cQIyQl+hPq+kQ+Tiy4e1kn54ncmIj/MRBvMaEravhYg
	mkW3mkM2EaIfPwFHcibjRLvHjrCSWNU=
X-Google-Smtp-Source: ACHHUZ41eE3HHQTHZz5WRGSihP1VjdE18x+DrmCh9zdHGMG3lFXQb/aLkPFKSSUY1UR5cjH90o7RLQ==
X-Received: by 2002:a17:907:8a29:b0:965:f8b7:b0cd with SMTP id sc41-20020a1709078a2900b00965f8b7b0cdmr16740758ejc.25.1683653035028;
        Tue, 09 May 2023 10:23:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:23:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/27] meson: update 1.0.1 ->1.1.0
Date: Tue,  9 May 2023 19:23:28 +0200
Message-Id: <20230509172344.1516743-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181066

Rebase two patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...for-clang-before-guessing-gcc-or-lcc.patch | 14 +++---
 ...-not-manipulate-the-environment-when.patch | 48 +++++++++----------
 .../meson/{meson_1.0.1.bb => meson_1.1.0.bb}  |  2 +-
 3 files changed, 31 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.0.1.bb => meson_1.1.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch b/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch
index 58fa1194398..c449bf8cda4 100644
--- a/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch
@@ -1,4 +1,4 @@
-From 8739e1c3bef653415ad4b9b9c318ccfa76c43da6 Mon Sep 17 00:00:00 2001
+From e3d1297c408b9b4d5d6a962aad5501e869287c98 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Mar 2022 15:00:24 -0700
 Subject: [PATCH] Check for clang before guessing gcc or lcc
@@ -21,19 +21,20 @@ this check anyway.
 
 Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/10218]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  mesonbuild/compilers/detect.py | 15 ++++++++-------
  1 file changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/mesonbuild/compilers/detect.py b/mesonbuild/compilers/detect.py
-index 53948b01a..ba335cf39 100644
+index 6eca155..2df241a 100644
 --- a/mesonbuild/compilers/detect.py
 +++ b/mesonbuild/compilers/detect.py
-@@ -427,13 +427,14 @@ def _detect_c_or_cpp_compiler(env: 'Environment', lang: str, for_machine: Machin
+@@ -334,13 +334,14 @@ def _detect_c_or_cpp_compiler(env: 'Environment', lang: str, for_machine: Machin
          version = search_version(out)
  
          guess_gcc_or_lcc: T.Optional[str] = None
--        if 'Free Software Foundation' in out or 'xt-' in out:
+-        if 'Free Software Foundation' in out or out.startswith('xt-'):
 -            guess_gcc_or_lcc = 'gcc'
 -        if 'e2k' in out and 'lcc' in out:
 -            guess_gcc_or_lcc = 'lcc'
@@ -41,7 +42,7 @@ index 53948b01a..ba335cf39 100644
 -            # this output has "Free Software Foundation" in its version
 -            guess_gcc_or_lcc = None
 +        if not 'clang' in compiler_name:
-+            if 'Free Software Foundation' in out or 'xt-' in out:
++            if 'Free Software Foundation' in out or out.startswith('xt-'):
 +                guess_gcc_or_lcc = 'gcc'
 +            if 'e2k' in out and 'lcc' in out:
 +                guess_gcc_or_lcc = 'lcc'
@@ -51,6 +52,3 @@ index 53948b01a..ba335cf39 100644
  
          if guess_gcc_or_lcc:
              defines = _get_gnu_compiler_defines(compiler)
--- 
-2.35.1
-
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
index f01a6678181..19502fa9cd8 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipulate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 2e9582167bf9d3273004edb2637310531f0155ab Mon Sep 17 00:00:00 2001
+From a97dba12cff6c4c9181909141a1a9f38d7c900bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when calling
@@ -8,30 +8,30 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- mesonbuild/modules/python.py | 6 +-----
+ mesonbuild/dependencies/python.py | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
-diff --git a/mesonbuild/modules/python.py b/mesonbuild/modules/python.py
-index 3bbccd1..fda7a25 100644
---- a/mesonbuild/modules/python.py
-+++ b/mesonbuild/modules/python.py
-@@ -277,9 +277,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
-                 # there is no LIBPC, so we can't search in it
-                 return NotFoundDependency('python', env)
+diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies/python.py
+index 14386f9..118a15f 100644
+--- a/mesonbuild/dependencies/python.py
++++ b/mesonbuild/dependencies/python.py
+@@ -354,9 +354,6 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+                     empty.name = 'python'
+                     return empty
  
--            old_pkg_libdir = os.environ.pop('PKG_CONFIG_LIBDIR', None)
--            old_pkg_path = os.environ.pop('PKG_CONFIG_PATH', None)
--            os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
-             try:
-                 return PythonPkgConfigDependency(name, env, kwargs, installation, True)
-             finally:
-@@ -288,8 +285,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
-                         os.environ[name] = value
-                     elif name in os.environ:
-                         del os.environ[name]
--                set_env('PKG_CONFIG_LIBDIR', old_pkg_libdir)
--                set_env('PKG_CONFIG_PATH', old_pkg_path)
-+                pass
+-                old_pkg_libdir = os.environ.pop('PKG_CONFIG_LIBDIR', None)
+-                old_pkg_path = os.environ.pop('PKG_CONFIG_PATH', None)
+-                os.environ['PKG_CONFIG_LIBDIR'] = pkg_libdir
+                 try:
+                     return PythonPkgConfigDependency(name, env, kwargs, installation, True)
+                 finally:
+@@ -365,8 +362,7 @@ def python_factory(env: 'Environment', for_machine: 'MachineChoice',
+                             os.environ[name] = value
+                         elif name in os.environ:
+                             del os.environ[name]
+-                    set_env('PKG_CONFIG_LIBDIR', old_pkg_libdir)
+-                    set_env('PKG_CONFIG_PATH', old_pkg_path)
++                    pass
  
-         candidates.append(functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation))
-         # We only need to check both, if a python install has a LIBPC. It might point to the wrong location,
+             candidates.append(functools.partial(wrap_in_pythons_pc_dir, pkg_name, env, kwargs, installation))
+             # We only need to check both, if a python install has a LIBPC. It might point to the wrong location,
diff --git a/meta/recipes-devtools/meson/meson_1.0.1.bb b/meta/recipes-devtools/meson/meson_1.1.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.0.1.bb
rename to meta/recipes-devtools/meson/meson_1.1.0.bb
index fd478b21612..278f8e24c56 100644
--- a/meta/recipes-devtools/meson/meson_1.0.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.1.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "d926b730de6f518728cc7c57bc5e701667bae0c3522f9e369427b2cc7839d3c1"
+SRC_URI[sha256sum] = "d9616c44cd6c53689ff8f05fc6958a693f2e17c3472a8daf83cee55dabff829f"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.30.2


