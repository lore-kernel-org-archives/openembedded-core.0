Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91CEC7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 08:32:42 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web10.18737.1751445152854157627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 01:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=aWwcErma;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751445153; x=1782981153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nS6k5dVUt4ToGuMr5XjLLfq2JU7rEQQynwBvlk5cYgc=;
  b=aWwcErma1sifUWik7JYE8BjhzGtE5KTCeyJgDdhPfSjQOmODuMFaTTLT
   5uanBq14Eh6N6E4BSLivpZ52NQzH46ZCw/IQ4tCtevYij4Sv0Oh3uSyk1
   NqdNqk37Y6IXCFkhZQWNUNDkKVzf4/TdVHCwQj0ZhhTkra4IsqOavVs5Y
   U=;
X-CSE-ConnectionGUID: cloe3WKiShelNDaPHN35sg==
X-CSE-MsgGUID: x29WdvtASH6gXxl/z89ZUA==
Received: from 160.46.252.38.spf.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 Jul 2025 10:32:33 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 02 Jul 2025 10:32:33 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 02 Jul 2025 10:32:27 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 10:32:27 +0200
X-CSE-ConnectionGUID: 1636mHwHRx+v14U7RrRKRw==
X-CSE-MsgGUID: jAqdhch1QM6jfY/C5fV1Yw==
X-CSE-ConnectionGUID: sEnjXZMvQYGRfUIJewUUpg==
X-CSE-MsgGUID: GYPjFPo0TOG7O5DZsIt+Dw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v3 4/7] libubootenv: Backport patch to support builds with CMake 4+
Date: Wed, 2 Jul 2025 10:31:45 +0200
Message-ID: <20250702083148.3035805-5-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702083148.3035805-1-Moritz.Haase@bmw.de>
References: <20250702083148.3035805-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18e.europe.bmw.corp (2a03:1e80:a15:58f::1:75) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219806

Commit [0] has been merged upstream, but there hasn't been a release containing it
yet.

[0]: https://github.com/sbabic/libubootenv/commit/cd12d9dd2bea8e4580f458df77229477fc55ba70

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---

changes in v3:
- Commit added to series

---

 ...Update-cmake_minimum_required-to-3.5.patch | 50 +++++++++++++++++++
 meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb  |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch

diff --git a/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch b/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
new file mode 100644
index 0000000000..ee174ca59e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libubootenv/0001-Update-cmake_minimum_required-to-3.5.patch
@@ -0,0 +1,50 @@
+From cd12d9dd2bea8e4580f458df77229477fc55ba70 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Wed, 14 May 2025 14:17:40 -0600
+Subject: [PATCH] Update cmake_minimum_required to 3.5
+
+This supports compilation with cmake-4.0.0.
+
+Fixes:
+CMake Error at CMakeLists.txt:5 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream-Status: Backport [cd12d9dd2bea8e4580f458df77229477fc55ba70]
+---
+ CMakeLists.txt     | 2 +-
+ src/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 796d7bc..0a11730 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ project (libubootenv C)
+
+ # The version number.
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index c56d0c7..3370232 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # SPDX-FileCopyrightText: 2019-2021 Stefano Babic <stefano.babic@swupdate.org>
+ #
+ # SPDX-License-Identifier:     LGPL-2.1-or-later
+-cmake_minimum_required (VERSION 2.6)
++cmake_minimum_required (VERSION 3.5)
+ # Sources and private headers
+ SET(libubootenv_SOURCES
+   uboot_env.c
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
index 35678e2361..b63b8ff87d 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
@@ -10,7 +10,9 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"

-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master"
+SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https;branch=master \
+           file://0001-Update-cmake_minimum_required-to-3.5.patch \
+           "
 SRCREV = "5507339628b5caf244e1ff9d58cb3fa534b16beb"

 inherit cmake lib_package

