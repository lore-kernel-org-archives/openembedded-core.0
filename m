Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5ACC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 07:13:09 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.4865.1646205180599165564
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 23:13:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: liezhi.yang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2227Cwlt016424
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 1 Mar 2022 23:12:59 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 1 Mar 2022 23:12:58 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Mar 2022 23:12:58 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 1 Mar 2022 23:12:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] quilt: Disable external sendmail for deterministic build
Date: Tue, 1 Mar 2022 23:12:56 -0800
Message-ID: 
 <da174f47123489e5a166714eae77da7807951f6a.1646204967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1646204967.git.liezhi.yang@windriver.com>
References: <cover.1646204967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 07:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162593

Otherwise, the build results would be different w/o host's /usr/sbin/sendmail:
1) The /usr/share/quilt/compat/sendmail will be genrated if no
   /usr/sbin/sendmail on host
2) No /usr/share/quilt/compat/sendmail if host's has /usr/sbin/sendmail

Use --without-sendmail to make it always generate /usr/share/quilt/compat/sendmail.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 19532051cda..07611e6d853 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -25,8 +25,9 @@ PATCHTOOL:class-native = "patch"
 
 CLEANBROKEN = "1"
 
-EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
+EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch --without-sendmail"
 EXTRA_OECONF:append:class-native = " --disable-nls"
+
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash ac_cv_path_COLUMN=column"
-- 
2.31.1


