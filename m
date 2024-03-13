Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34228C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.2036.1710351225062407259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SzMDteez;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-413ef6908ccso627175e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351223; x=1710956023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOYjFnOj8Gqv7ypaFANQp9uGWDtyNffpA9PfUj4JjxA=;
        b=SzMDteezW0vh75mp04n4O+6SVhUi0CzntFLeVRFWGlsIxdJgXzxTodYAcJkYiAQPCP
         Sa1ykN9QXoyQrFvP6WcA09psBRAoRlNz6SpykHfoOxW9dOvLy/iyHnfCYwfamaMptmUR
         yWgpBDOuuAo6HiU+ZuN7DwufzAWHMrDvL+o96SqnR6Hw8lu4vDt5YUl25WRxVGudUiyN
         45J0v212QAERaL7Y5z0Wtn7CcXgU49ytLnLyvLDAopASyBd9GstkVITt8/jqNc8F9AJZ
         mku08vPm5IWYIzgsiR1Y/I0Qrs2zvnIwGihrLz5U3ZUQ73DeWjQCgH3IjsehASRBiCaI
         EZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351223; x=1710956023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOYjFnOj8Gqv7ypaFANQp9uGWDtyNffpA9PfUj4JjxA=;
        b=XCGTPZxYbdvaaJWb8YAkt14bbeYckY1hPWJvAeNVZ71llPaa3l4a4X3znJ5iiWssyM
         6GbvVAHlPXI6D77cjLDq8f+hx9MaA1ccsTVAvdzw7waRU3HkAXrHUMbjbN9m2JWCANW1
         d33oZcmpyly1270/g6Y74gl9uG470CNEe1uTLw69j9hAdGdDDn/oNrPCBGrXmMtHtjVP
         qf5J2DZINEPOeI7Gu69Zq6MXB5OpedJzyKmDxxG/y3TpVl7LsTt0OR0l9KRp7tbu9Kvk
         syWtEM+z/7+izmrtEfpycUweqwXwkHQoVkqzUIH/tCi3HCxl4SXidg1CbwuAcTGstcRb
         251Q==
X-Gm-Message-State: AOJu0YzE66BeYPdrQt3+lrYZPupL/PdYG1XeLDd1LHulyl8SV6b9YP0L
	/QhZTVesobnCneVfb74FBYZCdhTKhOSikD6fGMnfKzkXsiCIC0VaKcfooQF2
X-Google-Smtp-Source: AGHT+IEPyZ9ALYCEhUvQ79OEzSeLjJa7dbmNR30VuVIqC3fFb0KZE3Io2cLvmf9AaCoJ0n0D5JRndA==
X-Received: by 2002:a05:600c:1994:b0:412:d2dd:4bdd with SMTP id t20-20020a05600c199400b00412d2dd4bddmr482776wmq.26.1710351223410;
        Wed, 13 Mar 2024 10:33:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/21] gptfdisk: update 1.0.9 -> 1.0.10
