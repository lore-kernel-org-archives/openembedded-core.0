Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35541C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 19:04:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29002.1782846291805243139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 12:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=A877dCbh;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=lR1B3B3r;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UGkW3c1344324
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=CsARV3xG9qft7
	nDFEL4x04jPTOSFMg0UYhYzNVGq2Dg=; b=A877dCbhhRsG874RX8+oblsxFWXIw
	ly4nFIDFlKamN1eQLTMaThR2Ni6VYeS8mke7v+W9W+GBWcq18yELrI/1KgAqLwFu
	9BvCiF3Nv5t6YmPGBQvCuHSQjwGT95gVTxArl9A1hoA1QbfxImHq6k3Gkakya9zZ
	31Jpiq0XrkgigLsoUGaUMFRZTKCu5v5LXOj71lmPH5awYdDJdpaXqOV/W1AbLM5k
	CmHDecA8N402+sVksQUlmysPfAMSRzB6EgiymsKd0DkYnQV36eTzhrhas7ZhfVYL
	vjHF4U7JDK7UDppmoqwXcbmNnFQye/2N4TAdc1eGArMQUhUwTzEoqv9JQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4cpvtmq2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzmDFsHkodsiyxqmVQvLLrPP9j+FMM93LWHTLBkOtK+iBQtVa7pM9QjWY5jdB0HXK7BGvKlKvEhdGwKD6hl4XBTOieVxyo/THGnXa8cKLVDSheXK4mTfRNs0qP4yEMH97mx4yUdRNpO22ZNtb/gE8R4MYVC5r9P0m2PmkpT53LH5/nBvbg90Rm1n/rqMjDV8o9bWfnN3Fe055f5p39qXrztfzNwnn6y2qW4skq0mAyCNpLUdVCkcbHoSEDnSep2oBtb1rSCugY3Gte24HDy4N7SHlH/T5ctBbUt6w3r70vhdGbEYn3740kDCQ0nsQZlso8tL7n9wqn58b09UkGtPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsARV3xG9qft7nDFEL4x04jPTOSFMg0UYhYzNVGq2Dg=;
 b=WzOPhXJU8yvVKLWSx9pxfD8gKfUU88fauqVYc71V6oXOlJ9JLQY9qLQeHSTzPrn61a6nA7IzQWcWQd3H8T7+nRlMp2rLrNND/2ry17VBekt2HfMsBGEC3Pkl2f0zKQPPdBygNXcEMK7wU0kyEw6Pli6kfKUrqR/OHdYOiTfaYaeNtTgq+T70twr5gxeLd/xkhLwZpYrL8X/VInng52DyJEgpgrY+mzf7huuOoGg9ilWclXGsz3/T7wWiEfIc1uY3PL5ygvlqFSfx8ttcdJUsyvs4gzg6D9PRVaziDl8I9oWkw1iIw5N9+ahFjxIDEXBlMMgz9E/gafxPBIJXeF+hgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsARV3xG9qft7nDFEL4x04jPTOSFMg0UYhYzNVGq2Dg=;
 b=lR1B3B3rCFoufVXmLFpQ88DGRsge+qDdmftGdOcRQER8coWhIciMUIZQ+9uys2EJ8rwL/MJClpgezbOqT+VAawr8rbwtvmijEKhPv/jPLk+H8rCUt1WEBjuijqECGvUrAVG+4VpXNEJ8fSX9NVHet4+oYAV+TkGFY7NE1bjWxTQ=
