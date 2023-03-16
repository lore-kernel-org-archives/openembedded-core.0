Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F3AC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:50:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7774.1678956602220539154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=24397540d7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G7twoP008364
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:50:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pbqdngc3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:50:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 16 Mar 2023 01:50:00 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 16 Mar 2023 01:50:00 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 1/3] mdadm: Fix testcase 06wrmostly
Date: Thu, 16 Mar 2023 16:49:57 +0800
Message-ID: <20230316084959.1063608-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 055Li9KaE-PFge_4V0SoHHhFwtCLCKFo
X-Proofpoint-GUID: 055Li9KaE-PFge_4V0SoHHhFwtCLCKFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_06,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=739 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178686

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix the failure of the 06wrmostly test.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-Fix-optional-write-behind-parameter.patch | 45 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
new file mode 100644
index 0000000000..186d1e76f2
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
@@ -0,0 +1,45 @@
+From 41edf6f45895193f4a523cb0a08d639c9ff9ccc9 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:12 -0600
+Subject: [PATCH] mdadm: Fix optional --write-behind parameter
+
+The commit noted below changed the behaviour of --write-behind to
+require an argument. This broke the 06wrmostly test with the error:
+
+  mdadm: Invalid value for maximum outstanding write-behind writes: (null).
+         Must be between 0 and 16383.
+
+To fix this, check if optarg is NULL before parising it, as the origial
+code did.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=41edf6f45895193f4a523cb0a08d639c9ff9ccc9]
+
+Fixes: 60815698c0ac ("Refactor parse_num and use it to parse optarg.")
+Cc: Mateusz Grzonka <mateusz.grzonka@intel.com>
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Acked-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ mdadm.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/mdadm.c b/mdadm.c
+index d0c5e6de..56722ed9 100644
+--- a/mdadm.c
++++ b/mdadm.c
+@@ -1201,8 +1201,9 @@ int main(int argc, char *argv[])
+ 		case O(BUILD, WriteBehind):
+ 		case O(CREATE, WriteBehind):
+ 			s.write_behind = DEFAULT_MAX_WRITE_BEHIND;
+-			if (parse_num(&s.write_behind, optarg) != 0 ||
+-			s.write_behind < 0 || s.write_behind > 16383) {
++			if (optarg &&
++			    (parse_num(&s.write_behind, optarg) != 0 ||
++			     s.write_behind < 0 || s.write_behind > 16383)) {
+ 				pr_err("Invalid value for maximum outstanding write-behind writes: %s.\n\tMust be between 0 and 16383.\n",
+ 						optarg);
+ 				exit(2);
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 19035caaec..be08d512d7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
+           file://0001-mdadm-Fix-optional-write-behind-parameter.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.25.1


