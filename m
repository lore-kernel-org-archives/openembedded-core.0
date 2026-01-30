Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7E8D73EB6
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 03:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2504.1769742606015360026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 19:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L9VpA8QR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6490267fb3=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U2j2U13530660
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 19:10:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GouZxdtJXz3mi+YD37sx
	5wmGk938RmIBZdifqFVMlL8=; b=L9VpA8QRDALqYXVdJn55wc4Zqjv14b5GkUJy
	+iHf4TqHgQrBETcYp7mhm734fo5ahPHLH1zR5/LH43ZcxBeKfYFqCl3kyfhc+jj1
	RLJ/ewzIzSjvgRPGPeGwfI0X0Gyt9ohrHpLLWmmXn0sehnImn7gwzKRC8RYq1SZN
	RPHOgwyaQHAohi4pNCWsfJ9YUQsHEIANoKnM9esYfHUvrTJCvbdwnDVY1zqtsoSs
	rC+FB5Yqxv71MLqsY7tLnjNaaf0oXM788lH5Z1hokna1ryBIA0ntn5khwSeoCscH
	qBxT0d/PrWQAcmZILSveoCGVZpIO2NcKzOorybHqiDKLjfkn4A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrhp6r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 19:10:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOSmchG4tkbX6d/dVAwWmYbRXkV81IRfFr0avWQsA6d9V+elzqup+7rVxGUXJl5p5D1VezE51gjZn6kr2zFfgW5LNZWZNO/17rfs3GSXL4S1FAq7/urV1UmzM1rjdIo5xbSO/aCuX7cqOkKytsj+b9+h7jVtSDpM63Tx0qhSYi1Km+iyaDNOyc/XOfJ71Qcn4iiZUAORv0V0M5d/gKJ0Jtva/chjLp92ljLViCqIhZyJIP3ltQPyICqB97lfbp7l1PHI/8bCf6ZpRuqonibtu1Qz4lp0clrt5BWuhqW/O6NOc8snn4vd0/te3+Wqq0QXxnBm2uzxI3v2glWUWel6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GouZxdtJXz3mi+YD37sx5wmGk938RmIBZdifqFVMlL8=;
 b=iong04TPYEB2PJHiHa8yolPTEObZ1pOuUeUBJV9VBou0u6x5ztp7GgNIDglpdN0th/wlWBuRbmF83nW+Xsz+jYSX8woaSx38SRi0UPMRhPYpsPZDmYk7ixbEbZH3f1H9L4px0AoFbzOHk02P42UORy55/sKoljNgmiztToa5UslAtBWPYDpUIGJ97vhAUa2fWFWRWup6qQVuaFrU0yI0vIIGNQmmF0vQay4ikdAaJ7Ifn/VeMmLNf7v2Wk0Kghx9eehfwmoWR3+IOE2yBjH9jB6qFMkNwokV9hmVtFrQkpKPdEcAYhC+/SLjLtaWYiItHJs3uz3KHklQquEqEIQDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 03:10:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 03:10:02 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] runqemu: restore support to run without bitbake
