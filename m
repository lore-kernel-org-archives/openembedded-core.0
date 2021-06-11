Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.7416.1623412979956093912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 05:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15BC2wPg021803
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jun 2021 05:02:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 11 Jun 2021 05:02:58 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 11 Jun 2021 05:02:57 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id 91FE020060; Fri, 11 Jun 2021 08:02:57 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [PATCH] valgrind: remove buggy ptest from arm64
Date: Fri, 11 Jun 2021 08:02:48 -0400
Message-ID: <20210611120248.10446-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This commit removes the stack_changes ptest from aarch64 devices.
This test is buggy and fails almost 100% of the time in qemuarm64.
In general, many of the valgrind tests are more likely to fail on
qemuarm64 vs native x86_64.

This test previously worked on gatesgarth and dunfell, but has
been failing since hardknott. It might be due to a recent change
in the cross-compiler or glibc.
The test runs fine when running natively on arm on a Raspberry Pi.

Until we can find the root cause for the failures, this shorter
term solution should clear up some of the noise from the autobuilder
from a known failure.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index a3a0c6e50f..b4fc8af333 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -235,3 +235,4 @@ memcheck/tests/wrapmalloc
 memcheck/tests/wrapmallocstatic
 memcheck/tests/writev1
 memcheck/tests/xml1
+memcheck/tests/linux/stack_changes
-- 
2.29.2

