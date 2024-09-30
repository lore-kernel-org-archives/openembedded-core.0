Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F162CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:36:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.49237.1727681801189127078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QKhXvGqY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727681801; x=1759217801;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=adZ/dk9U4Vac1OtpsHrm/lpKqar8LdTqfn85yGzujdc=;
  b=QKhXvGqYx7KmqCNLbO8Rj7E+FFyfjcCxtS0zmHpnObnIVY+MbtoqL99z
   L7/7p0vJX2IIhvTXEeRGiq237s0Im2ju0YBIV3H5YxFQLKmZOU1I6kNd8
   rfimgxT0ejOwfr6i1NR8mkvu1LbVKma3hf/nSZLUHNXDne0kkbqwjTj+Q
   ZnJF040ULEv8wK4eva8khK5MfVOAU1VNPRZb/ittMVAoywe0uZnW7lKs0
   IcVt2iMQ8pIvs5QkcrC5e+2wI6dSSDevMiRrIcgqRAo+Ntny0Ltu0JtTi
   WKmz6V/1G1oatLNvgtWeH9M2aZpxEUdGW1ExkWSiMwMkbP031zzBgYwbv
   A==;
X-CSE-ConnectionGUID: IcKuIvQYSzqHFhsLTNVLhw==
X-CSE-MsgGUID: shpv9uM1TgGWVc2sNLoLhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163216109"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163216109"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:36:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89E60D424F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 16:36:36 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CECCBD4C1D
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 16:36:35 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id A1D7F1240E; Mon, 30 Sep 2024 16:36:35 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	shin.matsunaga@fujitsu.com
Subject: [PATCH] ffmpeg: Add libswresample to CVE_PRODUCT
Date: Mon, 30 Sep 2024 16:36:32 +0900
Message-Id: <20240930073632.23711-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 07:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205097

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample", as shown below.
https://app.opencve.io/cve/?vendor=ffmpeg&product=libswresample

Therefore, add "libswresample" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample" as well.

Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index 9e60b5cd23..d80fe03794 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -190,3 +190,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT:append = " libswresample"
-- 
2.25.1


