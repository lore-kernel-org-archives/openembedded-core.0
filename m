Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3784DC44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 22:19:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.161711.1783376379410687161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 15:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=S3DZ2PLr;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=v4v2V/9o;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 666KGCCe1674524
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 17:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=woWZI/mwa6r/5
	CLPvnFQedqRCt7/opuhB9WXwKSTaMM=; b=S3DZ2PLrvFjGMrnbYdRGNcNN66dv0
	Z/z2yu5UV39yKyy2T4JJBJe82VX5p83y77l8wQK2a8+C2Pl2aTyONnQIdpiRkUtx
	NmXnDUCEWCv/nRYIuehPxDNQYMyVgQ8XcvnZdroNv9rkEVz4/YeL4xAjkAFwsEK4
	IJ70p8qVRxUWZ3hsTolqbyt6+0FLEgHR19o6e4z83qiSpFbA1M9d9eWVikoCy9ge
	B6DUJbSUm1fWwIJG7wtiSw+VjfVmyRW/hiEnInydXd5o8WExGJkjef0hIdAqF0eb
	HM3rCyHCOhoMyUnDvlWby7Ho3u74/iaWgTpNTJcMSlEesRX5Utz8lf7wA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f8ba0usef-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:19:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB3QJYcWgm29PgJuLXigafgAQenpWgLjfR6yeuz36YV2Mb6TL+YDioCAdWH93/YKjwrLTq4FXjUVbhSx0woO4g7kYL3fvISdAODjlXyZfEbgvKCixCiW85B6QmUP2+wvW2WVq+pPS72VBZklCpYa198grBpR0ClvM/x5/CEQTJZU5AWIl46aVvzmnNpLYZPgpjjBtz1tLlFTTOOZPon9dCY1AhR9QMHBu15Z8MfTC5/JfgTRABrdRnNJdcD2x4xrO4NBIqi3siCvMWv+ESZAkQrj91onJvLMQjieYymdgFM34ALHXplKikgZTCnWqfj2uI/IRIxgD1hbKLMXbjK7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woWZI/mwa6r/5CLPvnFQedqRCt7/opuhB9WXwKSTaMM=;
 b=UHL3IGRYN07Tfa6I3X7ok54ByMUOi6/Z/ATZkacj7swZYtyvdk+z2BrdSsNdH5kEYq5iLw0+87aMmU5E/gLaWqJIkcFx0qNINXDuPz73qUNOSKOjjIlw/Cl0S/AGSIYLwTBEfIcrXgadBYgEOQzKGW6MogdExpk7eiSFowaLe04KBEH3ofdXsZYpaaS5UozoVLmYavFZYk559kxToMwO/WPJzsVTqvhvGdTz/TLULU8MAK+VReL0a4KOzwL1oXTdm6pP+naQizAschBwhMosFRkQkrN8WUe1qJ6uEEQDiS612871ORHXPg4a/sbFpoYveiWYGH1gvW/+oYUKRHU3Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woWZI/mwa6r/5CLPvnFQedqRCt7/opuhB9WXwKSTaMM=;
 b=v4v2V/9oyunYr+LRDXOSdR9c3rA7f4ALt0c7Z1yeTcfdDVBDfU2P2+KnqueJtwVNlZa5TbABcX9i3jKvbwvTyv22Ip0OuOeN5Dc9peyXXcYVvYST1ZhWLJ0WfL1aayKsRLH1cWvQhLnR0L+Xp3qGvs+MR1KCKJp9WoI6LKH0Mvg=
