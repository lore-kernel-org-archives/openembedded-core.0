Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BDCC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 08:32:32 +0000 (UTC)
Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web11.18707.1751445151382184809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 01:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ML3zNAbh;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=27128fcf3=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751445151; x=1782981151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dQFSPSZdCSQUCYA/HoubvQzeSi9d6vOo+ZZj/pe4l54=;
  b=ML3zNAbh9vbR1pSyofU/qAU3QrqPeagyGAI3SAvoN70Z9/xj55ftAOfo
   L4/QYLJjmAWqoX98xOuDQDWstKvWPz++sTmueNN3h3AWPPxLXud3qTOEZ
   WnaicNX5Wp5uVsgo4An8Cu1dg0dK/f72fGBd/mxVezgQuCTxRWPHvByU5
   E=;
X-CSE-ConnectionGUID: 8qgN/SzOSoSm4ajniKr7Hg==
X-CSE-MsgGUID: 3mx2WsMVSBqX7NJTjbL1Yg==
Received: from 160.46.252.35.spf.bmwgroup.com.bmwgroup.com (HELO esagw3.muc)
 ([160.46.252.35]) by esa4.hc324-48.eu.iphmx.com with ESMTP/TLS;
 02 Jul 2025 10:32:29 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw3.muc with
 ESMTP/TLS; 02 Jul 2025 10:32:29 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 02 Jul 2025 10:32:30 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Wed, 2 Jul 2025 10:32:29 +0200
X-CSE-ConnectionGUID: u3Ob+HauStC6w6YWLvY+uw==
X-CSE-MsgGUID: tXX/IE+qRoSlEQ5nqNH3sw==
X-CSE-ConnectionGUID: Z4O5eIS5RhmwjWgJyjzedg==
X-CSE-MsgGUID: EQ/RD7AcRCGIZjJPvDCZAQ==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v3 5/7] musl-locales: Add patch to support builds with CMake 4+
Date: Wed, 2 Jul 2025 10:31:46 +0200
Message-ID: <20250702083148.3035805-6-Moritz.Haase@bmw.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219804

PR [0] has been filed upstream, but isn't merged yet.

[0]: https://git.adelielinux.org/adelie/musl-locales/-/merge_requests/10

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---

changes in v3:
- Commit added to series

---
 ...red-CMake-version-to-3.5-to-allow-bu.patch | 41 +++++++++++++++++++
 meta/recipes-core/musl/musl-locales_git.bb    |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/musl-locales/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch

diff --git a/meta/recipes-core/musl/musl-locales/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch b/meta/recipes-core/musl/musl-locales/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
new file mode 100644
index 0000000000..0c085d6f1d
--- /dev/null
+++ b/meta/recipes-core/musl/musl-locales/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
@@ -0,0 +1,41 @@
+From bb2f4b18dcf3330340853ee60813ca42e857c814 Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Wed, 2 Jul 2025 08:37:21 +0200
+Subject: [PATCH] cmake: Bump required CMake version to 3.5 to allow builds
+ with CMake 4+
+
+This enables builds with CMake 4+, fixing:
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
+index c8ac5c4..5cca9b5 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
++cmake_minimum_required(VERSION 3.5)
+ project(locales C)
+-cmake_minimum_required(VERSION 2.8)
+
+ option(LOCALE_PROFILE "Install profile file setting the MUSL_LOCPATH environment variable" ON)
diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index c8510596cf..6086d80fbd 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -7,7 +7,9 @@ LICENSE = "MIT & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf5713fba707073020b1db2acaa73e78 \
                     file://LICENSE.MIT;md5=a4f1c6864a83ddf4b754cdab7d593523"

-SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main"
+SRC_URI = "git://git.adelielinux.org/adelie/musl-locales;protocol=https;branch=main \
+           file://0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch \
+           "

 PV = "1.0+git"
 SRCREV = "5663f5bfd30bf9e1e0ba3fc5fe2da6725969f30e"

