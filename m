Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBE5C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 13:35:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19359.1786628136541442929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 06:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bc5Q6OOW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=268517a080=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCK3Sk1012827
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:35:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=DJLhTSaNi
	YeEG8lynaBQhF4cop044IRsHNEEnd6nINs=; b=bc5Q6OOWQvV8Aa9/vzX0Zj63H
	y6AUGBqSr+xRZyz5FjwF8sMvyEDspdPhZRjPlHr53JUf7l2fpf9w6KsuHzZ/HVG7
	95OJFYY9wLlv2NbUp18P6FHaspp/bIw2xUivrmyWDJq54AmMpo0NXfldVvXb3z5w
	OCqmjlBWVh1O2DFYXwgDLFHgL327S5n0QlabNHvp2osgUVizNQk7j+MaXJxQ4Rgs
	5N5W/kVBr3KRlunqdpNoF9qMZrkFUQSdFX1lf6G/OyV1sDaxMTZNYFEwP+o/HZNg
	00AeTnVgv8i/j7uJ7DFIjI+RUciWEH3feMTEnyQU79qPR7csqqMDfySfywnTQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022141.outbound.protection.outlook.com [52.101.53.141])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysggd8yu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o207M+IdRn9Jd+g94saVwI2D1QPCOqnEFHpwTpYuczLkLka63CbeopfW7aURymnyuQr2Kn2DLKa17dg2kBILTO7+LnvcRi42LJ9JOivSeDLHh+RnFJhEcKlr3FNFKENreaf8i+0ujJLg4cweEKp9/4AHNRZUCDOFTYyOfinG+Asr4hrb9e3y8R+cihnDs+H9Fpy7RWtduqpk2ztNRZyGx/hryAXck+CN+8s9BGlEbgh2eFAq2SHEyrV5IKGPX56Ew2FLym+VnXOJqlpHUvUJM9nxm3zqw1P8GtopWJgiwl9m1wXpeG3Y5Hr7b3OeaZwwEDaABZyYHvtmbs/lB0W6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJLhTSaNiYeEG8lynaBQhF4cop044IRsHNEEnd6nINs=;
 b=fpEk+p1eAxZ2tb6133BdyI5yrXzmyy2EJYR2dM/Tyx9zoOSR2YNXMc/hwRXHjfnP7zV18n46cvAQUlhGlLRtraxT4YhdW0uuZNe7x3FBCE6doV2dQuqaLRqDkZdKMCxFjiMSau/kpaVq4mMgtk4rf8z5SNFxqAR/PxFTthaDqLsSuMwNtqUkwEyGiVzJbiHaenyK/55PqpqkG0OezyPcNzU+p6MyIYtPaFC2wDCVcX/x7cnRYyPOamWZzoZvoiIOFS3hHOpq3JEJlS7EpA3zcs7T+XI9cxtZKSDQhBqbLlyjq0x1aBbqmvhhFcUVllw6tIxoDiFeonRk9VcVxrFlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SN7PR11MB7067.namprd11.prod.outlook.com (2603:10b6:806:29a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 13:35:33 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 13:35:33 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH] gcc: Upgrade GCC to 16.2 release
