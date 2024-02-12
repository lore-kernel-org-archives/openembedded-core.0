Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB5CC4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 22:05:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19875.1707775505262546349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 14:05:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ktPqTH28;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2772da6af1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CCpfdh005391;
	Mon, 12 Feb 2024 22:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=yJn57
	NoP9kgXWPZdK5pwq+pl7yD14i/fi+WgEE37TQ8=; b=ktPqTH28AYjYbx5p/kM9N
	5uobgCnf0tmUT31FRkH0e86QdIGwLcNYLFBdrvLjZSRbxKcdnl75vNW0dscg5EVs
	3X6nmY15Y87HJqppLD/aUTAcxzJTAHs3sPBYhTFS+0uCJWvjpuU7nzA6hOCf3Zk9
	hTSf81wEXJUpPUvXUcQYnB8yJnxsolSWUDkFfIGPqRTuCMJnhY6YFLo2Qjx2mGVk
	ZjbcXLHg108nEOL4YDSdS/0VR63D3CKiKksPXrKPd8fsE6/HLaKzYN6skNzOkWBn
	nQlaJTcnqo1nwPK/x2pnzDSftjX/oGmBIE4wkoT3L1PwVm4ZN4SdGopWer3y+93n
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w5xbxt508-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Feb 2024 22:05:03 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 14:05:01 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 14:05:01 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [PATCH 1/3] valgrind: make ptest depend on all components
Date: Mon, 12 Feb 2024 14:04:59 -0800
Message-ID: <20240212220501.3571864-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bOb0V3N8k1rEd0uduX9lfzwf8u28jV1h
X-Proofpoint-GUID: bOb0V3N8k1rEd0uduX9lfzwf8u28jV1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_17,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=807 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 22:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195363

From: Randy MacLeod <Randy.MacLeod@windriver.com>

When the helper scripts were split into separate packages, they
weren't added as ptest dependencies. Fix that.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.21.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
index 67a197c509..0903008e61 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
@@ -139,7 +139,9 @@ RDEPENDS:${PN}-ptest += " bash coreutils curl file \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
-   util-linux-taskset"
+   util-linux-taskset \
+   ${PN}-cachegrind ${PN}-massif ${PN}-callgrind \
+"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
 
 # One of the tests contains a bogus interpreter path on purpose.
-- 
2.43.0


