Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 474BCC4332F
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.20255.1637901394899543630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XYDoqW82;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id o4so7669480pfp.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HlsrSK1+n9wvzYytW+2UzJftn02d82bjGVeD+vKAaac=;
        b=XYDoqW82If8hWizIGxHhT86kYcmugoLyNB0W8ZFJnEmlOPrnWTLgBj+aLwjQKadQmA
         /27GY2gKs3fgsiAcoOxnIG0Od9WbO38q0G2+X+962WwoYy9X85Ml3+/4uktuKxE17+jV
         GwZTx5FOrEkrh0RumSNmE7UfjuZ8K3dSAL7h9mtUUp5UwOdwXHHfIqSFIzBKHhlLT4+5
         ylmVplGm4Y0v+Tej76PFDQ9VbJK8hlMcOUC8p5jMh2byFb7RyztU9OBT3zvMt7/dJAMu
         nzCNTxpSewh78J76PABwnZOU+vYTeZy3UYFiMnSqkGgewxb/F5D+X2JkX6a5UjHvCG0K
         iC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HlsrSK1+n9wvzYytW+2UzJftn02d82bjGVeD+vKAaac=;
        b=Lvg+6q3+M+9s8mPGc/Opn64JANclQEXwunQ7Lc76dZFFZLyjIaTxTFV0YXFGU/v0sM
         AjMmnLcrukKcYmXPWqKwgvKVOJObPfvOw7WuAAgCL84Lem83W8yoMPpoJaQXwDLP09yx
         79hw24ChQ69G3wXqDa+jAfrPbVAKci4iQYbHlrUAJqm4IYmS95kicnNhhiPSnsKd6vuT
         0pdShac4EYFCnZEZe5kxt99TMzL3G6XwY9906JiqeRl1zrV7lHvmPsILo0a/PL4vot2v
         /ItNcDvIEbnGR/7mxwF4Zp9sPSk7OBeMdt+rYMIdTjNaNWqGTbT0XoQwphgI+IS8UYG3
         A2Lw==
X-Gm-Message-State: AOAM530yOU58V74bHzM5k/5TzjAeMD6HbkrZJNrCd8RGQzNGiPpdH2/y
	/mB3UpsCpkthdU5//YVJEsvVo6W3qmY=
X-Google-Smtp-Source: 
 ABdhPJxvABl7KrIcAyZClgr+PtaIGyeLFI751nATG9JZdN+RLM5ma77skpIrxzDy8Thv2MIJjOwRfg==
X-Received: by 2002:a62:1e81:0:b0:4a3:7a97:d868 with SMTP id
 e123-20020a621e81000000b004a37a97d868mr18948496pfe.52.1637901393984;
        Thu, 25 Nov 2021 20:36:33 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:33 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 23/26] python3: refactor python-config patch
Date: Thu, 25 Nov 2021 20:36:02 -0800
Message-Id: 
 <7967250b8b7c22b80fa8cbe84a776ff28ea26b1a.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158819

Drop legacy python-config.patch

distutils is deprecated in Python 3.10 and will be removed in Python
3.12 (~October 2023).

Rather than wholesale import the distutils.sysconfig module, refactor
to replicate legacy distutils usage that we need.

This merges changes to get_python_inc from 12-distutils-prefix-is-inside-staging-area.patch

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...n-implement-legacy-disutils-behavior.patch | 68 +++++++++++++++++++
 .../python/python3/python-config.patch        | 55 ---------------
 .../recipes-devtools/python/python3_3.10.0.bb |  2 +-
 3 files changed, 69 insertions(+), 56 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-python-config.in-implement-legacy-disutils-behavior.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python-config.patch

diff --git a/meta/recipes-devtools/python/python3/0001-python-config.in-implement-legacy-disutils-behavior.patch b/meta/recipes-devtools/python/python3/0001-python-config.in-implement-legacy-disutils-behavior.patch
new file mode 100644
index 00000000000..71fad65def0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-python-config.in-implement-legacy-disutils-behavior.patch
@@ -0,0 +1,68 @@
+From 9bc5f12a31f1c90913bfa90f71ec12cea95de040 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@intel.com>
+Date: Thu, 25 Nov 2021 17:48:23 -0800
+Subject: [PATCH] python-config.in: implement legacy disutils behavior
+
+The sysconfig behavior does not provide the correct paths for our usage,
+but rather than continue to use the deprecated distutils.sysconfig
+behavior, refactor the code paths we need to use supported standard
+library functionality.
+
+[YOCTO #14610]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
+---
+ Misc/python-config.in | 31 +++++++++++++++++++++++++++----
+ 1 file changed, 27 insertions(+), 4 deletions(-)
+
+diff --git a/Misc/python-config.in b/Misc/python-config.in
+index ebd99daa0c..5959d74453 100644
+--- a/Misc/python-config.in
++++ b/Misc/python-config.in
+@@ -35,14 +35,37 @@ if '--help' in opt_flags:
+ 
+ for opt in opt_flags:
+     if opt == '--prefix':
+-        print(getvar('prefix'))
++	# borrow the legacy behavior of distutils.sysconfig.PREFIX
++        print(os.path.normpath(sys.prefix))
+ 
+     elif opt == '--exec-prefix':
+-        print(getvar('exec_prefix'))
++        # borrow the legacy behavior of distutils.sysconfig.EXEC_PREFIX
++        print(os.path.normpath(sys.exec_prefix))
+ 
+     elif opt in ('--includes', '--cflags'):
+-        flags = ['-I' + sysconfig.get_path('include'),
+-                 '-I' + sysconfig.get_path('platinclude')]
++        # borrowing the logic from legacy/deprecated distutils.sysconfig.get_python_inc
++
++        # Calculate the build qualifier flags if they are defined.  Adding the flags
++        # to the include and lib directories only makes sense for an installation, not
++        # an in-source build.
++        build_flags = ''
++        try:
++            if not sysconfig._PYTHON_BUILD:
++                build_flags = sys.abiflags
++        except AttributeError:
++            # It's not a configure-based build, so the sys module doesn't have
++            # this attribute, which is fine.
++            pass
++
++        incdir = os.path.join(sysconfig.get_config_var('srcdir'), 'Include')
++        if prefix is None and os.environ.get('STAGING_LIBDIR', "");
++            prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
++        elif prefix is None:
++            prefix = sysconfig._BASE_EXEC_PREFIX or sysconfig._BASE_PREFIX
++        python_dir = 'python' + sysconfig.get_python_version() + build_flags
++        #platincdir = sysconfig._sys_home or sysconfig._PROJECT_BASE
++        flags = ['-I' + os.path.normpath(incdir),
++                 '-I' + os.path.join(prefix, "include", python_dir)]
+         if opt == '--cflags':
+             flags.extend(getvar('CFLAGS').split())
+         print(' '.join(flags))
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/python/python3/python-config.patch b/meta/recipes-devtools/python/python3/python-config.patch
deleted file mode 100644
index c53f646af35..00000000000
--- a/meta/recipes-devtools/python/python3/python-config.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 57d073c12e7bede29919117b0141df14015eb27f Mon Sep 17 00:00:00 2001
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
- Misc/python-config.in | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Misc/python-config.in b/Misc/python-config.in
-index ebd99da..13e57ae 100644
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
-@@ -35,14 +35,14 @@ if '--help' in opt_flags:
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
diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index e3300b6495b..6b965af0509 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
            file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
-           file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
@@ -33,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
+           file://0001-python-config.in-implement-legacy-disutils-behavior.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.30.2


