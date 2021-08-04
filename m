Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.12028.1628096420877301243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VUTwt/eo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id l18so3014853wrv.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=f28WasoYXAajPesKcsFKK0NKlMmMOFGVhSlqic10iJo=;
        b=VUTwt/eojdV3Dois+5Kb/f5XAaFy3SnLEJd2siROa72g9M6nrpsO4aFm+F+ompbryu
         YfDX8ox77xbfdViFRAlbehC0P+VofYHCpzFSjEcj7ZpLtz1ex8JDls56/uKxCWfLCDdy
         4kyrlkaBP8OaoHGRVybVAvz3ULDOHttI+5uSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f28WasoYXAajPesKcsFKK0NKlMmMOFGVhSlqic10iJo=;
        b=ckYS29zqvV3g/Wf5+HO4lp9hCz3Yrqg0SG5u4AcYk3F9JPPqD2kbDegiEA5bGrWW8s
         aU47Flg4cr4E4YBK2tyeblr3MAzjQ7UVp0/Fls3Z2H2vaGyyL6a+uJiaV+C4wngxCu/t
         5CVsKemflAyogipR5ZZgQwSbCQsThkjbq493iU8a7CgpcM0VcPC7n6yasr2TU5nBCApz
         2EYAw5YBYqb++TV+fKpW0yF9JBEfQW99eedNhY5SqEafvIw/E+4xk0V6m8dw/gYkyuoJ
         3BTyynhVNdNvnMzRHuRepdIiF/OcjOBzSJmQZznHmIs3SBOsdrB7DbxIbO6mc6XtvLSg
         wXww==
X-Gm-Message-State: AOAM530CSns/s3LCd5KrEej4PGVa74edrd0zpIzCNGj+rhEMZO8NzvZR
	ZFWmR2f63ry1Ab69OO0BLRCgb0GsVpNMMw==
X-Google-Smtp-Source: ABdhPJxbaGcmwZVTxB9P/6249K0tLmaOj7/jXFnsP5AdRtiaZRCFK9PCwqXuZqDX4dOa5Hh58rVs0Q==
X-Received: by 2002:adf:ec50:: with SMTP id w16mr388316wrn.56.1628096419410;
        Wed, 04 Aug 2021 10:00:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id s1sm6444221wmj.8.2021.08.04.10.00.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 10:00:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] strace: Upgrade 5.12 -> 5.13
Date: Wed,  4 Aug 2021 18:00:17 +0100
Message-Id: <20210804170017.3532883-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804170017.3532883-1-richard.purdie@linuxfoundation.org>
References: <20210804170017.3532883-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This includes changes to work with glibc 2.34.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../strace/strace/Makefile-ptest.patch                 | 10 +++++-----
 .../strace/{strace_5.12.bb => strace_5.13.bb}          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/strace/{strace_5.12.bb => strace_5.13.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 4cef0c0127f..9af77376626 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 205e7661822987825c7149ada4eefdc5368828ce Mon Sep 17 00:00:00 2001
+From 1f50e0a09d828be8f5b1f28db9af0b12492a1553 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -14,7 +14,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index b8efce8..fa9a1af 100644
+index 55566ee..a7ae6f9 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -16,6 +16,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -23,9 +23,9 @@ index b8efce8..fa9a1af 100644
  ARCH_MFLAGS =
 +TEST_SUITE_LOG = test-suite.log
  AM_CFLAGS = $(WARN_CFLAGS)
- AM_CPPFLAGS = $(ARCH_MFLAGS) \
- 	      -I$(builddir) \
-@@ -692,3 +693,22 @@ BUILT_SOURCES = ksysent.h
+ bundled_CPPFLAGS =
+ if USE_BUNDLED_HEADERS
+@@ -703,3 +704,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace_5.12.bb b/meta/recipes-devtools/strace/strace_5.13.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_5.12.bb
rename to meta/recipes-devtools/strace/strace_5.13.bb
index 24021f866d8..7d93f2da98d 100644
--- a/meta/recipes-devtools/strace/strace_5.12.bb
+++ b/meta/recipes-devtools/strace/strace_5.13.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "29171edf9d252f89c988a4c340dfdec662f458cb8c63d85431d64bab5911e7c4"
+SRC_URI[sha256sum] = "5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656"
 
 inherit autotools ptest
 
-- 
2.30.2

