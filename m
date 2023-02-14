Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3495C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 10:54:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3842.1676372048402604027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 02:54:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nJYkTW5w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1409d90851=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E9oF4Y028417
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=mJ9k79Bpq0EbuHaxq+SHJN76ppYJppDSN9sw/uKf5ZU=;
 b=nJYkTW5wwhnysoqMwsA9J9gLXxa50M/wuiTpBh44q/xi7GLgTzChlDkd5YJk9kR9s7bU
 9OMlUuJgrNxJzCvE0Uyn/Tlx3aegEYJNIoRcCaoTjA1mHXlpt7L4kdKPORG8VjNeseJk
 xRwcwXXOZzlIc94VQabzUQtS2ncbZF+vPE1EOvxAFaj1urnLZ62EEAcGyNKKyQZ+3oQY
 oLI/2nJcBUdUYAnnq29LtZzaqQ/jUMWYucBERIiVWLhRGaED8MrsiIUCWFlGXhMP1bIx
 zUjOKHcYf5RbcK0saeSuNtNljTWB1Ob0IdreBCYNmJxvGTdcp4HwAxpKC+tEAL0Cd/BZ FA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2j28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:54:07 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 14 Feb 2023 02:54:05 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 14 Feb 2023 02:54:04 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][PATCH 1/1] libseccomp: fix for the ptest result format
Date: Tue, 14 Feb 2023 10:53:47 +0000
Message-ID: <20230214105347.443264-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dAd8wmwnGmhfPrFwy1DDKB-Coob_c6zO
X-Proofpoint-GUID: dAd8wmwnGmhfPrFwy1DDKB-Coob_c6zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_07,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 10:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177139

The output of libseccomp ptest should follow a unified format as
per this https://wiki.yoctoproject.org/wiki/Ptest

Replaced the test results SUCCESS, FAILURE & SKIPPPED with PASS,
FAIL & SKIP and printing the ptest result with the below format
result: testname

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 meta/recipes-support/libseccomp/files/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
index 54b4a63cd2..63c79f09c4 100644
--- a/meta/recipes-support/libseccomp/files/run-ptest
+++ b/meta/recipes-support/libseccomp/files/run-ptest
@@ -1,4 +1,7 @@
 #!/bin/sh
 
 cd tests
+sed -i 's/SUCCESS/PASS/g; s/FAILURE/FAIL/g; s/SKIPPED/SKIP/g' regression
+sed -i 's/"Test %s result:   %s\\n" "$1" "$2"/"%s: %s\\n" "$2" "$1"/g' regression
+sed -i 's/"Test %s result:   %s %s\\n" "$1" "$2" "$3"/"%s: %s %s\\n" "$2" "$1" "$3"/g' regression
 ./regression -a
-- 
2.34.1


