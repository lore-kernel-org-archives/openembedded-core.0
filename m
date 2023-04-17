Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43EDC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:57:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.47824.1681714628839426445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EvbTn68B;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714627; i=@fujitsu.com;
	bh=poELQCDcemFgdRqQYN82ngHN0ZurB2qB8zHoEXEWlk4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EvbTn68BbGzxcdzVEaXs4Oq/iCU5MCZ5t08iiGoEcwejvbuLCa3TrxXuHCwtG9W5A
	 nXSKjpcnzihn5XSkOFJVsBWHD91cL1Yi6kf3Ci0UQnWJjGot0M+pPp1N6FWAmlRdzT
	 z2eDTjlmIxa1UTGjeW3eOpJ7meGU5sqrUBj/Jg1doVVuNgzA9uNcqvU34I3RazQK03
	 1iOwRX2vbhYq46olArpNzp/vVFiyQ3ZYXvLpnzSHxEYCeKo7ueVeeN1rfSNQHZ7kDv
	 3k4ANuvsxFSM+kQaD5+WfGw3eBrHt8jRtUfW9/y6/w1jtoyeLIhUtPPZ/piOHSuAxS
	 vJFpsJ13VNbKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8ORqHvorU2
  KwcZvlhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8baN3NYCzo5KmafbGVtYFzA3sXIxSEk8JhR
  4sCWXlYI5zqTxKfn/YxdjJxAzl5GicZeGxCbTUBK4sb9/2xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFnCQOH2tkBClhEVCV2HmQFSTMCxSe+HkB2EQJAQWJKQ/fM4PYnALOEnu+P2OC2OQk0f
  L2KjtEvaDEyZlPWCDGS0gcfPGCGaJXUWL25WYWCLtSovXDLyhbTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl0jA72kosz0jJLcxMwcvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwU
  vbzUkk2MwMBNKVZ7uYNxYt9fvUOMkhxMSqK8L1KtU4T4kvJTKjMSizPii0pzUosPMcpwcChJ8
  Da8tkkREixKTU+tSMvMAUYRTFqCg0dJhNf4GVCat7ggMbc4Mx0idYpRl+PqlSt7mYVY8vLzUq
  XEeevfABUJgBRllObBjYBF9CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzXXgBN4cnMK4H
  b9AroCCagI+SUwI4oSURISTUwzb4x83WGPkP/C4Ez2dNcH/VeaPHmZTNOkim6Lz1VNGE/z/pu
  /bLDrxdq9Owq+Pzv96rHRZdWnY5bb779yIPTh+1WppQ1+sq8ilvXLb153TPHwHBfxb53M2r46
  7/cfrBDRvpa8ssGo11OvBNntRi2uGZ3H5ts9W3Hi8+v+9csmP7J9/+xKsbHoWlH114KnCeSpn
  j0Cke+yjvv/u8H39fM6VmuFrXefVtz1/6Dzfv32/f85kj2+JqkutXl1CnZJdEWlUzHTdPdhOd
  9CbTZqftF2fzu95UJ/h0abJ5TahNXSrZwxPt7rF0hLZc81dHE2uT4qbgT6lffKHJf39l7rKjL
  b/odB6bXEY4h672ur+QtUGIpzkg01GIuKk4EAKSiuB1jAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-548.messagelabs.com!1681714626!290552!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4437 invoked from network); 17 Apr 2023 06:57:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:57:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9D7B31001A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:57:06 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9026A1001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:57:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:57:05 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [[oe] [meta-oe] [PATCH] tbb: upgrade 2021.8.0 -> 2021.9.0
Date: Mon, 17 Apr 2023 14:56:35 +0800
Message-ID: <1681714595-18749-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
References: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180140

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/tbb/{tbb_2021.8.0.bb => tbb_2021.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tbb/{tbb_2021.8.0.bb => tbb_2021.9.0.bb} (98%)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.8.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
similarity index 98%
rename from meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
index 5606d38da..028291c96 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.8.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.9.0.bb
@@ -12,7 +12,7 @@ DEPENDS:append:libc-musl = " libucontext"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "c9497714821c3d443ee44c732609eb6850195ffb"
+SRCREV = "a00cc3b8b5fb4d8115e9de56bf713157073ed68c"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
 "
-- 
2.34.1


