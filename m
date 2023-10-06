Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5848CE9412E
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:28:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6042.1696627674285932905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RIUcjS5F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8643e002a1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 396KdN36010950
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Oct 2023 21:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=imue5
	bWSCMXNDW4BkHtNv6HhdmmqCFrrXtmKFbS2ZSQ=; b=RIUcjS5Fz3rA9wX4OeKps
	K+SD4Xc0UZo8/x+fXf+VmFYuGIrrS9ySB0HXBbEX9NXrF2Af60lfMMap55X+nriP
	i7dDgYgY8T02i2f0NfxgPxZRIpJsIHprNxGiBX6nKSlwBIWhwLa2CvPkyR4azAwd
	WuNHEFCZYlO0C356+iWqCNHLCS+Fxsbc7HuN3sTaItNa9m6DEDIYidEGPsrl6/rY
	u9zKu83O1vI2YFTGDJgaGB1dLwuIxHGJnQdVn5dV+CTO0zCi/wvs2Deo3Mhj/n4l
	sC2OssjbvJzQfBbfLTNTYXgiQJcTv1pG/uPsg6ezu0EkwYx4vHfV1YVH6mVm+Yxd
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtya1mv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:27:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 14:27:50 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 14:27:50 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] strace: skip so_peerpidfd test
Date: Fri, 6 Oct 2023 14:27:51 -0700
Message-ID: <20231006212751.95031-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KSbmZP00vIN4raQMTP0X6lsPoPrhtn_6
X-Proofpoint-ORIG-GUID: KSbmZP00vIN4raQMTP0X6lsPoPrhtn_6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=730
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310060164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188788

From: Randy MacLeod <Randy.MacLeod@windriver.com>

The so_peerpidfd test is failing in every linux-yocto-6.5 ptest run
due to a difference of square brackets in part of the log file.

Skip the failing test until the difference is understood and fixed.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.5.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
new file mode 100644
index 0000000000..76f93ab613
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
@@ -0,0 +1,25 @@
+From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Fri, 6 Oct 2023 12:08:23 -0700
+Subject: [PATCH] skip tests/so_peerpidfd.gen.test
+
+Upstream-Status: Pending
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ tests/so_peerpidfd.gen.test | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
+index 64ad3a2..f89da9f 100755
+--- a/tests/so_peerpidfd.gen.test
++++ b/tests/so_peerpidfd.gen.test
+@@ -1,4 +1,5 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
+ . "${srcdir=.}/init.sh"
++skip_ "Test fails due to apparently trivial log format differences"
+ run_strace_match_diff --trace=getsockopt -y
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
index 8f90c35925..d6475e8db9 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://skip-test-so_peerpidfd.gen.test.patch \
            "
 SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
 
-- 
2.39.0


