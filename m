Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26FFC47088
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.7459.1649245609457508135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AO4lCt4a;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649245607; i=@fujitsu.com;
	bh=5Q6jBGeZfNRA9Pk1SoGC7lBIgjIX6HfFFm1MRRy99AM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AO4lCt4aUkqrCEB1eVePDR2GhshwZGPRmXTyD8R9x8d8IQTQtRlBWfEyd0kXro3HG
	 /52ATc6mRMbUuboURaKhpI85cRDIgR6ymYrBv1HuSpW5Qs4xSVg4FxQ80k5G2D7OUM
	 Cmw6LobThbZvi1Xc1CgrGlvoXDaCiFG3ig1G5FmwGiCbcAmPUwtMMY1SL2+3SvdJhP
	 7xY7PU3P4BnWtRK6bLTv++Q1evLai0D2zv+zk58t8pwl9BiA4Ah4dlHLTHio3HIt0+
	 9kAstuDZAdO5lntPSjlySFMznCLe5m7ngNHGCkhWvWsnswdqjyRHWFyVWnlHtoUV1I
	 dtqzwJpju87mg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqLu81jf
  J4OdPcYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPzou3sBc2cFXd2vGFpYJzG0cXIxSEk8JhR
  YsqV5SwQznkmiWkdG9ghnN2MEq33lzB1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgK3E08dfwWwWoPiJlnawVl4BJ4mXm7axgdgSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NtU1NLHUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMuUYuWp
  OxhPr/qpd4hRkoNJSZR3f7lvkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3i1VQDnBotT01Iq0z
  BxgjMCkJTh4lER4tWqA0rzFBYm5xZnpEKlTjIpS4ryZIAkBkERGaR5cGywuLzHKSgnzMjIwMA
  jxFKQW5WaWoMq/YhTnYFQS5vUCmcKTmVcCN/0V0GImoMXvzniCLC5JREhJNTAJpb1oaNp5hHX
  PJIG8+J9sq2NCgn+5WK6dZbJ5RdNWgSSdtZclf1QITv3xh+mVFzf/nDkrjsZ5tKg/kej7e8gu
  QNBx2Tf1OcfN5055Ifsne4LexZZpIfUK5qH1Z/OWZKY+Cjp3fssstYXW537fXF0blbrm5euzx
  SfWvuHpOHJ5xRk118xZNx7YTymrKI7trDZ+dvriF/ldjkeUnkYE1/2Sahbi6rX6/eldpFCp+U
  0j3hbe0l9h2lU7nU+xO84VfqTew653K9FpR3Jp70xe+3eWV55f/vm5cZ7rh9TNO2w/PmTSz5k
  R6SLlm5jyZcFcxmoXTb1ZuVo8QdM/FInw9TUfsOGa3/9J0uWg1vXHn48qsRRnJBpqMRcVJwIA
  Y36OhEYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1649245607!30798!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12093 invoked from network); 6 Apr 2022 11:46:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 11:46:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D18C9100199
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:46:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6FE481001A2
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 12:46:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 12:46:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] freetype: upgrade 2.11.1 -> 2.12.0
Date: Mon, 4 Apr 2022 02:43:08 +0800
Message-ID: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164064

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freetype/{freetype_2.11.1.bb => freetype_2.12.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/freetype/{freetype_2.11.1.bb => freetype_2.12.0.bb} (95%)

diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.12.0.bb
similarity index 95%
rename from meta/recipes-graphics/freetype/freetype_2.11.1.bb
rename to meta/recipes-graphics/freetype/freetype_2.12.0.bb
index 5055ff185c..3034977cd4 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.12.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
+SRC_URI[sha256sum] = "ef5c336aacc1a079ff9262d6308d6c2a066dd4d2a905301c4adda9b354399033"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


