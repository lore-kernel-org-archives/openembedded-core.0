Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEEAC54739
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:09 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.71666.1724736243507251727
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2QR6ksF;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8692bbec79so644305266b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736242; x=1725341042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T70P2+pF/4FyC10yjMTIJ4COzcd/q7/33AKPjoxWB60=;
        b=S2QR6ksFxNlKNWc2PWalmcG9oLc0cP3jwDe5wEbqzXNW3m8FkBZQljPn1Rb3M9HFGa
         YIxqRE5mcZGGE9aJT/J+ftzgrK/39M0JnGIMxjClA2d6u0b1J8oHKCabshQF9EllHLyx
         /lBUXyuvPlR6+/x5JUJNL5UT9b5uW4VxvSVc7pI1/Rl/hmbcfue99xM2U2pnLyX2MGX9
         P+Ky0SlfQrxyWHejqBfrf1cd0m8xsLMMvEUBpl2VPHHarCKKQr6ydGAgfljOU3GT1svr
         NxqxuYRn8l89haqC3fJi5CS/d9t6ZM+kIzrawaIMR6/fa+ghtY6AcG2oDQ/ZSd7d+d3R
         oW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736242; x=1725341042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T70P2+pF/4FyC10yjMTIJ4COzcd/q7/33AKPjoxWB60=;
        b=pVd1wDAeLDFwI6SRQ0QcqmReJo5oimWFSpJEKsY9okoZA6ZRYnM/SrgGLOQt0rOeuF
         SGXlH+1Bm33Fz40vphwCoWPckLHXZ8y/0XLnqLIKcGx+8N1UX5gPscF/BafjTAYdqWeS
         joSx6ARzQzF/zPs/Cg2qZ7mGjcHCG/ECwWe0EM3G4+Br/s82d3IZ4yVLQPVxVTLmuxjZ
         cy/w2MV3Ch27vfs62i08ktUCFTEJVvSKUP4DkA1DMdgMgkiSebv8LbmjtqJirEiuqwC7
         qHImsVeW8SCeJG07ASGqV1Q4TQNS8sjvDmxV1+TGbsxBU5KsA4L6Fjr9pKlY3CUiQKob
         BsXQ==
X-Gm-Message-State: AOJu0Yw9QYyFjNIXcx3xBVFf+KNp9XFZ0cw95sqsEVgeZeQiyG1XKihS
	ylv6X45O+9y4s2IVguA/ByNWFrvsndvYGBgIBtQUdHmzaHf1HhjWAza0qA==
X-Google-Smtp-Source: AGHT+IHrW+wdO8g6Wqj3KemskRpRrz457gCd0G1xY98bzOo0j2LKmt+DcrQGzbyrhQaqu2h0Le1Utg==
X-Received: by 2002:a17:906:6a0e:b0:a7a:b73f:7582 with SMTP id a640c23a62f3a-a86e3989129mr111755166b.2.1724736240922;
        Mon, 26 Aug 2024 22:24:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/34] automake: update 1.16.5 -> 1.17
Date: Tue, 27 Aug 2024 07:23:26 +0200
Message-Id: <20240827052354.1319810-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203783

From: Alexander Kanavin <alex@linutronix.de>

Drop 0001-Drop-ar-u-argument.patch
(upstream resolved the issue).

