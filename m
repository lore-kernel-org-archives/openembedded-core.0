Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429F4C4332F
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.7216.1651727152914044293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fWNNIJYb;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id m20so6526859ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iFm5oOs7HRA9QvKtVeKdgSM97H9V5WDKTRGw0NK0FGM=;
        b=fWNNIJYb+zq04EQ1SJhT86phTsbaVFuTHL7KFZihmBjz9zyJWWxSWS29d1XI1xb05m
         s8n/wue+ejuwBeYO3Aa4HzBfAYwO0+qqp6AfbFgyG5RfcTXGB18EZokcRptkQ60MopYD
         8FpYomm/H6FYtrgfSc/LtzT4NVxNM05QATH7sy3OKZHDGlgFIwlUUW3S665Gu3Zvebln
         GeFqBoLMtfb36bC3p8Z92DN5uNb1cO4ZcmsZBkG84T7dINO4VsYBt6npTLBoN0Hdpdhr
         he6kdr0yScazCUYzf7yju9otM2u4/TkrUeSnXYbuD4QtbVrGCS5pgWKak64HRS0yLfe3
         aoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iFm5oOs7HRA9QvKtVeKdgSM97H9V5WDKTRGw0NK0FGM=;
        b=KMWZiq8neO7QDjwj2rCGm8x2GAlXm7lD0oGiNWsOC+sDKDUC3UqqGz6mZlqViCyfYs
         a8Q9pgGFgB4/4ztr9EhMR3wDDQAjHNuNC46RkH8RRIFeGgEMOK+Oy2tRS4chLKEcPqbw
         AizOme6xA9fQzwnt7ZALZE4JBQOMxr3kDm+arF376fucZjdM0r7flsc/WQ5H/TQm8Afn
         hCT4x7+5FJkvYjxCA4+INLOJs7Db8LVOiAVYCQV3p4sbEyMc+f7oo9gdKV8lCJOGDhAX
         BOMgoPZzBcLB08kpexAkIetWNWN4NnVghffyqnDKXhRUhixiMIa2xgWZ4aO4ebnCMcnw
         2neA==
X-Gm-Message-State: AOAM533hwen84AYEud4UtiwynnesN52wnf18sYlJl/EvVwwdvBNHpToA
	hZfhk0CGF9aWfocbjYcagf21sjwWzVM=
X-Google-Smtp-Source: 
 ABdhPJzVjamzLTX80T7+Y2s7gGBrc3gZwGC4Do6nD2jVfrXrgltYtV4vhXylswBlDNcUSj6AhvN50w==
X-Received: by 2002:a17:906:2310:b0:6f3:dad4:e285 with SMTP id
 l16-20020a170906231000b006f3dad4e285mr23475309eja.9.1651727151490;
        Wed, 04 May 2022 22:05:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/61] libnl: upgrade 3.5.0 -> 3.6.0
Date: Thu,  5 May 2022 07:04:49 +0200
Message-Id: <20220505050544.651895-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165235

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...97f8982544c4fcb403893bae6701230d5165.patch | 48 +++++++++++++++++++
 .../libnl/{libnl_3.5.0.bb => libnl_3.6.0.bb}  |  7 ++-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
 rename meta/recipes-support/libnl/{libnl_3.5.0.bb => libnl_3.6.0.bb} (90%)

diff --git a/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch b/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
new file mode 100644
index 0000000000..02662c939e
--- /dev/null
+++ b/meta/recipes-support/libnl/files/fa7f97f8982544c4fcb403893bae6701230d5165.patch
@@ -0,0 +1,48 @@
+From fa7f97f8982544c4fcb403893bae6701230d5165 Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Fri, 15 Apr 2022 13:29:49 +0200
+Subject: [PATCH] build: avoid building check-direct with --disable-static
+
+"check-direct" needs to statically link with the libraries, because
+it wants to test internal ABI, which is hidden in the share libraries.
+When configuring with "--disable-static", static libs are not build
+and the test tool cannot be build.
+
+Just skip the test in that case.
+
+https://github.com/thom311/libnl/issues/306
+Upstream-Status: Backport [https://github.com/thom311/libnl/commit/fa7f97f8982544c4fcb403893bae6701230d5165]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Makefile.am  | 2 ++
+ configure.ac | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index a6bcf553..2f5e0dfc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -984,8 +984,10 @@ tests_check_all_LDADD = \
+ 	$(NULL)
+ 
+ if WITH_CHECK
++if ENABLE_STATIC
+ check_programs += tests/check-direct
+ endif
++endif
+ 
+ tests_check_direct_SOURCES = \
+ 	tests/check-direct.c \
+diff --git a/configure.ac b/configure.ac
+index 1f9ad0eb..0fd1cc0f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -107,6 +107,8 @@ else
+     AC_CHECK_LIB([pthread], [pthread_mutex_lock], [], AC_MSG_ERROR([libpthread is required]))
+ fi
+ 
++AM_CONDITIONAL([ENABLE_STATIC], [test "$enable_static" != "no"])
++
+ AC_ARG_ENABLE([debug],
+ 	AS_HELP_STRING([--disable-debug], [Do not include debugging statements]),
+ 	[enable_debug="$enableval"], [enable_debug="yes"])
diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-support/libnl/libnl_3.6.0.bb
similarity index 90%
rename from meta/recipes-support/libnl/libnl_3.5.0.bb
rename to meta/recipes-support/libnl/libnl_3.6.0.bb
index 41d7a9aed8..af3aa41040 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.6.0.bb
@@ -18,10 +18,10 @@ SRC_URI = " \
            https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://enable-serial-tests.patch \
            file://run-ptest \
+           file://fa7f97f8982544c4fcb403893bae6701230d5165.patch \
           "
 
-SRC_URI[md5sum] = "74ba57b1b1d6f9f92268aa8141d8e8e4"
-SRC_URI[sha256sum] = "352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa"
+SRC_URI[sha256sum] = "532155fd011e5a805bd67121b87a01c757e2bb24112ac17e69cb86013b970009"
 
 
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
@@ -54,6 +54,7 @@ RREPLACES:${PN}-genl = "libnl-genl2"
 RCONFLICTS:${PN}-genl = "libnl-genl2"
 
 RDEPENDS:${PN}-ptest += "libcheck"
+RRECOMMENDS:${PN}-ptest += "kernel-module-dummy kernel-module-bonding"
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'libcheck', '', d)}"
 
 # make sure the tests don't link against wrong so file
@@ -70,6 +71,8 @@ do_install_ptest(){
     # upstream are not running these tests in their CI pipeline
     # issue opened https://github.com/thom311/libnl/issues/270
     install -m 0755 tests/.libs/* ${D}${PTEST_PATH}/
+    # contains build paths
+    rm ${D}${PTEST_PATH}/*.la
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


