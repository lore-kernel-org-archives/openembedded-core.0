Return-Path: <paul.gortmaker@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3B5C7EE21
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 15:57:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23843.1683129449838212843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 08:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=arD4nr7C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=448749ae80=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 343CSYop031070
	for <openembedded-core@lists.openembedded.org>; Wed, 3 May 2023 08:57:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=pLVKkyEE5edAUKSLHUx35oKk9l/Mi43Wf4QfIALundg=;
 b=arD4nr7C/D1QQ0oLJxw9rUJ56vjw9qhv2qWUEY34qGcC2nVWZICnFyRL1VJMNjiwj4Dr
 uEHp6F8sZ2yOJpBC5bL1LUQ0knHMXXUeq7nAcMbVqduBEJT3E9aS1AlaGp2qHC3rZETR
 CEdk71OenZchL0dZs+Ic2XIXu5LUa+Fd4+5sQlHnwN9e3ngEmBkVnCVnrWz2fML2W9SA
 ch9fxDMGeKk4M6q/GF5gZFP4QoEDQFby1NT9iwPZ4cHEoigloABBOTsIWLqVZM1Qtkg0
 e5fFCoBBJxkGVYIfhErdfF08ov/XfgbuuvkNhpYxSTzQ2z6fx+flZjg1U5E9yr94k/jD Fg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q92rnbmt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:57:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 3 May 2023 08:57:28 -0700
Received: from yow-pgortmak-d3.corp.ad.wrs.com (128.224.56.59) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Wed, 3 May 2023 08:57:28 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH] scripts: fix buildstats diff/summary hard bound to host python3
Date: Wed, 3 May 2023 11:57:18 -0400
Message-ID: <20230503155718.40698-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LFKH1qF13Py2GG7ijSTtxkoq44mNFiwI
X-Proofpoint-GUID: LFKH1qF13Py2GG7ijSTtxkoq44mNFiwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_11,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxlogscore=793 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305030136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 15:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180832

Somehow these two got left behind and hence on older hosts that
are using buildtools for a newer python - they will still fail.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 2f6498ab6743..c9aa76a8fafc 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Script for comparing buildstats from two different builds
 #
diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
index f521d78650b4..b10c671b29bd 100755
--- a/scripts/buildstats-summary
+++ b/scripts/buildstats-summary
@@ -1,4 +1,4 @@
-#! /usr/bin/python3
+#!/usr/bin/env python3
 #
 # Dump a summary of the specified buildstats to the terminal, filtering and
 # sorting by walltime.
-- 
2.37.3


