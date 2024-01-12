Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF19C4725D
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 12:41:53 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.6004.1705063309298477363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 04:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IYNccxli;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2ac304e526so585271866b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 04:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705063307; x=1705668107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOHSQ1JEXGGip/U8I/ihcVhanCL3wLY9NAjMbMvPfb4=;
        b=IYNccxliVmpRwMcJxZW7kW+Es9Rgjwj3WVReBUC2YGLz8mxdmeGqX2th0OjRffcEqB
         1rJZEJTw3EsMS3BEgZ6g4pCdxjLA89iARv47ZYQbn+U4up+OlX+9GSRd3nnILxuwVSoy
         ZAEuSfE937+eMZhsVQa7vwQssP/LbRQYAFrR3fM7pnub5KWiPC4O5NutAI9EMzhcnv9E
         hgO6Jc+rSBTNgWtyHcj8dy2T9CP7bjAL7ibhsPulXisNfkOSZtfbGG7ShSj/zUXOx7fy
         FReHBuNBa5Zj7oDwx2+JtJ1iFiEcaMwrITAsxhT/d4wFt8eR6kBDbJfK1tvq44Hohj5H
         kevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705063307; x=1705668107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOHSQ1JEXGGip/U8I/ihcVhanCL3wLY9NAjMbMvPfb4=;
        b=tYymFcoui0nTUNv4RJiCfYf7OZxA0OPUfKGJ7efNsK9EfGZbV6pwfy5BXTpkneqTHW
         OHO6ErpN60MUidTLdF6n/J5QMhkuLbwFpqqGXoGzosqOvxxT9AWhgvT5aCrV2FC8YNPy
         NwgQhKELIqGTR/EsBCGL1gX4/5WO6n83tOYfycFX7RISGF4KvamUND8mYU5fRIDHEIVV
         ropZFwNtM9CzKBY8TrW9Hy0y7pE71HQPCylBpXHMD+ttgANjg1haA3WqQx6kijK/lq1S
         aFCXXNqobWlA+Uc/wvFPnGqo7XYO/WQG63TeQflcsiAdVqc/kaBxt5WW8FhbjdjvIfT8
         JpAw==
X-Gm-Message-State: AOJu0YwagHN69og8wkd7+5jzIC510WTy3iZO9vuABbnVNYHMeif03wUQ
	0HJ5tqMoXPYo/oMp6tWZds0EF+wX40Q=
X-Google-Smtp-Source: AGHT+IEDuujbu/rAtdhliwjowZ1My953dst2BxrorSyGQtv+T3XA6bdlEB7GYg+7LsUVgELF27XFAg==
X-Received: by 2002:a17:906:6857:b0:a2c:d9fb:ed3d with SMTP id a23-20020a170906685700b00a2cd9fbed3dmr295263ejs.78.1705063307043;
        Fri, 12 Jan 2024 04:41:47 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vs5-20020a170907a58500b00a2cbbebedc1sm682561ejc.53.2024.01.12.04.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 04:41:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] python: update 3.11.5 -> 3.12.1
Date: Fri, 12 Jan 2024 13:41:41 +0100
Message-Id: <20240112124141.433256-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240112124141.433256-1-alex@linutronix.de>
References: <20240112124141.433256-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 12:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193579

Drop distutils and smtpd modules from packaging, as both are gone in 3.12.

Rebase:
0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
(drop setup.py chunk as the file is gone)

Drop patches:
0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
(setup.py gone, lib/termcap not mentioned anywhere else)

0001-Don-t-search-system-for-headers-libraries.patch
(setup.py gone, usr/lib64 not mentioned anywhere else)

0001-Makefile-do-not-compile-.pyc-in-parallel.patch
(replaced with COMPILEALL_OPTS= in EXTRA_OEMAKE)

0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
(setup.py gone, add_multiarch_paths not mentioned anywhere else)

0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
(has been superseded by Setup.local tweak in do_configure:prepend)

12-distutils-prefix-is-inside-staging-area.patch
(distutils has been removed upstream, so this old, unplesant hack can be finally dropped)

avoid_warning_about_tkinter.patch
(setup.py gone, tkinter detection logic performed in configure.ac)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/python3-dir.bbclass       |   2 +-
 ...shebang-overflow-on-python-config.py.patch |   8 +-
 ...ib-termcap-to-linker-flags-to-avoid-.patch |  25 -----
 ...-search-system-for-headers-libraries.patch |  27 -----
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   6 +-
 ...-use-prefix-value-from-build-configu.patch |  30 +++---
 ...file-do-not-compile-.pyc-in-parallel.patch |  65 ------------
 ...-qemu-wrapper-when-gathering-profile.patch |  16 +--
 ...sts-due-to-load-variability-on-YP-AB.patch |  24 ++---
 ...est_sysconfig-for-posix_user-purelib.patch |  10 +-
 ...asename-to-replace-CC-for-checking-c.patch |  44 ++++----
 ...detect-multiarch-paths-when-cross-co.patch |  42 --------
 ..._fileno-test-due-to-load-variability.patch |  10 +-
 ...g.py-use-platlibdir-also-for-purelib.patch |   6 +-
 ...pes.test_find-skip-without-tools-sdk.patch |  10 +-
 ...le.py-correct-the-test-output-format.patch |   6 +-
 ...orlines-skip-due-to-load-variability.patch |  10 +-
 ...report-missing-dependencies-for-disa.patch |  38 -------
 ...up.py-do-not-add-a-curses-include-pa.patch |  37 ++-----
 ...tutils-prefix-is-inside-staging-area.patch |  58 ----------
 .../python3/avoid_warning_about_tkinter.patch |  30 ------
 .../python/python3/cgi_py.patch               |   4 +-
 .../python/python3/crosspythonpath.patch      |   6 +-
 .../python3/deterministic_imports.patch       |  18 +++-
 .../python/python3/makerace.patch             |  10 +-
 .../python/python3/python3-manifest.json      | 100 +++---------------
 .../{python3_3.11.5.bb => python3_3.12.1.bb}  |  27 +++--
 27 files changed, 154 insertions(+), 515 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
 delete mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
 delete mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
 rename meta/recipes-devtools/python/{python3_3.11.5.bb => python3_3.12.1.bb} (96%)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index d93d337f76c..3d07de99b88 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PYTHON_BASEVERSION = "3.11"
