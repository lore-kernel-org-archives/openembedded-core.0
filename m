Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF39EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 08:17:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13171.1686817027638086326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 01:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55305f180a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F6Bsq7011116
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 01:17:07 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphme2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 01:17:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 01:17:06 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 01:17:05 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: Install the default qemu emulation rpm
Date: Thu, 15 Jun 2023 16:17:05 +0800
Message-ID: <20230615081705.96399-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: M9y35a5RNunLEGyW3EuubmZRupbk1uL1
X-Proofpoint-GUID: M9y35a5RNunLEGyW3EuubmZRupbk1uL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_05,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=873
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 08:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182837

From: Mingli Yu <mingli.yu@windriver.com>

The qemu rpm can be split or not via customize PACKAGESPLITFUNCS and
there is no specific qemu emulation rpm installed when we choose split
the qemu rpms now.

To gurantee the basic usage, install the qemu emulation rpm which
corresponding to the target arch by default when split the qemu rpm.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7d39f0a25d..c9df43a5a2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -248,6 +248,9 @@ python split_qemu_packages () {
     mipspackage = d.getVar('PN') + "-user-mips"
     if mipspackage in ' '.join(userpackages):
         d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
+
+    targetarch = "${@'i386' if d.getVar('TARGET_ARCH') in ['x86', 'i486', 'i586', 'i686'] else d.getVar('TARGET_ARCH').replace('_', '-')}"
+    d.appendVar('RRECOMMENDS:' + d.getVar('PN'), ' ' + d.getVar('PN') + '-user-' + targetarch + ' ' + d.getVar('PN') + '-system-' + targetarch)
 }
 
 # Put the guest agent in a separate package
-- 
2.25.1


