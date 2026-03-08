Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF175EA852C
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:09:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40490.1772982558321278972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OTaw4OXu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628EQ7gh606391
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 15:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fnPR02zyWTCHrpB25+BwaUxXCj2OkCg6le9bdxvwUwI=; b=
	OTaw4OXu/A4nA48AvZK7dWk95TRl8pk1F5Uw3kMf6J8Daut18oiTXs1bpn55lRn1
	w8yFuXYI06fGQ3kywyoX6S8vPHDSnQ1GEKU012ocpXP3VBa8x5eneVCv2+eozfHs
	7ysaCC5rXPjcJWoTH2Ol6D47JvjbxHQW5nOew6CXib906ENPgG7rvuH/TG+6QKo4
	st+qTrAkDPoTHXHWEbKdSubHnelL9F1JMKYQPgne/RDSyZFljvQ8NHT8jHCVox3Y
	6R4+UM8NsU0xwnDhJOjNkZzh3pTiKI+XnzavSbUbVcq6CQfH1nwotAis06tl78iE
	iwnTUk69rC5oLagkeBNq6g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v948x-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0f7O2Me1d/YdrmQViG0r0P4sX+wjclYYFg+lkUn+1YwzxJYVJx+xfKiDfAQVU7J/p0Bo20btCbPaP7nElzX14Cg644NYQBXk0ykKDhqKseFAsFwGbSERX+yq4UOnmekCnWm+KGKOClMNjtIGL5NA8T5AreF1k2So2SmSFpohTSMQrKL+RoKcvilp74XiWD3Oi1U3UPulIp+l4GHFCW1sx2LW2hsXYyFkby5m0ezy49cQfBHGq/+qNlp+l90CTR4shESS++Uxt1N24rMQKrPxjJrr5J2vapNQeEnic/Js2cm/q1d0mLDxb8AOF4D6IJRaUVvFauX82VI2XfB4Q2YwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnPR02zyWTCHrpB25+BwaUxXCj2OkCg6le9bdxvwUwI=;
 b=wADQHAiENSFD62lnb4PhuyOa3N4bX36yvyHcjf2RMRJPYcIvi5r5T068MFVMbZDAUScAMKaY3mAZ+TOIiwyAjpzTUy+Zg51+Sz3lFG9p7t77XJpIxalNVFH9DT0iqTeqi3ixZ8Di7k5JeeL1PioSbDSyI/bdSY6PvKovyMxSLoR4+VBQR5UARK3tCHMKvKxYd6cSx7T2HUHo3R38ETRO0/f++7GsOW5el6SWew5lFirlXXLRZFZz/r0/+99V6Zb7LV5HcWZuMYZpNcLN9+7QOmjkT+O56QbFCeOGUIO1GhvLmHf1xxQyB+97xZ9Lc2h1C3Nvzy8Ftwiz2mjd5NMIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LV3PR11MB8460.namprd11.prod.outlook.com (2603:10b6:408:1b4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.8; Sun, 8 Mar 2026 15:09:14 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 15:09:14 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v2 4/7] gcc-runtime: avoid discarded-qualifiers build failure with glibc 2.43