Replace forced perl settings with an after-the-fact sed hack
(upstream added more checks to ensure there are no 'tricks' and
I don't want to fight with that).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../automake/0001-Drop-ar-u-argument.patch    | 35 --------
 ...ke-Add-default-libtool_tag-to-cppasm.patch | 12 +--
 ...ate-for-python.m4-to-respect-libdir.patch} | 34 +++++---
 ...3-build-fix-race-in-parallel-builds.patch} | 12 +--
 ...0004-Add-a-new-distro-feature-ptest.patch} | 12 +--
 ...op_builddir-path-in-Makefile-to-acc.patch} | 16 ++--
 ...delays-in-configure-scripts-using-au.patch | 77 +++++++++++++++++
 .../automake/automake/performance.patch       | 82 -------------------
 .../{automake_1.16.5.bb => automake_1.17.bb}  | 20 ++---
 9 files changed, 134 insertions(+), 166 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
 rename meta/recipes-devtools/automake/automake/{0001-automake-Update-for-python.m4-to-respect-libdir.patch => 0002-automake-Update-for-python.m4-to-respect-libdir.patch} (70%)
 rename meta/recipes-devtools/automake/automake/{0001-build-fix-race-in-parallel-builds.patch => 0003-build-fix-race-in-parallel-builds.patch} (89%)
 rename meta/recipes-devtools/automake/automake/{buildtest.patch => 0004-Add-a-new-distro-feature-ptest.patch} (84%)
 rename meta/recipes-devtools/automake/automake/{new_rt_path_for_test-driver.patch => 0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch} (81%)
 create mode 100644 meta/recipes-devtools/automake/automake/0006-automake-Remove-delays-in-configure-scripts-using-au.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/performance.patch
 rename meta/recipes-devtools/automake/{automake_1.16.5.bb => automake_1.17.bb} (56%)

diff --git a/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch b/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
deleted file mode 100644
index f72788c3a6f..00000000000
--- a/meta/recipes-devtools/automake/automake/0001-Drop-ar-u-argument.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From bed646918bc67e9e2151ccbda03aae34717821fe Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei.gherzan@huawei.com>
-Date: Wed, 20 Apr 2022 14:57:14 +0200
-Subject: [PATCH] Drop ar 'u' argument
-
-binutils/ar is configured in deterministic mode by default making the
-'u' argument irrelevant while leading to warning massages similar to:
-
-| ar: `u' modifier ignored since `D' is the default (see `U')
-
-We also add 'D' flag explicitely to not rely in the default configuration
-for reproducible archives.
-
-Upstream-Status: Inappropriate [OE specific]
-Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
----
- bin/automake.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bin/automake.in b/bin/automake.in
-index 92bcebe..0f2b84b 100644
---- a/bin/automake.in
-+++ b/bin/automake.in
-@@ -2678,7 +2678,7 @@ sub handle_libraries ()
-     }
- 
-   define_variable ('AR', 'ar', INTERNAL);
--  define_variable ('ARFLAGS', 'cru', INTERNAL);
-+  define_variable ('ARFLAGS', 'crD', INTERNAL);
-   define_verbose_tagvar ('AR');
- 
-   foreach my $pair (@liblist)
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch b/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch
index deb1d03503d..9608b5db444 100644
--- a/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch
+++ b/meta/recipes-devtools/automake/automake/0001-automake-Add-default-libtool_tag-to-cppasm.patch
@@ -1,23 +1,22 @@
-From b3c6e1971786cd93a2e3017c92bfbfe96baaf2f7 Mon Sep 17 00:00:00 2001
+From 2884ad2aa8b51cbba25a376935151a242f488e30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 26 Jul 2017 11:19:56 -0700
-Subject: [PATCH] automake: Add default libtool_tag to cppasm.
+Subject: [PATCH 1/6] automake: Add default libtool_tag to cppasm.
 
     * bin/automake.in (register_language): Define default libtool tag to be CC
     since CPPASCOMPILE is using CC to call assembler
 
 Upstream-Status: Submitted
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  bin/automake.in | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/bin/automake.in b/bin/automake.in
-index 3a66965..08ba09a 100644
+index a17f452..18626de 100644
 --- a/bin/automake.in
 +++ b/bin/automake.in
