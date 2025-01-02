Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A1DE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 05:45:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3128.1735796718503641106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 21:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=309752342a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5025Zcxx003919
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Jan 2025 21:45:18 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43tdg7bndd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 21:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkNgRL2jcXfg/J0vTGnUA9jUrffShtqklVfadIHvkwyfQnfGTaBYhfCliwhbMKqLDf2uebMxJxJ2nu6+ZR/vDnlMkHNITtoVcdZFJ/ijRwOpBphvO94SdFP/Z2oewcZYIefmtlR4c+yFsJ9CFAnamIs1h2JSGPRHutHPQAyanmjg2eQh5JVZE1uwHlJy4pV+VnP+ZSGqJFhZazJ09aZ8kbVyCK//+JUO9hqZqJHrqgPQbfuRkkCpIy5TO4z40MZoN9GrFfxWQKJi6aXLxYTigTttCscXZGSgysCN7qhFI/FNYzcPFd9jpscPnGR9Wh3OGZOTE22p5lf67wub59ekdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n1WowFrsK86KYQiykG+slurqGmTDEcVMJITth2mdtE=;
 b=XUaIcdfHcLahll74FY0BHQ9W+iz643uZDN4IYmrCSm+pVWa+4bRaB3pBaleX4Sof12thAK1mLjAa6P361HKMQGHKKHHDeOsQZII6EWpS6aqY5JZjwcWWvTOf9+lB+GvrKbsWR4X+oWkTBrkduWZcS7Qn2nKQ+SMFb+2TzQHB/S8ICsfISki79/gKYoN+1XNdB3RcSx5wg4JWGkxJBvCsdeNASLHptwHBjBHnjxfue3ky2TNL0W9MbTdMXAa7gFtlFha/1O9Lbadg1RGSE94koMFU83UhetdQYQKLFbyvLqkwFMSjP4NaRjMBClB/7mdrgfl7CZmOsKqcv0GHeD61AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 05:45:11 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%4]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 05:45:11 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][kirkstone][PATCH] pseudo: Fix compile error on centos7
