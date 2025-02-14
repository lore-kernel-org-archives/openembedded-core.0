Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB07C02198
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 08:40:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16742.1739522384260576059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Feb 2025 00:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4140fee6b2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E5rp7i021901
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 08:39:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44rnpbjnda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 08:39:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gamMc211y74o7efYt5GZuHha5LoPn7heOeJfPFCgGEo8kIAWX8Ma5Ipbv3F8ZQP38rpL+9hHYPHXLMlV6QYELkuGEk8wfRdsp9uOG9T+W7PxIbcnIytulVPPoIZl9q0jsIUROmhmpH8L46XKCSOtEfULf3WtiHli8oUxZ391IXwYjl4mvc/5/GrwUV+Xm487dNb+CRlGO9VgbdrK3Tf/YrYdnny+pFqhq9EPc0176/HOBHHpnZ8SsnmANYvkmi9dYqTXYzzycnSKuDeQnSRGz7o3Ho+vfDq1itzPKDpbExmSpmlvINi8NWICBjzm2FIHi04DMlwj/DtzLBQSOuP7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MrtQ4MZ0ZUuSd3urDHAZ5jVGmDo8Dipawk3PMuk5k8=;
 b=eeOjvVZd4efW04ylAOvikTg5OYcANJhN8R61dbnSGOG0xIdugGoLYzS+1I6pE+o0+CessJTOuvqr6+4dAHt94jbZqdLwZFQxss+DfUBH3kj2EUYQAHfdUs8+gR4L+h1odb9GCccYIBi8rKGp+fNBvOveJMiyXZj74YL9E7/llR1sxqshsiGmQuh4Vmslo82llZgDGMFLDc+YQNPthnIfZS+4Ot5aBj1lUugrwOmiDsbqcwWEictCLJNbFYNR28RL3oaOQ6HflZDl3FClnAjhrkVQ1F6yXjoLxcu+oEfmdoq1lQkSpyOeYlgA+hltjrCT7wm9gQPoyzvCdMAAL0GnaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Fri, 14 Feb 2025 08:39:39 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.8445.008; Fri, 14 Feb 2025
 08:39:38 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from 2.40.2 to 2.40.4
