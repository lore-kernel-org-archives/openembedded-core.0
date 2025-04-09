Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A43BC36010
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 02:25:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.12975.1744165512435641256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 19:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S1ZUh/Ez;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744165512; x=1775701512;
  h=from:to:cc:subject:date:message-id;
  bh=eB2PoI/3N0eE2x2nJcpkI99+L2BEbLsXLEN29U5pF+A=;
  b=S1ZUh/EzT5CfOR64hk1YBSaYp1Eo+PtGYdj1oHek3Nc0bdANLMFSdGWT
   LI2Ld9IzYJYt19Jh2baAtEMhuEoPqLRGhdZ0eQprwKgUmFTLmFDt94poM
   yz0nQ3Z2A10xAjniA634k/CDbUoT7iWFHKthVa9Pq/mKEBUEoqdJA+MZl
   mjsCsdj9q5rz05re1ZoXpHNUD94Xv1wcHiSPXBuRkgKABMLquGe6ej2VO
   WUnf9g9HOFIfTM78U3XHHz8of1yamVGwYqLwDQPom43L4mgmlZhmHX1IU
   3nocusYV/cTakFwW7wJSAQlQk4g0HjrpIT84MU9xv6DZAsuNEgyZt4u7Q
   Q==;
X-CSE-ConnectionGUID: +tI+PF8FS+6exeop6CZtZw==
X-CSE-MsgGUID: LgTBvMWkQMm1n584UzIrcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="184246563"
X-IronPort-AV: E=Sophos;i="6.15,199,1739804400"; 
   d="scan'208";a="184246563"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 11:25:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2C2FE8525
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:25:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96CDE158F6
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Apr 2025 11:25:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED0811A009A;
	Wed,  9 Apr 2025 10:25:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cmake: Avoid using undocumented type for CURLOPT_NETRC values
Date: Wed,  9 Apr 2025 10:25:01 +0800
Message-Id: <1744165501-4308-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 02:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214570

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/cmake/cmake.inc         |  1 +
 ...ng-undocumented-type-for-CURLOPT_NET.patch | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index b3cc10ae02..9b1898f22f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,6 +18,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
+           file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch \
            "
 
 SRC_URI[sha256sum] = "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch b/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
new file mode 100644
index 0000000000..c719c1fdfb
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
@@ -0,0 +1,30 @@
+From c608975f4490f67872926f2601e5c37f2e570307 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 9 Apr 2025 01:40:46 +0000
+Subject: [PATCH] cmCurl: Avoid using undocumented type for CURLOPT_NETRC
+ values
+
+Fix: nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:26: error: invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fpermissive]
+Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/merge_requests/10449/diffs?commit_id=1b0c92a3a1b782ff3e1c4499b6ab8db614d45bcd]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ Source/cmCurl.cxx | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/cmCurl.cxx b/Source/cmCurl.cxx
+index b9133ed7..0cf8a71a 100644
+--- a/Source/cmCurl.cxx
++++ b/Source/cmCurl.cxx
+@@ -170,7 +170,7 @@ std::string cmCurlSetNETRCOption(::CURL* curl, const std::string& netrc_level,
+                                  const std::string& netrc_file)
+ {
+   std::string e;
+-  CURL_NETRC_OPTION curl_netrc_level = CURL_NETRC_LAST;
++  long curl_netrc_level = CURL_NETRC_LAST;
+   ::CURLcode res;
+ 
+   if (!netrc_level.empty()) {
+-- 
+2.43.0
+
-- 
2.43.0


