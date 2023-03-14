Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3432C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 02:13:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.614.1678759984188934561
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 19:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hNJDSlDB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24374540b0=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E20lrf030869
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 19:13:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=TNl+KqjYG9fAq0t1zu3LGzRZjjP4QwD1JI1pT40Z8U4=;
 b=hNJDSlDBWwKcrdjZcPNMoj7KFco/NiBD+OO5ocv+1IdEqcrX2KGxxZ1/vjx1IRfzPuqT
 20Dgi4cwkpiPkuoe5VyAnrCFDtJfDBwhZ6YtMTQAWMQ6fYkyJBor6yPR5+LbVtmu7iBA
 9HrAu+aweTi9WT2gtOSNm1a8wqFcRPcdrdGPggSD0ozdlstkWpaLDCVOrk95W+dyAdIu
 Xly/p1/iQ009wllSMBFTzrkQlvgRNc+KP/Cu9UBYCRBHh1wzN8fNSUbbRy1RnPjgOmJ8
 q3G4Pim/8qneI5cW5dBwgzARQUqlvQtGiGcla/IQLd870h5oDXPaqvfZT+1f/7ZK+Sp+ Ug== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8nt8t83e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 19:13:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 13 Mar 2023 19:13:03 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Mon, 13 Mar 2023 19:13:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cpio: fix ptest failure
Date: Tue, 14 Mar 2023 10:13:01 +0800
Message-ID: <20230314021301.1368409-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iH7xOqIiYQvLWtTLMWqj-xWBg38Cq_4g
X-Proofpoint-GUID: iH7xOqIiYQvLWtTLMWqj-xWBg38Cq_4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=471
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 02:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178473

From: Changqing Li <changqing.li@windriver.com>

Fix following ptest failure:
/usr/lib64/cpio/ptest/run-ptest: line 7: cd: /usr/lib/cpio/ptest/tests/: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/cpio/cpio-2.13/run-ptest | 2 +-
 meta/recipes-extended/cpio/cpio_2.13.bb        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
index bdac7259c1..f027574e86 100644
--- a/meta/recipes-extended/cpio/cpio-2.13/run-ptest
+++ b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 # Define cpio test work dir
-WORKDIR=/usr/lib/cpio/ptest/tests/
+WORKDIR=@PTEST_PATH@/tests/
 
 # Run test
 cd ${WORKDIR}
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 7a3c8b308b..3350ba710e 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -56,6 +56,7 @@ do_install_ptest() {
     install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
     install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
     install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
 }
 
 PACKAGES =+ "${PN}-rmt"
-- 
2.25.1


