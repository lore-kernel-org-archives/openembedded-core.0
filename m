Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC150C55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15085.1785846224747659707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TG4CUq6o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49553515a8bso48083985e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846223; x=1786451023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PtO5aCu1jEmh3spTY9D4q7ioUh6zIByTtLEsIlvFbDU=;
        b=TG4CUq6of2zWUubowCaVPSbQbhqrWwi/a+rdk7k/8KGOffrOpaOhhGhWnb8/e31Lhz
         SyVBi1DkQcLqrm0YpK3inz5nLKw0xuuZuafVnld1PGCtn5mKqjO25MQIWdaj07pAE63s
         P8TfqPKt8vSdaNzT402IZa1QIzmFYwfEoxaSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846223; x=1786451023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PtO5aCu1jEmh3spTY9D4q7ioUh6zIByTtLEsIlvFbDU=;
        b=rI8350eQc/1YojwuufjzTO5nzFQIBn/8eD4epwfKaJOSwoL2WkNazcX6cWPoe52xjj
         RHLJAeWfF8ZAxPJpnBL7Jth7qde548HH12hKy5lC7dsfdyVONhiTOGlaTeOgHTafkXnY
         6hmvFqkMOXCz2Qnj2tyWj4+KRVhLxIqUkAjhUNz+dDoLtdccKL7YMxujDoinoLN442hp
         KRcDdGjRBOhkdPLJqLAd5fUWAgScS8uSvJe3x4w9gVACKK1b1z1pmLijcz4Cawa18tj7
         YtPVGuZiBiiVHzf0vWC9udNrDxyi4Y8zAQ8zEGgBjgpZW3samYnpxYDJt1LQc4L8O0sd
         EwqQ==
X-Gm-Message-State: AOJu0YxhC7aQL7QWpicUCi+wC1L481dexxOU70EL+RYFZSgAy0LCHfOB
	ScR85zu+FKCMkfRzIYZMLeLjqG1EV8k4lraaDIJsQQzxrGzj5FpWkn8cf5Kz81IrWNUWNL0XC2m
	cGiSFKOI=
X-Gm-Gg: AR+sD12s1X5LJvY0rFO/s0xTu5KoQnbnn7/0hG2NJ3sGceIeu7OtKNgCi2f2+QxxBpn
	CkUpenfSEhGvje8HXuyphVwNGdOsX5YJ9O/mfc75HVfmgA4ZS/s7tRoSvR3XwcAJSb0DY0nBA3f
	xo3dbyD+5BqTFy+zdrhrGh336tbi3o8/i807+5f8EyVMErAG6AnnF+Awyuy4HbfddRJtXihysoI
	XBkFcbgSqtFsO7ry2IQN1847aYm2qqhv/Zhf34l5Xs46E8Hiec3Hrelo6WUxTEV+8xuxh83sjRd
	9uNGfZuhIa2a448zJMrXnQgwcleGVABTK3I4PQBn9jyWnnJN1Xl9rfXuNz0ooV1eAuuXBNJ79Zy
	Suvxdu3B17PJnhM8+CvUxXnr0YDxzqeTMqFmyR407JBtf7+qMXFDUJnGZvN5iFpXv2MljLZT24O
	u1EhHn400VjpPWJOt6YhyeE5beVm4m/1ZV1v9XUH09cApjEZOowVlxMYlyv1+PRCaX4A7bYgiTv
	fsRU8naK3E+RMH8JegBpyLlKoCtOg==
X-Received: by 2002:a05:600c:4f87:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4980c66c7d9mr295393605e9.3.1785846222859;
        Tue, 04 Aug 2026 05:23:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
Date: Tue,  4 Aug 2026 13:23:31 +0100
Message-ID: <20260804122335.3094065-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242743

