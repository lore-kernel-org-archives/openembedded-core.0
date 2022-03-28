Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37FDC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:50:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.9095.1648461007759289702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fLg3zyIG;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461006; i=@fujitsu.com;
	bh=c2l4DeqywR+9K2r+P/zxfE84NgCjlhq/JOjqxEkJnVg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fLg3zyIG0xatQxbO9Tv64fwZkKKOyxskrIxs74dmZvsmxJayfxRNhORTSZGUEFSyF
	 FBiO8WqfipYimQXn3aor8sSeMgmVKZnw3udzWW+yTqIjAkStRhUpTOc35MtcPgKfid
	 Ow4W7ix/YJz7eIfVO7EiogBUxdyekrx9ePgagsejIWa9f0/noCBTNwzC3MRQI2GH8k
	 73hI1SI+AcnmGUQCoZpj0COh/QZH0owHChBxGIvzfp/A3qWyBxWU+KPYf6lU2Ecj9e
	 joek1DKkZpw9DMHZOicc3ObWJfeBTBFMTCyavJKXvRptpiDnGr26WS339NUkyUTHP4
	 98uND8MXWednQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfdsi2O
  SQctOWYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPWwrksBYc5Knp2X2BrYLzD3sXIySEk8JhR
  4vh52S5GLiD7PJPEw2fz2SGcPYwSjbdmMIJUsQmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z1gg4QFLCW6vx1hArFZBFQlDr5dC2bzCjhJfDryhgXElhBQkJjy8D0ziM0p4Cxx/ulCqCOcJF
  7tvQlVLyhxcuYTFoj5EhIHX7xghuhVlJh9uRlqToXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGRkCmiV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFl
  bnJOil5easkmRmAQpxQrZOxg/L7yp94hRkkOJiVRXqNMxyQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKErwVDUA5waLU9NSKtMwcYETBpCU4eJREeE2bgNK8xQWJucWZ6RCpU4yKUuK8as1ACQGQRE
  ZpHlwbLIovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmvQUyniczrwRu+iugxUxAi9e+swV
  ZXJKIkJJqYArvuBCq/Kt0VYns5wdcV3mZD1y1efv6UH9pfM7TO9ZCmUunf733951p8sfMDcuX
  7P7XemQfa8t2Q5XTgSJVSiXqktevKCWozH1g0G315kPt7Z0RWqc3MkrMDZihueL5dr7FE5L5X
  e55LGNZ8vVQnT+Hg9WtVj/nb8xbJP4w8ZU5u/dX2TKFsAXZXxFJYy418/uoK1mUlZq85syMbX
  6ni9LFNvMc8Wh2sZUKkI6ZV7t8iXRnXtPaZ2+2NWftlvmiX16ZcU3HrU+rNT/gv8aFZd/eHOx
  XE0yPVLS9HyR28XxdSf993/uzM94khrOtnMU28xR/QVCjminj8aLciSFvjM2YfL91fZj4/klr
  qdpsJZbijERDLeai4kQAMPO1D10DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1648461005!25580!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 901 invoked from network); 28 Mar 2022 09:50:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:50:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 09DD310045F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:05 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E1D53100446
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:50:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cronie: upgrade 1.5.7 -> 1.6.0
Date: Mon, 28 Mar 2022 17:49:39 +0800
Message-ID: <1648460981-15712-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
References: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:50:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163690

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cronie/{cronie_1.5.7.bb => cronie_1.6.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.5.7.bb => cronie_1.6.0.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.5.7.bb b/meta/recipes-extended/cronie/cronie_1.6.0.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.5.7.bb
rename to meta/recipes-extended/cronie/cronie_1.6.0.bb
index 8200bedb19..d2f08c9af0 100644
--- a/meta/recipes-extended/cronie/cronie_1.5.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.6.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "538bcfaf2e986e5ae1edf6d1472a77ea8271d6a9005aee2497a9ed6e13320eb3"
+SRC_URI[sha256sum] = "3f7cc263d21838b53a9943eb2a26b862059e2ae36c3f11789ac33cd6818e3628"
 
 inherit autotools update-rc.d useradd systemd
 
-- 
2.25.1


