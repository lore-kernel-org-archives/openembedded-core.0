Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10BAC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 23:47:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10551.1698796030474963023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 16:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UWxL8GbV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9668d672bb=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VK64rL031044
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 16:47:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=YvlPZ
	jhk6Wl8K1uCludZWuMoyArOC2SLZQtwykjJPUE=; b=UWxL8GbV+0VNiuEdBTxQG
	Ow8Cd//wnUbxXxP03fGXqomzAyVJ1QIGMllJ2GvsveG201EtzHsS5vDj6op8e/th
	1NGuzmycvNcpZd/PGFY951ycWb6hsWlLmhuFTkGxpHwesFOs8NOp1wUiV8lIdDMY
	gBKJOPQTQ0N6wUIkH3HPS2i8ner1DOuv/NVx+app9cGJuqOyc8T1mTDYvzXPS5uX
	s7ez+jsIdpf9ttVFGB84sEQVc1OXD/ChyuMU0SUztT7Rcdq6tz6T5ipCglORm2/Z
	7VXkKTxbcN43Jqq93lot7jcsrZKgWmYMc2gcNci84CtX1eEOcVBzTPhHbWvvxt+I
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tfuwba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 16:47:09 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 16:47:11 -0700
Received: from pop-os.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 31 Oct 2023 16:47:10 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] strace: backport fix for so_peerpidfd-test
Date: Tue, 31 Oct 2023 19:47:08 -0400
Message-ID: <20231031234708.2768420-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: s8z587EKZecfc9QoVEzBQ4AV34TI0Ing
X-Proofpoint-ORIG-GUID: s8z587EKZecfc9QoVEzBQ4AV34TI0Ing
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310310197
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 23:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189890

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Backport the fix for the so_peerpidfd-test:
   44cf51a38 tests: fix so_peerpidfd test
and drop the patch that skipped that test.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../skip-test-so_peerpidfd.gen.test.patch     | 25 ---------------
 .../strace/tests-fix-so_peerpidfd-test.patch  | 32 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.5.bb    |  2 +-
 3 files changed, 33 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
 create mode 100644 meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
deleted file mode 100644
index 5c73e1f10e..0000000000
--- a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Fri, 6 Oct 2023 12:08:23 -0700
-Subject: [PATCH] skip tests/so_peerpidfd.gen.test
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- tests/so_peerpidfd.gen.test | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
-index 64ad3a2..f89da9f 100755
---- a/tests/so_peerpidfd.gen.test
-+++ b/tests/so_peerpidfd.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test fails due to apparently trivial log format differences"
- run_strace_match_diff --trace=getsockopt -y
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
new file mode 100644
index 0000000000..62f73d3643
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/tests-fix-so_peerpidfd-test.patch
@@ -0,0 +1,32 @@
+From 44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Sat, 14 Oct 2023 08:00:00 +0000
+Subject: [PATCH] tests: fix so_peerpidfd test
+
+* tests/so_peerpidfd.c (print_pidfd): Fix expected output.
+
+Fixes: v6.5~38 "net: implement decoding of SO_PEERPIDFD socket option"
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2243631
+
+Upstream-Status: Backport [https://github.com/strace/strace/commit/44cf51a38cce1e90bb6c22208fa45f95cdcc8f5d]
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ tests/so_peerpidfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/so_peerpidfd.c b/tests/so_peerpidfd.c
+index 33988edec..dfad1c434 100644
+--- a/tests/so_peerpidfd.c
++++ b/tests/so_peerpidfd.c
+@@ -37,7 +37,7 @@ print_pidfd(int *p)
+ 	if (rc < 0)
+ 		printf("%p", p);
+ 	else
+-		printf("%d%s", *p, pidfd_suffix);
++		printf("[%d%s]", *p, pidfd_suffix);
+ }
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
index d6475e8db9..d1536b1e8d 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://skip-test-so_peerpidfd.gen.test.patch \
+           file://tests-fix-so_peerpidfd-test.patch \
            "
 SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
 
-- 
2.34.1


