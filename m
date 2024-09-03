Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9931CD3435
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.18358.1725352396754184972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bgdLsmEP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352397; x=1756888397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sbPu9xa5BraILEn6szfgaPFRbNLYI6wJlHP2+MV9I9s=;
  b=bgdLsmEPA8KVH6cRxVkhQ4ekwRc/Zzve0wEwBW0J51QCaAODfKMX5ZtB
   iWbdlPK1GB52N+3Sd808evHWnPEI/V6vOab13QCuafDXSuiNfwpZ1wdgr
   BaZPliCGPA/IsaRGe02cdHQyQBNFahTpCrkkvWt6YMdXUB1s98dgUO4cA
   bKWG4ExwahUbS3hqcD9FvtxsWyBQl1S1yuH3D5wyOPznHs21bfPo6qrAJ
   BG/ubulbDAvGsW7McjPKchU2xqQWhttoctZQc387YpUdXAjtLzphEC1Id
   buJEtqttSF/trzcqogFdHcfJbhy7LSi7qIwjEIDqeXe6G9nFssyW357c7
   A==;
X-CSE-ConnectionGUID: KB1KTyE3S8OuVMgp0Y+Fgg==
X-CSE-MsgGUID: 3oAHrL8gSUOiqApO9MXiSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="151429532"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="151429532"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 21D18C68E6
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D752D50EB
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 033CC20076D22
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 996A31A000C;
	Tue,  3 Sep 2024 16:33:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/22] lttng-tools: upgrade 2.13.13 -> 2.13.14
Date: Tue,  3 Sep 2024 16:32:47 +0800
Message-Id: <1725352379-20334-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--3.171400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu7N2IdiDgmM5mj
	18Axvjh0qv7HRtMtV3ql+fxzcjwAMT13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEPXc
	ag8UDUcUi+t+0AiFaYgB/8cibO8IYRY1tl9vG/Aat3STmfbGX2ZHUt5D5WmclmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZL+11Ny8TlE4VQ40153YWlqD6qUcHoi4KXDCJG1SX9LVtG+g
	ZATMLWDpW4nmnqX1LGxjnKPWCc9RT4bd9+8Q/pyqoPEazyoXbpLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204136

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix: Do not null out lttng_consumer_stream channel on deletion
* Fix: Crash when unregistering UST apps during shutdown
* lttng-ctl: Hide symbol introduced by fix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-tools_2.13.13.bb => lttng-tools_2.13.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.13.bb => lttng-tools_2.13.14.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
index e73dd4801a..65d19b6e5f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.13.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.14.bb
@@ -41,7 +41,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
            "
 
-SRC_URI[sha256sum] = "ff5f4f00b081dac66092afe8e72b7c790670931cf1c1ee0deaa7f80fbc53883e"
+SRC_URI[sha256sum] = "53bdf7c4ad07dbfe660ee4d9affc63fe44ae59e9a73c6f7a96e0fca140e5adcb"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.34.1


