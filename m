Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15F8CD6E5D
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 03:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11934.1780456174926951315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 20:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bWvPq9y3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0614d64c3e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6532fgNl3203412
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 20:09:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=B1ltZy7Y50jpg+IyBQxe
	DwsOj2gXTnIX6S2zv4TyuB0=; b=bWvPq9y3ZgJMDjbHcO9HHu6n84eNwaADUwOo
	95O33AFpSSSFKhj8beE44N5xDATZQX+skFSBl3SILQ4wLE74wVlFcSnDR6s7Pgz+
	4878gm8lvD0p6Igc5iMjZn6C+ZGePejaaye2iwyslEJw/e0DpHIfN0sAHA2grVx4
	KUd6H5F/d8MJyjg0AWJrXDW5EZ0/2r4ARER6Vtp9A8RYsLxtQUQENlYQyzmqvdq9
	pGiGpOtlxZLhg5OeH4TF/OTocLsCPETCsV8Q8TyVSzJKoQk5/hSZpMObgStHvAfh
	S1tNRoaSe1qJRKjJ4GQxEr7NFpanCty+8WRNjYPH6eCg9aNEpw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydedmg4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 20:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0NqF4DsXXplv14LCHf/p+RZka2AAKXKmg989YvfKA7D45kL8kHve6db9oeBmAYIXA0kzH2FbF+PZ8XxO2FW6UznjA1sT80WUNkzeNEeUV8fDTl6l3yJNOFKD5DbyH4cfSUXNtP2WJ7x3KXlLGgm0yjzV681R8GMRzLYA6N+ehG6klxKEeE21Zoqtl2ukjFThwJMraCcnwx3YzndTGBIsr5jZIblrr9MyC4vHAlM49F+4r6RXaiLnFFMq2O/IWluGe578CZ+Z7eqcqZo1lDAGGfm14GL/7D4MOpQRr/fCKnZ1yWIvDcM5iFLDkIQug7BEEqXerEmXpKtawNfXPbBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1ltZy7Y50jpg+IyBQxeDwsOj2gXTnIX6S2zv4TyuB0=;
 b=gOi2n9FgIHI3+yQB6TX4cZzY5qKr6YxjIEg6TlefrmeERsmYvuFxJf7CC0/AlpaF8tqAbj17xhspCeInbkx9In/tOF9pHzYxAIfeAmrzv1UMNLgW21ftsJKJgg/5nYOBvsXhYo/9Jqf3+GfV+S8u0lUwWNKLFRDVSrEGK17LpMF5SUnc/w8ANvCUSCtoJfOncyVGV8fl8/1Gy2cXVfmePF54eXwpb+egSuO2apr2SNis0O2ReXYLHQKiBypTga0vwx3yb6ftGaaw2Qi9qPDt+6fs4KXgaulVNcyKIGxyCjwhYCOAsFJfiQmnrFAIO3RqzswPBWtoPPpxXgvbCm4iIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 03:09:28 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 03:09:28 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] diffstat: upgrade 1.68 -> 1.69
