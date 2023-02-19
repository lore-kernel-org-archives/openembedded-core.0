Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59144C6FD18
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3926.1676835071799349989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oiyAZn/K;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id bx23so835966wrb.10
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s84NTWbZ6MpqZAcY3IazpUIn/M3SR7ma0Dj6KAI4ZVs=;
        b=oiyAZn/KiQ2Z4Y5SoB0r1Mu3jFOXtHmDgDQEoENsDkYAqYNLuTC0UGTxSMIpRBGMBS
         +0ZbACVZelEQwzp+Q1Cjug6G0zirXZFELzEinHk/b5OMrsqXwqdjlnZjlUX0hokqDG0v
         K6Vp1RsqafJav7m04HcHPbUwY9JnyOO4ZQH+qC68WNo753KNvv5SCCPSrFOEiYLy14Yq
         WAO2tVe6IMZfxuwcM7+gufYyEFumC0cXdtMSTp6nBO/ryx8ELqk+gqtRY7fZ+c20pMr3
         xeMUjPMLlyvNibLF2Zf/09XnjjKqAm3VTm++QxayWKpVkFD+WNyyXyoE0LP6sDQ1vKPm
         B34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s84NTWbZ6MpqZAcY3IazpUIn/M3SR7ma0Dj6KAI4ZVs=;
        b=PM2xPuESZnmSPr+PndNFZB+TeTmjRce8fZBODgIG4jn/qR7hnv9qY53LtOlPlklron
         Wy4B6UWtknKVBRe68qsFkho2/2PLs0o8mGusSElJk2X6qPu2HECrPfMqNI1Hs44LFPnX
         PtAYx+pmDW0tKmJQZDjBXAmKE3G/g0IiYkZKsj2PNUZP7Ex5HPnJiBirbx7bC4gEY/vk
         4/xw2jpLbVkeOAqi3NvEjpwkfSsor/j2LPP3mgrQBeTZKx8gushQunC0+3wFJZpAq9IA
         kgXDx2AuDc9AWnpwxBREIRb0N1mgtVNb4dHOpyWNa0fX9hcxOCK0XzH3++owXw6RGVQd
         xfTA==
X-Gm-Message-State: AO0yUKWJ3iAIWoFaVWGtI9aV3ZpfKYvrj02G51pLqHui7r4MFyF7jJxp
	ti6ZYdIuGUSovE8OkKtXN/OyvAiYxNU=
X-Google-Smtp-Source: AK7set/CvKO5hTiTXX4JrM2fZwZWpmVllg+VSOSiGfdf65T5+ekeM7tzcsPqHRy+x4Co+Vr6LTd2NQ==
X-Received: by 2002:a5d:4305:0:b0:2c5:62c8:5f43 with SMTP id h5-20020a5d4305000000b002c562c85f43mr239848wrq.29.1676835070239;
        Sun, 19 Feb 2023 11:31:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/39] gnutls: update 3.7.8 -> 3.8.0
Date: Sun, 19 Feb 2023 20:30:31 +0100
Message-Id: <20230219193101.338397-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177352

Refresh patches.

guile option removed upstream.

