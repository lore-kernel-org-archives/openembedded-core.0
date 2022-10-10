Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AB9C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:38:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.3993.1665391128856370038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CaMAAcgG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391127; i=@fujitsu.com;
	bh=1zjElkGuMJtafSho9rUpFKslCGFFU45Pxe6YGBJYHO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CaMAAcgGOPzGVtXUTNwFsb6THthJ8VfW8emzCr0AcUGsjEbR6A/1vdDptgfRhTkbM
	 bvY9vrZyd8TcPtlpTErDOTf6hZCV28ybwwuEKXs/RraPGM01L0lEa2357ERtJCXSn2
	 J9gf7Am0WSaH3eIHJS5tVVHLc7cLCvhium213y99INqWtOBc1SxT1gScxjdD/lpJnk
	 gxDhNdl4JqZmHZJXeV8JApO5Lc9h9PaeT9gRsjpE7csXqGjJTzKkdJoYLrxOX4u/Ot
	 10wQCLw/c2hIfe/Mwy5Q03cM8fZCXCLvzqSTwmgH31bVULGXyOfmF9C1DPmkv0wmYY
	 7/GVuSgbR6aIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSVfslnO
  ywctVphZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a0iY+ZCuZwVnxZJdfAeIyji5GLQ0jgMaPE
  3m19jBDONSaJ+8+WQzl7GCVeXHjI1MXIycEmoCYx/dYN1i5GDg4RAT2Jq/9EQcLMAioSL373s
  IPYwgJuEjvnfmQGsVkEVCVO7Z0AZvMKOEqc3tjCBmJLCChITHn4HiouKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MB
  A19DQVNfYRNfI0EIvsUo3US+1VLc8tbhE10gvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwKFOKlW7t
  YNyw6qfeIUZJDiYlUV6DQ87JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4V18FygkWpaanVqRl5
  gAjBCYtwcGjJML74CJQmre4IDG3ODMdInWK0Zjj6pUre5k5Zn5tO8AsxJKXn5cqJc674AZQqQ
  BIaUZpHtwgWOReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMe+kK0BSezLwSuH2vgE5hAjr
  l5FUnkFNKEhFSUg1Mcnv/R2Te7H355eDvOZuNFwm9m/IlOenvDdntHhFSEz+abezx8Vz//ulU
  Bj7J97PfyqQox683lLsrcTjUZotHSSLLXt/iZUZbzFK4jNoO5roXCa5eMc2hivno9dVX313/e
  WTF/DObGU58VwxcX39bserMUoYTJofj5RUbL+lYmrm9+GHsMc+04PspbUUZAY8Ontvv1N9pVS
  g3vs978SN57xa27zuv754jX+mn5qXltiaITzXwD6tI/ZzYD3vfcG+6FOB6y9Hi1t/iludmHN+
  f2e/SLuX2ln71faH18fDGP5Xf1+0r1P7t0nL2r3/vW62b63hf93wryZw6L2mu5Y7wiZKFcb5r
  ZD/US+x64KEqoMRSnJFoqMVcVJwIAAqt5U1XAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1665391126!3097!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12751 invoked from network); 10 Oct 2022 08:38:46 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:38:46 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 933CD1000E9
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8679D100078
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:38:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:38:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] init-system-helpers: upgrade 1.64 -> 1.65.2
Date: Mon, 10 Oct 2022 16:38:29 +0800
Message-ID: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:38:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171558

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nit-system-helpers_1.64.bb => init-system-helpers_1.65.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.64.bb => init-system-helpers_1.65.2.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.64.bb b/meta/recipes-core/initscripts/init-system-helpers_1.65.2.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.64.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.65.2.bb
index 663d60c6e0..1fc23acb74 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.64.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.65.2.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "c440893051406c11f0a315058939657d5937be4f"
+SRCREV = "2f446b69db728b2bda68270a9b81de88102e1fdd"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-- 
2.25.1


