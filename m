Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C37CD129D
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.130220.1712646652702382321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rAvGSVdD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646656; x=1744182656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dWXN4Z7Vj/ZTDw1dB6kg4bqpaJl5WUIc/CLyPQ5oiu8=;
  b=rAvGSVdDq5tVJ5gwM0AkX02Tf2gdQoCt5WzlzUslf8Hx3Ohv4r/Yn+1K
   jpJIdX7/oq3W18h7gbavpxd1zkWuWbnj8GGuXNOjucGMfLtHJltuq2jKj
   Yg+ppdDuNyOqkwuYhYQUK5d/P0I8x4usiKVPXJzJQ65cKiNJlQ89h+WnN
   edECFImoXPN9/vaEZvIHeX8xE8EQzjU7OajT6vNiRFriKSEKPLo5ouwCY
   51YolYf0fW6lhNGbJVajR0PyDP0i2+0IgDjJ8dbR9SaGGCvinr0OSkXfc
   rr47e9/sKU+5dqYg/to6putfzaFlBk2atdD9k7LqPx2D2QIzuMcnn82b0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="156937712"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="156937712"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 458CFD4800
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74377BF4AD
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10E664018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B4BDC1A0002;
	Tue,  9 Apr 2024 15:10:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 31/33] ttyrun: upgrade 2.31.0 -> 2.32.0
Date: Tue,  9 Apr 2024 15:10:18 +0800
Message-Id: <1712646620-16608-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--0.621000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMoS2PLq1B754YeSlHZYFosir
	dQwFSTzqQh0b9U3KO4PTq8WLFBPUkG0Xr+fj3ww/8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQfiq
	1gj2xET+OjIFTUDhqiqHvyg1ZsxTfW2EXohiB6drdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtIMlvyl83M/du91WV/I3RLc59iininpfo3V0oZwFFvzx91SQ0IpS6r7TDW
	GKrLqdmvzIQg17Lf0YbBghlLvq2wLc11IyVfQa+HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198049

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- dbginfo.sh: dash compatible copy sequence
- rust/pv_core: Fix UvDeviceInfo::get() method
- zipl/src: Fix leak of files if run with a broken configuration
- zkey: Fix convert command to accept only keys of type CCA-AESDATA

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
index 122dd9d8e7..9a8be15dab 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
+SRCREV = "9eea78b3ad8ab3710fb3b2d80b9cd058d7c8aba7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