+PYTHON_BASEVERSION = "3.12"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index db084350045..03ecda98c2c 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,4 +1,4 @@
-From 78f482b91d94b44a02e02c4580166757119061ea Mon Sep 17 00:00:00 2001
+From 33bf96f31c4873032ace2cc9afacc3785997527a Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
 Subject: [PATCH] Avoid shebang overflow on python-config.py
@@ -17,13 +17,13 @@ Upstream-Status: Denied [distribution]
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 55c7c46..1f6500a 100644
+index fb0b525..75d2e73 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2115,6 +2115,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2335,6 +2335,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
- 	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
+ 	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
 +	@ # Otherwise we might get huge shebangs with native paths
 +	sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
  	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch b/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
deleted file mode 100644
index 16a41857044..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 93ae2ed3fc8be0245e35063c4f63626792f4cd0c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 25 Jan 2019 19:04:13 +0100
-Subject: [PATCH] Do not add /usr/lib/termcap to linker flags to avoid host
- contamination
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 15d0d45..37ed244 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1109,7 +1109,6 @@ class PyBuildExt(build_ext):
-                                                      'termcap'):
-                 readline_libs.append('termcap')
-             self.add(Extension('readline', ['readline.c'],
--                               library_dirs=['/usr/lib/termcap'],
-                                libraries=readline_libs))
-         else:
-             self.missing.append('readline')
diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
deleted file mode 100644
index 222a567dd56..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From aa8f1709c54557d2b51a9a37d15ccc3de62e90cb Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Wed, 4 Mar 2020 00:06:42 +0000
-Subject: [PATCH] Don't search system for headers/libraries
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
-
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 6811951..65ae476 100644
---- a/setup.py
-+++ b/setup.py
-@@ -877,8 +877,8 @@ class PyBuildExt(build_ext):
-             add_dir_to_list(self.compiler.include_dirs,
-                             sysconfig.get_config_var("INCLUDEDIR"))
- 
--        system_lib_dirs = ['/lib64', '/usr/lib64', '/lib', '/usr/lib']
--        system_include_dirs = ['/usr/include']
-+        system_lib_dirs = []
-+        system_include_dirs = []
-         # lib_dirs and inc_dirs are used to search for files;
-         # if a file is found in one of those directories, it can
-         # be assumed that no additional -I,-L directives are needed.
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
index 07c6aef9b97..026150f0e24 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch
@@ -1,4 +1,4 @@
-From 7b0a14e7320078ac891d415cab9b7568e3f52ad8 Mon Sep 17 00:00:00 2001
+From f8a664cf1fc73e381d57d6927207286059744837 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 16 Sep 2021 16:35:37 +0200
 Subject: [PATCH] Lib/pty.py: handle stdin I/O errors same way as master I/O
@@ -30,10 +30,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/Lib/pty.py b/Lib/pty.py
-index fefb63a..4cef056 100644
+index 1d97994..fa8821b 100644
 --- a/Lib/pty.py
 +++ b/Lib/pty.py
-@@ -184,7 +184,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
+@@ -178,7 +178,10 @@ def _copy(master_fd, master_read=_read, stdin_read=_read):
              i_buf = i_buf[n:]
  
          if stdin_avail and STDIN_FILENO in rfds:
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index a0f3d729924..680254fab99 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,6 +1,6 @@
-From 512c617bd00b74b30a80dd56a12391de46e2b6cf Mon Sep 17 00:00:00 2001
+From 71c194077bb907bfe423d3f3275f33a6c8ca0e74 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 10 Sep 2021 12:28:31 +0200
+Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
  file
 
@@ -15,18 +15,18 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 5 insertions(+)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index 93c6f73..ff399e2 100644
+index 79c0510..91ebcb6 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -668,6 +668,11 @@ def get_config_vars(*args):
-             _CONFIG_VARS['VPATH'] = sys._vpath
-         if os.name == 'posix':
-             _init_posix(_CONFIG_VARS)
-+        _CONFIG_VARS['installed_base'] = _CONFIG_VARS['prefix']
-+        _CONFIG_VARS['base'] = _CONFIG_VARS['prefix']
-+        _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
-+        _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
-+        _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
-         if _HAS_USER_BASE:
-             # Setting 'userbase' is done below the call to the
-             # init function to enable using 'get_config_var' in
+@@ -668,6 +668,11 @@ def _init_config_vars():
+         _CONFIG_VARS['VPATH'] = sys._vpath
+     if os.name == 'posix':
+         _init_posix(_CONFIG_VARS)
++    _CONFIG_VARS['installed_base'] = _CONFIG_VARS['prefix']
++    _CONFIG_VARS['base'] = _CONFIG_VARS['prefix']
++    _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
++    _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
++    _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
+     if _HAS_USER_BASE:
+         # Setting 'userbase' is done below the call to the
+         # init function to enable using 'get_config_var' in
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch b/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
deleted file mode 100644
index 2f037ecb09b..00000000000
--- a/meta/recipes-devtools/python/python3/0001-Makefile-do-not-compile-.pyc-in-parallel.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c960837b8fd83074bab5148236f3d0595468cea4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 16 Jan 2020 12:34:20 +0100
-Subject: [PATCH] Makefile: do not compile .pyc in parallel
-
-This was found to lock up builds, break reproducibility, and produce strange file ownership
-races.
-
-The upstream commit introducing the change was:
-https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504
-
-The build lock up issue is reported here:
-https://bugs.python.org/issue45945
-
-The repro failures are documented here:
-https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211130-yr_o1a8d/packages/diff-html/
-
-Upstream-Status: Inappropriate [see issues above]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile.pre.in | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index edd70d4..5e13ba2 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1601,30 +1601,30 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
- 	fi
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
--		-j0 -d $(LIBDEST) -f \
-+		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
--		-j0 -d $(LIBDEST) -f \
-+		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
--		-j0 -d $(LIBDEST) -f \
-+		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
--		-j0 -d $(LIBDEST)/site-packages -f \
-+		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
--		-j0 -d $(LIBDEST)/site-packages -f \
-+		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
--		-j0 -d $(LIBDEST)/site-packages -f \
-+		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index e1dabc92a3b..158cbf8ee05 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,4 +1,4 @@
-From 9f85089cc3a21d5ff235bb37c6c9758f2b70497d Mon Sep 17 00:00:00 2001
+From ea8e486a416b90c562f3b33faa91d9d1d030be0e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
@@ -11,16 +11,16 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f0aedb7..edd70d4 100644
+index 7af1845..fc7ab79 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -519,8 +519,7 @@ build_all_generate_profile:
- 	$(MAKE) @DEF_MAKE_RULE@ CFLAGS_NODIST="$(CFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)" LDFLAGS_NODIST="$(LDFLAGS_NODIST) $(PGO_PROF_GEN_FLAG)" LIBS="$(LIBS)"
- 
- run_profile_task:
+@@ -656,8 +656,7 @@ profile-run-stamp:
+ 	# enabled.
+ 	$(MAKE) profile-gen-stamp
+ 	# Next, run the profile task to generate the profile information.
 -	@ # FIXME: can't run for a cross build
 -	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK) || true
 +	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_builtin test_exceptions test_types test_support || true
