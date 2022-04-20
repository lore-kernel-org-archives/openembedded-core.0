Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2810C47087
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.4052.1650427837219305112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 21:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zJAnXJ//;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650427835; i=@fujitsu.com;
	bh=HlZuR30Mor32kiP7IgfDc+a99FXmzEKwPRp6MZWBt+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=zJAnXJ//Qftd7tnppI33xA6cRrELeYqt96jBqcnsncF0fcnptvGXBz9a3cQTW8cr5
	 Qcqf7eLuK1K8vxn59mStfgYvdqoxD0dwXIkd1L+8nnofxZiUJKtdrmsrGueZFpjqF8
	 7vnfXpdxIclnj1Vv7u4fS87jaLEfPifzN9sBSi+oO5pU38EI5czIV64K4xPn/zLWk4
	 6FQpKOkZJz5KjmbjQlGK/O5ETfMkh42zvkrSgpHdQjU1o+voQUiDLAlh+6gDc4PtX4
	 7meV9UrEbJliCTYLakH6Gw9AlahG1FBWS0r1/m86e/tfri9KVqIcNvUEh1Fp1DcuNF
	 77+xDq57lJW6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MRorurPT7
  J4PQBM4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWN7fwNzQTdXxbU9R1kbGBdwdjFycQgJzGKS
  eL1mLyuEs4dR4smBNWxdjJwcbAJqEtNv3QBKcHCICOhJXP0nChJmFlCRePG7hx3EFhawk2ifu
  4YRxGYRUJWYNWsjM4jNK+Ak8eX0RLAxEgIKElMevgeLcwo4SzQvamIBsYWAap4/fc0GUS8ocX
  LmExaI+RISB1+8YIboVZSYfbmZBcKuAJrfxjSBkX8WkpZZSFoWMDKtYrRNKspMzyjJTczM0TU
  0MNA1NDTVNbPQNTLRS6zSTdRLLdVNTs0rKUoEyuollhfrpRYX6xVX5ibnpOjlpZZsYgQGZkqx
  i8QOxpt9P/UOMUpyMCmJ8pa1xCcJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuC1AskJFqWmp1akZ
  eYAowQmLcHBoyTCWwyS5i0uSMwtzkyHSJ1i1OVY23BgL7MQS15+XqqUOG9vG1CRAEhRRmke3A
  hYxF5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxb0go0hSczrwRu0yugI5iAjqieEgtyREk
  iQkqqgcno45UOK9fLkXN2Mqsd1bq2YXkjf8NU1pWvL4ZPv3lYad9Na7nZN/d3pVS+FL76j+tV
  jojPha8L1oW8OX23aJ/kgwbz49535HzrT2qw9hj/K00N4Vh+VN3+QuyNsB9aEeXBLo3uPO4ps
  ktf/9ogrsj/t2Bu78PX/GuiMreq6T3msniWZxF6qqm/ZKnS3Rofnd8XtmosMz35Q/2q4JPKqH
  tvNe+o661ZE2ilNsvB01cxQmqbaNuHhpUSLwRvKWiGvVzR/1H7xYH4WuP7K49xTlTakjUjd8H
  iTRo65/5cKm8sjWGOP7nPqm3e/Jfts/+VcfVsKNX7utTepvC3b2LwXcFEuVO7fp3dLxd4pLXt
  SLgSS3FGoqEWc1FxIgB7tSQiUwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-532.messagelabs.com!1650427834!336443!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4755 invoked from network); 20 Apr 2022 04:10:34 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-8.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Apr 2022 04:10:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23K4ARgY023955
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 05:10:34 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 20 Apr 2022 05:10:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mkfontscale: upgrade 1.2.1 -> 1.2.2
Date: Wed, 20 Apr 2022 12:10:18 +0800
Message-ID: <1650427819-28266-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
References: <1650427819-28266-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164655

temporarily override SRC_URI which is hard-coded in xorg-app-common.inc
since new versions of packages use a new compression format - .tar.xz

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{mkfontscale_1.2.1.bb => mkfontscale_1.2.2.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.1.bb => mkfontscale_1.2.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
index 2d0c51a423..573b05128e 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.2.bb
@@ -15,7 +15,8 @@ RPROVIDES:${PN} += "mkfontdir"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.xz"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=99b1e1269aba5179139b9e4380fc0934"
 
-SRC_URI[md5sum] = "215940de158b1a3d8b3f8b442c606e2f"
-SRC_URI[sha256sum] = "ca0495eb974a179dd742bfa6199d561bda1c8da4a0c5a667f21fd82aaab6bac7"
+SRC_URI[sha256sum] = "8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4"
-- 
2.25.1


