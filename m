Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7445FC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 12:37:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17888.1679056664800065429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 05:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24409f19bd=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HBY2cs032139
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 05:37:44 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqkshn9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 05:37:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Fri, 17 Mar 2023 05:37:43 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 17 Mar 2023 05:37:42 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mdadm: fix tests/00raid0
Date: Fri, 17 Mar 2023 20:37:42 +0800
Message-ID: <20230317123742.2311641-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: w70oftH8LQJaZYNJS6L-7ozQxfoCdyvg
X-Proofpoint-GUID: w70oftH8LQJaZYNJS6L-7ozQxfoCdyvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_08,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 12:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178752

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix tests/00raid0.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=7539254342bc591717b0051734cc6c09c1b88640

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...d-a-test-that-validates-raid0-with-l.patch | 41 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch b/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
new file mode 100644
index 0000000000..1c95834a7e
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
@@ -0,0 +1,41 @@
+From 7539254342bc591717b0051734cc6c09c1b88640 Mon Sep 17 00:00:00 2001
+From: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Date: Wed, 22 Jun 2022 14:25:13 -0600
+Subject: [PATCH] tests/00raid0: add a test that validates raid0 with layout
+ fails for 0.9
+
+329dfc28debb disallows the creation of raid0 with layouts for 0.9
+metadata. This test confirms the new behavior.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=7539254342bc591717b0051734cc6c09c1b88640]
+
+Signed-off-by: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
+Signed-off-by: Himanshu Madhani <himanshu.madhani@oracle.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/00raid0 | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/tests/00raid0 b/tests/00raid0
+index 8bc18985..e6b21cc4 100644
+--- a/tests/00raid0
++++ b/tests/00raid0
+@@ -6,11 +6,9 @@ check raid0
+ testdev $md0 3 $mdsize2_l 512
+ mdadm -S $md0
+ 
+-# now with version-0.90 superblock
++# verify raid0 with layouts fail for 0.90
+ mdadm -CR $md0 -e0.90 -l0 -n4 $dev0 $dev1 $dev2 $dev3
+-check raid0
+-testdev $md0 4 $mdsize0 512
+-mdadm -S $md0
++check opposite_result
+ 
+ # now with no superblock
+ mdadm -B $md0 -l0 -n5 $dev0 $dev1 $dev2 $dev3 $dev4
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index ffb42aa13a..14de9d88c2 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -28,6 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
            file://0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch \
+           file://0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch \
            file://0001-tests-fix-raid0-tests-for-0.90-metadata.patch \
            file://0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch \
            file://0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch \
-- 
2.25.1


