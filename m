Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.893.1605164550336510677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 23:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gsqOIJQf;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id f38so3405406pgm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 23:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ptf2hrKy3HHfFbta02Wd3j0ZsOnmDiz627m+YxltBgY=;
        b=gsqOIJQfnrDqR54lj2UdrjvZJmdXvGhmPvDVbId5Rba6nOaLkav9cb57aVNQHAidfO
         FED0NFcf6jRvGBvIb4co6OgB7lEwNLhk/5FCvAxl8UOp6S0S7LKe7ZnEjXhBud2Vy5Ll
         irzbZNu1zy7k+7Zk98UMdlF+oxVkrT3odzjz5Wc7AZhx9Rv0WW/mKp1L7bqiwcVUXppe
         W6dYEDHwP3OfKivbPbv0Eg1wAMewzpDuysFdhpNOsikkGgOHyx0cF3I9Np1Rl/BlFI3A
         QJpBQZZNhrKMmMMF4DeMp0jS4wI2Snt+4Z9m+Fu/9rd/PvD3tyUPT7hl3l8NbtXi1v5d
         86+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ptf2hrKy3HHfFbta02Wd3j0ZsOnmDiz627m+YxltBgY=;
        b=cSIfELilT6OOncHF++9BF4QEYqGHV113HeESQ4doIeOAV49LyEpkWMQitW7NLSqUxK
         ztcKcMc3lU5BXz9InkS9/YBnP+n3UUT0+uupC1nJfXfh2OcoQQ/JUxwW1EnE+Wg0nvkA
         KnqjcSSOtEyev0Ye/1sHbRGcTv2d6JsU7OE8tLdE7tCNzr/qrHu68bkp4Rrq71LitHfy
         Zb7c0zTwq6EkCNrDOw8C1sI+GbV4YUJvI9s/QVclpzh5a1pDWSkR/TYOGpEZE69i7BZP
         9jQ+KG7HE//J+7Xz0YNqQtNj5Kv91+eUkk9PKNo1OQNY9XUMPJ8o+sMnTfsHOoSj8QaT
         1jxg==
X-Gm-Message-State: AOAM5338HIwYxzmhnhiyaoNXFTfOmPOz5zokMBTeYyiKZZtoD0VlBy5S
	zRxwqgEUB1Go/d9w/HrRUmaLg3NM32nwVA==
X-Google-Smtp-Source: ABdhPJxuJVjJzQT6/w0Bn8RLixf4yRixPeBfdy8XipL8D479GOVPazxW1eKypwPBMjTqD0fY/na9Yw==
X-Received: by 2002:a17:90a:d584:: with SMTP id v4mr8298503pju.194.1605164549198;
        Wed, 11 Nov 2020 23:02:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v6sm4902554pff.83.2020.11.11.23.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 23:02:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] lrzsz: Use Cross AR during compile
Date: Wed, 11 Nov 2020 23:02:25 -0800
Message-Id: <20201112070225.3712508-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code hardcodes archiver to be 'ar' from build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mpilation-using-autoconf-detected-AR.patch | 36 +++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
new file mode 100644
index 0000000000..47c7ec4170
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
@@ -0,0 +1,36 @@
+From ecdcf0df6c28c65ca6d1e5638726e13e373c76c5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2020 22:58:55 -0800
+Subject: [PATCH] Fix cross compilation using autoconf detected AR
+
+currently its using 'ar' program from build host, which is not expected,
+we need to respect AR passed in environment
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.in | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index 4ddbe8b..b7c3c31 100644
+--- a/configure.in
++++ b/configure.in
+@@ -84,6 +84,13 @@ AC_ARG_ENABLE(syslog,
+ 	  ])
+ 
+ dnl Checks for programs.
++m4_ifndef([AC_PROG_AR],[dnl
++  AN_MAKEVAR([AR], [AC_PROG_AR])
++  AN_PROGRAM([ar], [AC_PROG_AR])
++  AC_DEFUN([AC_PROG_AR],
++  [AC_CHECK_TOOL(AR, ar, :)])
++])
++AC_PROG_AR
+ AC_PROG_CC
+ AC_PROG_GCC_TRADITIONAL
+ dnl AC_PROG_INSTALL  included in AM_INIT_AUTOMAKE
+-- 
+2.29.2
+
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 4129237c59..54c431eeb3 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
+           file://0001-Fix-cross-compilation-using-autoconf-detected-AR.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.29.2

