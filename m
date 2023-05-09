Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CDEC7EE25
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:14 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.39310.1683653046043553192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jOXQTN6W;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-969f90d71d4so137241366b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653044; x=1686245044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfUsAjEIfBSWrdDTrtKcIH8F01Ea62L+UOUojLo9QkQ=;
        b=jOXQTN6Wi3uKeG/vLG39wIacr7F8UktgECJNIILYWlEiytprT0T3gdyMQClXoGp0to
         Yh1SBUcKPIFnhAj1R5YafuliL8FAy07zDZNLL3yuhnVlyAGUUFpVF34ktOcPjyeBTWdp
         y/QCslMh9S+m9W7Osz/ZNY23LypzIY3W5eHYmRfXlI0aM4xv3lZFqGTk95iUNSf7Xihj
         GL07ludg9f4lB9IZAtUxyprDkRxUgcLaaInxH2vvbdIuxyoWKRJ+IlK2icdKzBAq7Bzw
         Im9TuD3zEoduGLAP+49N0gBroMZ2KALghS73gXZI94iN2cBBfEfEkJxKRtrOr8vSplJv
         uDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653044; x=1686245044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfUsAjEIfBSWrdDTrtKcIH8F01Ea62L+UOUojLo9QkQ=;
        b=X5gBpXK2HffVAb5NYpGwJeJEzakQAamnDUGPYzk8ZMXEPTpzWElF1E1YLLt+rMW1Ij
         ZlVMVjviP6Rs6c10RKHSc+ugCwQweIZzID/3r6LsoqJuPZUOFDKmd31gQ7H3OCdHpNkC
         zO05PQ0hKpLnsCHn7nsirambnUGNF8zlWKmoQ8Y6hWp1tZj3uWupThuXh8MT95psO/Ew
         WleSip+xvWul1zE2KfZiA1gHhChPQYZqAjFYnDhMDJJcbdX4wD9dEB3ScsjKu3C5Hqer
         qMKX9muddANS+UZBOycK8Pit+uvSbhXF/TdaC/rQLj2BpSvS5rAaVrkiA1dyf0G2a98O
         7vww==
X-Gm-Message-State: AC+VfDwtt/w39a9ongYpS+8aH5NNXOejSBOc2ByMXyjwOFHI8ymDYpaG
	UFKrCWJjA1vf0CFmQd+qICVsC0Gy/rA=
X-Google-Smtp-Source: ACHHUZ451Hg0h7LxyVUxgGDDfdr5c0xeDGJSxs/hD/VMfI+KjtNyLEUTIIJN1TQqyqx01htsdV4COg==
X-Received: by 2002:a17:907:60d6:b0:957:1df0:9cbf with SMTP id hv22-20020a17090760d600b009571df09cbfmr14373558ejc.19.1683653044511;
        Tue, 09 May 2023 10:24:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/27] libgpg-error: update 1.46 -> 1.47
