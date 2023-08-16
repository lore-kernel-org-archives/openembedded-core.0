Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D629C25B4F
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 19:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.170314.1692215431902328373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 12:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HZMk5zj3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7592e4ecf6=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37GGhFiB004133
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 12:50:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=/scz0
	SFfbBsUUG5+aAxOAGrydBxeD2o1/B3vrbLgEwk=; b=HZMk5zj3cPda1kc7VoBC4
	KeHUokbPLwdWrig7dMaTyJm63Fh6nG1vE6EgOoKNyUEbufcHV7a+Ky9TNjDgy4z3
	EVx9a/atkC3OaAspkqfJt/cM/MFlN00OU90UCvJTwPESd/NeL81ffJRCG0UnJnoX
	oCaQwOjczqLS7xzL0CxSTGGKfPiYam6E6eYsKuCw9Vqtu/+4eDwjZlL6mo5QEn41
	gBqRflRUd6NaNwtlwaiteAb72zCO1YxgAXrf8ELpQbAg0ad7cmhRyiXh60BeMVo3
	4u8XYEA+ijMZa2hPe2oMu+CywLviMWUhVAH+SjhGw8xNlzGyDJQtZUSyzivLg4rM
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sg0rrhtx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 12:50:31 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 12:50:30 -0700
Received: from ala-lpggp5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 12:50:30 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] file: fix call to localtime_r()
Date: Wed, 16 Aug 2023 12:50:30 -0700
Message-ID: <20230816195030.3866083-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x_dmF5eT8zKcTm7Z36jBE0opzt09rDsV
X-Proofpoint-GUID: x_dmF5eT8zKcTm7Z36jBE0opzt09rDsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_18,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=711 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308160176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186141

From: Joe Slater <joe.slater@windriver.com>

Depending on the version of glibc, localtime_r() must
be preceded by a call to tzset() or it will ignore any
value of TZ in the environment.  This problem will only
be seen when building file-native on outdated hosts.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-devtools/file/file_5.45.bb       |  4 ++-
 .../recipes-devtools/file/files/print_c.patch | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/files/print_c.patch

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.45.bb
index a7127023cb..8477668658 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
+           file://print_c.patch \
+          "
 
 SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/file/files/print_c.patch b/meta/recipes-devtools/file/files/print_c.patch
new file mode 100644
index 0000000000..4526655d22
--- /dev/null
+++ b/meta/recipes-devtools/file/files/print_c.patch
@@ -0,0 +1,32 @@
+From e329257b8e22362b62e6c930447ef6feadd63f32 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Mon, 7 Aug 2023 22:37:19 +0000
+Subject: [PATCH] print.c: initialize timezone data for localtime_r()
+
+The man page for localtime() points out that while it acts
+like tzset() has been called, localtime_r() might not.  We
+have a local version of localtime_r() that avoids this, but
+we do not compile it.
+
+Upstream-Status: Submitted [file@astron.com]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ src/print.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/print.c b/src/print.c
+index 18f42a05..b1de4908 100644
+--- a/src/print.c
++++ b/src/print.c
+@@ -286,6 +286,7 @@ file_fmtdatetime(char *buf, size_t bsize, uint64_t v, int flags)
+ 	}
+ 
+ 	if (flags & FILE_T_LOCAL) {
++		tzset();
+ 		tm = localtime_r(&t, &tmz);
+ 	} else {
+ 		tm = gmtime_r(&t, &tmz);
+-- 
+2.35.5
+
-- 
2.39.1


