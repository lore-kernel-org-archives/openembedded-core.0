Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5EBC433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 11:22:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.9398.1647343367907208928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 04:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k30sYtoE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647343366; i=@fujitsu.com;
	bh=f8O5CvCQHVHkzHEisDUtzuXLh/SSXBjszTF7jDo7qiA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k30sYtoEDbTnM6cD1o7oZUyQZMJ8BDUZ7Gqoku39UMyoRAHZUQ3kaogTiF4eYiYsf
	 +8CD3sdyUf0GYsO2bzSOI8D+KNqE++EdXUS42mv1MBu9yRAZ8IHggU8X6dORUz5U9L
	 L8zo0e0xD5w3+D70SOjtrI6bz4hpIOZRcADirFNPIDNgQsIrPl1E4r2ZN07aSE1fYx
	 iCKZpEeQaFmTpBWMLpiLJm0d66gjcBVb5IX0H2Ol9HRZyOhZdtFL7uEMcP4k8/LPsj
	 0EY7OSbZ1iGLWVMaof/8bdOkgdEiElYW422cjUO+6Da8GU7sanh6lV9cXiMXS3BIcn
	 FeuullLsQtuVQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSZe13CD
  JoP+lscWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmtG3PbqghbvixtMbrA2MVzi7GLk4hAQeM0qs
  etHFCuGcZ5L4c72ZGcI5wSix8vQlti5GTg42ATWJ6bduAFVxcIgI6Elc/ScKEmYWUJF48buHH
  cQWFrCRuPD0KDOIzSKgKrHy7R0WEJtXwEni8e5rrCC2hICCxJSH78FqOAWcJS7feQgWFwKqud
  GyjhWiXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo3VSUWZ6RkluYmaOrqGBga6hoamusYWuoZG5XmKVbqJeaqlueWpxia6RXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBCnFKvV72B8sfKn3iFGSQ4mJVFeFhGDJCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvLGlQDnBotT01Iq0zBxgRMGkJTh4lER4X4KkeYsLEnOLM9MhUqcYFaXEed+DJARAEh
  mleXBtsCi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV6wMaApPZl4J3PRXQIuZgBbPk9Y
  DWVySiJCSamBa5Px2604rybo96itvdNpU/jTb2CGs2t5/0FbjpymfBCfDm50f5giIJ5Wlzyyd
  sm7i+R8vWq1YVZs+q0lwnOP1bwzdksAya/Gts2qKjNGzyua0mN/VqvJ78dp/AoPYi9VNqi8WX
  LeUW/RL9jv3nsXHv/i4rZsn+fvZ26t7En8vMFuk59qh9JPp7+62nrl3+nnui+i+1tDZbX7o6u
  UjdzPTglctmXjiVN7eLb1q+fferLKsMsy2aXD/Jt17ZFHklL3vPTZkLIiyOZq9d+ayT5kPzOP
  eVDAtZpmhUH+0UWr3ifyljzsFzGeKhl74kXLxYrrDip1hrg96JGcv+FAsdmBr79rpNYWiIg9K
  ZcxvPoxXVmIpzkg01GIuKk4EAL79MSpdAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1647343365!6947!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26220 invoked from network); 15 Mar 2022 11:22:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 11:22:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3EF7A1000D2
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0E1F2100446
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 11:22:37 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] librsvg: upgrade 2.52.6 -> 2.52.7
Date: Tue, 15 Mar 2022 19:22:18 +0800
Message-ID: <1647343339-78926-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
References: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 11:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163233

Changelog:
=========
Backport a fix for the regression that was introduced in the last
release:

- #851 - Output filled text as text for PDF; fixes regression due to
  outputting all text as paths.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../librsvg/{librsvg_2.52.6.bb => librsvg_2.52.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.6.bb => librsvg_2.52.7.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.6.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
index 346b400786..eb420e732c 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "a3f939a1e6a3a60408244632d0323f8c3b20eb4b7b000536e2e5bd93b8effaad"
+SRC_URI[archive.sha256sum] = "057c1eeeaf85c84e254bdb707459207f5840da5b4d52b4711c03140ed09e6887"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.25.1