Date: Wed,  3 Jun 2026 11:09:11 +0800
Message-Id: <20260603030911.3769426-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To CH3PR11MB7297.namprd11.prod.outlook.com
 (2603:10b6:610:140::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 265fcbb2-c146-47d8-3807-08dec11d858a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|12006099003|18002099003|6133799003|38350700014|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 
	SP6J1lDyualEdKxllHhmbn4m0J+XBRzEvy4nksSTjkZ98QN1YNMckQryPqTSL0gFvT49AkUQghu9E2YY4FU6chjXXC9xstezA65BxnKsSPochOHlMj/ntPxt553zWJggEvb7bbmUUTmM51Q/Arqr1n3sx8JAos9qmQRH2ENMod4eu1b1vHKOVNKTSY4vnVkP9uPTkwt2DZvzeWNy2xapdFaE6h8zgij3cUTODmyqQJ5ZJFzvykUM8BIbWusVzBxfjqquYughg9RoKtCw9mLc+GFNVOWycwloWJoMMSPZqPd8phulndUMOHuh1w/ogH5I3YlfG1obO0xL6C1kFBE6VsoFhoyznzXqIwYA+I0YLimTTIMy08nIbkzXVmzvesAl+iJ5FOAQPwfe6DOI6CNfpSnOh8ym80efKMlZNHlE9uUTRFlDbTySomaSNjFTinyXjP1HJedEXlg8vGGOq4smb3oY6kLAKpidVulBsbJ01zZ3UVCzgVtjnHUYBEnixojg76BnhSAIhCR27lMu2t55d7MsQbtPGVhEk/3QwuEgwbP9J0oEz/AQ0mZMbJ7QXUEhjn5r7HUsbZE3KGDl9OfsTwe6v7dAkptOUuiegYkqOKrMX5NU54xHr75EeawFAWIREsVpXYSOI6rDkXGk7N6F08n7gcy62fhNdagJPS+zThrjq74Xp6I4kHWOvhFsi/0Zq8bC+fUnqHj5FTpnzVLIfhsHoTPvYufbgmUKoB8wNN/g785UZ1n7hb6o4dcMK6wS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(12006099003)(18002099003)(6133799003)(38350700014)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?asE0s34ksm1pAnk2K2ljAGA5EOtxruVZIkn0PaOu6+naolFQLpcg/Flr+5ZC?=
 =?us-ascii?Q?fJBUSj+cJ3jZAQWv+qBeSzqOyZGcAzCCQo2E3CWfsk6uDrZUxR7zNQ4+zQTI?=
 =?us-ascii?Q?w/5Xv5F49fM56H6rvEzs8RhcJttJhMK3I3udAckOi4+7KEMmGkY6OecsLvS4?=
 =?us-ascii?Q?4t7XQkMY8XC/IgFHJBmuKQqVSK+nYkYuCN60tovkhA08ksVOs455FaXcyMA7?=
 =?us-ascii?Q?fHQK+YpsdYwNuujb3pvSwzd1B2cPnLtPE6BVgVosFGuDivZyyOobTvAGzhsX?=
 =?us-ascii?Q?bqhtIP152ZYwhA3R3JbrXKRxs5m8RROmLHm55eesgZYTJRhwUg7i0C63LtIq?=
 =?us-ascii?Q?6CPUulHhIVxgX+QWXsf0fJtLFIsN6/KaTZBCvyCJxhClnxZR307A5uV5ZagD?=
 =?us-ascii?Q?ep15EmZa9fVL7kDQfAzBq5Cai2pMLRgjN78nAS/OT/vvRoSddAS7nPh/CPAd?=
 =?us-ascii?Q?MjGKiiCMOZ6F5ds/KPJSk3twUbp8M/JoyoOGJkRw9iclqjn0c6jq1S+5cYbo?=
 =?us-ascii?Q?jm45PTygVCgae9TkNWDW5MGXCQurj7tp4aeIUhLE6QJQXsnAGCr6fsMAOaLb?=
 =?us-ascii?Q?bWElCWhovAW3lUIp0gu1/CDHuoqgBT+TgwmgV8d4yEvUMCp4E3jkqhf+XAPC?=
 =?us-ascii?Q?NBr/Rs7o/W1bO7KObNl+6ySW5OuSdLwOjjTa2QTnyswrehyjKHSR5zT/c37z?=
 =?us-ascii?Q?CmdSHLB+GRmx5PoDOv2fjz1QMnoV33tB1e3QAM+58nLS7PIAYdFX9r4G5l19?=
 =?us-ascii?Q?oJ7H6Xl6BWV38HZm3akd4vR/FwfI7w5Ue0i+v2IVCUClaL6A5Any7VliXh+j?=
 =?us-ascii?Q?Rf/QT+hc5KgvApB8EHrpLqyr5350gnarKUizppPMY6EAY+GQLNlwCEvzgIi9?=
 =?us-ascii?Q?Pizv6ZrWwqf1ETZeyc+JXfaFM5rflT5hQwS7pdxLB/STezoyZxeENlF5MFdL?=
 =?us-ascii?Q?Vki0qBxEY9r2dHlnHDTIOqtLngb3JLlbMzzj2m7ls+voY7beVwrpjoRMmw4X?=
 =?us-ascii?Q?1+uk4PAtdZDWjBnbOjM3Ixv/Zld7PRmxueDx6xhcC82uwukYEBiWbGH14wVp?=
 =?us-ascii?Q?ZQlQcoJYnihHOnsWbMPjnAzFgd0qB4z+VJxXJz8S0hhwZIE+t4RhLiZr7Hy0?=
 =?us-ascii?Q?I8HV3JPmcLfcuIzwa6xVSzqAsKeodfFBLt7qAH59vZM6smnanDhLhoXBENR2?=
 =?us-ascii?Q?r+AGjU3h189GHNl8LYsehZ5IaGpzdxRSK7Kmj5UoiernEQUs0yD5JaftF/eR?=
 =?us-ascii?Q?wCCjDa6A/IgeCml3fxdyRSpJHZxs9N0Gk2bvDmHjbx6XUpBjFyihZsWivnu+?=
 =?us-ascii?Q?D2bKaWkEUGMME21cR3oRbtwppjhk4CEl51HnwD44AtnDTvEjmGb0YMz2wYz6?=
 =?us-ascii?Q?jixQeQ4CMOoC3xsvtSLGUb7TFbQBmOLr8vpROdkYnefTZNnsHRVrw3uzk+Ly?=
 =?us-ascii?Q?/6LXq4Z8uH1LwpcU5fSQ/CRaN8x91H/07/hl5tRLjr5Iu8SDb23rtL/yZC8P?=
 =?us-ascii?Q?jpwdX0iulCOnUPD8gp+Wkrp8W733aEs/tgJVB1IhELM1HtZsML0uPiRN3Ykb?=
 =?us-ascii?Q?ic6HoijLeaC8zi0Vr601vunqH5u6IFX6dXP9NaqO6egcSb0o7D1wAwW1zV9B?=
 =?us-ascii?Q?LZBlE4tMex3m1hWBIJA96VHcjGQvb6s9toYdsDC6LHFFGh2OLH9NfVgpeBvJ?=
 =?us-ascii?Q?QZLaLljnP5BnqzuU8bsQKcZXqg282vWWaY4HlmBpu94BMr7iJavN4G7UMrA5?=
 =?us-ascii?Q?27zuVzzzO+q20Pfpt6tYb1XacS3ElAQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	Hm0HeIAQ2jMQOW87NegaG2MZPmgFeS90oWt3wBptqDY8A5dpd1/Dfk5PmmDrjeLvROcVfPl6S/cbHSKwAed/RdMYKUtUfduggPV7D3E4pyO6VlOW6ClItsI8R4uCq/2tqEMWEjdHrxG/XuSwgw250j8vIcJJDVrgctxtisJTPNrRapSFuUJ1BZByHqc7U6oDMGmPOSQkUIXAhJGaHm+5J+aZFKSIKaaGBkVOjwSgrXfoTy+rfcHApEfqGl7VJYhQ02x9w+E2HGTeWymzUgCOM7iBqby97DLLDEqInCVMxmGzbfeloekYsLMqFArMHBwc6RVTlTldowAW7eu51jhacA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265fcbb2-c146-47d8-3807-08dec11d858a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7297.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 03:09:28.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfyJrwJ7JWX7KjZUZ8BAW7HiutAENwW5+jq9PLu4DE68SviR3mMtUuSnmtE9XKn8yLn5Xf/iBkgIU3LWekF0zvGqHhix6D6yr/iqYelo0xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAyNiBTYWx0ZWRfX7/Ij8OwdAUnf
 N9cmYGGM2Z5c7XVsYds1fO4DOs285y7fByVs4Rft1BP6AP3OOIFG3y9ca6l8crJQ8atOjWUQke/
 PqZbR9Gg/Pn4wq1BmhscSqPIzjYZqJMcaHNBJaLfGQk/2jQVPLzWH25KvQkRRo9qM1foz/U9h5A
 TWwzv27IUJyfECXwM/wkCXBOfn1EZR6V2hGJwjJdDZVEi29YCdPEf2qECdtBpiTzqTlaCFtmGod
 xwjFOVoEWIg59Cxf2LR3z37+I1AAue/udPT2pYeZbj/Ovit7MSrAwXsVnCRMYBghaWRIoM2tW+R
 zegowcPGc666unA5jwdyHBg6dMWzCuPQVzjkv+Q4nqMHrYPIOPC3I8JkpX9hRnY12CBk++7+O6n
 Kpiff/MzaPpSkYYBQj8oA/OMXO6CElMiJPEx/YjEhd5qPSoKRy7fvHdm2BYj6KctP56LqOjfpJF
 6/G9ofXtHNd7PQtpYFQ==
X-Proofpoint-GUID: rK8-UZJ3DlDsvLgjL_VhBGeMMmWAbH8M
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1f9aee cx=c_pps
 a=pqTWcw9xC4/AVWcamW/T+Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=HiWkEfo4AAAA:8
 a=goT8vtq0AAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=397ZLNWtmpZ8UzWt5EMA:9
 a=_QplDg0m8TGAdENQf2wZ:22 a=R2Ji3J8RlHp2PMwqXl91:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: rK8-UZJ3DlDsvLgjL_VhBGeMMmWAbH8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 03:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238076

License-Update:  Lincense Year update

refresg standard-autoconf.patch based on 1.69

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../diffstat/diffstat/standard-autoconf.patch | 41 ++++++++++++++-----
 .../{diffstat_1.68.bb => diffstat_1.69.bb}    |  4 +-
 2 files changed, 32 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.68.bb => diffstat_1.69.bb} (81%)

