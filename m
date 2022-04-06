Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F11C38A2B
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7834.1649247559200703645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 05:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qLHPzMPS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649247557; i=@fujitsu.com;
	bh=te9M5k9EuHlfrZ02H+iHlctPAeuSpW4+kTHEa5t3LX4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qLHPzMPSJb4hkiE4GCkLkZBxMSrrFr7sPWxuESxYTP9kfxuE8J5oBMCxQnMe+Os2J
	 Ob+h3OAjfnA3gODHe/ov/JCJYRRy9rsKprC8PJ/cvpkmxD7wqWMHt4ir7+5RvGVOOZ
	 PWkPo2HnnJ3PfexzdQkUk+suZsgvNZx6XNmsz9JRdG7dDpHG+21dPcJfyZmBHkudb0
	 vupP12DjnR81g4pW5Wn2ErrHxS1L9viS8UJvQ/VG0KsrTIx263ct18ELIe2pQffMiE
	 F+/YcgTAUeUJZsTg1t9MtSjlAZ7XoXOgjoLEoDdhMck8UL6IvCR2YsKLjAb82Tohna
	 75OReP3kiCAsA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8ORqOvS6pt
  k0H9DweLOz3fsDowe5zauYAxgjGLNzEvKr0hgzTh0axdjwTqOiluv37I0MB5g72Lk4hASeMwo
  0XxrLhuEc55JYv2Xv6wQzn5Gibe7ljJ3MXJysAnoSrz4sZili5GDQ0RAT+LqP1GQsLCAo8T6T
  Z0sIDaLgIrEwvUr2UFsXgF3ie6FE8FsCQEFiSkP3zNDxAUlTs58AlbPLCAhcfDFC2aQkRICih
  Kzp8tDlFdIvD58iRnCVpO4em4T8wRGvllIumch6V7AyLSK0S6pKDM9oyQ3MTNH19DAQNfQ0FT
  XzEzX0MJML7FKN1EvtVQ3OTWvpCgRKK2XWF6sl1pcrFdcmZuck6KXl1qyiREYginFTrt2MB7s
  +6l3iFGSg0lJlHd/uW+SEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle+SagnGBRanpqRVpmDjAeY
  NISHDxKIrxaNUBp3uKCxNzizHSI1ClGRSlx3oxmoIQASCKjNA+uDRaDlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ804CmcKTmVcCN/0V0GImoMXvzniCLC5JREhJNTDNlDgfaj3FjuH0t2M
  395beV4/7fpiRd4bZ+mDvSVP0+Xav+Mu/UStoRsiy6vx/l7tEqtY2qJXzLtvl/1SxyfTuCq+v
  Ik+DDjlWqMTvckw4XH+3nfWu2cH26SsPvFWbkbZ8s/yDZYLhG1z/WKw0TKsr2xY2bQdvk5JhR
  gT/gq1zj59Nfur+Wnfi1bZi7dXNvxr1FdXj97zPmpoQu/lzLBdzusF+cde/654LCkZXdayOb6
  hfOdXDo+yb1+lrnkKvVyrEMDJoGPN+TSx0uL4shn1LgadPWQt30Z8PDRfV0rzfXp/BulQjQHn
  xki+Z22ftW3Ek9/vnPYzyixnKn/UdeL/3mfSBq1aN7lfNbJTeclUrsRRnJBpqMRcVJwIAN2cA
  6jwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-532.messagelabs.com!1649247556!104813!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2497 invoked from network); 6 Apr 2022 12:19:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 12:19:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E89641001A1
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 13:19:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C5D9A100181
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 13:19:15 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 13:18:53 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.19.0 -> 0.20.0
Date: Wed, 6 Apr 2022 20:18:44 +0800
Message-ID: <1649247524-1202-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164077

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{createrepo-c_0.19.0.bb => createrepo-c_0.20.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.19.0.bb => createrepo-c_0.20.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
index 82351252e5..bc61cac955 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "a531ee881a8f1d9273b4383fb9fa604c56fff138"
+SRCREV = "e53188f86f4dfad46f5b81d6931cbaec19e44ea2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