-@@ -898,6 +898,7 @@ register_language ('name' => 'cppasm',
+@@ -897,6 +897,7 @@ register_language ('name' => 'cppasm',
                     'libtool_tag' => 'CC',
  		   'compile_flag' => '-c',
  		   'output_flag' => '-o',
@@ -25,3 +24,6 @@ index 3a66965..08ba09a 100644
  		   'extensions' => ['.S', '.sx']);
  
  # Fortran 77
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch b/meta/recipes-devtools/automake/automake/0002-automake-Update-for-python.m4-to-respect-libdir.patch
similarity index 70%
rename from meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
rename to meta/recipes-devtools/automake/automake/0002-automake-Update-for-python.m4-to-respect-libdir.patch
index d28045618e1..308a7d075d4 100644
--- a/meta/recipes-devtools/automake/automake/0001-automake-Update-for-python.m4-to-respect-libdir.patch
+++ b/meta/recipes-devtools/automake/automake/0002-automake-Update-for-python.m4-to-respect-libdir.patch
@@ -1,7 +1,7 @@
-From dff74c5b19935cc11b30116a7ae9c8affdff246b Mon Sep 17 00:00:00 2001
+From 05194070775b597829abfa0d9a5f96d19cc064b8 Mon Sep 17 00:00:00 2001
 From: Kumar Gala <galak@kernel.crashing.org>
 Date: Thu, 11 Aug 2011 01:26:33 -0500
-Subject: [PATCH] automake: Update for python.m4 to respect libdir
+Subject: [PATCH 2/6] automake: Update for python.m4 to respect libdir
 
 Upstream-Status: Inappropriate [embedded specific]
 
@@ -12,14 +12,14 @@ Updated for automake-1.12.6
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- m4/python.m4 | 24 ++++++------------------
- 1 file changed, 6 insertions(+), 18 deletions(-)
+ m4/python.m4 | 32 ++++++--------------------------
+ 1 file changed, 6 insertions(+), 26 deletions(-)
 
 diff --git a/m4/python.m4 b/m4/python.m4
-index 4e7de9427..40fc5b396 100644
+index 0b1db26..07db0eb 100644
 --- a/m4/python.m4
 +++ b/m4/python.m4
-@@ -96,6 +96,8 @@ AC_DEFUN([AM_PATH_PYTHON],
+@@ -99,6 +99,8 @@ AC_DEFUN([AM_PATH_PYTHON],
      [am_cv_python_version=`$PYTHON -c "import sys; print ('%u.%u' % sys.version_info[[:2]])"`])
    AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
  
@@ -28,14 +28,18 @@ index 4e7de9427..40fc5b396 100644
    dnl At times, e.g., when building shared libraries, you may want
    dnl to know which OS platform Python thinks this is.
    dnl
-@@ -251,14 +253,7 @@ except ImportError:
+@@ -268,18 +270,7 @@ except ImportError:
     else
       am_py_prefix=$am_cv_python_prefix
     fi
 -   am_cv_python_pythondir=`$PYTHON -c "
 -$am_python_setup_sysconfig
 -if can_use_sysconfig:
--  sitedir = sysconfig.get_path('purelib', vars={'base':'$am_py_prefix'})
+-  try:
+-    $am_python_setup_scheme
+-    sitedir = sysconfig.get_path('purelib', scheme, vars={'base':'$am_py_prefix'})
+-  except:
+-    sitedir = sysconfig.get_path('purelib', vars={'base':'$am_py_prefix'})
 -else:
 -  from distutils import sysconfig
 -  sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
@@ -44,7 +48,7 @@ index 4e7de9427..40fc5b396 100644
     #
     case $am_cv_python_pythondir in
     $am_py_prefix*)
-@@ -268,7 +263,7 @@ sys.stdout.write(sitedir)"`
+@@ -289,7 +280,7 @@ sys.stdout.write(sitedir)"`
     *)
       case $am_py_prefix in
         /usr|/System*) ;;
@@ -53,14 +57,18 @@ index 4e7de9427..40fc5b396 100644
            ;;
       esac
       ;;
-@@ -293,14 +288,7 @@ sys.stdout.write(sitedir)"`
+@@ -315,18 +306,7 @@ sys.stdout.write(sitedir)"`
     else
       am_py_exec_prefix=$am_cv_python_exec_prefix
     fi
 -   am_cv_python_pyexecdir=`$PYTHON -c "
 -$am_python_setup_sysconfig
 -if can_use_sysconfig:
--  sitedir = sysconfig.get_path('platlib', vars={'platbase':'$am_py_exec_prefix'})
+-  try:
+-    $am_python_setup_scheme
+-    sitedir = sysconfig.get_path('platlib', scheme, vars={'platbase':'$am_py_exec_prefix'})
+-  except:
+-    sitedir = sysconfig.get_path('platlib', vars={'platbase':'$am_py_exec_prefix'})
 -else:
 -  from distutils import sysconfig
 -  sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_exec_prefix')
@@ -69,7 +77,7 @@ index 4e7de9427..40fc5b396 100644
     #
     case $am_cv_python_pyexecdir in
     $am_py_exec_prefix*)
-@@ -310,7 +298,7 @@ sys.stdout.write(sitedir)"`
+@@ -336,7 +316,7 @@ sys.stdout.write(sitedir)"`
     *)
       case $am_py_exec_prefix in
         /usr|/System*) ;;