Date: Thu,  2 Jan 2025 13:44:51 +0800
Message-Id: <20250102054451.500564-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:4:186::16) To SN6PR11MB2671.namprd11.prod.outlook.com
 (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e542b1-b0b2-4a1f-771b-08dd2af09f5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+2nQt7iS5BuUMy1bbgGbfhbMo4hiBmsqmK3bGEsG7iRYKKDsizGOW1Kk6A4X?=
 =?us-ascii?Q?xUXZ8J5Hj7Sh2U+qz9WTZdhD8LpIqOIBnao4lv5kszAfdchqdtJFDOm93oiJ?=
 =?us-ascii?Q?roPzFtlDzzptyg4v3zcx2ve3QjFcIAivo6Bt8eqnfZBCBVZtdwZo9rlPpoq+?=
 =?us-ascii?Q?P0XgW2vdoeArZ9sIHKtzgU5zkZSpKXjJ1uvybCxNi30WDpllj8PuPAYIyJ+u?=
 =?us-ascii?Q?6LiR0ewX6owTUs4qH4x/U8Km2Gug6xVb3EMwOmsk7EALPa+NQCthmpSGvlA8?=
 =?us-ascii?Q?udK/E5uDWSRrWfivogGgRG4YKGluw4BiLcmc/Y3B548A7z9MrLwoHzOO64uE?=
 =?us-ascii?Q?WvaefOBRVcBYesLJSqA9LYVd2+riT8aaOWQ97aBNPauCGHd+Fi0Q73fMagGV?=
 =?us-ascii?Q?ymjRCNU22QWI5p3T3sVe1Cmmxvd2vf8rZ4AoWEDixaTuun9XvVBe57Jq599M?=
 =?us-ascii?Q?BjL1VShrywhttOVygWNSLNHM6Fdou6QtUVCLAKUe6o2u9nQrrLmNep7wU/1y?=
 =?us-ascii?Q?puBB+ZAGOMOXxTqCH84oTJLTqzQMqhSlwAUBa6USgqasahemliIkmM9OaKj7?=
 =?us-ascii?Q?H4UgrT4DpOgvhlj6EABBiuFyCv/jTvt+oPPMr64GQS69NmLEfaIWMKktrS2f?=
 =?us-ascii?Q?2jh2jBvNycDQZQMDu7I4tVJ22oHI66ScZAtvhxKZU/MppbjaDTGg+9bqNeqE?=
 =?us-ascii?Q?qgl/TNWKrLYMI6qqJNHzmObaEM24igxGzADxU66jLKrwlHHDb8GdFNhh8Uxo?=
 =?us-ascii?Q?XJXdPHPeILJALML5VbPeF+/OyNcdcFNHam/gVVp3Tn0HcxUOTq1qy7NeVGMG?=
 =?us-ascii?Q?i0lU2wKno5/3VOo/18hQrvEZwXc3Y1fh8HANe2+GU21/bSA8uYz798qoAIHo?=
 =?us-ascii?Q?YxIO676mlcFEOmRKahTcGRkeG5E2Y7GQOoXQK791RP3FNfIqihx92DX5DQmn?=
 =?us-ascii?Q?b4ui24u409WUvUv/AGhkgUAUDjaYOlpSCBb+GPovJMhFyg5dXLnJuJDOWgIj?=
 =?us-ascii?Q?/kHNwRaVu7ZAyy/WZTKyOJfgUSLYn257dFsFm1XVAAg49Hy6Z6YTum6qbuHZ?=
 =?us-ascii?Q?6lr69bwJ+XlbEiqZjTSXQwGDcHfdaleqasqhxqNqaUfsjrMbxw4iEzu1jiuX?=
 =?us-ascii?Q?JIKW9ziH90D0R00tSajY9ay72sQSlL9/YGPneldwSLc24a3tuClzPJf2ns29?=
 =?us-ascii?Q?KKUIzqkJWTCt5FB0WkCnkXm1PDc53V8uAEHZaD3LG9BO+9WQZLWPGcRPkKSm?=
 =?us-ascii?Q?sg1zpD1BE35kXeml7DyH6MiCS9o2J1Thhr/vR1suPCbvUPtDBcYgQqVp7vF+?=
 =?us-ascii?Q?2EnErIwHkHgVCGO61MPvg6WPTnYURWSnNZAzFqLkASFL7oGWrkByBOGO70xB?=
 =?us-ascii?Q?BJoiih7VT8yA/58WbFwoHDTiGGBeXrSKhUwdmT8vY+Ox2TbqZw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zvt4Ba0lXyXeUMurpqXdB+ZMnvwaxjlZVLIxwpdCYOGNKNJpuKCJI3I9plfU?=
 =?us-ascii?Q?EW3Wpcq70ZNKudVmPkYRAA4HQsK5xyeavTOMu7wgxuxwhNoTFfYP6ha0/P07?=
 =?us-ascii?Q?H/jLSJkYU8VJfWXVmzRs5DAJUznmRoAzBNvezHwnyPwncmAxrGBXdzyQPwge?=
 =?us-ascii?Q?7Y9VHbcW8725Z5qreGbnaxkNp5JkteGUHjIL8/PeKRmZ1f5wtsdA97XdHY9n?=
 =?us-ascii?Q?sQt/6E+35BhN8feZyoRgCr1IcYzBBPxPgUwXHs9WnocP2t2KHdooQPcDQL9g?=
 =?us-ascii?Q?UEX+vEiO9STPCtzKGvIBEPpI4ZFHN6c5vtqCp/sjWsREcBOTXFWL8DYP1i+Q?=
 =?us-ascii?Q?qxRyQd/U0GsxCwxItLtwN92WEQGwk6c8lUxenK9aGm1pC7ivaZpEX5jN/ljH?=
 =?us-ascii?Q?a3SGT6vk0J+DFdvDjH0pwGUBjCBmVLYpJbotnuBBbz4d+TZOZyQryQ/g1kHr?=
 =?us-ascii?Q?xl/fBVR4WZvn0BzsxEncXF21DvPsvCdBzTMh13OSvt67ojMA1Dlsbu25pfL0?=
 =?us-ascii?Q?SQKQQB2DjCjUBKr9MeLl0FHEQ94vGqbEftmt/E0hnRwkC2cf+6DefzFp4uY2?=
 =?us-ascii?Q?n2+q/8H3QTJPSxDm9kQ63T8ollKuvF85lqUpf1mvX87a8V4xcUHtsZgPMtYJ?=
 =?us-ascii?Q?8BX4DM4iTil/heHlNmiXfKg3O7fR0y2Z+RJrALolVVye4NwoUMkLZlA7WJwV?=
 =?us-ascii?Q?Iysc7h8XY2VTs0vqtp0fBoJTOLIB7X/kObhv/M38Og96Cu34Yn/qBDtdAz1Q?=
 =?us-ascii?Q?e2YgSomVX17H68ZOHhm6EOjPIyiGFIxNw5EUg0LsWbJUU2fcgjgkWN+Lpyy0?=
 =?us-ascii?Q?CoisTjcKHoDNOqCXFdVoLxr/Ht9eeuOIvp4g5MoarsOXp5CevbkvSWfvy08d?=
 =?us-ascii?Q?U/IyF6aOKjUwvTF9RVaogcaXQxKlmml0DiMdj6xk/cbVV6JXd410zvPiXkGJ?=
 =?us-ascii?Q?5GyJfSV65RKYLb8wDgbKpeiMJFVfug0ZiawAYm5gJa7gy1Enl2fP/2yN1f79?=
 =?us-ascii?Q?PUDYhT6kGhjD83+6avJQLVb2TZcB/PoRRWpzC2iKn2y8DvIalJiA0ayFL8fq?=
 =?us-ascii?Q?xrM5u1UWUSsIdtkr/hHDaAhzwehMoZDrGNJ+zJVo16dpmOlp5LpXeGIWxfpD?=
 =?us-ascii?Q?CFqEe3tngijtDxxKPK9UMqe6Ujz9MdNa/0FxrOkCoE9hWewbgJCJP6LsQc17?=
 =?us-ascii?Q?Sszb+9GghgW3h+FeSmiZxxMJw/pRjX4bPQSZ4R1id/3xQ4rB9WWPZig6dyWS?=
 =?us-ascii?Q?d4PzUnsI+DLR0o+2AtrDEQv/X6qHfAcIENXXpvK1ANh90flZkrFN2laDBMuc?=
 =?us-ascii?Q?LRvGg5oY2XUAfsdu2Uwg8kvVBNeQo3doaPtJ+FeNacCfk0QYWncVkCCfovgh?=
 =?us-ascii?Q?NCBolCBI3jIJr8wrDYvm8A1k0z65OdkmMBucehVNmjefVtLJfEecmdjh7quG?=
 =?us-ascii?Q?ZLMfTNKhc9ZSJeXRfd3oSKPC60SXH1KdOrtEq/yglOH5rg/ctm5E5knlAQwd?=
 =?us-ascii?Q?bFoC6cQciH00PuM6KJWvlTW/D3Ms6SbfPp4LQgyzjbzu/h411C+im7swlzO2?=
 =?us-ascii?Q?BUfg5L+UgZZtk0r7tMe2pP1LdTRUUEK3tg24+YzSSPQPtk6N4VAYNZAzUmov?=
 =?us-ascii?Q?8Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e542b1-b0b2-4a1f-771b-08dd2af09f5a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 05:45:11.2372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilpk9cbColNOMPk8nR6YZTNRBk6YPtjJHuETu4CuSov0JCAUSz1OOOr9vOX+kJBhpVwGVkRbdJK72y+42ZIF/sSAgCja7AjotOnG6/FnySg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
X-Proofpoint-ORIG-GUID: aLYuug_VsX617PPsWiBMdibYV_coUYZu
X-Authority-Analysis: v=2.4 cv=AokU3P9P c=1 sm=1 tr=0 ts=677627ee cx=c_pps a=+tN8zt48bv3aY6W8EltW8A==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=iGHA9ds3AAAA:8
 a=t7CeM3EgAAAA:8 a=S3P0Y-bat_pF7my8Lz8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: aLYuug_VsX617PPsWiBMdibYV_coUYZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=978 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501020048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 05:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209253

From: Guocai He <guocai.he.cn@windriver.com>

When host is centos7, fix the following build errors:

In file included from pseudolog.c:21:
/usr/include/sys/stat.h:366:31: error: array type has incomlete element type

In file included from pseudolog.c:21:
/usr/include/sys/stat.h:366:31: error: array type has incomplete element type "struct timespec"
  366 |         const struct timespec __times[2],
      |                               ^~~~~~~
pseudolog.c: In function "parse_file_type":
pseudolog.c:214:10: error: "S_IFSOCK" undeclared (first use in this function)
  214 |   return S_IFSOCK;
      |          ^~~~~~~~
pseudolog.c: In function "format_one":
pseudolog.c:754:43: error: "ALLPERM"  undeclared (first use in this function)
  754 |   printf(fmtbuf, (unsigned int) e->mode & ALLPERMS);
      |                                           ^~~~~~~~

upstream commit:
https://git.yoctoproject.org/pseudo/commit/?id=15b4f4ca25593f684e6517d0b809605b443d1953
When the host is older system,such as centos7, this upstream commit will introduce 
the build errors. To add "#define _BSD_SOURCE" is mainly to avoid issues on older 
systems that do not recognize _DEFAULT_SOURCE.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index dfb5c283f6..9a7cd3744d 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -28,6 +28,20 @@ Index: git/pseudo_wrappers.c
  #include <assert.h>
  #include <stdlib.h>
  #include <limits.h>
+Index: git/pseudolog.c
+===================================================================
+--- git.orig/pseudolog.c
++++ git/pseudolog.c
+@@ -10,6 +10,9 @@
+  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
+ #define _DEFAULT_SOURCE
+ #define _XOPEN_SOURCE
++/* This is mainly to avoid issues on older systems that do not
++ * recognize _DEFAULT_SOURCE. */
++#define _BSD_SOURCE
+
+ #include <ctype.h>
+ #include <limits.h>
 Index: git/pseudo_util.c
 ===================================================================
 --- git.orig/pseudo_util.c
-- 
2.34.1


