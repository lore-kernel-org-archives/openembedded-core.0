Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52885C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 07:42:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1875.1749109343007243136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 00:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5554e63H012064
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 00:42:22 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rumsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 00:42:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2G8lW+JwlG+fRVAGl+aM/5pcCF4KilGLWOh/x7YNSiFItEZvDcz5USd7agNr9rl1Qxo1mlV2PqC3wRZRVBMfTO1i4PJ2CS8bJzl+4ezNPM2IrSWHlPwaKaP483w4amh5iP3gneLb7L9fK+ewYI7ZuWuVTzoqLT21F/NyHm+IMaXW/+qyYj3tIHWMT/qTlZZnuKheGMOnvqtT+5BKwsjbMryqShQ/XZ3qj83tLj+SCfT8F1ZA5Ry7ZURH1i64H+mAjw9m8I5iKuYB+DpR7ifKxjYrCzSXadXR50okh4iOe+h84VPhI4/DOYd9wjJBJRCOQ1X5VDJFa7ydO++t+NU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fsOp9MxIiMrXBaKG6LP3PxjD5c8M8Ce7TL3iNzkvGw=;
 b=hktNWWb45J3gIyDNYSRCR2UMsp3GQbZfw5mcNSTaQPJyxnzRKJtihuuN7F+hmPmJMnKrDScYdjXEpxBNdds1kQ9vYFTF0r50DrCvbm54LY5JBAiKJPzjqpzy9wCBCquoNcVn7mYzr5In2kAyj5zFj6cXeZZDQW0a04RWkEuxy4fdh6CqcF7lGyUejTiAq4cDnKylTqn+UYEOmd4xP3JOgkluvWC/TDdCYDe8+kzj1Vhtp7xj1GFGg0Nm4BObFis6xF7PZ7puZFE7qsKucFUXcS5Ry5ywV4OCqE2bueJALqR+22hp+ItE0DFjUS/SNOSV4aIXYbG+hWgip7E/Hi8BBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 07:42:19 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 07:42:18 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-5244
