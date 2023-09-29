Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86374E743F6
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 08:24:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12972.1695975882013580874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 01:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IIaQfy/z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8636b4805a=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38T6v5tJ032767
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=f9xN2
	ygxq3uKT3hSs8gDT3yUB6SZfQQS8qsHJZHI+dw=; b=IIaQfy/zJs53jCmVeFqed
	WS/fXwVzGoePWscXiKh9SJPh6wkDy35VbYvcm0LJKmj7t0DcqRd8lnwGbrlWt4R/
	ffII0bcNhoQsR8Ma7AoxGV6vcUTvjN7N0JVpfO5bNci9fkcDKy1Ov4s6elGUWgT5
	EpIx77v7sGDlBWocY4cIZYhciHYvEbb9j1N63fmpTB1T5ekGpJOVd0vEk0CLkjwy
	ki71+sXI+cRbrKN/4PFSGZlEXMu9fCkYLtmHRbcWnlGry7NkNhqWA/fSLteTMfWV
	gGC+hvTBSrYZ2AK1/smSG+3ZLimFGwYpYCQMmlh+JLMXUkaHRh1r0sFj7qMZ54uL
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9q06dwqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:24:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 01:24:38 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-jinja2: fix for the ptest result format
Date: Fri, 29 Sep 2023 08:24:19 +0000
Message-ID: <20230929082419.3767306-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 32co31NavR8O10bh4VNlf_U_8O5SHZYM
X-Proofpoint-ORIG-GUID: 32co31NavR8O10bh4VNlf_U_8O5SHZYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_06,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309290071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188394

From: Narpat Mali <narpat.mali@windriver.com>

The output of python3-jinja2 ptest should follow a unified format as below
result: testname

Reference:
https://wiki.yoctoproject.org/wiki/Ptest

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/recipes-devtools/python/python3-jinja2/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-jinja2/run-ptest b/meta/recipes-devtools/python/python3-jinja2/run-ptest
index 5cec711696..3004024619 100644
--- a/meta/recipes-devtools/python/python3-jinja2/run-ptest
+++ b/meta/recipes-devtools/python/python3-jinja2/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'| sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s : %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
-- 
2.40.0


