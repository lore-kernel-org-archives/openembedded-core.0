Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE38CD342F
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18357.1725352394100647992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dY266XHl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352394; x=1756888394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qkmF64vm03bTTsR+OsnWM3SuCakRQjthR6a40RWDjJI=;
  b=dY266XHl730urAi1sUEwmUvRKmYOzgh66Epuzs4OeNjd03G/Lenk9gx0
   mrc7vHdEZUrJ0O8YuNxUVMl7bkm5aFCUxn90EpS1yDleOtebsVAA4znlb
   6b/wZhTIlM5ZgBMChyB9divbDWNxtbQm1AQTdnEu7qsXloY0dSbI5yI3g
   6l8pvmXB0EtvC9MKaE0gTpqLm49YrFTlqYy5U+2g+CR51SxSOhCIkF4Y7
   MQ7an/7AJHGtpOiDeC6E47lfalFaXwI4zeaW7u1MvRl7VfEHyS+I3bFmP
   igr0mOik5qbNiFAjtdCwtHbn4VvQLOGHoJCQSfkPQZ820msZMPq2NYYBK
   w==;
X-CSE-ConnectionGUID: s6wOsyt+RLSlgE9Vbn+mLA==
X-CSE-MsgGUID: 2VTtVi9xQYKbnJmCDwOjHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="159919347"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="159919347"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D28CD5A47
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C4169103F5
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4559220076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF6371A000C;
	Tue,  3 Sep 2024 16:33:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/22] dhcpcd: upgrade 10.0.8 -> 10.0.10
Date: Tue,  3 Sep 2024 16:32:40 +0800
Message-Id: <1725352379-20334-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--4.393300-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yXg2y0j5vXZGK2GKtdiFmTls1Ir4NZzFmrWO
	DdZ1PDmERexsVN65tZDWLWhvM11/A8+Glbxq/ZEkqhcdnP91eXEntGeqbHuvm0ENV4Lwnu7BLgL
	XxptMl/ykir3Xnjf1X29nhyLYbe7oVSxGzzbvSpdKzjuZtPtIBHuGDmHfznkCdh2Rg67LFVLvqg
	v197aVS6OasP4hSrb2EriUbUlPOKN/SV2AWgX87vx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkLKoU
	szL+VmmSjKdIDRt46fChX7yZL2LbIiceOuNnLyWOwpfLMeBwRvAQzqh8D4IY7V5fSMRD1zqyiCu
	+X+2rVpek2jN8tPoOH4dje2R46nwYDYgBcRN64p1e7Xbb6Im2n0tCKdnhB58hYfw868k05b3PDi
	XO/tFSfcUt5lc1lLg8TGYzM98Nm/WtIUFOhHOcPDisQQmddYbGB4m7yFL5/vgIcg6/ymnpd6a1i
	okTLYz5xJDj0UE2n7rH/kozFrqpwVq+VOAnSex7s3kSX+ZBjZLv5Eyr/YIrqsDhztRXZ9Cm+LY9
	A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204130

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
refreshed for 10.0.10

Changelog:
==========
- configure: add --enable-ntp
- Force dumplease to parse stdin
- holmanb authored and rsmarples committed
- Improve and document prior.
- linux: Prefer local over address when both in netlink RTA
- IPv6: DUPLICATED could be announced by RTM_DELADDR
- Fix prior patch which might also fix #333
- IPv6: Delay for LL address before delay for start
- IPv6: make more readable (nfc)
- DHCP6: Don't remove delegated prefix addresses on start or fail
- privsep: Sweep ELE_ERROR away for BPF
- DHCP6: Add commentary around why we read leases
- linux: allow roaming without IFF_DORMANT
- DHCP: Remove an assertation in get_lease if ia is NULL
- DHCP6: Persist configuration on confirm/rebind failure
- DHCP6: Don't remove state in DISCOVER
- IPv4LL: Restart ARP probling on address conflict
- DHCP: Handle option 108 correctly when receiving 0.0.0.0 OFFER
- taoyl-g and rsmarples committed on Jul 25
- DHCP: No longer set interface mtu
- IPv4LL: If we are not configuring, abort if address does not exist
- IPv4LL: Harden the noconfigure option.
- DHCP6: Remove the dhcp6_pd_addr packed struct
- Update privsep-linux.c to allow statx

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.0.8.bb => dhcpcd_10.0.10.bb}       | 4 ++--
 ...hcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 7 +++----
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch | 9 ++++-----
 3 files changed, 9 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.8.bb => dhcpcd_10.0.10.bb} (94%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
similarity index 94%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
index 43de279cfd..0ae9db911c 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.8.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.10.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "dhcpcd runs on your machine and silently configures your \
 HOMEPAGE = "http://roy.marples.name/projects/dhcpcd/"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ba9c7e534853aaf3de76c905b2410ffd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d296c4bec306f351e676705aaf237c8c"
 
 SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=master \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "a15ba1987c264eaa06c2655ddd0891aa5ac48c09"
+SRCREV = "ab5ec18e755c1bb450c74d3a4657ea48d0f7f314"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 461d04bd1d..b958110ef1 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From 5d5ba8a2b8010db6bee68bd712f829cb737c9ac1 Mon Sep 17 00:00:00 2001
+From 1115784dfdf2e7095cf599f9becef705ac57f80e Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -24,16 +24,15 @@ versions.
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
-
 ---
  src/dhcpcd.8.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 93232840..09930a31 100644
+index 04bf7d90..9cf10d24 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
-@@ -824,7 +824,7 @@ Configuration file for dhcpcd.
+@@ -826,7 +826,7 @@ Configuration file for dhcpcd.
  If you always use the same options, put them here.
  .It Pa @SCRIPT@
  Bourne shell script that is run to configure or de-configure an interface.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index c54942be4b..8890c2d7dc 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From ec9fc4e6086e1dbe0ac2f94a8a088a571596a581 Mon Sep 17 00:00:00 2001
+From 69babef33b0ee4c60d8821797777b9affedd47da Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -6,13 +6,12 @@ Subject: [PATCH] remove INCLUDEDIR to prevent build issues
 Upstream-Status: Pending
 
 Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
-
 ---
  configure | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index 5237b0e2..7220718b 100755
+index 1a772b02..0f915b39 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=
@@ -23,7 +22,7 @@ index 5237b0e2..7220718b 100755
  DEBUG=
  FORK=
  STATIC=
-@@ -86,7 +85,6 @@ for x do
+@@ -89,7 +88,6 @@ for x do
  	--mandir) MANDIR=$var;;
  	--datadir) DATADIR=$var;;
  	--with-ccopts|CFLAGS) CFLAGS=$var;;
@@ -31,7 +30,7 @@ index 5237b0e2..7220718b 100755
  	CC) CC=$var;;
  	CPPFLAGS) CPPFLAGS=$var;;
  	PKG_CONFIG) PKG_CONFIG=$var;;
-@@ -343,9 +341,6 @@ if [ -n "$CPPFLAGS" ]; then
+@@ -346,9 +344,6 @@ if [ -n "$CPPFLAGS" ]; then
  	echo "CPPFLAGS=" >>$CONFIG_MK
  	echo "CPPFLAGS+=	$CPPFLAGS" >>$CONFIG_MK
  fi
-- 
2.34.1


