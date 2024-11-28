Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0296D6D24D
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 00:13:23 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.85338.1732752802626969629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 16:13:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UjwYftmd;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732752802; x=1764288802;
  h=from:to:cc:subject:date:message-id;
  bh=aez5O+xcjwIz1QHLvVA31N7qbjETpeJ5Tz5uh8lHEak=;
  b=UjwYftmdWzvL/7MpM6i7hXGtuaqZwUW7N1asKANMoCTOPRsxViNdXecW
   vvn0Yz8Ps8MhN1hmQsMJdPpG/bYGIgcA9SbbIV95vR6gN7UmZULE8EQzI
   rzOhPqhpNsqSlEHV4mQLZfK9WrBQdUKHEHTG5xyN9VZ6+Ftnby+w7HhH8
   YbJujZBrO91wsZiw7e7vQ5vwSvOaz3bGOrNklv7ZZfeVj/u25gtdBqVUN
   MsAKoRpFLPWtdIMGvfS0F1KbaYRuQIP6fjqsKzK/ywlXlcmJ+kwnIiKxw
   4cHMxToONwlH+cWH/H7gtWKt/DyyxABNTnIV5aCx6vZ1cVrIzRhajX14D
   g==;
X-CSE-ConnectionGUID: CE1pyzpISpCj5X6q46P/qQ==
X-CSE-MsgGUID: 4sFlSpI6SECS300zf1SH1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="160757587"
X-IronPort-AV: E=Sophos;i="6.12,190,1728918000"; 
   d="scan'208";a="160757587"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 09:13:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A443D6EA5
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 09:13:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2753F3FA2E
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 09:13:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D83120071A3B
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 09:13:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 299911A006C;
	Thu, 28 Nov 2024 08:13:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] libinput: upgrade 1.26.2 -> 1.27.0
Date: Thu, 28 Nov 2024 08:13:12 +0800
Message-Id: <1732752792-17403-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28824.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28824.003
X-TMASE-Result: 10--0.629000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CC7C2rJeUToWFHVj+6F+rIh6v
	THzpG6rCESVL06fzYO+y1zgRBtiWLr78SC5iivxwURSScn+QSXq0hbOeGOMG1+gtHj7OwNO0X9r
	pBZuBDbYPt1iu7tCDat0Q4QnGQ7/yWeb4zJaDeYmOl0JiSvnbIROW/4exC1cGOHce1DUpJzCXuR
	5K79ti1JPNcDpS+KQu4f2mmRoP8XPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 00:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207972

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://gitlab.freedesktop.org/libinput/libinput/-/releases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.26.2.bb => libinput_1.27.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.26.2.bb => libinput_1.27.0.bb} (95%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.26.2.bb b/meta/recipes-graphics/wayland/libinput_1.27.0.bb
similarity index 95%
rename from meta/recipes-graphics/wayland/libinput_1.26.2.bb
rename to meta/recipes-graphics/wayland/libinput_1.27.0.bb
index 6a96b0e14a..74705fa35f 100644
--- a/meta/recipes-graphics/wayland/libinput_1.26.2.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.27.0.bb
@@ -15,7 +15,7 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
            "
-SRCREV = "3402f380019dc4f882e1d8627029607aca3f4be6"
+SRCREV = "64d1f198fb2764dfb852a19becaf6f7f097fce2c"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
@@ -33,7 +33,7 @@ do_configure:append() {
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
 PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3 wayland-native"
-PACKAGECONFIG[tests] = "-Dtests=true -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,libcheck"
+PACKAGECONFIG[tests] = "-Dtests=true -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
-- 
2.34.1


