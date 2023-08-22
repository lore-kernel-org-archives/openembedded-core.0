Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3F6EE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 22:28:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9592.1692743282975411174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 15:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E69L/Ak9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75988b727f=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37MI8YZW012860
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 22:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=v54MA
	YLyrooufWV1KQoruTCLqV6tFtqEkKt/d0XigZ0=; b=E69L/Ak946jxQDdh58bcT
	ffuJRZ2qGpI4dngS8L+6tUIR9SRb7zOWjulLu5sKTOyh96Wzb3jctlONuOKIiZ2T
	CBSLRQEXej1uvEcSpiPr6MfU3Q92DSGNW1MNhyoorRLy4qPYDk38eJvokIUA9Deg
	nSG4KOyIRctsTmw9DaA07wYkUdxZgzlDxcpzhRrBJosw+7mdoBSqGfOrlXv/FhYn
	KgeZjH6G4jIocgWNeq3DYbt00EP7gYrFbYI395/G3bX9ptaZIGyepHGOFWou2D1N
	DTlmt4jQeoF7o4DO+r8x+9UnQjkf7AJx5Pn620xSCXGL8ePgb7gRdnfOUTZTxHcf
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mg6cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 22:28:02 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 15:27:59 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 15:27:59 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v2][oe-core][PATCH 1/1] file: fix call to localtime_r()
Date: Tue, 22 Aug 2023 15:28:00 -0700
Message-ID: <20230822222800.1967426-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Cm5_sQSYs1V0lo9pCTXpGYMeKtdHnNrR
X-Proofpoint-GUID: Cm5_sQSYs1V0lo9pCTXpGYMeKtdHnNrR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-22_19,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=761
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308220184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 22:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186541

From: Joe Slater <joe.slater@windriver.com>

Depending on the version of glibc, localtime_r() must
be preceded by a call to tzset() or it will ignore any
value of TZ in the environment.  This problem will only
be seen when building file-native on outdated hosts.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-devtools/file/file_5.45.bb       |  4 ++-
 .../recipes-devtools/file/files/print_c.patch | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
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
index 0000000000..760813f9c2
--- /dev/null
+++ b/meta/recipes-devtools/file/files/print_c.patch
@@ -0,0 +1,27 @@
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
+--- git.orig/src/print.c
++++ git/src/print.c
+@@ -289,6 +289,7 @@ file_fmtdatetime(char *buf, size_t bsize
+ 		goto out;
+ 
+ 	if (flags & FILE_T_LOCAL) {
++		tzset();
+ 		tm = localtime_r(&t, &tmz);
+ 	} else {
+ 		tm = gmtime_r(&t, &tmz);
-- 
2.25.1