@@ -79,5 +87,5 @@ index 4e7de9427..40fc5b396 100644
       esac
       ;;
 -- 
-2.20.1
+2.39.2
 
diff --git a/meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch b/meta/recipes-devtools/automake/automake/0003-build-fix-race-in-parallel-builds.patch
similarity index 89%
rename from meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch
rename to meta/recipes-devtools/automake/automake/0003-build-fix-race-in-parallel-builds.patch
index 591fce1bf16..a4039c3bbab 100644
--- a/meta/recipes-devtools/automake/automake/0001-build-fix-race-in-parallel-builds.patch
+++ b/meta/recipes-devtools/automake/automake/0003-build-fix-race-in-parallel-builds.patch
@@ -1,7 +1,7 @@
-From 592eb55b248a765abfc796fccb68baa3d53745ac Mon Sep 17 00:00:00 2001
+From b952d7064c9cee23857fbc7cb9d761542b98d59a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 26 Jul 2018 00:58:12 -0700
-Subject: [PATCH] build: fix race in parallel builds
+Subject: [PATCH 3/6] build: fix race in parallel builds
 
 The automake-$(APIVERSION) is a hardlink of automake, if it is
 created later than update_mans executing, there is a failure
@@ -31,10 +31,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index c3e934c..7cddb8d 100644
+index a919544..c0f8c0d 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -691,8 +691,8 @@ bin_SCRIPTS = bin/automake bin/aclocal
+@@ -723,8 +723,8 @@ bin_SCRIPTS = bin/automake bin/aclocal
  # Used by maintainer checks and such.
  automake_in = $(srcdir)/bin/automake.in
  aclocal_in = $(srcdir)/bin/aclocal.in
@@ -46,7 +46,7 @@ index c3e934c..7cddb8d 100644
  info_TEXINFOS = doc/automake.texi doc/automake-history.texi
  doc_automake_TEXINFOS = doc/fdl.texi
 diff --git a/bin/local.mk b/bin/local.mk
-index 97b38db..058ca99 100644
+index 4232448..8f043b0 100644
 --- a/bin/local.mk
 +++ b/bin/local.mk
 @@ -31,8 +31,8 @@ CLEANFILES += \
@@ -61,5 +61,5 @@ index 97b38db..058ca99 100644
  AUTOMAKESOURCES = $(automake_in) $(aclocal_in)
  TAGS_FILES += $(AUTOMAKESOURCES)
 -- 
-2.7.4
+2.39.2
 
diff --git a/meta/recipes-devtools/automake/automake/buildtest.patch b/meta/recipes-devtools/automake/automake/0004-Add-a-new-distro-feature-ptest.patch
similarity index 84%
rename from meta/recipes-devtools/automake/automake/buildtest.patch
rename to meta/recipes-devtools/automake/automake/0004-Add-a-new-distro-feature-ptest.patch
index c43a4ac8f37..91c7f1c2ccb 100644
--- a/meta/recipes-devtools/automake/automake/buildtest.patch
+++ b/meta/recipes-devtools/automake/automake/0004-Add-a-new-distro-feature-ptest.patch
@@ -1,7 +1,7 @@
-From a860b28069785aa5bf2fa9b671287de9af5004ff Mon Sep 17 00:00:00 2001
+From 839dca38cf24e70c7f0e20015d55aa8e543dd403 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
 Date: Wed, 19 Dec 2012 17:18:27 +0100
-Subject: [PATCH] Add a new distro feature "ptest".
+Subject: [PATCH 4/6] Add a new distro feature "ptest".
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -11,13 +11,12 @@ be run separately.
 
 Signed-off-by: Björn Stenberg <bjst@enea.com>
 Upstream-Status: Pending
