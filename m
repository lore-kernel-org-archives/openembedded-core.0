Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AF6C5320E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.12770.1724136729110056358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nV6za5Dv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136729; x=1755672729;
  h=from:to:cc:subject:date:message-id;
  bh=EfQ7QHGp7UN7McD+8u1rj/M9/ZMH8wzq/GfAdXb0JhY=;
  b=nV6za5DvwMjAnujtCWSbk9sDBFH/poLx2dPgjEF58ffZ5P8Tv/h3iSV2
   nILJqIHX4CIBNvXxzVlRH5ob8SEcameRY/u5XmRLbJTWA2YppnJAoTseo
   dyr8z25+f9mccAiN54zVS5vQ0j49iZUsw+LDKeL/+yidyUftPozhE+toG
   Ts1D0YG8+TgrwSDycj9XtPmMHe5Eoxsb6+D0SV9i9VBXE//9zyqC1+qHY
   B2i2mLoyqXe1G/z3f24Qyvn3lK49djZewaIsWHjjnOdU+2ZK+slkvPV4n
   Y4IjP0jBuh3tpRoWbabbEmk46gj2D8DXLmkub8KuieHwMFL10yg/Z979a
   w==;
X-CSE-ConnectionGUID: 1qRlW+ACQT+VGAP4tRoZqg==
X-CSE-MsgGUID: MHauBnYzRH+B64rfEgkVJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171033268"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171033268"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:06 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64516CA1E5
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 93422D7487
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17E4720086124
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5A891A0002;
	Tue, 20 Aug 2024 14:52:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/24] binutils: upgrade 2.43 -> 2.43.1
Date: Tue, 20 Aug 2024 14:51:20 +0800
Message-Id: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.004
X-TMASE-Result: 10--4.266100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yQPZZctd3P4B4Pjj54kIW/E0EE1cHlv0zNb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7Vd6KzZKXMR2ETuctSpiuWyU2ZWOmuJUS2TM6TT9GLIG5AsS
	8vsKjoj14h7gdDyV0Vo+kBONaxbhAlPpop9nq2f1IcJTn2HkqsVvQxoz1O6zPRaXolgMyx3GsGH
	K/YO0c/+LzNWBegCW2oq1o0yfqNxkLbigRnpKlKZx+7GyJjhAU2C1hrfi+8S33yf34vDTZpmjwp
	y9KHqEO+kR/D3MLNoeUzwH7lO90qjsauyXjIfmucXkBpYbaY9TNwjDoMNU1f6R1V+5pJNeO7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203523

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../binutils/{binutils-2.43.inc => binutils-2.43.1.inc}     | 6 +++---
 ...s-canadian_2.43.bb => binutils-cross-canadian_2.43.1.bb} | 0
 .../{binutils-cross_2.43.bb => binutils-cross_2.43.1.bb}    | 0
 ...inutils-crosssdk_2.43.bb => binutils-crosssdk_2.43.1.bb} | 0
 ...utils-testsuite_2.43.bb => binutils-testsuite_2.43.1.bb} | 0
 .../binutils/{binutils_2.43.bb => binutils_2.43.1.bb}       | 0
 6 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.43.inc => binutils-2.43.1.inc} (95%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.43.bb => binutils-cross-canadian_2.43.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.43.bb => binutils-cross_2.43.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.43.bb => binutils-crosssdk_2.43.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-testsuite_2.43.bb => binutils-testsuite_2.43.1.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.43.bb => binutils_2.43.1.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.43.inc b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
similarity index 95%
rename from meta/recipes-devtools/binutils/binutils-2.43.inc
rename to meta/recipes-devtools/binutils/binutils-2.43.1.inc
index f6f6eb55a9..1ce19fbdc6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.43.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.43.1.inc
@@ -12,15 +12,15 @@ LIC_FILES_CHKSUM="\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.43"
-CVE_VERSION = "2.43"
+PV = "2.43.1"
+CVE_VERSION = "2.43.1"
 SRCBRANCH ?= "binutils-2_43-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 
-SRCREV ?= "2fbb863136724cfef2fc2f4c2b7f51be36f132c7"
+SRCREV ?= "beb2cdbcda911764b2bed5e57921fe90493260bd"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.43.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.43.bb b/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.43.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.43.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.43.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-testsuite_2.43.bb
rename to meta/recipes-devtools/binutils/binutils-testsuite_2.43.1.bb
diff --git a/meta/recipes-devtools/binutils/binutils_2.43.bb b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.43.bb
rename to meta/recipes-devtools/binutils/binutils_2.43.1.bb
-- 
2.34.1


