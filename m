Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC5BC05027
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:41:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.5802.1676256059622892285
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Sb7dhTWG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256057; i=@fujitsu.com;
	bh=X+d3qaZLmt73yeOAfnO+ljqirEdR0LZd7Us4LQ82ixY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Sb7dhTWGhYoB+qPZ6/WOkDZ1kx3LtObf+M2bA7eD15xvOISGgbgJEMNTCUENOdRtd
	 7HCqs2OgPB0JUWQPJzabzzGzNc5ku61L0t5e7k6uqZPSDyCluodZ4u+EBngz1sK8vW
	 9gll5BlQpPD/rM5LnCjHa46CWUPSIQ79XQB3igZ4TrUrT5O4/dUkzjFGrKI/BSyiZQ
	 bCSRwMGvrgfJ29Y4ZJfZKLCCqggCiZt1q8UZz2XRT66BpJN1reG2itvJCaGJtFPl2e
	 VrQCx4WfETRMc9d5aL+pO93jfpc5BGqS1zqEknJrf6BUQ9cwYyNFOyhRgbsgXxXSy/
	 IZP1yeFqI4mqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpGux+GW
  yweQuVos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeN48x72grOcFXNun2JpYNzN0cXIxSEk8IBR
  YkrfNLYuRk4g5zKTxLsHuhCJvYwST5b/ZAFJsAlISdy4/x+oiINDREBP4uo/UZAws4CKxIvfP
  ewgtrCAlcTD1d2sIDaLgKrEs/YjYDavgJPEohfHwGwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgix
  fMEDWKErMvN7NA2JUSrR9+QdlqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6ZrpJRVlpme
  U5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhmJKccLjHYzz+v7q
  HWKU5GBSEuXt43iZLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV2oBUE6wKDU9tSItMwcYFzBpC
  Q4eJRFeiwlAad7igsTc4sx0iNQpRl2O9u1dB5iFWPLy81KlxHn5FwIVCYAUZZTmwY2AxeglRl
  kpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8u2cBTeHJzCuB2/QK6AgmoCMe84EdUZKIkJJqYFq
  moOx+a+nR8/qlGjw7g+/bfNt2L87Z9OTl6trLhz/LxvMd9e+zCNI/8LJVVz5xypTa+ogJl3ZJ
  dR69Ged6/9aD5Fn/r96Pv/5onSCbc12wW9mcgD+TlkfIcpWxJm3lfaOu9nPygecVBuUHQv91y
  Jh7NSh5H0pi1j1Ue9PnTfbRWwuE2R127EladLnJOvJan+bt5ryV3/w+Otefe7vN2fKjCltNyq
  f9P9nk2/mL3x6KZpavnhhh//1aWKywYVTVpNDaaL2YJ33XYi/u9JlwyObRtUWy0XIWLOqiF2c
  aPzCMDPMx7NhjZVy7V1pfu8F/SbHJLkM9sbl1d0xi5PKTpixeOD9K9mN6jL2uucZCJZbijERD
  Leai4kQAZrHuokwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1676256055!716115!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10773 invoked from network); 13 Feb 2023 02:40:56 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:40:56 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 81B7B1AD
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:40:55 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 752DB7B
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:40:55 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:40:54 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] openssh: upgrade 9.1p1 -> 9.2p1
Date: Mon, 13 Feb 2023 10:40:41 +0800
Message-ID: <1676256044-19550-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177077

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssh/{openssh_9.1p1.bb => openssh_9.2p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.1p1.bb => openssh_9.2p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb b/meta/recipes-connectivity/openssh/openssh_9.2p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.1p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.2p1.bb
index 23ae8d5b0c..e6cf2ff2d6 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.2p1.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] = "19f85009c7e3e23787f0236fbb1578392ab4d4bf9f8ec5fe6bc1cd7e8bfdd288"
+SRC_URI[sha256sum] = "3f66dbf1655fb45f50e1c56da62ab01218c228807b21338d634ebcdf9d71cf46"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.34.1