Date: Wed, 13 Mar 2024 18:33:21 +0100
Message-Id: <20240313173336.3900178-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197056

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...h-of-sgdisk-when-compiled-with-lates.patch | 46 -------------------
 ...to-deal-with-minor-change-in-libuuid.patch | 27 -----------
 ...01-Use-64bit-time_t-on-linux-as-well.patch | 32 -------------
 ...gptcurses-correctly-include-curses.h.patch |  5 +-
 .../fdisk/gptfdisk/popt-1.19-follow-up.patch  | 41 -----------------
 .../{gptfdisk_1.0.9.bb => gptfdisk_1.0.10.bb} |  6 +--
 6 files changed, 3 insertions(+), 154 deletions(-)
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch
 delete mode 100644 meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.9.bb => gptfdisk_1.0.10.bb} (77%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
deleted file mode 100644
index 095d00b1e21..00000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e7f9c9909c27d6ceed5aa4ca17023a1bc94b620a Mon Sep 17 00:00:00 2001
-From: Rod Smith <rodsmith@rodsbooks.com>
-Date: Fri, 15 Apr 2022 18:10:14 -0400
-Subject: [PATCH] Fix failure & crash of sgdisk when compiled with latest popt
- (commit 740; presumably eventually release 1.19)
-
-Upstream-Status: Backport [https://sourceforge.net/p/gptfdisk/code/ci/5d5e76d369a412bfb3d2cebb5fc0a7509cef878d/]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- NEWS     | 8 ++++++++
- gptcl.cc | 2 +-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/NEWS b/NEWS
-index c7add56..9e153fd 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,11 @@
-+1.0.10 (?/??/2022):
-+-------------------
-+
-+- Fixed problem that caused sgdisk to crash with errors about being unable
-+  to read the disk's partition table when compiled with the latest popt
-+  (commit 740, which is pre-release as I type; presumably version 1.19 and
-+  later once released).
-+
- 1.0.9 (4/14/2022):
- ------------------
- 
-diff --git a/gptcl.cc b/gptcl.cc
-index 34c9421..0d578eb 100644
---- a/gptcl.cc
-+++ b/gptcl.cc
-@@ -155,7 +155,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-    } // while
- 
-    // Assume first non-option argument is the device filename....
--   device = (char*) poptGetArg(poptCon);
-+   device = strdup((char*) poptGetArg(poptCon));
-    poptResetContext(poptCon);
- 
-    if (device != NULL) {
--- 
-2.35.5
-
diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
deleted file mode 100644
index f358081092e..00000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c640d9011a8330ebaad501784fb0ee1ce5e7a5ef Mon Sep 17 00:00:00 2001
-From: Rod Smith <rodsmith@rodsbooks.com>
-Date: Sat, 16 Apr 2022 09:32:04 -0400
-Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
-
-Upstream-Status: Backport [https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f/]
-Signed-off-by: Peter Bergin <peter@berginkonsult.se>
----
- guid.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/guid.cc b/guid.cc
-index 1e73ab7..d3e4fd5 100644
---- a/guid.cc
-+++ b/guid.cc
-@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
- void GUIDData::Randomize(void) {
-    int i, uuidGenerated = 0;
- 
--#ifdef _UUID_UUID_H
-+#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
-    uuid_generate(uuidData);
-    ReverseBytes(&uuidData[0], 4);
-    ReverseBytes(&uuidData[4], 2);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch
deleted file mode 100644
index 80e6f1bc9c9..00000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-Use-64bit-time_t-on-linux-as-well.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From cbdbabcc14e4ae4debcc64e41c0bb97d47b4eeef Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Dec 2022 12:50:07 -0800
-Subject: [PATCH] Use 64bit time_t on linux as well
-
-Alias 64bit version of stat functions to original functions
-we are already passing -D_FILE_OFFSET_BITS=64 in linux Makefile
-
-Upstream-Status: Submitted [https://sourceforge.net/p/gptfdisk/code/merge-requests/29/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- diskio-unix.cc | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/diskio-unix.cc b/diskio-unix.cc
-index 7780aeb..0897c56 100644
---- a/diskio-unix.cc
-+++ b/diskio-unix.cc
-@@ -37,8 +37,12 @@
- 
- using namespace std;
- 
--#ifdef __APPLE__
-+#if defined(__APPLE__) || defined(__linux__)
- #define off64_t off_t
-+#define stat64 stat
-+#define fstat64 fstat
-+#define lstat64 lstat
-+#define lseek64 lseek
- #endif
- 
- // Returns the official "real" name for a shortened version of same.
diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
index 266afbfa11a..011eec36f98 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correctly-include-curses.h.patch
@@ -1,17 +1,16 @@
-From 6bc6e867c5b3a774c0d7819ee5a3d2885e97caa9 Mon Sep 17 00:00:00 2001
+From 510d0d27f90dfb1c4afd0722580bb8a828b52b7f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 30 Mar 2020 17:11:19 +0200
 Subject: [PATCH] gptcurses: correctly include curses.h
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gptcurses.cc | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/gptcurses.cc b/gptcurses.cc
-index 71aa734..4ebfde1 100644
+index b476700..476fc43 100644
 --- a/gptcurses.cc
 +++ b/gptcurses.cc
 @@ -23,11 +23,7 @@
diff --git a/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch b/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
deleted file mode 100644
index c7fa965ec92..00000000000
--- a/meta/recipes-devtools/fdisk/gptfdisk/popt-1.19-follow-up.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
-From: Damian Kurek <starfire24680@gmail.com>
-Date: Thu, 7 Jul 2022 03:39:16 +0000
-Subject: [PATCH] Fix NULL dereference when duplicating string argument
-
-poptGetArg can return NULL if there are no additional arguments, which
-makes strdup dereference NULL on strlen
-
-Upstream-Status: Submitted [https://sourceforge.net/p/gptfdisk/code/merge-requests/28/]
-
----
- gptcl.cc | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gptcl.cc b/gptcl.cc
-index 0d578eb..ab95239 100644
---- a/gptcl.cc
-+++ b/gptcl.cc
-@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-    } // while
- 
-    // Assume first non-option argument is the device filename....
--   device = strdup((char*) poptGetArg(poptCon));
--   poptResetContext(poptCon);
-+   device = (char*) poptGetArg(poptCon);
- 
-    if (device != NULL) {
-+      device = strdup(device);
-+      poptResetContext(poptCon);
-       JustLooking(); // reset as necessary
-       BeQuiet(); // Tell called functions to be less verbose & interactive
-       if (LoadPartitions((string) device)) {
-@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
-          cerr << "Error encountered; not saving changes.\n";
-          retval = 4;
-       } // if
-+      free(device);
-    } // if (device != NULL)
-    poptFreeContext(poptCon);
-    return retval;
-
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
similarity index 77%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
index cf0a60a1a92..ba891931aca 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.10.bb
@@ -9,12 +9,8 @@ DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
-           file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch \
-           file://0001-Fix-failure-crash-of-sgdisk-when-compiled-with-lates.patch \
-           file://0001-Use-64bit-time_t-on-linux-as-well.patch \
-           file://popt-1.19-follow-up.patch \
            "
-SRC_URI[sha256sum] = "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
+SRC_URI[sha256sum] = "2abed61bc6d2b9ec498973c0440b8b804b7a72d7144069b5a9209b2ad693a282"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.39.2