Date: Thu,  5 Jun 2025 00:42:23 -0700
Message-ID: <20250605074223.1542168-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e4ecbc-c098-4356-b004-08dda4047fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z9uL8FfsDs2SH2c7cSC6blH6Gf0QjC4Y/sXswiJz+FyGfqfbW0256I4T3JA2?=
 =?us-ascii?Q?YwsDqsr62md5pMYNwgGE5AOa1pdm0mxIMlj+B8FRD8GxynWL8f+ukp+trHeL?=
 =?us-ascii?Q?CTyuUHPC3lZhkikScWNq2MPNjwCMuMH3Dm9zzOWJm/Qjqe+sCUPSiRSpOwvT?=
 =?us-ascii?Q?4ckl4EXHahb8K6zli3N3FxjJGUwK8D222YxkAWiAoSV0OiB8F0MIUZrHeYeY?=
 =?us-ascii?Q?o5Lqw3t79v7Z6rei72SlREIpTBLV3G56SqLAV9GM9OwlIj+S5zW5+ZJ+BLB6?=
 =?us-ascii?Q?dfdXI0qHovVV0WeLYQPDdYrpGcMJ28ViL70nL2m0rVebFJkv7+jqXlAeuWRP?=
 =?us-ascii?Q?auWgFCl7LNZAB4ZcijgQkgotO9Le/HjibwgpnUF9YqgTqdVGoHYcLVlRJL7C?=
 =?us-ascii?Q?g8EaknjkSAxABmg1K01B05GGohXiVVHO1QUasTYWUeBNbaXLmxd8S8mEbU83?=
 =?us-ascii?Q?JOvrQR53p/LTUDHDdb6alOHOyA8vPCv/58MmbvWKstFPfydjSR+tTOuWgG1w?=
 =?us-ascii?Q?WgP/Ba3pq0uY3MGSk90im6BS9jTPAdkHqz+ghvzePrvKed+yDBdFAqS1Z4l5?=
 =?us-ascii?Q?3sZqO2ERTXzwAyJEnktMaWzbUdDImAd/v1DZ8XfwaKedgJ4o5Rm0jK1Pl5tP?=
 =?us-ascii?Q?oGUP6WQvpV+TIPzFLSev9ElHm1e7E03BTtB1SuJg4Eu2qYeAT9kuwaUDKkPv?=
 =?us-ascii?Q?18o2dGs5L/ct5/dm5uRZROlLh5caAX/NHS6c9IOhRb6ohKWDcBG8MWDDebtx?=
 =?us-ascii?Q?BDrDUMFuY3Uj/+y4/pIzGa54jtL8gyaJd1BosPu7cG8GcfqQk4U1Cb4zRV2u?=
 =?us-ascii?Q?ghdxJIP2vcw4jkOn7KjUjyYsGOhmeS12zzq0wUCV//cQs3gcsFPk4H3n0nRs?=
 =?us-ascii?Q?PS+QlJ6rOUbRsdsOSskxu6TZTeOpMOCm4VwqVm58wkCxVrgryxuWV0X64GVx?=
 =?us-ascii?Q?a40wDfjkwv1N38ZAHwKm7PQWv76EQAf5/vRpieJTdil+Kzo2m3P4/v/MtqYa?=
 =?us-ascii?Q?rdJX6aVd8Xn5cbSn91WgYnEP7iu8ebyun4go7NbnqY3F43UBUaO8yVpZcPYl?=
 =?us-ascii?Q?cjaQNrTO4UZzQC1dRF6UV3OvxawOecC84/ctr6BNRPhp+8ra1NdSStrXZNeA?=
 =?us-ascii?Q?xh5LofoX2ahvl1DgFQI4BYnDlPUjzmh6bABuYttc8XynXdntymEyi7xdLJzv?=
 =?us-ascii?Q?ikQaatbcr4xGQZ720RuLVkl/2QiZDXMOAL2JhOWz0SdOAGh/o+iwRGRFbrTf?=
 =?us-ascii?Q?vzaqCg0MZkHke+kPQtafsMKVBAtKT1ZIY01BmQr3ySgpOpHs2KMlkpkQto/e?=
 =?us-ascii?Q?Swxg1WFiPimXmos6CXejlx1PZspley6Z+8fLHNvmi2LUWH9+exgmqAGed7I7?=
 =?us-ascii?Q?GdNORKbGRwpohZfHOrcAJmQfiZx5cQX7nsXXBCJj4xMkABUyAo+L+tfuG9rP?=
 =?us-ascii?Q?Akq7VKVEwRw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L0WuQHvBZcNated/ZlTnXlxGWd4OD6+rIqqhdtfABlhhnCHYcIbhCDxvJ0ke?=
 =?us-ascii?Q?scnabpgKV/mrj6gKTgzaaFgPdZQ+ZqadpxmsMFOK6+Ofy76hd+9sXbKprNwS?=
 =?us-ascii?Q?QFcuPwyQ6Pz1gwozw2Khy1ZusQy4TD+yeaqmjUnM+IZQ7sWCWMoDX4b5GDH9?=
 =?us-ascii?Q?VR8tJ6s6J+zHAcxVGlONLkYacIBG/7n3EePDMwdpWkCCJyM4asxiSpvXZs3A?=
 =?us-ascii?Q?M13EvVOyhpK0J3ZdAgQd2HO5o/oss/LiHJ4Asc5hoWRKkc5wyzpy7Aoqvira?=
 =?us-ascii?Q?isRWA1MrTMoOl2QQxqrU2RNMOrS9nehNfCd3fvr0JmMZuVXUz71RlIANwhL+?=
 =?us-ascii?Q?Fp301f1Em1YDNFN0mGFawZNnDOERP+HlRQvO8qWKXpS+UD1768m5bAFE+8i3?=
 =?us-ascii?Q?H8uOr6GPp10RD3SHcWje+J5cDQAzEsPwPTVxJaGHKUZvt1hSQMOG4+XvL0Cp?=
 =?us-ascii?Q?FYpXnEcMb4vtT5xmITqSGLfEej0CJafeUBZM5P3578tJIrZGy3JJ5W00F3Tm?=
 =?us-ascii?Q?jQs6rRU6Ut3+dLnzfEdf1Yp+5hhEwJpq4G56IqIB/ZGgrEOGs75OSmYqPLZb?=
 =?us-ascii?Q?2zz/gIpy4yi8YOdWoWJnEQusMjjti/y0G8nkzSYInKAzBW+sfRkmK3iWSbr6?=
 =?us-ascii?Q?EiQM/TGtAte5Gzb4+huYcOtvoZv1oc9V9bNKVqX3iDvjVVl6qTIuLMxUMQkN?=
 =?us-ascii?Q?ObCVRCCokcUQxWQohZUuntWE8XfUbOLdPUrwMn0/kSfj+17Fbx7r31qsIxTk?=
 =?us-ascii?Q?TdEhyGOdF6oAHNRoiXqkSGjzJ1lVbYie1x0Tv5q4+/g1hyPxNS6YXiYSm1Gd?=
 =?us-ascii?Q?TaS5MfxNjz9eiUv+eSURfdcy8XD/vv6SGLIMhDkHtawofFlCrq3nk+8pupoi?=
 =?us-ascii?Q?j2xK9+q7N4TPqIDJobpDUYv6SQxunnrr24B9NZYEOjz6ALiK0VVciuBvVXwq?=
 =?us-ascii?Q?CjH2EL1P5w1L5EtAHg6nQFnD6xS1u3Bh3gkh0W6mpgTzkB7Hoqa/3NuJpkqc?=
 =?us-ascii?Q?gSlybSg7kFXIyBFo83RKbr3fW1TZrhjtcWyy+WJDe3dOiGDEV3mO6MYQc8yd?=
 =?us-ascii?Q?eNJVtaZSJ1zFvZjgrcK4qW6YVNVPQDbjwxjidDplDQO9Vq1yZxdLfH0pdCLd?=
 =?us-ascii?Q?qjbyI3eWLOwt9S9cfg0cL7L3jWzJaFBuOPm9VkBwClTuMINLiukZB1AMKQKH?=
 =?us-ascii?Q?FldIqjMGc9oWo8YHfRqOuH5K6Kmp1pcslY6kcb/u/AxA8xTMTPGrAivDsDiX?=
 =?us-ascii?Q?IbV5vc25BHqpiGZZGaCcA2761J6AAHsW9OZz0uyAXxYDvQeo1cHU7gmY5oGM?=
 =?us-ascii?Q?lOG3i8E0xPZaH2ZTzYKzD8mf2f8+XN2aX4Blx2bACNIgqLL72lnatdwHEu1e?=
 =?us-ascii?Q?ZTrqDgN/p2RtiFUzXXXey6QWioEGva7rii4P4h9cLrBqTO/sOF1iK76L943G?=
 =?us-ascii?Q?NgdI8JisB9mET84BzraaMnUoZTIvyXkDYMNeECgY/O20MOMFrQ8xzypAzcXb?=
 =?us-ascii?Q?SSn+PIKabCF8xOtp4kqAiC2Vv2348P4mxRNfcqbmii514eANrXsdPeGpvaG6?=
 =?us-ascii?Q?6lRduFAD9BUKRk5vH5B0g4NO4//CuAdZs95+KG8R6H0EPQ+zj4dW0eQQUhXR?=
 =?us-ascii?Q?W+C1p6bJ06dj+5zNY/f6Mfs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e4ecbc-c098-4356-b004-08dda4047fb0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:42:18.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SlFX/PugZA8tmxGynHP+L2chqYKiVmvX6zn1uu6Os1k4wJ9clo6CaHg4eSh1huTkEzQkukiUXtMZ1yePlIWkmcMI3Q3DRj/osIm8CzYY7o4THNcqapCx8vlsKAyaygw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-Proofpoint-GUID: Bk-X47EKqOOFalcRYMHmgPGbnDT2j66o
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68414a5e cx=c_pps a=xMIE5RCmi4zid/p+q/zqlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=SF8dohJSsYIBP11I8NgA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA2NiBTYWx0ZWRfX27rTfIeylpbb nDrdprOt0yMkkuZuq6RugxGndrkby+rxF7alr8EYtX9DRzTnWM/2E4xlOCqkpx3i1Vm4WVR0upf hx8x0E1y5NOy2jcaY7+IcVTKkVw+QqnC68OgdlFLxDCiv7W/Mb7G6rg0WHlv6lyzLutbwlqKZoN
 wirbpQxzbYh2t0rHoXHvSdErfyIAV1rtqgDK2dq9v14vsEd1ARVvPax3ZY6i17RZMsPFQlippqF KtJv2aq/orvcDBeG5xV+leVoLFts9J97G4BTEJWDZFFHEXkoVJYZDN9A2vrp95vtLfW0Tq4vyV9 AfAmDu6NdClYBjQIj7njGfOfAt1vxsQVJnBAlufpTZ1Xi+LVk0XUB6C5ZohebmYX+HrwW6IJBTv
 MJ6eyd1e5fty8d+ZNSx7laah9MUnmX8fvQB3fT4czW9G7WGp+kb6qajXCEudWUCCsZFyRhjJ
X-Proofpoint-ORIG-GUID: Bk-X47EKqOOFalcRYMHmgPGbnDT2j66o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=994
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217992

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

Backport a patch from upstream to fix CVE-2025-5244
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0022-CVE-2025-5244.patch         | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 16db8bc05e..523c96ab7f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -51,5 +51,6 @@ SRC_URI = "\
      file://0021-CVE-2025-1153-3.patch \
      file://CVE-2025-1179-pre.patch \
      file://CVE-2025-1179.patch \
+     file://0022-CVE-2025-5244.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
-- 
2.49.0