Date: Tue,  9 May 2023 19:23:40 +0200
Message-Id: <20230509172344.1516743-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181079

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgpg-error/libgpg-error/pkgconfig.patch | 59 ++++++++++++++-----
 ...gpg-error_1.46.bb => libgpg-error_1.47.bb} |  4 +-
 2 files changed, 45 insertions(+), 18 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.46.bb => libgpg-error_1.47.bb} (92%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 75c1febc10f..3d886bcaa40 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -1,4 +1,4 @@
-From e10f93167c76c477a7b97286cfac603795bf28d8 Mon Sep 17 00:00:00 2001
+From b0df1cb468264a9bb9113524f0e1318c456b2348 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
@@ -14,17 +14,19 @@ Signed-off-by: Armin Kuster <akuster808@gmail.com>
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
 ---
- src/gpg-error.m4 | 165 +----------------------------------------------
- 1 file changed, 3 insertions(+), 162 deletions(-)
+ src/gpg-error.m4 | 192 ++---------------------------------------------
+ 1 file changed, 5 insertions(+), 187 deletions(-)
 
 diff --git a/src/gpg-error.m4 b/src/gpg-error.m4
-index a975e53..af4bf2f 100644
+index 7fa52b1..15a0859 100644
 --- a/src/gpg-error.m4
 +++ b/src/gpg-error.m4
-@@ -27,162 +27,12 @@ dnl is added to the gpg_config_script_warn variable.
+@@ -15,187 +15,14 @@
  dnl
- AC_DEFUN([AM_PATH_GPG_ERROR],
- [ AC_REQUIRE([AC_CANONICAL_HOST])
+ dnl Find gpg-error-config, for backward compatibility
+ dnl
+-dnl _AM_PATH_POSSIBLE_GPG_ERROR_CONFIG
+-AC_DEFUN([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG],[dnl
 -  gpg_error_config_prefix=""
 -  dnl --with-libgpg-error-prefix=PFX is the preferred name for this option,
 -  dnl since that is consistent with how our three siblings use the directory/
@@ -60,9 +62,14 @@ index a975e53..af4bf2f 100644
 -  fi
 -
 -  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
--  min_gpg_error_version=ifelse([$1], ,1.33,$1)
--  ok=no
+-])
 -
+-dnl
+-dnl Find gpgrt-config, which uses .pc file
+-dnl (minimum pkg-config functionality, supporting cross build)
+-dnl
+-dnl _AM_PATH_GPGRT_CONFIG
+-AC_DEFUN([_AM_PATH_GPGRT_CONFIG],[dnl
 -  AC_PATH_PROG(GPGRT_CONFIG, gpgrt-config, no, [$prefix/bin:$PATH])
 -  if test "$GPGRT_CONFIG" != "no"; then
 -    # Determine gpgrt_libdir
@@ -118,12 +125,9 @@ index a975e53..af4bf2f 100644
 -        fi
 -        if test -n "$gpgrt_libdir"; then break; fi
 -      done
--      if test -z "$libdir_candidates"; then
--        # No valid pkgconfig dir in any of the system directories, fallback
--        gpgrt_libdir=${possible_libdir1}
--      fi
--    else
--      # When we cannot determine system libdir-format, use this:
+-    fi
+-    if test -z "$gpgrt_libdir"; then
+-      # No valid pkgconfig dir in any of the system directories, fallback
 -      gpgrt_libdir=${possible_libdir1}
 -    fi
 -  else
@@ -137,12 +141,33 @@ index a975e53..af4bf2f 100644
 -      AC_MSG_NOTICE([Use gpgrt-config with $gpgrt_libdir as gpg-error-config])
 -      gpg_error_config_version=`$GPG_ERROR_CONFIG --modversion`
 -    else
+-      gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
 -      unset GPGRT_CONFIG
 -    fi
 -  elif test "$GPG_ERROR_CONFIG" != "no"; then
 -    gpg_error_config_version=`$GPG_ERROR_CONFIG --version`
 -    unset GPGRT_CONFIG
 -  fi
+-])
+-
+-dnl AM_PATH_GPG_ERROR([MINIMUM-VERSION,
+-dnl                   [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+-dnl
+-dnl Test for libgpg-error and define GPG_ERROR_CFLAGS, GPG_ERROR_LIBS,
+-dnl GPG_ERROR_MT_CFLAGS, and GPG_ERROR_MT_LIBS.  The _MT_ variants are
+-dnl used for programs requireing real multi thread support.
+-dnl
+-dnl If a prefix option is not used, the config script is first
+-dnl searched in $SYSROOT/bin and then along $PATH.  If the used
+-dnl config script does not match the host specification the script
+-dnl is added to the gpg_config_script_warn variable.
+-dnl
+-AC_DEFUN([AM_PATH_GPG_ERROR],[dnl
+-AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-AC_REQUIRE([_AM_PATH_POSSIBLE_GPG_ERROR_CONFIG])dnl
+-AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
+-  min_gpg_error_version=ifelse([$1], ,1.33,$1)
+-  ok=no
 -  if test "$GPG_ERROR_CONFIG" != "no"; then
 -    req_major=`echo $min_gpg_error_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
@@ -163,6 +188,8 @@ index a975e53..af4bf2f 100644
 -    fi
 -  fi
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
++AC_DEFUN([AM_PATH_GPG_ERROR],
++[ AC_REQUIRE([AC_CANONICAL_HOST])
 +  min_gpg_error_version=ifelse([$1], ,0.0,$1)
 +  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
    if test $ok = yes; then
@@ -187,7 +214,7 @@ index a975e53..af4bf2f 100644
      fi
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
-@@ -198,15 +48,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
+@@ -211,15 +38,6 @@ AC_REQUIRE([_AM_PATH_GPGRT_CONFIG])dnl
        fi
      fi
    else
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb
similarity index 92%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.47.bb
index e0f2d86303e..0f35fd95b20 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.46.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=d82591bc81561f617da71e00ff4a9d79 \
+                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=20f4cf5d81ea2fad18f6297500018654 \
                     file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7 \
                     "
 
@@ -20,7 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "b7e11a64246bbe5ef37748de43b245abd72cfcd53c9ae5e7fc5ca59f1c81268d"
+SRC_URI[sha256sum] = "9e3c670966b96ecc746c28c2c419541e3bcb787d1a73930f5e5f5e1bcbbb9bdb"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.30.2


