Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B836C4332F
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 01:37:38 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.59792.1640828258039395519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BU1bav7025272
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BU1bU88016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Dec 2021 17:37:31 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 17:37:30 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Dec 2021 17:37:30 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] valgrind: skip boost_thread for aarch64 ptests
Date: Wed, 29 Dec 2021 17:37:29 -0800
Message-ID: <20211230013730.129852-5-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
References: <20211230013730.129852-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 01:37:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160057

The drd/tests/boost_thread test passes when run interactively on qemuarm64
but fails for most runs when run in qemu on an arm worker such as ubuntu1804-arm-1
from the Yocto autobuilder cluster. Skip the test until we fix the problem.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index ef48458c3b..887bfd2766 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -33,6 +33,7 @@ drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
 drd/tests/bar_bad
 drd/tests/bar_trivial
+drd/tests/boost_thread
 drd/tests/bug-235681
 drd/tests/bug322621
 drd/tests/circular_buffer
-- 
2.31.1