Received: from PH7P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::26)
 by PH5PR10MB997732.namprd10.prod.outlook.com (2603:10b6:510:34c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 19:04:47 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::1) by PH7P222CA0006.outlook.office365.com
 (2603:10b6:510:33a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 19:04:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:04:46 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 14:04:45 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 14:04:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 14:04:45 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UJ4jm73188155
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:04:45 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wedlF-0000000CqgD-1s26
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Jun 2026 14:04:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Date: Tue, 30 Jun 2026 14:04:45 -0500
Message-ID: <20260630190445.3062430-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|PH5PR10MB997732:EE_
X-MS-Office365-Filtering-Correlation-Id: b70c6add-0bef-43f9-5b64-08ded6da7373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	LeUY9tOhCELIQa4qtKDLzShK2WaM/Q1z4eDngUiF1rypVseLvZaVjoIChtN2Xu7wLbRAEINQ3yIe7KrHfjVEK6jIm2gIVsJgKrLtA7FvqBSpWmUAQ7Gnkc/6mnh60zWOEJ5O46RgeVz2aygeDRyJYtcQshhKhpZJFMbG8ZuEDd301/uU95w4rMeNMzsFUNiZ1qNSNop87dzixJzOxI+7JcuQhPWJEMiXn26YNtm0sKMTlhCvKYZkfdTgAZXJN5sodstDIHxvzdQr4yY8RinJqN00accowkd3Vj9rZl8pTcA/6jva/29HRMp2OaEZHNcLigP75FaDEFf3LtEA0TZ+iDi2m7Ap1vlmK/kXbrQs+t3NxDApmyMTCvJvVk9iiySE4y+c5cdVOmxG9Jl/e4LAa2JhoRGpcX2u1Q3w91FE8/Fnlh2gZ4GfWs3mpS3Lg4JbzoNQwitEmgvPhbO4gKybodbANsSniP6XnDBf5WAjsUZNX3YCtZOGTbZQjb5ejAOXWqhYF1Z9Yif0KT2j+kO72N+a+J8HYdhYOvsa2sf/LRkYd7VJEqoFSl2/Va7BkCgTWRQv0yGXbwZ6naBJVB+YgIc333hXaS9qiMdcnqkhXfLg0v1+ZLLkoXDUw27sCll3g2aBJMbrfF1j7mi57PHnqTRtH0J3frSgoYnAeoGpcMX+sif4X1U5nvbwW25YAsZ55WMtm2O/HMX7Nct4yCqGOA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MEUrBrposqkDh38zt86VVjTv6XIYG/VM5swmpG1JAe7i7Oyhu7fBArpDpgBA7tBeIcFTJa+eTjr18mjKfiaBnzZ8K7CvWsumUOLg4WdHnvi+dIVcK1R57WkOIhoEwweh5iiYmDQySvIkfI5eBBvkLGA1ppxuhKlVlFdb15xdUHHbO6iiBmVQlV96mXspT+G1o8YEgY6ECg5I7eAC2i7rwVBeveU/0D7KxzvPuk0pjo/FQKtIBg2Yzf+tMv4FgVCJFRZ7r8m1YZrsQZJEKIcG6FYvmeHvIW9mEJFg5b91IhL3RSbGZXVl5CFp6RAUX2DrDjnX6y9r+BBjquKxz5fYy44dfsdtfwbpKgFREpFVoL7PpS+IuUvfsjIC6HkOZ7EZmQ5ZZ8J/b/lkdTGy64zNlbdMO5v8kvNlt5l/stoyZIeRPSNsIiBtiTQku/433szM
X-Exchange-RoutingPolicyChecked: 
	sdA3o3Fwcadwdktg9j8cq2DNscKhxcHPb9Yhowwo34OOKv+wxCperP35Jc52HeI4J6dmIGbBiGdIPy93S0cUFYiPVjLJaYdDX2TTPj3ZKW+STYDVv6oAWi0rm6wTHbvLXI9xWcjqbJuiDofMv18RgFqg2OKhvO9Vu+2Kg5DTB1mZL8DIvu3DPvqg0/kwTpzS7LEzJCc8FdLoJp+lTV45+Xjpd+FikU+BbFj49yAF2IQFEQ6jJc+Rv2KvAXHWHW95jmkZND6K2sgcrMc50lz7JnGbmQe8/mkxtpLzUwBHpqA/qiEHMVbZ63owQ0iWgANX/xDJabSc9PgLyU1skKygbg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:04:46.0434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b70c6add-0bef-43f9-5b64-08ded6da7373
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997732
X-Authority-Analysis: v=2.4 cv=c6abhx9l c=1 sm=1 tr=0 ts=6a441352 cx=c_pps
 a=k0I/Xeyziwozq/4EdJtLuw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=y-dlHEAcsXa9vhncYAMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE4MyBTYWx0ZWRfX+sADwZsk75fT
 sqVFUQsfbRr/2SXvI/tuzlVpPFLCZnr0q1o8hlpXKjGqpLnggmrdtjXABU+DxJNthYFypRpsGtH
 JlvQt4B/LPiUSVN9pFFwVkhQAaR8IF8=
X-Proofpoint-GUID: dyg39Nk-BOr5P1yv4H17UDjCpouo0XPz
X-Proofpoint-ORIG-GUID: dyg39Nk-BOr5P1yv4H17UDjCpouo0XPz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE4MyBTYWx0ZWRfXx+WLxbCQNKkW
 BwzyqNjpRKe/NjbzlENaSQz5CoWDkFYB9+l//vm+W/FWCC5C3lEnvwxxc/K4eoDFdxccu1/CNFb
 mQRbnhULJMdTwA3MHQWizCeFAr0akKopEOK4i/ZAHynpqfZxbzYPMCPMWY8UIvXID8sEZBhgAk8
 qpJ8G1qYdtK5RMW5hvljUfBmNGfLJoxtpNpc8IX7NduCrEKVDQt8WArNIeJlVydzBKHe3xES4gG
 ZaWpKGWvrlqSkLvifSCVKri6Um/ASVJAaaVInZmgMsckKL5RPxFYCxKG9etZL4VORiUMppkuNle
 Khyw2+hj2Aa5d6eqPRW2ktLJIEcpzJaBPppqYFElYI/KvEAMbEy6NkJoGbnElRzphwXOK/G+xPy
 7DkFdZ55tl63Zw/fiVplkcA6Rvcq5oftrxjRV+2tVM3wB+h3UO0znxqAaMgPxPFzjOjAF6Sobec
 Heb4eaXLl+rRXah/Liw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300183
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 19:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239914

When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
exactly align the name with what will be in the fitImage file or you
will get a build error.  If you also turn on KERNEL_DTBVENDORED then you
must also specify the vendor directory as part of the dtb name that you
want for the default, but you must manually do the same mapping that the
kernel-fit-image class is doing when it generates the fit-image.its file.

This patch just adds the same logic to figure out the value for the
requested default dtb and eliminate the need to understand the internal
mapping of the class.  It should make specifying the value more
intuitive.  The same value that you put in the KERNEL_DEVICETREE can be
used in the FIT_CONF_DEFAULT_DTB and the new code will correctly honor
the KERNEL_DTBVENDORED setting.

Before:

  KERNEL_DEVICETREE = "
    ti/k3-am62p5-sk.dtb \
    ... \
  "
  FIT_CONF_DEFAULT_DTB = "ti_k3-am62p5-sk.dtb"

After:

  KERNEL_DEVICETREE = "
    ti/k3-am62p5-sk.dtb \
    ... \
  "
  FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 448a88ccb1..f49838d639 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -195,8 +195,21 @@ python do_compile() {
                                                  loadable_loadaddress,
                                                  loadable_entrypoint)
 
+    # Figure out if we have a default dtb and if we need to honor the
+    # KERNEL_DTBVENDORED variable to tweak the name to match what will be
+    # in the fitImage.
+    default_dtb = d.getVar("FIT_CONF_DEFAULT_DTB")
+    if default_dtb:
+        # With vendored DTs, replace any path separators with underscores,
+        # this matches the behavior used to generate the dtb entry in other
+        # parts of the code.
+        if d.getVar('KERNEL_DTBVENDORED') != "1":
+            default_dtb = os.path.basename(default_dtb)
+        else:
+            default_dtb = default_dtb.replace('/', '_')
+
     # Generate the configuration section
-    root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"), d.getVar("FIT_CONF_MAPPINGS"))
+    root_node.fitimage_emit_section_config(default_dtb, d.getVar("FIT_CONF_MAPPINGS"))
 
     # Write the its file
     root_node.write_its_file(itsfile)
-- 
2.43.0


