Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BFFE77198
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5190.1735810872240431839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a9vUi4fV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e2880606so8248692f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810870; x=1736415670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/mbra182kLEyVaToDsHi3GdDbkWsyzDdUH7ErujQxY=;
        b=a9vUi4fVrwMY1PwB8akKDrQedVFanweT6lCkm3FY9zk5P7RG0wcaNInF0yqRYIkZvu
         5a4BCm5mqbZOih0vvUZDlDxAyUTuECPHNDsvEqqyHDC4NBLOwRkN2+oy+3/Lcdq2Mnut
         qusmkEWZ3CfGnvWUyzIGicrzQLis5EZb9+iQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810870; x=1736415670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/mbra182kLEyVaToDsHi3GdDbkWsyzDdUH7ErujQxY=;
        b=jvwfoNBayagm8Wp+gGkjiqaufai0sJsuWpVp2axqYQ1UsprqDeY7jbbnfuISZlHhJS
         BtfCnsGyKxKGs/LxMFFrHIPQyxt+UdGIJQaX4rrb8Ic+4VhQzopLWIROn4VjAgJYSsy/
         p8dTYwDa948UC7zMAMWXhJJrxLlMgv9gFyvv+X/brUeuAqHfXoIiJhE0T8ATzbELymP7
         bNOuVACcokplKTMjA7hM9s2lbGGRN/RmlorDcfN08hao71FrCYnhuHAInBRhX5l7VGAI
         gii6OkGEFlb2fPqUekN54kMHI3snVP3yJhKv8xl5Lq1eQg3RNdeVyd5WCGKUao94YByo
         07NA==
X-Gm-Message-State: AOJu0YwcNfaZndEbnm78IiqP+SPIDU9HhP18PeIvY+oYMUCy8Bn7AI4s
	vFtWo61zqbwxXas4jNdXfEebr9yfYUdjktQ3efOLvyOzV2pTpKL2B+BrO2XKdQUot4kRnxF/8xR
	suZw=
X-Gm-Gg: ASbGnctvPotJHIVwhTZUzwVi9waKIu7nGSCkwiawYnBvVoFPOPX7KQqqhUbpktCUYoG
	9sKrhfgtIEQx9aZVb+2fh/H4VvEHQ1r7xrvRnUin6Oovha57iPNCPl8e1x/JovZDjMhbGHQCJ1N
	Whtsbq2dhdqMBfDEkJWdcfM6leuya2uFcbdUYWBkDCbFGqBodcKIKI+8v2N9Ju6IMz5rVmHW6Qa
	Jp4fJolRI5eg20gvslg5yFcvZZ1gmBMCBBa0At/7WhRGncfuFbOAZ8W+yRDJ4qgl79F4y+RdxT9
	odxHlm81Ew==
X-Google-Smtp-Source: AGHT+IHcFDsdpPkYOQ6IrTvYhYg9w/Z7MrHnJTuDXJjrbgfCwn48F5lPdScwN9YS9ORTTSbZEKVX3A==
X-Received: by 2002:adf:979c:0:b0:38a:418e:1179 with SMTP id ffacd0b85a97d-38a418e13dbmr17379807f8f.2.1735810869955;
        Thu, 02 Jan 2025 01:41:09 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/21] gpgme: upgrade 1.24.0 -> 1.24.1
Date: Thu,  2 Jan 2025 09:40:38 +0000
Message-ID: <20250102094059.322187-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209267

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ake-gpgme.m4-use-gpgrt-config-with-.pc.patch | 15 +++++++--------
 ...1-autogen.sh-remove-unknown-in-version.patch |  7 ++-----
 .../gpgme/gpgme/0001-pkgconfig.patch            | 17 +++++++----------
 ...osix-io.c-Use-off_t-instead-of-off64_t.patch |  2 +-
 ...-use-closefrom-on-linux-and-glibc-2.34.patch |  3 +--
 ...hon-gpg-error-config-should-not-be-use.patch |  7 +++----
 .../0003-Correctly-install-python-modules.patch |  5 ++---
 ...kip-all-lib-or-usr-lib-directories-in-.patch |  3 +--
 .../gpgme/gpgme/0006-fix-build-path-issue.patch |  5 ++---
 .../gpgme/{gpgme_1.24.0.bb => gpgme_1.24.1.bb}  |  2 +-
 10 files changed, 27 insertions(+), 39 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.24.0.bb => gpgme_1.24.1.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 8ed39280cac..e6e86dfd770 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -1,4 +1,4 @@
