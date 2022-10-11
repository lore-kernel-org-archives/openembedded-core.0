Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0903DC43217
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:22:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.4932.1665476534816297630
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MFi/o+xf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665476532; i=@fujitsu.com;
	bh=FxWsgFgCnNyJO709kDw8cRauRfVmgoe3ZdjbPfumF2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MFi/o+xfSbX3WVVHGDW2WYNxs++ix1ykc4TpAa/EROWolMT/BKCDtU3q/oqDzqPiT
	 bvUfdC0XMvYVFY8teroUn3nHq5ud/fL+k08fm4vD7n3MLwzsf59WDpKlqG7TdVT47C
	 szMXBK0XUJyXsTp/zJNMCAGGYBRIQOnZavH5okbqodvLdku9POKKWAgZZ8XOm9tfUH
	 ZbPAd6zfOxBKSSbUs1FUPUG0IFdaPPK8N0MMIhqQUMBXi73fbdXWoWGOzeB9waMttF
	 FbqiGNS8er13LYKtxlNM6Sy4WH/bP1yirmLwEc8h37U66BLti+WP5aBFroiVOLlGxh
	 6l9CCKpT0vpJQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSXeLumu
  ywdo2eYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNq42T2gg0cFfsvbWJrYLzF3sXIxSEk8JhR
  4t+e96wQzjUmib3/O5khnD2MEne2XmTsYuTkYBNQk5h+6wZQFQeHiICexNV/oiBhZgEViRe/e
  9hBbGEBe4n5h2aClbMIqEr0bPrBDFLOK+Ak8XKjJkhYQkBBYsrD92BhTgFniYalgSBhIaCKdW
  c3sIHYvAKCEidnPmGBmC4hcfDFC2aIVkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxhtkooy0zNKchMzc3QNDQx0DQ1NgbShrqGpXmKVbqJeaqluXn5RSYauoV5iebFeanGx
  XnFlbnJOil5easkmRmAQpxSn8u9gvLHvl94hRkkOJiVR3qvPXZKF+JLyUyozEosz4otKc1KLD
  zHKcHAoSfC+UHVNFhIsSk1PrUjLzAFGFExagoNHSYR3qQpQmre4IDG3ODMdInWKUZdj5te2A8
  xCLHn5ealS4rxtakBFAiBFGaV5cCNg0X2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvCpA
  pPJl5JXCbXgEdwQR0xMmrTiBHlCQipKQamCYy1e9eHln/6+b0lena88/uvhxn8rDC26e82cGm
  06Q8lb301/26ytmSbcxihzfdfrN9vqPlC6nglOTTLy8UC23ayfNTnu9pxeFIlbOvNlUdqejte
  Wz+QldD/3rZ9qe6EvMPLnNVujDxTG3XC7EroZNZirVb7dR0fi9qcMpYUmy8N6fG8oDMutV7fa
  75uIW4as22rNh36NCNhedlHs+R+1i49fGBOxuzsuxNS7qEeS+LZy9eHvGv7aJYPPdriyf1rOW
  p09r/Mt1d/Nvor2pFi8DZaLlDxjcld3rPiu1ddK+r9wDzPtcvcUtO61qZ7510XW3Jy+3hCV1i
  Cjbfw/gWhxx7N//EY+EgDibrRa8XaSuxFGckGmoxFxUnAgDrS7U5aQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-732.messagelabs.com!1665476532!60515!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27831 invoked from network); 11 Oct 2022 08:22:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:22:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E7BC81000E9
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id DA7351000CE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:22:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:22:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.8.1 -> 3.9.0
Date: Tue, 11 Oct 2022 16:21:46 +0800
Message-ID: <1665476508-16543-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
References: <1665476508-16543-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:22:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171608

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-zipp_3.8.1.bb => python3-zipp_3.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.8.1.bb => python3-zipp_3.9.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.8.1.bb b/meta/recipes-devtools/python/python3-zipp_3.9.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-zipp_3.8.1.bb
rename to meta/recipes-devtools/python/python3-zipp_3.9.0.bb
index fa2f7bcf90..00c55cbe7f 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.9.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "05b45f1ee8f807d0cc928485ca40a07cb491cf092ff587c0df9cb1fd154848d2"
+SRC_URI[sha256sum] = "3a7af91c3db40ec72dd9d154ae18e008c69efe8ca88dde4f9a731bb82fe2f9eb"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.25.1


