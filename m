Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCC4C83F04
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 13:27:46 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web10.22645.1751549263800290435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=MvFZs4z4;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=2724bd385=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751549265; x=1783085265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x/8OmNZpX5LtBYjUssT5442AAQ6RROILhOzAsMNnQJo=;
  b=MvFZs4z4hnHacpTI18i1MMW6fFkGIZNf35FAP1DgnheRhgK1zKiHCJC/
   Apdxsyp6u9yFMuL5mZpG+CApKkJbfUg02cy2mFClyCXjKeaciQXTYQ0ks
   B7bOj7vi50KP6XqIe7ZK+KgvjrAjmEyPAjfU5f+LHXDxiMo7UY8olVdVu
   o=;
X-CSE-ConnectionGUID: MAC/6yPJSK+wEie9x8fLQQ==
X-CSE-MsgGUID: UyBGftpSSImwrgc/T4XJXA==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Jul 2025 15:27:42 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw4.muc with
 ESMTP/TLS; 03 Jul 2025 15:27:42 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 03 Jul 2025 15:27:43 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Thu, 3 Jul 2025 15:27:42 +0200
X-CSE-ConnectionGUID: B2ttUBrrQ0qNZYOZquKI1A==
X-CSE-MsgGUID: ZUHWzsdHTV+T2m1cLJbYrg==
X-CSE-ConnectionGUID: vDlu0iHtRECmoob+CuEC4w==
X-CSE-MsgGUID: c0WbrxCyRdGkVU4pkeD49A==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v5 4/7] libubootenv: Backport patch to support builds with CMake 4+
Date: Thu, 3 Jul 2025 15:27:17 +0200
Message-ID: <20250703132720.3378569-5-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703132720.3378569-1-Moritz.Haase@bmw.de>
References: <20250703132720.3378569-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp09a.europe.bmw.corp (2a03:1e80:a15:58f::2029) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219883

Commit [0] has been merged upstream, but there hasn't been a release containing it
yet.

[0]: https://github.com/sbabic/libubootenv/commit/cd12d9dd2bea8e4580f458df77229477fc55ba70

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
changes in v5:
- None

changes in v4:
- Fix patch formatting

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

