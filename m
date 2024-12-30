Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD6DE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 05:23:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.57349.1735536195173484622
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 21:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rpsqogVZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735536195; x=1767072195;
  h=from:to:cc:subject:date:message-id;
  bh=LgknU2NBfEJnnbR4pClLMn3XKPBcyQ05y/Io7z23AaU=;
  b=rpsqogVZ0AJzvWqaHvBxK0Iv4+T6kyZvlS7fyuqb8gztlIfQ4DjxetWc
   +M6Y36zkbA8hXeNX9rO7apafzJPoAmDqvlxv4JOCMMLvSN42jAwoJFaXf
   3NIr1wCFdhcHL9P2x8PMPAw5KKDADMzwDnopgrmC+Wh0ohOTuUeHYSYF9
   hy8hqfPWuaaWUesMr/6twxL9dHa13A5h4lVBL1r7r1ZjabHacuiQHtFTY
   Fu9O6J2MNpT7Y1EF2yaMa8SMKt7YBrUTe4dAWb3Ze8WJpfH3fw7Ipf6UB
   m1w3/lGzbp5X1ItXaE4+pGMUhMi8Wded0yrzFNFhvSjLmtOX573cSO/ue
   g==;
X-CSE-ConnectionGUID: 32pLDx7bRLabYKuRleq14g==
X-CSE-MsgGUID: rOSByehRQ4+rSTu+N1R7Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185504078"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185504078"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 14:23:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57B7DD6EAA
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 14:23:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 243F5CFAAD
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 14:23:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92AF670BC3
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 14:23:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 190BA1A0003;
	Mon, 30 Dec 2024 13:23:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ncurses: Fix install conflict when enable multilib.
Date: Mon, 30 Dec 2024 13:23:03 +0800
Message-Id: <1735536183-2876-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--0.176400-10.000000
X-TMASE-MatchedRID: 80p/kUkQJqxaQiLka9EcSk7nLUqYrlslFIuBIWrdOeOjEIt+uIPPOKik
	NZqvbCsZ/fAfvqX0gn8x5mBHOkpls2463byk9FRi46cXaPycFZtw+iXdKA7ZI5fgq3BB/7ARntU
	3Lv5Rb/0vNUCPMwUWx6FNyFkMhLs7TnIqqZxiEuIK3Ma88LL+bn0tCKdnhB589yM15V5aWpj6C0
	ePs7A07Z5Vb9l0vnaPuBD++PCS1zCmYgfiTyolbniyGljHBlCKAhf0TWS5u7rFpTXJ4KMfR3dxp
	3/4GEOBxDqkECrXV7p4HyRHvEaNIK52RS7sgT1a8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 05:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209137

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 74 ++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index e96ee075bd..11d8fd7c3c 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -10,7 +10,7 @@ DEPENDS:class-native = ""
 BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config \
 	${bindir}/ncurses6-config ${bindir}/ncursesw6-config"
 
-inherit autotools binconfig-disabled multilib_header pkgconfig
+inherit autotools binconfig-disabled multilib_header pkgconfig multilib_script
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
 SRC_URI = "git://github.com/ThomasDickey/ncurses-snapshots.git;protocol=https;branch=master"
@@ -321,3 +321,75 @@ RRECOMMENDS:${PN}-libtinfo = "${PN}-terminfo-base"
 # each recipe specific sysroot. We can live without this, particularly
 # as many recipes may have native and target copies.
 SYSROOT_DIRS:remove = "${datadir}"
+
+MULTILIB_SCRIPTS = "${PN}-terminfo-base:${sysconfdir}/terminfo/a/alacritty \
+                    ${PN}-terminfo-base:${sysconfdir}/terminfo/x/xterm-256color \
+                    ${PN}-terminfo-base:${sysconfdir}/terminfo/x/xterm-color \
+                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty \
+                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty+common \
+                    ${PN}-terminfo:${datadir}/terminfo/a/alacritty-direct \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-16color \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-256color \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-base \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-direct \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-linux \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-vt100 \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-xf3x \
+                    ${PN}-terminfo:${datadir}/terminfo/k/konsole-xf4x \
+                    ${PN}-terminfo:${datadir}/terminfo/k/kterm \
+                    ${PN}-terminfo:${datadir}/terminfo/k/kterm-co \
+                    ${PN}-terminfo:${datadir}/terminfo/k/kterm-color \
+                    ${PN}-terminfo:${datadir}/terminfo/n/nxterm \
+                    ${PN}-terminfo:${datadir}/terminfo/r/rio \
+                    ${PN}-terminfo:${datadir}/terminfo/r/rio-direct \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen-bce.konsole   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen-bce.xterm-new   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen.konsole   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen.konsole-256color   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-256color   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-new   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-r6   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/screen.xterm-xfree86   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/scrt   \
+                    ${PN}-terminfo:${datadir}/terminfo/s/securecrt \
+                    ${PN}-terminfo:${datadir}/terminfo/v/vs100  \
+                    ${PN}-terminfo:${datadir}/terminfo/w/wezterm  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xgterm  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xiterm  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm+kbs  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm+nofkeys  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1002  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1003  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1005  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-1006  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-24  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-88color  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-8bit  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-basic  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-bold  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct16  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-direct2  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-hp  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-mono  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-new  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-nic  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-noapp  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-old  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-p370  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-p371  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-pcolor  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-r5 \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-r6 \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-sun  \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-utf8 \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-vt220 \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-vt52 \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-x10mouse \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-x11hilite \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm-x11mouse \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterm1 \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterms \
+                    ${PN}-terminfo:${datadir}/terminfo/x/xterms-sun "
-- 
2.43.0


