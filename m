Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02506C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8737.1724833609524175870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D+fMApi7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833610; x=1756369610;
  h=from:to:cc:subject:date:message-id;
  bh=NH+V48+WZ29ZmbI7sCI2PIArqiDU7FnRurM/GGjZg8g=;
  b=D+fMApi7nvixFR8TPE3a+RAuSFxYfM8vhVY+kvFBy5CUQTHRUWwzohl2
   IMWiLOKDGzGPVuKIMHNOHqtwihpENbO3Qz4XjvXQ0V2bLegBM7XhQ0Khp
   nTy+MnCjGgbnaxfbttlz2XvJSY1V9Dcy9M7swfL+njq9S5e/fF77PKuDM
   gBYiwYitmSchGeUsnWs7Vkcdgs4ZICa7B2m7UdRrUna0GeC/tPY0Zxx8/
   6RFkDvHov3fn+0ozAfhVrmE208GDmSBdyEkEtDg6s0J+J1HZjPnl3WXRX
   rJKNLQheOd4KzbC+NSfPF+L2wXFdqsO4R2iElkFu0nelE6tiCJ/Dnm2Zf
   w==;
X-CSE-ConnectionGUID: YYR6ZRsNRqmR/xZlFsQUkQ==
X-CSE-MsgGUID: g0LkvhcDTHW6t/bugs9a0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="173926879"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="173926879"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:26:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B4C0C68E2
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 92474CF7C8
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CFE720079DEA
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 17:26:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA96D1A0002;
	Wed, 28 Aug 2024 16:26:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH] systemd: use update-alternatives to  solve conflicts with polkit
Date: Wed, 28 Aug 2024 16:26:39 +0800
Message-Id: <1724833600-2270-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--7.046000-10.000000
X-TMASE-MatchedRID: b3nQ9wmEox2txhXyTqc02bstbCLHbulS96ryTp77YeGysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatWjfWRIrzXH/FJx56/xm2k+MhbTsXysU36UK7qQpWC8SzOw
	n2RdNtCBFwrQOsGSKy4Ay6p60ZV62fJ5/bZ6npdg7AFczfjr/7N0AsBI7HWimP7LCc0AOzKvOfa
	8dhjOb4q31u7fjwLAKJbQgMw2pXNE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203869

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of polkit-125-r0.core2_64 and systemd-1:256.5-r0.core2_64

polkit also uses the doc '/usr/share/polkit-1/rules.d'.
polkit has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core/systemd/systemd_256.5.bb
index ee656c81e5..1c408d075f 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -848,7 +848,7 @@ python do_warn_musl() {
 }
 addtask warn_musl before do_configure
 
-ALTERNATIVE:${PN} = "halt reboot shutdown poweroff runlevel ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
+ALTERNATIVE:${PN} = "halt reboot shutdown poweroff runlevel rules.d ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
@@ -874,6 +874,10 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+ALTERNATIVE_TARGET[rules.d] = "${datadir_native}/polkit-1/rules.d"
+ALTERNATIVE_LINK_NAME[rules.d] = "${datadir_native}/polkit-1/rules.d"
+ALTERNATIVE_PRIORITY[rules.d] ?= "50"
+
 pkg_postinst:${PN}:libc-glibc () {
 	if ${@bb.utils.contains('PACKAGECONFIG', 'myhostname', 'true', 'false', d)}; then
 		sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-- 
2.34.1


