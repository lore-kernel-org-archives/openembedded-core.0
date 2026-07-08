Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AB2C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 18:58:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16050.1783537089752783443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 11:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=l39O4udY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1649b348d9=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668IK2lh527173
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Jul 2026 11:58:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=KJI4Dq9XvYYiiMUE5HsU7IMzcwzvuFedxi0sI8vkUOU=; b=
	l39O4udYQXCK2GJ8kbeHj4jRQv6Y5fZI4UYXcHwVFyRxPyLepCIKFSK5sM6ofpyj
	3cHz6oDi3zpbg0aGM6ssrtVYO/PqDkP5f6U5cnGmclowqAJW2B/6lU0VjX0HLsNO
	UglauO1j2/uYCb/wZnaYGKyooBhKijsUJfe3nGFIwKnw4XaH7fbzs+3Z8KM+I89d
	oBK7Sr7oKpzVNqKgKKlcYE6fC9DD4c6XqmVp/uZghP1Pgo5cXxRKpQ13wMViL979
	PWsnLhd05uwShl4vVvM3dxzDObntFHlGp89dvRVTRi6NdJZLFYqpl85x60/DHdDP
	i1ort6nUNmDfq/qtZFf62Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f71pe6hk7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 11:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3s+dog4u2vRKjCwJIxzGLsMMQmcwyvVGDM8t8vT5nl/shlhamONiuXzZLPZ3SjU4R9T9rhvnXZT36lH2EPeawz1UT/kA3Yx04cs4Uh5oSnFMRh55ETWYXLfMpVu4nDdxpVJxK7ThDLV/7Cuc5aKVbYd6Rx6EU0czMhurO1FFPR5yCO8gjblyMxNOCowdp8f0psdB2ZS6qE2zNK4RJhTbKh43ExuydKjHNsck8R+r4LvqDI2BXwSDA5ELrOaD14gpCtZQXrMjyRJ5MJUnA3h8sswKEZ69ZHHGnUGkeW6zIlTEpN2SkneU6pBlczXJkVTIKGQKvxMHmCaUuC39Foe+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJI4Dq9XvYYiiMUE5HsU7IMzcwzvuFedxi0sI8vkUOU=;
 b=baig76W5AV9TC+1dCxVYQnSOyG54Q4Qfosdki4wau8T6l7eC6irxJztCAH3wnTwMPSq0R0TV5ohvzodmInl6XLPJkzhx63hWBFEG9ycy608InLft70ighMfzYmZqginBBQjqp4Zh5iEVeIb4VXi8q0NZ2PiWi7EgFbMya9HaX4823n6gjs2XGIUYUaR6fa9BGakcqp0uqIGg+gjOiVqkeTxxMs7rD52AIPgJTRkgd+5jGvtFnEtz2EnDPWOsvTd3uTbYXUNffJ8vjQkpRXJFxAzS0GmKI3kjoY7nBmVkrLJF+WU8+7FTIzhSuuJqYG4IeCYKxmNLWxPYh6dCZbbYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 18:58:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 18:58:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        raj.khem@gmail.com
