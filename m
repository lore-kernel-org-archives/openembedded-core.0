Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.20434.1594649845870770658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WWQIiRZd;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id z5so6071929pgb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VHJDXV89EccuC8a29cT+1g8OzRq+Mv+PP8kOCrgynZo=;
        b=WWQIiRZd3iG5m/5/4kry7/KUk+zbkFuJZ8ZFr+KKafG3zu3UeFeIRVBC4oOpL9t5OJ
         NwNz/Y0EGJVsBIjTV4PhdkTurcTLluBpd7PACsl4fFR8sUAaBbmA1/XBDz9/P3XqdZch
         9w1tLJwVL6IA6Klqbhr012jz9SL/WQXt9GcbhCB7AmohEwEIepONJRVrurRa2Hi249Eb
         vsw3knIqnFbR1DienjYzvg2XVApG4CpBlmG5eNuGJVb1xktypmbej/OwBHpGptc+LeQZ
         ir8uYdH800KGvcGhLaq6u2BdMYZ9hVcEPTiH4cf12fyMF+6aquRpdn3yp0aVNCP2cy/2
         yghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHJDXV89EccuC8a29cT+1g8OzRq+Mv+PP8kOCrgynZo=;
        b=RXlyZiQ/4zf3Udy4swAV/TyS2pP/WI0Q2sHh1ZBD9YAGhjN2cQGvBGFjYhU3KTxaoj
         mcITxrDHpWq70FEnhGbXhahX6WUyHWDwhWocH2OiwNjv5EKfo/MYg7aukBT7L8yl5E8P
         pGa54ewT5bRpFenjMe9XkOSTopGIw003Pqd4S4+BB/hx0kvsNXY0BTf1LJr9iOaVTyEA
         zXd8RaxnxAoMQeUkMO1yYkyvXiStKR5zw64yP/LV7ETj5RHcMtxYgbOQ0ZJk3Yaoz51w
         GPylqnTWYLKg6oqNij/E5MBPf4b9ynRvf5FTFXAD4TmodTrRlQM8Sc9lnVX7dsMzNXwL
         iAvg==
X-Gm-Message-State: AOAM531C6om1n8h08fai8jTM7KfNnX4kGBu04ks97OFGLRvYT0nEezdQ
	O36R9gqX/knN070xMW9a4e9nBejyJnF4sw==
X-Google-Smtp-Source: ABdhPJxBDcWliUEY2TBqFsOGWcW9k/Iya9h+dgs553YoB1VHxg4ZbOGuWBgShv8udjDLKNWmVdQ9aA==
X-Received: by 2002:a62:2b85:: with SMTP id r127mr64945pfr.239.1594649844712;
        Mon, 13 Jul 2020 07:17:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/15] icu: make filtered data generation optional, serial and off by default
Date: Mon, 13 Jul 2020 04:16:50 -1000
Message-Id: <df4bfb154e7fce9645f5738aa04b3eb3ef5093fe.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Backported from master with two differences:

1. Move exit in do_make_icudata_class-target after big endian patch
application (not required for master since new upstream icu includes
the patch)

2. In do_install_append_class-target test for existence of .dat input
file before calling icupkg

icu data generation was found to be racy, and causig AB failures;
making it serial and leaving it on is not an option as it regresses
to several minutes.

The specific bug is that rules.mk has:

LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/gencnval -s . -d ./out/build/icudt66l mappings/convrtrs.txt

which creates a file and numerous rules like

LD_LIBRARY_PATH=../lib:../stubdata:../tools/ctestfw:$LD_LIBRARY_PATH  ../bin/genrb -s ./misc -d ./out/build/icudt67l -i ./out/build/icudt67l -k -q numberingSystems.txt

which quietly read it. There is no prerequisite for the former to complete first.

The race is extra complicated to fix as rules.mk is itself
generated through a custom in-tree python tool.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df89e8d1136fd406ba35ae573e2cb0cfc88c6aad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu.inc     | 4 +++-
 meta/recipes-support/icu/icu_66.1.bb | 6 +++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 6d9728903d..670cbedbcb 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -59,7 +59,9 @@ do_install_append_class-target() {
     # Use icupkg to re-generate it.
     if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
         rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
-        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+	if [ -f ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ]; then
+		icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+	fi
     fi
 	
 	# Remove build host references...
diff --git a/meta/recipes-support/icu/icu_66.1.bb b/meta/recipes-support/icu/icu_66.1.bb
index a8096c1840..08254648e4 100644
--- a/meta/recipes-support/icu/icu_66.1.bb
+++ b/meta/recipes-support/icu/icu_66.1.bb
@@ -40,11 +40,15 @@ UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
 
 EXTRA_OECONF_append_libc-musl = " ac_cv_func_strtod_l=no"
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[make-icudata] = ",,,"
+
 do_make_icudata_class-target () {
     cd ${S}
     rm -rf data
     cp -a ${WORKDIR}/data .
     patch -p1 < ${WORKDIR}/0001-Fix-big-endian-build.patch
+    ${@bb.utils.contains('PACKAGECONFIG', 'make-icudata', '', 'exit 0', d)}
     AR='${BUILD_AR}' \
     CC='${BUILD_CC}' \
     CPP='${BUILD_CPP}' \
@@ -56,7 +60,7 @@ do_make_icudata_class-target () {
     LDFLAGS='${BUILD_LDFLAGS}' \
     ICU_DATA_FILTER_FILE=${WORKDIR}/filter.json \
     ./runConfigureICU Linux --with-data-packaging=archive
-    oe_runmake ${PARALLEL_MAKE}
+    oe_runmake
     install -Dm644 ${S}/data/out/icudt${ICU_MAJOR_VER}l.dat ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat
 }
 
-- 
2.17.1

