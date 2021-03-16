Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.6713.1615892525482318526
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 04:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uBtjcISZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 124-20020a1c00820000b029010b871409cfso1161802wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 04:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pC3z20bfJoqZSdenjoGTm6UWh6+hnQCsPFqkPwtVRzQ=;
        b=uBtjcISZt9bSy4RBEfLWhU3PkM6VZQ6+taLy2Jpj7LW/OG0LgogjmIBOwn0S5Qfd9Q
         p6bpxlW6APPBsvODQ8WDOuYfSWDNAGhm8UzdP0FFDUWxxa843UvEOwyj+xgOGxNeJSDC
         4PphuY1FKTy33v8iISPW21HDZIurQQ9RcBTefaWUPOY5MiNu4qpVC9LDDFSDds/e+X63
         SjMmrxp+gZAcO+kSQZCwV0fZPeCfgkhP3rAbb37i3cjqQYWue25jzB/KH+jMhwb0rrG2
         MimE3fPEVNelrbF6QiTYI0MRlsJrG0z0HRFmy0rX7VnRpUZ4WTzyEhZHfy0xI/vr2nzy
         NDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pC3z20bfJoqZSdenjoGTm6UWh6+hnQCsPFqkPwtVRzQ=;
        b=gMoItMT9iKqYD6FAzH4lPeG8FPIZqiFNtxnHWrvxU1Wh6+EyshdHW3RlaFKMCCfMWZ
         L35CRkDP5mEpGFIP+2AyV15ooIwEESzMCoo7lvg54c/QQx212en8MaS3AzF4JIY0iyd8
         9TRZDeDgoo5UT0MfmkGevUcIafl6J4HotAtFN1w9Q7UfkbedG+YsKEKnhldnASSXvs3C
         6XRvDjUhMCFnC6I9cZQZZm/7V6QSAmdfs6wXBsQyzR0/E8RpN6xwQK8KoR1aWQKlHqGo
         hP7s7fFrvVmtVIaYZ6TWYczIhHQN7y/llxgiCWHvd1pZkxqo+CP5Ge4NiANdsAZPPa5/
         XZeQ==
X-Gm-Message-State: AOAM532BGXbe19xLKKRX1sy/LB8pCOHKNFRip8KlXzd3Pnye4ygco/0m
	9Mjm5RiwTEVixbro/kDhwXTZOaJaZLU=
X-Google-Smtp-Source: ABdhPJzimGtPBHCNpVp4KmceSqZ75LBjTapd6yLHba/kGB8rUpZteoSVN7EwazAYnS/r5tu6gflHCw==
X-Received: by 2002:a1c:43c5:: with SMTP id q188mr4080321wma.94.1615892522855;
        Tue, 16 Mar 2021 04:02:02 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id f22sm2789910wmc.33.2021.03.16.04.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 04:02:02 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Subject: [PATCH] util-linux: backport patch to skip build of unused objects
Date: Tue, 16 Mar 2021 11:01:59 +0000
Message-Id: <20210316110159.1189143-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

util-linux-uuid does not need libtcolors.a and libcommon.a but
they get build regardless. Backport a patch from upstream to
skip them and save some compilation time.

https://github.com/karelzak/util-linux/commit/c65953d72bbc7412f32e566d9fa6e780d84f0696

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
autoconf is still the major bottleneck, but it's a tiny patch and it was
accepted upstream, so probably worth having even if it helps only a little

 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b4f817ed82..4031c586c9 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,5 +37,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
            "
 SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
diff --git a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
new file mode 100644
index 0000000000..9fe3c47d58
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
@@ -0,0 +1,40 @@
+Author: Luca Boccassi <luca.boccassi@microsoft.com>
+Description: Automake: use EXTRA_LTLIBRARIES instead of noinst_LTLIBRARIES
+ noinst_LTLIBRARIES causes the libraries to be always built
+ unconditionally. EXTRA_LTLIBRARIES causes them to be built
+ only if other build target needs them.
+ In other words, avoid building libcommon.a and libtcolors.a
+ unless they are needed by another library/executable and
+ save some build time.
+Upstream-Status: backport, commit:c65953d72bbc7412f32e566d9fa6e780d84f0696
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -39,7 +39,7 @@ bashcompletiondir = @bashcompletiondir@
+ 
+ dist_noinst_HEADERS =
+ noinst_PROGRAMS =
+-noinst_LTLIBRARIES =
++EXTRA_LTLIBRARIES =
+ usrbin_exec_PROGRAMS =
+ usrsbin_exec_PROGRAMS =
+ dist_man_MANS =
+--- a/lib/Makemodule.am
++++ b/lib/Makemodule.am
+@@ -9,7 +9,7 @@
+ # Note that you need "make install-strip" (or proper rpm / Debian build)
+ # to generate binaries with only relevant stuff.
+ #
+-noinst_LTLIBRARIES += libcommon.la
++EXTRA_LTLIBRARIES += libcommon.la
+ libcommon_la_CFLAGS = $(AM_CFLAGS)
+ libcommon_la_SOURCES = \
+ 	lib/blkdev.c \
+@@ -59,7 +59,7 @@ libcommon_la_SOURCES += lib/sysfs.c
+ endif
+ endif
+ 
+-noinst_LTLIBRARIES += libtcolors.la
++EXTRA_LTLIBRARIES += libtcolors.la
+ libtcolors_la_CFLAGS = $(AM_CFLAGS)
+ libtcolors_la_SOURCES = lib/colors.c lib/color-names.c include/colors.h include/color-names.h
+ libtcolors_la_LIBADD =
-- 
2.29.2