Date: Fri, 30 Jan 2026 11:06:01 +0800
Message-Id: <20260130030601.388697-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0298.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: da5173c7-7978-48cd-1658-08de5fad0f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7Ha8th29iL+img+2TCfRILQOfqhXBjUPiSVyrqdpfUp0fBj+qNV3gssDW6GR?=
 =?us-ascii?Q?hZ1B2qbEZn7Y4u0afJvncbKMKHHpv9uJyy7VWtzg5eXbAhWPg4WWLVrl6fnK?=
 =?us-ascii?Q?G+aW1o4G/0l8L82bXNNngxYiArzsOZGi2hWrw89Y6ond0IhmTz04TASQ2b+c?=
 =?us-ascii?Q?PCT6wmkE07/p8/2AVI1hMZdaZI3ZmsE2EqTZ3xX1MeSzC4PHIeXWpJgAgNDw?=
 =?us-ascii?Q?08V0vQmueTcm/M41mvoMa5ocFd+pF3pSuIY6v+NMsAYceU+rV8FI31NljgJU?=
 =?us-ascii?Q?0k7Ediy6a8JLpNBwEhTxyqZL/XQoSspiFUfdiXAWchYRktYBzWPG1FXhovok?=
 =?us-ascii?Q?JYkfsUArSWXPrO8WZB7LHXsg3G8ug7hx+DN5+MwkKiymmABhzp1zLkJ/qjPW?=
 =?us-ascii?Q?7Xa12+3wqnmlSJQ7mB5PyXETmCnw2J8xIuYuqdncczQkKlCS1s7YbITpQt1v?=
 =?us-ascii?Q?dEVLWUR7YYYQdk8xNXi2voPiuj5uzvaLqRLiM+Ft9G+XxGse/zOZAQFV9BqS?=
 =?us-ascii?Q?L1+B9YV+fAwgz99NZKrFPGIuKxOZQmy2zHc7Nl4r1TI20L+Ycf9P+r8hl33t?=
 =?us-ascii?Q?BDK8qLErD2lKMrteR3TR/Ornv0aWzDk5QNeV48vGlNtW4X6eAFK/bLzLv4Wg?=
 =?us-ascii?Q?xY1sj69TQSq2kNWx/gQk0SQR/pWpKvhArGSDukw3fxgMWXHEJmrjaTN63i1j?=
 =?us-ascii?Q?2hOOq4s/bEreL5ZtKVpZj+BKM71C0L3WJ2eZICVTbys5Dgi9/4XQMg0N6my/?=
 =?us-ascii?Q?gx8r89C9ohOq7NZRlO37WeVvH1tFwp/+4ZmaZ1V1Qg5wShcpk1wu0gtvxHFl?=
 =?us-ascii?Q?WW2EOyqJXs293lX30jPpD337wt7ho9uz5r7DOGS9XmUh149Pj2lODBW49H89?=
 =?us-ascii?Q?4w+fiRVIsjBUkHJ5hUk79IL7+yLi1iH0Z7cwvdbXw2lNV+3oaY3TnXfDV6uR?=
 =?us-ascii?Q?SqJaf0A09N4GB6zTuC268lrfVMnncTmrXpmumgWZ1fydoboxMndylq1uqtjn?=
 =?us-ascii?Q?AEfqGmzwFeDv0WrN8rBedSEbsfioDXm4j5pJLuHAh/hVYoWQhT7HqVUA8qKC?=
 =?us-ascii?Q?ySif5dpcHoZsB1GR92YwsEjkh+xDDOTYc/KfuG4LXMww9e5OIQREwe4Hm6li?=
 =?us-ascii?Q?DdnlGrGJeTAiJYUcSG2WwSI5sx9+JW4lYDJbScaFOqyTX5ARvnFsdsQ5XH17?=
 =?us-ascii?Q?FBSXmEcIBY6w0odtix63X24wkP5rlfIDJDU39FgdaDEO+jPG/VW2IhJl6SFp?=
 =?us-ascii?Q?a20v23ACaqPkCaZOEIRFEQPFNPO+5HKtqFs2MuPBX1ZV2HsqN9DSDyoBmSCB?=
 =?us-ascii?Q?fgenIo7N52B2GSSBFI1v+DcPW/rzPSji7XC/KRwztBSPVLX+RAhuw/1tUz7X?=
 =?us-ascii?Q?97YO+UNMrxxXVtmCTHYu6eY3IYSMrBMJXGhsMR4TbwuwatVzgZf/6+eHX/4l?=
 =?us-ascii?Q?r7gmR4m5ZdBFwL2Xi4mAQYzmCRIkr4t3qwePYjmnGYzbduYyHfbIcdrv0bnm?=
 =?us-ascii?Q?47L2GIM7O3WkoIvAVzOdntcIcyRGVqPi2xu9uob4lIgUjjpXcHIIf1aPYKN1?=
 =?us-ascii?Q?14rAi3os1rL2Diqozgv7eRyp3+3j/Achpi5vyxrtfFY1f/xuy49cPnqU7YjM?=
 =?us-ascii?Q?7MQL87T9q5tzgLDgXj0Hil7tt0ImFRy1XzGj45Stv8sP?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mnXdQePW2uGHNmvd8r09odQexcdWHJdKJ+n/dyzVIWFIYeKWqt1qyyjAkmPl?=
 =?us-ascii?Q?Z4a0aXJngYs+k5E0OG4rBJnzAwASq0URLPegzJb/PsS8Zz6B2p/usD1s5rvD?=
 =?us-ascii?Q?J+9uKOFAMoPAUtOGj1gmt+XtxeV5sb9ThQoT72Taablmg7tNe8D26y4vJiE4?=
 =?us-ascii?Q?xxQe5CUu3G4TeenwAjBBI73EAxhZGaUStKPnRJflEXmF8E4oHMvQnPliXh/+?=
 =?us-ascii?Q?RoYihXGyka5OPjL/uLRRJ1XlQ0bzt0FTuV+qRGid5YsifC++E44co9lzQr7l?=
 =?us-ascii?Q?+D+XZqDD5lzsmsSbP6FZDCGiPJJAzb9PMZqKPdRRx63xUfVDl+htSGq85pHc?=
 =?us-ascii?Q?9ewcqZzH4Vo2ceIKBMCHMqGCJXx4JyTL4T0Wz/ZNiRztTyZj5k7p9XIxi+1y?=
 =?us-ascii?Q?LHB/L0x5XWJ1DMGV/k4J2DdVH4RUQMJYZUXwM6RvwWoge6Xli24/dPgGEZ6A?=
 =?us-ascii?Q?lBy8I9XQkM6ZuPk32mNHPQLPRS626ml1bl6U96BNcAPGw1oxnAEHhld58phu?=
 =?us-ascii?Q?EjC34YcmrIiiP2gVDmIciq5OewD8C7LvFS2hRDgVWupaNyrpQDIlDBOj6XIQ?=
 =?us-ascii?Q?wElLxcR907Z2DrzSJnRfiqD8HxjfpSNrbjhabmJUICJOG1QNIPxl1xuwngSl?=
 =?us-ascii?Q?Uo0Ejh219L2nRsj3DhlRfbjTPcSZXRuGUPLw0zW1e3hy6eEiRbf892EktKDW?=
 =?us-ascii?Q?5KFTz4fgbVujP+iocjx3i2urB4Zuwbbmf5G1xSZib7Ypdw22FVlpJJPQ90HT?=
 =?us-ascii?Q?wsMAHdpfJPYjDb+/a/sRJBxX+qjirIk3SYLesmBBuesEj5NG5USfvAAeFTH5?=
 =?us-ascii?Q?L/kyabb34fIiUNodU5OQMGrMusvplcwrw8L1M4VvpavUz1GE/FaZm88/Fams?=
 =?us-ascii?Q?HqDz/OlMY2ulYY4/CdSXped6NkyWIX2oHKpsHhOcbksgPxPDuc8jLdcFoZWw?=
 =?us-ascii?Q?fAbgyiYhys9CLMzlqdctYwcpFTtd34D44C2zXlMHQ47tg6EuhMgtprbEq3j9?=
 =?us-ascii?Q?l5ROETnTTb8j6fHMWOm3r/Neydzm2R5hV0jsupT0hauddAfVc9vukq5FcQGi?=
 =?us-ascii?Q?uxiADTdBDkunN95KOXxaXCF+kBp68XZ8MDOutZBqekHqGlmwX7yGXCfiUdgg?=
 =?us-ascii?Q?CvwDRARB/BlrfHoua2DJLeBVHAWpxY5WvxzGdT2zp6+DOsB38H/0+/cJ8QiW?=
 =?us-ascii?Q?vOKZr9EqMzQGt+r8zIrk5JFo9K3T5fNgKT9Vt70918VhVCwNmeWZl/Bt0S8W?=
 =?us-ascii?Q?xdonkX0hhUYRXymlLns5TaXvuOn2Znm1lfPVh2NLxo10yxU3Vv3tPQatYONu?=
 =?us-ascii?Q?aDR2Z4YhC98NLMsqzQJXN7jnwfg8DvqmZ7PPrTBR5kwauA/WE0iSJAY4Dgcx?=
 =?us-ascii?Q?XPYV7zgO2Zkb0tiqvx/ahOTPPvf+94EF6/jEMtOphP7DbOH8iPOl7UH0PQXo?=
 =?us-ascii?Q?utSazZ6ig9P9jX/FRWZeIj301n/3RMlEgEm/3jmuqgITSCfXZxw64fH9aM+T?=
 =?us-ascii?Q?v8Mrm/9RsPp49ctq0+5/heXUonjbIQrzq03MlfJF75pS0GAY7gr9vlUsuOGL?=
 =?us-ascii?Q?bRcWthdTeyNUpiVTQguvL4s04sr7TVX8sbnGlzXas7i9j3WJdo2jyUd2VHOl?=
 =?us-ascii?Q?XiMNyOuJfv0ir3EyTphtHpT0B43mimwqLThyfLm+cdK03eighmyb83mi+TaE?=
 =?us-ascii?Q?G7LBkodM68OmixTJJd04li8j7UadcB2YTtSZyaiWpcjZYmPD+2fLVgi8fi4Z?=
 =?us-ascii?Q?iMW+ggLtPg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5173c7-7978-48cd-1658-08de5fad0f63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 03:10:02.7466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30j4UovvVfxPGQ+bSquqYvuYRRreR2QEN0SrlOOiaGqtiFnmX2ci8qp4JVPIXyKjcUAmniFAqPomvS37x5jkAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
