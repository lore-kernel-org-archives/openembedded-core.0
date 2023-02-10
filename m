Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA226C61DA4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 02:19:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4177.1675995541174489910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 18:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1405264153=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A24xqu016130
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Feb 2023 18:19:00 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh9dseb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 18:19:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUGlU2fs4bOz1jt2fmuo4fe0uepuXYD18l7rGPVpE/24RcbuJ9osVx2bwEvzFCZYA6oBynyGJhHwOkGH2r+h7qmBDFlZ5VWAJ5FvKp0SUEvaUHsdAJy2UFtNJ5sM2NaMLYeLcWBw7BpDfjkIoOaEAP+eFU3x4WdCiSyxi9++FvOV46hXQaHQU7xsUFRlueNvjHgovCjeGsE3aVL0h04rij7zaxGgej+YIZX80qoFTPPPnZYJTbvp0ZdsPmTazFaY9z2U2LUwFz3/pjYMb415/LWgW1+hUWA0L/fgxeKfqcCE4I6EfpftKVmwEdXET0PRKiOYRYZ6HfOGqiPulSpvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHhi1FUXadgwVYvGElfhtets1Qv4kZWfnywAqxbEB5Q=;
 b=HTbigqIFsHwTI8yi/fbZWRWnjY/F0Y+USx98XmTr0TFNXKpikCNFnfv1JJNum3IcqmUe8OGvEi2lyzs8/kozD45KZg+zRA/T2QvSOmWscDAhp1z1rvrDnJdPvyG22TBEIw4NWnyqnRthDv3ptACAPv4D2oZlz8kbN0PYfHL9YuV4x9HnZdoXNRrQS1+iyxOKfzXlm8ISN38vchGVSJZ20PufA0vvnqgPL5KoUzkvg6MkTYUpPbzc2VaVPztO773jy4Ndw1CBUO4MH9Yqo2YhQ6Wwsoi+/zWLlrgWYLGVqRWQKq7QbGnsvKqKNksTwLypDTLaF+Bj21QoEAfTJA8VaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5551.namprd11.prod.outlook.com (2603:10b6:5:392::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 02:18:58 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6064.035; Fri, 10 Feb 2023
 02:18:58 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][kirkstone][PATCH] dhcpcd: fix dhcpcd start failure on qemuppc64
