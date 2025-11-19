Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F35CF397B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11805.1763570909402937255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tB8Q1MCS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vT7j4100545
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JRsEWTuMBSprelalMJ0uO4EWNxXfQq/lGfyFZdLESj8=; b=
	tB8Q1MCS5AmcbpRHH02eozx8g4qkacqAY4BrEIEImX4Fn/VLv2JJaeMEkobld6QT
	3Od7pFE/3XMVJZq3NCCssdkfeoyDgBvZnFsJJuw8rNiNXH4dDoCU7pJ1m6Tq4VkG
	nv8iRTDUuo3l6mOmATOj7yynaAYCmGRHRWf9n2RRLpX/mV6FYjrWt1IFkNwNQNM/
	padrB45JUGQbNemiRgNVjD//F5EG1TgI9NPeDxbBPZMTSMFIOMzRZe3uOXUzOVA3
	gJ0WGbsXgprVk4aebkGoYDKGKS8HWMfQ+mg0sMFwXv+OWk2BvCMx6jEEP4sVvHO8
	L8twQRIfinGBZYg8xWTxIA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBsXHu3Qg4ovFe6MNuq1loEe4kywDD0N9A35OzeIFye601QoZpMVmWAaZpou+1NfjO9bMslz6UPaPnd2aVrYZILsBDz+HYy/CdNrhFk4v7REo1F/EvFvv3MEl+gDx9xj0DHndWU41lKp8nxUY7m92t1lkGEgo5XtMUZPYSzuIdfTO9d6Q0d/H+55yWDP9B/ptcCYlgjL6DBAzaSKEI0p4VftC1EkPc9e+2yZ7ke6lItFMJRPnvu4DYFWk2VGPh/NGuwZFJh6WKHti3VbdnedhwSg740aXeVYKcIyRT9zIMrPWYrk7xcFySz3SMx8/GqKEkg0WVL13AMBzqU783KE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRsEWTuMBSprelalMJ0uO4EWNxXfQq/lGfyFZdLESj8=;
 b=BOiv1izAyhMutkIFIReeXLDUICdk3KzVADzIEmCZlUacSmYRfpz1/Ed+calT8W9JWF6D7D8RRetifu6u3fVtSwMg4vYxFZz8CBIwZykhZhKLm499g/yyPW3LGxObPVrqiEP0CKNM2eHOpOZXnYXkdKypl8QnnWhkzIqe2gdxGuMCSBso3Gf90soiB9eVKagxcBRo/rdiRnWPSusbCzXY0pAsojcCJAbg/r9BMVHm/ONLpj2p4/CzOHhcPr1CAb+JPIg2UAnxfGnbV5VMMzbN0hbSqPdG1vPOBTlfxF1ywt+hfVH16ulMTvcpDqGaL1RQJuWqhZWGFWfov0LYPpiGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:24 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:24 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3 04/11] bitbake.conf: Include "rust-kernel" in native/nativesdk feature filters
