Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D6C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:15:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5658.1716369312207495819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b7J0Uvqa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369312; x=1747905312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LweIYDAnX5YdnIH1DEH9iRKDLsegz8ONtTEFswgsXVQ=;
  b=b7J0UvqaJlFW8mhbBOor0TvBr2g+VVWSBjeu3SGFuVq7v2G6SwxcoL1Z
   f4pxNN0W0/1uCmO8WMBSpN5fW4Lh+qHiQeqZNMdiufCdiyXaO3aLAkSm5
   oZZK4Bco6onlBW1Ce1UmE0bGcbMoZaegbfe0Kseo/mLDU9nFv+lPhUpF2
   KLw1iKmVoH728as06QY0LzIraDcUyk9lYDN73EB+DmCysAINoPMuWehHE
   B7WGsJLsKjj0hQ1sz/WIq+21r6xbAN7JCCGQa9e8xHioGWC7fEhEGdIf4
   cUJhM/Zj8dCnPukoWdAdUmA1cB65nS36b9cY2wlkYisjM/UU45RMJXxgj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="137912226"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="137912226"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 221D8CD7E4
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F5E2D6FF0
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE4C821D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 894931A000B;
	Wed, 22 May 2024 17:15:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/42] createrepo-c: upgrade 1.1.0 -> 1.1.1
Date: Wed, 22 May 2024 17:14:12 +0800
Message-Id: <1716369289-22526-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--1.884400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwlsQ9ktMX8f5U8
	xJRxYi7K2cnwS9FryRe2BqKkavKzeP2ss2sQcqTeA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnSdF2BUM0vdDytg73Zv02bdCok3ibXlQU50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKNnb2STbwOXCYpdzIbDX/Y5mRDVqDYOV7XJ2B0ZdL1V6jpu
	KYfaihwDsdvL+X14f9mE8gubafiVVolGd/06hbZpyZUFsvIQjxLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add detection of %posttrans and %pretrans scriptlet from rpm header
* Onboard packit tests
* Build ARM packages for all Python versions
* Fix minor bug w/ new API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_1.1.0.bb => createrepo-c_1.1.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.1.0.bb => createrepo-c_1.1.1.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.1.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.1.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.1.1.bb
index 1f97c99bde..e6714629af 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.1.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-include-rpm-rpmstring.h.patch \
            "
 
-SRCREV = "10a8a7af4f1de3f98a21a7d08fe3a46ef306d197"
+SRCREV = "78b0c3ff48bd58eb9c0a72879cf1025e9f225684"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