Date: Fri, 14 Feb 2025 00:39:27 -0800
Message-Id: <20250214083927.4060440-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0100.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::41) To SJ0PR11MB5613.namprd11.prod.outlook.com
 (2603:10b6:a03:3ab::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5613:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2fe8f7-3fd2-4800-4737-08dd4cd31e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PEc0xhl43DEy3u3fY9EvPWsSPJnA0PyJCUWZCxQUhZQKHEPHUK9Fievy734X?=
 =?us-ascii?Q?uKuE60RdESTXr2wdKlQqJ37YIBVXW8tGpD0DsN6v31Pb7MCH6RbZolGTQgkP?=
 =?us-ascii?Q?dBvX4fURWMkMIdcOimVhlZxlBYjnDu68u7X/8KJrXLxj2zZb0bKHxkJovbtq?=
 =?us-ascii?Q?gXGIyEAXPM6s9zkR9F3o0gR+2PL9VSAuMQ1hUMK97yDYDY64AX+J8C9wxNEt?=
 =?us-ascii?Q?LadaQxvFDp54TOnKbSNWaRT9Q1YoyB/tEkRscotreibjvXakLSJ5pqXAMhUb?=
 =?us-ascii?Q?I07bjn4LpsMRcyMtt1EohZy7qUtgbbgujkhumdkHJmAD4FX8ZzW8CV0RjMUV?=
 =?us-ascii?Q?7b/ED28DVBJbMeskciFF1t7/P+m4eCT5/k3hg8CJEl6/yt+w30hKLdyCSQOt?=
 =?us-ascii?Q?tp+3i5884wB7f0xT6JgEU/j7RmVeP18aDp6MJT4aOXnCGZW+NQQxpnPaUDSM?=
 =?us-ascii?Q?09V/ALf6ukkmCf5fdFtt3MaxbotqA573wjkRjscPXRCDmlEoSnhsopxaYv0v?=
 =?us-ascii?Q?OqfqUPBO7kD3MlBgUmlc8nqFnF2PfeUKKuGEDgRM/mt64hMOkI0k8SDydA7+?=
 =?us-ascii?Q?4pQnYOr0puflr7C/gCLlzBYXNbcMywwjqnB2lnES1Ta3PXP31KXb7FyTXFvR?=
 =?us-ascii?Q?enJmc/ZouEhJ/NlmjrMVTdlKOPe7G0r50YDGJXQyQwMnvue4T5Kq8kRfpdIU?=
 =?us-ascii?Q?RjgTzv/Bvj6BocL2o9RCEf4LYQF9hylKLHtLtpG0dKRUJYzyLmUaqCi9YALf?=
 =?us-ascii?Q?5wLQAM4JGde5trFp2MKxF0zIBfjb3Me5wRrs/sKjWM/KtroT2zna1N+w56Gc?=
 =?us-ascii?Q?9JG2UKDON8EB7R8PycduT/FfYznkucS4E3D4AYBUTUgf/2Ih/J66zg+HZOyQ?=
 =?us-ascii?Q?e1nMB+yGfE3ZDZ+5u4g1bOzYcuQxQ0CIOSy2IGEBinXOWgMbrOHvH2q1uq1L?=
 =?us-ascii?Q?KBR3ao1KsDcAZ6b7TMOYuPVqbcSawLw2ARAZJ2qrw6C6kMPhg/rerkoTpVm9?=
 =?us-ascii?Q?MpSdsXorll3ijnEu4sZpZV6cFZ8MZLmWU8DLxES/4LjVdSFHfTxqXdN9S+t3?=
 =?us-ascii?Q?LMmcxHUglNOFpPd2td68fw3mBMLz/dcpmayeDDYAtNZ4O+Wxz5eu+dP9g9t6?=
 =?us-ascii?Q?/F2LxdOOPTpOl0GGLoF1KiqPGOIjfzIAyQgSb8jPyYQsYEA68VFXrYAWecB4?=
 =?us-ascii?Q?Tlqjwqp2KIlCJZyMjtERtXEzM3VyxIdVM/ZHzXiE6KUTdZ4+WlF5PL0iHEex?=
 =?us-ascii?Q?HXiBhKQTUU1KgN4iXUTiCMPI7XvG7ra6nvAnkcctXgqfGfXRui/DMlfhh5qX?=
 =?us-ascii?Q?TFT4UFJRKETHIDZVdFU/bYEOYbf6/+MYCi1OeCzHHHKWoUkOXQPlU9ytt0qZ?=
 =?us-ascii?Q?kjfcLJ0dGKzaH93QJ+uNE63o4dLGHfiL/37M4695Rv8shEGlNg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OaMmUWJQ8bxLdnB5j900+7+moR0ujMbyIF7v51Tact/ZZkJCBAajk2AzrrrP?=
 =?us-ascii?Q?irdizxrEKOryfGV8RsWS8UlVBu+G1bM+ZAHw6LU0ymVx7y+cLF/B8kkzgPFa?=
 =?us-ascii?Q?d1+707zJOh6sPZ6EXLmiPgCl30kGmcHZh17y9YIGqALyO4m50Ni7kzm5wns7?=
 =?us-ascii?Q?RO+Nzu2YOXkA3I4kNkyJslzNM20dafITLkiMVkEdP3yLH5n9MTh8W9kuK4Bn?=
 =?us-ascii?Q?y1jzFE9d8ZeoAnkR4Yg6dlaCjInwWMBsvM0Bjhb9bZVGNlzpCJ7MPVOdwg94?=
 =?us-ascii?Q?oumtUJKuRAQjl+/qpFF4ficcmWAeD5VsqO2OzVGtfDBvtYUtoofrVTm8se1T?=
 =?us-ascii?Q?/EHCgO7SES79qBPM9x6Lfhq0mzoUBGcDySkYBUGOsygFZogyTxi1qL18mscW?=
 =?us-ascii?Q?73FSauJ/mXrSi5Hm4PIxogxMaDMVdh3eML2SFw9g5sskNpOoKPlwak0shNc3?=
 =?us-ascii?Q?GwQbVbBYgbAy1LeXtDz7I/B0mixlLK1oujwOyncjuaLS1uwyTChc44FcgEg6?=
 =?us-ascii?Q?Y17QSoO+mSNIlUsQOyFrHJ/Ecb0tWUpkmSXCoUr9xVi0E6kSmaxthutWDtm8?=
 =?us-ascii?Q?3rdkZviRLYDxXWgvf7diezMtK2+yimAjsV1pnf20qw8x4jrRDr08/r+8rVEq?=
 =?us-ascii?Q?gmrtsfH6ETq+BRi53boevC8Yiotc6pjfjNaigpBDn3worCs2JmOup+gHJ+ip?=
 =?us-ascii?Q?1oyVmFTfb2LuiTJnKS4mRCa0YLDy9uTqLDOIBkrNnh8+aUmJPy7ZdRmy//ep?=
 =?us-ascii?Q?ZPIyRXE8YdJvK6XnUsf8Jsj/K1BQPEPIFqWYOjoTzO2KaFoULOTS7jsMo6wm?=
 =?us-ascii?Q?bv3PvMQd3ujecgVpK0Dy+MrFqNIQWB8DuOY4v6bbg3jFPtcunUpfa3opNalj?=
 =?us-ascii?Q?0S8E22UXc4feCelURlhAST0oyB11sWpSLw1iQGnEqw4Lh85UWE4+ys/NrTDc?=
 =?us-ascii?Q?O9fub/F2yR9ZOqaboOuWbmQMffFVcqqMfoX1lREEuy7Z638Y1ldyRl8DDAUx?=
 =?us-ascii?Q?eMMoGH2xvXndjy+4mtE8vN3Y310Qp6swJjFmWdRIT1/sEXmFAOFVlUVR/ewI?=
 =?us-ascii?Q?X0Duflf0ZzIL/KYW5WkAEvsle22P4SWmm9jsMR1sh/IiDgxsqUDOoYFcEQoW?=
 =?us-ascii?Q?BB4tDeUj875GRyqkzxrf32F+m3sgn3o64dmcHaPmMxFmKdYHnTHy/Dq9OLgc?=
 =?us-ascii?Q?a7xMWPK8A3CDeyjk37TODiR+QVpvPlvhW6zDRwCagg89GPR7cjj/Ay6NWey5?=
 =?us-ascii?Q?ZI/Fp7vgYhR2LuRAH4GO2UkhoPvsSihmVq1vcv33KenH24aN5Jc4/vCalVLH?=
 =?us-ascii?Q?mtY1wIx8rHJq/a65+pCUp6uTpOWq5wNqUOal+OnJqC8H9aMoHwSneD93a+73?=
 =?us-ascii?Q?eX5Zm3Kbu3nQxnTDYq0uL/smzZNsKUAG6wIX+e8opiUcTSYdDbLNoAooKf0B?=
 =?us-ascii?Q?Qop40QwxexVDvBsDx6VgRip+3bqyWTJH2SI7zlgpLOjUJUaNI6ImAiM92UnH?=
 =?us-ascii?Q?cKAEMGse5KEId/UlHIHr+8klrZ1GMvic8jJkhyIH4L8f8zPXhMqlkg2TC8jJ?=
 =?us-ascii?Q?HE2i7V/fGCW3jQVLjHUbelOWcLkBWDfS2g5U8/aOXP18/nKa6H97Im+xfinA?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2fe8f7-3fd2-4800-4737-08dd4cd31e54
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:39:38.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgtWX43sU85q9GYIOs0Qmk0vJpk7QOTQ2jFqmQPjp7kguLvsAyb5RndsmluPS/Zaly4EhNTNi6LgF/JUdCmxNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-Authority-Analysis: v=2.4 cv=B4lD0PtM c=1 sm=1 tr=0 ts=67af014f cx=c_pps a=2bhcDDF4uZIgm5IDeBgkqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=nm5MquI3v2UFVCBuKtsA:9 a=R0G_aJAkdoEmRj9N:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fyjBL7tSpx148BXfiLd_po_zLDJo2iRC
X-Proofpoint-GUID: fyjBL7tSpx148BXfiLd_po_zLDJo2iRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211377

From: Chen Qi <Qi.Chen@windriver.com>

The following patch dropped because it is in the new version:
- 0001-autotools-fix-securedir-and-pam_lastlog2-install.patch

libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch is replaced
by two new patches:
- 0001-cfdisk-add-sector-size-commanand-line-option.patch
- 0002-sfdisk-add-sector-size-commanand-line-option.patch

This is because the original patch is a squash of four patches and
two of them are in the new version. So extract the remaining two
that are not in the current version and make them separate patches
for better tracking.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.40.2.bb => util-linux-libuuid_2.40.4.bb} |   0
 meta/recipes-core/util-linux/util-linux.inc   |   6 +-
 ...x-securedir-and-pam_lastlog2-install.patch |  82 ------
 ...dd-sector-size-commanand-line-option.patch |  90 +++++++
 ...dd-sector-size-commanand-line-option.patch | 105 ++++++++
 ...-and-sfdisk-sector-size-improvements.patch | 252 ------------------
 ...l-linux_2.40.2.bb => util-linux_2.40.4.bb} |   0
 7 files changed, 198 insertions(+), 337 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.40.2.bb => util-linux-libuuid_2.40.4.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
 rename meta/recipes-core/util-linux/{util-linux_2.40.2.bb => util-linux_2.40.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 580ff488e4..4e8701ffdf 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -38,10 +38,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://fcntl-lock.c \
-           file://0001-autotools-fix-securedir-and-pam_lastlog2-install.patch \
-           file://libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch \
+           file://0001-cfdisk-add-sector-size-commanand-line-option.patch \
+           file://0002-sfdisk-add-sector-size-commanand-line-option.patch \
            "
 
-SRC_URI[sha256sum] = "d78b37a66f5922d70edf3bdfb01a6b33d34ed3c3cafd6628203b2a2b67c8e8b3"
+SRC_URI[sha256sum] = "5c1daf733b04e9859afdc3bd87cc481180ee0f88b5c0946b16fdec931975fb79"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch b/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
deleted file mode 100644
index 272e574a77..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-autotools-fix-securedir-and-pam_lastlog2-install.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From f912fb1bbb0ff5af2736d154347a3b9fc40476eb Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Tue, 27 Aug 2024 12:00:21 +0200
-Subject: [PATCH] autotools: fix securedir and pam_lastlog2 install
-
-Addresses: https://github.com/util-linux/util-linux/pull/3173
-Signed-off-by: Karel Zak <kzak@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/util-linux/util-linux/commit/9c787eaac43f5f01146f792b0239f587e4b81202]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Makefile.am                    | 6 +++---
- configure.ac                   | 6 +++---
- pam_lastlog2/src/Makemodule.am | 2 +-
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index ee2d553..a5dcaea 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -56,7 +56,7 @@ usrsbin_exec_PROGRAMS =
- man_MANS =
- pkgconfig_DATA =
- usrlib_exec_LTLIBRARIES =
--usrsecurelib_exec_LTLIBRARIES =
-+securelib_exec_LTLIBRARIES =
- bin_PROGRAMS =
- sbin_PROGRAMS =
- dist_usrbin_exec_SCRIPTS =
-@@ -155,11 +155,11 @@ EXTRA_DIST += \
- # pylibmountexec module must be installed after usrlib_exec libraries,
- # otherwise the libtool relink step will fail to find libmount.la and
- # will try -lmount which is possibly not available.
--# The same for usrsecurelib_exec and liblastlog2.la
-+# The same for securelib_exec and liblastlog2.la
- #
- # So introduce this dependency rule:
- # install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
--# install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
-+# install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
- @verbatim_extra_dependency@
- 
- #
-diff --git a/configure.ac b/configure.ac
-index 0375d29..134cf38 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -123,8 +123,8 @@ AS_CASE([$libdir],
- )
- AC_SUBST([usrlib_execdir])
- 
--usrsecurelib_execdir='${usrlib_execdir}/security'
--AC_SUBST([usrsecurelib_execdir])
-+securelib_execdir='${libdir}/security'
-+AC_SUBST([securelib_execdir])
- 
- # static configuration maintaned by packages (e.g. /usr/lib)
- AC_ARG_VAR([SYSCONFSTATICDIR],
-@@ -2767,7 +2767,7 @@ verbatim_extra_dependency='
- # otherwise the libtool relink step will fail to find libmount.la and
- # will try -lmount which is possibly not available.
- install-pylibmountexecLTLIBRARIES: install-usrlib_execLTLIBRARIES
--install-usrsecurelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
-+install-securelib_execLTLIBRARIES: install-usrlib_execLTLIBRARIES
- 
- '
- AC_SUBST([verbatim_extra_dependency])
-diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodule.am
-index 6d23653..a2becac 100644
---- a/pam_lastlog2/src/Makemodule.am
-+++ b/pam_lastlog2/src/Makemodule.am
-@@ -1,4 +1,4 @@
--usrsecurelib_exec_LTLIBRARIES += pam_lastlog2.la
-+securelib_exec_LTLIBRARIES += pam_lastlog2.la
- 
- pam_lastlog2_la_SOURCES = \
- 	pam_lastlog2/src/pam_lastlog2.c
--- 
-2.25.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
new file mode 100644
index 0000000000..73031318d2
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-cfdisk-add-sector-size-commanand-line-option.patch
@@ -0,0 +1,90 @@
+From 724b95ee6847613e23ca18f4918d4e65ff5b270e Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 15:48:46 +0200
+Subject: [PATCH 1/2] cfdisk: add --sector-size commanand line option
+
+* improves compatibility with fdisk
+* add ability to work with disk images where libfdisk defaults to 512
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-Status: Backport [fd38ee2274f7a30393d3839dfce556260355c3fa]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ disk-utils/cfdisk.8.adoc |  3 +++
+ disk-utils/cfdisk.c      | 15 ++++++++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
+index 97fad621d..759f39f0e 100644
+--- a/disk-utils/cfdisk.8.adoc
++++ b/disk-utils/cfdisk.8.adoc
+@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. The optional argument _mo
+ *-r*, *--read-only*::
+ Forced open in read-only mode.
+ 
++*-b*, *--sector-size* _sectorsize_::
++Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
++
+ *-z*, *--zero*::
+ Start with an in-memory zeroed partition table. This option does not zero the partition table on the disk; rather, it simply starts the program without reading the existing partition table. This option allows you to create a new partition table from scratch or from an *sfdisk*(8)-compatible script.
+ 
+diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
+index 183b7671e..f37e2d72a 100644
+--- a/disk-utils/cfdisk.c
++++ b/disk-utils/cfdisk.c
+@@ -2739,6 +2739,8 @@ static void __attribute__((__noreturn__)) usage(void)
+ 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
+ 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
+ 
++	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
++
+ 	fputs(USAGE_SEPARATOR, out);
+ 	fprintf(out, USAGE_HELP_OPTIONS(26));
+ 
+@@ -2751,6 +2753,7 @@ int main(int argc, char *argv[])
+ 	const char *diskpath = NULL, *lockmode = NULL;
+ 	int rc, c, colormode = UL_COLORMODE_UNDEF;
+ 	int read_only = 0;
++	size_t user_ss = 0;
+ 	struct cfdisk _cf = { .lines_idx = 0 },
+ 		      *cf = &_cf;
+ 	enum {
+@@ -2760,6 +2763,7 @@ int main(int argc, char *argv[])
+ 		{ "color",   optional_argument, NULL, 'L' },
+ 		{ "lock",    optional_argument, NULL, OPT_LOCK },
+ 		{ "help",    no_argument,       NULL, 'h' },
++		{ "sector-size", required_argument, NULL, 'b' },
+ 		{ "version", no_argument,       NULL, 'V' },
+ 		{ "zero",    no_argument,	NULL, 'z' },
+ 		{ "read-only", no_argument,     NULL, 'r' },
+@@ -2771,8 +2775,15 @@ int main(int argc, char *argv[])
+ 	textdomain(PACKAGE);
+ 	close_stdout_atexit();
+ 
+-	while((c = getopt_long(argc, argv, "L::hVzr", longopts, NULL)) != -1) {
++	while((c = getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) != -1) {
+ 		switch(c) {
++		case 'b':
++			user_ss = strtou32_or_err(optarg,
++					_("invalid sector size argument"));
++			if (user_ss != 512 && user_ss != 1024 &&
++			    user_ss != 2048 && user_ss != 4096)
++				errx(EXIT_FAILURE, _("invalid sector size argument"));
++			break;
+ 		case 'h':
+ 			usage();
+ 			break;
+@@ -2811,6 +2822,8 @@ int main(int argc, char *argv[])
+ 	cf->cxt = fdisk_new_context();
+ 	if (!cf->cxt)
+ 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
++	if (user_ss)
++		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
+ 
+ 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch b/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
new file mode 100644
index 0000000000..8d47d8de71
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0002-sfdisk-add-sector-size-commanand-line-option.patch
@@ -0,0 +1,105 @@
+From 96570c03f46e0a5c17e721737a38c717c67e358b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 14 Oct 2024 15:50:40 +0200
+Subject: [PATCH 2/2] sfdisk: add --sector-size commanand line option
+
+* improves compatibility with fdisk
+* add ability to work with disk images where libfdisk defaults to 512
+
+Addresses: https://github.com/util-linux/util-linux/pull/3235
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+Upstream-Status: Backport [ef7b76baa17ddb5414691fa8f49d61415c30871c]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ disk-utils/sfdisk.8.adoc |  5 ++++-
+ disk-utils/sfdisk.c      | 14 ++++++++++++++
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
+index bc3ff9bb8..d1eaa3712 100644
+--- a/disk-utils/sfdisk.8.adoc
++++ b/disk-utils/sfdisk.8.adoc
+@@ -201,6 +201,9 @@ The default list of columns may be extended if _list_ is specified in the format
+ *-q*, *--quiet*::
+ Suppress extra info messages.
+ 
++*--sector-size* _sectorsize_::
++Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
++
+ *-u*, *--unit S*::
+ Deprecated option. Only the sector unit is supported. This option is not supported when using the *--show-size* command.
+ 
+@@ -249,7 +252,7 @@ Specify the maximal number of GPT partitions.
+ *grain*::
+ Specify minimal size in bytes used to calculate partitions alignment. The default is 1MiB and it's strongly recommended to use the default. Do not modify this variable if you're not sure.
+ *sector-size*::
+-Specify sector size. *sfdisk* always uses device sector size. Since version 2.39 *sfdisk* recalculates sizes from dump if the script and device sector size differ.
++Specifies the sector size used in the input. *sfdisk* always internally uses the device sector size provided by the kernel for the block device, or as specified by the user on the command line (see *--sector-size*). Starting with version 2.39, *sfdisk* recalculates sizes from the input if the *sector-size* header and device sector size are different.
+ 
+ Note that it is only possible to use header lines before the first partition is specified in the input.
+ 
+diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
+index d8dd8d296..97d426559 100644
+--- a/disk-utils/sfdisk.c
++++ b/disk-utils/sfdisk.c
+@@ -2084,6 +2084,8 @@ static void __attribute__((__noreturn__)) usage(void)
+ 	      _("     --color[=<when>]      colorize output (%s, %s or %s)\n"), "auto", "always", "never");
+ 	fprintf(out,
+ 	        "                             %s\n", USAGE_COLORS_DEFAULT);
++	fputs(_("     --sector-size <size>  physical and logical sector size\n"), out);
++
+ 	fprintf(out,
+ 	      _("     --lock[=<mode>]       use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
+ 	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
+@@ -2120,6 +2122,7 @@ int main(int argc, char *argv[])
+ 	const char *outarg = NULL;
+ 	int rc = -EINVAL, c, longidx = -1, bytes = 0;
+ 	int colormode = UL_COLORMODE_UNDEF;
++	size_t user_ss = 0;
+ 	struct sfdisk _sf = {
+ 		.partno = -1,
+ 		.wipemode = WIPEMODE_AUTO,
+@@ -2145,6 +2148,7 @@ int main(int argc, char *argv[])
+ 		OPT_NOTELL,
+ 		OPT_RELOCATE,
+ 		OPT_LOCK,
++		OPT_SECTORSIZE
+ 	};
+ 
+ 	static const struct option longopts[] = {
+@@ -2174,6 +2178,7 @@ int main(int argc, char *argv[])
+ 		{ "output",  required_argument, NULL, 'o' },
+ 		{ "partno",  required_argument, NULL, 'N' },
+ 		{ "reorder", no_argument,       NULL, 'r' },
++		{ "sector-size", required_argument, NULL, OPT_SECTORSIZE },
+ 		{ "show-geometry", no_argument, NULL, 'g' },
+ 		{ "quiet",   no_argument,       NULL, 'q' },
+ 		{ "verify",  no_argument,       NULL, 'V' },
+@@ -2373,6 +2378,13 @@ int main(int argc, char *argv[])
+ 				sf->lockmode = optarg;
+ 			}
+ 			break;
++		case OPT_SECTORSIZE:
++			user_ss = strtou32_or_err(optarg,
++					_("invalid sector size argument"));
++			if (user_ss != 512 && user_ss != 1024 &&
++			    user_ss != 2048 && user_ss != 4096)
++				errx(EXIT_FAILURE, _("invalid sector size argument"));
++			break;
+ 		default:
+ 			errtryhelp(EXIT_FAILURE);
+ 		}
+@@ -2383,6 +2395,8 @@ int main(int argc, char *argv[])
+ 	sfdisk_init(sf);
+ 	if (bytes)
+ 		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
++	if (user_ss)
++		fdisk_save_user_sector_size(sf->cxt, user_ss, user_ss);
+ 
+ 	if (outarg)
+ 		init_fields(NULL, outarg, NULL);
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch b/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
deleted file mode 100644
index 356194a8ba..0000000000
--- a/meta/recipes-core/util-linux/util-linux/libfdisk-cfdisk-and-sfdisk-sector-size-improvements.patch
+++ /dev/null
@@ -1,252 +0,0 @@
-From 7ada6547fcd1f649fadaa8021ff21e3e0f431459 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 11:45:32 +0200
-Subject: [PATCH 1/4] libfdisk: make sure libblkid uses the same sector size
-
-Libfdisk uses libblkid to check for filesystems on the device. It
-makes sense for both libraries to share the logical sector size
-setting, as this setting can be modified by using the fdisk command
-line.
-
-We do not see this as an issue, as filesystem detection rarely depends
-on sector size (with the exception of some RAIDs). Additionally,
-libblkid is usually intelligent enough to check multiple locations
-independently of the current device's sector size setting.
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3237]
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- libfdisk/src/wipe.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/libfdisk/src/wipe.c b/libfdisk/src/wipe.c
-index bb5f1bb38bf..f389ed4194a 100644
---- a/libfdisk/src/wipe.c
-+++ b/libfdisk/src/wipe.c
-@@ -133,6 +133,7 @@ int fdisk_do_wipe(struct fdisk_context *cxt)
- 			DBG(WIPE, ul_debugobj(wp, "blkid_probe_set_device() failed [rc=%d]", rc));
- 			return rc;
- 		}
-+		blkid_probe_set_sectorsize(pr, cxt->sector_size);
- 
- 		DBG(WIPE, ul_debugobj(wp, " wiping..."));
- 		blkid_wipe_all(pr);
-@@ -176,6 +177,8 @@ int fdisk_check_collisions(struct fdisk_context *cxt)
- 	free(cxt->collision);
- 	cxt->collision = NULL;
- 
-+	blkid_probe_set_sectorsize(pr, cxt->sector_size);
-+
- 	blkid_probe_enable_superblocks(pr, 1);
- 	blkid_probe_set_superblocks_flags(pr, BLKID_SUBLKS_TYPE |
- 			                      BLKID_SUBLKS_BADCSUM);
-
-From 54f9a79301dcf492cab8e07134f96a921d367aa0 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:47:03 +0200
-Subject: [PATCH 2/4] fdisk: (man) improve --sector-size description
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/fdisk.8.adoc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/disk-utils/fdisk.8.adoc b/disk-utils/fdisk.8.adoc
-index cb72b4a3ea5..5941aa34968 100644
---- a/disk-utils/fdisk.8.adoc
-+++ b/disk-utils/fdisk.8.adoc
-@@ -40,7 +40,7 @@ Note that *partx*(8) provides a rich interface for scripts to print disk layouts
- == OPTIONS
- 
- *-b*, *--sector-size* _sectorsize_::
--Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. (Recent kernels know the sector size. Use this option only on old kernels or to override the kernel's ideas.) Since util-linux-2.17, *fdisk* differentiates between logical and physical sector size. This option changes both sector sizes to _sectorsize_.
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
- 
- *-B*, *--protect-boot*::
- Don't erase the beginning of the first disk sector when creating a new disk label. This feature is supported for GPT and MBR.
-
-From fd38ee2274f7a30393d3839dfce556260355c3fa Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:48:46 +0200
-Subject: [PATCH 3/4] cfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/cfdisk.8.adoc |  3 +++
- disk-utils/cfdisk.c      | 15 ++++++++++++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/cfdisk.8.adoc b/disk-utils/cfdisk.8.adoc
-index 97fad621d12..759f39f0e1a 100644
---- a/disk-utils/cfdisk.8.adoc
-+++ b/disk-utils/cfdisk.8.adoc
-@@ -55,6 +55,9 @@ Use exclusive BSD lock for device or file it operates. The optional argument _mo
- *-r*, *--read-only*::
- Forced open in read-only mode.
- 
-+*-b*, *--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-z*, *--zero*::
- Start with an in-memory zeroed partition table. This option does not zero the partition table on the disk; rather, it simply starts the program without reading the existing partition table. This option allows you to create a new partition table from scratch or from an *sfdisk*(8)-compatible script.
- 
-diff --git a/disk-utils/cfdisk.c b/disk-utils/cfdisk.c
-index 2e0aada474a..bc1c87d83e4 100644
---- a/disk-utils/cfdisk.c
-+++ b/disk-utils/cfdisk.c
-@@ -2731,6 +2731,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --lock[=<mode>]      use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -r, --read-only          forced open cfdisk in read-only mode\n"), out);
- 
-+	fputs(_(" -b, --sector-size <size> physical and logical sector size\n"), out);
-+
- 	fputs(USAGE_SEPARATOR, out);
- 	fprintf(out, USAGE_HELP_OPTIONS(26));
- 
-@@ -2743,6 +2745,7 @@ int main(int argc, char *argv[])
- 	const char *diskpath = NULL, *lockmode = NULL;
- 	int rc, c, colormode = UL_COLORMODE_UNDEF;
- 	int read_only = 0;
-+	size_t user_ss = 0;
- 	struct cfdisk _cf = { .lines_idx = 0 },
- 		      *cf = &_cf;
- 	enum {
-@@ -2752,6 +2755,7 @@ int main(int argc, char *argv[])
- 		{ "color",   optional_argument, NULL, 'L' },
- 		{ "lock",    optional_argument, NULL, OPT_LOCK },
- 		{ "help",    no_argument,       NULL, 'h' },
-+		{ "sector-size", required_argument, NULL, 'b' },
- 		{ "version", no_argument,       NULL, 'V' },
- 		{ "zero",    no_argument,	NULL, 'z' },
- 		{ "read-only", no_argument,     NULL, 'r' },
-@@ -2763,8 +2767,15 @@ int main(int argc, char *argv[])
- 	textdomain(PACKAGE);
- 	close_stdout_atexit();
- 
--	while((c = getopt_long(argc, argv, "L::hVzr", longopts, NULL)) != -1) {
-+	while((c = getopt_long(argc, argv, "b:L::hVzr", longopts, NULL)) != -1) {
- 		switch(c) {
-+		case 'b':
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		case 'h':
- 			usage();
- 			break;
-@@ -2803,6 +2814,8 @@ int main(int argc, char *argv[])
- 	cf->cxt = fdisk_new_context();
- 	if (!cf->cxt)
- 		err(EXIT_FAILURE, _("failed to allocate libfdisk context"));
-+	if (user_ss)
-+		fdisk_save_user_sector_size(cf->cxt, user_ss, user_ss);
- 
- 	fdisk_set_ask(cf->cxt, ask_callback, (void *) cf);
- 
-
-From ef7b76baa17ddb5414691fa8f49d61415c30871c Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Mon, 14 Oct 2024 15:50:40 +0200
-Subject: [PATCH 4/4] sfdisk: add --sector-size commanand line option
-
-* improves compatibility with fdisk
-* add ability to work with disk images where libfdisk defaults to 512
-
-Addresses: https://github.com/util-linux/util-linux/pull/3235
-Signed-off-by: Karel Zak <kzak@redhat.com>
----
- disk-utils/sfdisk.8.adoc |  5 ++++-
- disk-utils/sfdisk.c      | 14 ++++++++++++++
- 2 files changed, 18 insertions(+), 1 deletion(-)
-
-diff --git a/disk-utils/sfdisk.8.adoc b/disk-utils/sfdisk.8.adoc
-index 26ccad5a3b2..ce9e97b7682 100644
---- a/disk-utils/sfdisk.8.adoc
-+++ b/disk-utils/sfdisk.8.adoc
-@@ -208,6 +208,9 @@ The default list of columns may be extended if _list_ is specified in the format
- *-q*, *--quiet*::
- Suppress extra info messages.
- 
-+*--sector-size* _sectorsize_::
-+Specify the sector size of the disk. Valid values are 512, 1024, 2048, and 4096. The kernel is aware of the sector size for regular block devices. Use this option only on very old kernels, when working with disk images, or to override the kernel's default sector size. Since util-linux-2.17, *fdisk* distinguishes between logical and physical sector size. This option changes both sector sizes to the specified _sectorsize_.
-+
- *-u*, *--unit S*::
- Deprecated option. Only the sector unit is supported. This option is not supported when using the *--show-size* command.
- 
-@@ -256,7 +259,7 @@ Specify the maximal number of GPT partitions.
- *grain*::
- Specify minimal size in bytes used to calculate partitions alignment. The default is 1MiB and it's strongly recommended to use the default. Do not modify this variable if you're not sure.
- *sector-size*::
--Specify sector size. *sfdisk* always uses device sector size. Since version 2.39 *sfdisk* recalculates sizes from dump if the script and device sector size differ.
-+Specifies the sector size used in the input. *sfdisk* always internally uses the device sector size provided by the kernel for the block device, or as specified by the user on the command line (see *--sector-size*). Starting with version 2.39, *sfdisk* recalculates sizes from the input if the *sector-size* header and device sector size are different.
- 
- Note that it is only possible to use header lines before the first partition is specified in the input.
- 
-diff --git a/disk-utils/sfdisk.c b/disk-utils/sfdisk.c
-index cf402007b51..5e7c1d926e4 100644
---- a/disk-utils/sfdisk.c
-+++ b/disk-utils/sfdisk.c
-@@ -2155,6 +2155,8 @@ static void __attribute__((__noreturn__)) usage(void)
- 	      _("     --color[=<when>]      colorize output (%s, %s or %s)\n"), "auto", "always", "never");
- 	fprintf(out,
- 	        "                             %s\n", USAGE_COLORS_DEFAULT);
-+	fputs(_("     --sector-size <size>  physical and logical sector size\n"), out);
-+
- 	fprintf(out,
- 	      _("     --lock[=<mode>]       use exclusive device lock (%s, %s or %s)\n"), "yes", "no", "nonblock");
- 	fputs(_(" -N, --partno <num>        specify partition number\n"), out);
-@@ -2191,6 +2193,7 @@ int main(int argc, char *argv[])
- 	const char *outarg = NULL;
- 	int rc = -EINVAL, c, longidx = -1, bytes = 0;
- 	int colormode = UL_COLORMODE_UNDEF;
-+	size_t user_ss = 0;
- 	struct sfdisk _sf = {
- 		.partno = -1,
- 		.wipemode = WIPEMODE_AUTO,
-@@ -2217,6 +2220,7 @@ int main(int argc, char *argv[])
- 		OPT_NOTELL,
- 		OPT_RELOCATE,
- 		OPT_LOCK,
-+		OPT_SECTORSIZE
- 	};
- 
- 	static const struct option longopts[] = {
-@@ -2246,6 +2250,7 @@ int main(int argc, char *argv[])
- 		{ "output",  required_argument, NULL, 'o' },
- 		{ "partno",  required_argument, NULL, 'N' },
- 		{ "reorder", no_argument,       NULL, 'r' },
-+		{ "sector-size", required_argument, NULL, OPT_SECTORSIZE },
- 		{ "show-geometry", no_argument, NULL, 'g' },
- 		{ "quiet",   no_argument,       NULL, 'q' },
- 		{ "verify",  no_argument,       NULL, 'V' },
-@@ -2450,6 +2455,13 @@ int main(int argc, char *argv[])
- 				sf->lockmode = optarg;
- 			}
- 			break;
-+		case OPT_SECTORSIZE:
-+			user_ss = strtou32_or_err(optarg,
-+					_("invalid sector size argument"));
-+			if (user_ss != 512 && user_ss != 1024 &&
-+			    user_ss != 2048 && user_ss != 4096)
-+				errx(EXIT_FAILURE, _("invalid sector size argument"));
-+			break;
- 		default:
- 			errtryhelp(EXIT_FAILURE);
- 		}
-@@ -2460,6 +2472,8 @@ int main(int argc, char *argv[])
- 	sfdisk_init(sf);
- 	if (bytes)
- 		fdisk_set_size_unit(sf->cxt, FDISK_SIZEUNIT_BYTES);
-+	if (user_ss)
-+		fdisk_save_user_sector_size(sf->cxt, user_ss, user_ss);
- 
- 	if (outarg)
- 		init_fields(NULL, outarg, NULL);
diff --git a/meta/recipes-core/util-linux/util-linux_2.40.2.bb b/meta/recipes-core/util-linux/util-linux_2.40.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.40.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.40.4.bb
-- 
2.25.1


