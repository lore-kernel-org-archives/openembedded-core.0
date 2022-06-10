Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BC2C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 06:54:57 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.23825.1654844091237158946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 23:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25A6snte026847
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 9 Jun 2022 23:54:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 25A6sf7e011948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 9 Jun 2022 23:54:49 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Jun 2022 23:54:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 9 Jun 2022 23:54:39 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Jun 2022 23:54:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] xxhash: fix build with gcc 12
Date: Fri, 10 Jun 2022 14:54:38 +0800
Message-ID: <20220610065438.36893-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 06:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166789

From: Kai Kang <kai.kang@windriver.com>

It fails to compile xxhash when '-Og' is set in CFLAGS via such as set
DEBUG_BUILD = '1' in local.conf. Check and disable inline when '-Og'
exists.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-support/xxhash/xxhash_0.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/xxhash/xxhash_0.8.1.bb b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
index b3b97025987..222ba7b77c9 100644
--- a/meta/recipes-support/xxhash/xxhash_0.8.1.bb
+++ b/meta/recipes-support/xxhash/xxhash_0.8.1.bb
@@ -14,6 +14,8 @@ SRCREV = "35b0373c697b5f160d3db26b1cbb45a0d5ba788c"
 
 S = "${WORKDIR}/git"
 
+CFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
+
 do_compile () {
 	oe_runmake all
 }
-- 
2.17.1


