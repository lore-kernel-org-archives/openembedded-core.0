Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E084C83F04
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 13:28:26 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web11.22526.1751549297623019367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=NBY8JgpY;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=2724bd385=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751549299; x=1783085299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FUSW2JIvTujg5IsEWRDfXarj51tis4cy78fvf3Nx2BU=;
  b=NBY8JgpYIKqfPF1nJSDSOfmqQSYnK6yW2CWvOYAQ7ok6g+0azrj1gEQe
   mjEwizQYzoMLoU8gZLJAcvCuJZJvOw4NlwucVKjymsATy/ByrX868SJ2Q
   LekWroQ9j7cjTgBKONptDTSesm8ioOfnptIfuzwur658MZDfXMOEjJ21C
   E=;
X-CSE-ConnectionGUID: QCn0MXIJRW6ECqRtcF42QA==
X-CSE-MsgGUID: p1AFnEAHSrurxWCiRMwtmw==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Jul 2025 15:28:16 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw1.muc with ESMTP/TLS;
 03 Jul 2025 15:28:16 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 03 Jul 2025 15:27:42 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Thu, 3 Jul 2025 15:27:42 +0200
X-CSE-ConnectionGUID: URv/PWd9RP+T76SpJV3CfQ==
X-CSE-MsgGUID: EJn+5+naThWwVZ7MsewAfQ==
X-CSE-ConnectionGUID: 80Tgr7CFRwWNR5AxwEOIJg==
X-CSE-MsgGUID: 5VBWeG2XQcmUkHZd4ci/8w==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v5] musl-locales: Add patch to support builds with CMake 4+
Date: Thu, 3 Jul 2025 15:27:18 +0200
Message-ID: <20250703132720.3378569-6-Moritz.Haase@bmw.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219887

PR [0] has been filed upstream, but isn't merged yet.

[0]: https://git.adelielinux.org/adelie/musl-locales/-/merge_requests/10

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
changes in v5:
- Updated patch based on upstream feedback

changes in v4:
- Fix patch formatting

changes in v3:
- Commit added to series
---
 ...01-cmake-Support-builds-with-CMake-4.patch | 46 +++++++++++++++++++
 meta/recipes-core/musl/musl-locales_git.bb    |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl-locales/0001-cmake-Support-builds-with-CMake-4.patch

diff --git a/meta/recipes-core/musl/musl-locales/0001-cmake-Support-builds-with-CMake-4.patch b/meta/recipes-core/musl/musl-locales/0001-cmake-Support-builds-with-CMake-4.patch
new file mode 100644
index 0000000000..d4d36eb522
--- /dev/null
+++ b/meta/recipes-core/musl/musl-locales/0001-cmake-Support-builds-with-CMake-4.patch
@@ -0,0 +1,46 @@
+From 89a314b03d0b2e600bb503a1e3d75faa655d65e0 Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Wed, 2 Jul 2025 08:37:21 +0200
+Subject: [PATCH] cmake: Support builds with CMake 4+
+
+CMake 4 has removed support for compatibility with CMake < 3.5 and thus builds
+fail with:
+
+    CMake Error at CMakeLists.txt:2 (cmake_minimum_required):
+      Compatibility with CMake < 3.5 has been removed from CMake.
+
+      Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+      to tell CMake that the project requires at least <min> but has been
+      updated to work with policies introduced by <max> or earlier.
+
+      Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+To ensure builds with older CMake versions are still possible, use the suggested
+'<min>...<max>' syntax instead of simply bumping '<min>'. To avoid a deprecation
+warning by CMake 3.31+, 3.10 was chosen as '<max>' instead of 3.5.
+
+While at it, move the 'cmake_minimum_required()' call before 'project()' to fix:
+
+    CMake Warning (dev) at CMakeLists.txt:2 (project):
+
+      cmake_minimum_required() should be called prior to this top-level
+      project() call.  Please see the cmake-commands(7) manual for usage
+      documentation of both commands.
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Submitted [https://git.adelielinux.org/adelie/musl-locales/-/merge_requests/10]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c8ac5c4..5744761 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
++cmake_minimum_required(VERSION 2.8...3.10)
+ project(locales C)
+-cmake_minimum_required(VERSION 2.8)
+ 
+ option(LOCALE_PROFILE "Install profile file setting the MUSL_LOCPATH environment variable" ON)
+ 
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index c8510596cf..3573a32062 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -7,7 +7,9 @@ LICENSE = "MIT & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
                     file://LICENSE.MIT;md5=a4f1c6864a83ddf4b754cdab7d593523"
 
-SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main"
+SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main \
+           file://0001-cmake-Support-builds-with-CMake-4.patch \
+           "
 
 PV = "1.0+git"
 SRCREV = "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"

