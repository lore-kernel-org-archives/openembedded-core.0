Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B216D32D71
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:26:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.82446.1731403558699343182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aPZDbc3r;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403558; x=1762939558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Wshc9Jr1/wAqbzLmbEMgK8FAPFLD1hYdqDnhAzVfyNY=;
  b=aPZDbc3rZUXppDHplfu0P69s6qfKGxTQ8zdepH0YUwN3z4eMksNJkrWy
   /7tsIuEBaRGEywHXoMFG+6KrVuYqyAMo88vqPRS4R2kYIPDn77zgENTBj
   6/yjhFObMg4pysjjw6VAwMZZ5r/8J8UtwX89lNOu8eRzfm8YHF19jSGFV
   HuqmXCX2uF+p1O3A7IHSqQ1VjYcjAnaX09XMS8CT8N2+f+mK5yXoG+B+9
   EpXOrnaaXz8zRT0b8WH5hUoa+Vnr4bRL0ubp1c8mhhIumoqOXdjJFgHVP
   rNFkBh4ZvUpWzs/6b7MQyP94LHfkE4H5Iya+8slosDX87O0yo8nrDOIq9
   w==;
X-CSE-ConnectionGUID: pv6V1oPmSpaL4wCoUHpRyQ==
X-CSE-MsgGUID: uLl7toAdTMm6SLrSbkAE2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="167418295"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="167418295"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 595FD9674B
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EE6B528CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8140721FD63
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 304681A000A;
	Tue, 12 Nov 2024 17:25:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/47] seatd: upgrade 0.8.0 -> 0.9.1
Date: Tue, 12 Nov 2024 17:24:38 +0800
Message-Id: <1731403483-21399-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--3.148000-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mroIA9EE5IY7R+iSxt9FvgrTcp
	XpPCV0E3OQzI/xUtTVyhaSYOzA/KYE8HitdqBBn7Ss47mbT7SAQxXH/dlhvLv3d17Y6gGqDCY+I
	tXZ/PvrjS0+DEiI6pcKhF+bM402w/H8dePSFct0nfSQNpZkETVDeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2SL637QCIVpi8vc3EUpCmrWIKyp7CdRkYDsKXyzHgcEbQJMUEjEPPAqbKItl61J/yZ+in
	TK0bC9eKrauXd3MZDUMFsa+1wyh/CvDXtQoqCM+VBGZTDxKkp2N0bzzMmWlYc1fI5y+I7dv0BJv
	aVn2rZ8f5ae6bYK8k0YvTBbP6jw8qtLIof6XwAlnPiO1sKzH7x0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207029

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- libseat could end up not servicing seat enable/disable events if they
  were received immediately after a response, leading to the session
  deadlocking in a deactivated state.
- Some protocol strings lacked validation of the NULL termination
  requirement.
- libseat/seatd: Remove read_and_execute
- libseat/seatd: Read remaining events after processing responses
- libseat/seatd: Cleanup of request error handling
- libseat/seatd: Set EINVAL if target session is invalid
- libseat/seatd: Set backend error if poll fails
- seatd: Add validation of device path libseat/seatd: Add validation of seat_name
- seatd: Add strict message size comparison

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/seatd/{seatd_0.8.0.bb => seatd_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.8.0.bb => seatd_0.9.1.bb} (96%)

diff --git a/meta/recipes-core/seatd/seatd_0.8.0.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
similarity index 96%
rename from meta/recipes-core/seatd/seatd_0.8.0.bb
rename to meta/recipes-core/seatd/seatd_0.9.1.bb
index df5fe35f98..8da57acc56 100644
--- a/meta/recipes-core/seatd/seatd_0.8.0.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "3e9ef69f14f630a719dd464f3c90a7932f1c8296"
+SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.34.1


