Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B83AC83F03
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 13:27:56 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web10.22645.1751549263800290435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 06:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=bABjwfJa;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=2724bd385=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751549266; x=1783085266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a9ErSrn6pG+GqX6j5PJJhJg4O3NW2GEVvd1Rf/uJWqU=;
  b=bABjwfJa3zz9Q7iAO9vhy9CReUvWl/EvZiwGFEbR7UH3g0DrOv0LaLy4
   wFrX/FoXpLPlQulHEyCo7H1ir6R9BTV7tDTV/t/np6EEbmbnfofoU7DZQ
   rpH6XEZjinpECpL7XYoiK5PRFC2CcNnv5EupoJpUQbYxy99YmXXGcJHsW
   Y=;
X-CSE-ConnectionGUID: MAC/6yPJSK+wEie9x8fLQQ==
X-CSE-MsgGUID: 7y+siFpOR4KGWDLcD4O6ow==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 03 Jul 2025 15:27:42 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw4.muc with
 ESMTP/TLS; 03 Jul 2025 15:27:42 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 03 Jul 2025 15:27:43 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Thu, 3 Jul 2025 15:27:42 +0200
X-CSE-ConnectionGUID: SU4kM76yQDiGUbM9LdyVNg==
X-CSE-MsgGUID: JQ4GuGxWT6i4q/NdtmJ9Cw==
X-CSE-ConnectionGUID: 0q/xQPhdT2+AFLXgtAlrlQ==
X-CSE-MsgGUID: vIPBmO2hRDWv7hFoWj0fbw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v5 6/7] libwpe: Add patch to support builds with CMake 4+
Date: Thu, 3 Jul 2025 15:27:19 +0200
Message-ID: <20250703132720.3378569-7-Moritz.Haase@bmw.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 13:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219884

PR [0] has been filed upstream, but isn't merged yet.

[0]: https://github.com/WebPlatformForEmbedded/libwpe/pull/136

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
changes in v5:
- None

changes in v4:
- Fix patch formatting

changes in v3:
- Commit added to series
---
 ...red-CMake-version-to-3.5-to-allow-bu.patch | 38 +++++++++++++++++++
 meta/recipes-sato/webkit/libwpe_1.16.2.bb     |  6 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch

diff --git a/meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch b/meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
new file mode 100644
index 0000000000..05688ee463
--- /dev/null
+++ b/meta/recipes-sato/webkit/libwpe/0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch
@@ -0,0 +1,38 @@
+From 7b227c7c1ac226498b1ea3987f87350d0f14f49f Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Wed, 2 Jul 2025 09:19:44 +0200
+Subject: [PATCH] cmake: Bump required CMake version to 3.5 to allow builds
+ with CMake 4+
+
+This enables builds with CMake 4+, fixing:
+
+    CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+      Compatibility with CMake < 3.5 has been removed from CMake.
+
+      Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+      to tell CMake that the project requires at least <min> but has been
+      updated to work with policies introduced by <max> or earlier.
+
+      Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+While at it, remove the extra call to 'cmake_policy()'. When passing the same
+version as to 'cmake_minimum_required()' it's not needed, as the latter calls
+the former automatically.
+
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+Upstream-Status: Submitted [https://github.com/WebPlatformForEmbedded/libwpe/pull/136]
+---
+ CMakeLists.txt | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index db9ae50..2a01daf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
+-cmake_policy(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5)
+
+ set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
+ include(VersioningUtils)
diff --git a/meta/recipes-sato/webkit/libwpe_1.16.2.bb b/meta/recipes-sato/webkit/libwpe_1.16.2.bb
index 324e2f213c..6cb6818acc 100644
--- a/meta/recipes-sato/webkit/libwpe_1.16.2.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.16.2.bb
@@ -10,9 +10,11 @@ inherit cmake features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-cmake-Bump-required-CMake-version-to-3.5-to-allow-bu.patch \
+           "
 SRC_URI[sha256sum] = "960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7"
 
 # This is a tweak of upstream-version-is-even needed because
-# ipstream directory contains tarballs for other components as well.
+# upstream directory contains tarballs for other components as well.
 UPSTREAM_CHECK_REGEX = "libwpe-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"

