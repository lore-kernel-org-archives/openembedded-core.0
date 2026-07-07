Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351F3C44501
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 08:56:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.169148.1783414583497707850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 01:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VUNEwkn0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1648a4fd34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678GVZ41133879
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 08:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=oSMLjKy8lBFsIA5aY7dVo2NI0AF6wf46mhyMmr6IbGw=; b=
	VUNEwkn0dcJyTDxwnY5qaipOu1xT03dxSs1+7Z9uWcm0N+R4uUMBeMa1ztboGw8s
	OVfxTAvvjv1Ib1O1qJGLV/5OqG/bKiH1hdyyYNtwkFMBYAai7wQPa1k5cXJm4lEZ
	AfblYdCtKglECxDKyQVoQtDsbWOACjq8MnDovmK7gAAW/N6+t4bLp4ycIL2xc3Cc
	2Er3lyjrPiwdwtvC0KkptfyYH+C36F5xlJmLEjbSDm7UN7OVjXdknNaG63+rITwc
	ccDUytpOYq6pc0Y5LBHVvqHNl8fAqA+CaruF7W02JvDncgkV7bDG1Fs0KSOiHgUi
	Tb4viU/krSW5fw94msWeZA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013033.outbound.protection.outlook.com [40.107.201.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f6qcwbwks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:56:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ikaegWsvdhf2CWwiBKEsoQ1ZEznScdGW9bD5CwOeRRIcm25vzWejJro6SA1dY4xgu8hefrO/KOKzVc2NEgu2rY4HYHb+9TxZzQw181Xr0u0sMbWiSAXaLChqzzct/vNOGrHbhynE3tcnx9QQhq8/RpN/SLLOiVm0MK6+Kd8gE9BKInsowMopJClygzMdLBMVrKUwf3R5Uv54UGaIJA0ofASsGqeYB7YRrb8d5zkCrR2fwd6o+dEqh68S1kDoHidBSLr24hubwbwSgiJgcYpRRKWId0JHfd6n9LojpUmcyetq10lQ2mHIOYyRSwTsDFid7Zs/MOasYBrAqHW4gg03IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSMLjKy8lBFsIA5aY7dVo2NI0AF6wf46mhyMmr6IbGw=;
 b=erfr7MnkpqZGOKP4sIsZaexeJtD4ox7F7DEd2mrMhB/PVZMLzrqZO4TDu/Ux72u3uSNNiG5fmTht8v1rZp9+Ehazn5OgnOlPGINePBRDCZ2eFGegYeLBL6DoPmL63HNsJ+88yxbpMBlgtC/B+ADTzpdiY12ObUwHUT4Wn78YX728g8USNaDhJAr6Rqxb0pHtUOuQvoal2RGm4k4kGIsVBqVlHOWnY7sXrJRmgM5kDWhKfe2ZGDFxW9kAjk1MF1S2eEYnt5d/ZtcM9oI6FgHDUNVIRYg7hnmQ5Lw6TkFTc7O+7z4g3PqyiVsUoT7uHpdCx2DIwfj2pgSpW5q8Meqw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPFF6F855567.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 08:56:20 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 08:56:19 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com, tgamblin@baylibre.com
Subject: [PATCH v2 4/4] kernel-yocto: Set CLANG_FLAGS for kernel config checks when using clang
Date: Tue,  7 Jul 2026 01:55:51 -0700
Message-ID: <20260707085552.981820-4-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
References: <20260707085552.981820-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPFF6F855567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4865bdda-02b3-495a-a46e-08dedc059cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|3023799007|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	eX20euBsFlTNxzx+q+JLf1YLqV6vc7sKFskfTuVOj4AiLDZ3812P9eT2q0b+24N8rGX3i0Zxb4pXvzNHDhZVxSraVwWzcBXeCODqKFA5D1yoZEUnUjhZ6PXiV7fxbzGW2T9Zvd6JUYuT+mY0Fv2KIXKINK6dO18fX3svhFKTkgYIcTgIn9D/uqklmO8bjxHjxHLGbYK3PPN6Kul+KjGaRSk6J75I0wBfsg2ojnP0nRwjEpFmYHRb6kjUTN9qFX4CcWSq5To6sduBnYrG2+CnRyKk5iO7DTLfgKAvMrzfv2fncwQcYge8ZIGvovvnpisavNzrWm2YvYZ+Bu1IQ16zSniCU1d29pH0ekDPp+XiRib3zhmFbpjSEiaeVTcg513prWQK+Ejq7lmeXQUPYUGir3psAzVFumXyinV8EftC+bL9mSNq+zB6EJHL2vVyT6SMZpfWDBpmZSvWOh+fv55pQy+22zcNJFfAIiqNt/wujAOjVqQ87oDxgMUEWwKBPY4RKM0UjbojyhTOPcXnRzeKvPFykwwkqKiRp8syt/HqIiHfRT1f5BRJ8ksqCcVetX6HXngQE0RLj6TkdaCwpBaGk5zkr5L3YcDQAeLsQE1468yp7mbKd8E5eZkMQlQYD9btDxlOx2k3TnDl/iAoXfXuFg9UPm6VQxZMLWgCKqAxheBdmGz5ZduHyf12steU61S8sv6dbcZpZb/fwnIHYitKAIMewqdcop/oc9bEvy+al04=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P4eOId6ISw92im6UiBCRO6O0zsIGDNabKnvCEAUO+IjUpdjg5MiRhkQ043Uh?=
 =?us-ascii?Q?MQAo4DrezzC/RuGTI9vVygrbT9eoGNYGOOkCJ5n3J92zcfu4t3eNEJhV9d2V?=
 =?us-ascii?Q?AjGgaAuJTAPKdVOPxKIe+egb+1lskTQdr1vtB++FM3OOwDNWlJ7MA4SZ0xfX?=
 =?us-ascii?Q?ShtjLnZ9Zqc9HnA9+S7XCStj7CUdD8BZ2ZdVjwQZQvpIEsXi1gyxhywnMjif?=
 =?us-ascii?Q?BttXt1DwMDwBybaBdJDA8uNNPQzcizyw7eapjJess/e6u/UCO3V4Ao/PR08e?=
 =?us-ascii?Q?1y4O+RC18ByTMK7tUStxB9WR7EjK//BpgKaA61IpTNcvvK92qz93RdJmOH8G?=
 =?us-ascii?Q?PR4UpyT5zY4Dwf6tCZ7qTxRGP2nTegRhB0/B9IXazuMyJwjvYpMoehIqug95?=
 =?us-ascii?Q?Q3vRn9Oc9qTDD/4Y/Vc5ueiPeKkFsvgdTMbMUzNUZIabW73IVB3OLgCRell+?=
 =?us-ascii?Q?DHGaUFxvRwjZ33Y3PUE5Lx3tuze4xJUMZPVQAVL3GBQlmKocgraUWonOt39p?=
 =?us-ascii?Q?HJUE/kKR2Hgs2nk9LQVqC9+SXJUwoULkT60dk0p9QOuligvRJ2qnoPkSX+aW?=
 =?us-ascii?Q?a7rvU1izuzbI6dFLN2tjZ58NahPWJWlcIMlgvIR2rKtyOdlwdlmUSfLxtz4d?=
 =?us-ascii?Q?NGUEuFhyhput2wWolrn3r9Kkc3qeFmUFifFqJNYOP5k8/7XFnu0+sS40i2Ti?=
 =?us-ascii?Q?CkgptCnnWS9/c07O6YzkJ10JMTDXhZkGs+UHVjHIZ6WvhD+aiQ4xEa8R3ZHV?=
 =?us-ascii?Q?sgJOvCvkQcNfH9qmbxdfsKkprgvbQkdLPjtBssOp+Nnwi9ht5RUu0cP69Z5s?=
 =?us-ascii?Q?1DpHyFsjmmkv5Scb4MFU31gzYWcI/GXgumffZnjCikH6PXNhC6JA2JF5n5si?=
 =?us-ascii?Q?T5p8gQ9hoZ4o/uY13xK1EJDU/DIbO2D/3FiuebCoVjaJQMXaXlA5X/wjoaWp?=
 =?us-ascii?Q?0AUtDOO1dKhKAd6dCvWCxhTf4tTqabmr0BEjpPbK+yPrn4t8r3HJe/57BFXF?=
 =?us-ascii?Q?TUxnUm86MkNdsZpl1hhkfVa6Fua3o8sKr8vfGaWfoDXFagrqOf18PmuQfhne?=
 =?us-ascii?Q?u1qtlVOpj1rdawODvKv0ji0at8RHxd80mBjYCSGRRjsILJ1ewvp6w/CiOBOv?=
 =?us-ascii?Q?OvjICr3PIng/g+lkQb5/mkOyHsr2MQm1rXifMYzBXvlNU0wTc5IGXsTA/cxl?=
 =?us-ascii?Q?0agc1iNh2MasqGmls0fNk0ED0JGaqxw/TY1v23Y5mgLTFnTMOIKap978mzgE?=
 =?us-ascii?Q?omysKr53MQOevjpfBEuM6aLr2sFeqEYovynyRujqP0X3B70xngs0pOkSdz4h?=
 =?us-ascii?Q?Mq8+qLu6/nwytMpfwqYdl/lbe9xeKjXLW2PvZLg1Gc8V+c7+ssAJ2ooAuw9D?=
 =?us-ascii?Q?q/Ivv4ecjVeiXYMyw4t/0G5AcZ3O2NlLVsg9nPjM2AyIC5Ec8bBtAHL2jp69?=
 =?us-ascii?Q?iA5ieX1t6wwaZvmxh8h6gUhR1pHjY0YXVrJnHrmbytrXdL00KoOS9sji/q57?=
 =?us-ascii?Q?xh9SwMUp4InAYv8R0gDntDowVdF6eQixAXm72Z/rGaYz1AakYdLanbYLSthd?=
 =?us-ascii?Q?5Bg8SY3bL6/y5ItVV6paqsp63+mjtfeZZM1GDNJ8N4i/TOn3G3sxIdUskxLc?=
 =?us-ascii?Q?hCc+I5YAA9BmRZoV/J/uACXdkosz0GWS9McczPq8ZRlaUEsLQ12tTu36nAjb?=
 =?us-ascii?Q?rNaAc8DEJEX3WeLjtUr1vH3/FNBEUpU6YaXwL3KQ1IEb4PtHpqj7QQj6lUoD?=
 =?us-ascii?Q?q0B4vcKovgf2GfVQ1S1atNR+vgomoHQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	PVOPCtIY/PpFqyrzOcdjqkhQeiMfbL3o1BIM42uad4QLaHe2xgvKKkSJ8Y2jbsH/ipHD5p7VEQGvyxyvIMyzZ9B6/+EbMVeyeixAueI2+fwg0WlNZt4eKOUysDVC+jMDBzn0GWJyvTpECxo+0Fi96XAusaPdNxxgSz8SwyvMJV9QrsknQTIJcByndp5zXlUc6TtuI+WEMOO+aIvvXdhA1xS4tX3WCgp7ddH1IjF0PtM7ZrZpyQ/YcJjY05zygxOIeXDYxMjmApIPGgrQ5pT9HvopOLmQJMT3hVkY7mvc8HfeVCerrj7dQIrt0kovIhb9ZXxWP9f0y2p3nYcVHnX+Rg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4865bdda-02b3-495a-a46e-08dedc059cac
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:56:19.7649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpM3oJrgZV1sU4CaGBN9iLDyIpUSd8OKkLgP/SbOHvWD5EEZJJory+LiSAwBjzENeFOTICSVy2KK160nx4mUykvhFunZ8pIpEziR4xUq9lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6F855567
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=D4537PRj c=1 sm=1 tr=0 ts=6a4cbf36 cx=c_pps
 a=H8U4Gh8omvmqDI9iB/RWMg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=aOuplgckfP-gDmdpiNwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2ojlqyIimW9CPGne_W-PneWyy2cveKKi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX8+5kYeFnmFmI
 hQQNPJ6qLzLWnOZN68+HfNjLmQRNiv5kXMKZsDyPk8x+oa2XzIn2xS4n95KyPZPSWqMWJYEoteH
 X9RSgHPU3VKTLlye9xBs0QO7Lxh9Du3wMerpPV+8g2uIVSftnzoZ
X-Proofpoint-GUID: urWu8EwBWL_8EC0A2esZgAlp-ButhECX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4NiBTYWx0ZWRfX3NzVylczPFuU
 ZpHf1UpXOuJQd/W+mjZk80otkH78DVrEquwLDVf48bWmQhnYHM7r2KxUhJCUTaPO8IKwEZ8pjHk
 vHsek5mFWGlGV5AdeVdCfaIj3lSNSEp/tO9xxoqQ3+65oVbkwlE5xRUCvwWu4gfwHwm5kAMZLBi
 +DSTIEzPRmqiiETRcHHs5kFJIc8gIwD37H7iJTLg6UKsIR1tZpmEfES6eG9XEYFjkTeQ0Hz0EmS
 P4leXKSQUDuvP/ND+7P7SAnTU9GtjFinQjFnjTTlK8HJaGCZBwcxneMPcWYCGyxIdBdAYISi0Vi
 YKn2ibHDOlC1wBG9BRhDHyEbO0DS7SlYsNLIInYInmgX4YAt/ltEBdLtTujJ+K6cXlV3cpRc/V+
 55A+/dWccbWDjUC1oqAb2F3l1l8FV6w1miRXP8ebizTj5Ty0C+zcAG73o61/7EjYyenuvYmE2lU
 0APElhjx6CvyOzDvumQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240373

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building with `TOOLCHAIN = "clang"`, the kernel's configuration
check (do_kernel_configcheck) fails with:

  kconfiglib.KconfigError: scripts/Kconfig.include:51: Sorry, this
  assembler is not supported.

Fix by setting `CLANG_FLAGS = "-fintegrated-as"` in the environment
when `TOOLCHAIN` contains "clang". This variable is used by the kernel
build system (via scripts/Kconfig.include) to pass additional flags to
clang during config checks, ensuring the assembler test passes.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e7fdeb5d4b..cda9ffcf9c 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -603,6 +603,9 @@ python do_kernel_configcheck() {
     env['STRIP'] = d.getVar('KERNEL_STRIP')
     env['ARCH'] = d.getVar('ARCH')
     env['srctree'] = s
+    toolchain = d.getVar('TOOLCHAIN')
+    if 'clang' in toolchain:
+        env['CLANG_FLAGS'] = " -fintegrated-as"
 
     try:
         configs = subprocess.check_output(['scc', '--configs', '-o', s + '/.kernel-meta'], env=env).decode('utf-8')
-- 
2.49.0


