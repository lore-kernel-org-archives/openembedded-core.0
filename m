Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B25C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:29:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.36901.1656674952120642582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jIGMRuRD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656674943; i=@fujitsu.com;
	bh=mwxrn2LP+baG6VqFB6G7QKLnddRDR5B5muLWQScS0JY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jIGMRuRD1IZjv3JR1FTqQeIHzximVkKNVz6mMeZRJwvxRzpsto+9nxHx+UIipPFX3
	 jDCNyU5FX84zy4lPralNMihhchZgyO8T58LQO6XB+H6Eujz2rcnpI9/e28RFLr+o4j
	 PGDHdP3t1r2aWs2T/6PbxfrhXCaeigj5/tFMRO6sAsqBT0C3z6VE7qbXceyyBotUH3
	 qXhsowSN6HKJC/hwzbIuDXaU1IGLLZ+9uf7wKrs1CYXVoXNsv6lI6Sr8nViyRmEiAU
	 0IlUslJKwQgp3+sfnhWiXvKoJUkIQKZ13adhA+Mt6B6RMy5ISs8qNNqnxlOkEMX4Bi
	 3s9E6MFwT7LRg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqFt+a1+
  SwbTTkhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aeSVNZCxo5KxZMWMrcwLieo4uRk0NI4DGj
  xON3vF2MXED2NSaJRas+MEM4uxklvl3bxA5SxSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg4SFBbwklmwtBgmzAIU37NvBAmLzCjhJrGvbxQxiSwgoSEx5+J4ZpJxTwFni0XVuiBOcJP
  avmsYKUS4ocXLmExaI6RISB1+8gGpVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamuqa6RqaleYpVuol5qqW55anGJrqFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZg+KYUs/7fwdjd91PvEKMkB5OSKO/Va/uShPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnw5t0EygkWpaanVqRl5gBjCSYtwcGjJMLbD5LmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn
  5eqpQ479/TQEUCIEUZpXlwI2BxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO+m60BTeDL
  zSuA2vQI6ggnoiJ3T9oAcUZKIkJJqYJo6Zc1Rjfl5mVUnPmZxKK2OFr5dK/CzfGHgrq1y4vLz
  qz/JvhJNnjTFJU3H/rr73mM1kxYEBbtOK69orZwd+9BP6aNZxInYE3slQi+EfCycfmKxyOp/d
  5fIhx1aqenaeHk/s/C3KoHHgd6tqte3bM9/XXrFXMZq/fTmc6dCzGVNHxtHr3m8ucn1j/zzou
  pPfFNC8wXqXvctaXP0mzptUsTt0jfm3lPM1MsrHC70nNEW3TXFOVcwe09nkm50Zab2GZGOGEt
  7w/uJ946eu9wso6IZUlrk81ibyfds3Jb4F0mbbz/ctS0uesEWUaEnt7y/RNyKdVvA4Fkh7b7N
  WTpCpyLjEYvJ8uxvq2d2e8erKbEUZyQaajEXFScCAMVUimlmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1656674935!20212!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2864 invoked from network); 1 Jul 2022 11:28:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:28:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F371C10018D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E6F64100193
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:28:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:28:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 3/11] gstreamer1.0-omx: upgrade 1.20.2 -> 1.20.3
Date: Fri, 1 Jul 2022 19:28:31 +0800
Message-ID: <1656674913-20419-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
References: <1656674913-20419-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:29:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167459

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.20.2.bb => gstreamer1.0-omx_1.20.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
index c4f5d719bb..fb48562a2b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.20.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "7efed7cc5b0acf9a669e38c5360a7892430a4e86c858daac6faa1ade2b151668"
+SRC_URI[sha256sum] = "8db48040bb41f09edf8d17ff6d16c54888d7777ba4501c2c69f0083350ea9a15"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.25.1


