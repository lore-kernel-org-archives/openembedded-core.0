Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF88C25B5F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:04 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.11786.1713948183432067026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WLpfK0RD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948183; x=1745484183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4k/5aGffC6LG+NK/UT3an4TTCYs/RiwHqmfUGPOfF0o=;
  b=WLpfK0RDlzbkXb3FlVZKaDNRUswLG9oiWqI9e4ngqXXlMFa3ubSF/qka
   NF69l4tjXKshFKbCoiWx8JiweEhefUZKhsgejz++exYn2EAGTB1Rt//Ng
   g32yGigDAzLoGVyuA644E71kbpnzIhpRpHABOduDkimKk1iLmAs4Zxfv2
   H94QzGBdt5QT8qN2dCJAAy+hTHGLpzEbi1MwvLrYOtmWmpOyg6FszRgq/
   vcDvmYzlo2K85IpgHIKMnaZ0Zey3jHdJv8JI69jAIQq3Qik6W7xBEQmaF
   88u6npmQwMfFDsemh0DB1nt36xDE8LSdD0aafbVcn7XD4HIFXZsBcvxMy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="155992781"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="155992781"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 682E8D5014
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A5283D2BB8
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39D3C202CE13B
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D80F51A000A;
	Wed, 24 Apr 2024 16:42:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/38] libwebp: upgrade 1.3.2 -> 1.4.0
Date: Wed, 24 Apr 2024 16:42:05 +0800
Message-Id: <1713948152-13501-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-2.962600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr0NnUUVMlTKbIgofMgahPrfDN
	oiUhMQNxK7flHdmJuA3R+vxSrqwbP1v0t9llDdf+A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRkzq5boBj2Fx2v34qCfZeB4vqaU9Ng0zJKR5k
	/aAJuHyAqsBOC27IfCeTjw/FyRX6QfE8yM4pjsDw9ejiC/BQPdLzP5snaeb1Qqtq5d3cxkNeen+
	gInutwpwWOc/zEgbm/aKmh1fHlwZtPypHupoHcrB5HLaVWHIrYmDHsqxByN1CGTab9fQxuPbpDK
	TKJTEEEGms6cO4Kk/w3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198657

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* API changes:
  - libwebpmux: WebPAnimEncoderSetChunk, WebPAnimEncoderGetChunk,
                WebPAnimEncoderDeleteChunk
  - libsharpyuv: SharpYuvOptionsInit, SharpYuvConvertWithOptions
  - extras: SharpYuvEstimate420Risk
* further security related hardening in libwebp & examples
* some minor optimizations in the lossless encoder
* added WEBP_NODISCARD to report unused result warnings; enable with
  -DWEBP_ENABLE_NODISCARD=1
* improvements and corrections in webp-container-spec.txt and
  webp-lossless-bitstream-spec.txt
* miscellaneous warning, bug & build fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webp/{libwebp_1.3.2.bb => libwebp_1.4.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.3.2.bb => libwebp_1.4.0.bb} (96%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb b/meta/recipes-multimedia/webp/libwebp_1.4.0.bb
similarity index 96%
rename from meta/recipes-multimedia/webp/libwebp_1.3.2.bb
rename to meta/recipes-multimedia/webp/libwebp_1.4.0.bb
index 63b0fd9a6c..d922970479 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.4.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4"
+SRC_URI[sha256sum] = "61f873ec69e3be1b99535634340d5bde750b2e4447caa1db9f61be3fd49ab1e5"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.34.1