Received: from BN0PR04CA0017.namprd04.prod.outlook.com (2603:10b6:408:ee::22)
 by DM3PPFCD1365510.namprd10.prod.outlook.com (2603:10b6:f:fc00::c4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 22:19:35 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::62) by BN0PR04CA0017.outlook.office365.com
 (2603:10b6:408:ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 22:19:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 22:19:33 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 6 Jul
 2026 17:19:33 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 6 Jul
 2026 17:19:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 6 Jul 2026 17:19:33 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 666MJXFd2917984
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 17:19:33 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wgrf3-0000000GtTu-0WXK
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jul 2026 17:19:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2 1/2] kernel-fit-image: Add KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
Date: Mon, 6 Jul 2026 17:19:32 -0500
Message-ID: <20260706221933.4026508-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|DM3PPFCD1365510:EE_
X-MS-Office365-Filtering-Correlation-Id: af2f8a79-2a87-484b-c9ab-08dedbaca860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	kNNthiVltJ9lqkgbo0q1BuWTNBkIXo/e7SX+MAkSxNuUZjWkqJ1VepGbZoyjeCnswPgNkIAkFJEEPo5oRMrPZx16Nb/iPXQOIx5KLZ3uKrDw2hTt1q7zazjvBK8erO1Ub9gx4s14ZXEbzC2VzXBEk84XyGGhr5ZiulwaGsAKt9sCDK53pWbd3bGUpP4ax2ax2z8zySRKzrL1FtRWHZKDDq5poPb/EeDYdob6+LVDZTvqpVfx7gmMGejdRwnFZVOVESTY9oDuztlw58Kxnjeh2KZICvgA31dSvhDR2HE/PFCvDd+G1OqhxO4aJkPpML0hx5HFk+UbeKZuz3r5kJUkcyNMjY0sEzeFjVRmo9J8cDje9Qd+a3DNe5msJPWPvGLwgrJgPFskfeXTtM8poD5OUU+lPDHWGNtBcWFViEw4v+sv+WAHmd4wNHvM6FOgYuqDZF445i4UI8ntMpoUZpb0L3TKlbeKAhfNMgphWoo/zjp/YFwDbbx/KgD40DTFAkwmAlg6e0rcW5qa5WJepOQPNkE1DhvHJvlrD+IFCmDTNfYlPuZPL1MS/a/9xlOMj5rd3YxGu0RjTAsxcJwd392u3UcUNIKUCVmAl7MCWrXFrqe4P3PM1OoUBf2Css6DRhyJ3OafsTJKDsBfJ0SvuvGNwLnSodh2ZVjsm2UsnmIjda04Vnqb6XwVWpm2+EgCd8sbb+g5zYF4sib//z1gD6FqpQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ABCcteUxZx1vaxoSpOGB8H/X/U/B2bUCUtJymX0P76LfxYrocWIpvyYoAhloG4DmXT7QsAQ0vbTA4brfMqmz+R0BIiDSf+lklTVM6rb/0bkPspLbRWl2Y82h5/L52YbEAeeS8gwr9zb+D/d5pS6TKORDLom/k4pr3YuiRzRPIE49tTyP1E05MTP0ouXwzDzIe3prwO1fSYjKL7pkBjuRjlxlE10XqN1Nw/EgAHY+JF/HmBT5Ng8vdpAc0xhSpk0mWhx8njomqlYN2KSwh3RlwbmpkrYKZKlw5o7N6pOe6EK9y+qFu7lgn7K6Za6m9SYer43CklyQrR2n9dUDWhjuz/P6rR0P1pqnRTpPFUlnoELC5tYOx7xXN3JJ6Wy30OGwg6FQp0aIWbkcAnA9jA6Tk27dz02F2kL9yYVuiNX36jGJGONkGEOmhK57jZgLyHBE
X-Exchange-RoutingPolicyChecked: 
	Y0Dg4lKmdvyedcfN+hd3b7Gydk0bLA0ZTve7b82njjRx4bFoQtUQfcN8akEDXR/Br9QSyrroyrgWfmL/iNYVdLjV+SSfFDUKbrF7aOnVNwArYQePM75FQ42SP6K45huXMJ4jo/c2faIJIcZSP+8MKATCn826QAyYT6N2ZYLuSsjcLfvUMM+PzmhJirozKa/eZI2lvTqeUgFawz42INKKN6zzPC4X0d/QCPMfJszj6jxymXDCSW1c1Cq5KzrTqlfCqs6zFlLsVU7496BBZN2UPhVCOmUc5UwluDbfNl1WjJaoOpo8TWEUh9ADgelGA44e/4GfI691m/B4MZnUmMpWNw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 22:19:33.7746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af2f8a79-2a87-484b-c9ab-08dedbaca860
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCD1365510
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyNSBTYWx0ZWRfX6YMSlRr9/v0c
 2vq7W17KZ/xWBdIkRT9sduCWT3yY78hHhqQAdUynChddsFm7L9/4SnrKg4SKQ2StOkbEUV0eZue
 W8vgUla++H83FO4tpy50nHSYDQ5Ox94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyNSBTYWx0ZWRfX+bnDE7p+PgNU
 evWwyATTtZyrwz6QA3PBScb+rLFmDj6HCKyhmBkWJSvCU+fdUh0Dft15B+Pzf6HVmHLSUcCj5xj
 jJ8N3BnmmbMhxx4p2r0t4ZiG78ZAswBHT/zsC4IobxdvNxKZIRH28RWezNHyfEl5QGM0C2IASQ9
 Pr6+BuXb8GMkK0L68//zFaycqgOnMtBi+qFZU4r2g0cQq61Vx1xl8MR/560xkE1Ijh1egzgDUaU
 eCGtG0k9HyowEc2R+gUK9AD5Ka8qB4A9h+VdDrEMJyg6upBVciSTekLHrHxw6FV5QPPON15pgy/
 q/ejbe+ylDes1UZZ6Ut8+ZDhgNObUx06Lmhp57N7E/3hM6Jg8d5oHgBD2SczJByAvRgJMmE5UXu
 Mr+GLsxa1UAatofb+Luj7vge2TJz3CWqBwKk3jdkBWQtLounl07hDpogKm0KCYDP/LBjQWD3NGQ
 w1+4r0eWQTdXqmYBxTA==