- 
- build_all_merge_profile:
  	$(LLVM_PROF_MERGER)
+ 	# Remove profile generation binary since we are done with it.
+ 	$(MAKE) clean-retain-profile
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index a7d37266ef5..edb85395ff5 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 0c8002d12149fdfbbcd9a9215876d474f157eb9c Mon Sep 17 00:00:00 2001
+From bafdd769330c9d49a066fb1427f451b8d253262d Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -17,24 +17,25 @@ Skip two additional tests due to suspected load variability failures.
 [YOCTO #15177]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
 ---
  Lib/test/_test_multiprocessing.py | 3 +++
  Lib/test/test_time.py             | 2 ++
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index b50a154320..b8b2c4204d 100644
+index d52b10c..5f0e4e3 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -618,6 +618,7 @@ def test_close(self):
- 
+@@ -682,6 +682,7 @@ class _TestProcess(BaseTestCase):
          close_queue(q)
  
+     @support.requires_resource('walltime')
 +    @unittest.skip('timing related test, dependent on load')
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2003,6 +2004,7 @@ def _test_timeout_f(cls, barrier, results):
+@@ -2066,6 +2067,7 @@ class _TestBarrier(BaseTestCase):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,19 +43,19 @@ index b50a154320..b8b2c4204d 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -4890,6 +4892,7 @@ def signal_and_sleep(cls, sem, period):
-         sem.release()
+@@ -4992,6 +4994,7 @@ class TestWait(unittest.TestCase):
          time.sleep(period)
  
+     @support.requires_resource('walltime')
 +    @unittest.skip('timing related test, dependent on load')
      def test_wait_integer(self):
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 884b14231f..8f0638c0d7 100644
+index 02cc3f4..51a4548 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -492,6 +492,7 @@ def test_perf_counter(self):
+@@ -492,6 +492,7 @@ class TimeTestCase(unittest.TestCase):
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
@@ -62,7 +63,7 @@ index 884b14231f..8f0638c0d7 100644
      def test_process_time(self):
          # process_time() should not include time spend during a sleep
          start = time.process_time()
-@@ -505,6 +506,7 @@ def test_process_time(self):
+@@ -505,6 +506,7 @@ class TimeTestCase(unittest.TestCase):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
@@ -70,6 +71,3 @@ index 884b14231f..8f0638c0d7 100644
      def test_thread_time(self):
          if not hasattr(time, 'thread_time'):
              if sys.platform.startswith(('linux', 'win')):
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 5e113415c27..b6c6ac5a28a 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -1,4 +1,4 @@
-From b9f825b298b555c4770024d1f68ef1df65aad20a Mon Sep 17 00:00:00 2001
+From 37d058e841ba3bd89b5746cc5381afb014b11581 Mon Sep 17 00:00:00 2001
 From: Wentao Zhang <wentao.zhang@windriver.com>
 Date: Mon, 20 Mar 2023 13:39:52 +0800
 Subject: [PATCH] Update test_sysconfig for posix_user purelib
@@ -17,15 +17,16 @@ Update test_sysconfig.test_user_similar() for the posix_user scheme:
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
+
 ---
  Lib/test/test_sysconfig.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
-index d96371d..20aea4b 100644
+index b6dbf3d..5672590 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -373,7 +373,7 @@ class TestSysConfig(unittest.TestCase):
+@@ -372,7 +372,7 @@ class TestSysConfig(unittest.TestCase):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
@@ -34,6 +35,3 @@ index d96371d..20aea4b 100644
                      # Replace "/lib64/python3.11/site-packages" suffix
                      # with "/lib/python3.11/site-packages".
                      py_version_short = sysconfig.get_python_version()
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
index ef8edca51fa..d668858066f 100644
--- a/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
+++ b/meta/recipes-devtools/python/python3/0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch
@@ -1,4 +1,4 @@
-From 4ba40ee527f844a804be571e52d9dc5447ae4cdd Mon Sep 17 00:00:00 2001
+From 0558745601cc72c8d6d79cd691f4b82330b29d58 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 22 Oct 2018 15:19:51 +0800
 Subject: [PATCH] python3: use cc_basename to replace CC for checking compiler
@@ -27,27 +27,27 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 10 insertions(+), 9 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 90008bc..bf56195 100644
+index bd2be94..cb9e198 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -134,6 +134,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
+@@ -137,6 +137,7 @@ AC_CONFIG_HEADERS([pyconfig.h])
  AC_CANONICAL_HOST
- AC_SUBST(build)
- AC_SUBST(host)
+ AC_SUBST([build])
+ AC_SUBST([host])
 +LT_INIT
  
  AS_VAR_IF([cross_compiling], [maybe],
   [AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])]
