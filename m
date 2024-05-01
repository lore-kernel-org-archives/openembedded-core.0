Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA8DC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 06:17:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6320.1714544262771379755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 23:17:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K5/gwZkH;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41b21ed19f5so45253625e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 23:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714544261; x=1715149061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCCL51CFlkXqpEZAYVQGA3p0D9ibpZiyj4eBQd94Evg=;
        b=K5/gwZkH+tqoD1MiEF2cIScP+cCmgHDQaOSh6Fx8O3qbRneJ8HEd78qH/9Mhxvlgdp
         vHJLThCLaIIxMviyVPBgzvfDCXzjmc6YZG8CEFOb7YOhY9B/Hb0Kd39pF93DRI+3JXqi
         3ZlId3rkLzWQr2ky//axUJJvBHfIZUgZ43SghHSvbLopCQej1q6StEPcjbUORCAywWL1
         cLRVUniJokuKpKXD9mZC/HicZKeE/3efPVtIr4Mn99WUVidwG2xgIiZHgr6krjnTveUp
         wgikL3nscUys8oF5gKc9DhBAhCtywRcH6bqGMNQnKc4pUzCgsmXCS9v5lNGm/7N4/yG4
         dfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714544261; x=1715149061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCCL51CFlkXqpEZAYVQGA3p0D9ibpZiyj4eBQd94Evg=;
        b=iz8lJUhMV1q4Uq7Mh6tURyW+lEnoFvjFM2u8hFmllMVYrQl7e8oOyx/I/QrapNWU4F
         rBRaLpeYjI2M/nf+tO64zJt6pFgpdT558nV4I1oAxmlwDvgIqYqyEEq47h1dTlSa0+BD
         zSLvYW+wd47qWrpi+Ivf43g2qV5Dv3WbGn5wZgKtYNKqz6vjFneey1/szhUdodF7+mjS
         THZhFPrxQl/fW1PTC0M+zb9PuJ8s988J1jwCSuRrE5tOZI8R3n7dPvYKdVK2wtKRg6HY
         2w0OJ0ZyteDsjjKiLCD1C76b68Sf7qyhq5aD093jlfh/vbaA2H068mCXZkICe++gWhV+
         H7kA==
X-Gm-Message-State: AOJu0Yxvn4vpwDaT8hLyyMQkhmll2zxoRBSji7zACUTCne459kufRQ9y
	XJEN0rX/YmzWbogQePZLxkKHq3kp0FfHW+QWItnaJ0pxaz6wAQRd84mMv6P9
X-Google-Smtp-Source: AGHT+IHfGkrfqClp6HtX544Tr1uSRemWv3NcY5F750OKArImFwlLf2d6lYcSR0lCbqoYJQPg3cnt4A==
X-Received: by 2002:a05:600c:1914:b0:41c:73d:62fe with SMTP id j20-20020a05600c191400b0041c073d62femr1173379wmq.41.1714544260582;
        Tue, 30 Apr 2024 23:17:40 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b00418a6d62ad0sm1143218wms.34.2024.04.30.23.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 23:17:40 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] zip: Don't define NO_DIR
Date: Wed,  1 May 2024 08:17:36 +0200
Message-ID: <20240501061736.3738477-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 06:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198786

The build framework of zip adds -DNO_DIR to CFLAGS after
failing to link this piece of test code:

  int main() { return closedir(opendir(".")); }

However, zip does not take a case into account when it does not
need to link to an extra library for these functions.

When -DNO_DIR is used, the code in unix.c defines custom
opendir()/readdir()/closedir() functions in a way that GCC 14
chokes on.

GLIBC has both <dirent.h> and <sys/dir.h> and apps don't need
any extra library to link with.

Add a patch to remove the definition of NO_DIR.
Instead, use -DHAVE_DIRENT_H in the recipe.

Remove 0002-unix.c-Do-not-redefine-DIR-as-FILE.patch which
is now unnecessary.

This fixes the compiler error observed with GCC 14.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 -------------------
 .../zip/zip-3.0/dont-define-NO_DIR.patch      | 14 ++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  6 ++--
 3 files changed, 17 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch b/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
deleted file mode 100644
index a86e03e620..0000000000
--- a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 76f5bf3546d826dcbc03acbefcf0b10b972bf136 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 17:19:38 -0700
-Subject: [PATCH 2/2] unix.c: Do not redefine DIR as FILE
-
-DIR is already provided on Linux via
-/usr/include/dirent.h system header
-
-Upstream-Status: Inactive-Upstream
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- unix/unix.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/unix/unix.c b/unix/unix.c
-index ba87614..6e6f4d2 100644
---- a/unix/unix.c
-+++ b/unix/unix.c
-@@ -61,13 +61,11 @@ local time_t label_utim = 0;
- /* Local functions */
- local char *readd OF((DIR *));
- 
--
- #ifdef NO_DIR                    /* for AT&T 3B1 */
- #include <sys/dir.h>
- #ifndef dirent
- #  define dirent direct
- #endif
--typedef FILE DIR;
- /*
- **  Apparently originally by Rich Salz.
- **  Cleaned up and modified by James W. Birdsall.
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch b/meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch
new file mode 100644
index 0000000000..8528dbb55e
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inactive-Upstream [no upstream]
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+
+--- zip30/unix/configure~	2024-05-01 07:22:18.000000000 +0200
++++ zip30/unix/configure	2024-05-01 07:23:04.725337836 +0200
+@@ -604,8 +604,6 @@
+   done
+   if [ ${OPT} ]; then
+     LFLAGS2="${LFLAGS2} ${OPT}"
+-  else
+-    CFLAGS="${CFLAGS} -DNO_DIR"
+   fi
+ fi
+ 
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 70df5ab872..a548087545 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
-           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
+           file://dont-define-NO_DIR.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
@@ -32,8 +32,8 @@ CVE_STATUS[CVE-2018-13684] = "cpe-incorrect: Not for zip but for smart contract
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
 EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
-		'CFLAGS=-I. -DUNIX ${CFLAGS}' \
-		'CFLAGS_NOOPT=-I. -DUNIX ${CFLAGS}' \
+		'CFLAGS=-I. -DUNIX -DHAVE_DIRENT_H ${CFLAGS}' \
+		'CFLAGS_NOOPT=-I. -DUNIX -DHAVE_DIRENT_H ${CFLAGS}' \
 		'INSTALL=install' 'INSTALL_D=install -d' \
 		'BINFLAGS=0755'"
 
-- 
2.44.0