Drop one patch applied upstream, refresh another.
Switch to xz compressed source tarball.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libtool-2.5.4.inc => libtool-2.6.2.inc}  |  5 +--
 ...-cross_2.5.4.bb => libtool-cross_2.6.2.bb} |  0
 ...ative_2.5.4.bb => libtool-native_2.6.2.bb} |  0
 ...3-libtool-remove-help2man-dependency.patch | 17 ++++----
 ...r-static-libs-for-internal-compiler-.patch | 39 -------------------
 .../{libtool_2.5.4.bb => libtool_2.6.2.bb}    |  0
 ...ol_2.5.4.bb => nativesdk-libtool_2.6.2.bb} |  0
 7 files changed, 10 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc => libtool-2.6.2.inc} (85%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.bb => libtool-cross_2.6.2.bb} (100%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.bb => libtool-native_2.6.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
 rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb => libtool_2.6.2.bb} (100%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.4.bb => nativesdk-libtool_2.6.2.bb} (100%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recipes-devtools/libtool/libtool-2.6.2.inc
similarity index 85%
rename from meta/recipes-devtools/libtool/libtool-2.5.4.inc
rename to meta/recipes-devtools/libtool/libtool-2.6.2.inc
index c646ed33d64..98bef38ae0b 100644
--- a/meta/recipes-devtools/libtool/libtool-2.5.4.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.6.2.inc
@@ -8,17 +8,16 @@ LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
     file://libltdl/COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 "
 
-SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.xz \
            file://0001-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
            file://0002-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
            file://0003-libtool-remove-help2man-dependency.patch \
            file://0004-libtool.m4-Change-libtool-to-handle-sysroots-by-defa.patch \
-           file://0005-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0006-libtool-Fix-tools-path-issues.patch \
            file://0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch \
           "
 
-SRC_URI[sha256sum] = "da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0ef12929ede6adf"
+SRC_URI[sha256sum] = "2ef1067c16c97db930fd740cc9bc3d3ba9a583804ae5ac42cc3e8719e49e191e"
 
 inherit autotools texinfo
 EXTRA_AUTORECONF = "--exclude=libtoolize"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb b/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb b/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.5.4.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.6.2.bb
diff --git a/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch b/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch
index b174827eef7..c04c50fc75c 100644
--- a/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch
@@ -11,15 +11,15 @@ Updated by: Robert Yang <liezhi.yang@windriver.com>
  Makefile.am | 17 -----------------
  1 file changed, 17 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index 51c1fbdb..4962c3ad 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -408,23 +408,6 @@ $(notes_txt): $(notes_texi)
+Index: libtool-2.6.2/Makefile.am
+===================================================================
+--- libtool-2.6.2.orig/Makefile.am
++++ libtool-2.6.2/Makefile.am
+@@ -419,25 +419,6 @@ $(notes_txt): $(notes_texi)
  	$(AM_V_GEN)$(MAKEINFO) -P '$(srcdir)/doc' --no-headers \
  	    $(MAKEINFOFLAGS) -o '$@' '$(notes_texi)'
  
--dist_man1_MANS		= $(libtool_1) $(libtoolize_1)
+-dist_man1_MANS		= $(libtool_1) $(libtoolize_1) $(libtoolnextv_1)
 -MAINTAINERCLEANFILES	+= $(dist_man1_MANS)
 -update_mans = \
 -  PATH=".$(PATH_SEPARATOR)$$PATH"; export PATH; \
@@ -33,12 +33,11 @@ index 51c1fbdb..4962c3ad 100644
 -	$(AM_V_GEN)$(update_mans) -n 'Provide generalized library-building support services' --help-option=--help-all libtool
 -$(libtoolize_1): $(libtoolize_in)
 -	$(AM_V_GEN)$(update_mans) -n 'Prepare a package to use libtool' libtoolize
+-$(libtoolnextv_1): $(libtoolnextv_in)
+-	$(AM_V_GEN)$(update_mans) -n 'Determines next version to use for a libtool library' libtool-next-version
 -
 -
 -
  ## ------------- ##
  ## Installation. ##
  ## ------------- ##
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
deleted file mode 100644
index 5a4411c8e50..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9f16cd0624641e489665415150792d9054af8a7a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 26 Nov 2024 09:57:39 +0000
-Subject: [PATCH 5/7] libtool: Check for static libs for internal compiler
- libraries
-
-Libtool checks only for libraries linked as -l* when trying to
-find internal compiler libraries. Clang, however uses the absolute
-path to link its internal libraries e.g. compiler_rt. This patch
-handles clang's statically linked libraries when finding internal
-compiler libraries.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-https://crbug.com/749263
-https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00016.html]
----
- m4/libtool.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/libtool.m4 b/m4/libtool.m4
-index 3650c87c..51493a10 100644
---- a/m4/libtool.m4
-+++ b/m4/libtool.m4
-@@ -7708,7 +7708,7 @@ if AC_TRY_EVAL(ac_compile); then
-   for p in `eval "$output_verbose_link_cmd"`; do
-     case $prev$p in
- 
--    -L* | -R* | -l*)
-+    -L* | -R* | -l* | */libclang_rt.*.a)
-        # Some compilers place space between "-{L,R,l}" and the path.
-        # Remove the space.
-        if test x-L = x"$p" ||
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/libtool/libtool_2.5.4.bb b/meta/recipes-devtools/libtool/libtool_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool_2.5.4.bb
rename to meta/recipes-devtools/libtool/libtool_2.6.2.bb
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.6.2.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.6.2.bb