diff --git a/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch b/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
index b301c2d86d..4b80fb205d 100644
--- a/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/standard-autoconf.patch
@@ -1,4 +1,4 @@
-From 0069056a23b39f53a05b89b2545a3a5ad1ff070a Mon Sep 17 00:00:00 2001
+From 841f8f26b5b10fee4fed86ddb8bb97d36b118610 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 18 Mar 2026 11:27:24 +0000
 Subject: [PATCH] Use standard autoconf
@@ -11,11 +11,16 @@ form of AC_OUTPUT.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+Refresh for version 1.69
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- config_h.in  | 8 --------
- configure.in | 2 +-
- 2 files changed, 1 insertion(+), 9 deletions(-)
+ config_h.in      | 8 --------
+ configure.in     | 1 -
+ configure.in.rej | 9 +++++++++
+ 3 files changed, 9 insertions(+), 9 deletions(-)
  delete mode 100644 config_h.in
+ create mode 100644 configure.in.rej
 
 diff --git a/config_h.in b/config_h.in
 deleted file mode 100644
@@ -32,17 +37,31 @@ index ac8ff1d..0000000
 -
 -@DEFS@
 diff --git a/configure.in b/configure.in
-index cb641d4..7042800 100644
+index 24dfbb9..5da5d89 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -83,5 +83,6 @@ CF_WITH_MAN2HTML
- CF_DISABLE_LEAKS
+@@ -85,6 +85,5 @@ CF_DISABLE_LEAKS
  
  ###	output makefile and config.h
