Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21870C54E55
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:10 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.14863.1709739727692797591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AaBZOZ5q;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4467d570cdso737385166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739726; x=1710344526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UihC1PQp6reUfAhJSM4z+vizKcjtwQjkI2mDa0EFhz8=;
        b=AaBZOZ5qwHq58BxYXpluobnH/r9CkA61c14BXTgRM2Gq+mXsF92FsW5ukFqrx5rhlj
         0QZaEMNjME+uBizF5LQd9t+QjJ8Sjjx4bQkS1tuEYk16ihkI3eQVb2MoGPhB5YX1y/Zg
         nsmeQUO0yHmXQmjNpDyWZvyL5km93dTCKB6ztZD7L1BPRZw+p4z+0nAoES21nAn6DXuo
         tM2eK75KgYN9Fq1FmFMPJ6BqzVp1LQMtQDPqtmr0R1fqx4/pZ4amSqdAgfO80/Ol/QX5
         o17tSiaKq0ROIXRGNz7DhvxXVBlkrhPd7FrwMB+FofJc+eqH4G7SQf77k+fY+1h12WMf
         3mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739726; x=1710344526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UihC1PQp6reUfAhJSM4z+vizKcjtwQjkI2mDa0EFhz8=;
        b=PcvfzJb81nlxLJqewgP1wpuau4IYsGa+U7czUUNM8oMU19c/yV4JzdI80yzxJVY7rj
         oCiq1yTyxIftdLgQWPq6FMuskCuMVwAykP1lEjyBZtXjpRdQ4MjC1QmT/gQz+uMfel/l
         o8LQZBJqLnthY25z6+8yknpazDad83b5olxET/XEP/OC6Yj1IWz1WB1b+ZXn4rGjyGTL
         Vk2kt38Yr6O1XRg5UPqtQTQDNUwWJ7gczR1op8d3b1m5nm0G43y/g9xM6MqOWhnIqaKL
         AvcikDG/DF3Jzqb+XBo7B96RN5yfWovRWG5iLEqW/hFGx9HByWjzz9T7Q+uGhp8eT4xO
         yhkQ==
X-Gm-Message-State: AOJu0Yyg+k7c0qzyHhrP+K9GX9I4dYCRqjJLfzAzppKnr7SEoL35b9TB
	ztQmibYBzACXyRAClQ3cQ9XAFP4TpCklgaD5AXpBDxNgb/VA+upktnd6RcG4
X-Google-Smtp-Source: AGHT+IE0uedmqIcixmEte/fakHKIAyiUAdBV/Ahf105pYUTL0GO5D7wZiqWkW9JI75o7gZ55jNu71Q==
X-Received: by 2002:a17:906:fc16:b0:a44:3bec:20a8 with SMTP id ov22-20020a170906fc1600b00a443bec20a8mr10390731ejb.76.1709739725978;
        Wed, 06 Mar 2024 07:42:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/47] gettext: upgrade 0.22.4 -> 0.22.5
