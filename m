Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0A2CFB45C
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9170.1728452975624109127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ts8cK7rr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452979; x=1759988979;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ejk4v5c466ZUGRPYQLvkoNWMY81wfUqamBEc+ueBUuQ=;
  b=Ts8cK7rrT7ApMmkxVh1tgHlxJMD5gntCzG+vssjNLiU26Y1tXWb5/nbV
   kjWKlISTMmAKoKv65fTGrZc76bh6W93MOBpYw93qs8oYHy0bnFDy+pO2D
   ynx035J+ltxh2r/YDk90OVy4n8oe+sUgGdYqoJjbwXH7NxMaTajwmAdyY
   8eNh5qukUgnz5wvy7UKD+gMtkRz6Sph2Yz+jAYxuyu87LouhICFKesH5w
   ZA4OBYstXg/DJvj/HowXnOq4+ZYM1j3/xqz0d648O3GFAnKpiiuknyq2d
   WIFSwkx5ivQ4DirtT45mlwLAr7ZnNDRC44VRs9B3iu1y5OsfwVjHz5/XZ
   w==;
X-CSE-ConnectionGUID: ea1pltdeRFmDjoyz5w58lw==
X-CSE-MsgGUID: 2MFP3Xt1R36VQMkmLinv3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176428862"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176428862"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DCCBD8008
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C2571D5406
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E83740B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0A6211A000A;
	Wed,  9 Oct 2024 13:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/26] msmtp: upgrade 1.8.26 -> 1.8.27
Date: Wed,  9 Oct 2024 13:49:01 +0800
Message-Id: <1728452955-25051-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--1.990900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzp8huOh4jh++LS
	dVP2tZn5F8pwMane83qay7rv659o0Pc2FOs5RCDbP0HVIeixJdA3l2plwgrtWMC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4rhX/lUQGcew0Dg2p0ztpjQDfgpjSDkFNwKA9ZJkcOhmmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLR3iHwyKrsr3+6BG2zAbAaI3J0y0/1o2feKAcYwDmzvBWFF
	RiDyF1ym5cQqJzkh32Z+479lg9orszCp/9kpvHJCMEh7zv0akBLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205322

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add a testing infrastructure ('make check')
- Many improvements in the msmtpq script
- Many improvements to the vim scripts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.26.bb => msmtp_1.8.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.26.bb => msmtp_1.8.27.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.26.bb b/meta/recipes-extended/msmtp/msmtp_1.8.27.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.26.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.27.bb
index 13820fe930..3f10be9f5e 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.26.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.27.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6cfc488344cef189267e60aea481f00d4c7e2a59b53c6c659c520a4d121f66d8"
+SRC_URI[sha256sum] = "94030580a63a747faa0a3b9b1b264ae355aad33a4d94b832bfeb5b21633c965e"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.34.1


