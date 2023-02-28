Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712A2C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 01:59:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.13651.1677549583300518267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 17:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=awemsbV9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677549581; i=@fujitsu.com;
	bh=NfQfHAhW2IoXb3YzDTBDweT/5vzH1HTeqw4OQadpo98=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=awemsbV9cLtldFPJcNYYpfuXs+KgcszjAeoXmMJlTehQhkYM3qlbUC7w1SCVTuhaW
	 5nnweh96tTKeGbHYt5+E3uY5hM8O1+zsnLOXEwvUidBiJYON/D1EUlwfTTNKRsUvIs
	 Mcq2l7LmpVZ6cZugqdwpekPXqAtKJ9BrlpHQM/AjyO2hm0H3VexL/GY7J/Afchn5sO
	 B7PJiJ1JjrbPYADuE7aJDXm+njKLRE1Ga1PsGHDg/BMVzU2x29mC3Whezl+uCB7E3D
	 iRMUUF+24ws5yqTGqvhHrko5M9ybu55NoBLcfVkzWDYv3lPcN1h8rxHHoftK3OCl+w
	 3jRBBAZiiNS5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORqMuT8Df
  Z4PVtaYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPz5JSCM+wVU3/tYWxg/MHWxcjFISTwmFFi
  1Z+/zF2MnEDOdSaJJY+kIBL7GCU6tv0BS7AJaEjsnnoZyObgEBHQk7j6TxQkzCygJnH05U+ws
  LBAvMTKxwUgYRYBVYkre4+ygti8Aq4Sz/8tZAOxJQQUJKY8fM8MEReUODnzCQvEGAmJgy9eME
  PUKEm8vbSHEcKulGj98IsFwlaTuHpuE/MERv5ZSNpnIWlfwMi0itGsOLWoLLVI11QvqSgzPaM
  kNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwDFOKkxl2MHb2/dU7
  xCjJwaQkynv46J9kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8eyP/JgsJFqWmp1akZeYAYwImL
  cHBoyTCe8ABKM1bXJCYW5yZDpE6xagoJc5bFQeUEABJZJTmwbXB4vASo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHeiFigKTyZeSVw018BLWYCWtxw7Q/I4pJEhJRUA1Pxbd5jb6R2al84q3r
  dSXqze3PuyYI1Wr5/nKM2fpFt91+V52VxR/7uqu4DIUU/FT2+r1tYpftoUcrS9QE+bM7VCyae
  m3Z/alX3P72JK5Js236WHUks1XVOt9LY8aFMUUr5YGqRZplupIuNwpyuqIXhS1bXFR22/r/en
  /Ga7EbVG28uBLDZsa5a0XLga87BSSWLqo6Xs6Tdfa47V1p2qtjSdb/DxTz9l13o2t02+eTj+V
  lvD5/f+ytj3WyvtHX2fj1T1F/anN9rq2nZI3jK53V3k4H/RLn7ix4XN2jHq3OZ8T7X5Nphfca
  03qLs90TzxR2zhKrOua1Kfy00q3bXXYka7ft8Lk96C74Gii+4PFWJpTgj0VCLuag4EQB6Ci5C
  PgMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1677549580!276658!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28907 invoked from network); 28 Feb 2023 01:59:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Feb 2023 01:59:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D5A0210018D
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:59:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C9460100182
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:59:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 28 Feb 2023 01:59:37 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: Updated ther patch which fixes build error for fips enabled.
Date: Tue, 28 Feb 2023 09:59:28 +0800
Message-ID: <1677549568-21914-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 01:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177813

The context of lib/Makefile.am in gnutls_3.8.0 has changed when
updated from gnutls_3.7.8.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...1-Creating-.hmac-file-should-be-excuted-in-target-envi.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 87ebd8059e..4bdc40d932 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -21,7 +21,7 @@ index 6d4e8d2..24ef108 100644
  
 -$(hmac_file): libgnutls.la fipshmac
 -	$(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
-+.libs/.gnutls.hmac:
++.libs/.$(gnutls_so).hmac:
  
  CLEANFILES = $(hmac_file)
  endif
-- 
2.34.1


