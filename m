Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597B1D10376
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 03:19:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4908.1764127166403307765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 19:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bzEQR6p7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34255b970d=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ3Hu9v822493
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 19:19:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=YDO8wpM+STjw6hS2nDyo
	eAT1h8ug8cNtkeWRq9lzH3c=; b=bzEQR6p7SrpbNUILS4SjVKi09xkRD4/NzGUE
	V3Lam7hVVR05BgqIhiTE9hSid1rlCMYznKt0jZgZbI2O109O2ENedagdPnNJuHZ1
	IHcWAMfyhUlka8R0FItJt5bXBloDk1lBta6e1UmBPfBJZJol2EiJdQUl/VaLYlWf
	LPgX0KVPvuF5pkgDZmg/NBIe5SNKMptWy1gK7uzOwE8N8QuvO3waVXAPMblOon9A
	H1tzghSLwtjmHea5BWxPfTxR5j0OlA07K7vc5sgHPSPJc0ncS3bmi1tucK9bFlmA
	goOJP0uZgpEsh9TSD7KiXTZ+JNL+A83lK/WYeyLW81wIl2nXNA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjjbp7w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 19:19:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOPmLXS1ATw5kC74wOOz1hamnyI1mOBIUcOyaTiVEjpMBOXFaPeLo38x7j5iVr7rRkPgAFRn1bVQwY1uck3aRn7NT/F8Pr0btUk9M1rh6kiocgBdgDhTGKCX//ZX1BtU6dkuaAHZ5AvliElMgUe4Q3Sn3Uk6iWMqLahTwL59oNcVpeULeRdPMAw3OLKzOPASsiGq3vEwL+Y45xiJmI2Xp7kGz+4cfRxtZcVlj/ZkhkYFwxAmfhWoo0cH3P9a62fDJ1fT+S24+slcTCgkw/Nm8leT1sxx+uP6YjLRJ9mr52pgqR+6e9N67wVKEjPXH4VzG04pLaTxxspTk+60WwqhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDO8wpM+STjw6hS2nDyoeAT1h8ug8cNtkeWRq9lzH3c=;
 b=y8c0UEwItKVk3LOkbziIYGiSq0ietOSPSk2Aagm9Qam2c4+wd4JjQPdPX+INyNrut/begZx9p3VUT0mwLphbj10/JVnbshwGvL+S203XQtOvxtyrHkLUifemUF5nXytLLVFQgpDjQ0hRNeIrYu/Eddl/mNlL0mMihJt/qrWCfGQY2DRPxel6yW93Ts4DGElDsjGns+Mh/IKVocZN/MdvWwyRJmfUbDdFiC6T/kKG8Mbp0iLWwCZOkRBN+vBTVKlgcMtAeI04nGgQatukJbAtTb3iZvLvYSFoKgwyXZnvryWiplGaSD88+cIroUd4LWuWuPF/hvhTRhQg/oBPbsyA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA2PR11MB4843.namprd11.prod.outlook.com (2603:10b6:806:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Wed, 26 Nov
 2025 03:19:22 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 03:19:21 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
Date: Wed, 26 Nov 2025 11:19:10 +0800
Message-ID: <20251126031910.3077174-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA2PR11MB4843:EE_
X-MS-Office365-Filtering-Correlation-Id: 8026045c-0d8a-4b02-2aff-08de2c9a976b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?of4sDa+ke3DCTl+uBkjRhfB2wQk2/v9yIojV85CuyXsAKHP+lTBP58kzADx7?=
 =?us-ascii?Q?3OWcKF/Q7vDcXo4alxKj96XKWn2yKYBx2vrUoqPhWb8ibLHLsoSh8eD6kMPn?=
 =?us-ascii?Q?A3sUYSRZlZwixnR/IoDzkGPznnJ+xRaPB+LRMZ80VWTKfbkvbh/lbl4I0zlW?=
 =?us-ascii?Q?U6YFMUJajxGPHy0LKwozqIuXmU6t6BdEDPipiI8QscrtdUhMOHt2GSufxHPF?=
 =?us-ascii?Q?zQ54Oi0tM0A1X1rgebZIBDNABwV0JA46Ten/F0SV0MeG719klYR1ydM9Zc/M?=
 =?us-ascii?Q?vr5ZDzvuI6LUidXWtJ2l9sI50dHCPnCnXW1W0zYpB02bopLR/Rkzwq0AH+H5?=
 =?us-ascii?Q?dD0iFQoEZZjqZvapm6TitrcMv4y0pSjdi6jbNsfkqRPvhXG4zgkFrE926ztU?=
 =?us-ascii?Q?e2KJg2k81mKJ6iAYwOzigcv50WVszMCRxIF6cvc2d7xGj+bwJMpKUmNcH8BN?=
 =?us-ascii?Q?h/40FO2LpmTyEyy4iDYeM52xesKFuzuPcaALUW4qEMTZfm0+uPKpd6Sr8CT8?=
 =?us-ascii?Q?E/c6FfD4SS8LUVhoc+mlSNIhZNF8ZizLfCq8g8llG1yT9RMcfOBYQISIGFya?=
 =?us-ascii?Q?LHg0cWUtsC3ycjH3Quy/5AAqwmGB6iUSXX3VlWAyi/t1QS+IcckVlwEgOoCE?=
 =?us-ascii?Q?cFBsG0gaPLsM7sigA2JLNWdZ19ctwVFDrXsRUbrOcaz62qLh0wtLt8Z8aKXI?=
 =?us-ascii?Q?v3gx1op/YPAuwyEVAhPE80+0YkrN0V1sL3qZdpOwM2Xx7geHdLhJp/Hcqotx?=
 =?us-ascii?Q?eZerLnO90uD5PY4pLGSkkkblZOJsjDgSZhpBqHCSRg1KJSCvo8W3bEgObdyz?=
 =?us-ascii?Q?AvhF1R6g1zpKAwapEkrkhPrbM87szDW/tHSOA8YY1xxcoY3ck1EXHCfrUGkn?=
 =?us-ascii?Q?tbx3SdaMn7tfSGfq6TNtRf8hHCTtI6Hzv8l6znZUNn5Q+cwC73xJy/H5lKS+?=
 =?us-ascii?Q?gWCkAFjh9qYS6xrvb+QILT83F1MnYzplaYvsbOVZAGnqKH5qWxZTmgQtgYcQ?=
 =?us-ascii?Q?ZODD+MlkMJ6YtXcDgC72WNNUwlT8190APnq2TtHv6w336TndY7aYJoJLVR7K?=
 =?us-ascii?Q?YOp1/T4/EJlCvXLs8l38CKHZsE+iCPR5vbPrreoiTy4kaJA0kag1JKy2Bm8u?=
 =?us-ascii?Q?6weCic+2MN0ssaR30x0/xLMVZGHpwRx2JwhMiJ232ZdsQwUCfa5fPA13dIgQ?=
 =?us-ascii?Q?E4a9BiRWQU/2G4BjutkDVZdF57GDU6oJVgJtuNaw24kJJyO10Bp37uiUJNz8?=
 =?us-ascii?Q?Pd5O36swY50u6HxNQO8L3ngfr6YlxxIqgSxdbSFhahn1imE+lymPysTixHup?=
 =?us-ascii?Q?0yAuvnbQxxIi51ETw0sraRwgMi6ykR9m47Mai4KOZqsjq+QrXBlnam5hKdve?=
 =?us-ascii?Q?Q++hcDJqo/QiSmNicDAQ8KYtWlhThmf46M5pczK+ROa5/9a1hfrJMikdnPMV?=
 =?us-ascii?Q?Ra47bM/uFyUtixo6bcVaugH6trqM1rlFc0TuVSXc6xhWy6GuyJjP/6sGXKmM?=
 =?us-ascii?Q?HojpVZ7JkDEbJFtpZRGhScNfEJO4TvzyvSR1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aOR/Wz8JLSaQZGghao8bLm3PuvJwpPq4tLHPbzkdy4dFkLS2gSFNjtKcK1is?=
 =?us-ascii?Q?AZdJWTSo4BFvPIsfwutRwOyTmOfUVOn5GTZmD0r3qrrUlO6RT+G5/+i4vTfJ?=
 =?us-ascii?Q?qKgPHHdRJY773WbcU75DD/mk31gbXUKIZEi9/yDhr9T1B/qm0zeSj4Eoraec?=
 =?us-ascii?Q?safsao6gAO6c5VCwt3jrZx53cpJ4HBwCMELm4xn+ZMn7YFJU5aFnRJnaa5Zb?=
 =?us-ascii?Q?HxWGzsQOwjalcvRkIRnCR2/svO8UO8YW+ZhhX7/TKt0f323ecEfePE+c8PPE?=
 =?us-ascii?Q?e3eaDYfL9YTm4YYMenFe/RtO44l5Lp2mN6+fU3gg4R3VkdKVf++1jkT9thfk?=
 =?us-ascii?Q?mdkeoQTShFjax8p2k7suv50r5EGLPLRHNX4Sz3naeaJuGvqiFRmeySHMcq9A?=
 =?us-ascii?Q?welF39WSu8HkESO6O6chymxkASozx+/Ty9bYGLtjPxyhVmDnPQBoOYvr2Kd6?=
 =?us-ascii?Q?kYrkMbT/PvphqxvfThUD5hpuDN73hQcuN0gWM7ozDLKfWXWH0pKsq6QVGzMS?=
 =?us-ascii?Q?gPSDUE4SBQCkhkmG0JZz/r7o75xnsBQ1K066QhILl5GSkDw24FgqLMiX8H6v?=
 =?us-ascii?Q?Om8zhXUOJAjI4uCyUfrkVpWYwpzpUJOqQKW19UTIpLIk/KK6v/Zu3321Ufiz?=
 =?us-ascii?Q?VcrsyBWq/icDfgpmeISt9URmuca4Pv+k5Fk8VtJX0wa6krlHInDudPnC1bAA?=
 =?us-ascii?Q?iQoayGVTsOnXPhBdadLHLaUfin/zII7aKtpcsYsqQq2EB9pxoGY2cIg2NdmB?=
 =?us-ascii?Q?CXpXI11iqnk8nk51u4X8nnwU9SMjL4uSc2PaWhFVyxNpsnFtggvpjRXJ1vt0?=
 =?us-ascii?Q?9Ui0KmM8iqQCZirHWuIOOND3SA3p693sj8r8/LC6LkgyCybfSS2/f8hQvWeo?=
 =?us-ascii?Q?Zq6c8VrmqSEXTwCP+3UzRVaoxMepCKJ5KzFG2OW4IUi3IyW/13olP/bcAr37?=
 =?us-ascii?Q?ywo+W+UWfpLsI6eDRKg6gH2AlMp2tHHtrAFpTJR0vVidPcL5IgtLSWO+C5aw?=
 =?us-ascii?Q?WzqAmy5zV1m+cx2Sg82LaR+Ewq5WzIHm91+s6EzVn9S1vm7i5mtCv28SRsSA?=
 =?us-ascii?Q?Gk+a/RUn77nqpQR9pLbYHDVsBOk1I3Kv2JtOb621rWLRii5cMUNHUxbw2d+0?=
 =?us-ascii?Q?DNqZUdpLDioLrxRwp3QzDE7v69ALU9ks8i0SSdD1iUwazGkhTVK4WdcukTB5?=
 =?us-ascii?Q?NWLqnYB6P6oHn5B4DysAtuq1gsy8ERRyaOlgPPvkjHSbUd+7vKUtZgShZuis?=
 =?us-ascii?Q?bAJC3j+Zt4JQINRN7pwcuuvXXaZNCS0+epf0YF1mYzoIHAF7QcOaRIagzJtW?=
 =?us-ascii?Q?RQNY3hKrW5aIqIa6vXL7hYHz4qhtvM2NL1lSpdcUFXFPgFxdp1K4KIdv+SQW?=
 =?us-ascii?Q?Hv1ZrlPryDqVS/VgsfEtyo2ZrujndfjHneJGCBxT33p2LPnI5TjxDwgzYMcN?=
 =?us-ascii?Q?4j5AnoTrT8G8fX7XcYUe9fm1QCGegFG931NZApDUUx/GhZDy5CVDdQCHL8hx?=
 =?us-ascii?Q?ugMI+q9X/xXUt8mUtrdVq9JEu6oyDyyzlf0QJEHZ00vEJyio8BDJBne34mlD?=
 =?us-ascii?Q?bBu9oZYBTEUKr2YcBbyom+dvUcvx4MDTVxOA1cVtBVURhP22jZ8regOSCODM?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8026045c-0d8a-4b02-2aff-08de2c9a976b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 03:19:21.2338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPC5pfBZle2od1J7sFpTfig0qSNCwQqfGuJxSr8f+V2JuOcPqBONwbWrPBcPX32LSrYkdCCcjctoLv1+R+JPFAIXR/vsB0fAKRTOTzLz+M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4843
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNCBTYWx0ZWRfX9GFSy4MUSYWi
 HOfCElI4LvlCGye4fN/RV4dwvx0Bxgd4N2sf7bKHZcBSSEZt8eLJxPnkLGSu6wE6zAtoru1jIm6
 /J2gKOb46Y4ULyPiZldvGeiHRSn853L11wp5qRuW8I3EVsGtHXbRqGQzRoBM4qieblx9D/8LgXL
 0agCDqcz3gyYFYh06uPxTkbA7mll23fPc++b9HCdplKKc/80OwyUP0aWlHbE4BxDh4rwzox9ZS0
 W0HvhD23LoVUi0XmuD6r4+4fYHvf83bycAjSIjSE1x7ZMKKMBXHoJxd03SGptvy3reuk6citzCv
 garHQbPTRM10aW2itNKNxxKt0yPiedqiUp1L81zYt4L0cgJSibfYbelfRWboUXQKOw881m8ebBi
 SROgceYn5KnOAEAtAo/0qCvxgbkt2Q==
X-Proofpoint-ORIG-GUID: ftsgyo6hdFBdAKlDb1sEFvXA3I0EDmH9
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=692671bd cx=c_pps
 a=5QB7A90Jg1Mn+JdiV6um6w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=EGT90o0UXxG8fNoLQNwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ftsgyo6hdFBdAKlDb1sEFvXA3I0EDmH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 03:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226797

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changes from version 1.6.50 to version 1.6.51
- Fixed CVE-2025-64505 (moderate severity): Heap buffer overflow in `png_do_quantize`
  via malformed palette index. (Reported by Samsung; analyzed by Fabio Gritti.)
- Fixed CVE-2025-64506 (moderate severity): Heap buffer over-read in `png_write_image_8bit`
  with 8-bit input and `convert_to_8bit` enabled.
  (Reported by Samsung and weijinjinnihao@users.noreply.github.com; analyzed by Fabio Gritti.)
- Fixed CVE-2025-64720 (high severity): Buffer overflow in `png_image_read_composite` via
  incorrect palette premultiplication. (Reported by Samsung; analyzed by John Bowler.)
- Fixed CVE-2025-65018 (high severity): Heap buffer overflow in `png_combine_row` triggered
  via `png_image_finish_read`. (Reported by yosiimich@users.noreply.github.com.)
- Fixed a memory leak in `png_set_quantize`. (Reported by Samsung; analyzed by Fabio Gritti.)
- Removed the experimental and incomplete ERROR_NUMBERS code. (Contributed by Tobias Stoeckmann.)
- Improved the RISC-V vector extension support; required RVV 1.0 or newer. (Contributed by Filip Wasil.)
- Added GitHub Actions workflows for automated testing.
- Performed various refactorings and cleanups.

Ptest successfully passed:
============================================================================
Testsuite summary for libpng 1.6.51
============================================================================
 # TOTAL: 32
 # PASS:  32
 # SKIP:  0
 # XFAIL: 0
 # FAIL:  0
 # XPASS: 0
 # ERROR: 0
============================================================================

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb => libpng_1.6.51.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
index aa2dc99f10..e499f61ff4 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307"
+SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.50.0


