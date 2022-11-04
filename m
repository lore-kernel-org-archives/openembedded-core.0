Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEDBC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:50:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.8366.1667544603908706515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TGzcBC8G;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667544602; i=@fujitsu.com;
	bh=jb00C3NgbV0tmaBBk917yXp/2wVcftv98BeOu5o5ceA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TGzcBC8GXZrR83PtzjqWxu4ZzbQRl5oxul58DsXfP4Xb1WUvYpi9xduf2nEc+vzDX
	 jxtSLVKAf+BMLs6SU/XEKtwQwQh1G2M0imzmaTAqBicoFCaFz5YOAPhIEOg+pleyRH
	 hg8OjmGg9HgFNDVkVFugqDQqaAC5SbGE0hbmu9f6Eye30Lus9EMjcNNsjFlAM1iOzu
	 XFesD3KdypxXxtrnT/HjVxFr9rhE37O20DOPDtX8KMWJlkTQrUADTAGre1syhkGKEC
	 fbu7VsKb8OhYO6MYQvs2BnRQlw2lH+hcbRE9vEo8TY5x1dU9DN6YI8dY8wlTubcpm1
	 3hNczyaFIGsog==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWVdyW0q
  ywYKpShZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b7H/uCE1wVv+8eZm1gvM7ZxcjFISTwgFGi
  6fA9RgjnMpPErNtdLBDObkaJznXz2boYOTnYBKQkbtz/D2RzcIgI6Elc/ScKEmYWUJF48buHH
  cQWFnCTuHN5GiuIzQIUX/HuJjOIzSvgKDF1+gwWEFtCQEFiysP3UHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNUPUVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpGhnoJRVlpme
  U5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGYkqx+sUdjJ3L/ugd
  YpTkYFIS5a3jTUkW4kvKT6nMSCzOiC8qzUktPsQow8GhJME7dxNQTrAoNT21Ii0zBxgXMGkJD
  h4lEd7f84DSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gFmIJS8/L1VKnNdwC1CDAEhDRm
  ke3DhY7F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMw7DeQqnsy8Eritr4AOYgI6aFt1Esh
  BJYkIKakGJg6eG4qc2fJ8pj+93uetb5n388TKUln9fWp7VtYyCSfUs80yb+AyO/p+iapurGPR
  FdvdXRJ7Jn6dtjfJd6N09u29aw6qbbVcddjKMGXOwxmxW/K/lG54+ZA3LrdbzPgfg6O5Dst16
  2yB72cfrDR8kTiv1W3Dq3Wmcfv/vv4sZDhj3s6LvMV8Mcam64IXn9qYsWFuyNqIl/dl9jz/Vn
  js+rHzi9O3z3oz/eCppHM22eKfJyVnsElzuqdtZ1Y2cdkTOO+pgrIFo4gw6/WFvYkxt76Y3GL
  RfbLlYlT75yveS8LyZFY+kv+psVv2GW/vxj17rhel+UiKf/m252fxzlkdV5bxze/nf1PMoJGm
  cmp+5X8lluKMREMt5qLiRADIVvbrWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1667544601!16900!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7316 invoked from network); 4 Nov 2022 06:50:01 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:50:01 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3079D151
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:50:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 24331153
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:50:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:49:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling upgrade: 1.11.0 -> 1.11.1
Date: Fri, 4 Nov 2022 14:49:48 +0800
Message-ID: <1667544588-4936-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix default file selection behavior of the wheel target when there is a single top-level module

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-hatchling_1.11.0.bb => python3-hatchling_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.11.0.bb => python3-hatchling_1.11.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.11.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.11.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
index 00c4c598b5..d98d874606 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.11.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "a263a8c50817cd2dfcd4dd6d0d55a5ebcb078eeec9858cc3d056314b3438ec8f"
+SRC_URI[sha256sum] = "9f84361f70cf3a7ab9543b0c3ecc64211ed2ba8a606a71eb6a473c1c9b08e1d0"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.25.1


