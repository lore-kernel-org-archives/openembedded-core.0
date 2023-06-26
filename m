Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F0EEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 05:54:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1792.1687758890474960052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 22:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55413d2f40=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35Q5flwI004886
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 22:54:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxsafn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 22:54:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 25 Jun 2023 22:54:49 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 25 Jun 2023 22:54:48 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: Add qemu-user-* and qemu-system-* to PACKAGES_DYNAMIC
Date: Mon, 26 Jun 2023 13:54:47 +0800
Message-ID: <20230626055447.572822-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LzANIx1dp0AJh9x2GsvwSEKyjwk8Y5Kw
X-Proofpoint-GUID: LzANIx1dp0AJh9x2GsvwSEKyjwk8Y5Kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-26_03,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=639 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306260053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 05:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183402

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  Add below line to conf/local.conf
  IMAGE_INSTALL:append = " qemu-system-aarch64
  $ bitbake core-image-base
  ERROR: Required build target 'core-image-base' has no buildable providers.
  Missing or unbuildable dependency chain was: ['core-image-base', 'qemu-system-aarch64']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6acda61425..a5bdeef66d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -236,6 +236,8 @@ PACKAGES =+ "${PN}-system-all ${PN}-user-all"
 ALLOW_EMPTY:${PN}-system-all = "1"
 ALLOW_EMPTY:${PN}-user-all = "1"
 
+PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
+
 PACKAGESPLITFUNCS =+ "split_qemu_packages"
 
 python split_qemu_packages () {
-- 
2.35.5


