Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E74BC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 05:25:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33567.1707024311521436087
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 21:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JUvSXcTr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2764459116=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4145KRB3023556
	for <openembedded-core@lists.openembedded.org>; Sun, 4 Feb 2024 05:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hl1Lx
	DCl+MLry+ILO651hcemIeyjlfieMzQSmsl2tI8=; b=JUvSXcTrvjKAJh+FJnODY
	Qk1L/siUDbUkeqsnNZ6TYDxcQTfS5WwaNw8r7JYnEml5SY4EBj08+0Z9Unyhz4u1
	M7XUCuewjmHtaWYLjdxTcOLrWla75RMld8R01lCpEsCAv2hBrLiN3m7Z+a1rX7ad
	P9bi+8eU0v72u0x0u9XxJE4N5Rmp3o8t88SrP2Db7FBmdgE3Qz72H6u2V2vCQTgn
	ZP+I66wClReH/XiFcLVvyc56tNWihtVoyQijJDcMqmAaCQfY8lj/3PqDhvwb6yHM
	+RyRFhlx9CBE6H2VD49G5oBxk9koCXz5cjyhJhTi7ZAEDRPVCyRZW/b89jWK6AzN
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cq0gstn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:25:10 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 3 Feb 2024 21:25:06 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sat, 3 Feb 2024 21:25:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go: revert an oe-specific patch
Date: Sun, 4 Feb 2024 13:25:07 +0800
Message-ID: <20240204052507.623825-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: O4H0Havn34F0WNYvSh10o7Wqo9PkCxgg
X-Proofpoint-GUID: O4H0Havn34F0WNYvSh10o7Wqo9PkCxgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-04_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402040039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 05:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194872

From: Changqing Li <changqing.li@windriver.com>

patch 0007-exec.go-do-not-write-linker-flags-into-buildids.patch
removes linker flags from buildids for not breaking reproducibility,
but it seems that this will make go not rebuild when linker flag
changes, Refer [1]. So revert this oe-specific patch, need to find
a more proper way to fix reproducibilities.

[1] https://github.com/golang/go/issues/63760

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/go/go-1.20.13.inc       |  1 -
 ...not-write-linker-flags-into-buildids.patch | 41 -------------------
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch

diff --git a/meta/recipes-devtools/go/go-1.20.13.inc b/meta/recipes-devtools/go/go-1.20.13.inc
index b6eeb651c9..3b0beb7233 100644
--- a/meta/recipes-devtools/go/go-1.20.13.inc
+++ b/meta/recipes-devtools/go/go-1.20.13.inc
@@ -11,7 +11,6 @@ SRC_URI += "\
     file://0004-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0005-cmd-dist-separate-host-and-target-builds.patch \
     file://0006-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
deleted file mode 100644
index 7d9869b536..0000000000
--- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0ba747e6a4b251a0d9eed0cfd8f8c491bb508040 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 23 Nov 2020 19:22:04 +0000
-Subject: [PATCH 7/9] exec.go: do not write linker flags into buildids
-
-The flags can contain build-specific paths, breaking reproducibility.
-
-To make this acceptable to upstream, we probably need to trim the flags,
-removing those known to be buildhost-specific.
-
-Upstream-Status: Inappropriate [needs upstream discussion]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/cmd/go/internal/work/exec.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index cde867b..5cb1812 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -1331,7 +1331,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
- 	}
- 
- 	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
--	b.printLinkerConfig(h, p)
-+	//b.printLinkerConfig(h, p)
- 
- 	// Input files.
- 	for _, a1 := range a.Deps {
-@@ -1626,7 +1626,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
- 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
- 
- 	// Toolchain-dependent configuration, shared with b.linkActionID.
--	b.printLinkerConfig(h, nil)
-+	//b.printLinkerConfig(h, nil)
- 
- 	// Input files.
- 	for _, a1 := range a.Deps {
--- 
-2.30.2
-
-- 
2.25.1


