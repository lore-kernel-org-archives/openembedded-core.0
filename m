Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE2A2C64EC2
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.38334.1650283976959913586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=J0UHjK0a;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283975; i=@fujitsu.com;
	bh=+qf5PRatI0VRhxbeIueyR/t7naiwJAF/Lks6H0q/yKY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=J0UHjK0aypHglHsat2yv3igEXmPqweCLTmQ+3upua0wAtHiwYRscO2+4CCdlrTX8L
	 D8Zfp6HEo5qAPvUpY/Bti7uplSWNxpcY2wF8APMagVHZq7PvQZ8iEl4ZHqt12c/vFn
	 Nzr/JPO/UVd3UVPDbneHdLKLPMkCuFQn3m0UCzWjJ8lF411QCCubQC2x2v8CdBqksN
	 89ypFtoLJAj8xPPzoaggyeHsuhp7SC4pIU0dwbZvJhRyAEDbdNIoEG6a2C9GuDJFQ3
	 ZrSbIz3SirCdAMsGzDYhWrZxQ7TemLfM5XItFzSXei2zfQR63O9Rak3Ubo1g3qF5ll
	 lFg1hyofWkiow==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSfdYaGy
  SwbszahZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aO8/OYCg5xVCy9rNfAeJ69i5GLQ0jgMaPE
  yevL2CCc80wSt+9NhHL2MEocOP6YpYuRk4NNQE1i+q0brF2MHBwiAnoSV/+JgoSZBVQkXvzuY
  QexhQXMJP7PugpmswioSlzseAhWzivgJHFyZyZIWEJAQWLKw/fMIDangLPEtKubmEBsIaCS/7
  +3g23iFRCUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWiZVJSZnlGSm5iZo2toYKBraGiqa6hraqmXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYvinFjNY7GDv6fuodYpTkYFIS5f3vG5skxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYK3JQAoJ1iUmp5akZaZA4wlmLQEB4+SCC9HIFCat7ggMbc4Mx0idYpRUUqc90kwUEIAJJ
  FRmgfXBovfS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeUVDgKbwZOaVwE1/BbSYCWjx9vm
  RIItLEhFSUg1M8pmur2u/uvzZWnvY/NKy191ykozqL0NrrL9rpE5SkShq6uc/4rJZfonhx5y5
  X9b9XShRofrQyrAjVpmng0PrqIe4RJrG1mDXFeZ38loeHK35lVV42Ckh4X64ZKDmhZBlx0UmH
  BOfvszhf1x7wvK4f6YGFlPvLWnk3Hh1/uUZln9fpe98Ks1ze+aBxW7+Nzbsab6akvvNTDsiI1
  C3RM1tof7OjUbrPrBJ5y4RnswYlORz8GtdZ3Hptsfxhb3Wr8MPnBA7s2HnVMEY/uO/zpse4Ik
  /cE3v7FW7smiTXKG7az2cz13nOrH++7RfPpM+fGUU9Dt5rCCUL3sS40y/Dweb6xz7Gk89rG2R
  3a9W21atxFKckWioxVxUnAgAi8WoyFoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1650283974!198201!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5601 invoked from network); 18 Apr 2022 12:12:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:12:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2F82510047E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:54 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2120610046C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:12:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:12:39 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] apt: upgrade 2.4.3 -> 2.4.5
Date: Mon, 18 Apr 2022 20:12:24 +0800
Message-ID: <1650283944-16485-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
References: <1650283944-16485-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164592

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.5.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt_2.4.3.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.3.bb
rename to meta/recipes-devtools/apt/apt_2.4.5.bb
index 27e455747f..95c25e3036 100644
--- a/meta/recipes-devtools/apt/apt_2.4.3.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5a7215ca924302da0b2205862cd2d651326eea222a589184ec6ce663885729f7"
+SRC_URI[sha256sum] = "5552f175c3a3924f5cda0c079b821b30f68a2521959f2c30ab164d2ec7993ecf"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.25.1


