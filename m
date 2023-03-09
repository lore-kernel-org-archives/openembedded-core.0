Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A213C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 21:24:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3550.1678397036729793111
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 13:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SbcO+aW5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24321a949e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329HOhAE023732
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Mar 2023 13:23:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=BcQNBigOx5MoT44AH6G7xMeo9jX2Y153w2bDYONuaWM=;
 b=SbcO+aW5c8kEl+eDhnNSfeAcAT1HScwlgh8BzQAksGFT/dkZJr2Jv9OXssZ4EvSvgalf
 7Z/E4Bn0DLIFZZ9FgtAZzg9YsugfgviJa0cKOCXso9POpcpwU5T9AZ65tdKjFvetV6n7
 wgRSg2x3F4PEp10jw1AUBEfhtdhDx1b7SMxw2wAY55LsALlQJLQzN0tprXrshGxmHU0u
 Er1Sl3fyT7vdQC5hMqp1uos8hTxS7UwsMjEkNGV8toLEZfRL6tU/rHs1uusgLf3aS4tT
 6Kj/ZEGW1zJIQNluAS+uXnZomQVldvxD3u3Kihwam5NHEUES1+vjqtMVROFafrMFkBhS lg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p6fffa4nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 13:23:56 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 9 Mar 2023 13:23:55 -0800
Received: from vme.wrs.com (172.25.44.4) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.17 via Frontend
 Transport; Thu, 9 Mar 2023 13:23:55 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: Disable drd/tests/bar_bad ptest
Date: Thu, 9 Mar 2023 16:23:54 -0500
Message-ID: <20230309212354.1191371-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: S3cCJchXsHy4DitpAQ5FNUDigT4cfax_
X-Proofpoint-ORIG-GUID: S3cCJchXsHy4DitpAQ5FNUDigT4cfax_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_12,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=807 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 21:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178271

This is failing intermettently in the YP autobuilder
so disable it until we can fix the root cause.

[YOCTO #14311]

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
index 5d1e7ed102..e26088f3b1 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -3,6 +3,7 @@ gdbserver_tests/hginfo
 memcheck/tests/supp_unknown
 helgrind/tests/tls_threads
 helgrind/tests/pth_mempcpy_false_races
+drd/tests/bar_bad
 drd/tests/bar_bad_xml
 drd/tests/pth_barrier_thr_cr
 drd/tests/std_thread2
-- 
2.34.1