-@@ -887,7 +888,7 @@ AC_MSG_RESULT($with_cxx_main)
+@@ -896,7 +897,7 @@ AC_SUBST([CXX])
  preset_cxx="$CXX"
  if test -z "$CXX"
  then
 -        case "$CC" in
 +        case "$cc_basename" in
-         gcc)    AC_PATH_TOOL(CXX, [g++], [g++], [notfound]) ;;
-         cc)     AC_PATH_TOOL(CXX, [c++], [c++], [notfound]) ;;
-         clang|*/clang)     AC_PATH_TOOL(CXX, [clang++], [clang++], [notfound]) ;;
-@@ -1300,7 +1301,7 @@ rmdir CaseSensitiveTestDir
+         gcc)    AC_PATH_TOOL([CXX], [g++], [g++], [notfound]) ;;
+         cc)     AC_PATH_TOOL([CXX], [c++], [c++], [notfound]) ;;
+         clang|*/clang)     AC_PATH_TOOL([CXX], [clang++], [clang++], [notfound]) ;;
+@@ -1328,7 +1329,7 @@ rmdir CaseSensitiveTestDir
  
  case $ac_sys_system in
  hp*|HP*)
@@ -56,16 +56,16 @@ index 90008bc..bf56195 100644
      cc|*/cc) CC="$CC -Ae";;
      esac;;
  esac
-@@ -1834,7 +1835,7 @@ esac
+@@ -1854,7 +1855,7 @@ esac
  ],
- [AC_MSG_RESULT(no)])
+ [AC_MSG_RESULT([no])])
  if test "$Py_LTO" = 'true' ; then
 -  case $CC in
 +  case $cc_basename in
      *clang*)
        LDFLAGS_NOLTO="-fno-lto"
        dnl Clang linker requires -flto in order to link objects with LTO information.
-@@ -1955,7 +1956,7 @@ then
+@@ -1983,7 +1984,7 @@ then
    fi
  fi
  LLVM_PROF_ERR=no
@@ -74,7 +74,7 @@ index 90008bc..bf56195 100644
    *clang*)
      # Any changes made here should be reflected in the GCC+Darwin case below
      PGO_PROF_GEN_FLAG="-fprofile-instr-generate"
-@@ -2016,7 +2017,7 @@ esac
+@@ -2147,7 +2148,7 @@ AC_MSG_RESULT([$BOLT_APPLY_FLAGS])
  # compiler and platform.  BASECFLAGS tweaks need to be made even if the
  # user set OPT.
  
@@ -83,7 +83,7 @@ index 90008bc..bf56195 100644
      *clang*)
          cc_is_clang=1
          ;;
-@@ -2235,7 +2236,7 @@ yes)
+@@ -2419,7 +2420,7 @@ yes)
  
      # ICC doesn't recognize the option, but only emits a warning
      ## XXX does it emit an unused result warning and can it be disabled?
@@ -92,16 +92,16 @@ index 90008bc..bf56195 100644
              [*icc*], [ac_cv_disable_unused_result_warning=no]
              [PY_CHECK_CC_WARNING([disable], [unused-result])])
      AS_VAR_IF([ac_cv_disable_unused_result_warning], [yes],
-@@ -2477,7 +2478,7 @@ yes)
+@@ -2665,7 +2666,7 @@ yes)
      ;;
  esac
  
 -case "$CC" in
 +case "$cc_basename" in
- *icc*)
-     # ICC needs -fp-model strict or floats behave badly
-     CFLAGS_NODIST="$CFLAGS_NODIST -fp-model strict"
-@@ -3319,7 +3320,7 @@ then
+ *mpicc*)
+     CFLAGS_NODIST="$CFLAGS_NODIST"
+     ;;
+@@ -3482,7 +3483,7 @@ then
  		then
  			LINKFORSHARED="-Wl,--export-dynamic"
  		fi;;
@@ -110,12 +110,12 @@ index 90008bc..bf56195 100644
  		  *gcc*)
  		    if $CC -Xlinker --help 2>&1 | grep export-dynamic >/dev/null
  		    then
-@@ -6410,7 +6411,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
+@@ -6802,7 +6803,7 @@ if test "$ac_cv_gcc_asm_for_x87" = yes; then
      # Some versions of gcc miscompile inline asm:
      # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=46491
      # http://gcc.gnu.org/ml/gcc/2010-11/msg00366.html
 -    case $CC in
 +    case $cc_basename in
          *gcc*)
-             AC_MSG_CHECKING(for gcc ipa-pure-const bug)
+             AC_MSG_CHECKING([for gcc ipa-pure-const bug])
              saved_cflags="$CFLAGS"
diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch b/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
deleted file mode 100644
index 1844e0efa30..00000000000
--- a/meta/recipes-devtools/python/python3/0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From dc966f1278c1077938626d682666767d2c8d0c72 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Apr 2022 18:29:47 +0000
-Subject: [PATCH] setup.py: Do not detect multiarch paths when cross-compiling
-
-add_multiarch_paths() function relies on host tools like dpkg-configure
-to operate, which is not good when cross compiling, since it ends up
-adding native paths in includes in certain cases, e.g. when building
-for aarch64 targets using aarch64 build hosts running debian-like
-distributions e.g. ubuntu, it ends up adding native multiarch paths
--I/usr/include/aarch64-linux-gnu during cross compile and since arches
-are so similar, cross compiler (epecially clang) is inhererently configured
-with multiarch ends up adding these paths to compiler cmdline which
-works ok with gcc since headers are similar but clang barfs on some gcc
-extentions and build fails due to missing gnu extentions but it silently
-compiles when using cross gcc.
-
-Fixes python3 cross build by not running this funciton when cross compiling
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 2e7f263..f7a3d39 100644
---- a/setup.py
-+++ b/setup.py
-@@ -840,7 +840,8 @@ class PyBuildExt(build_ext):
-         # only change this for cross builds for 3.3, issues on Mageia
-         if CROSS_COMPILING:
-             self.add_cross_compiling_paths()
--        self.add_multiarch_paths()
-+        if not CROSS_COMPILING:
-+            self.add_multiarch_paths()
-         self.add_ldflags_cppflags()
- 
-     def init_inc_lib_dirs(self):
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
index ff695a40911..cd112c06a85 100644
--- a/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 564d8f117fec7e573cbc10323655acefb12d143f Mon Sep 17 00:00:00 2001
+From 23184742b009ef1a8b2c0c2d79515334d4450cb9 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 15 Sep 2023 08:48:33 -0400
 Subject: [PATCH] skip no_stdout_fileno test due to load variability