-From ee1421f7a7a9f31400ba992a5be52b88d20170c9 Mon Sep 17 00:00:00 2001
+From b12b01239909b6fb41adc64d3c0ed32795554369 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:18:04 +0800
 Subject: [PATCH] Revert "build: Make gpgme.m4 use gpgrt-config with *.pc."
@@ -10,16 +10,15 @@ The oe-core does not support gpgrt-config, so revert it
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  src/gpgme.m4 | 54 ++++++++--------------------------------------------
  1 file changed, 8 insertions(+), 46 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index f2906c1..8cc2898 100644
+index 4cfe899..5f689e1 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
-@@ -125,24 +125,10 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+@@ -122,24 +122,10 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
       fi
    fi
  
@@ -46,7 +45,7 @@ index f2906c1..8cc2898 100644
    fi
    gpgme_version_major=`echo $gpgme_version | \
                 sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
-@@ -155,16 +141,12 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+@@ -152,16 +138,12 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
  
  AC_DEFUN([_AM_PATH_GPGME_CONFIG_HOST_CHECK],
  [
@@ -65,7 +64,7 @@ index f2906c1..8cc2898 100644
  *** built for $gpgme_config_host and thus may not match the
  *** used host $host.
  *** You may want to use the configure option --with-gpgme-prefix
-@@ -225,11 +207,7 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -223,11 +205,7 @@ AC_DEFUN([AM_PATH_GPGME],
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -78,7 +77,7 @@ index f2906c1..8cc2898 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -372,11 +350,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -370,11 +348,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -91,7 +90,7 @@ index f2906c1..8cc2898 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -385,20 +359,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -383,20 +357,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 920df3d4c3d..af97f114304 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,4 +1,4 @@
-From 0d76b00111a112032eb8522791b70664100d4e0a Mon Sep 17 00:00:00 2001
+From 1d0fa519ef017aef4821af49c59bad119e7f0d66 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
@@ -20,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 9f912972..9f7559b4 100755
+index 9f91297..9f7559b 100755
 --- a/autogen.sh
 +++ b/autogen.sh
 @@ -271,7 +271,7 @@ if [ "$myhost" = "find-version" ]; then
@@ -32,6 +32,3 @@ index 9f912972..9f7559b4 100755
        cid="0000000"
        rev="0000000"
        rvd="0"
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 2fddf4c5530..59f98103d48 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From e4e75bee348d297bd8288e6fd7e99ab033cbb90c Mon Sep 17 00:00:00 2001
+From 108461f6c50b57ba73970dc977e7d4e9a02624df Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 26 Nov 2024 23:04:52 -0800
 Subject: [PATCH] pkgconfig
@@ -27,10 +27,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 933fb150..08589a6b 100644
+index fe02bdf..6f33020 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1160,6 +1160,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -1179,6 +1179,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -39,7 +39,7 @@ index 933fb150..08589a6b 100644
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/gpgmepp.pc)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 03708620..e716ce4d 100644
+index 0370862..e716ce4 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -58,7 +58,7 @@ index 03708620..e716ce4d 100644
  noinst_SCRIPTS = gpgme-config
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
-index 00000000..074bbf6e
+index 0000000..074bbf6
 --- /dev/null
 +++ b/src/gpgme-pthread.pc.in
 @@ -0,0 +1,15 @@
@@ -78,7 +78,7 @@ index 00000000..074bbf6e
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 5f689e18..249e8c98 100644
+index 5f689e1..249e8c9 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -166,7 +166,6 @@ dnl is added to the gpg_config_script_warn variable.
@@ -281,7 +281,7 @@ index 5f689e18..249e8c98 100644
 -  AC_SUBST(GPGME_GLIB_LIBS)
  ])
 diff --git a/src/gpgme.pc.in b/src/gpgme.pc.in
-index 9ddef5cd..932645be 100644
+index 9ddef5c..932645b 100644
 --- a/src/gpgme.pc.in
 +++ b/src/gpgme.pc.in
 @@ -9,6 +9,6 @@ Name: gpgme
@@ -293,6 +293,3 @@ index 9ddef5cd..932645be 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
index be58c421285..9845b029692 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-posix-io.c-Use-off_t-instead-of-off64_t.patch
@@ -1,4 +1,4 @@
-From be33cf1812b4c2a3ed85fb2532992bfb2b27b3be Mon Sep 17 00:00:00 2001
+From 13b955f66615caf34d19e86d97bcfe841d60d58c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 08:44:13 -0800
 Subject: [PATCH] posix-io.c: Use off_t instead of off64_t
diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
index 3d05808d63f..f174e24ebc9 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -1,4 +1,4 @@
-From e1fc4b06dcb62e1c2d85ae99f39ef1a8860570e1 Mon Sep 17 00:00:00 2001
+From 2592a1d97c66f8bff4bae095b14cb774de3e80c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Jul 2021 12:33:13 -0700
 Subject: [PATCH] use closefrom() on linux and glibc 2.34+
@@ -8,7 +8,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Rebase to 1.17.0
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
-
 ---
  src/posix-io.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index 0d2692912fd..373660be943 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,4 +1,4 @@
-From 9fce0689bc04506e5758444efa24ea99fe1ff5ef Mon Sep 17 00:00:00 2001
+From a956d17d2aa7fea53bab97715a8f98858e9b4a5c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 10 May 2019 14:30:36 +0800
 Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
@@ -14,16 +14,15 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Rebase to 1.13.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  lang/python/setup.py.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index 6f36861..1d9058b 100755
+index d6f537e..695c02e 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
-@@ -169,9 +169,8 @@ class BuildExtFirstHack(build):
+@@ -173,9 +173,8 @@ class BuildExtFirstHack(build):
  
      def _generate_errors_i(self):
  
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index 204fe5934d9..004e5875188 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,4 +1,4 @@
-From 8c850aa109c42d0c193bccc7af45dbc2689b23f6 Mon Sep 17 00:00:00 2001
+From 548d84c703a747c41a02e1d0ff6ad4c193a34a5c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 15:28:49 +0800
 Subject: [PATCH] Correctly install python modules
@@ -12,13 +12,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Rebase to 1.10.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  lang/python/Makefile.am | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 68b98e8..bbb9111 100644
+index a6fd639..136e979 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
 @@ -97,6 +97,7 @@ install-exec-local:
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 7fe0c9538a8..120cb64b980 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,4 +1,4 @@
-From 57475742b0288b4ee53c01c59c3ab03c1ef7932e Mon Sep 17 00:00:00 2001
+From 59b2e28b34f332d12935af41dbe3140f5842e8d1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
 Subject: [PATCH] gpgme-config: skip all /lib* or /usr/lib* directories in
@@ -9,7 +9,6 @@ directory names than plain /lib or /usr/lib.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/gpgme-config.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
index 8d48db2febb..00449e32599 100644
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -1,4 +1,4 @@
-From 7938a5a760827aec737ea49d2f8719051abda188 Mon Sep 17 00:00:00 2001
+From 89a53d8d025fef4626006219f0f686982e215d97 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 11:01:09 +0800
 Subject: [PATCH] fix build path issue
@@ -12,13 +12,12 @@ to use relative path.
 
 Upstream-Status: Submitted [gnupg-devel@gnupg.org]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  lang/python/Makefile.am | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index bbb9111..cee499e 100644
+index 136e979..1495982 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
 @@ -96,8 +96,9 @@ install-exec-local:
diff --git a/meta/recipes-support/gpgme/gpgme_1.24.0.bb b/meta/recipes-support/gpgme/gpgme_1.24.1.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.24.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.24.1.bb
index d717c0cbb76..34f8a15e000 100644
--- a/meta/recipes-support/gpgme/gpgme_1.24.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.24.1.bb
@@ -29,7 +29,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "61e3a6ad89323fecfaff176bc1728fb8c3312f2faa83424d9d5077ba20f5f7da"
+SRC_URI[sha256sum] = "ea05d0258e71061d61716584ec34cef59330a91340571edc46b78374973ba85f"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 

