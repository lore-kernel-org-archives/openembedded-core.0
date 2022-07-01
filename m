Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6AFCCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:30:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.37159.1656675013844819797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M5wyOmql;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656675012; i=@fujitsu.com;
	bh=+BjVmNrDLGph6IDy3hTzGjlMDqcsclHDSDzggSbTez4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=M5wyOmqlTTxhjtuQLUH7K4DrcyO7T1LvWd1ItfwJ9zVaJMpR/xJjN/eaqgUvr4rCf
	 ZTtPz0I/o/a0D+dh7fSqzYeSOonQwaJ72A+tDbGRI8sS7VNCFBMMYISbFX93C413d4
	 ifeGSzeAgaMaWwqNK5sLevvXLIks5Yz5PYNl382OgxvoHO2/KblNxr++Rpn71xKkZp
	 BTxc9x3rMaMIo5DUnuBXsJBPHn4FEwc9cyZBtm6fYVvYMR8C/rPBFmK4w2G4NQsqBk
	 BMKxwEzg4pdXycuf20vZeDjVxfFS+G7mrvv4MjAWDiQHI+ktj1Y5urcDTsqDnjdUKa
	 iezwlGVFQ2hLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqHv41r4
  kg7YdWhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a7Oz9ZC2ZwVvx4+ZipgfEERxcjF4eQwGNG
  ibMb7jFCONeYJD71bQVyOIGc3YwSy74mgNhsAmoS02/dYO1i5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSwQJLG4rw+shAUofvS0G4jJK+AkcXASJ0iFhICCxJSH75lBbE4BZ4mHeyYzg5QIAZV0r+
  EBCfMKCEqcnPmEBWK4hMTBFy+YIVoVJWZfbmaBsCskZszYxgZhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJNUlJmeUZKbmJmja2hgoGtoaKpraaZraGykl1ilm6iXWqqbl19UkqFrqJdYXqyXWlys
  V1yZm5yTopeXWrKJERjAKcUJLTsYb+/7pXeIUZKDSUmU9+q1fUlCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHjzbgLlBItS01Mr0jJzgNEEk5bg4FES4e0HSfMWFyTmFmemQ6ROMSpKifP+PQ2UEA
  BJZJTmwbXBIvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeTdeBpvBk5pXATX8FtJgJaPH
  OaXtAFpckIqSkGpi2aKrNLvxz+6uX6dPM/R6rvz/lYuswLuqJXPzcrVo9fcpFGRZGcY0u3iMH
  7u7qiriz7OK0En+7matW7pho9HOKcesOreOtGdLLz9RovO3hz7nKEy3aWvuxL4gn83N1S/vqS
  xH83Yrm0mdMBD9xs/T0H/oUUSPvPs9ggvep1S7T37yevCBXMvT1Xub6D4K1TwK2KMdamRxlry
  9oPXXmbG6RRJB0QO3rPX4K+kt7y1uuvF+/7OJbbb34d1zW31sWxKp1q2aExfipPM+yfti+dV1
  p0fqQ5YU9lld/b0mPaHs7e5pbwqwN2oW/GytvaPDwHQyozjzu8c/N+vG0/Kc5WRPP6hmes1og
  Xqy8kO2tkBJLcUaioRZzUXEiAOYrNtdbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1656675011!19455!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4980 invoked from network); 1 Jul 2022 11:30:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 11:30:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 108D910018D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 04649100043
	for <openembedded-core@lists.openembedded.org>;
 Fri,  1 Jul 2022 12:30:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 12:30:09 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 9/11] gstreamer1.0-rtsp-server: upgrade 1.20.2 ->
 1.20.3
Date: Fri, 1 Jul 2022 19:29:48 +0800
Message-ID: <1656674989-20458-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
References: <1656674989-20458-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167463

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.20.2.bb => gstreamer1.0-rtsp-server_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.20.2.bb => gstreamer1.0-rtsp-server_1.20.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
index fd6e16c2bf..fd4f82fcc3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.3.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6a8e9d136bbee4fc03858a0680dd5cbf91e2e989c43da115858eb21fb1adbcab"
+SRC_URI[sha256sum] = "ee402718be9b127f0e5e66ca4c1b4f42e4926ec93ba307b7ccca5dc6cc9794ca"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.25.1