-
 ---
  lib/am/check.am | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)
 
 diff --git a/lib/am/check.am b/lib/am/check.am
-index e0db651..de137fa 100644
+index e51a771..070e2da 100644
 --- a/lib/am/check.am
 +++ b/lib/am/check.am
 @@ -41,7 +41,7 @@ am__tty_colors = { \
@@ -29,7 +28,7 @@ index e0db651..de137fa 100644
  
  if !%?SERIAL_TESTS%
  
-@@ -466,7 +466,14 @@ else %?SERIAL_TESTS%
+@@ -520,7 +520,14 @@ else %?SERIAL_TESTS%
  
  ## Obsolescent serial testsuite driver.
  
@@ -45,3 +44,6 @@ index e0db651..de137fa 100644
  	@failed=0; all=0; xfail=0; xpass=0; skip=0; \
  	srcdir=$(srcdir); export srcdir; \
  ## Make sure Solaris VPATH-expands all members of this list, even
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch b/meta/recipes-devtools/automake/automake/0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch
similarity index 81%
rename from meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
rename to meta/recipes-devtools/automake/automake/0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch
index f92ec6b5487..a5bad068a45 100644
--- a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
+++ b/meta/recipes-devtools/automake/automake/0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch
@@ -1,22 +1,21 @@
-From f78dfa39139d528c94d72f27994f337f2fd3b6bd Mon Sep 17 00:00:00 2001
+From 4f576c10613b43cbbfcdf5a451d893faecd6fea9 Mon Sep 17 00:00:00 2001
 From: Adrian Calianu <adrian.calianu@enea.com>
 Date: Thu, 25 Feb 2016 16:08:04 +0100
-Subject: [PATCH] Set relative to top_builddir path in Makefile to access
+Subject: [PATCH 5/6] Set relative to top_builddir path in Makefile to access
  test-driver
 
 Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
 Upstream-Status: Inappropriate [specific to oe-core target ptest installation]
 Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=19042
-
 ---
  bin/automake.in | 9 ++++++++-
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/bin/automake.in b/bin/automake.in
-index a52a489..8377d20 100644
+index 18626de..3aa8706 100644
 --- a/bin/automake.in
 +++ b/bin/automake.in
-@@ -324,6 +324,9 @@ my $config_aux_dir_set_in_configure_ac = 0;
+@@ -325,6 +325,9 @@ my $config_aux_dir_set_in_configure_ac = 0;
  # $AM_CONFIG_AUX_DIR is prefixed with $(top_srcdir), so it can be used
  # in Makefiles.
  my $am_config_aux_dir = '';
@@ -26,7 +25,7 @@ index a52a489..8377d20 100644
  
  # Directory to search for AC_LIBSOURCE files, as set by AC_CONFIG_LIBOBJ_DIR
  # in configure.ac.
-@@ -4854,7 +4857,7 @@ sub handle_per_suffix_test
+@@ -4917,7 +4920,7 @@ sub handle_per_suffix_test
      {
        require_conf_file ("parallel-tests", FOREIGN, 'test-driver');
        define_variable ("${pfx}LOG_DRIVER",
@@ -35,7 +34,7 @@ index a52a489..8377d20 100644
                         INTERNAL);
      }
    my $driver = '$(' . $pfx . 'LOG_DRIVER)';
-@@ -7440,6 +7443,10 @@ sub locate_aux_dir ()
+@@ -7554,6 +7557,10 @@ sub locate_aux_dir ()
    $am_config_aux_dir =
      '$(top_srcdir)' . ($config_aux_dir eq '.' ? "" : "/$config_aux_dir");
    $am_config_aux_dir =~ s,/*$,,;
@@ -46,3 +45,6 @@ index a52a489..8377d20 100644
  }
  
  
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/automake/automake/0006-automake-Remove-delays-in-configure-scripts-using-au.patch b/meta/recipes-devtools/automake/automake/0006-automake-Remove-delays-in-configure-scripts-using-au.patch
new file mode 100644
index 00000000000..e5e39169b6f
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/0006-automake-Remove-delays-in-configure-scripts-using-au.patch
@@ -0,0 +1,77 @@
+From b43c0ccd1d98a43c0ddcade40fa288e98d381420 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 7 Dec 2015 18:28:05 +0000
+Subject: [PATCH 6/6] automake: Remove delays in configure scripts using
+ automake
+
+By default automake puts "sleep 1" into the start of configure scripts
+which adds pointless delays to them. Rather than do this, lets just assume
+our systems are sane.
+
+RP
+2015/12/7
+Upstream-Status: Inappropriate
+---
+ m4/sanity.m4 | 48 +-----------------------------------------------
+ 1 file changed, 1 insertion(+), 47 deletions(-)
+
+diff --git a/m4/sanity.m4 b/m4/sanity.m4
+index c7f32da..f25625a 100644
+--- a/m4/sanity.m4
++++ b/m4/sanity.m4
+@@ -176,51 +176,5 @@ case $srcdir in
+     AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
+ esac
+ 
+-# Do 'set' in a subshell so we don't clobber the current shell's
+-# arguments.  Must try -L first in case configure is actually a
+-# symlink; some systems play weird games with the mod time of symlinks
+-# (eg FreeBSD returns the mod time of the symlink's containing
+-# directory).
+-am_build_env_is_sane=no
+-am_has_slept=no
+-rm -f conftest.file
+-for am_try in 1 2; do
+-  echo "timestamp, slept: $am_has_slept" > conftest.file
+-  if (
+-    set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
+-    if test "$[]*" = "X"; then
+-      # -L didn't work.
+-      set X `ls -t "$srcdir/configure" conftest.file`
+-    fi
+-    test "$[]2" = conftest.file
+-  ); then
+-    am_build_env_is_sane=yes
+-    break
+-  fi
+-  # Just in case.
+-  sleep "$am_cv_filesystem_timestamp_resolution"
+-  am_has_slept=yes
+-done
+-
+-AC_MSG_RESULT([$am_build_env_is_sane])
+-if test "$am_build_env_is_sane" = no; then
+-  AC_MSG_ERROR([newly created file is older than distributed files!
+-Check your system clock])
+-fi
+-
+-# If we didn't sleep, we still need to ensure time stamps of config.status and
+-# generated files are strictly newer.
+-am_sleep_pid=
+-AS_IF([test -e conftest.file || grep 'slept: no' conftest.file >/dev/null 2>&1],, [dnl
+-  ( sleep "$am_cv_filesystem_timestamp_resolution" ) &
+-  am_sleep_pid=$!
+-])
+-AC_CONFIG_COMMANDS_PRE(
+-  [AC_MSG_CHECKING([that generated files are newer than configure])
+-   if test -n "$am_sleep_pid"; then
+-     # Hide warnings about reused PIDs.
+-     wait $am_sleep_pid 2>/dev/null
+-   fi
+-   AC_MSG_RESULT([done])])
+-rm -f conftest.file
++AC_MSG_RESULT([yes])
+ ])
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/automake/automake/performance.patch b/meta/recipes-devtools/automake/automake/performance.patch
deleted file mode 100644
index a8ba6592fa2..00000000000
--- a/meta/recipes-devtools/automake/automake/performance.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From cd47c328cb53546891bb3dc7c9b2c54ed01cc6d1 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Mon, 7 Dec 2015 18:28:05 +0000
-Subject: [PATCH] automake: Remove delays in configure scripts using automake
-
-By default automake puts "sleep 1" into the start of configure scripts
-which adds pointless delays to them. Rather than do this, lets just assume
-our systems are sane.
-
-RP
-2015/12/7
-Upstream-Status: Inappropriate
-
----
- m4/sanity.m4 | 55 -------------------------------------------------------
- 1 file changed, 55 deletions(-)
-
-diff --git a/m4/sanity.m4 b/m4/sanity.m4
-index eaac218..bfdfe88 100644
---- a/m4/sanity.m4
-+++ b/m4/sanity.m4
-@@ -23,60 +23,5 @@ case $srcdir in
-     AC_MSG_ERROR([unsafe srcdir value: '$srcdir']);;
- esac
- 
--# Do 'set' in a subshell so we don't clobber the current shell's
--# arguments.  Must try -L first in case configure is actually a
--# symlink; some systems play weird games with the mod time of symlinks
--# (eg FreeBSD returns the mod time of the symlink's containing
--# directory).
--if (
--   am_has_slept=no
--   for am_try in 1 2; do
--     echo "timestamp, slept: $am_has_slept" > conftest.file
--     set X `ls -Lt "$srcdir/configure" conftest.file 2> /dev/null`
--     if test "$[*]" = "X"; then
--	# -L didn't work.
--	set X `ls -t "$srcdir/configure" conftest.file`
--     fi
--     if test "$[*]" != "X $srcdir/configure conftest.file" \
--	&& test "$[*]" != "X conftest.file $srcdir/configure"; then
--
--	# If neither matched, then we have a broken ls.  This can happen
--	# if, for instance, CONFIG_SHELL is bash and it inherits a
--	# broken ls alias from the environment.  This has actually
--	# happened.  Such a system could not be considered "sane".
--	AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
--  alias in your environment])
--     fi
--     if test "$[2]" = conftest.file || test $am_try -eq 2; then
--       break
--     fi
--     # Just in case.
--     sleep 1
--     am_has_slept=yes
--   done
--   test "$[2]" = conftest.file
--   )
--then
--   # Ok.
--   :
--else
--   AC_MSG_ERROR([newly created file is older than distributed files!
--Check your system clock])
--fi
- AC_MSG_RESULT([yes])
--# If we didn't sleep, we still need to ensure time stamps of config.status and
--# generated files are strictly newer.
--am_sleep_pid=
--if grep 'slept: no' conftest.file >/dev/null 2>&1; then
--  ( sleep 1 ) &
--  am_sleep_pid=$!
--fi
--AC_CONFIG_COMMANDS_PRE(
--  [AC_MSG_CHECKING([that generated files are newer than configure])
--   if test -n "$am_sleep_pid"; then
--     # Hide warnings about reused PIDs.
--     wait $am_sleep_pid 2>/dev/null
--   fi
--   AC_MSG_RESULT([done])])
--rm -f conftest.file
- ])
diff --git a/meta/recipes-devtools/automake/automake_1.16.5.bb b/meta/recipes-devtools/automake/automake_1.17.bb
similarity index 56%
rename from meta/recipes-devtools/automake/automake_1.16.5.bb
rename to meta/recipes-devtools/automake/automake_1.17.bb
index 469fcd69f73..27d8dfe1827 100644
--- a/meta/recipes-devtools/automake/automake_1.16.5.bb
+++ b/meta/recipes-devtools/automake/automake_1.17.bb
@@ -19,25 +19,19 @@ RDEPENDS:${PN} += "\
 RDEPENDS:${PN}:class-native = "autoconf-native hostperl-runtime-native"
 
 SRC_URI += "\
-           file://0001-automake-Update-for-python.m4-to-respect-libdir.patch \
-           file://buildtest.patch \
-           file://performance.patch \
-           file://new_rt_path_for_test-driver.patch \
            file://0001-automake-Add-default-libtool_tag-to-cppasm.patch \
-           file://0001-build-fix-race-in-parallel-builds.patch \
-           file://0001-Drop-ar-u-argument.patch \
+           file://0002-automake-Update-for-python.m4-to-respect-libdir.patch \
+           file://0003-build-fix-race-in-parallel-builds.patch \
+           file://0004-Add-a-new-distro-feature-ptest.patch \
+           file://0005-Set-relative-to-top_builddir-path-in-Makefile-to-acc.patch \
+           file://0006-automake-Remove-delays-in-configure-scripts-using-au.patch \
            "
 
-SRC_URI[sha256sum] = "07bd24ad08a64bc17250ce09ec56e921d6343903943e99ccf63bbf0705e34605"
-
-PERL = "${USRBINPATH}/perl"
-PERL:class-native = "${USRBINPATH}/env perl"
-PERL:class-nativesdk = "${USRBINPATH}/env perl"
-
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
+SRC_URI[sha256sum] = "397767d4db3018dd4440825b60c64258b636eaf6bf99ac8b0897f06c89310acd"
 
 do_install:append () {
     install -d ${D}${datadir}
+    sed -i -e 's@^#!.*perl$@#!/usr/bin/env perl@' ${D}/${bindir}/*
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