X-Proofpoint-ORIG-GUID: X3lU-d2VG3L317BfKS2G7FXZZlIBqw3P
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697c210d cx=c_pps
 a=wMiyO8M9v1WpSot1jLKY+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8 a=zQ7-ZQ-WnlbicCDkwTYA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAyNCBTYWx0ZWRfX4sPmSlnfXSk2
 KQeGyUUNew/hZrb5w82juHv7m8X/UO+dWYJ8sFsBl7EJcs4y1fz2xxX3NFesVvqTBuEcKU9SRRl
 vXUo4JTh4udmc3Yim1PsW3sKiWlElrLF3VIWWdfPTgFvqpdaZqlc1mzy0j2W1ItJqdqmcYuo/RW
 dTWrh9A6ACu+JDRmaibcLNZ9YHMfT1muSy41TXlzay8gaZ66VnKHKMP+qrHJ9nMNL4CuTxn2s8e
 ZbsHptWxmsvBez8Y3+2zR0Y9Om7w0sBjCEXBoBqAANwoTCben34pPy82wPYAMKqCY+PAGWvdreL
 769FPMRPxoufVZ8v8GcOF7Bql5R1/8MTOJ5nTgYaFewX00wo2OVre6AWDPOpCoDCjO2xsva44V6
 AxSdMoxn9OWgN7I1qoaKiIp0SMzXOyvHHFtQ2GpkWyebkAH2Rb2HZHv15126wx9pAcllMzJlYl8
 aE3U9a0qejV9Y/n0drA==
