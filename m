Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC139C43217
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:00:07 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.8942.1647950405604357235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GnCEWvVQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647950403; i=@fujitsu.com;
	bh=Tmq84Mk7vBv8hA1qddHwoX253XYMxgMQTsDNmHaBexQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GnCEWvVQ2/hyhrJPD44ry6puKnBsbdNh/2tiWkJs+1NgQmgakEjgSeopW8OBcGq8u
	 KOYATUsiL/nEYzEwr8X54ls9/68+wA5/gzK+q3qRvdjktVwt/xDLPrmroD+7fGQ/wF
	 yL6os2CJ+tYbjnusbKhYDvoJtrm0LXHFAvqvA23KDfYmKpYBBtpzxpRwhrne1bR8Bm
	 q6SZS7bofN4GWf3AjqCD9Fa6Hl8uKATVw3Pr68wJiL9sMsUMvqcSVbSa8BCCdAblxd
	 QeL7oBySAfw1rX5Hh1GUFmvLsaGFlyTxEG61wnKb5LEa/FbDn5lK+vDraFo6s0FyE0
	 6z7sdgdNtVx0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqOu8yzL
  JoOGxjMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFh5VbWgrfsFd+uvGFvYGxh72Lk4hASeMwo
  sX/xTcYuRk4g5zyTxLczFhCJPYwS328sBEuwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAlcT/X8dZQGwWAVWJT+tugMV5BRwl5q7azQxiSwgoSEx5+B7M5hRwkmg9fYcZYq+jxN
  OZ31kg6gUlTs58wgIxX0Li4IsXUL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6BoamuoaW+oaGRrrJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKsfrVHYybV/3UO8QoycGkJMorvtwySYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IE7/rtQDnBotT01Iq0zBxgRMGkJTh4lER4/24ASvMWFyTmFmemQ6ROMSpKifNO2AmUEA
  BJZJTmwbXBovgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeGSBTeDLzSuCmvwJazAS0WJ/
  VDGRxSSJCSqqBSdIs1X3W68/bfrz4GJx1zofFt2d/bEGTu+l5/tnLm/7oN8utP9u5vcHOb///
  A5PEd8TO7lI7HTFzMtstVadH93+rebG5S76c+HvCE6Zy3xSekE42reXv/pSHTy/rEjWJO+yzp
  yZtSn+XYon2smkXZhn7bdzzvlXZ3mee3132E5a+v+e2ZaZM0FgUL73k0O8zX87MlZ1gtWrOjD
  96evqtShedpN+/r3x3vKp2Oo/Soam1aVlWwmIcy59cMnbmcZoZOmfddouPx93evX7cfcTtY+G
  kG/t2fP+4WOTUtOJ3UofLNwSLfr2ruXaLzHuTzZWfWPlWxbowhv//HslqKHfH0W+m04WvZxK+
  XFC1/1l85YcSS3FGoqEWc1FxIgBZj0rMXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1647950403!12304!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15387 invoked from network); 22 Mar 2022 12:00:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 12:00:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 04EB2100196
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:00:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CFC9E10018C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:00:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 11:59:46 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] bluez5: upgrade 5.63 -> 5.64
Date: Tue, 22 Mar 2022 19:59:32 +0800
Message-ID: <1647950374-5921-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647950374-5921-1-git-send-email-wangmy@fujitsu.com>
References: <1647950374-5921-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 12:00:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163549

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bluez5/{bluez5_5.63.bb => bluez5_5.64.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.63.bb => bluez5_5.64.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.63.bb b/meta/recipes-connectivity/bluez5/bluez5_5.64.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.63.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.64.bb
index a9ee29135d..4319f9aae8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.63.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.64.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76"
+SRC_URI[sha256sum] = "ae437e65b6b3070c198bc5b0109fe9cdeb9eaa387380e2072f9de65fe8a1de34"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_IGNORE += "CVE-2020-12352 CVE-2020-24490"
-- 
2.25.1


