Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414A8C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 01:53:29 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.3930.1653011604618511885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 18:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24K1rIBL014952
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 18:53:24 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24K1rHNE011795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 18:53:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 19 May 2022 18:53:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 19 May 2022 18:53:17 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 19 May 2022 18:53:16 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] layer.conf: Avoid indirect help2man-native dependencies
Date: Fri, 20 May 2022 09:53:15 +0800
Message-ID: <20220520015315.3139735-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 01:53:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165915

From: Changqing Li <changqing.li@windriver.com>

When DISTRO_FEATURES efi-secure-boot and ima is enabled, all the target
will depend on help2man-native. During build time,some recipes will run
target_binary --help when help2man exist, which may cause run target
binary on build host, which will cause error.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a5d727ef5b..f2989ef81d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -107,6 +107,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->texinfo-native \
     .*->perlcross-native \
     libarchive-native->e2fsprogs-native \
+    .*->help2man-native \
 "
 # Nothing needs to depend on libc-initial
 # base-passwd/shadow-sysroot don't need their dependencies
-- 
2.25.1


