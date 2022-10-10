Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5321DC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:48:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web12.4070.1665391681688621970
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JeBejbJq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391680; i=@fujitsu.com;
	bh=rbHSvyMiKoi4kzhbGI825OLTbxK4AWnIanXr0Rk21eo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JeBejbJq37s1VM/PuZxQzznrwiK90+gIeJSg8KUePdIKUkC5s6wbPNP8F+NwmiNOl
	 bfaN664isajyzOh6IYFf5a6kXPVn5ZojsAko/55eXOKrtI83SC8SQqtDoQEt4qBKkK
	 1WmL/zNAVwE//Rc1RMMfgb2JBEjghlPWF4ZAE6xUrkUnOt8MLgWc3d/JOFlH+TSun7
	 LjMsxw8zLOXrxBHRQNr6al9EZV82Y2N8PwMPYYoHtVTEgnFFmRYcsvpQSXgCDXEijI
	 STvcsuM5SP+HR6a5EEyN4h3bsI66u2WeLbAcMWyij9cElJT1rnFCMhybeAjpYwsl4b
	 N1DyGMSgL/Gpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqGt/xzn
  ZoKVR0+LOz3fsDowe5zauYAxgjGLNzEvKr0hgzdjT0cda8Iq74teK5YwNjFe4uhi5OIQEHjNK
  fDowkxnCucYksae9iRHC2cMo8fzlHCCHk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQVsJfqXLAMrZxFQlXh1dw4riM0r4Cgx9dgcJhBbQkBBYsrD98wgNqeAk8SvCXvAbCGgml
  nTW5gh6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtUHNVJO4em4T8wRGwVlI2mchaV/
  AyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FTXRNfSWC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gy
  NzknRS8vtWQTIzCEU4pZYncwbu37qXeIUZKDSUmU1+CQc7IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd4nN4BygkWp6akVaZk5wHiCSUtw8CiJ8D64CJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn
  5eqpQ4b90toCIBkKKM0jy4EbDYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPc9yBSezLw
  SuE2vgI5gAjri5FUnkCNKEhFSUg1MAtpzAzTf3M922LKuLMNCe67CxuscwUsUWvkCMibxGdpE
  HU1mUZ5+7svXZU2TeX7uLGieWfLK4kLEjVn7/wof+DrJY3deiuYOOfbP3xJiggv3fj17pXQZx
  +sT2xb1fVjPu6Od4fFs9h+LDq4w/u54hOeCDnek0frAF2p6mkWJvnyxBo9PHy1dc3ta0Ly1N4
  K+pNbFnZuZ0s7RaP1XylvAdd5jd7eCSTetXCd/O7no2/WGc4WJlX4mP+Z1W51foXLYdXm+xuu
  pv3Xi3k0uLk8STpFg8c77FJRruVi3/tbpFR8v2N+/8MglOlba7r6V72WR7xcrTc1Pb3n52OOB
  rL660c2T9duuVrv+XHbCoKZaVYmlOCPRUIu5qDgRAPUVsgZoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1665391679!367346!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8018 invoked from network); 10 Oct 2022 08:47:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:47:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 496E2100192
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3D93A10018D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:47:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:47:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] u-boot: upgrade 2022.07 -> 2022.10
Date: Mon, 10 Oct 2022 16:47:33 +0800
Message-ID: <1665391655-8162-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
References: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:48:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171567

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2022.07.bb => u-boot-tools_2022.10.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2022.07.bb => u-boot_2022.10.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2022.07.bb => u-boot-tools_2022.10.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2022.07.bb => u-boot_2022.10.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index d7fd3c7227..60c77cbec4 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e092e3250270a1016c877da7bdd9384f14b1321e"
+SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2022.07.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2022.10.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.07.bb b/meta/recipes-bsp/u-boot/u-boot_2022.10.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2022.07.bb
rename to meta/recipes-bsp/u-boot/u-boot_2022.10.bb
-- 
2.25.1


