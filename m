Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95ECBC43217
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 01:37:38 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.59365.1640828257371906813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BU1bZJX025269
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BU1bU85016107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Dec 2021 17:37:35 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 29 Dec 2021 17:37:30 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 29 Dec 2021 17:37:30 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] valgrind: Add util-linux-taskset ptest dependency
Date: Wed, 29 Dec 2021 17:37:26 -0800
Message-ID: <20211230013730.129852-2-Randy.MacLeod@windriver.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/160055

We are using taskset to improve the reproducability of tests listed in:
   meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
so we need to have the ptests depend on util-linux-taskset.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.18.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index e825f83d5c..d8f82a4100 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -133,7 +133,8 @@ RDEPENDS:${PN}-ptest += " bash coreutils curl file \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
-   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg"
+   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
+   util-linux-taskset"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
-- 
2.31.1