Date: Fri, 10 Feb 2023 10:18:43 +0800
Message-Id: <20230210021843.72773-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5551:EE_
X-MS-Office365-Filtering-Correlation-Id: 471bacd9-849c-42b2-4fe1-08db0b0d2a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wJUWFTxB1EpEtOMTBymuVofFugY5EuWptQEaxWTJXVBplVVXxGuHCnX/mU5ipgCREhmXumLopToXOvon0mfU+m74EOmfj4Xs2KJe8C5Mi/I66xzqMWyzauJ97/JHwYYmcNe2/160q5yY9owphcIg+rdLgIde68sZTDcIPKqeLftv9dtoJ+4HmtXSDeIBYETHRbZYUw+5yBLqPZZXRuHi7emDCa8Ui7q/gbmqKqQUxLQTrUggR/MLZPOk/4DrTRVwrLguTA4JQaLThZQm1ZtQYocby0Zi7gehEukYH8BBEovQoi6gNuHvCCYWYdMnUid/lL31wviRMxch2ICzSYSHOrA6kH1DMuWeHzRpThQfMkrUI5OIEfe1ug5d7rPt2NfO2/7LNcm2W9tMF34jk0M4OMkPBMb9jP6lIrwVPMjh6WEgab8ztYWXKv64A1Hnywx4YUfXBEhwpSDoc0+4pQ2yetmBnm5guat+KDxT+EobpQFmz/C5WoUcVbktG2Ios8dMkx2nbxruUY9M2YnfEHXXTF8iGcU+lTuE07NzeBX2dnwqqiCPCD1/MUADdO+LnGJaFdS7TXNnavylszZCCHCpbxZh4YnYYYfCVPSkjSMqLoL2Z1vYK3JaTWe7jLAdgN+hfWNbriHDExsjhwdLkivsty7DvWHdjyNvKjtPqFmOiN69ZaZp805IrIZXpXmQDIdvddz8zWYKye+03QCZYFFHJcAqbq6ioo++8xBgcuKP/NE4Ed3sZB83QgYn769TF4r2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(136003)(39850400004)(346002)(451199018)(478600001)(6486002)(26005)(2906002)(66946007)(6666004)(6512007)(52116002)(186003)(1076003)(6506007)(8936002)(66476007)(41300700001)(6916009)(8676002)(66556008)(44832011)(316002)(5660300002)(83170400001)(38350700002)(38100700002)(2616005)(83380400001)(40753002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jEKCcbA9WufEfjOKc/nS6siUzHqnQ8G9zY836Yz14MMX78vgmC0gCD1kWmAL?=
 =?us-ascii?Q?62U76keXJ2ljqT4TPmqs4qX37s2F4cGYR/ruXwoak/Yyzfxjtowj6b4m4Y9+?=
 =?us-ascii?Q?l8pApxKpKEp2Kamm+YUKjU5Bho9G+QblbdXz9YwmNrF++DG/wBM8vQsRumWZ?=
 =?us-ascii?Q?m1tpWr6NENviTc4+AJ+xL5UZGkzq0os6PnILx5b9KxQFr30FFVfy6oyEMoYu?=
 =?us-ascii?Q?/rqbnL92AbmC2B1xtAj2sPcYsURL9LIrE0jU2WQb546qGrxrIdCUSL0plAWR?=
 =?us-ascii?Q?56o/IaQ0+yy+nOuGgkQL5v/ncQNqDzdif0t0WHfu+l5k2UffZZRk6aoS2WJp?=
 =?us-ascii?Q?Hca86oEt+m0cwttkcAcMjgJVJRY0hl0bqr1LjWCXylLAbJ2A41EWVbMmtwok?=
 =?us-ascii?Q?/XcWhp48YGwg8Ulnj+EV2Nqv4BFyzsL5CD2JkCRkyU17aFTQBiSuuEQcAj33?=
 =?us-ascii?Q?1Ozmk2adyH+O2HDrcjTtqJRuhz06pXKjnJWh0/d0LC296hytqxGfILITGCEK?=
 =?us-ascii?Q?D4nUv8ddVji1VyeSlzxu8VSADTN0RomrZnCaKWXk1rFq0dOrqDJujUvpe9JD?=
 =?us-ascii?Q?/ySHOMXwcasrbktSuzSubzPmqahwwYQ54tNHUHLbgZOM9qWsKh+/Rnt2ptru?=
 =?us-ascii?Q?5VIRAK880jqn/91f40+sXZP3pIpmPnCeTdRYFAnQy+6Uln7X5xkwkrFSrsUG?=
 =?us-ascii?Q?n7NChz61Lvb6KHIgksdStOH+fmVfHLTOvys+mTxdc91HrwK6Q2GgoBSI0T5U?=
 =?us-ascii?Q?jWQ5tPHjBmgtIu6607G8Yy0gA6Pg7ZfRTVcrM0xW8Npl+1s4WvmHbf480OeF?=
 =?us-ascii?Q?DHScKnLfwHcH9sFdKuuCpjzI8vWDOovNU92fGa++MvOYPD4a3qPA+e6WLYAB?=
 =?us-ascii?Q?xOLqEYHCO+ID7h2dnd5t0SD1Cg2F8y3Xs6h5w7WKNy7QuVqY9/wcBdAA9pp8?=
 =?us-ascii?Q?Z5TMP6CvHrMnjUyPQRpGFkxj0RmYqF4++kIIELDYgFtt3n1bkKYzTzF+d3i2?=
 =?us-ascii?Q?duweKwYnTHbQLt+HQyK2g0QoN/iGWb4FEytlA/nIDhq3Rz2Bpri5+/mE5HfH?=
 =?us-ascii?Q?M/IOgxeYUpe9/EgyC8NkoW919FEv7kBdCH61MZv7EZbce6typH1pKk9GfNSz?=
 =?us-ascii?Q?B/De2xi01D8n5wIa4Tc7EbqL/4U5pdT2eSnsgNkECicPFpA1SAu6bnp9/+Vh?=
 =?us-ascii?Q?RoOlQa1TlMIMnKqzICT3DxPoVUNsc0sHwODHfLki6P+PX28PQrG2Iyb8xrZI?=
 =?us-ascii?Q?31WqnpWi65InXWIo7C3PHFB1D7f4akkp0e4pX5RDRkSTuUr7mjCyEwndg8sE?=
 =?us-ascii?Q?39yVkHyDcKgZ4RN6pEnASrdMU6upbwVZfHy867OXj9o8HCW69GCE4i1IN8LJ?=
 =?us-ascii?Q?clyNILxOGQeWYPKwOoVA/J2qtszhcUcVzuYEpsCY3eMnd5htebL1PDq8DyIR?=
 =?us-ascii?Q?s/K0zSH509PjkKMMD3allf9bXezI/pGfM4OOFDq1x41wjf2s8WJeEdX0V7bB?=
 =?us-ascii?Q?2ib24eyKhTAELwBdYYqgcZ5qp0LxgizuUopF2MPH/4yG6a+ccIB6ma6fBSSx?=
 =?us-ascii?Q?XjMwNGlRZpWQoIJYeNM6nS3/LFop23D/3S4L1X2ospKsRxCT+1snjreEVfHa?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471bacd9-849c-42b2-4fe1-08db0b0d2a86
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 02:18:58.1807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgfeA2+WFRrsoDsXl9bjuUNNQ4D14aTETH96ED/O+MJan11BtX9Nu9shdn3McYqA0h6kz9wVlvS5ViWqWU5ZOFpVJ+aIZoIyynTMP4G95T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5551
X-Proofpoint-GUID: BEUXrRmuXZFK0bHSm6AoD_xWAan394Fz
X-Proofpoint-ORIG-GUID: BEUXrRmuXZFK0bHSm6AoD_xWAan394Fz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302100018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Feb 2023 02:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176972

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Backport patch to fix dhcpcd start failed on qemuppc64.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 5cf77fa0f6..39e689d2f6 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
            file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
            file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
+           file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
new file mode 100644
index 0000000000..1c514f9b8c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
@@ -0,0 +1,34 @@
+From 7a2d9767585ed2c407d4985bd2d81552034fb90a Mon Sep 17 00:00:00 2001
+From: CHEN Xiangyu <xiangyu.chen@aol.com>
+Date: Thu, 9 Feb 2023 18:41:52 +0800
+Subject: [PATCH] privsep-linux: fix SECCOMP_AUDIT_ARCH missing ppc64le (#181)
+
+when dhcpcd running on ppc64le platform, it would be killed by SIGSYS.
+
+Upstream-Status: Backport [7a2d9767585ed2c407d4985bd2d81552034fb90a]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ src/privsep-linux.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 7372d26b..6a301950 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -232,7 +232,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
+ #elif defined(__or1k__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
+ #elif defined(__powerpc64__)
+-#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
++#  if (BYTE_ORDER == LITTLE_ENDIAN)
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64LE
++#  else
++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
++#  endif
+ #elif defined(__powerpc__)
+ #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC
+ #elif defined(__riscv)
+-- 
+2.34.1
+
-- 
2.34.1