Date: Wed, 19 Nov 2025 08:47:56 -0800
Message-ID: <20251119164804.256364-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: adb4e3ec-0b38-4498-2e06-08de278b7442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wst0iU8oUQyryXSd6N/VSMDj+hawO1d16fNWFzaxZsIAxDnljCEFxgiF62Sf?=
 =?us-ascii?Q?QXUhkItgOiP6hgnSU4H7m+V8nC6V6wDyeG6nzxYRlN8HCsHEatIe2PabvqFI?=
 =?us-ascii?Q?AJbIMkdAbXNLI1dtSih5LN+QbCyQbFDjGKklIo9H/Dn3CA4HX/OZ40tx5REa?=
 =?us-ascii?Q?Ir9XIPqLbSZto6Ak+XbaG+ef+RekbEkFEWMpzI3Xpy9STeUlIRYaOXyjmxl7?=
 =?us-ascii?Q?IABDieCr2XaQT1TBUCN4ELHVNj5lpOlTJmq4tc962V1cC2SQTKgystOQGdnu?=
 =?us-ascii?Q?WvvYPgCMn41yxVrn65IFrgrX8vl2gkQKB5aGtRWi21hDskHXRhuLpPlBu8AG?=
 =?us-ascii?Q?QD+odEYWW6pKhoyVXVJUNDECZpMWGrdYdIdCqhyeELHRU/P3AwSQYrcQ3XMH?=
 =?us-ascii?Q?1WOtAC6arwCnk50FJmOgTnFKDpoHaRi3s1T8tSapP54jOPspW3PBg8Iz9Pau?=
 =?us-ascii?Q?HEl77AUv+QFRjjFQedsI1/2duq6EH80EtiTBXR3NQBoSplNTS8wLamlLGHWD?=
 =?us-ascii?Q?d0tppjL6baPTnEZl1QjxstljY8tLjhbyn4zJwtN3VRZVsDb2WRnf109XdWX/?=
 =?us-ascii?Q?F/K7mHoWK/FeYVnghFWQUJvz8QBa53BANqd6heUvIDBaQy9c2fC6nj2UwoQU?=
 =?us-ascii?Q?ZmKW3KWG3lyGvR1rRN8fOlGf1YiTN8ChoDzj5YzSpV8kXeO/36Rw07v57jdw?=
 =?us-ascii?Q?S1WzA6eoW2uOU+XFV4sS9MB8NKzroP691anG43dMr0j0oOgaY5MGjyT8k2/0?=
 =?us-ascii?Q?O7p3Zb0amlooja3pI6Ciimq+6mDS0gC3ZtHyuUR2iQZgOCRYRUnOWflQD8hr?=
 =?us-ascii?Q?/ls/IFLy/19QL4/RKFNAn/2hNVwfbX/VS9ztEL/s0mbXGDifycB+QvtHm7Ct?=
 =?us-ascii?Q?miN+YrIYQB2/YR6lEQgjnfBQjuyRWVqLCqGfXFPW6mQuFLltO87z4jYPPu0H?=
 =?us-ascii?Q?Y8xNx6tQx7B3Mffxydl0rioB6zjlN0iUCA8qKeSu/oOI/TObvJqpUQYFd9iQ?=
 =?us-ascii?Q?ZEQm/kNEvWPwVADWBQSvLmLPBruK2EPI3X35AoUYcdB/lFQFd4lF7LjCE5QF?=
 =?us-ascii?Q?NGD4vq4uyXeFcuMmJPpiWXhY5mFc2sbUyHxykzATraqlE2fmzTt77Y/goLpS?=
 =?us-ascii?Q?sXi4I6MPcQGCVPHoa08f6/tUUrdsiGSVnF0eOemiuNza5sNd4QjJpcEcNxaU?=
 =?us-ascii?Q?LznAN/6CFxlqB1gRsBGlyrtuW5S8QTEsSJ4alOCibyuCx7kzFCauBZPueKMG?=
 =?us-ascii?Q?EFosXEuAi8UrM4Iqse9XYVfoNrTowLL/R0XphmUZoD48VPQKeGy2uhj+lYR0?=
 =?us-ascii?Q?ZzGbYQ291YJrdgCeGQ0hhl7+pCjZWjg5k2s9TB2RsqhWawC+nRrkJFIqtTJv?=
 =?us-ascii?Q?ToGHJdCUsxkKDRk+Z1mshgdah+cghDSefh7lkgBYsZT0veIGu/b7pJ9lzyoQ?=
 =?us-ascii?Q?kdllTNgK/HDukMBCGngUGJV/3nIkyWi/pB6rudeN60l/JQn+zth2ECovOXov?=
 =?us-ascii?Q?fQlazniGyfxCEatcdceNFZ/aqGsYK2w0fED9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M3ByrL/9UMNVjU0IdxWZRReFv9/o0GveZTPH8t/4NNGan6UEEV7InaRIhEuL?=
 =?us-ascii?Q?4gWQft+36ZWQreFn9P5KnGWuxzbl9RTCxI4pWD1BBkuSRUyc5B10Qu2vf74P?=
 =?us-ascii?Q?ERyytMvlRqZ9Vnx1A3mqb+5/O7UomHy0LCEnHElpcYJ9++e7qlgEKQ6qbjsR?=
 =?us-ascii?Q?tE0Q931wn29SWasq0QTmJVrqeIapL3wqDO+bZ4lOwPEnCoYshD6QvzH7rEJO?=
 =?us-ascii?Q?o3ry9ZivCpcKHIZq1blQM78y2TFI72gEujEHGMIbCA1alXj/P9818JK8yw0x?=
 =?us-ascii?Q?ojG7uiT+Kp+Qk3sEEiuSafg/KcaYkbLv8yArSg2LjrLaZyW/ZIAGLTd/B1Ln?=
 =?us-ascii?Q?Jdc/O2BkRwJ3VC+RhygiwV0UJdIAob+4KJd3aUQfT0A+eiSJHzpin2XQB9a4?=
 =?us-ascii?Q?O37cIJISXwMVUVMar3VxbUr8ZgV5+OllBT08cmjDrCsBJrqBCfv6X2HfsLoR?=
 =?us-ascii?Q?24E3ppVGSywQCTCVmIWa66rwjQY/DlOvy0sCB3gisv6fenqzslu3UqxqxRpB?=
 =?us-ascii?Q?ePnaFHPNKY4PrxZ3EvAJVbiWYefcVYbkzCNRyMW+ukI2qh7ZDA+x5i8g7ioh?=
 =?us-ascii?Q?D79EDl4VAgnmAabncgNbJVphnX13/oLszBfOyaxgP1xgrEJmFz5JphaXH3Vn?=
 =?us-ascii?Q?HaaKp27fGU0DJQnsmtyvWzh6bhlQPKyFGO8B6QUrwK62GNYs5ZYo7/ZQIiOE?=
 =?us-ascii?Q?uyqcmICeMv0tQFnWbp40lX3nBcNu7deKYcyZE5WgtC5n2wdOZ6b4ZfDFblYJ?=
 =?us-ascii?Q?Otdgx8qXHM8Lu3/xKqsPo0ApHjc5x2OJBqFnfTxJG0DlnNNTaJhbsTVUlBhS?=
 =?us-ascii?Q?iEz3qtNEzkIL48FHBIxHQo0nYHT4IHTAYSBmuegtpfOVre2C9t9l+8rA3pXk?=
 =?us-ascii?Q?cOK4JYI+QwFgcKNKBezH38CORAc4OUcg3IvGKeeUkR+QtHkP4qX0o8oBJjxp?=
 =?us-ascii?Q?0dx0HP5wvqbi5uyk+ATITm2Ivf8bLxEVw6/OGaflGk1RYSJMacYqSYDe6h/z?=
 =?us-ascii?Q?taK/1ApBY20Ff2/jJPQ8lUO1pyPfvKplGZ04z7mcFFsS0oS2QVUMbxygZTl3?=
 =?us-ascii?Q?4BQ0geaCEZlwmh4n037NvlDdMqRAvu8sVYkqjtxqTa3eDekrVD5TbVGZTG3I?=
 =?us-ascii?Q?Gevaep87n8gtLCzbKATIldfLJL+cWBjwmQihH3ihPgxMlL4k4V8zDHLRCMki?=
 =?us-ascii?Q?5h7v9dQX71lkCfOudPosuiw9nSBrdjsYhm5YrMZvJj4PEzX6bJav/zGSnnEl?=
 =?us-ascii?Q?pRdje8XjeFLe9VRa3aYlFtLMXYINEFTb1nagtbCF33EIBUPB+wZtVianL+lc?=
 =?us-ascii?Q?bbPgWqFbcgbVwDbQvXK1tevzMUPG3kSPBpE/p7jtq5MG6m+6wwMRHDg1fpjl?=
 =?us-ascii?Q?xWKlN3oVP8Z+ttEZbhGpV7ghh7zv41y3EMT6Z9NnWlbRvsCKXwwcWeLEVxzq?=
 =?us-ascii?Q?GUlTaBAl4CFnaRQo3yoNfXT2PNfcCXICq6gVvmLJjMA0MBwomVHmlreraemF?=
 =?us-ascii?Q?c5eJgKjAxQiHWWin5UmLP7yUNF++g/IgzSdz/0IXvGLg6DEbhjkJiiopHJTj?=
 =?us-ascii?Q?7+MkQ1D72ThEtgIWODPPDrnLZvLjjzvTmkrA1vxb0na9t2CMJA+k3uz9EoW0?=
 =?us-ascii?Q?JGbfJ+lGMmBNn9niQ4OYI/E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb4e3ec-0b38-4498-2e06-08de278b7442
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:23.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgZXyoNr7mXeHOGj9AAEyHD+6hRmEx6UsjMdKH+oViYD9TWFLTYsqCiJnRXP+tzW2vWIMm9vGvP4Ez6Yjr2AVR1c+LtCekTM755cT9SQn3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfXw5ZLKyx8LNCW
 BEi454r4eR19IZpS+tpRpe03/lfjibDHypfhW+YGy57yWasKdSOb4vhBE/OCa1GZG3utQmxIXXm
 vmEDzgHr//Yyng9Kb5/ZN1ojw4WObSaZwVGIFXR+kvQkgoTIc2PyQs/XywfgR21ZCTz0CFBqXli
 cjxwJ9ti5hwnI1nFB6VTMdTDTv01GU0PnKGOPFsCdv59LSnJVXy4UuXLXIG2+C+4mL6N1lthMNG
 7xEtSN5DBkZ9yZN06CaS1Xsjz+rL/PjUrA+UEERXqiz37dH7DVEC2JlnoCciattgUC2GXoukeVi
 NpJgW8npk8NtttXiP04Dk9kHWMQab5+azIpLu32qq4eYyLjKRIgydJ6IMhfksJwB2WYnYA6foSW
 qK+jJ4kx4ajH7HLGtIzFodWy688vHA==
X-Proofpoint-GUID: Bqd8T0b7HfTDIxNezATN3TGBQKG2WBAp
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4dc cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xWBQjpzubWhZ7YZo0B4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BZEiikhUYtcd84FvLL4GV6aYQttetax5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226562

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When enabling Rust in kernel, native and nativesdk variants of rust need
to conditionally install Rust standard library sources to support 'make rustavailable'
in the kernel build system.

By adding 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and
DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
propagates from target DISTRO_FEATURES to native/nativesdk builds

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5406e542db..8d6211efab 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -916,8 +916,8 @@ DISTRO_FEATURES_NATIVESDK:mingw32 = "x11 ipv6"
 
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland"
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation debuginfod opencl opengl wayland rust-kernel"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation debuginfod opencl opengl wayland rust-kernel"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.49.0