License-update: formatting, urls
https://github.com/gnutls/gnutls/commit/a39e528897184c6f6a33d245b82891a8dc8090ce

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ile-should-be-excuted-in-target-envi.patch | 21 +++++++++----------
 .../gnutls/gnutls/Add-ptest-support.patch     | 14 ++++++-------
 .../gnutls/gnutls/arm_eabi.patch              |  8 +++----
 .../{gnutls_3.7.8.bb => gnutls_3.8.0.bb}      |  7 +++----
 4 files changed, 23 insertions(+), 27 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.8.bb => gnutls_3.8.0.bb} (92%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index e40b2be362..87ebd8059e 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -1,4 +1,4 @@
-From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00 2001
+From 21a8295bac3805e4490ba2b5f136e7f4c121061b Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Mon, 23 May 2022 10:44:43 +0900
 Subject: [PATCH] Creating .hmac file should be excuted in target environment,
@@ -6,23 +6,22 @@ Subject: [PATCH] Creating .hmac file should be excuted in target environment,
 
 Upstream-Status: Inappropriate [https://gitlab.com/gnutls/gnutls/-/issues/1373]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+
 ---
  lib/Makefile.am | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 0b43ef9..cf263f0 100644
+index 6d4e8d2..24ef108 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -206,8 +206,7 @@ hmac_files = .libs/.gnutls.hmac
-
- all-local: $(hmac_files)
-
--.libs/.gnutls.hmac: libgnutls.la fipshmac
+@@ -206,8 +206,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
+ 
+ all-local: $(hmac_file)
+ 
+-$(hmac_file): libgnutls.la fipshmac
 -	$(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
 +.libs/.gnutls.hmac:
-
- CLEANFILES = $(hmac_files)
+ 
+ CLEANFILES = $(hmac_file)
  endif
---
-2.25.1
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 8ad6ba5ad5..f87cf536fa 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -1,10 +1,11 @@
-From 74080376904713a8e6cceefbc25c81512796bf0c Mon Sep 17 00:00:00 2001
+From 81861f7ba690956c064ebe8dce6c313951fa2a9f Mon Sep 17 00:00:00 2001
 From: Ravineet Singh <ravineet.a.singh@est.tech>
 Date: Tue, 10 Jan 2023 16:11:10 +0100
 Subject: [PATCH] gnutls: add ptest support
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
+
 ---
  Makefile.am       | 3 +++
  configure.ac      | 2 ++
@@ -12,7 +13,7 @@ Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
  3 files changed, 11 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 843193f9f..816b09fec 100644
+index 843193f..816b09f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -191,6 +191,9 @@ dist-hook:
@@ -26,7 +27,7 @@ index 843193f9f..816b09fec 100644
  
  include $(top_srcdir)/cligen/cligen.mk
 diff --git a/configure.ac b/configure.ac
-index baff1c007..f9f596abf 100644
+index b25ba14..860ddef 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
@@ -39,10 +40,10 @@ index baff1c007..f9f596abf 100644
  
  hw_features=
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 573e911a0..e8a26f8b9 100644
+index d530ad0..71c592f 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -644,6 +644,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -648,6 +648,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
@@ -55,6 +56,3 @@ index 573e911a0..e8a26f8b9 100644
  distclean-local:
  	rm -rf softhsm-*.db softhsm-*.config *.tmp tmp-* x509-crt-list-import-url.config.db port.lock.d
  
--- 
-2.31.1
-
diff --git a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
index 6eb1edbdb1..2b61a703cb 100644
--- a/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
+++ b/meta/recipes-support/gnutls/gnutls/arm_eabi.patch
@@ -1,4 +1,4 @@
-From 8a5c96057cf305bbeac0d6e0e59ee24fbb9497fe Mon Sep 17 00:00:00 2001
+From 911213d9f72ddce468322d22d223127b93964409 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Wed, 25 Jan 2017 13:52:59 -0800
 Subject: [PATCH] gnutls: account for ARM_EABI
@@ -15,10 +15,10 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/seccomp.c b/tests/seccomp.c
-index ed14d00..3c5b726 100644
+index a3148fe..443bc5f 100644
 --- a/tests/seccomp.c
 +++ b/tests/seccomp.c
-@@ -53,7 +53,9 @@ int disable_system_calls(void)
+@@ -52,7 +52,9 @@ int disable_system_calls(void)
  
  	ADD_SYSCALL(nanosleep, 0);
  	ADD_SYSCALL(clock_nanosleep, 0);
@@ -27,4 +27,4 @@ index ed14d00..3c5b726 100644
 +#endif
  	ADD_SYSCALL(getpid, 0);
  	ADD_SYSCALL(gettimeofday, 0);
- #if defined(HAVE_CLOCK_GETTIME)
+ # if defined(HAVE_CLOCK_GETTIME)
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.8.bb b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
similarity index 92%
rename from meta/recipes-support/gnutls/gnutls_3.7.8.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.0.bb
index fee06393bd..835ab122d8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -11,8 +11,8 @@ LICENSE:${PN}-bin = "GPL-3.0-or-later"
 LICENSE:${PN}-openssl = "GPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
-                    file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
-                    file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+                    file://doc/COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
 DEPENDS:append:libc-musl = " argp-standalone"
@@ -26,7 +26,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c51977fb396d4617114"
+SRC_URI[sha256sum] = "0ea0d11a1660a1e63f960f157b197abe6d0c8cb3255be24e1fb3815930b9bdc5"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
@@ -44,7 +44,6 @@ PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASEL
 EXTRA_OECONF = " \
     --enable-doc \
     --disable-libdane \
-    --disable-guile \
     --disable-rpath \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-- 
2.30.2