Subject: [PATCH v3 4/4] kernel-yocto: Set CLANG_FLAGS for kernel config checks when using clang
Date: Wed,  8 Jul 2026 11:57:24 -0700
Message-ID: <20260708185724.2183159-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
References: <20260708185724.2183159-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 6722ffe4-256c-4ee6-00cb-08dedd22d812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|38350700014|6133799003|11063799006|3023799007|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TUvrPrT9ACPFsW7ug2lzr3fzg8U+AzTeDkUnMuobd3TkaJwYLZPXaOMsyc9IA33YIY+Nng8rix0Yi6kKEwr6bm/xQ1T6MbZdCeiY+ByMp34uJUGHT14Fq3UPOrjVEnnBLDZka6XcfFijNKR0XmupWj0iqZ/ZSri1Ja/nO4LncKP6hlGdPkkIi318uJACyPmh2xkNzrxdj8DvBUEkn/BCnM2s3T/13Ai90FjY7xjoLlGv0BD+alneNVL0pq5TAfgPj1Sx8h3oBFR5aLhfc0J1uXFambzJZ9vm5w9Wqj4SrGPO19zdcPYrSyYt/JHWRH0c2HvT/v7/OqPGjve2A1cv5SilPcbFh2D5vFCJ2kis1BjyhydNnMWSwc3SG4A8dEkLnXnaOpzi+Kf85ocVnlgN6plBVYs4y6gRZ9tLhCsyytDuIIwx7IfYIXdAHtUU0QSCneRFEVJgXS9BKxH0GBtNsmNqLo7tA10cCSOroioiWvyfM7PqEADZ4bu9ccReKJs9GoTtsuxa6TBnEset1sSfKmh+AQUEYB18aYm4cCtNBqua939leMTEmCVrvkQbWG39Odh7Dk0XygkiNHk/e9mATvhOTyVx02l9+QPBUjYkw4hLljxaT19ZGxaEMC0icuKT5z2Gxj8BK6PcMj4g+0FN0LC3xIKLgMWSekJW/qQkcy1xvD1DKk57TyWk27qTUkWj5V/4Re52olDXoix8UnPvyKYJQNLtJmloF2XaBbunOaE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(38350700014)(6133799003)(11063799006)(3023799007)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z/B8TRwb7mNMzKS9xQrCsuLG3Wr9ATK9egyuULONW/RnfOevqXc09W5GB1+e?=
 =?us-ascii?Q?9Hvx216XufxIDJMKJ04fO8YWgY4BaAHFSXyVnAooQJMImv4EsQg1PkLMnCnP?=
 =?us-ascii?Q?GuoU9/kLKmppBih5z0sj3dgRldLThW8ozce0kn4eCcY6yVNYUQAg3WkJ9Lui?=
 =?us-ascii?Q?2sMj+CIlepWgPozCWuXx5FBGL6yhr9vP+qXem52041LzoZS3M2go+/lyH2Dt?=
 =?us-ascii?Q?Nq8bglG2tafGUsgh6V3CwV29vW0BnLPeoRj4plhIz351gkcZsi5X2cpW3OiV?=
 =?us-ascii?Q?RFM7cigOM4RVPmK6wr6/ctcBETKhd1InKR7CyBSQqGM2P5V9Lx4aVpmnJpiw?=
 =?us-ascii?Q?gDz5xd1Y8S0Ps+4t9q7qS1I1MfwCJeaBuKYt8QFoOu6PUp6YYBV0Z4VkeKNQ?=
 =?us-ascii?Q?kAWIJ/vcyp0IsjRU/d6H7tZnKgR4X/p3FoxjO0Ni0RO+FBFzmGUg1Im5YvF7?=
 =?us-ascii?Q?MuHps95Q/cPg9tJPP4VLSGcvG9YoEbp8y8eN4B+SDJWFvRIq5KmOLuGzMyPz?=
 =?us-ascii?Q?eII2iCnFsNp+JveXQS7J+vgDtOeN2fX8qBWqQXybcMSeR1R7l2usQd2Vq1Lc?=
 =?us-ascii?Q?ABFArQnjE/50SQ52r5Fu8UQI89f0s6d7P2s7y2uU/6pznOaOPf/bmy9wqM+x?=
 =?us-ascii?Q?ZW6YFqmPHwzb9SIopjUUvp9cip+D9N1xaS+x2n6a4RvhJ2wSFtknkRe3YTRK?=
 =?us-ascii?Q?Et7mfIKq5btlNr09kNkEJHJS14LZRPZjLlVT/TsXsC48XR8qQOHZkdoIzMIa?=
 =?us-ascii?Q?uC2/jdnFPu1FOjQ0DsqpCWa8FlMM8iTrUlMV9UOc3w8j/8LGbiiiR6BvTahq?=
 =?us-ascii?Q?dbue4jmCraVEwr5xQSXRGOQ0M7H7AXSJTFN4V0iKgy1GLqrqgdPNKbHkZ52X?=
 =?us-ascii?Q?ZWbpLsIPqPlVCZ/pWltnDzSsF+YFv5m7ZGqQRh3gp4KEt1xfjPHUN2J+5KLR?=
 =?us-ascii?Q?3DZ/C64dTo6neyjTSJH2/FBucDQ6BoLcHnr8f+z3jbxoFP1tiLeCbPQaYPBD?=
 =?us-ascii?Q?QUzcgih1zNWvdoESpoQWH9VkyBYkofQ5Ov2WoK7xRewWvQlrpUKxEXkgxXB2?=
 =?us-ascii?Q?8qSfIXOwLlIFl2We1mMMYyXrINHCkthx4/untSCq/3Zb/b6b8mQiHWR0EQnz?=
 =?us-ascii?Q?NlWsd+/+Bs8r6oEPZZYOObVFs42uj6N5dcXwWlKVyEiKA0S+HtMptRajh7Gm?=
 =?us-ascii?Q?5Uk9QyhwG3b1euJ7mAETKt4xlpV3jm23nzwFxsvMdqsEm6pSFekWjKIp+U8R?=
 =?us-ascii?Q?1E040MP1sUqr4vZSWw08+4zqO4F2+dLOEqn8w7VkbQ12OJUTyQr2nRKqh70/?=
 =?us-ascii?Q?qnlAX+y3VzR8Xj5V4GaI2DaKMSLbP/Rw+vHlaKBATkuhZi9EnC/pujf0NiCN?=
 =?us-ascii?Q?L/En2y85FzPTwB+Oc0uaDp56JnetOrrxrp8fuBF2e0OK83Y3TwEqmhwrMjP+?=
 =?us-ascii?Q?d6FbFmp3L+Vr+cvw//I/xobAdpo8RHPyT51n9RgJg4esYcYFpAZTcFq9btXO?=
 =?us-ascii?Q?XsH0MBQM/cLp41YxOtx2SrMng1K2fB+I/2ncZ846LME/NN9uJ7PgfpAYreMJ?=
 =?us-ascii?Q?/VSGzunKrMdsG7sNJPnPzEpdVziGJci4KzxjDjZQwvRwFXzfHdbKB4cP38UV?=
 =?us-ascii?Q?ecgD7qIYuWAhn40+Sl/FF8xJzvwn2gadGmT/o8FZ8mZ54VMR4e4T/nGS6MEu?=
 =?us-ascii?Q?I2R9E+QlSZiWvnTMhHe3dl083KC3Ur+CFe4kzvuKXNDQ1+IqeQU5HUTCXsEV?=
 =?us-ascii?Q?dGMoY8RgBJ0cWrq4hA+z+lHb865gzwY=3D?=