--AC_OUTPUT(makefile,,,cat)
-+AC_CONFIG_FILES([makefile])
-+AC_OUTPUT
+ AC_CONFIG_FILES([makefile])
+-AC_SETUP_DEFS([cat])
+ AC_OUTPUT
  CF_MAKE_DOCS(diffstat,1)
+diff --git a/configure.in.rej b/configure.in.rej
+new file mode 100644
+index 0000000..2c917a4
+--- /dev/null
++++ b/configure.in.rej
+@@ -0,0 +1,9 @@
++diff a/configure.in b/configure.in	(rejected hunks)
++@@ -83,5 +83,6 @@ CF_WITH_MAN2HTML
++ CF_DISABLE_LEAKS
++ 
++ ###	output makefile and config.h
++-AC_OUTPUT(makefile,,,cat)
+++AC_CONFIG_FILES([makefile])
+++AC_OUTPUT
++ CF_MAKE_DOCS(diffstat,1)
 -- 
-2.43.0
+2.34.1
 
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.68.bb b/meta/recipes-devtools/diffstat/diffstat_1.69.bb
similarity index 81%
rename from meta/recipes-devtools/diffstat/diffstat_1.68.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.69.bb
index ce1ba79c2d..0c62537e8c 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.68.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.69.bb
@@ -5,7 +5,7 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "X11"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c432d3aeb935855b2ca1ad2a0542ce4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=53d95e97e08db153daa45bfe4e4be37e"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -13,7 +13,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://avoid-check-user-break-cc.patch \
            "
 
-SRC_URI[sha256sum] = "89f9294a8ac74fcef6f1b9ac408f43ebedf8d208e3efe0b99b4acc16dc6582c7"
+SRC_URI[sha256sum] = "bb02464072f769dd9832fd999526734c90eb4d66fb56d5351540a750c88a77f6"
 
 inherit autotools gettext ptest
 
-- 
2.34.1


