Return-Path: <ahsan_hussain@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FD3C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 08:56:15 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web10.29912.1643619374163058534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 00:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: ahsan_hussain@mentor.com)
IronPort-SDR: 
 /ShBAz5PV9VEsjrVMF6XW6DJz143FEUWGXy4TAEew5JbP7i4CnZ/RWMpcoP+FcHl1m3AoSkg/R
 wfHYDoUMrMDgBIITCjCeT0yEZ8qYc1TzmMqmiytbLqCguH/SBA+gU/rwtje0u9b/6O0PfKnkjH
 pDfN80SjBUrTljhcFguZxI79OXzbK9EOGEo+Xh2twxMqCDBhdAoQyxuPDvOD51tOyc3ZQiIIAF
 rn/MaKVyU32GO0LbyOUAwjKrPVkXSWT30joHFIEIOXoVCJs/xRP5YNuFebOBBSHcuUL89imxk0
 DAdYTDjsVLaSVsqXsESyPvqf
X-IronPort-AV: E=Sophos;i="5.88,330,1635235200";
   d="scan'208";a="71401934"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 31 Jan 2022 00:56:13 -0800
IronPort-SDR: 
 mJAQiR/bYuycGWkKiLUJ5LxMzYeRB+xBg+r/MZKyLcbepKmiqSPL3V44aRTUig0VAGCQg3Zu+p
 H+v77zs0fmvDKx3wQjZqalMFWCJckKVmXRLPpfHUMvJxragfEWiN5ROJeM+czWi+F1yhKfNbgf
 PxPGf3JWb/nOmmEmZJcU3sXQEYc0DQsvPtNNkmE4zpPfonjadO5Q+Zwsn+rV069bZJmdna5fAi
 DiR/qijvH1PittRi7h8j1BKuH4sczBUwTWf/0SySL9fxylTRxEB82BQLhNu5yoKY9ZyOuSREKR
 jGM=
From: <ahsan_hussain@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] staging: use relative path in sysroot_stage_dir()
Date: Mon, 31 Jan 2022 13:55:48 +0500
Message-ID: <20220131085548.25074-1-ahsan_hussain@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 08:56:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161118

From: Ahsan Hussain <ahsan_hussain@mentor.com>

A regression form cpio CVE-2021-38185 caused the tool to hang for paths
greater than 128 character long. It was reported here:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=992098

We were able to reliable reproduce this with dunfell, meta-freescale
recipe imx-boot

https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-bsp/imx-mkimage/imx-boot_1.0.bb

Using relative path on the affected host fixes the issue as this is
always short, being in the same work dir. It would be harmless, and
useful to generally use the relative path for sysroot_stage_dir()

Signed-off-by: Ahsan Hussain <ahsan_hussain@mentor.com>
---
 meta/classes/staging.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 25f77c7735..4f278b2205 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -49,9 +49,10 @@ sysroot_stage_dir() {
 	fi
 
 	mkdir -p "$dest"
+	rdest=$(realpath --relative-to="$src" "$dest")
 	(
 		cd $src
-		find . -print0 | cpio --null -pdlu $dest
+		find . -print0 | cpio --null -pdlu $rdest
 	)
 }
 
-- 
2.17.1


