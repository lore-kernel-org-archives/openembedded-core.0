Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF69C32792
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.474.1660894082105545388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pQPKGwdl;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so2055169wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=S5reQEido7dHfa57Yc2WwXR0EQQt7iynmhFS0ie47wY=;
        b=pQPKGwdlC99dMUXEvC6hSxrEuj/t1NOW2teA/H9rxcy1vOVsJR3JH32rTfPsy+BGVI
         ZpBrbGXN0YfckgAM/GJR835bQkEoy+kb8C069mivZrJ0aiGtirVlOQ0yLZe8cXqwfoDF
         UsWTvzN4CKp2fGNS3r/q4dSCkB6EfxS1mECJ2inRoEMd8mAP8bR8LsyPYSqDa120gfwL
         D+4OUF0F0iqmeHLyXg/OBnwt5Nd6nqPTCcv3oS6cYMilP/0IQIZ2+gdCNwzzs0+qZLRo
         m/bwfKKdjlpE3QtCuS0sEKIWESWaUG6zBH2U2yX7/x0sONOG/Q9nGluekRaxmp18nh4u
         gnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=S5reQEido7dHfa57Yc2WwXR0EQQt7iynmhFS0ie47wY=;
        b=inwDswkLqKsypvAEP3+OCiknWDaOGKhgoHRLDR0TrTVzBQ4wTHdmHe7tPfGzyvtdOT
         QXM12la+bwQer1KlIkERZ7tGhxiZHUR8g1SxOrhyX/nZWo+uTIDr0A3Tjn5ULywKSOQ8
         j0wO1aqvn2luXtOP4XYut9NKyzjNpbXzDk5wnQeegvyaporqxahMiTJB2Yt7fpgbHG/U
         2gqNuUrCmnZneYsrPy68OwKIWtwFiiyr0XJMHlbed/bt8ytR0C8B8UKQ9U8BNH7vW1km
         ts1ghyAMUDT+BPDn8MDqs3gQKiGUDdsXlodE3uP0IPfWhS4dakA/t9BklGfC/bxpu9n8
         Lnhg==
X-Gm-Message-State: ACgBeo0JqcmOJ2JhkeCqLqOhopmEXnZtqGKVn5UMbvyB+1GSRrMDSJQF
	FgrmxONOh7iw7A55gDnQFrYfA8x1Hf8=
X-Google-Smtp-Source: 
 AA6agR7sUGKmpwc7mlX6Wz5HhYKwfR0WdPFM32Jf+pdNTHtD2OsIZ0CS5LHR6NNTB8YcOROT3X6YNA==
X-Received: by 2002:a05:600c:35cc:b0:3a6:1785:ca4 with SMTP id
 r12-20020a05600c35cc00b003a617850ca4mr4050696wmq.192.1660894080668;
        Fri, 19 Aug 2022 00:28:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/42] gpgme: upgrade 1.17.1 -> 1.18.0
Date: Fri, 19 Aug 2022 09:27:02 +0200
Message-Id: <20220819072727.2236928-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169588

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gpgme/gpgme/0001-pkgconfig.patch           | 18 ++++++++----------
 .../gpgme/{gpgme_1.17.1.bb => gpgme_1.18.0.bb} |  2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.17.1.bb => gpgme_1.18.0.bb} (97%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 35c6b4056c..3b2f59c2fc 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,4 +1,4 @@
-From 98ce65902b197faa8f660564613ca2e504c2f8f8 Mon Sep 17 00:00:00 2001
+From 0d7ec5b98dc6cbd35f56deaecec5ecfdaa944aee Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 10 May 2019 14:23:55 +0800
 Subject: [PATCH] pkgconfig
@@ -15,6 +15,7 @@ Rebase to 1.13.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Rebase to 1.17.0
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+
 ---
  configure.ac            |   1 +
  src/Makefile.am         |   4 +-
@@ -25,10 +26,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 80ce79c..d7c0ac1 100644
+index 9d696b9..5b4e730 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -905,6 +905,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -926,6 +926,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -37,7 +38,7 @@ index 80ce79c..d7c0ac1 100644
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 39c341f..3aca716 100644
+index 67805a8..d38ba02 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -52,8 +53,8 @@ index 39c341f..3aca716 100644
 -	     gpgme.pc.in gpgme-glib.pc.in
 +	     gpgme.pc.in gpgme-glib.pc.in gpgme-pthread.pc.in
  
- bin_SCRIPTS = gpgme-config
- m4datadir = $(datadir)/aclocal
+ if USE_GPGRT_CONFIG
+ noinst_SCRIPTS = gpgme-config
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
 index 0000000..074bbf6
@@ -76,7 +77,7 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 71b0010..30ec151 100644
+index 71b0010..5821895 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -79,7 +79,7 @@ dnl config script does not match the host specification the script
@@ -287,6 +288,3 @@ index 80d59de..932645b 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
--- 
-2.25.1
-
diff --git a/meta/recipes-support/gpgme/gpgme_1.17.1.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
similarity index 97%
rename from meta/recipes-support/gpgme/gpgme_1.17.1.bb
rename to meta/recipes-support/gpgme/gpgme_1.18.0.bb
index d95ed6c299..ca9c6cab14 100644
--- a/meta/recipes-support/gpgme/gpgme_1.17.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            "
 
-SRC_URI[sha256sum] = "711eabf5dd661b9b04be9edc9ace2a7bc031f6bd9d37a768d02d0efdef108f5f"
+SRC_URI[sha256sum] = "361d4eae47ce925dba0ea569af40e7b52c645c4ae2e65e5621bf1b6cdd8b0e9e"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS:${PN}-cpp += "libstdc++"
-- 
2.30.2