Date: Sun,  8 Mar 2026 08:07:18 -0700
Message-ID: <20260308150834.2508331-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LV3PR11MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2d6eaf-2291-416b-8d97-08de7d24a8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	Kf0Zm1MVJNaU9xSGbfJ3Zo6YtIip8WKUBqRx/tP/C/jVTD78XR2CGx007/9m4GH92jEu18QCakFP04L4jD+Sla8hhsv2E/w3dguTO4NiCqmGfUuwPROIm6gX23Lso9Xbfbb69r0vlXWSoQV6LiBsGPFEHi9yjbkO8jAc82of3pMC+gSjIV2OIXz12YYv6NceFHO1JazOZRsaA2O/qk05rSZHJPoDuWHaL/SG3jVTVK6RfU9QY+sJbi9+3lJiMdO/r9DEl8tN4R0kA9RewcKpiGALTXM4xrOt4XlUwfh/rEOwg2tuHhPNXzxmhc0axfqYqp5SmWA98R6z7pH+LGibNoJmHlfXFpCjtIsY5drxCVOlHRBZhVY9MDwui2KtaQbESUk0to6Ya3u2ozVVm+en8EVmWsYPFyCKNHjhHEdxqvF+QvXFsQAIhG7z5vskbMh/dA0GNXEuOlZiMdEH7n5+73zsKvK+O1rguOfLXCr3lqY/aa8vyJ1hCQIaA2eezgiK/VCsEuPvNk0zXQnTYV5P3ApjUg6A///Qr4HhODOg7gWEN+dsz0R38chRKrNNpByz2RMpB+CT2TiuKi0waLHzwSeekW3LgjHlavAL/S3ypq/gugYxZ8/A1sF4VcVzsPTB9toZTTJU/34xFgNqrEg0PBBCaVPIDT7ZQ9gpIwwsaE6L2QCaVkWoBsbSWfyVLIgr1wHjlukA2dust5uym7MohnpEgON7uCrTdcM8LOu7vsgG8m1MgWeL7BCIwhKO8extIKA6Ix0kTqyOdMFoHABLGu/nWdfM2tvRn0KUqMOEhl8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZAZXRV6QqpjRoIeVcfo9/hVoX3AgTpQYrWdWJoGgRFiNOsh23cddm3pZsnuF?=
 =?us-ascii?Q?YaJjmGEbrqE457asGMYUr5NkDZSTURnICM+Cp2EB7FqeyumSFzUZjMWIcPYW?=
 =?us-ascii?Q?mQYcLZ1UGKZUYL+rYKCQGZnU6aVmiSlZJ6UqS+ajCZXCIPBt1LInSGNYHDVE?=
 =?us-ascii?Q?398FqQRindJWMdXHHCwQ5D08k4ERILyVfwrYysE8vBLXzHpTggZj8n8ssY8s?=
 =?us-ascii?Q?LcX/5Ea5Z6ORVmpKJYEUkFJu9H19JLuBTECpredLEP4F7C+QfPFsoWP0psqJ?=
 =?us-ascii?Q?O7qKabxPXEC4NYgWodpnEHBH8aPLP57bjATxB1sUyzft+XPrWe/bJ4Nq93Be?=
 =?us-ascii?Q?uJ1qF6jOGk3gshxJkJlonUEJ/A2wNi/B0relYZ/3cj/UvGLxM7G2ybwHLlmC?=
 =?us-ascii?Q?Afju3OUnQczLaLqxkhQyGE6whVHrx5IhfkRUyICKemkE/qz3hnMpuceiZL1J?=
 =?us-ascii?Q?cBwdfSpPb538suiisdi4hrV8aoOZYHuZ87zRxn491us0JmDcbSIaVtlPZ04B?=
 =?us-ascii?Q?Lgr3qyXz/1j/cD6hxGEuhbT4OEHpV9lgB9bQoxR0zdA1ihvqqT7cPOSDojPw?=
 =?us-ascii?Q?KCnjUj8UnkhjC/7u4p/5+/bsEN+YmNnXNNrkDbv/RbwJ+gaftY/Vsu9SGZT9?=
 =?us-ascii?Q?Cz5BlrrNxWY92v7Hm+NqEoNl7dMA09WYag98n7ZSI0OPIA/9LI2kzkVRHevI?=
 =?us-ascii?Q?as2trIr5td3swZ83HpizkYWOYB2uhDj4DunDSvMgklMGCxfdVym7Kf+NK+1O?=
 =?us-ascii?Q?w+nBte6W5MBuotcHn5MBaNYRnT8APcPs81ICI2Nxn/CQbEMMQ3SaVn3kdqZ9?=
 =?us-ascii?Q?LrVm8MSRwL4i7veu2ZLN/xFlnzG6ygP/vkz7yzHe+MSHqbDGSNVVooL3RV1b?=
 =?us-ascii?Q?eO1s0DozeO/BEoAMBgrCkX8mvTkCRTaa0jB/oNH0oPUbJD/goxyx4BKvXW1l?=
 =?us-ascii?Q?w3tmpDJbZG9pw+Kk1+bBXoZhcKrDblDtfG2Uy+nJYwDYsI7lgMhsgTY5F8Ka?=
 =?us-ascii?Q?QH1/Ap0l993N9V/QG8H30LnWFIA6D8ytkTvwSP2U3ODUX9MMJLBynStvPhQx?=
 =?us-ascii?Q?3EvIitHwP2K9KvN5kDI5DntXMatLiiOL6Xw21bQ0dUaLYNULTZrgOVb9E/Zw?=
 =?us-ascii?Q?2g47KmSf1RMCAGpkyU8GghmtyhxAytLmoEVaEbZw8fGPiaHXSgOd8jS2Oftv?=
 =?us-ascii?Q?UVHE751XGPGJFNRjAdM8H37HCOV2U9Bm3ULE7kNBcG4tJA+kaZd/Uc0zhUd9?=
 =?us-ascii?Q?laoewhgaHFRYqotl7nPwU2CJZhMjpgmrYFk99CLCET0+AAT1e6+RXoS/1yH5?=
 =?us-ascii?Q?4N+A/4bPDgdkCQUTV+ioLZb7hf7oMthN5CuPAgvXC81vC69mcmakuoT7FX7r?=
 =?us-ascii?Q?8rOjP0Ztcegp02fePLogR8yUfdum+P3x9DBL9FBNOx47tg40nw6xzTa4xtTz?=
 =?us-ascii?Q?p9GWepwAgsy7G+l6rnskgex4jny0XoulMI/IYdBpOYyMN1Pq/49s5wXdS9UI?=
 =?us-ascii?Q?HDb0HPgsUIBDYHQbF/wHM9L/rCT3xTeHg/KHJiU+SpT+SyOW+07nLFnKCJTl?=
 =?us-ascii?Q?kRa8Fh6VYjJOBNGK8ueL/5IuoYYncoWNoQqZsSp+G9DkfeH7lNnLC3gugX29?=
 =?us-ascii?Q?7UFi0Hjv4ep1yOUBFnzREmN04EXe5A/VNnWxTHxLtqVe5dDwFmJ4OIGXLyg1?=
 =?us-ascii?Q?uwmoUU/SCwWEfoS+PvK3+CR27UvbRQADiFTx5cqLQARR4Pp1bgx7kmMHYS3s?=
 =?us-ascii?Q?CST2jS6i0w1l2Lb5UwPku+l0DcMBfAw=3D?=
