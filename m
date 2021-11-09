Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACBBC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 08:12:07 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.9146.1636445525977531227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 00:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A98C4ep021875
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 00:12:05 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1A98C41j021942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Nov 2021 00:12:04 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 00:12:04 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 9 Nov 2021 00:12:03 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of cpu number
Date: Tue, 9 Nov 2021 16:48:48 +0800
Message-ID: 
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1636447679.git.liezhi.yang@windriver.com>
References: <cover.1636447679.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 08:12:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157998

The original value is very easy to cause do_packge error when cpu number is
larger, for example, 128 cores and 512G mem:

error: create archive failed: cpio: write failed - Cannot allocate memory"

Set the ZSTD_THREADS to half of the CPU number can avoid the error in my
testing.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 71c1e52ad6..46ebf5113f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -833,7 +833,7 @@ XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --threads=${XZ_THREADS}"
 XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
 
 # Default parallelism for zstd
-ZSTD_THREADS ?= "${@oe.utils.cpu_count(at_least=2)}"
+ZSTD_THREADS ?= "${@int(oe.utils.cpu_count(at_least=4)/2)}"
 ZSTD_THREADS[vardepvalue] = "1"
 
 # Limit the number of threads that OpenMP libraries will use. Otherwise they
-- 
2.17.1


