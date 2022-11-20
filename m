Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609E8C4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.12314.1668951101371218294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ui4JFXnX;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id cl5so16226006wrb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/D0DY89U14h/dFo1j1hoh88fyKHR0oIu84CH3dzRmw=;
        b=Ui4JFXnXyf0C+jfnLIuu/oZawpNZjvJWewoJOZuXlP7DvFxEYEAo2Zg5ILpYVNp1zG
         O8ggRV2hk+ucpqMIEhwyo8rnMnj2jIYLXVQ2I3F07pgHy6x4amHlM4KOIvX/dDYVF9ae
         kuR17LldMLh5M66VKNx3PrhqDPD9SZm05fGyXjQJkAUCOnIS59Sc6qBIAd9P4tX8AHJx
         sp9tn2Dy68Ck9dOxz/LwjrTZfJvlGsEiAriNi1x/pnXFRRv8x8rDRhwvSSEhiu3JseDN
         wZIgFI05kTt5bgKqzECOYEGmDbw6BH2ON5vZ7NMapNBnxX7jFxq+iePGaPZ3bpMXF+q0
         2lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/D0DY89U14h/dFo1j1hoh88fyKHR0oIu84CH3dzRmw=;
        b=X9nYiiDLjW3G+9p5OrdVApt0vtR6AUiche6vaWoUw7XP+A+VKYcTZWMHLEvz5+mtcq
         8LRBfv03Py4LmXsolStWhg1fVtB/FgSfdMqRoNLW6wmkR90LoZwBfhC5j2X6JAZDOwFD
         DBb5k79r352UtsFIG4GDoJV2vl4VhD0diwHBgGnncTPc/VD/r6io1T40nNEHyfObxsqa
         O6SDzH4OFSNLWIWlDfTnoj3WwZ1F9t5VI9Ll2RLMk9ToDCoZXUtMZ02qB6Y0nOGpjGbx
         yIT96Vgrx2hEbvQPmaRg8nviNNnCJUESGDcvVJCY3iMhDNaOX45wm2c1IWEiBmfC0kP7
         9j5w==
X-Gm-Message-State: ANoB5pknWOBc4EiRZLmfdRDZH5Js3lxdIK2igG9lQ5k9vSiw0mWzzADj
	wwSC7YDvN1k0x8UhjhpXmM4Ygfjye/g=
X-Google-Smtp-Source: AA0mqf54L45GN9rNdUYmtiNZDhDb/yY9aam93iv+fO8fnVrPD40XBR/NYQ3XqrmbJVMnVSZ+VZtdhA==
X-Received: by 2002:a05:6000:70f:b0:22e:41c5:7ef7 with SMTP id bs15-20020a056000070f00b0022e41c57ef7mr8851819wrb.332.1668951099891;
        Sun, 20 Nov 2022 05:31:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/17] libgpg-error: update 1.45 -> 1.46
Date: Sun, 20 Nov 2022 14:31:20 +0100
Message-Id: <20221120133122.2464634-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173596

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...Do-not-fail-when-testing-config-scripts.patch |  8 ++++----
 .../libgpg-error/libgpg-error/pkgconfig.patch    | 16 ++++++++++------
 ...libgpg-error_1.45.bb => libgpg-error_1.46.bb} |  2 +-
 3 files changed, 15 insertions(+), 11 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.45.bb => libgpg-error_1.46.bb} (95%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
index a0ab4f23ff..ee3147f3df 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Do-not-fail-when-testing-config-scripts.patch
@@ -1,4 +1,4 @@
-From 137805890951b6b585c1d23097e0a51e8c7a8a50 Mon Sep 17 00:00:00 2001
+From a45989a64af20ef6a9f7c1552f19bba116e7cd0a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 28 Feb 2020 09:19:56 +0000
 Subject: [PATCH] Do not fail when testing config scripts
@@ -9,19 +9,19 @@ failure is due to that.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/Makefile.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 9303954..7630540 100644
+index c61adde..1b8b4ff 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -344,7 +344,6 @@ gpg-error-config: gpgrt-config gpg-error-config-old
+@@ -323,6 +323,5 @@ gpg-error-config: gpgrt-config gpg-error-config-old gpg-error-config-test.sh
  	else                                                   \
  	  echo "no";                                           \
  	  echo "***  Please report to <https://bugs.gnupg.org> with gpg-error-config-test.log"; \
 -	  exit 1; \
  	fi
  	cp gpg-error-config-old $@
- 
diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 82bb4cdb47..75c1febc10 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From 0214d886d0153f7288f81213c47dc50f3b9fde20 Mon Sep 17 00:00:00 2001
+From e10f93167c76c477a7b97286cfac603795bf28d8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
@@ -14,14 +14,14 @@ Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
 ---
- src/gpg-error.m4 | 161 +----------------------------------------------
- 1 file changed, 3 insertions(+), 158 deletions(-)
+ src/gpg-error.m4 | 165 +----------------------------------------------
+ 1 file changed, 3 insertions(+), 162 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index 4b5cd40..c9978d6 100644
+index a975e53..af4bf2f 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
-@@ -27,158 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
+@@ -27,162 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -118,6 +118,10 @@ index 4b5cd40..c9978d6 100644
 -        fi
 -        if test -n "$gpgrt_libdir"; then break; fi
 -      done
+-      if test -z "$libdir_candidates"; then
+-        # No valid pkgconfig dir in any of the system directories, fallback
+-        gpgrt_libdir=${possible_libdir1}
+-      fi
 -    else
 -      # When we cannot determine system libdir-format, use this:
 -      gpgrt_libdir=${possible_libdir1}
@@ -183,7 +187,7 @@ index 4b5cd40..c9978d6 100644
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -194,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -198,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
similarity index 95%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.45.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
index ff3a673df2..580fe208d4 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "570f8ee4fb4bff7b7495cff920c275002aea2147e9a1d220c068213267f80a26"
+SRC_URI[sha256sum] = "b7e11a64246bbe5ef37748de43b245abd72cfcd53c9ae5e7fc5ca59f1c81268d"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.30.2