X-Exchange-RoutingPolicyChecked: 
	e4/CDSigVZVBvXEnTdaS11WQvpusncc/RLBN7McKbKjNYlDp7Ado7oeq+SIjQr//qOn2d166bAd9DnwopJGhURgxsH/MXUCfwoolEAHbwwf68H58JpupuEoCFi4ifDAwzlfmkz4QZk60vsrsq0Zdg4BL7kNWrUxcQ8tmVBRG2Xzl3rLV9c90H7o0I9kCqZYln0XLSDheIJUIzhQKjAS13NeEpthCL5GR4hMeUyD6Z9/jSJSk7/zeARBB4yQwiOcRyPdFhNUCI/KGbf9KYEitkETZnrHKhb1cH7+fAe3JixrhFOd5N2DeJa4xoMwuiDUxPSJhK9XoTH64VPoZo3SvNA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6722ffe4-256c-4ee6-00cb-08dedd22d812
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:58:05.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPgcokWlC0ZSh9nt8dP3opsnqMmZi+IDjYO6Sa90qyA/WzjH+KfEGX+EgMQJINPUDazaOS+2LiNv3YQlAA2hp+CnewWvVWFfxIxe/WVfl74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: NyUx8pNFXWJa7taik8L29lCObVQ611Xt
X-Proofpoint-ORIG-GUID: D9y6l_oe8s3ODMznaX9dIjQSI-QZwY2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX2LUjGKwnI/Ek
 h+41PK8TH7xgZoUAvIoM3Re2QOQi83vhKW1ySEOFqYz8F63T7kA/FJG3CM/t2FU76k9mDBm+OzM
 fexQJMRlehefoKafX7qmkf6t2G0s9t4SU+y3dkJsYsibq2547FofzrDI93sYeMtyc4gaNUzQd5j
 e/O81NgFxW++LuiQcqZgs8PT0avUlSfiXjOcLwX99OdfgvFkgCyqZkz8JbF4cYc5+91zGs+pj6x
 RxvIpmpWj8UmlSszepm5bIxss+/+EV4wU0QV0xlJyFAYv5u5KQ3AXXB5bCgPzTxN71Lxtxm2a1b
 hs/fLcaFirsIALgb1WZUNdZ9OX9iXV/cXmGHBBaCwgOZczORnV97Iyt622DGmpYX4IgBVtC+Tf+
 Q1akeyZTmq5uvBn6gYZJhz96ygreHmqOATTR4J/BFfl5O4SXU5BVxntZWvWhTblLsiEW3O5YCtR
 OxrvYYTx9bAg80giIlA==
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=6a4e9dc1 cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=aOuplgckfP-gDmdpiNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfXz//7nXhA/2DJ
 Id2jzKrfXKXvZvCAptCbPOmGe/3BvDfz1OoABHaqXyeHXvI+y5fq/LOSoiIcK9r8FcFN3KOjY+7
 /mEDsgro8LmiPx12NCQJ40kOA4JYsbUk1li3yCUZhLAKNKTBP1RC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 18:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240514

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building with `TOOLCHAIN = "clang"`, the kernel's configuration
check (do_kernel_configcheck) fails with:

  kconfiglib.KconfigError: scripts/Kconfig.include:51: Sorry, this
  assembler is not supported.

Fix by setting `CLANG_FLAGS = "-fintegrated-as"` in the environment
when `TOOLCHAIN` contains "clang". This variable is used by the kernel
build system (via scripts/Kconfig.include) to pass additional flags to
clang during config checks, ensuring the assembler test passes.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e7fdeb5d4b..78a4a7ade7 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -603,6 +603,9 @@ python do_kernel_configcheck() {
     env['STRIP'] = d.getVar('KERNEL_STRIP')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
+    toolchain = d.getVar('TOOLCHAIN') or ''
+    if 'clang' in toolchain:
+        env['CLANG_FLAGS'] = " -fintegrated-as"
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
-- 
2.49.0


