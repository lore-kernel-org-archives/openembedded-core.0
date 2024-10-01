Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7CECEB2FE
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 06:08:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.74853.1727762900073719427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 23:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=njgmOO9F;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727762900; x=1759298900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M4nU2VgsryBV6eHWj6ZQlhy5ZnhZYN81XXXk4mer3sE=;
  b=njgmOO9FoLIQ6rbsJPcSxYUrbGR20be3sits6uOFvnm1RudjLGuy6qAI
   XHayMQLhg4Wdr3Z+c8qhj28NnYB0wc4iwzn22UbXA1iuZ0KZxHC68h5HH
   Lt/ma7sIW8LHukpBbaOn4s9A+t+Qy+Cu7AzMxc3iRYYChjDsHQaMj/MGP
   LxMpMiewaJjYR+tBi9gaIywULQxqjHbf23e2NNkjj01Y9bd2DjUReVxxv
   8PHVzldh19cSESCvsLXqyv3AUJTzuH/zmZlph6+qZzCSSMvZ2xyf0zxpN
   2yabXBYfgbCxhbWfC5/e310R8G5V8fPAvimqpDzdD3Q8yzTMBOz0rqcZv
   A==;
X-CSE-ConnectionGUID: q9iyMxnLSPCS1a0ZfqeG0Q==
X-CSE-MsgGUID: X26WK7m8T6Og/7V+AjNDbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="163674496"
X-IronPort-AV: E=Sophos;i="6.11,167,1725289200"; 
   d="scan'208";a="163674496"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 15:08:16 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D59AE8BFA
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Oct 2024 15:08:14 +0900 (JST)
Received: from storage.utsfd.cs.fujitsu.co.jp (storage.utsfd.cs.fujitsu.co.jp [10.118.252.123])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F420EBF3DB
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Oct 2024 15:08:13 +0900 (JST)
Received: by storage.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1068)
	id C1BCA13D7C; Tue,  1 Oct 2024 15:08:13 +0900 (JST)
From: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	shin.matsunaga@fujitsu.com
Subject: [PATCH] ffmpeg: Add "libswresample" to CVE_PRODUCT
Date: Tue,  1 Oct 2024 15:08:12 +0900
Message-Id: <20241001060812.2757-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 06:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205131

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
index 9e60b5cd23..53b79be382 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -190,3 +190,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT = "ffmpeg libswresample"
-- 
2.25.1


