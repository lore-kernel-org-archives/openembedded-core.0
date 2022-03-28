Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1559C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:55:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.9126.1648461355033701247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pTpT4jaT;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461353; i=@fujitsu.com;
	bh=iKNPN/QycnwSXuL9sGjOt1ci0PqCscKqXhrtVQ8QMqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pTpT4jaTv4CtoHO0mxiEI9OsCt/tTv4UXuamLlH3S0Wb0QfwWKCrGvPQAtGQjORPn
	 wxCZvuMDwO7ZL/bHirwfYdU9IKPDOcAHD2T97O5w3DkuYWwpIH7A1rqtU2Dch8xRQM
	 O0ptTS2t3x4wrVj9yWygALQBZu5BXeMBBCIkjZGVIcOpRNl0mFJu7jkCliItZeWTJZ
	 rNvyljcpCrbZnagob6Rhi4kJZ8i2zEvxBFyLsXuzR7d4P8wYcSmQrlZSM5PJ6XguI/
	 RBte4/tFYpcbqwWs6Z3bcKDhadP+NXOziDdZ+30idSXkGsnXLY4W7336/W/13fpfFT
	 rfhdt49mEnmgg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSVejzTH
  JYN48G4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePczCtsBbs5Kr7smM3awPicvYuRi0NI4DGj
  xKwvm5ghnPNMEm/OL2DpYuQEcvYwSlzY4ANiswmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJXEtKM/mEFsFgFVifs754LZvAJOEgd2fgQbKSGgIDHl4XtmkDGcAs4SC87ag5hCQC
  VPFuhBVAtKnJz5hAViuoTEwRcvmCE6FSVmX26GmlIhMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamuoa6RgbFeYpVuol5qqW55anGJrqFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZg+KYUM57ewbip76feIUZJDiYlUV6jTMckIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8t5qBcoJFqempFWmZOcBYgklLcPAoifCaNgGleYsLEnOLM9MhUqcYFaXEeZlagRICII
  mM0jy4Nlj8XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOvSAjSFJzOvBG76K6DFTECL176
  zBVlckoiQkmpgEsrb/sHWd5nlYc9Gt+Y4v5WnWF7x7a+/+G6hKqPzP4l6vk1zWh/pJ20Rf2e0
  /J3IpPczBeUlL3bXFO8vEtWfHsfR2b8jq+PFC4lJxx8ozhQoFPmy4fA567VxcZ9DRXo7tMzWZ
  O/9veCm5Xzms5e/GFxZy8n4V//C/Hv/9hXukb99ysr50JZpHYYxTZt2XLoh9DY639Dmm73sxF
  MRd0Iirqz35AzpZf226lH62RksfRnZ7zbG6bm3OnLdOTDV9t38K6vlS/kqdwRLeyUIm6Yk7xG
  N27xox+u10yqWX3vglDbLyPZNWuLPGtubh5J/nvfSrZxT+sNwzr+qA7P2z2CeI/7gVWj2+Zcn
  De4tjzjQK6jEUpyRaKjFXFScCACcqfevWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-31.tower-587.messagelabs.com!1648461352!26846!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4740 invoked from network); 28 Mar 2022 09:55:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-31.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:55:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8B3541000FE
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:55:52 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6C38910044C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:55:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:55:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] msmtp: upgrade 1.8.19 -> 1.8.20
Date: Mon, 28 Mar 2022 17:55:27 +0800
Message-ID: <1648461328-15808-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648461328-15808-1-git-send-email-wangmy@fujitsu.com>
References: <1648461328-15808-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163700

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.19.bb => msmtp_1.8.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.19.bb => msmtp_1.8.20.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.19.bb b/meta/recipes-extended/msmtp/msmtp_1.8.20.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.19.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.20.bb
index bdbb1daadd..da3f70a163 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.19.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "34a1e1981176874dbe4ee66ee0d9103c90989aa4dcdc4861e4de05ce7e44526b"
+SRC_URI[sha256sum] = "d93ae2aafc0f48af7dc9d0b394df1bb800588b8b4e8d096d8b3cf225344eb111"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.25.1


