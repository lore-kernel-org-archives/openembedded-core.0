Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D259AC77B7E
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.26620.1685610258654342845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98458954"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98458954"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1069D3EBA
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 020F5CF7F2
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B19088857;
	Thu,  1 Jun 2023 18:04:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysklogd: upgrade 2.4.4 -> 2.5.0
Date: Thu,  1 Jun 2023 17:03:40 +0800
Message-Id: <1685610221-29015-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--3.067800-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yTz6L+U/pejxF4r8H5YrEqxIyDY579vwTCiQ
	L+IhWlyyhV9djnagpDCE8eIG2YNckVgh7i+m6ZSoZj7E6vHnuNYYQYFQ2+HwYAfPPcndyjVll4n
	a/XrRWdbUxgqbraLAG335vZQBjewGifHfBxH9sp0qy6shOlK/41QQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaIIaofrtSGke90KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtCQvlWYtoEBEtzd5+UY9bgJNjt3Ta6VoEkVq5rCGufI2p2HRvdmAxxa+eSeFGcNHGvtMG
	8cafuRA4uRYf3X6E6grVSlAD9SwMoVmuI/haNPDyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182090

From: Wang Mingyu <wangmy@fujitsu.com>

Changes
=======
- Issue #59: initial port to NuttX, contributed by Xiaomi
- Issue #61: add support for '-c' and '-cc' to disable log compression.
  A single '-c' disables compression for pipes, another '-c' (or '-cc')
  disables compression for all other log targets
- The default 'syslog.conf' now logs debug messages again (disabled in
  v2.4.0) due to problems (confusion) reported in the field
- Dropped not recommended 'KillMode=process' from systemd unit file

Fixes
========
- Issue #60: document how to set side-wide permissions on log files
- Issue #62: early log messages lost when running under systemd, found
  by Wind River Systems, including initial fix


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.4.4.bb => sysklogd_2.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.4.4.bb => sysklogd_2.5.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.4.4.bb b/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.4.4.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
index a19b4f58eb..096bd376d7 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.4.4.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "51d471543ce59eace6df6da0e42658911f1fb8c0"
+SRCREV = "b6d1ae26671a85e6087c98ec8b630855fc52886a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


