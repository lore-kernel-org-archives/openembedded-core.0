Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B229C282D6
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.18100.1741079367632038070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SaOQmaCd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079368; x=1772615368;
  h=from:to:cc:subject:date:message-id;
  bh=IQBBfpE6/3t2dCxogrVlH3/GE6iFOKK2QaPlaq7vCrw=;
  b=SaOQmaCdTWPhpdEeu0+oZ2kP7SO5bBZamdb+aHui3eykLwvFSnu0Pm7I
   DJvFW2UqW1BfwVHKjTGlR1gaLB4DS4X6Qwwu2cy5lKtwIOX8THYLavPyk
   01qsth8uu0NNGU3pBfdXj2ZjMumK/cZizDB7YuBvvBYhmqEPOtaS94Vut
   itoaEXz8uRhSkCipla9trf6ztBK7EB9kD1zPUJExE9UZLzJJTQwSULyil
   V90MqDbbnPfaATJZ9j8gVenYG3hzl0xZRfOOvK5rblg0d3LhJjdcX90Zg
   PQHdYm2mQ5vwEkV4IVcWCo6UrYF/WjEeLAxPX5u+ovRSFvSuZRY/y8ku+
   Q==;
X-CSE-ConnectionGUID: hxezGzo4TQWMYgx8MTeeSA==
X-CSE-MsgGUID: hv9waXKdSius2KWCj6dMtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191934005"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191934005"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:25 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B4DAA96747
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78B16D5008
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF72F1A0071;
	Tue,  4 Mar 2025 17:09:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/31] bind: upgrade 9.20.5 -> 9.20.6
Date: Tue,  4 Mar 2025 17:08:46 +0800
Message-Id: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212228

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
New Features
--------------
- Adds support for EDE code 1 and 2.
- Add a rndc command to toggle jemalloc profiling.
- Add support for multiple extended DNS errors.
- Print the expiration time of the stale records.

Feature Changes
---------------
- Refactor reference counting in both QPDB and RBTDB.
- Shutdown the fetch context after canceling the last fetch.

Bug Fixes
----------
- Fix possible truncation in dns_keymgr_status()
- Recently expired records could be returned with timestamp in future.
- Yaml string not terminated in negative response in delv.
- Fix a bug in dnssec-signzone related to keys being offline.
- Apply the memory limit only to ADB database items.
- Avoid unnecessary locking in the zone/cache database.
- Fix EDE 22 time out detection.
- Split and simplify the use of EDE list implementation.
- Fix the cache findzonecut() implementation.
- DNSSEC EDE system tests on FIPS platform.
- Reduce the false sharing the dns_qpcache and dns_qpzone.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.20.5.bb => bind_9.20.6.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.5.bb => bind_9.20.6.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.5.bb b/meta/recipes-connectivity/bind/bind_9.20.6.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.5.bb
rename to meta/recipes-connectivity/bind/bind_9.20.6.bb
index abd2da5249..7a03f8598d 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.6.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "19274fd739c023772b4212a0b6c201cf4364855fa7e6a7d3db49693f55db1ab8"
+SRC_URI[sha256sum] = "ed7f54b44f84a7201a2fa7a949f3021ea568529bfad90fca664fd55c05104134"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


