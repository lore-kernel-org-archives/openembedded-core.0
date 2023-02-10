Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BE4C636CD
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 07:35:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.9051.1676014507980711653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 23:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uO/j+LRj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676014506; i=@fujitsu.com;
	bh=gVgXhy3/Do0AizNUyBvTaU6aGYtSRLuMoTIpPiwok5M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uO/j+LRjv6RFi1lCxWy/LwwpLsw32z5j0G1IgK6hInClG+2nxp6xckq7E1zUtuivN
	 gRnh2K/yZAwnTWL64LxAZNgqqMESqv0mkj5IuG3SbF9UdZNpdMa8in2WgQXbt3bebW
	 3pFT06EckHIfE9gUQI1JFRtpH/Rl59CNs7MEvgfSShRT5rTA4OBvVmoRSNejZ1z94T
	 0lTLD+7jniKRp2u6hiwL2zPEmHBtCLt8Wr22SON69Ihvdgm2J8lPoYbEw4Rn/JCnx8
	 S9Td3RT/ISsu2kT9IZv2p2h1IIk7cJuYMhkOtrwIiSWm7ckznP4FYsbPhZBkml278L
	 kiS+jvjE+skRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSXfl56f
  JBjP3q1jc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBlvDnxlL1jOXrHk+3umBsZjbF2MXBxCAo8Z
  JS7ensQO4Vxnkmg+dZURwtnHKLH5+UemLkZODjYBDYndUy8zdzFycIgI6Elc/ScKEmYWUJM4+
  vInM4gtLOAqcfTpaXYQm0VAVaLz2VtGEJtXwEXi+M2jYGMkBBQkpjx8zwwRF5Q4OfMJC8QcCY
  mDL14wQ9QoSby9tIcRwq6UaP3wiwXCVpO4em4T8wRG/llI2mchaV/AyLSK0bQ4tagstUjXWC+
  pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBRTipn7djB+
  7f2rd4hRkoNJSZR32eanyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeCd/AMoJFqWmp1akZeYA4
  wImLcHBoyTC6/saKM1bXJCYW5yZDpE6xagoJc6b8wkoIQCSyCjNg2uDxeIlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8S0Cm8GTmlcBNfwW0mAloMYMU2OKSRISUVAOTOH927sOtK1d3Hyp
  Y32+047v/Zz5Z3xKZFM4ofsZDiioxSYzvv519eipYZHPUl072A6n8kYo/+zf/S9vxSeuWk9Zv
  2V8JDv8X9LrsK/nn1/ps7/NjG04nrfv1bV/1eQ831SnO9w4fvFnDdst822mpyvUifBac976u/
  bjjt4S5QsqiojYehXfLmZqt/K7acl1NVd03JSeJR8z1z2WJPddyWGTqbS5Jh839sdei4euO7/
  OffQ2J0NzOfCl9muWNP5O10+dMbL37ae5fhquR/nnHTU6eW1qy7oLJ15b0eV/mhh8OS/geyDn
  V//J7gVKPI+EdAa1X7hjnl26MagjV3GnNc+DpMxOVnzJ3RPo2+HL0K7EUZyQaajEXFScCAKIN
  tIhAAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-18.tower-587.messagelabs.com!1676014505!643579!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20880 invoked from network); 10 Feb 2023 07:35:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Feb 2023 07:35:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3CC9A1000EE
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:35:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 30BE41000D2
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:35:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Feb 2023 07:35:03 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: Fix do_rootfs error as following:
Date: Fri, 10 Feb 2023 15:34:45 +0800
Message-ID: <1676014485-3128-1-git-send-email-leimaohui@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 07:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176983

Problem: conflicting requests
  - nothing provides nghttp2-client >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64
  - nothing provides nghttp2-server >= 1.51.0 needed by nghttp2-1.51.0-r0.core2_64

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.51.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
index 8ddb851f71..72a4372214 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.51.0.bb
@@ -24,6 +24,8 @@ RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
 ALLOW_EMPTY:${PN} = "1"
+ALLOW_EMPTY:${PN}-server = "1"
+ALLOW_EMPTY:${PN}-client = "1"
 FILES:${PN} = ""
 FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
 FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
-- 
2.34.1


