Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E935AC021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 03:23:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15354.1740108226467125065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 19:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4147e9414e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L2A2RS015478
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 03:23:45 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00jb7ut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 03:23:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Feb 2025 19:23:43 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Feb 2025 19:23:43 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] runqemu: Set target to rootfs when target is empty
Date: Thu, 20 Feb 2025 19:23:43 -0800
Message-ID: <08e939bb65c3e53cd5febc1c9c7aa11d325fed9a.1740108171.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <cover.1740108171.git.liezhi.yang@windriver.com>
References: <cover.1740108171.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: SAPu_6ls4toogRdEDSVe7uq3cv72B2rm
X-Authority-Analysis: v=2.4 cv=I4GfRMgg c=1 sm=1 tr=0 ts=67b7f1c1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=ZP-WvA8hCqvQGoDzbi4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: SAPu_6ls4toogRdEDSVe7uq3cv72B2rm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=820 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502210022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 03:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211787

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
$ runqemu qemux86-64 core-image-minimal
runqemu - ERROR - IMAGE_LINK_NAME wasn't set to find corresponding .qemuboot.conf file

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 14eb939b3e..86124a4a6a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1676,6 +1676,9 @@ to your build configuration.
         if multiconfig:
             multiconfig = "mc:%s" % multiconfig
 
+        if self.rootfs and not target:
+            target = self.rootfs
+
         if mach:
             cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
         else:
-- 
2.44.1