Date: Thu, 13 Aug 2026 06:35:15 -0700
Message-ID: <20260813133515.523797-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SN7PR11MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f84a03-48e7-423a-731f-08def93fc01a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|52116014|10067099003|56012099006|6133799003|11063799006|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	6mwJxvtRS0DP0lPM7v2dtOjh/JpffqdTJCP/1SF7df2vrgAdA8MhocHaslsodc84aDyOi+lFBc2YdKBBl5Z83Ofd8cu+OFgVTejx8p3xGE68cBf6chPG7DTOXcTWgrOmZxIOlMHJ/2OXgSGpjHUYOZorWX0hpVu+gN5gM3uRsk8vJgmg8YqIzqD7SsDn05H/Tythnl46GZOOe729C3wysm1tz4JIMW7bjdf0GotHh1OCnZOm0aaT931BzxRBpHG4i4fvM1YpdXSu7PgrlrU7uRwoKfBLdKAh1G/GvBHjNmnPHXxceGai9hyGwvmvNYUecBfzaOcftAbAe7wlo2PyTXHRF15Z444KRNdwv+HogS7QAeCyA4HoFO9erfCxiIzVUlWj+MWQ6ZA5y0AxKk+XLeKh2ccedrpbVyCO4WtrAdBXJwVTFXLOuX2D/N5Litw68Nlu9VZ/c/EUpVKLTwcV3KBpHr9yimoe6Nz+JUDTCbBBd60TQpoe8hluVPun14G0mctK3AJ9EVLpTTepNxpOA4hgBv+2zuvLkEjbJ1TIGkeLBPFi3raxg3X71fdUHq69fG/ynKu2R2y0skZ0tawXEPgSiMgiz5qS+jba37Txl2wb83s+wRZRh4qLvTmuohRHP+hwqxETEAwHzBDHTd1EtmnROcYP0Hw1JgC+HtrUSHc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(52116014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MbGHJOpWLzpuxf9HGuEhLq82c5I7tQoAUGhePTd5WSM6xpyfalifXqu7yz7C?=
 =?us-ascii?Q?NFZZppOufv8RQyAfQdKLbpUXwQTDl1pCekxizksb8zxIYKo1/gXIp0ss3pLq?=
 =?us-ascii?Q?iepPTTIsaTk/nATDUQfX2+Vwl7BngJURmM8+c2e11sLmU/IO6sa8ZoZN6NQC?=
 =?us-ascii?Q?O6xNI4EEfkJKhSZ84YN+i/jvsXDKyKoaykTzM5yapBbsHSEIswjcDQ3xmzqU?=
 =?us-ascii?Q?0D+nt4Lsc5cudOYekOrrKvuExVDO9pFCRBwV4Q6bHpOr6aieLUvVVQtwPLZ4?=
 =?us-ascii?Q?FQQW9eMZiTDMQAxt42oHDRxYPyYR6caxYZUEl0v9dpH73kKTjWr4CVW8UwmS?=
 =?us-ascii?Q?v2PbQfqKQO3/4E9OTP0RvJjQhdG+u7P/lZJxhvML/EXe41mv4uL5kZpjC1qk?=
 =?us-ascii?Q?zAEkb7GUv+msbezkqE08x736KeImuFomdMOVcrYWI8CpfgpizK0oqo6MnhZu?=
 =?us-ascii?Q?W/lo9C9YHMUv/6P6hCT7ecGvj+uqNEpYMuCqoSDwgKOT0jiOHrLnvOO3j8Vb?=
 =?us-ascii?Q?E46JdMLNbQb4uEYXm6yaAtlyMhodEsayvR0fVxAJ5COwPo33VTkd/7ZotRrE?=
 =?us-ascii?Q?C7KrevcHObaSZLEY+I8SnfX0htUXKGAtAvHwBAbiVARZBS8nmLqi9jJwIKRe?=
 =?us-ascii?Q?bPJmU6U2KXVYJ4iIhciZmPog4okSwiap74Ye53YQ+G3b8mZkP2eVQYznRZOu?=
 =?us-ascii?Q?N4CHLQNXjeisunRLnqQh+fP2SwRZQFPfX0rEBo0GqB/p9cBNrdkiisyVSJqO?=
 =?us-ascii?Q?A0K89bCjLP19JyNutINqir5ckZoUGOQ9mMPOmZQ+tkFwGq6/6/ZLuuWaofW2?=
 =?us-ascii?Q?YEeU+lDRGr5Zuss1z7eNt4l6T4RmSlIAxrk7LnuWzshKXIDTjNT+taHL6Lr5?=
 =?us-ascii?Q?0y1woSqRQXM36bDaG1AG7A0quTjjVqZj9Qftz2Jtk0Pl/RBQnnLuir3pqDuH?=
 =?us-ascii?Q?48IfZK1lIN6o/Gvhi7LGx1tWe08XhQOtaM/zTOgj52YqcPXJdDg1NKKjx2Tz?=
 =?us-ascii?Q?iEuyMdw6OhFqAeoAwAKAAeRmHMUFosFuicft2pCNRpEUuWLwqoKRXODD/99A?=
 =?us-ascii?Q?jhO5pmq5yqn9Fg9VJkYiSQQS7MEGw/L7alF6BXilqserZW+UNT0IBFUwYGs9?=
 =?us-ascii?Q?1Bex7M2pvJJpl9MstQ7BVubQFzJtjHlC1+gdHWM252qsLtA7+AWGEsgNdgHR?=
 =?us-ascii?Q?lfr5z88lfrpXLlpgkARcnyFtrwdJwGqnXiOTzdAcED+WL4buc3UM3QyvJ81Y?=
 =?us-ascii?Q?1kmAcac9kwKOk/9n+3xEkWozsjOHta8zhQbk1IMbvgvH83/0VUlC/gU6oswN?=
 =?us-ascii?Q?A6Hqr4akeqC2/mFXKwlpGneJOmo0Y4N81r8ge/f5NuLkQm7UK+fv+VbNK1zM?=
 =?us-ascii?Q?82RxPm3pI5xKRHx/reFspd3AQOuemwW0HTYRjXCPsrseU0ZwZ0ViBoupbvhM?=
 =?us-ascii?Q?yPM9xEG6cfXYFKr6o7/89UD9SB5BtBu/lfgAbiRTbmog5q4/2GwuOFJTQKLr?=
 =?us-ascii?Q?RsbarW2P3b7dFsCZBIoePn3t+h1/vCCOH0hEPc3rg02HM1n3GvxEUGoRPcSX?=
 =?us-ascii?Q?BPmMKRjmD7KDn8pRy7T0ZMEukPx6fmW7i/AdnpQgFcz33TaixJ69a3qGqvnS?=
 =?us-ascii?Q?qSfUKiISBINJsy+xJKp/uGF9TdJcsR+2TodPxvtN/D0nxDp9mr5yWilHaadO?=
 =?us-ascii?Q?KVt7ogxdCa/zD+Hg3k+G8hfmEgSRxj02/MPMh9qMzGTTUeU02IEQtqD7p0xQ?=
 =?us-ascii?Q?/NXoOmmzKujS+HCSGhv6/N6Y1j+Pazo=3D?=
X-Exchange-RoutingPolicyChecked: 
	Tc5ZP/wIwN7YqZqIHNBTur5tpuIyYcNRgIeYOz5Khz+u7Ps0+YTaZMzx8bwnJas2kZnfSXP6WfX9VRgV6O+13f7NW/BV0eDiClzQnZOqLVBM7BasXhcjoMdWBgxGv0oCvpR4Q1SE0FVhAVfK/6pNITwjMjqcnBl3N4eJfZczfsfbMUCOYLUhiCiUUcD0sWrFjntTND7DMgrB5ZRGeJgFLIC9PuVBNQWMyUdo2HjpLw/sYUDbsad3861QDyPlu2uK745EI2ImdgTXgDhUn8jq0H1TEUw2KyV1shp5wgma4hPEMALvHj5rk7zuOs9n6H+k5CCU/keE8JHoFvufWrK+/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f84a03-48e7-423a-731f-08def93fc01a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 13:35:33.5849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwz2Zs8lSPmfeNaXKk1r/hl1g6+yeQoyD6UOkTi9iACXrRS97XADExoVGbJcoDQ5862X+aRxxIBtAnMYl4SUZa/AjEKYxH4cLjz5twPnK4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7067
X-Proofpoint-GUID: Q1lajRrLNySmO4DslaQcU7K_q1asuz30
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7dc827 cx=c_pps
 a=wck1Q1pII696GML7qL2HzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=20KFwNOVAAAA:8 a=PoEMGqz-s3YqqzmKCtgA:9 a=lg_kUs4zNLcBt-ZM:21
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5NiBTYWx0ZWRfX8wvCV8O6nUDf
 rqm6ZQTPVbiMrfI2HBWx9e7hBf9mTboLXZkDyftSzeKkQfxvy3oxLQjk0eQZSEboWv66WiqqO0m
 s0ZkL9ASniOF0o3/aYxSIPCeGl+4/O8XEPhJSS6E/vMKcj3IolRU/y+UeiWoV9kj+eFlkuVBcim
 RMpzu+dSpIyx2+0aHLDxuGbKF9/sVqGCTmtA1RoMQln61AjrtHQflp07cb1cQHiBT2rk3es5ubC
 GkN90O0zxrmCImdKZBVFbmkLGSXMlF1ix9r4KUrCXzyHNy/RYNTKrHIpJE3xSooO73ZQLhDAG6u
 HfIfu0DNHpIxKnKZ4Ds+Ir6SEhU6Z9/Yq/xh7AeZmmEYhXJMEsnp2ob/lcX0YrqHIoooMPt+vFC
 Ps31zuF8/xFvpIWmM706YPWIlJr7bWhvIF3O10WLwiLZCPEf03zRw/iPqPySoqvVno1oPakTVlh
 o/G5joJEnLf7W2tJllg==
X-Proofpoint-ORIG-GUID: Q1lajRrLNySmO4DslaQcU7K_q1asuz30
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5NiBTYWx0ZWRfX1wsWMwtgr/tU
 4rijOsDc2KjD+lQvC1I5opDZyo1D3xweeE8HCMW8Csxza+3wdNQFFnLQRs7d3GpbTSOfUgC4gL8
 hH+twkDX6bBWXq96FU6NZI6Gvt769Cc+2LGznD8W9ogn/6Fo0iuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 13:35:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243354

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This is a point release in the GCC-16 release series with more than
102 bugs fixed since GCC 16.1, containing important fixes for
regressions and serious bugs.

Drop backported patch 0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
as the fix is now available upstream in this release.

Bug fixes: https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=485623&resolution=FIXED&target_milestone=16.2
Docs: https://gcc.gnu.org/onlinedocs/16.2

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 .../gcc/{gcc-16.1.inc => gcc-16.2.inc}        |  7 +-
 ...ian_16.1.bb => gcc-cross-canadian_16.2.bb} |  0
 .../{gcc-cross_16.1.bb => gcc-cross_16.2.bb}  |  0
 ...-crosssdk_16.1.bb => gcc-crosssdk_16.2.bb} |  0
 ...cc-runtime_16.1.bb => gcc-runtime_16.2.bb} |  0
 ...itizers_16.1.bb => gcc-sanitizers_16.2.bb} |  0
 ...{gcc-source_16.1.bb => gcc-source_16.2.bb} |  0
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 89 -------------------
 .../gcc/{gcc_16.1.bb => gcc_16.2.bb}          |  0
 ...initial_16.1.bb => libgcc-initial_16.2.bb} |  0
 .../gcc/{libgcc_16.1.bb => libgcc_16.2.bb}    |  0
 ...ibgfortran_16.1.bb => libgfortran_16.2.bb} |  0
 13 files changed, 4 insertions(+), 94 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-16.1.inc => gcc-16.2.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_16.1.bb => gcc-cross-canadian_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_16.1.bb => gcc-cross_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_16.1.bb => gcc-crosssdk_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_16.1.bb => gcc-runtime_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_16.1.bb => gcc-sanitizers_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_16.1.bb => gcc-source_16.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
 rename meta/recipes-devtools/gcc/{gcc_16.1.bb => gcc_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_16.1.bb => libgcc-initial_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_16.1.bb => libgcc_16.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_16.1.bb => libgfortran_16.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c5b701c244..fa23373249 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -201,7 +201,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-16.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-16.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-16.1.inc
rename to meta/recipes-devtools/gcc/gcc-16.2.inc
index e2be559f19..790bf7b651 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "16.1.0"
+PV = "16.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "16.1.0"
+BINV = "16.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -44,7 +44,7 @@ LIC_FILES_CHKSUM = "\
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79"
+SRC_URI[sha256sum] = "e6738e29597f733270731aa90600f37ffdc045079dfc27ec7e8192cc81085c3e"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -73,7 +73,6 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
-           file://0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_16.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_16.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_16.1.bb b/meta/recipes-devtools/gcc/gcc-cross_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_16.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_16.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_16.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_16.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_16.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_16.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_16.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_16.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_16.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_16.1.bb b/meta/recipes-devtools/gcc/gcc-source_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_16.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_16.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
deleted file mode 100644
index 0ec8a91ffd..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From c96589414eeb0e46d9fe9cc1d562e048230b5f67 Mon Sep 17 00:00:00 2001
-From: Jakub Jelinek <jakub@redhat.com>
-Date: Fri, 15 May 2026 09:55:40 +0200
-Subject: [PATCH] i386: Fix up *minmax<mode>3_4 [PR125308]
-
-IEEE min/max are not commutative and in the pattern
-(define_insn "ieee_<ieee_maxmin><mode>3<mask_name><round_saeonly_name>"
-  [(set (match_operand:VFH 0 "register_operand" "=x,v")
-        (unspec:VFH
-          [(match_operand:VFH 1 "register_operand" "0,v")
-           (match_operand:VFH 2 "<round_saeonly_nimm_predicate>" "xBm,<round_saeonly_constraint>")]
-          IEEE_MAXMIN))]
-the first operand is a register and only the second one is register/memory.
-Now, the *minmax<mode>3_3 define_insn_and_split does
-   rtx tmp = force_reg (<MODE>mode, operands[3]);
-   rtvec v = gen_rtvec (2, tmp, operands[2]);
-   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
-where operands[3] is the const0_operand, so operands[2] can there be
-a memory, but in the *minmax<mode>3_4 case
-   rtx tmp = force_reg (<MODE>mode, operands[3]);
-   rtvec v = gen_rtvec (2, operands[2], tmp);
-   operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
-operands[2] goes into the operand which must be a REG, so it
-is incorrect to split it into something that won't work.
-Now, I've tried both disabling the define_insn_and_split and
-the following patch, the former to the latter results in
-        movaps  a, %xmm0
-        pxor    %xmm1, %xmm1
--       cmpltps %xmm0, %xmm1
--       andps   %xmm1, %xmm0
-+       maxps   %xmm1, %xmm0
-        movaps  %xmm0, a
-        ret
-on the testcase, so I think it is better to match it and force_reg
-(it is a pre-reload splitter) than change "nonimmediate_operand"
-to "register_operand" because it won't match in that case.
-
-2026-05-15  Jakub Jelinek  <jakub@redhat.com>
-
-	PR target/125308
-	* config/i386/sse.md (*minmax<mode>3_4): Force also
-	operands[2] into a REG.
-
-	* gcc.target/i386/pr125308.c: New test.
-
-Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=c96589414eeb0e46d9fe9cc1d562e048230b5f67]
-
-Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
-
----
- gcc/config/i386/sse.md                   |  2 +-
- gcc/testsuite/gcc.target/i386/pr125308.c | 12 ++++++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
- create mode 100644 gcc/testsuite/gcc.target/i386/pr125308.c
-
-diff --git a/gcc/config/i386/sse.md b/gcc/config/i386/sse.md
-index 51d1e9b455a0..de092f4b9ae1 100644
---- a/gcc/config/i386/sse.md
-+++ b/gcc/config/i386/sse.md
-@@ -3468,7 +3468,7 @@
-      u = UNSPEC_IEEE_MAX;
- 
-    rtx tmp = force_reg (<MODE>mode, operands[3]);
--   rtvec v = gen_rtvec (2, operands[2], tmp);
-+   rtvec v = gen_rtvec (2, force_reg (<MODE>mode, operands[2]), tmp);
-    operands[5] = gen_rtx_UNSPEC (<MODE>mode, v, u);
-  })
- 
-diff --git a/gcc/testsuite/gcc.target/i386/pr125308.c b/gcc/testsuite/gcc.target/i386/pr125308.c
-new file mode 100644
-index 000000000000..0a4dd7c8ea6f
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/i386/pr125308.c
-@@ -0,0 +1,12 @@
-+/* PR target/125308 */
-+/* { dg-do compile } */
-+/* { dg-options "-msse2 -O2 -ffloat-store" } */
-+
-+float a[4];
-+
-+void
-+foo ()
-+{
-+  for (int i = 0; i < 4; i++)
-+    a[i] = a[i] > 0 ? a[i] : 0;
-+}
--- 
-2.43.7
-
diff --git a/meta/recipes-devtools/gcc/gcc_16.1.bb b/meta/recipes-devtools/gcc/gcc_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_16.1.bb
rename to meta/recipes-devtools/gcc/gcc_16.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_16.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_16.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_16.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_16.1.bb b/meta/recipes-devtools/gcc/libgcc_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_16.1.bb
rename to meta/recipes-devtools/gcc/libgcc_16.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_16.1.bb b/meta/recipes-devtools/gcc/libgfortran_16.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_16.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_16.2.bb
-- 
2.49.0


