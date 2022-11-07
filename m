Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9EBC4167B
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.4309.1667832943977102843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:56:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dbSuxJ+p;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id g12so16560351wrs.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw6YtbqQW+6zaRbAK8KWG8k9Z5UzpFxn7cbsefM2DHE=;
        b=dbSuxJ+p3A+ZigNSHMZC+7r/Ku0iPmZoqkiVVcPoksbIoZX5vbFvo7chHpJO7wbprO
         Akqow85A1L+/PBmHSaYXVUiVmkXoXua3HkQQ8rSXG0OjdQkzYP/w9lRU2FPrfYfGLLxz
         rGYBHCY4v+8fqkq3EukYQpEL5jE6mFrueIl+4v0eVRqabmAa4gGv0zAFSM9qUfRq2J1f
         HnjHY/Fg7VvX1z2Ah99L9LNxoAkV+8RqTpvnwbN2KQvSV8ApxQG0GtHZqfXFlTpcHmLL
         U5rTBjuB3PZ6/P6NaFY44QEQsOns/XpPI+MGm5WrYnC37xh433HxukrOJGXesioQk/+Q
         7qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sw6YtbqQW+6zaRbAK8KWG8k9Z5UzpFxn7cbsefM2DHE=;
        b=3JjtHnwc10akFjGtDhjvVwIfCOiYXTOXOcdlle8ZuI5L5wgzHF7nDe3mE0Nz6s5YRX
         wAZIUwmFRYr3vGLP8HbTxi4VzjjjoCRynI6YVLHUln8Bovf4p8rIRKvzG7NdtDmzKz3t
         fbPyMg3OHw4pUYFCj+tnL4UVIK2aPXVaIjnjYlQ4Amn5ovvkQ9ZlbaEz3c7aFHKgUMY3
         JnuLPVx0rXOb3bzT9X6xVmNWB0LYP2ihFE/513dVMNwJ5jmnRt4GOjYmOmYthwxlRe7v
         Qmtzp3kKgefuFYa6RXk8Ll6xNhO4HG0XB66ts1e7rSeXf5yVpUH79zvIJlBE9Z152Oqs
         c23w==
X-Gm-Message-State: ACrzQf18bOS47QfwYchRiwnBIuIn1B5nKnzkNgIkCiJGQfVRoCubyZNn
	IGk8mOiTY8sXNHCPgnHFtrGquxDPMoY=
X-Google-Smtp-Source: AMsMyM6Vs6809hh/N3WbKkDqcRkrmP8q7nObmlxkUH/Mg3mq6wmHd7nM1XiATkB5/F5woeixJbJtIQ==
X-Received: by 2002:adf:f352:0:b0:236:ba3a:d58e with SMTP id e18-20020adff352000000b00236ba3ad58emr29407239wrp.430.1667832965256;
        Mon, 07 Nov 2022 06:56:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:56:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/48] python3: use the standard shell version of python3-config
Date: Mon,  7 Nov 2022 15:55:06 +0100
Message-Id: <20221107145508.1051404-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172896

There is really no reason why we can't: it only needs to be available
in two versions (native/target), and the correct one can be picked
via PATH priority order.

This eliminates two un-upstreamable patches, one of which relies
on soon to be removed distutils.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python3targetconfig.bbclass               | 17 ++++--
 ...shebang-overflow-on-python-config.py.patch | 14 ++---
 ...hell-version-of-python-config-that-w.patch | 36 ------------
 .../python/python3/python-config.patch        | 55 -------------------
 .../recipes-devtools/python/python3_3.11.0.bb | 15 ++++-
 5 files changed, 30 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python-config.patch

diff --git a/meta/classes-recipe/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
index 3f89e5e09e..e5187bb459 100644
--- a/meta/classes-recipe/python3targetconfig.bbclass
+++ b/meta/classes-recipe/python3targetconfig.bbclass
@@ -10,26 +10,31 @@ EXTRA_PYTHON_DEPENDS ?= ""
 EXTRA_PYTHON_DEPENDS:class-target = "python3"
 DEPENDS:append = " ${EXTRA_PYTHON_DEPENDS}"
 
-do_configure:prepend:class-target() {
+setup_target_config() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        export PATH=${STAGING_BINDIR}:$PATH
+}
+
+do_configure:prepend:class-target() {
+        setup_target_config
 }
 
 do_compile:prepend:class-target() {
-        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        setup_target_config
 }
 
 do_install:prepend:class-target() {
-        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        setup_target_config
 }
 
 do_configure:prepend:class-nativesdk() {
-        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        setup_target_config
 }
 
 do_compile:prepend:class-nativesdk() {
-        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        setup_target_config
 }
 
 do_install:prepend:class-nativesdk() {
-        export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
+        setup_target_config
 }
diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 921da8de7c..db08435004 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -1,7 +1,7 @@
-From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
+From 78f482b91d94b44a02e02c4580166757119061ea Mon Sep 17 00:00:00 2001
 From: Paulo Neves <ptsneves@gmail.com>
 Date: Tue, 7 Jun 2022 16:16:41 +0200
-Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
+Subject: [PATCH] Avoid shebang overflow on python-config.py
 
 The whole native path may be too big, leading to shebang
 overflow. Let's just use the env shebang.
