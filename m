Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BE1C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:27:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7476.1678955265000830530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24397540d7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G6unoH031410
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:27:44 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbq1h8bp1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:27:44 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Thu, 16 Mar 2023 01:27:43 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 16 Mar 2023 01:27:42 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] mdadm: fix tests/02lineargrow
Date: Thu, 16 Mar 2023 16:27:39 +0800
Message-ID: <20230316082740.3355373-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316082740.3355373-1-mingli.yu@eng.windriver.com>
References: <20230316082740.3355373-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fQkCuoVAPsDenCyov7BzMfVy8lW_1e2G
X-Proofpoint-GUID: fQkCuoVAPsDenCyov7BzMfVy8lW_1e2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_06,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=875 impostorscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178679

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix tests/02lineargrow.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=a2c832465fc75202e244327b2081231dfa974617

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ow-clear-the-superblock-at-every-ite.patch | 33 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch b/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
new file mode 100644
index 0000000000..1a7104b76d
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
@@ -0,0 +1,33 @@
+From a2c832465fc75202e244327b2081231dfa974617 Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:16 -0600
+Subject: [PATCH] tests/02lineargrow: clear the superblock at every iteration
+
+This fixes 02lineargrow test as prior metadata causes --add operation
+to misbehave.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=a2c832465fc75202e244327b2081231dfa974617]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/02lineargrow | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/02lineargrow b/tests/02lineargrow
+index e05c219d..595bf9f2 100644
+--- a/tests/02lineargrow
++++ b/tests/02lineargrow
+@@ -20,4 +20,6 @@ do
+   testdev $md0 3 $sz 1
+ 
+   mdadm -S $md0
++  mdadm --zero /dev/loop2
++  mdadm --zero /dev/loop3
+ done
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index cef9e18843..b5fbc5b18e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
            file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
+           file://0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.25.1


