Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA6B1CCA479
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 06:25:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.27275.1655447149247176349
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 23:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=caY8JR5M;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655447147; i=@fujitsu.com;
	bh=gE52g33Ng4sLs8tI5jVZ8LP/W6tleY6w2WPqRY82bhY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=caY8JR5Mymk+f1y9s8oA0xmdKUkCE3haj+zjcEgqGmNUUAHokikTmE15JKmRK2aNz
	 jl+ojfK5nKvgbw8zb+W+bjHyl8ZX0g4owXmnCJsqKcP0YFjAfWbc05jN3/nbnV8Vem
	 BSbdyyBjpbr0K82k725GytsW/acgS2QjkFhALPGMEwypPb2bl1uzYEzq3Zg+RHtEYy
	 FMRHQspuFGtYcmeiN3m9iuV71iE2SMeu+RW8DZsIoMRIm/POTLTDdDHJ9HCsxDFrdE
	 hXOvJPKTgaVKy88eSVE3vURYji648yw9zyJC4euXaPTXRMDnny6tCDe7zGcSTcdf6x
	 N3AyWCS1Npr0A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8ORpJsltyb
  JYEKDocWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHj9RSWgi+cFR93yzQwPuLoYuTiEBJ4wCjx
  q3seE4RzmkliduMOIIcTyNnDKHHyuwiIzSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg
  9jCAh4Sh288ZgGxWQRUJRaf28IMUs4r4CRx9SQfSFhCQEFiysP3zCA2r4CgxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QmLGjG1sELaaxNVzm5gnMPLPQtI+C0n7AkamVYy2SUWZ6RkluYmZObq
  GBga6hoamQNoYSFvoJVbpJuqllurm5ReVZOga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZlSnF6
  2Q7Gq/t+6R1ilORgUhLldWdZkyTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgveRNFBOsCg1PbUiL
  TMHGCEwaQkOHiUR3o+yQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5eelSonzBoEUCYAUZZTmwY
  2AReslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8c0Cm8GTmlcBtegV0BBPQEY37VoAcUZK
  IkJJqYIqrnzS96O8D4y9fFedPuB3MHOB6pYKjh/vfovVinKviTtactWbz2zrZ+P1h+/fskWEb
  jJNm1q1IVj6WybZQ+f2pL5NnW7y81/VwgmLD44e18bs5NuUG1zzTzXvT/bzOdP5W/xft7M3X7
  ioftVz9gCtzjv7drpB7Hk7XeGf9Ct3zRKl4htHnMK8lFxuKrb9fOldTk/d569uXGteNbi27uP
  lM3otOZokX3xs3XSuRVrWqDzvoJzQ/UFLB/Y1ksx3XBRcF5ZyUzAzXGazczBwpUtW6Htc+d1+
  qaRPgf3eNa2md+bTQX9s6ll76xXmAl09Sc1nRts/K55Vu/+c8uq6uY5ooZ3/H1TVebYHatf0P
  HyqxFGckGmoxFxUnAgAaNSwvUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1655447146!63345!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12924 invoked from network); 17 Jun 2022 06:25:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 06:25:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 33D471B2
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:25:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 273CB7C
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 07:25:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 07:25:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.46.11 -> 6.47.2
Date: Fri, 17 Jun 2022 14:25:07 +0800
Message-ID: <1655447108-20329-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 06:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167018

Add dependence exceptiongroup.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-hypothesis_6.46.11.bb => python3-hypothesis_6.47.2.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.46.11.bb => python3-hypothesis_6.47.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
index 1d9772d4ff..f56bf3d19e 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.46.11.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.47.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "f5c1cf61b24b094355577a6b8fbbb8eb54c1b0216fbc0519af97c46bddf43c42"
+SRC_URI[sha256sum] = "9c01a225eada7d74d38430e3e91e659e3a892fbc2b15f7b051779ded6ab73ee7"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
@@ -23,6 +23,7 @@ RDEPENDS:${PN} += " \
     python3-sortedcontainers \
     python3-statistics \
     python3-unittest \
+    ${PYTHON_PN}-exceptiongroup \
     "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.25.1


