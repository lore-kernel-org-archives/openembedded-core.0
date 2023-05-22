Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1FDC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1202.1684776399611310043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=hQpSraoK;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-510b6a24946so11587737a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776398; x=1687368398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mft5lqPJByp0PgvpeuERqEqrmlQ80U4DJYkiWHEFYM=;
        b=hQpSraoKwFWHDsfY6NZbHQ0/r4OHe1iOFcj0qe9OeDOrCGBEyS3GNSCMR4O3CUlSkU
         FqALEf4Z1bwbZA3ymqwPvcdkSWV2BcCzmexb8XMav4e2IvQjJMdCIkN7aowa3e4pRoOV
         5R0JH0oANYjhQHM3W5uFvZCQOWptoxq8Z4+8/eRb88j60CcTD6IctQsoafrOwEd3kCpa
         VN7k3zcLG1/AszCPlJWM2ynD1//Oy9EKX6KPIn81Ks+1/P3iwt2MnwwZdxNH7ub+mK9A
         +/a05t8DKKtTT2bjmSMO8X4Mu0tmOrgze6uvsj4mE2OPOxOJda5J/sYTdg99Ly1SqfzP
         EBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776398; x=1687368398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mft5lqPJByp0PgvpeuERqEqrmlQ80U4DJYkiWHEFYM=;
        b=Xvdt8O+8NJvo4Rk8NYqs/WT2l1GAxmg4t3hXIMmNeSOIZurIhHWWDxfR6mjI/LyN14
         VuwxdHMbdh2ZceVHFMgXjY3A8sx8YsMeymV5H8ufWLOO4DfH/fWXW+ALUJ872lL1vglm
         VOUrUiXZvrwybAjqWtdN4BZ75E3UP3gMzJYJ0MA/q9sog3WhZ9x0jFp99npih8HAW8zS
         BI6lrgOowcnM/PgXxpUNcfEj+l6Lpb6jjWNGBVbtPwV+Al28OS+EdWctUJJmvsO7l3Xs
         BSlHTMsOrLKATLH1aqrWskTO23wVQF77I7dzFcBBSBgPFy20uAGgZlNBZFqTfeJNkbpZ
         MutA==
X-Gm-Message-State: AC+VfDwshRixOVBm7U+j3dn57nskLGKR/BIFLbvPwbAEqOV5QOKFIyjQ
	Ru48cfxh+ZSqXghx4bjgJ5NSz7XzSrY=
X-Google-Smtp-Source: ACHHUZ7G6QE61Uis0soXSs5rD/cReYeHx78QQbNSvjOyRzOhHz9bppdkQeHZIpNrGlnV+kBe4QzutQ==
X-Received: by 2002:aa7:d5d3:0:b0:506:bce0:48d6 with SMTP id d19-20020aa7d5d3000000b00506bce048d6mr8922759eds.5.1684776398048;
        Mon, 22 May 2023 10:26:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/8] meson: update 1.0.1 ->1.1.0
Date: Mon, 22 May 2023 19:24:59 +0200
Message-Id: <20230522172503.1651374-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230522172503.1651374-1-alex@linutronix.de>
References: <20230522172503.1651374-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181604

Rebase a patch.

Remove unneeded patch:
Khem confirmed that upstream fixed the issue with
https://github.com/mesonbuild/meson/commit/24ea1d3f1968bff52ccaaf33fcdd59e810459aa9

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...for-clang-before-guessing-gcc-or-lcc.patch | 56 -------------------
 ...-not-manipulate-the-environment-when.patch | 48 ++++++++--------
 .../meson/{meson_1.0.1.bb => meson_1.1.0.bb}  |  3 +-
 3 files changed, 25 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch
 rename meta/recipes-devtools/meson/{meson_1.0.1.bb => meson_1.1.0.bb} (97%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch b/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch
deleted file mode 100644
index 58fa1194398..00000000000
--- a/meta/recipes-devtools/meson/meson/0001-Check-for-clang-before-guessing-gcc-or-lcc.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 8739e1c3bef653415ad4b9b9c318ccfa76c43da6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Mar 2022 15:00:24 -0700
-Subject: [PATCH] Check for clang before guessing gcc or lcc
-
-clang --version can yield a string like below when its installed into
-such a directory
-
-clang version 14.0.0 (https://github.com/llvm/llvm-project 3f43d803382d57e3fc010ca19833077d1023e9c9)
-Target: aarch64-yoe-linux
-Thread model: posix
-InstalledDir: /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/gnome-text-editor/42.0-r0/recipe-sysroot-native/usr/bin/aarch64-yoe-linux
-
-as you can see InstallDir has 'xt-' subtring and this trips the check to
-guess gcc
-
-if 'Free Software Foundation' in out or 'xt-' in out:
-
-Therefore, check if compiler is clang then there is no point of running
-this check anyway.
-
-Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/10218]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mesonbuild/compilers/detect.py | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/mesonbuild/compilers/detect.py b/mesonbuild/compilers/detect.py
-index 53948b01a..ba335cf39 100644
---- a/mesonbuild/compilers/detect.py
-+++ b/mesonbuild/compilers/detect.py
-@@ -427,13 +427,14 @@ def _detect_c_or_cpp_compiler(env: 'Environment', lang: str, for_machine: Machin
-         version = search_version(out)
- 
-         guess_gcc_or_lcc: T.Optional[str] = None
--        if 'Free Software Foundation' in out or 'xt-' in out:
--            guess_gcc_or_lcc = 'gcc'
--        if 'e2k' in out and 'lcc' in out:
--            guess_gcc_or_lcc = 'lcc'
--        if 'Microchip Technology' in out:
--            # this output has "Free Software Foundation" in its version
--            guess_gcc_or_lcc = None
-+        if not 'clang' in compiler_name:
-+            if 'Free Software Foundation' in out or 'xt-' in out:
-+                guess_gcc_or_lcc = 'gcc'
-+            if 'e2k' in out and 'lcc' in out:
-+                guess_gcc_or_lcc = 'lcc'
-+            if 'Microchip Technology' in out:
-+                # this output has "Free Software Foundation" in its version
-+                guess_gcc_or_lcc = None
- 
-         if guess_gcc_or_lcc:
-             defines = _get_gnu_compiler_defines(compiler)
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
similarity index 97%
rename from meta/recipes-devtools/meson/meson_1.0.1.bb
rename to meta/recipes-devtools/meson/meson_1.1.0.bb
index fd478b21612..1190d5c34d9 100644
--- a/meta/recipes-devtools/meson/meson_1.0.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.1.0.bb
@@ -14,9 +14,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-python-module-do-not-manipulate-the-environment-when.patch \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
-           file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "d926b730de6f518728cc7c57bc5e701667bae0c3522f9e369427b2cc7839d3c1"
+SRC_URI[sha256sum] = "d9616c44cd6c53689ff8f05fc6958a693f2e17c3472a8daf83cee55dabff829f"
 
 inherit python_setuptools_build_meta github-releases
 
-- 
2.30.2


