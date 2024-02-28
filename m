Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D925C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8407.1709105591230505288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PSu9ciBe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105591; x=1740641591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=D6uyodL+S/6llS4pXk0bxVZVy+u4wfAKlw/+2FiXaQM=;
  b=PSu9ciBeH7a28tsPa87SeJXDkfRIppf7tFsbNXDFMoDs3LURXdzmMc66
   FgXiNrNcky3H3eTMYPqoHvoTUUvYvP0sDEb6MofW9scS0rYL+RRMxL6XD
   FiQkqkzMBr619afgUf3peRM3+NP+Se8YpxtGO/82LXM8NBIEhc2T76zPK
   TOAhS/hivKi/v+M9zHSRGWkIEe7oKl7kGwQgkgD9v2yBceYbMgV4YvxyS
   JMxxZW20lkSlEysmleWYZx5eBKZJF3NJ1JamProsn/etLkkatbw62lg4/
   /hNH6PwE8d8LpiIAqzAz8DpySE/1COELyKdZwdd++yQtcJLA/cOPqmftZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150677466"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150677466"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:08 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3ACBBA02A5
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7583339CEB
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED3EE2008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9740B1A006A;
	Wed, 28 Feb 2024 15:33:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/48] ccache: upgrade 4.9 -> 4.9.1
Date: Wed, 28 Feb 2024 15:32:09 +0800
Message-Id: <1709105575-24259-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-1.092800-10.000000
X-TMASE-MatchedRID: ZsQmnj20Xtajz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jPU1
	0nHva68PAtTxXUZNTOsZhYlwmZycXi01VXlcjcCUZj7E6vHnuNbYUDvAr2Y/15F+rde5r3PbSCD
	KnwjRqQ6qbnUbIrDbhcgmG/32DThgTPmZYEXmxpF+IrMF/hh/2JnaxzJFBx6vQo4DSHArlpFKdh
	nE+QtRzuArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslFIuBIWrdOeMz91mDYZLM5XbmU
	bkSsKD2HQPFz2EMgFAGFBbDeVn4hY23IKRZfddaA34KY0g5BTdN8rmPQRlvK1cZNuxCoduSEXou
	QwO8rUlbJcQH3furV3k48PxckV+kHxPMjOKY7A8PXo4gvwUD3S8z+bJ2nm9UKrauXd3MZDUMFsa
	+1wyh/FmwojXVWs38LVkok2bp/n4mA4/sg5WDVxI8JO9dwKl+jghPYR8etmFLh/Bcs3PEE2ex8Y
	8VQBxq06jfj+Doyr434PkguQb+Px0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjAK
	W7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196326

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
==========
- Improved detection of bad remote storage URLs gracefully. This also fixes
  crashes seen in ccache's own test suite. +
- Made caching completely disabled when modification of a source or include file
  is detected during ccache invocation. Previously this was only done for the
  direct mode. +
- Fixed a MSVC crash when using '/Zi' with many concurrent compilations. +
- Fixed a crash when '-arch' is the last compiler option. +

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ccache/{ccache_4.9.bb => ccache_4.9.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.9.bb => ccache_4.9.1.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.9.bb b/meta/recipes-devtools/ccache/ccache_4.9.1.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.9.bb
rename to meta/recipes-devtools/ccache/ccache_4.9.1.bb
index 8550470e3f..0d447c4915 100644
--- a/meta/recipes-devtools/ccache/ccache_4.9.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.9.1.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=11b0b581dd56bbac4f5de214d47927ca"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=9896d6f0aee4d89b9e5ff0afaae0af06"
 
 DEPENDS = "zstd"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-xxhash.h-Fix-build-with-gcc-12.patch \
            "
-SRC_URI[sha256sum] = "866b2223d59333640f0e7a003cbb85b32d9ca3c9445bd9e3cf142942e69dd3ec"
+SRC_URI[sha256sum] = "12834ecaaaf2db069dda1d1d991f91c19e3274cc04a471af5b64195def17e90f"
 
 inherit cmake github-releases
 
-- 
2.34.1