@@ -11,15 +11,16 @@ Denial reason: [1]
 Upstream-Status: Denied [distribution]
 
 [1] https://github.com/python/cpython/pull/93760#pullrequestreview-1005365737
+
 ---
  Makefile.pre.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb31113176 100644
+index 55c7c46..1f6500a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2115,6 +2115,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
@@ -27,7 +28,4 @@ index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb
 +	sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
  	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
  	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
- 	@  # In OpenEmbedded, always use the python version of the script, the shell
--- 
-2.25.1
-
+ 	@ # On Darwin, always use the python version of the script, the shell
diff --git a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch b/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
deleted file mode 100644
index d98f243cb1..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2406432449784243b7590009d42bd0e871253b2e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 29 Jan 2019 15:03:01 +0100
-Subject: [PATCH] Do not use the shell version of python-config that was
- introduced in 3.4
-
-Revert instead to the original python version: it has our tweaks and
-outputs directories correctly.
-
-Upstream-Status: Inappropriate [oe-specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile.pre.in | 9 +++------
- 1 file changed, 3 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index ee85f35..f0aedb7 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1640,12 +1640,9 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
- 	sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
- 	@ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
- 	LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
--	@ # On Darwin, always use the python version of the script, the shell
--	@ # version doesn't use the compiler customizations that are provided
--	@ # in python (_osx_support.py).
--	@if test `uname -s` = Darwin; then \
--		cp python-config.py python-config; \
--	fi
-+	@  # In OpenEmbedded, always use the python version of the script, the shell
-+	@  # version is broken in multiple ways, and doesn't return correct directories
-+	cp python-config.py python-config
- 
- 
- # Install the include files
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/meta/recipes-devtools/python/python3/python-config.patch
deleted file mode 100644
index 4da399e46e..0000000000
--- a/meta/recipes-devtools/python/python3/python-config.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 8632f25ac4e2c53a3c2c8a1b4fc97fc86e8aad5a Mon Sep 17 00:00:00 2001
-From: Tyler Hall <tylerwhall@gmail.com>
-Date: Sun, 4 May 2014 20:06:43 -0400
-Subject: [PATCH] python-config: Revert to using distutils.sysconfig
-
-The newer sysconfig module shares some code with distutils.sysconfig, but the same modifications as in
-
-12-distutils-prefix-is-inside-staging-area.patch makes distutils.sysconfig
-
-affect the native runtime as well as cross building. Use the old, patched
-implementation which returns paths in the staging directory and for the target,
-as appropriate.
-
-Upstream-Status: Inappropriate [Embedded Specific]
-
-Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
-
----
- Misc/python-config.in | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Misc/python-config.in b/Misc/python-config.in
-index ebd99da..0492e08 100644
---- a/Misc/python-config.in
-+++ b/Misc/python-config.in
-@@ -6,7 +6,9 @@
- import getopt
- import os
- import sys
--import sysconfig
-+import warnings
-+warnings.filterwarnings("ignore", category=DeprecationWarning)
-+from distutils import sysconfig
- 
- valid_opts = ['prefix', 'exec-prefix', 'includes', 'libs', 'cflags',
-               'ldflags', 'extension-suffix', 'help', 'abiflags', 'configdir',
-@@ -35,14 +37,14 @@ if '--help' in opt_flags:
- 
- for opt in opt_flags:
-     if opt == '--prefix':
--        print(getvar('prefix'))
-+        print(sysconfig.PREFIX)
- 
-     elif opt == '--exec-prefix':
--        print(getvar('exec_prefix'))
-+        print(sysconfig.EXEC_PREFIX)
- 
-     elif opt in ('--includes', '--cflags'):
--        flags = ['-I' + sysconfig.get_path('include'),
--                 '-I' + sysconfig.get_path('platinclude')]
-+        flags = ['-I' + sysconfig.get_python_inc(),
-+                 '-I' + sysconfig.get_python_inc(plat_specific=True)]
-         if opt == '--cflags':
-             flags.extend(getvar('CFLAGS').split())
-         print(' '.join(flags))
diff --git a/meta/recipes-devtools/python/python3_3.11.0.bb b/meta/recipes-devtools/python/python3_3.11.0.bb
index 92a1f69320..7bfe7b2713 100644
--- a/meta/recipes-devtools/python/python3_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3_3.11.0.bb
@@ -16,8 +16,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://cgi_py.patch \
            file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
-           file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
-           file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
@@ -172,6 +170,9 @@ do_install:append:class-native() {
         
         # disable the lookup in user's site-packages globally
         sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
+
+        # python3-config needs to be in /usr/bin and not in a subdir of it to work properly
+        mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
 }
 
 do_install:append() {
@@ -220,6 +221,16 @@ do_install:append:class-nativesdk () {
     create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " provide_target_config_script"
+SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script"
+
+provide_target_config_script() {
+        install -d ${SYSROOT_DESTDIR}${bindir}/
+        install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}${bindir}/
+        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}${bindir}/
+}
+
+
 SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
 SSTATE_HASHEQUIV_FILEMAP = " \
     populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \
-- 
2.30.2


