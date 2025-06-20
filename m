Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B5DC7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 07:58:55 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web10.2676.1750406332027136541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 00:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=n2ExrX15;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=2599e2df9=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750406332; x=1781942332;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4mcPeO7ThdCQAR0AO3x63Sl/0PUdLmvhTYy8qRCPbFg=;
  b=n2ExrX15Me1LPeZBQKVNtd+1QGD6bQtXjsrCask6eAjZq3WEGOvvLjmy
   7NqpM9wmU2Sa8mw6q4hwnV+swf3qaPol4ivcgFH+Znue2L2N4RUCFL9Zv
   j+vNkIRkSAzlOl0tW/tDcACIUFhZICWAjIhLHBJ6Sw9pWNt+CH8hiU0aF
   w=;
X-CSE-ConnectionGUID: GLmIoKSgSGmjKKA4z7T8Zw==
X-CSE-MsgGUID: XMEeZAj6Qcehi52ID92sFA==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 20 Jun 2025 09:58:48 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 20 Jun 2025 09:58:48 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 20 Jun 2025 09:58:48 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.208) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 20 Jun 2025 09:58:48 +0200
X-CSE-ConnectionGUID: 4zffHAS8RiSfIPvjluUzgw==
X-CSE-MsgGUID: mJPbh6q6QxGkI0r+ijEUow==
X-CSE-ConnectionGUID: xexieb75RxCvhFlc+0mwbQ==
X-CSE-MsgGUID: NwSdfXVcRUGTiB1KELCQog==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] cmake: Ensure find_package() uses deterministic search order by default
Date: Fri, 20 Jun 2025 09:58:18 +0200
Message-ID: <20250620075818.3320026-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP12B.europe.bmw.corp (2a03:1e80:a15:58f::1:28) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 07:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219104

Historically, find_package() does not guarantee the order in which directories
matching a search path containing a glob expression are processed in - the
"first valid package" will be selected if there are multiple candidates. In such
cases, which package is chosen is completely random and can change, potentially
leading to build failures and reproducibility issues. This is rather unexpected
and confusing for developers.

Changing the default sort order and direction to natural sorting with a
descending order will result in the newest version of a library being picked in
case there are multiple ones available.

This commit backports a corresponding fix from upstream, which was accepted for
CMake 4.2 (see [0]). Documentation changes have been dropped, as have been
changes to tests that do not exist on CMake 3.31.6.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 ...-deterministic-search-order-by-defau.patch | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 9b1898f22f..a18a95233d 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,6 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch \
+           file://0001-find_package-Use-deterministic-search-order-by-defau.patch \
            "
 
 SRC_URI[sha256sum] = "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch b/meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch
new file mode 100644
index 0000000000..164f5c6428
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-find_package-Use-deterministic-search-order-by-defau.patch
@@ -0,0 +1,74 @@
+From fa3c5c6d914abfe7c8d3335eeddedd53518946be Mon Sep 17 00:00:00 2001
+From: Moritz Haase <Moritz.Haase@bmw.de>
+Date: Fri, 13 Jun 2025 13:41:50 +0200
+Subject: [PATCH] find_package: Use deterministic search order by default
+
+Historically, find_package() does not guarantee the order in which directories
+matching a search path containing a glob expression are processed in - the
+"first valid package" will be selected if there are multiple candidates. In such
+cases, which package is chosen is completely random and can change, potentially
+leading to build failures and reproducibility issues. This is rather unexpected
+and confusing for developers.
+
+Now that CMake has bumped its major version, it's a good time to change default
+sort order and direction to natural sorting with a descending order. That will
+result in the newest version of a library being picked in case there are
+multiple ones available.
+
+Upstream-Status: Backport [4.2.0 (planned), 61d8fae11655d3a2c4b8fd80af7a0d1d5f3e2f9f]
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
+---
+ Source/cmFindPackageCommand.h        |  8 ++++----
+ Tests/FindPackageTest/CMakeLists.txt | 13 ++++++++++++-
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/Source/cmFindPackageCommand.h b/Source/cmFindPackageCommand.h
+index 653e15f51faf84406e8c962207303852d1c8ad3e..478a0c6ff96d08afb01d5f056bc86372bdeae149 100644
+--- a/Source/cmFindPackageCommand.h
++++ b/Source/cmFindPackageCommand.h
+@@ -220,10 +220,10 @@ private:
+ 
+   class FlushDebugBufferOnExit;
+ 
+-  /*! the selected sortOrder (None by default)*/
+-  SortOrderType SortOrder = None;
+-  /*! the selected sortDirection (Asc by default)*/
+-  SortDirectionType SortDirection = Asc;
++  /*! the selected sortOrder (Natural by default)*/
++  SortOrderType SortOrder = Natural;
++  /*! the selected sortDirection (Dec by default)*/
++  SortDirectionType SortDirection = Dec;
+ 
+   struct ConfigFileInfo
+   {
+diff --git a/Tests/FindPackageTest/CMakeLists.txt b/Tests/FindPackageTest/CMakeLists.txt
+index 73d3fb4832203b4d4d10c9a4956546a1ad8be7fd..0a2186df562d302eb44d2e4046c42c96ed524f09 100644
+--- a/Tests/FindPackageTest/CMakeLists.txt
++++ b/Tests/FindPackageTest/CMakeLists.txt
+@@ -116,7 +116,7 @@ foreach(p ${PACKAGES})
+ endforeach()
+ 
+ # Enable framework and bundle searching.  Make sure bundles are found
+-# before unix-syle packages.
++# before unix-style packages.
+ set(CMAKE_FIND_FRAMEWORK LAST)
+ set(CMAKE_FIND_APPBUNDLE FIRST)
+ 
+@@ -579,6 +579,17 @@ IF (NOT "${SortLib_VERSION}" STREQUAL "4.0.0")
+ endif()
+ unset(SortLib_VERSION)
+ 
++
++set(SortLib_DIR "" CACHE FILEPATH "Wipe out find results for testing." FORCE)
++# Expected to default to 'NATURAL' and 'DEC'
++unset(CMAKE_FIND_PACKAGE_SORT_ORDER)
++unset(CMAKE_FIND_PACKAGE_SORT_DIRECTION)
++FIND_PACKAGE(SortLib CONFIG)
++IF (NOT "${SortLib_VERSION}" STREQUAL "3.10.1")
++  message(SEND_ERROR "FIND_PACKAGE_SORT_ORDER Default! ${SortLib_VERSION}")
++endif()
++unset(SortLib_VERSION)
++
+ unset(CMAKE_FIND_PACKAGE_SORT_ORDER)
+ unset(CMAKE_FIND_PACKAGE_SORT_DIRECTION)
+ set(CMAKE_PREFIX_PATH )

