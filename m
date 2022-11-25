Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22ADC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 03:09:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.39097.1669345788140710403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 19:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SRfcZ7zE;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669345786; i=@fujitsu.com;
	bh=N7C26HT3YsB6gA/u4TWwrHhtf5bH0HDWPxf4NGU8YX8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SRfcZ7zErX+dWXYb1yfvZSEqIo0/goM+KILyGe9y7A5px/TouWilx+Z6hzRS87zdU
	 RoNDIBgdZ0m0qtMrO3vIWhrVYgymUMpjhOaJN5nn6kNQjd2K3Ssi8JKsA/6Qv+AX3D
	 3q3xQWrOzKFRWJrotHyafaCCeszksHJ40G7rYJ2wrBCqIId9KG8lktRkGyTN8PII7T
	 vW1JGrM1PTGJyoy0WCm2q3nfg5giwD4U+kkNshmV6bogWXY7KeqD6jkGg7BYSJq2ck
	 N3dy2rvL4PuRdJeSDjXKwpfIlUkyzFZ/zKEIROaKLJkk+N2AWAtA02a/JCr9CrEgps
	 VKMPRr+kCy4iw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORqPvTsCH
  ZYE2npMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjHzX2jBco6KlbtusDYwbmPvYuTiEBJ4zCjx
  +91RRgjnGpNE75qtLBDOHkaJN1dXs3YxcnKwCUhJ3Lj/n62LkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAn8TyeRfBylkEVCX+fZ7DCGLzCjhJTPk1kw3ElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr
  54wQxRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNpcWpRWWqRrqVeUlF
  mekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmAgphSz/d7BeH7Z
  H71DjJIcTEqivDe+1ycL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCdqNeQLCRYlJqeWpGWmQOMC
  pi0BAePkgjvQ5A0b3FBYm5xZjpE6hSjLsemw1f2Mgux5OXnpUqJ8y7VBSoSACnKKM2DGwGL0E
  uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl19YGm8GTmlcBtegV0BBPQEU916kCOKElESEk
  1MHWebjd213hh59C47baAxN4ClxciF0qTfv+7sFFgaYXvyuZA0w6ZJUmS4bv59+41mOZoZXja
  cglzXebyFIM+Ca9vypJhU68pXd01c+6tBW8FQpavO8Ry0d+6fEqYQeCN01e/HWFIrLefq7f/U
  s2E1+2Ctw2/5yZuTf46aRaXvu2Upgn1+cdWyHF/7q6ON2C/zGjIbLTz8/GcKy0xu+/GvXK2um
  J0Trp+16o8JavkgC3m73hmTb54/1TgpqOBG3cmGZ4VXFR4e8nsY0tvbr1hk+fvwJgeLLcgd6p
  B9QEtuW+FxqatxvFsL9bbOnTOurBSXFch/eRyXpZMwSl/Av16qxcdtv3+Wa4g98FN/tgtXkos
  xRmJhlrMRcWJAEjUdxNLAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1669345785!1841!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25941 invoked from network); 25 Nov 2022 03:09:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 25 Nov 2022 03:09:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0B0D810019A
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 03:09:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id F2DCC100195
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 03:09:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 25 Nov 2022 03:09:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] Integrate nativesdk and native of systemd-systemctl
Date: Fri, 25 Nov 2022 11:09:20 +0800
Message-ID: <1669345760-19228-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 03:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173759

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{systemd-systemctl-native.bb => systemd-systemctl.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/systemd/{systemd-systemctl-native.bb => systemd-systemctl.bb} (90%)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl.bb
similarity index 90%
rename from meta/recipes-core/systemd/systemd-systemctl-native.bb
rename to meta/recipes-core/systemd/systemd-systemctl.bb
index fadc8433d8..21d7bda816 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta/recipes-core/systemd/systemd-systemctl.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 PR = "r6"
 
-inherit native
-
 SRC_URI = "file://systemctl"
 
 S = "${WORKDIR}"
@@ -15,3 +13,5 @@ do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