X-Exchange-RoutingPolicyChecked: 
	jhRM+ja2khpkGdR6pklyQ4CtTFkOcaYLQzPYVnrbOv1fLWTLdIyuxPguUVcuD7IxdTj0zQNiB+NGdJNgbiTvFDUl4ZEjuSXsLnCHf5nQsfMP6Nshbu1X4tKZtVl5cWtY1COW32IPKCiLwWLO5jLRrczkYkEWXSSnq3lTksrkERuynkfnYmY/Z1u8VmfogXmPRo2sCZHTwAoJaawbZM7IVS1L5c0dois1kXOBnE6PFum68MtqsFruwaIbKjDHR/GCyam5rbbrgmf2ySXHtj7AMhggQz0v8EqSJREsD+KGMfKm9u7uUROs2svM+lV999Pf4VEwNBq0l6Msxn+3Yljjlw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2d6eaf-2291-416b-8d97-08de7d24a8ed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 15:09:14.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+3I6A+z3ukl8qdt2POT2TDjDPSQXdspf5+x4seKXz5Z1jehuLlmeNAG38mmN7rU7Dbjfl9G3RfdMuvgeWfOlsbwqxm6gSc1SkbQmzBGInE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8460
X-Proofpoint-ORIG-GUID: n-tRR0D7wC7SSX_c35RofqIA6CfLpQ9Z
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad911d cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=1HE7Jd8PXYmj_aZCj6AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOSBTYWx0ZWRfX/cGovwOfm1l/
 nk25cIK2o87NvUCoGp/SWmbQb8htJHLOqtSsWlqOOupwVd3eME1GniXifHst3ompkqPuOZM6xFm
 sAMUlmco/AGXx+DtaNL+uo+kZKNToaYQpV2p6Xp3uL0aZVV6wUAMPMzO8xR62mVjwbAJSD4ZI8y
 BSc6zsNKQSRikdpgmn0WZqq+zLbgPlrphD81ZMS+cZrvpmk5ACNWDPIvrsF89/tqY7OKEyL9T6j
 136KoFPhwMMJEMWeHmYoEr5xKtXzQXo7OlwXglFjISabB9dL/dCH46oua58sE2P8ajqI3QIidll
 VLJI905Sa+8pyjsYjF1f/yAjoQfvrB9Do3lsM3wk/RoXghCAgjGrJxi+2DfMUM3lmTrdciD6KxU
 FbAGVJY5EGxUtXLWoItJOQwuHjNipiPtJm/Xk7RwKfGj7Nb7lzIiE2z/3/npUoXEjGcdCsKfM6o
 u8O8xgid2auJt9OJcyQ==
X-Proofpoint-GUID: n-tRR0D7wC7SSX_c35RofqIA6CfLpQ9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232656

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building gcc-runtime triggers a
-Wdiscarded-qualifiers warning in libgomp/affinity-fmt.c which
becomes a build failure due to -Werror.

Add -Wno-error=discarded-qualifiers to CFLAGS as a workaround until
the upstream const-correctness issue in libgomp is resolved.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c4e1c5b9a5..07db9d6fcc 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -7,7 +7,8 @@ SUMMARY = "Runtime libraries from GCC"
 LICENSE = "GPL-3.0-with-GCC-exception"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
-
+CFLAGS += "-Wno-error=discarded-qualifiers"
+ 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
-- 
2.49.0


