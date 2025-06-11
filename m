Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B95C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 13:46:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8268.1749649617431611692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 06:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8257ccbf98=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B8074O031583
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 06:46:57 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq44b0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 06:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF893qsE2r4TRhzB0NKbOG9tevM/kfu/xWgOMhdjH7SIHN/5DlOlIZ12zTPRFQzMhkUN+Wusp33pQCYcpChWwCjs3oB39Puz36hX+Ayx6fzlPXXpJqxeP5Pqv8l6KZ5doKyDJSdynhMM2V1mN2TpFka35ZYTYR+fCUZ21ucPlymdo98Om359USmyC0f7CyoIRQDMKYbZaN0c6ExVLcHWXzpdA9Umul8yOkc8qTQBh9fmV4mFI5YD7Kb+3QYyCoIs/pIuDOjoT1+ANM4+jpheQ+kCDT2ev9MZn5vyRyUzwNN0DfhvCV6MRj/U+b4hYWe7PnddKGpFyxMAVj/H/CR/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmFagwKz70y39MT/1xaAz9GpS1/9YoFuFYPz15JkZ5w=;
 b=cVfMptLCdZQur9th4g2WGaZMVatxqSbmR8rUowydbgV+zZBOLNoJrOSMqASpHxXkdeS6QTxpeIjAZC/8qPdxo2we6enudnLNVGzF8iSsuWqwfzow+/jjhqYV3OWH7oEu8F80qUtCTng7CgaIbhOZokRBSWj9nP7wTBbNJZ8ZX+WakAL1nBPqd2STEEB6StQl4QxaljOPnBqtt5zR/kpPCkfGS/A99U+g/YXaT8g/iailOKuy4n9KmPdBHDXiHU2vT9I0FzEZgmjxZfbdCkT3uNw9rC17jduCqcYXRJkS4xK9PWWv7ZOuWt8m+UxxsG5DJuEVOyUE3w6ko/Dymbkwzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB7304.namprd11.prod.outlook.com (2603:10b6:8:107::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Wed, 11 Jun
 2025 13:46:53 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 13:46:53 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix for CVE-2025-3198
Date: Wed, 11 Jun 2025 06:46:34 -0700
Message-ID: <20250611134634.1685437-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0103.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::44) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB7304:EE_
X-MS-Office365-Filtering-Correlation-Id: 838c4f87-86cd-4f38-8b30-08dda8ee6c7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?huAnWro5THiUubjV1RBn9gxONQB59JZoSvw9dFQA+oeMafeOZyQXR9gY5fwE?=
 =?us-ascii?Q?KlUeNwBAKurL+IXrv5c6lMmEC43sKNS8oOE8tcZmTz9ZY02JTCy2zrcBE2KK?=
 =?us-ascii?Q?KzDygPcTYPdx3CdjwVXZPV0NBaLm0jnTaISu7CWdDPmB0bKqpScNIruIRgO3?=
 =?us-ascii?Q?Qf7k3Z3Jcdu+jCDSMK3CnXISJvGQByQLC0jBw8N5r+w7GT/9bX2oNwSeQbZ7?=
 =?us-ascii?Q?0bP/gpKnXwUREu4dHNw5HS4tbmBG6/TcRR8x4HZcJJZkfYRAJdnNedUPdCN1?=
 =?us-ascii?Q?COcl3sh/d3qO2bBzniQcFTWM1QmVJPP4BPxu2DGmD3T+JFcvaBwrWLERHYQ9?=
 =?us-ascii?Q?S8c2j9RjaZWybUUWwlmQ/hIwscPvS0JwxkVqsq3aWuurFYtRsTgLq6hEX1MU?=
 =?us-ascii?Q?loKU/NpvuUsAAhPClNxFhaFHXXwDiDgRh+xqAkbv+Ic+IWziZucJ4r+u2o8b?=
 =?us-ascii?Q?gh//WWI++kurn1s4y/VNerOegyZEF5l8IaBr0D8X6nZ0F7DyL2HaifdkQzmy?=
 =?us-ascii?Q?MVz5EmHjBWwMvjcIffoNCEhhdPd17sQvS0SISPvo+kt+tGuSDipnYkCILVUu?=
 =?us-ascii?Q?HqAx0cqqTFMMPBPBvxW5mpyLhgYYGmUhbgVJjT19wcKFNH8bzNXSP8aUrA7A?=
 =?us-ascii?Q?DrOw9lcUGRv0YPxj5ZsvLlc8ByaBdB8i0yqBYiCy87GTf3aGC5cSlCEpEghk?=
 =?us-ascii?Q?YqZAgxP47KF4PxHt5bbw/pI1kvqX9owdzbe4s0Uzr2TB9ERYj9UGf3nRyXyQ?=
 =?us-ascii?Q?IUWGq+OG0iCJY5sYvzOFlL9gFQrPjq7XChexPZv2OW6SrMLj9HHnvIYM4FkX?=
 =?us-ascii?Q?IgUxNHaW7jeqg1Ea6dFMwUyagc1hUzziI4B9ksEu6BSr04eNOdZWN6GYiNTA?=
 =?us-ascii?Q?nP3X3GDpJiWg2SKG8uszwddsdWPgy8Ey80ADcDblWHINDEFXY3ML3hQXoL70?=
 =?us-ascii?Q?QVgUT5ahBn4ioOnb0x0B7ns9WPgx3P62f1o/9M4m5MZjA4VUsVOFHUygaqmO?=
 =?us-ascii?Q?U2jht9AsXouaK2azDmMq8oQtr5OwKUn71b8293QvFPbZXre5rIos9epYpRgV?=
 =?us-ascii?Q?J4MkvF/BZhCDRE20I86vrNeM3Wzewm03qZ5o7h5boyGRDsH/uV2oFD3tkpBx?=
 =?us-ascii?Q?aP+V1XpiXT+omVkTJjJPv/Wzw7oygReaJ/rvRZITdv+wkJa9YR9yRP/O1Mka?=
 =?us-ascii?Q?EK/OSLIberySCtAzrjnuPNLtsy0zFphFMPy7gKdSS0IYFf03T9sIIxLiAb6Y?=
 =?us-ascii?Q?etp/yFwxg3kMMcarpqh3MHhCB4gfBhy2ACt/XsepTtJeOhq18mLd1HGXjvkN?=
 =?us-ascii?Q?IoYbM+LLnmU06GJsl4eIlwWnuKhW7wtlLHMVrQQZVv80LrsJic9dejBFGKiq?=
 =?us-ascii?Q?wNN5vT97s+miKd3fRDBxinjF6CQbZC+JGUnv/GthbSVKHKcydtObMNOmAkLV?=
 =?us-ascii?Q?+ryFNBJx4K8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fktDQ7pUkB3Ih3TI7I2Vu4SaTqFEBRumT69mxLy+4hN65/B80XhYkwADu3aH?=
 =?us-ascii?Q?4XFLG5CtjFzx0yt93E5xI4WF8lyWlTvAp8V8WCNbhLeM1Jbw1pJ8v7yaORb3?=
 =?us-ascii?Q?PWc5HiVcSHGGN6I6gxNnBlvFpY4LsB14g3Eflsr5kqY2uFLI9loRlcj6SoCu?=
 =?us-ascii?Q?i9fj+gSMJoY/pjNi/v826sEV+8oXIxs9Pj+n6bgSwqIJWUZ5DtI7YygXXdNX?=
 =?us-ascii?Q?XzIgHAvuV/vcKCdiD9nvKSNpO1EQz2VGyZt17eRKSfKLw8BZof4EegldHjg0?=
 =?us-ascii?Q?ecqkazNjMGtPjH52RJrUG7ZJ2SOgBThP2iHK/gk13djVBispc4Mn/8xoDFuG?=
 =?us-ascii?Q?acNfkk1l7GYzZX3ct9xw5LNYmaCqRcqkYiZ5ZxgvD22dcZ5Dq50pe5sFKAiL?=
 =?us-ascii?Q?+BdAHr974c3yGb7PV08lNpIGF6F8dw67KDPsMJoAzCdYzrBpWCmN2i3GL3iU?=
 =?us-ascii?Q?8qR0tsaxdFt8ZJYpdTu7qRTRdYTkqLoN3qj+hJt1rjTclvYjtqNc7Tauqp0Z?=
 =?us-ascii?Q?7gxR2ggHlAU3I1QYoposReSHo7Tt04SEPelySuZTSu8bhY5l1E0xGTPlPXL/?=
 =?us-ascii?Q?989JuNEFlaVB/m1VY2n/m4H/sE/WIHUsfQvAzMc5+MwQrtxpXMFTp9ox4PhK?=
 =?us-ascii?Q?wlqFPX/bC49oV3irVZe25U8ESUp7ybZSN9BnRoH+hB6Br5tUnr3Sa4eTLnIl?=
 =?us-ascii?Q?Ecgre1n9weDvvvqBx+Yi5rR4ZbXXQeTFBDeMJXEvrGw7v2FKCMQIHeZjCScN?=
 =?us-ascii?Q?+ZLE3KnbxiieKPtb4aMBh6d9zxvAOSrndY0sa9M77mF3y3uSzvKKzRRZ32mQ?=
 =?us-ascii?Q?/FN6Qgt3BrsTq1FoxMWoRtFpkkJoHRbCRGKZx+J6cgTL1MZJQRBhSD+kjgw8?=
 =?us-ascii?Q?WnzxyA/PZBQCbF5KwMHHAsDylyUNhwPu+3uJSP1mz2vJY0RJ1nV5rqofLD7Q?=
 =?us-ascii?Q?clGdZverfTIAIA+LXODEICnJNiMlDtfeUSZzxPvKFmFXubXiDntQjfn8FEw+?=
 =?us-ascii?Q?z1RW0ZPT0g9FEo+uafQqUSdDtHSNmW0Pd742uh5YVms7WByo9MqM0IpahVaJ?=
 =?us-ascii?Q?VBByHlrgM2IL6sC9taZneMdNdEwDrlWzuMaX9aHnKG5Vdop4OdmqHXmj8hi4?=
 =?us-ascii?Q?8FCNnd0xBYlCSjwIFEGjGm7vcrSX8v3p//q0QMLN4pEluprPImjM4s/139I+?=
 =?us-ascii?Q?693xZrfYx8K1v9DktyTk+r+5SfiB9hRWcF3n7UqonVW3tHfXGnOc/gpv5JXe?=
 =?us-ascii?Q?GMjVcHcEDkytFMpy0R856nYlwtuix1KZ6EEoqFINTpDHSjnc1s3Qs6+b9Xtl?=
 =?us-ascii?Q?7KxPMA3BMmJoLoGavlVnblwpdzO0Zq2sxJBFJcITOJvQ6vGepkXDJhDIpxGr?=
 =?us-ascii?Q?X2Mm+TD8oUigucyq3b85xMrtuUJPwIAFtzbUij/ujoLq5TSBtWgZxJGS0JxE?=
 =?us-ascii?Q?eXXLR1309U3HHUr3S53jKpsFn2krV7bNCCJpWcEMfuCEjsuoiXP1G4pGwiM1?=
 =?us-ascii?Q?GY9Phk8hhPtlD7PX+id2VLHW5K0ONxCXerg1wwKX4tSZYfm8BPBu/kd+woHX?=
 =?us-ascii?Q?QStGQ9IeLL7wDxxEEbuvKTSl47TAOhP4uPPyOrf3vauFfN9vUkGxba7YawFf?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838c4f87-86cd-4f38-8b30-08dda8ee6c7f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 13:46:53.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiX9FvkesvuP5FqDNFGdhXEW9YWQTwN7pykxd6qU/Lss0VbCfCvgMtiQDlxNYX8M4zKNVuDUBfLfrpjxcOcqOxDj4ukDRGD+MUZ1NxVnHRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7304
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684988d0 cx=c_pps p=wuJOWgjOAAAA:8 a=39de9MFdLn04CM8BGbcX0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=eQxBwDx2EpHCmV2-PFcA:9 a=3ZKOabzyN94A:10 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=kgah36pxWqcyCo4vgcyy:22
X-Proofpoint-GUID: C2yL-eDOyVpKbxkI5Xu9cnteVxYJP8SA
X-Proofpoint-ORIG-GUID: C2yL-eDOyVpKbxkI5Xu9cnteVxYJP8SA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExNSBTYWx0ZWRfXxlqotXHIsrpA BhihFuy234vv5C+URYM0EHsFa8jwNvA99s2yEJragqxJrxOQ6S4BfGcm7DKfVAObwGAF/FapmpN W9H/dp2h3TfvoP4AwDO9yKcWuoON0CMq2pVTSu/1ZXr4jUcu3WBmWlKuq62Rs0QmVghN0HUCi4e
 NbZ7XgF0lFlQK6tkxuxwYjHU1QaUynsmwIIhzSTT5IgjeENJBLq3gtjTwCrOR/OP+yPLxL/m/l5 Pe+7vt+o04TWRHQmwnavU39JKTva+opJ9eJw4rjXiD6a+ixIgx8jAI5W/nNPg1aHZDlFnS3M8cC bFM8dG+sX0YgFg0xnyIgJwU66HhNt01F/nUOckit733aHT1TkynoRVLSQ2+G5sQdCAVS3+7RhhO
 YgyZag30SdFz2Q1wOJljaQHOZ4MV1gi+bvUtUaTvWGDonP86ccGsLD3DDrvkrhXaUz9FIzd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=842
 spamscore=0 phishscore=0 classifier=spam authscore=99 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 13:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218454

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
CVE: CVE-2025-3198

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0022-CVE-2025-3198.patch         | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-3198.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 16db8bc05e..30a1e127de 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -51,5 +51,6 @@ SRC_URI = "\
      file://0021-CVE-2025-1153-3.patch \
      file://CVE-2025-1179-pre.patch \
      file://CVE-2025-1179.patch \
+     file://0022-CVE-2025-3198.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-3198.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-3198.patch
new file mode 100644
index 0000000000..0ce7018fe0
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-3198.patch
@@ -0,0 +1,28 @@
+From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 07:58:54 +1030
+Subject: [PATCH] PR32716, objdump -i memory leak
+
+	PR binutils/32716
+	* bucomm.c (display_info): Free arg.info.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
+CVE: CVE-2025-3198
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ binutils/bucomm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/binutils/bucomm.c b/binutils/bucomm.c
+index d51d1349f12..b20feeac466 100644
+--- a/binutils/bucomm.c
++++ b/binutils/bucomm.c
+@@ -435,6 +435,7 @@ display_info (void)
+   if (!arg.error)
+     display_target_tables (&arg);
+ 
++  free (arg.info);
+   return arg.error;
+ }
+ 
-- 
2.49.0