X-Proofpoint-GUID: X3lU-d2VG3L317BfKS2G7FXZZlIBqw3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 03:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230176

From: Chen Qi <Qi.Chen@windriver.com>

This patch is basically a revert of the following three patches:
- 0c10a78796 scripts/runqemu: raise an error when bitbake was not found
- b931f74442 scripts/runqemu: remove the code block that works around the missing bitbake environment
- 8197be4dd3 runqemu: ensure that bitbake environment is either returned, or an exception is raised

The comment is also changed to reflect the current usage:
"invoked from a running bitbake instance" ->
"invoked from environment with no bitbake (e.g., SDK)"

This code path was deleted by accident based on the reason that nobody
is using it. But in fact, running runqemu from SDK needs this code path.
Such case has been supported for years.

A little more history on this code path:
In 2016/09/09, this code path was introduced[1]. It was introduced
originally to handle running bitbake inside bitbake situation.
In 2026/09/19, running runqemu from SDK is supported using this code
path[2]. This means that this code path was then needed by one more case: SDK.

Supporting running nativesdk-qemu from SDK easily via our script dates back to
more than 18 years ago, as shown by 'git blame' on the nativesdk-qemu-helper recipe[3].

Using runqemu from SDK is useful. Here's a typical case for it:
Team A build different images and SDKs for different machines and copy them to a central place.
Team B test these different images with different methods. For qemu images, they extract
SDK and use runqemu from SDK to test these qemu images.