@@ -11,15 +11,16 @@ Upstream-Status: Inappropriate [OE-Specific]
 [YOCTO #15210]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
 ---
  Lib/test/test_builtin.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_builtin.py b/Lib/test/test_builtin.py
-index 9078c409cc..615955c057 100644
+index de83b52..ba98fe8 100644
 --- a/Lib/test/test_builtin.py
 +++ b/Lib/test/test_builtin.py
-@@ -2247,6 +2247,7 @@ def test_input_tty_non_ascii_unicode_errors(self):
+@@ -2300,6 +2300,7 @@ class PtyTests(unittest.TestCase):
          # Check stdin/stdout error handler is used when invoking PyOS_Readline()
          self.check_input_tty("prompté", b"quux\xe9", "ascii")
  
@@ -27,6 +28,3 @@ index 9078c409cc..615955c057 100644
      def test_input_no_stdout_fileno(self):
          # Issue #24402: If stdin is the original terminal but stdout.fileno()
          # fails, do not use the original stdout file descriptor
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
index 4fb63a9b7ad..fc52fdac26e 100644
--- a/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-sysconfig.py-use-platlibdir-also-for-purelib.patch
@@ -1,4 +1,4 @@
-From 9162460d81ccc725fb04a14b27d0bf4afcfb69c9 Mon Sep 17 00:00:00 2001
+From a5d429a0e1a4809c1ded7be7e45dcabeb82c53d8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 12 Sep 2021 21:44:36 +0200
 Subject: [PATCH] sysconfig.py: use platlibdir also for purelib
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
-index daf9f00..e64bcdc 100644
+index 122d441..79c0510 100644
 --- a/Lib/sysconfig.py
 +++ b/Lib/sysconfig.py
-@@ -27,7 +27,7 @@ _INSTALL_SCHEMES = {
+@@ -28,7 +28,7 @@ _INSTALL_SCHEMES = {
      'posix_prefix': {
          'stdlib': '{installed_base}/{platlibdir}/python{py_version_short}',
          'platstdlib': '{platbase}/{platlibdir}/python{py_version_short}',
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 97150f20385..b4fe946cba2 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -1,4 +1,4 @@
-From 13aa6449c47980c7270dad2527c3911517bf34e6 Mon Sep 17 00:00:00 2001
+From b64c131a576a4b4f821514e711ab91b1394fb4ff Mon Sep 17 00:00:00 2001
 From: Tim Orling <timothy.t.orling@intel.com>
 Date: Fri, 18 Jun 2021 11:56:50 -0700
 Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
@@ -12,13 +12,13 @@ Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
 
 ---
- Lib/ctypes/test/test_find.py | 2 ++
+ Lib/test/test_ctypes/test_find.py | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/Lib/ctypes/test/test_find.py b/Lib/ctypes/test/test_find.py
+diff --git a/Lib/test/test_ctypes/test_find.py b/Lib/test/test_ctypes/test_find.py
 index 1ff9d01..59def26 100644
---- a/Lib/ctypes/test/test_find.py
-+++ b/Lib/ctypes/test/test_find.py
+--- a/Lib/test/test_ctypes/test_find.py
++++ b/Lib/test/test_ctypes/test_find.py
 @@ -113,10 +113,12 @@ class FindLibraryLinux(unittest.TestCase):
                  # LD_LIBRARY_PATH)
                  self.assertEqual(find_library(libname), 'lib%s.so' % libname)
diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
index c762f983079..410a9fc7f17 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -1,4 +1,4 @@
-From 46856e692377d21be3562f6f90c242f5c9594ae2 Mon Sep 17 00:00:00 2001
+From ef5728f0af14da5c9f80b0f038fe5bf6d44cb0e9 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 5 Aug 2019 15:57:39 +0800
 Subject: [PATCH] test_locale.py: correct the test output format
@@ -32,10 +32,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index f844e62..04df0c2 100644
+index b0d7998..cb12153 100644
 --- a/Lib/test/test_locale.py
 +++ b/Lib/test/test_locale.py
-@@ -564,7 +564,7 @@ class TestMiscellaneous(unittest.TestCase):
+@@ -557,7 +557,7 @@ class TestMiscellaneous(unittest.TestCase):
              self.skipTest('test needs Turkish locale')
          loc = locale.getlocale(locale.LC_CTYPE)
          if verbose:
diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
index 199031d42aa..0d0eb08459a 100644
--- a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -1,4 +1,4 @@
-From 013ff01fdf2aa6ca69a7c80a2a2996630877e4ea Mon Sep 17 00:00:00 2001
+From dc69a1afdb3ba619705ff71e14f19ed3142e422f Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Fri, 6 Oct 2023 10:59:44 -0400
 Subject: [PATCH] test_storlines: skip due to load variability
@@ -11,15 +11,16 @@ Upstream-Status: Inappropriate [OE-Specific]
 [YOCTO #14933]
 
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
 ---
  Lib/test/test_ftplib.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
-index 082a90d46b..508814d56a 100644
+index 2f191ea..dc29346 100644
 --- a/Lib/test/test_ftplib.py
 +++ b/Lib/test/test_ftplib.py
-@@ -629,6 +629,7 @@ def test_storbinary_rest(self):
+@@ -626,6 +626,7 @@ class TestFTPClass(TestCase):
              self.client.storbinary('stor', f, rest=r)
              self.assertEqual(self.server.handler_instance.rest, str(r))
  
@@ -27,6 +28,3 @@ index 082a90d46b..508814d56a 100644
      def test_storlines(self):
          data = RETR_DATA.replace('\r\n', '\n').encode(self.client.encoding)
          f = io.BytesIO(data)
--- 
-2.41.0
-
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
deleted file mode 100644
index 041a03b0cdf..00000000000
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 311cf9abc213fcd76795cc3a25814a15fb552065 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 7 Oct 2019 13:22:14 +0200
-Subject: [PATCH] setup.py: do not report missing dependencies for disabled
- modules
-
-Reporting those missing dependencies is misleading as the modules would not
-have been built anyway. This particularly matters in oe-core's automated
-build completeness checker which relies on the report.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
-
----
- setup.py | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/setup.py b/setup.py
-index 934cf2e..ccf83b4 100644
---- a/setup.py
-+++ b/setup.py
-@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
-                 print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
-                                               longest, g))
- 
-+        # There is no need to report missing module dependencies,
-+        # if the modules have been disabled in the first place.
-+        # cannot use mods_disabled here, because remove_configured_extensions adds
-+        # only disabled extensions into it (doesn't cover _dbm, _gdbm, readline
-+        # we support disabling through PACKAGECONFIG)
-+        sysconf_dis = sysconfig.get_config_var('MODDISABLED_NAMES').split()
-+        self.missing = list(set(self.missing) - set(sysconf_dis))
-+
-         if self.missing:
-             print()
-             print("The necessary bits to build these optional modules were not "
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
index 30d29064393..ed1c1b99750 100644
--- a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -1,8 +1,7 @@
-From 788cd0464ee2b175493a0167ceee8c0045ce323c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 16 Feb 2020 17:50:25 +0100
-Subject: [PATCH] configure.ac, setup.py: do not add a curses include path from
- the host
+From 1438c3694665961aa9c478727846343ad31fa133 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 17 Nov 2023 14:16:40 +0100
+Subject: [PATCH] configure.ac: do not add a curses include path from the host
 
 This leads to host contamination, and particularly can cause
 curses modules to fail at runtime if the host curses is configured
@@ -14,16 +13,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
  configure.ac | 6 ------
- setup.py     | 2 --
- 2 files changed, 8 deletions(-)
+ 1 file changed, 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e5e3df8..bfdd987 100644
+index d81c19a..b15b765 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -5092,12 +5092,6 @@ then
-   [Define if you have struct stat.st_mtimensec])
- fi
+@@ -6507,12 +6507,6 @@ AS_VAR_IF([have_panel], [no], [
+   AC_MSG_RESULT([$have_panel (CFLAGS: $PANEL_CFLAGS, LIBS: $PANEL_LIBS)])
+ ])
  
 -# first curses header check
 -ac_save_cppflags="$CPPFLAGS"
@@ -31,19 +29,6 @@ index e5e3df8..bfdd987 100644
 -  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
 -fi
 -
- AC_CHECK_HEADERS(curses.h ncurses.h)
- 
  # On Solaris, term.h requires curses.h
-diff --git a/setup.py b/setup.py
-index 62f0e18..c190002 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1169,8 +1169,6 @@ class PyBuildExt(build_ext):
-         panel_library = 'panel'
-         if curses_library == 'ncursesw':
-             curses_defines.append(('HAVE_NCURSESW', '1'))
--            if not CROSS_COMPILING:
--                curses_includes.append('/usr/include/ncursesw')
-             # Bug 1464056: If _curses.so links with ncursesw,
-             # _curses_panel.so must link with panelw.
-             panel_library = 'panelw'
+ AC_CHECK_HEADERS([term.h], [], [], [
+ #ifdef HAVE_CURSES_H
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
deleted file mode 100644
index bbdd8b586e9..00000000000
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 843574d5a5b0818e83e20f8c0389d567bd4733fb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 14 May 2013 15:00:26 -0700
-Subject: [PATCH] python3: Add target and native recipes
-
-Upstream-Status: Inappropriate [embedded specific]
-
-02/2015 Rebased for Python 3.4.2
-
-The proper prefix is inside our staging area.
-Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-Signed-off-by: Phil Blundell <philb@gnu.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
----
- Lib/distutils/sysconfig.py | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 03b8558..57d193d 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -272,7 +272,9 @@ def get_python_inc(plat_specific=0, prefix=None):
-     If 'prefix' is supplied, use it instead of sys.base_prefix or
-     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
-     """
--    if prefix is None:
-+    if prefix is None and os.environ.get('STAGING_INCDIR', ""):
-+        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
-+    elif prefix is None:
-         prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-     if os.name == "posix":
-         if python_build:
-@@ -315,7 +317,13 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
-     If 'prefix' is supplied, use it instead of sys.base_prefix or
-     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
-     """
--    if prefix is None:
-+    if os.environ.get('STAGING_LIBDIR', ""):
-+        lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
-+    else:
-+        lib_basename = "lib"
-+    if prefix is None and os.environ.get('STAGING_LIBDIR', ""):
-+        prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
-+    elif prefix is None:
-         if standard_lib:
-             prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-         else:
-@@ -329,7 +337,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
-         else:
-             # Pure Python
-             libdir = "lib"
--        libpython = os.path.join(prefix, libdir,
-+        libpython = os.path.join(prefix, lib_basename,
-                                  "python" + get_python_version())
-         if standard_lib:
-             return libpython
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
deleted file mode 100644
index 5a6cfc9572c..00000000000
--- a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 627b8fe6b3c11e8bb1bb1ad1d6b816b79b8dd2ce Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Mon, 28 Jan 2019 15:57:54 +0000
-Subject: [PATCH] _tkinter module needs tk module along with tcl. tk is not yet
- integrated in yocto so we skip the check for this module. Avoid a warning by
- not adding this module to missing variable.
-
-Upstream-Status: Inappropriate [distribution]
-
-Also simply disable the tk module since its not in DEPENDS.
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
----
- setup.py | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 7555dcd..f29ac86 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1364,7 +1364,6 @@ class PyBuildExt(build_ext):
-         self.detect_decimal()
-         self.detect_ctypes()
-         self.detect_multiprocessing()
--        self.detect_tkinter()
-         self.detect_uuid()
- 
-         # Uncomment the next line if you want to play with xxmodule.c
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
index 81e6099cfbd..8262c88e737 100644
--- a/meta/recipes-devtools/python/python3/cgi_py.patch
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -1,4 +1,4 @@
-From 5b0d1212d661e9a8a36738279fc9109f96eebd25 Mon Sep 17 00:00:00 2001
+From a56778372fe8dc7c42f5ffd911d89498c22dd064 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@windriver.com>
 Date: Wed, 21 Sep 2011 20:55:33 -0500
 Subject: [PATCH] Lib/cgi.py: Update the script as mentioned in the comment
@@ -12,7 +12,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  1 file changed, 1 insertion(+), 10 deletions(-)
 
 diff --git a/Lib/cgi.py b/Lib/cgi.py
-index 6cb8cf2..a873ff3 100755
+index 8787567..ebe8652 100755
 --- a/Lib/cgi.py
 +++ b/Lib/cgi.py
 @@ -1,13 +1,4 @@
diff --git a/meta/recipes-devtools/python/python3/crosspythonpath.patch b/meta/recipes-devtools/python/python3/crosspythonpath.patch
index 2fbb17f1180..2c4aef05111 100644
--- a/meta/recipes-devtools/python/python3/crosspythonpath.patch
+++ b/meta/recipes-devtools/python/python3/crosspythonpath.patch
@@ -1,4 +1,4 @@
-From 7d5fc6a86103d9bd4a274e9fd31b6987e39998a1 Mon Sep 17 00:00:00 2001
+From 5b66463c10fec1440e977d5a21a0167862d6d79c Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda <ricardo@ribalda.com>
 Date: Tue, 18 Nov 2014 03:35:33 -0500
 Subject: [PATCH] configure.ac: add CROSSPYTHONPATH into PYTHONPATH for
@@ -20,10 +20,10 @@ Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 085fc0b..22790d7 100644
+index cb9e198..d81c19a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -163,7 +163,7 @@ AC_ARG_WITH(
+@@ -165,7 +165,7 @@ AC_ARG_WITH([build-python],
      dnl Build Python interpreter is used for regeneration and freezing.
      ac_cv_prog_PYTHON_FOR_REGEN=$with_build_python
      PYTHON_FOR_FREEZE="$with_build_python"
diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
index 296b413cab5..104df949644 100644
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ b/meta/recipes-devtools/python/python3/deterministic_imports.patch
@@ -1,3 +1,8 @@
+From 039d5e652796b55f1132afa568c7432b6ed89afd Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 27 May 2022 17:05:44 +0100
+Subject: [PATCH] python3: Ensure stale empty python module directories don't
+
 There are two issues here. Firstly, the modules are accessed in on disk order. This
 means behaviour seen on one system might not reproduce on another and is a real headache.
 
@@ -9,12 +14,15 @@ As a result, patch this to a behaviour which works for us.
 Upstream-Status: Pending [need to talk to upstream to see if they'll take one or both fixes]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
+---
+ Lib/importlib/metadata/__init__.py | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
 
-Index: Python-3.10.4/Lib/importlib/metadata/__init__.py
-===================================================================
---- Python-3.10.4.orig/Lib/importlib/metadata/__init__.py
-+++ Python-3.10.4/Lib/importlib/metadata/__init__.py
-@@ -819,7 +819,14 @@ class Lookup:
+diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
+index 82e0ce1..969cac4 100644
+--- a/Lib/importlib/metadata/__init__.py
++++ b/Lib/importlib/metadata/__init__.py
+@@ -710,7 +710,14 @@ class Lookup:
          self.infos = FreezableDefaultDict(list)
          self.eggs = FreezableDefaultDict(list)
  
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index c71c1e15dec..c813b3975b6 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -1,4 +1,4 @@
-From dde5cb74f55b6dd39d25cff639d16940d9dad505 Mon Sep 17 00:00:00 2001
+From c1badb04004c78f376f77f8c41718d51947bf873 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 13 Jul 2021 23:19:29 +0100
 Subject: [PATCH] python3: Fix make race
@@ -18,13 +18,13 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c6d7e85..205af6c 100644
+index fc7ab79..fb0b525 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2045,7 +2045,7 @@ TESTSUBDIRS=	ctypes/test \
- 		unittest/test/testmock
- 
+@@ -2246,7 +2246,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
+ 
+ .PHONY: libinstall
 -libinstall:	all $(srcdir)/Modules/xxmodule.c
 +libinstall:	all $(srcdir)/Modules/xxmodule.c libainstall
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 766f083ae49..771551cfc9d 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -201,17 +201,18 @@
     "compression": {
         "summary": "Python high-level compression support",
         "rdepends": [
-            "core"
+            "core",
+            "shell"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/gzip.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
-            "${libdir}/python${PYTHON_MAJMIN}/zipfile.py"
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile",
+            "${libdir}/python${PYTHON_MAJMIN}/zipfile/_path"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
         ]
     },
     "core": {
@@ -271,6 +272,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/importlib/util.py",
             "${libdir}/python${PYTHON_MAJMIN}/inspect.py",
             "${libdir}/python${PYTHON_MAJMIN}/io.py",
+            "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
             "${libdir}/python${PYTHON_MAJMIN}/keyword.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/_struct.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/__pycache__/binascii.*.so",
@@ -378,6 +380,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
@@ -452,9 +455,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so",
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha2.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
@@ -550,8 +552,7 @@
             "${libdir}/pkgconfig"
         ],
         "rdepends": [
-            "core",
-            "distutils"
+            "core"
         ],
         "summary": "Python development package"
     },
@@ -567,27 +568,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
         ]
     },
-    "distutils-windows": {
-        "summary": "Python distribution utilities (Windows installer stubs)",
-        "rdepends": [
-            "core"
-        ],
-        "files": [],
-        "cached": []
-    },
-    "distutils": {
-        "summary": "Python Distribution Utilities",
-        "rdepends": [
-            "compression",
-            "core",
-            "email",
-            "stringold"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/distutils"
-        ],
-        "cached": []
-    },
     "doctest": {
         "summary": "Python framework for running examples in docstrings",
         "rdepends": [
@@ -630,24 +610,12 @@
     "ensurepip": {
         "summary": "Support for bootstrapping the pip installer",
         "rdepends": [
-            "asyncio",
-            "compile",
-            "core",
-            "ctypes",
-            "image",
-            "io",
-            "mmap",
-            "plistlib",
-            "pprint",
-            "unixadmin",
-            "xmlrpc"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ensurepip/"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/ensurepip/_uninstall.*.pyc"
-        ]
+        "cached": []
     },
     "fcntl": {
         "summary": "Python's fcntl interface",
@@ -715,7 +683,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
-            "${libdir}/python${PYTHON_MAJMIN}/ipaddress.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_socket.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ssl.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/termios.*.so",
@@ -726,7 +693,6 @@
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
@@ -836,7 +802,6 @@
             "db",
             "debugger",
             "difflib",
-            "distutils",
             "doctest",
             "email",
             "ensurepip",
@@ -863,15 +828,14 @@
             "pydoc",
             "resource",
             "shell",
-            "smtpd",
             "sqlite3",
             "statistics",
             "stringold",
             "syslog",
             "terminal",
-            "tomllib",
             "threading",
             "tkinter",
+            "tomllib",
             "unittest",
             "unixadmin",
             "venv",
@@ -879,9 +843,6 @@
             "xmlrpc",
             "zoneinfo"
         ],
-        "rrecommends": [
-            "distutils-windows"
-        ],
         "summary": "All Python modules"
     },
     "multiprocessing": {
@@ -1104,31 +1065,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
         ]
     },
-    "smtpd": {
-        "summary": "Python Simple Mail Transport Daemon",
-        "rdepends": [
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "stringold"
-        ],
-        "files": [
-            "${bindir}/smtpd.py",
-            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
-            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
-            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
-        ]
-    },
     "sqlite3": {
         "summary": "Python Sqlite3 database support",
         "rdepends": [
@@ -1223,18 +1159,12 @@
     "tomllib": {
         "summary": "Provides an interface for parsing TOML",
         "rdepends": [
-            "core",
-            "datetime",
-            "stringold"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/tomllib/"
         ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/tomllib/_re.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/tomllib/_types.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/tomllib/_parser.*.pyc"
-        ]
+        "cached": []
     },
     "turtle": {
         "summary": "Turtle graphics is a popular way for introducing programming to kids.",
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.12.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3_3.11.5.bb
rename to meta/recipes-devtools/python/python3_3.12.1.bb
index e7b2b08f7f0..ece7539c51d 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.1.bb
@@ -14,21 +14,16 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://check_build_completeness.py \
            file://reformat_sysconfig.py \
            file://cgi_py.patch \
-           file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
-           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://crosspythonpath.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
-           file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
-           file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
            file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
-           file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
@@ -38,10 +33,9 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-           file://12-distutils-prefix-is-inside-staging-area.patch \
-           file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f"
+
+SRC_URI[sha256sum] = "8dfb8f426fcd226657f9e2bd5f1e96e53264965176fa17d32658e873591aeb21"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -57,7 +51,7 @@ CVE_STATUS[CVE-2022-26488] = "not-applicable-platform: Issue only applies on Win
 CVE_STATUS[CVE-2015-20107] = "upstream-wontfix: The mailcap module is insecure by design, so this can't be fixed in a meaningful way"
 CVE_STATUS[CVE-2023-36632] = "disputed: Not an issue, in fact expected behaviour"
 
-PYTHON_MAJMIN = "3.11"
+PYTHON_MAJMIN = "3.12"
 
 S = "${WORKDIR}/Python-${PV}"
 
@@ -118,15 +112,30 @@ do_configure:prepend () {
 *disabled*
 ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
 ${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
+${@bb.utils.contains('PACKAGECONFIG', 'tk', '', '_tkinter', d)}
 EOF
 }
 
 CPPFLAGS:append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
 
+# COMPILEALL_OPTS= ensures that .pyc are not compiled in parallel
+# This was found to lock up builds, break reproducibility, and produce strange file ownership
+# races.
+#
+# The upstream commit introducing the change was:
+# https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cefe55a8a41504
+#
+# The build lock up issue is reported here:
+# https://bugs.python.org/issue45945
+#
+# The repro failures are documented here:
+# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211130-yr_o1a8d/packages/diff-html/
+
 EXTRA_OEMAKE = '\
   STAGING_LIBDIR=${STAGING_LIBDIR} \
   STAGING_INCDIR=${STAGING_INCDIR} \
   LIB=${baselib} \
+  COMPILEALL_OPTS= \
 '
 
 # Generate a Profile Guided Optimisation wrapper script that uses qemu-user for
-- 
2.39.2


