Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.6.1586992713043467905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 16:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LASQHb21;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 2so683149pgp.11
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 16:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYHYDOPG3mI1XK9ZRnVRKrAtJ9W25Ynk7Xg//qiHm5c=;
        b=LASQHb21sasby2PbcboEmTSE1m/1UPLdFc4EbK4XeoqVyDMaMmd2SDJdlpxpfQoCxW
         9XGjgjRf9ofIrFAYtNukrxL2nHUrClT4CellJcOAPTLSF2eKAqLIUIifcmvJATeU5F41
         rAYvNQ94Tkqnm5DON+dMjURlhDstoJtJl1Yw9uec88ZcpeftiLpqRkNE9/vVqPhEUBMY
         3tHecjikxgFRfrFr6Kw1u91OBIxHPjRydZRbg+tqM6870cevDewa0uaQne2QjP+CMG/z
         nO+IA1d3gsr/XQ8jZHJrYVH24y5Y/TaerE1GE7nxY80EKHFjvSfnfKZ5X+DRVJV8105c
         PCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYHYDOPG3mI1XK9ZRnVRKrAtJ9W25Ynk7Xg//qiHm5c=;
        b=XaB5WnPATuVy1GTxqSgR6LvVdeYCU4RmtY4kjlzaV0n25I5jNJLASuIqHfnGtwQuDb
         NdyiWgqui/6YJ6+3yj4kPNRRBOyn02lSK+2yqX5MG4y6Am2v2eDOqzDO9/SJUzaWSd+W
         N8ciwltKnYO5hV9CmE4S6CuvzKylufJoPdTbUmWMRQi7O5fhC+vU2oNkF6L85oY6S+RE
         2IIkEH+VcCqsxn/4e2athPM1/w+bZuorj9r9Zf2XQBDZzBsZOUWPwqGXqr9EhmHj1McD
         nBNJLdNAc3Qljy468wZev/G5w75Ome1YZZZStEVfUUlu9PlDlEriOjWFUbXR+H78qtqX
         jmWg==
X-Gm-Message-State: AGi0Pubbce3e94c4CI/xyRmAWcpZGnNI2heUpGTl1It81SSAVzuLl0aR
	y6flQiC7O0yHkd9aI8VENLepeX58IfQ=
X-Google-Smtp-Source: APiQypLwVZQJqFUEKjJUFPTPSGR8cRwBj+SHULUJLLvH8m/Ey291CRAuIfjzjVe1KFZXO5XdC0m6IA==
X-Received: by 2002:a63:1210:: with SMTP id h16mr15827366pgl.328.1586992711950;
        Wed, 15 Apr 2020 16:18:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id a1sm14902161pfi.182.2020.04.15.16.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 16:18:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] gcc: Configure all gccs with --disable-install-libiberty
Date: Wed, 15 Apr 2020 16:18:27 -0700
Message-Id: <20200415231829.4090244-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OE uses libiberty from binutils, since its properly compiled as pic
archive and applications and other libraries needing libiberty can
properly link with it.

With this option applied, explicit delete of libiberty headers and
libraries is not required in install step, since they wont get installed
in first place.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.26.1

