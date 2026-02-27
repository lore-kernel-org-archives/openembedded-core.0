Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5193AFD5307
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 07:21:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.90138.1772176873566084792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 23:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BNg9M2d2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6518b1cadd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R5KOab2602621
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:21:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LOzePOqPOzc+X4t76Z0i
	3fZDZwGwOTM4G89VhoPiZ1Q=; b=BNg9M2d2FNE+3ICJDui6KPpn7lRVTgg6SI8N
	VnLBh6obPMUaMIqphKU9Zwt//0qfKAkzTCvwHkev+SBWmhs7rmVSr7o2pNb7Hsu8
	zgFCjongPAZ7CkLVsFfrgnh2Z3Hku3YjuY9ude0SY1rkwfhOyeO24Y7ZBctncprG
	eW7NgSI62o/lP816/svyMx+z3jzYnlhkwhQ876xXqZwPQjSXqfwz+3ilS9A6NTl0
	Ef8O+pORnbvJyBWKp9ZWWHUEeM0J/51RSp++dOjlXhR7IiG8EERyqEW1h+jcCkBv
	iiuCWtHPaPRIAovJ7NhSNGY1i6AEQLQiNu/iYbcRHESRYAgHqw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cjdu2smb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:21:12 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Feb 2026 23:21:12 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Feb 2026 23:21:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] classes/yocto-check-layer: allow to explicitly skip check_network_flag in recipe
Date: Fri, 27 Feb 2026 15:21:10 +0800
Message-ID: <20260227072110.2807435-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2MCBTYWx0ZWRfX7ruaBxl6OH3x
 bg1MchS6cTq+NDFjjFrxCMuhMS5AA1DUG0gNODoDitPgDtbDD/wxQuZozTFXnmsmG7R45ucB72y
 NMSGd5og9iuAlyJs5SPLQNA9dXjsuZwVUUt8l3w9w32ZT1kceQWA2gzLKjOgV1CEpaddMx6iXDx
 pO9B6tHyKwymkrFSx27+5fUvTHTBENRFIwBF1kzM5BnwMbO8RH8f+PAagt/5roAXk67AbxSFTb9
 fs1abMRoAysPZKAKCdaG1jo0bV8DzLG+XbqYQa05yG/dwSwxhJ68YSjVZPXqeSKIpklLThct3ER
 70Q9z180jyu5AwSuSYzAYAp9eMX+652inmI2XQgxeb8kJCOVvNozC2XltXOPa4FV1kiOobXrw3l
 rzqFUol1vaMAPcnCMYAoEK8sCAwf3fy+Itbzhb++DWwf4eVO1bEjQMSFTRG9KsYfcwG0Y9b+Ckb
 zNP+D+tBzNAHaRZse8g==
X-Authority-Analysis: v=2.4 cv=WpMm8Nfv c=1 sm=1 tr=0 ts=69a145e9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=2Flg5VAdD3ZpKNHTT-EA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TNZ2TU3xVMcgSCgZAwZ6J0W8JimVdDTI
X-Proofpoint-GUID: TNZ2TU3xVMcgSCgZAwZ6J0W8JimVdDTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 07:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232081

The yocto-check-layer add a new test that checks that no tasks
between do_fetch (exclusive) and do_build (inclusive) are allowed
to use the network, with rare exceptions.

The only exception currently is build-appliance-image's do_image task,
which is hardcoded in yocto-check-layer bbclass.

This commit adds variable SKIP_CHECK_NETWORK_FLAG to allow user to
explicitly skip check_network_flag in recipe

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-global/yocto-check-layer.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/yocto-check-layer.bbclass b/meta/classes-global/yocto-check-layer.bbclass
index ba93085325..9fb36f5646 100644
--- a/meta/classes-global/yocto-check-layer.bbclass
+++ b/meta/classes-global/yocto-check-layer.bbclass
@@ -27,13 +27,16 @@ def check_insane_skip(d):
             d.setVar("QA_ERRORS_FOUND", "True")
 
 
+# Format: "BPN1:task1 BPN2:task2", separate by space
+# build-appliance-image uses pip at image time
+SKIP_CHECK_NETWORK_FLAG = "build-appliance-image:do_image"
+
 # Check that no tasks (with rare exceptions) between do_fetch and do_build
 # use the network.
 def check_network_flag(d):
     # BPN:task names that are allowed to reach the network, using fnmatch to compare.
     allowed = []
-    # build-appliance-image uses pip at image time
-    allowed += ["build-appliance-image:do_image"]
+    allowed += (d.getVar('SKIP_CHECK_NETWORK_FLAG') or '').split()
 
     def is_allowed(bpn, task):
         from fnmatch import fnmatch
-- 
2.34.1


