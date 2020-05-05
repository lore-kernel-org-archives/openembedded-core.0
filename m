Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.1476.1588648818605754076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pq0AqZUF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id y6so396637pjc.4
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sguMsjg7hRUo1iv1NTBgVEyjVhpt1XWkk4fhLYtD0FY=;
        b=pq0AqZUFhfeT829lMMHyyiUUAYg4lp0ttzr2Q1d8vGlnfvyPe5qyqOq5CdSSan9Ud7
         l244BbOnyneRisuTcZ0TE+fKj2jmvWeaRa5Tiex6nFYN5jkS0asHcnDl0Ol9Z8f/wDI9
         m08L7EOEp/g6KfAjjYRHOyl4LazRXCU4j3Ra/6ueIt/PWtjgVQfZr0oKdMVUUe3l/8tD
         UqoSoyhUbhKl3GlFU5EzcwrnX76GBXZFH+BOCBK3nmXzeUAxH2OgvtvJfEN3AF2THZFl
         CWurxbDtY7pRMYA1pd/aq6p86At8IC+DPDV/FxiG/ZL26tIdNbQqzovxiAj11qIQ8JHh
         cRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sguMsjg7hRUo1iv1NTBgVEyjVhpt1XWkk4fhLYtD0FY=;
        b=uHUvhReaRUL4Q7rGIxl0oeeyYrsMywTqdcQ7bBCLWqRnHxjsSRhvW1zUYU+eaT4C1r
         villYqYXAauP0yu+iYXkYaALodiLgK/2Cc+oC4gSyYlRQ69YY2mcg/1THs4QG4doGVu+
         pfVgLhZXeJS8TQtIZcaOloaipa8EYrxiRYs+zRmCXWpTdiHW+ILtJaOY4oOLxrBd75jR
         emCZiYj2cji/kdzfOizHvNbYui+THZVDOLVGKtLaSP6wOf6g8ei9rAG74aJwAcuul70E
         PemqkfJ8Z+Vy/tlAOXLr2Tw3lG2XR1I9PGS3bFd9LI/HJgYMXIWIHktUdyVjh98o7yl0
         Bwrg==
X-Gm-Message-State: AGi0PuZ6FqAcmmB5gte6GlEilnMTiXTNS/yF0REjTctr/1J7Pn60zvlI
	+kXXB2FSFaXi/gXbcdhqjif85mVlFKz2uQ==
X-Google-Smtp-Source: APiQypLe5+WahJic8RA2SC3i7V0JRdVeSr8rNqAAr1nAW9Td/yA+e/rDG/GecK2Ty746ik78rh+YHg==
X-Received: by 2002:a17:902:a60a:: with SMTP id u10mr813960plq.249.1588648817536;
        Mon, 04 May 2020 20:20:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/28] gcc: Configure all gccs with --disable-install-libiberty
Date: Mon,  4 May 2020 17:19:02 -1000
Message-Id: <b6f1def25cbb477549fad48e9586cef3ada2f9e5.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

OE uses libiberty from binutils, since its properly compiled as pic
archive and applications and other libraries needing libiberty can
properly link with it.

With this option applied, explicit delete of libiberty headers and
libraries is not required in install step, since they wont get installed
in first place.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 6 ------
 meta/recipes-devtools/gcc/gcc-cross.inc            | 4 ----
 meta/recipes-devtools/gcc/gcc-target.inc           | 4 ----
 4 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index bb4f6923f2..a64c4caf00 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -33,6 +33,7 @@ EXTRA_OECONF = "\
     --enable-libstdcxx-pch \
     --program-prefix=${TARGET_PREFIX} \
     --without-local-prefix \
+    --disable-install-libiberty \
     ${EXTRA_OECONF_BASE} \
     ${EXTRA_OECONF_GCC_FLOAT} \
     ${EXTRA_OECONF_PATHS} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 4aac345bec..553ef7fe62 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -108,12 +108,6 @@ do_install () {
 	# We don't care about the gcc-<version> copies
 	rm -f ${D}${bindir}/*gcc-?.?*
 
-	# We use libiberty from binutils
-	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
-	# Not sure where the strange paths come from
-	rm -f ${D}${libdir}/../lib/libiberty.a
-	rm -f ${D}${libdir}/libiberty.a
-
 	# Cleanup empty directories which are not shipped
 	# we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
 	# ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index c68cdd5dc4..6fa8c274cd 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -117,10 +117,6 @@ do_install () {
 	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
 
-	# We use libiberty from binutils
-	find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
-	find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
-
 	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
 }
 
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 34c1b2263b..8cb432780f 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -192,10 +192,6 @@ do_install () {
 	# We don't care about the gcc-<version> ones for this
 	rm -f *gcc-?.?*
 
-	# We use libiberty from binutils
-	find ${D}${libdir} -name libiberty.a | xargs rm -f
-	find ${D}${libdir} -name libiberty.h | xargs rm -f
-
 	# Not sure why we end up with these but we don't want them...
 	rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
 
-- 
2.17.1