Date: Wed,  6 Mar 2024 16:41:15 +0100
Message-Id: <20240306154151.3741709-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196694

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...0.22.4.bb => gettext-minimal-native_0.22.5.bb} |  0
 meta/recipes-core/gettext/gettext-sources.inc     |  2 +-
 ...-init-env.in-do-not-add-C-CXX-parameters.patch |  2 +-
 .../0001-tests-autopoint-3-unset-MAKEFLAGS.patch  |  6 +++---
 meta/recipes-core/gettext/gettext/parallel.patch  |  7 +++----
 .../gettext/gettext/serial-tests-config.patch     |  9 ++++-----
 .../gettext/gettext/use-pkgconfig.patch           | 15 +++++++--------
 .../{gettext_0.22.4.bb => gettext_0.22.5.bb}      |  2 +-
 8 files changed, 20 insertions(+), 23 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.22.4.bb => gettext-minimal-native_0.22.5.bb} (100%)
 rename meta/recipes-core/gettext/{gettext_0.22.4.bb => gettext_0.22.5.bb} (99%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.22.4.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.22.5.bb
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 8b4e2401010..fd05837528c 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,4 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            "
-SRC_URI[sha256sum] = "c1e0bb2a4427a9024390c662cd532d664c4b36b8ff444ed5e54b115fdb7a1aea"
+SRC_URI[sha256sum] = "ec1705b1e969b83a9f073144ec806151db88127f5e40fe5a94cb6c8fa48996a0"
diff --git a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
index d45b75869ad..33d45a038cf 100644
--- a/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
+++ b/meta/recipes-core/gettext/gettext/0001-init-env.in-do-not-add-C-CXX-parameters.patch
@@ -1,4 +1,4 @@
-From 9b912a47f790a7b282ec0c2295a188c5d8fb6a7c Mon Sep 17 00:00:00 2001
+From c58c503c532d20883a93ef778327c86dd6de24f6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 6 Mar 2020 21:04:05 +0000
 Subject: [PATCH] init-env.in: do not add C/CXX parameters
diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
index b0bc6b97a63..94afb255c38 100644
--- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
+++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
@@ -1,4 +1,4 @@
-From 38b256e5aa7dfeb42acffd89565e53a2c0bab3e3 Mon Sep 17 00:00:00 2001
+From 7006142d199af13628edc687847a9a5bac48b45d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Jan 2020 16:44:38 +0100
 Subject: [PATCH] tests/autopoint-3: unset MAKEFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gettext-tools/tests/autopoint-3 b/gettext-tools/tests/autopoint-3
-index e13552b..55188df 100755
+index bd3fbf3..380eaac 100755
 --- a/gettext-tools/tests/autopoint-3
 +++ b/gettext-tools/tests/autopoint-3
-@@ -126,6 +126,7 @@ test $? = 0 || { cat autopoint.err; Exit 1; }
+@@ -131,6 +131,7 @@ test $? = 0 || { cat autopoint.err; Exit 1; }
  ${CONFIG_SHELL} ./configure >/dev/null 2>autpoint.err
  test $? = 0 || { cat autopoint.err; Exit 1; }
  
diff --git a/meta/recipes-core/gettext/gettext/parallel.patch b/meta/recipes-core/gettext/gettext/parallel.patch
index d96a376b7d1..8ecba46fd0a 100644
--- a/meta/recipes-core/gettext/gettext/parallel.patch
+++ b/meta/recipes-core/gettext/gettext/parallel.patch
@@ -1,4 +1,4 @@
-From 4a2a0a93b469093b60ffd0bec55d33d1e03d4713 Mon Sep 17 00:00:00 2001
+From 83333bc873c2655ff1de161f6b7db930f22f1cea Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Thu, 7 Jun 2012 16:37:01 -0700
 Subject: [PATCH] instal libgettextlib.a before removing it
@@ -10,16 +10,15 @@ the operations.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
-
 ---
  gettext-tools/gnulib-lib/Makefile.am | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/gettext-tools/gnulib-lib/Makefile.am b/gettext-tools/gnulib-lib/Makefile.am
-index 2126699..d2dd7e4 100644
+index ab729cd..a0d713e 100644
 --- a/gettext-tools/gnulib-lib/Makefile.am
 +++ b/gettext-tools/gnulib-lib/Makefile.am
-@@ -58,6 +58,10 @@ endif
+@@ -58,6 +58,10 @@ AM_CFLAGS = @WARN_CFLAGS@
  # Rules generated and collected by gnulib-tool.
  include Makefile.gnulib
  
diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
index 93f7c03334a..7d39d6086ab 100644
--- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
@@ -1,4 +1,4 @@
-From ed64a5724ef7d6eb4e9a876f817ea266a536e195 Mon Sep 17 00:00:00 2001
+From aa8dfe0aafd0b53a6c5bac61b356ca92e1430a36 Mon Sep 17 00:00:00 2001
 From: "Hongjun.Yang" <hongjun.yang@windriver.com>
 Date: Thu, 28 Jul 2016 12:36:15 +0800
 Subject: [PATCH] fix for ptest
@@ -8,7 +8,6 @@ Add serial-tests support, ptest need it
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  configure.ac                 | 2 +-
  gettext-runtime/configure.ac | 2 +-
@@ -16,7 +15,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 38db6fd..f019ae0 100644
+index f4e54ea..a47ff14 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext],
@@ -29,7 +28,7 @@ index 38db6fd..f019ae0 100644
  dnl Override automake's tar command used for creating distributions.
  am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root "$$tardir"'
 diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
-index de203e7..138a07f 100644
+index 126d069..aa23232 100644
 --- a/gettext-runtime/configure.ac
 +++ b/gettext-runtime/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
@@ -42,7 +41,7 @@ index de203e7..138a07f 100644
  
  dnl Installation directories.
 diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
-index cf1dd73..b544d6d 100644
+index 3610ee3..6f56a23 100644
 --- a/gettext-tools/configure.ac
 +++ b/gettext-tools/configure.ac
 @@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index f1fb61de4ef..ceb1856118a 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 38c361e6860bfaefbefeccae621e698c301879f2 Mon Sep 17 00:00:00 2001
+From 6aa1338b916fe72c200b6f160b934be15b6ff590 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 23 Jan 2018 00:54:13 +0000
 Subject: [PATCH] gettext: beat library detection into shape
@@ -12,12 +12,11 @@ Simply delete all the crazy, and replace with a single call to pkg-config.
 
 Upstream-Status: Inappropriate [upstream still refuse to consider pkg-config]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
- gettext-tools/gnulib-m4/libxml.m4             | 105 +----------------
- libtextstyle/gnulib-local/m4/libglib.m4       | 106 +++---------------
- libtextstyle/gnulib-m4/libglib.m4             | 106 +++---------------
- 3 files changed, 79 insertions(+), 470 deletions(-)
+ gettext-tools/gnulib-m4/libxml.m4       | 105 ++---------------------
+ libtextstyle/gnulib-local/m4/libglib.m4 | 106 +++---------------------
+ libtextstyle/gnulib-m4/libglib.m4       | 106 +++---------------------
+ 3 files changed, 31 insertions(+), 286 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
 index 0340490..0355388 100644
@@ -143,7 +142,7 @@ index 0340490..0355388 100644
    ])
    AC_SUBST([LIBXML])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index 7ee5029..bb1e5e4 100644
+index dbc9eb8..136e512 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
 @@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
@@ -267,7 +266,7 @@ index 7ee5029..bb1e5e4 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index 7ee5029..bb1e5e4 100644
+index dbc9eb8..136e512 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
 @@ -6,106 +6,26 @@ dnl with or without modifications, as long as this notice is preserved.
diff --git a/meta/recipes-core/gettext/gettext_0.22.4.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
similarity index 99%
rename from meta/recipes-core/gettext/gettext_0.22.4.bb
rename to meta/recipes-core/gettext/gettext_0.22.5.bb
index 75474c8c30f..1a66d379168 100644
--- a/meta/recipes-core/gettext/gettext_0.22.4.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -175,7 +175,7 @@ do_install_ptest() {
         install ${B}/gettext-tools/misc/*       ${D}${PTEST_PATH}/misc
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
-                   ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2
+                   ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2 ${D}${PTEST_PATH}/tests/xgettext-vala-6
         sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
     fi
 }
-- 
2.39.2


