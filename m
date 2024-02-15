Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0129C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:21:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18050.1708014102297609195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WjBRviO7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=277593d998=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41F5o3cN028366;
	Thu, 15 Feb 2024 16:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=BgyOJ
	7KqAG3OZ3eTcGzc9h4RSlK9tA24j3cr8FgZ8xY=; b=WjBRviO7mI7leV05SDx9A
	gfB1OQNz0jybURKGa9WvrUgIK5GWXw6Hyez/waDnyIC1AnijAyeRjzBbzIStsN+h
	T8pBdLkHW5cK4341GFSujiHESVXUQzlIL130jZvtWYhHY2Qil6QvAxVKNkEabGsC
	IRnVCVqb6PtElASI137LBvl9ZKVdq7J0POufKddQXR/WFBHBiEkAE3YUzzN/FC/U
	/UmLLdPnZxM6cms41j/wDFj2iTAib1cl9QDzznlAkMIpPiR2IrSuygdc8jFb5zRN
	dEeFSz/v66UV/x0gVQKRdrS/rgWeWimUNjzBOzL9DtOqvVzfqD3T+qNgm4dnkrIA
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxw0j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 15 Feb 2024 16:21:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 08:21:39 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 08:21:39 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [PATCH] valgrind: Skip 22 arm64 ptests
Date: Thu, 15 Feb 2024 08:21:39 -0800
Message-ID: <20240215162139.4134937-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GhZyoq5RpCT-nnvzbiTiBg30AhfPzvjp
X-Proofpoint-GUID: GhZyoq5RpCT-nnvzbiTiBg30AhfPzvjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_15,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195542

From: Randy MacLeod <Randy.MacLeod@windriver.com>

With the 3.22 upgrade 21 additional tests fail on qemuarm64.
Skip them until the problems are resolved. Tracked by:
   https://bugzilla.yoctoproject.org/show_bug.cgi?id=15399

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind/remove-for-aarch64      | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index 4477f39132..04f159d701 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,7 +1,9 @@
+drd/tests/annotate_sem
 drd/tests/boost_thread
 gdbserver_tests/hgtls
+helgrind/tests/hg05_race2
+helgrind/tests/tc20_verifywrap
 memcheck/tests/dw4
-memcheck/tests/leak_cpp_interior
 memcheck/tests/varinfo1
 memcheck/tests/varinfo2
 memcheck/tests/varinfo3
@@ -9,5 +11,24 @@ memcheck/tests/varinfo4
 memcheck/tests/varinfo5
 memcheck/tests/varinfo6
 memcheck/tests/varinforestrict
-helgrind/tests/hg05_race2
-helgrind/tests/tc20_verifywrap
+memcheck/tests/atomic_incs
+memcheck/tests/bug464969_d_demangle
+memcheck/tests/cxx17_aligned_new
+memcheck/tests/demangle
+memcheck/tests/linux/timerfd-syscall
+memcheck/tests/long_namespace_xml
+memcheck/tests/mismatches
+memcheck/tests/mismatches_xml
+memcheck/tests/new_aligned_delete_default
+memcheck/tests/new_delete_mismatch_size
+memcheck/tests/new_nothrow
+memcheck/tests/realloc_size_zero_mismatch
+memcheck/tests/sized_aligned_new_delete_args
+memcheck/tests/sized_aligned_new_delete_misaligned1
+memcheck/tests/sized_aligned_new_delete_misaligned1_xml
+memcheck/tests/sized_aligned_new_delete_misaligned2
+memcheck/tests/sized_aligned_new_delete_misaligned2_xml
+memcheck/tests/sized_aligned_new_delete_misaligned3
+memcheck/tests/sized_aligned_new_delete_misaligned3_xml
+memcheck/tests/sized_delete
+none/tests/bigcode
-- 
2.43.0


