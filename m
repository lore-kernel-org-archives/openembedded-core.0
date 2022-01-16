Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730DDC433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 16:21:58 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.35034.1642350116796226510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20GGLsbk007541
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:21:55 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20GGLsWA019215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 08:21:54 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 16 Jan 2022 08:21:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 16 Jan 2022 08:21:53 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 16 Jan 2022 08:21:53 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] multilib.bbclass: set rpm file color for 32-bit multilib
 image
Date: Mon, 17 Jan 2022 00:21:50 +0800
Message-ID: <20220116162150.23946-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220116162150.23946-1-kai.kang@windriver.com>
References: <20220116162150.23946-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 16:21:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160614

From: Kai Kang <kai.kang@windriver.com>

The default rpm file color is 2 that Elf64 is preferred according to
OE-Core commit 56fa74497393a10f751d01c600c1936761e00294. For 32-bit
multilib image such as lib32-core-image-sato, Elf32 should be preferred.
Set it in multilib.bbclass.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/multilib.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 73ad2ab7b3..4a3e582816 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -92,6 +92,10 @@ multilib_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 python __anonymous () {
     if bb.data.inherits_class('image', d):
+        # set rpm preferred file color for 32-bit multilib image
+        if d.getVar("SITEINFO_BITS") == "32":
+            d.setVar("RPM_PREFER_ELF_ARCH", "1")
+
         variant = d.getVar("BBEXTENDVARIANT")
         import oe.classextend
 
-- 
2.17.1