Below are example steps for the above qemu image copying and running process:
1. mkdir destdir
2. cp -r /path/to/build/tmp/deploy/image/qemux86-64 destdir
3. Install SDK to destdir
4. Source SDK
5. runqemu qemux86-64 nographic slirp

[1] https://git.openembedded.org/openembedded-core/commit/?id=1e8165ea2f19aecdc03ccd102ee44ef0544f0f39
[2] https://git.openembedded.org/openembedded-core/commit/?id=93649edc034f2540ff55dc9b41638797209cfb9c
[3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 47 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 32a3d6296a..7e3d11f653 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1007,12 +1007,34 @@ to your build configuration.
             if not self.bitbake_e:
                 self.load_bitbake_env()
 
-            native_vars = ['STAGING_DIR_NATIVE']
-            for nv in native_vars:
-                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
-                if s and s.group(1) != self.get(nv):
-                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
-                    self.set(nv, s.group(1))
+            if self.bitbake_e:
+                native_vars = ['STAGING_DIR_NATIVE']
+                for nv in native_vars:
+                    s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
+                    if s and s.group(1) != self.get(nv):
+                        logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
+                        self.set(nv, s.group(1))
+            else:
+                # when we're invoked from environment with no bitbake (e.g., SDK),
+                # we won't be able to call `bitbake -e`, then try:
+                # - get OE_TMPDIR from environment and guess paths based on it
+                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
+                tmpdir = self.get('OE_TMPDIR')
+                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
+                if tmpdir:
+                    logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
+                    hostos, _, _, _, machine = os.uname()
+                    buildsys = '%s-%s' % (machine, hostos.lower())
+                    staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
+                    self.set('STAGING_DIR_NATIVE', staging_dir_native)
+                elif oecore_native_sysroot:
+                    logger.info('Setting STAGING_DIR_NATIVE to OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
+                    self.set('STAGING_DIR_NATIVE', oecore_native_sysroot)
+                if self.get('STAGING_DIR_NATIVE'):
+                    # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
+                    staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
+                    logger.info('Setting STAGING_BINDIR_NATIVE to %s' % staging_bindir_native)
+                    self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
 
     def print_config(self):
         logoutput = ['Continuing with the following parameters:']
@@ -1691,6 +1713,9 @@ to your build configuration.
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None, target=''):
+        bitbake = shutil.which('bitbake')
+        if not bitbake:
+            return
 
         if not mach:
             mach = self.get('MACHINE')
@@ -1707,10 +1732,6 @@ to your build configuration.
         else:
             cmd = 'bitbake -e %s %s' % (multiconfig, target)
 
-        bitbake = shutil.which('bitbake')
-        if not bitbake:
-            raise OEPathError("Bitbake is needed to run '%s', but it is not found in PATH. Please source the bitbake build environment." % cmd.strip())
-
         logger.info('Running %s...' % cmd)
         try:
             return subprocess.check_output(cmd, shell=True).decode('utf-8')
@@ -1722,7 +1743,11 @@ to your build configuration.
                 cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
             else:
                 cmd = 'bitbake -e %s %s' % (multiconfig, target)
-            return subprocess.check_output(cmd, shell=True).decode('utf-8')
+            try:
+                return subprocess.check_output(cmd, shell=True).decode('utf-8')
+            except subprocess.CalledProcessError as err:
+                logger.warning("Couldn't run '%s' to gather environment information, giving up with 'bitbake -e':\n%s" % (cmd, err.output.decode('utf-8')))
+                return ''
 
 
     def load_bitbake_env(self, mach=None, target=None):
-- 
2.34.1