X-Authority-Analysis: v=2.4 cv=CJ0amxrD c=1 sm=1 tr=0 ts=6a4c29fa cx=c_pps
 a=Ie6vhHcvS3zZlrI9i1bNAw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=wCUeORUnEuubtvRHEVcA:9
X-Proofpoint-ORIG-GUID: ngbp_l_Kfn3O78n7Yvj2IVYx_98EX1Mc
X-Proofpoint-GUID: ngbp_l_Kfn3O78n7Yvj2IVYx_98EX1Mc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 22:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240347

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
v2: Created apply_dtbvendored function to handle the mapping to make sure
consistency in the multiple places the mapping is needed.

 meta/classes-recipe/kernel-fit-image.bbclass | 21 +++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 448a88ccb1..cfe43a5a30 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -55,6 +55,13 @@ FIT_KERNEL_SIGN_ENABLE ?= "${UBOOT_SIGN_ENABLE}"
 FIT_KERNEL_SIGN_KEYNAME ?= "${UBOOT_SIGN_KEYNAME}"
 FIT_KERNEL_SIGN_KEYDIR ?= "${UBOOT_SIGN_KEYDIR}"
 
+def apply_dtbvendored(d,dtb):
+    if d.getVar('KERNEL_DTBVENDORED') != "1":
+        mapped_name = os.path.basename(dtb)
+    else:
+        mapped_name = dtb.replace('/', '_')
+    return mapped_name
+
 python do_compile() {
     import shutil
     import oe.fitimage
@@ -97,10 +104,7 @@ python do_compile() {
             # With vendored DTs, use the DT name as listed in KERNEL_DEVICETREE
             # and replace any path separators with underscores, this behaves the
             # same way as KERNEL_DTBVENDORED = "1" did in OE 5.0 and older.
-            if d.getVar('KERNEL_DTBVENDORED') != "1":
-                conf_name = dtb_name
-            else:
-                conf_name = dtb.replace('/', '_')
+            conf_name = apply_dtbvendored(d, dtb)
 
             # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETREE directory
             if external_kernel_devicetree:
@@ -195,8 +199,15 @@ python do_compile() {
                                                  loadable_loadaddress,
                                                  loadable_entrypoint)
 
+    # Figure out if we have a default dtb and if we need to honor the
+    # KERNEL_DTBVENDORED variable to tweak the name to match what will be
+    # in the fitImage.
+    default_dtb = d.getVar("FIT_CONF_DEFAULT_DTB")
+    if default_dtb:
+        default_dtb = apply_dtbvendored(d, default_dtb)
+
     # Generate the configuration section
-    root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB"), d.getVar("FIT_CONF_MAPPINGS"))
+    root_node.fitimage_emit_section_config(default_dtb, d.getVar("FIT_CONF_MAPPINGS"))
 
     # Write the its file
     root_node.write_its_file(itsfile)
-- 
2.43.0


