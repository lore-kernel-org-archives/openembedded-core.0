Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.7177.1616065040946976857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 03:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s1KBRtFm;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id u4so6044234edv.9
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k1N+YmKuiOonz3MLmqoOG8oatWbzfzMzJvW6ypGFoJM=;
        b=s1KBRtFmtBqP0haHhoDC/zDcSbI6EHFls1RmCFiIn0rO2sJi4+t0nIocayaX69iDUf
         1xhl2OxDc2iBaUR2kggreVJv7SQr+Z4r4YyUne8Wswlwk1NpVbvO+C6ZxP2la09QT3+i
         UBXKIrN1LAiIa27KOobgyAjKLIxdLrOU61rCFJW8ayVZUXKdv8HIpBz0eG5vl7SkK2r4
         VWsIRAOo6g8QffhYms1hO1NrBpEnB2Z1RSZf38yPk1HNWjL6O7FvqxNYrcjfirCb02rj
         sNd10HUEMR04Er61sMvHCNKjheuaJPNZOCnw9GOnsyMjApWM6QxQah3VF590/fBDiwCQ
         Dhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k1N+YmKuiOonz3MLmqoOG8oatWbzfzMzJvW6ypGFoJM=;
        b=Q87XZyWmWON9oEqkyqNnBedTpkBBwDN6s32dM1Y7E6P1/LRwYuOG848qHFNbPQ/erU
         gUJK1t6XfZY1OMi+L1/APDi5Z8ogdmhBaRlS3tRkBoB4TLt/GeToVmmJ7G29tBfOOHL5
         TpaWouWfTPEbG8Fwe/1vdEAXp5DtIaqUtGJK17YE0l2QZkmidF5THgOlBGUy/+d5Z/T1
         eVHLqK28vI3+bpTIxqkIGQoALet2n0A+r6fZzHypY/+EopkFdfLE5CC2UFM+itZIhLyT
         CHXd52NWsG70tVvxXHeT1zEIwEwDnRDm5oQLNgt+e/IasEJFb3thI2arY0GYRl7IOySk
         xy0A==
X-Gm-Message-State: AOAM531vquRq3ZBz6xvu/jCeqlNCJQ+Nt+rMuvI7NYRSj573RKtnBdym
	OtZZplCoCo98ac7pZSMAgISzwKFrv0p2og==
X-Google-Smtp-Source: ABdhPJxmDrC3MAiCRBTeFTEayxhR/uaiKHlSVuOlX/Aara/o1Oit4rwHXI8iCcq4B8HDVGh3ayO1Lw==
X-Received: by 2002:a05:6402:1283:: with SMTP id w3mr2826352edv.340.1616065039154;
        Thu, 18 Mar 2021 03:57:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id b21sm1510191ejv.13.2021.03.18.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 03:57:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] libxcrypt: fix sporadic failures in nativesdk-libxcrypt-compat
Date: Thu, 18 Mar 2021 11:57:12 +0100
Message-Id: <20210318105712.545356-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e.ac-do-not-use-compute-symver-floor.patch | 32 +++++++++++++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch b/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch
new file mode 100644
index 0000000000..4e6b427104
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat/0001-configure.ac-do-not-use-compute-symver-floor.patch
@@ -0,0 +1,32 @@
+From b28bb856ccebe8fded51d11362bf5920699eed59 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Mar 2021 10:52:13 +0000
+Subject: [PATCH] configure.ac: do not use compute-symver-floor
+
+This script (newly introduced in 4.4.18) sporadically fails, without
+failing configure(), which has been reported at
+https://github.com/besser82/libxcrypt/issues/123
+
+Upstream-Status: Inappropriate
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 45b91b4..f3ba945 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -426,11 +426,7 @@ if test x$enable_shared != xyes; then enable_obsolete_api=0; fi
+ # need to be binary backward compatible with.
+ if test $enable_obsolete_api = 1; then
+   AC_MSG_CHECKING([minimum symbol version to use for compatibility symbols])
+-  SYMVER_FLOOR=$(
+-    $PERL ${srcdir}/build-aux/compute-symver-floor \
+-      ${srcdir}/lib/libcrypt.minver $host_os $host_cpu \
+-    2>&AS_MESSAGE_LOG_FD
+-  )
++  SYMVER_FLOOR=GLIBC_2.0
+   AC_MSG_RESULT([$SYMVER_FLOOR])
+   case "$SYMVER_FLOOR" in
+     ERROR)
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index e9f968b556..b5ca863d54 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=bd5d9777dfe7076c4f2928f12fed226a \
 
 inherit autotools pkgconfig
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
+           file://0001-configure.ac-do-not-use-compute-symver-floor.patch \
+           "
 SRCREV = "94d84f92ca123d851586016c4678eb1f21c19029"
 SRCBRANCH ?= "develop"
 
-- 
2.29.2

