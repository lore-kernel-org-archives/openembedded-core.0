Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D04C00528
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 23:36:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2984.1691019387286832751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 16:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jV9Z/7f1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75783e41b8=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 372NF95s020626
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 16:36:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gmOmh
	Mj4uys19CXERMVidFFyLdHGY4N9WwHZt2P+RIU=; b=jV9Z/7f1pBYzzIGcWBFL4
	WuavLAX5XZ+Zd4MI3dN3dSgNLUUCWsypABgMWuq3LuDXwjWFpDeBxbcxhEwo0D6f
	8dSsHBu8oplLv48I+XL498wkggdwRxLIyJKJQTOGfR+LcaWmojzw6J7RwE5wchyY
	08JECQQuasPH/SiUB6AIdc+6CRSddXYdMB9WRep1EW+ie9hMq9Xl7XOPhCzTpC/h
	1vVFmtUHAUI2UkvHXD7Yj+2xh4cwLkrs9Amo6gL1YQiLLpeW5SnbD2a4OLBKfP+D
	GU94j2iGWkdnT89JastamQ+W4hOA6sy+CGJ+GffcsQBHTsZ7ViebyO+Lxbiw0sWY
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s78py9484-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 16:36:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 16:36:26 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 16:36:26 -0700
From: <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] runqemu: add some logging control
Date: Wed, 2 Aug 2023 16:36:26 -0700
Message-ID: <20230802233626.3642612-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GedHgesqGbWHQAXAAOa7Rpr5Q8zWMXN6
X-Proofpoint-GUID: GedHgesqGbWHQAXAAOa7Rpr5Q8zWMXN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_18,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxlogscore=566 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308020208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 23:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185444

From: Joe Slater <joe.slater@windriver.com>

Use QB_LOG_FILE to log to a file, and QB_LOG_LEVEL
to set the base log level.  Example values -

QB_LOG_FILE="runq.log"
QB_LOG_LEVEL=DEBUG

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 scripts/runqemu | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5e6793d44e..bea164d041 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -36,12 +36,20 @@ runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message)
 
 def create_logger():
     logger = logging.getLogger('runqemu')
-    logger.setLevel(logging.INFO)
+    try:
+        logger.setLevel(os.getenv("QB_LOG_LEVEL"))
+    except:
+        logger.setLevel(logging.INFO)
 
-    # create console handler and set level to debug
-    ch = logging.StreamHandler()
-    ch.setLevel(logging.DEBUG)
 
+    # create a handler and set level to debug
+    try:
+        ch = logging.FileHandler(os.getenv("QB_LOG_FILE"))
+    except:
+        ch = logging.StreamHandler()
+
+    ch.setLevel(logging.DEBUG)
+    
     # create formatter
     formatter = logging.Formatter('%(name)s - %(levelname)s - %(message)s')
 
-- 
2.25.1


