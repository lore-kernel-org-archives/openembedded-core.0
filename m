Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1BBE9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 12:59:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13346.1771505977204988688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 04:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kgIGqb0j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6510f40717=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J8o2uD1209808
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 12:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=LvnFf7dqp
	YXirZeMXNTlYqFW6W6a8jKXYC/2tXBISgE=; b=kgIGqb0jO0WWMn4/EVncPUgI2
	cWff3g1yVGnm63m3RtZ+/ca/JGHFRCc1uM24GRRpg9BqzRNigN2iV97m9kUVV57K
	UGJaSMMQJUD/U9yOAph4YSsyFe+nmdebM8bVLhwO2lypxrikGJcWvzkAI91S3r+C
	8EEMmS0CmBzemuPYcQh11K92kgI4kFPCH6yEgBb6PNyAfapgKoMk9cM024XRTE4o
	Xd2CmGLX1M+R7s1fcDavzQobAnJEBCmPor/DBd87mrgGATppDS8/qfGiK8fqpqKY
	LOplJueBVFbZ7s64H262ERQrAw4ThAKRQ+aWv8oBVLxfwAgOqXXL+rLIzSEhw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtwc0b7q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 12:59:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvHQ1VVrhJLU3ddp39+ybT9ZLVAi+BO2AAEkCSbHaHPalbNHJw9VhjV/eLj7IuOiweJ0VvOK6/SWJ8RN+t/O1u0PgZ8oac7JHpawtqvRS0KtudppllZb+vy6auZog5DU7D86p+qdFmGMezE3mI4dXzpJdUNflyNqacqTRfQ0PrlS8YZy3pVUoX/azxnMdR89Pbf/H5d9GmNzu0YElMIJeLs16Pgva+9Ru8yrfRkE3eLxt28QeonbW4IfoNd5HW/GSt9sBzEdgX87iIYKtEv+ILsaPFcwy6uSFEjivWetjJ45v63RpbqmhcVcBWmPjCuBXclam+zDbB6wjH3ML3NEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvnFf7dqpYXirZeMXNTlYqFW6W6a8jKXYC/2tXBISgE=;
 b=Re4aEOV4gWwBlzFIGZpqNBMbhylu9JMsweYSzBCw8PvMnzwa+ZwDI9zwMEyc1yDoi1l1EOxmu2cVvv7jkE8UcmzH1R74mwhyMgx2sHDFzl6w2VEOTHcMKJzG3IvWNdHswDlWqwH6qbhjQnKd6pctBOfePXiIfvcxZchigsomRjJlGdrnUcMiIMTB8+DjZlpqgLaOaF/Rh/zF1nmvbA3WH9Aolcf4DsEMexoHhqUkl1t2plpK/k0ABEdwGr9jIzz5MS5MI5X2bDT4oJpxQOqdXvvd+lGl58FB52lLYqIEd7bvDqiNZoLT4R/UnFy9J0ldxSsP5Nxi6gLmI4A/SoJT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Thu, 19 Feb 2026 12:59:33 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 12:59:33 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, alex@linutronix.de,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH v3] rust: Enable dynamic linking with llvm
Date: Thu, 19 Feb 2026 04:59:18 -0800
Message-ID: <20260219125918.2932282-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|CH0PR11MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dbf33a8-9766-4570-76c4-08de6fb6ba89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6t4JQrLJ2tlygQ7/zTCd4i96yXd0II+rGCbLg2nLzAFQd3njWUm6jms5FLp+?=
 =?us-ascii?Q?8kMD1Cq3u25y5X2G/Ou+l2j9oYKLhQw5XRnj9PGB4JuoTFljoPSmYV9/jd1I?=
 =?us-ascii?Q?aAKVZ/lNkZrlAJp3UlxXEHxdc1dF34rT/vSRmLnrgh+M8EPsODedp6HhsROT?=
 =?us-ascii?Q?jsfupUZ+gX+ykg1cH4lNfj95QH457OcwIXd5ml/6RbpZ6QN8KXyAMEJKs5um?=
 =?us-ascii?Q?YTq0qtNs0IwfLnDbvu5LvPMhKsdcskl8812FB60/zTeXRFacndIodhwlqwKT?=
 =?us-ascii?Q?DKR/Jj56/XOIuEAwTNKo1pQEZtxsaCXAu0HPzUp8A3YQ0yHtuTzBfmxarwGk?=
 =?us-ascii?Q?UJQUmrScp1AjkV8zgZ386/7fY4hwV4dN+0pdEEK4JtTXimUN7J+ABMPPmQ4a?=
 =?us-ascii?Q?vCo8fY+HpuMup7u2T0jqBdrx3KOKLmG5tPHg9sOpdT2+z0ye+zmY/p0utiXs?=
 =?us-ascii?Q?xIqwjYuLMTvRg9SlX4UH2bq+Dabum0TrmPOndDMZbKTsa69qGQ8zdUAnxKpS?=
 =?us-ascii?Q?Y8QaHxIbKA6eq1xTGYOZGtiRZd9NMdKlyxvavzEKt0xHmThTJzjAyNUzDyvR?=
 =?us-ascii?Q?4Tl0WMPecmZCZy9C6Z++KHkmFUljZhpii7VsqEUjF1Vm62cRu85ZlVskl99r?=
 =?us-ascii?Q?0X6UQgtp0wWKChCk25EAhuJBG3tor5JcT7vTLACGwspatcX+6s13myT0T0MW?=
 =?us-ascii?Q?Wa/3mW8a3uL5pXH0AbnfopE9US8jcV0topFYqv8aY3WZ8FG7A7zUx+VAG9et?=
 =?us-ascii?Q?ZvK6f6MgwiQOviK+rVZiLukvcI5n41xnUYLfYYv/1aMX6Y/HfBSjoStkZ+eG?=
 =?us-ascii?Q?dP8qXGlZhX54xh5aOtxBnn6H7HgdS4vUP2JTC3UMLlE14rb1MufgJw/uWHWV?=
 =?us-ascii?Q?unc3QIqkcO3yYbIv8D16eWKUEnHJxltegiEcO+j5fto74IAHc4ALYjcqsPK2?=
 =?us-ascii?Q?ambNCymOHwVZAyRQd3ZffxaA18V1wh6eQMMHa+KW6ZBrcUpi1JU55COf+v6L?=
 =?us-ascii?Q?3iw5Hw7BtLKavazdTq3sdP7tIhv3qQwzi3OXHoNkNklCUVngIW8OffBO0Vl+?=
 =?us-ascii?Q?jRMIz/t3M+ROh6gBezZua9j4SemQK1liQ91XgKXU8l5nUIfVuc6O8mjGG6yA?=
 =?us-ascii?Q?sC1AyRmYNloHAaK/DPjv+Vjph3YtuoyydwoC8W8jhRS+6PmMT0Tq3875aUrE?=
 =?us-ascii?Q?X8xobD4MnpkvsGwBubjSLB1h5WKsAmq4kObSMYu3DUUK+qDtUvYtOZorptHS?=
 =?us-ascii?Q?EmYASgB/v/L05s08aKD+i3Us963IgnJCpBTSjarwnIVTAk5MwcNvQh83moGZ?=
 =?us-ascii?Q?9n/vDHVAMK5n0KVDacPSzvkd+Y7qRHxXx5mjQfyLEZ+CkYgHtxTl3DSa4Kr5?=
 =?us-ascii?Q?0S0Tg1NaFQ044My/PfOU10ndWDV8Ty3lSlMm7/vvMr19cPFtDKEgoC2AvBQE?=
 =?us-ascii?Q?lzXTffJyEyx1iGQqtmXScd2nW0QhR2Y9rOlo+Dz7SXkxnJxHwfnRQjeH/wr8?=
 =?us-ascii?Q?3Rk8kAlDIgX/HPp7Uc9HXKaQscK4ndHWsNaJxCWbkNVPVjASlCC7sxSBBYHx?=
 =?us-ascii?Q?7I7wF9X9MHmG4jZji/A/Vbq7qQjtIrRrgYwrx+YM7rvGWTIkI8yndeEeuHoU?=
 =?us-ascii?Q?QzYNAOans1OY1UyZdgnCJ7U=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VSnGTjOwqN+ciT33lpf/kEigW5IAHfmUsFAb1vHpl4YxnogtnAoPe/DFnhOJ?=
 =?us-ascii?Q?+j6o/Ts7TZ1/Siapqt4YAwH8FGu8fbTaNEszUDQYdD3zZQpehyPSuqxnNn2+?=
 =?us-ascii?Q?eWidSSoJV8kDYjSDztBMRKhHB06yLhLGTl87RIulvU2Cn0S3xjbRkKYrfr2O?=
 =?us-ascii?Q?5kyNOCyDbtjd8xkXcIC5VwQih3A2kbhIh9MG/q3nUu8+9Q0FVrdj5sECR1Y+?=
 =?us-ascii?Q?qcDF40s5JXHnUhnhgSDM0bZOjDSgDWbr9NeTUuxN0B2CkrMLUlkaIEm7S3r2?=
 =?us-ascii?Q?+1ZERklNPNRN/GuPSKLawiTWNeKvai8+CyjbWY4dP4suoQ3IhlzE22sO2G0P?=
 =?us-ascii?Q?TnPqhboJvPvsiUMNvA9imJeO72wOza9e1X+vV2SVjEPLXB1P6/I+xtcjZ+hR?=
 =?us-ascii?Q?oMMuBtUFJmTeIQqsi6TlySKVfKmiZho+2xbW2IMd2AR1Vjj6WdW9/++6TiEN?=
 =?us-ascii?Q?Dco+HF5VQ3rtpqEHIvlLvQ05t1HCCJyFycr1FcyYuf6n7dtVyE5ZxuEQ57qo?=
 =?us-ascii?Q?Z6Jec6ua0se/C44XuJ09FMsTvuygpO7Bzp2c0DTqaPNBXlgGKsfQVbu+H9PK?=
 =?us-ascii?Q?GiHdJC5ctI6+sxqaCsNeq/cE8QIAPcy8ij8OpuHa6ScjM6zk3UFuweKgGBUF?=
 =?us-ascii?Q?UfPSI9zHQd0Q6gk3mTaubBE0MWZwU2cdafu+wM1T2pxOKx0WVhkgYWBXIUFN?=
 =?us-ascii?Q?eqV9w66UQ8s3hhyxhrRiikeBZaspkD4aj7kO9PbTwI2Mh8jrEGVH/gafTQR5?=
 =?us-ascii?Q?XLIukBMItjP37yuk19NPPwIfpgj9lnxuFIz+ANVKLLTzzU8QGwfsW2sKZc/6?=
 =?us-ascii?Q?EFsiGpsUs7p7M7DP0tMnum/XTafsHQXvyBek7JMBB9oSBybZasv9az/z+Uvs?=
 =?us-ascii?Q?NhAP4AiDNe1FuOa9Y/DdyMXcO+TKhEicL0p+szgg8kIfL4+BePYoecuLy0GV?=
 =?us-ascii?Q?zXZ0uej563JoV32k730C03DUTu134y0jUVTQvhQ/GD3js6osVHtGtwvVTxRv?=
 =?us-ascii?Q?3ql7hnd+Li0jIlBLhgPXbR7BwhCXiAl2GU7zya7DF83xpUNW+oIMnVccrtLL?=
 =?us-ascii?Q?m03mA8pY7jKSBhz1CYU3FJyjp6E7iwj+kxC43dbdV2L+KruuO2ju+pfG0DXA?=
 =?us-ascii?Q?TkoS20J9SaSiXhRQgcxaIEwjVZG7RU+srfhcxPGhGH0kR5qjn6g4//vMgMz0?=
 =?us-ascii?Q?AMF4D2UUktecYq65dQqRi/79Y2siCFDm6oF2rUdnslQ7/71nXFLsc0w2Kayp?=
 =?us-ascii?Q?uFRN5yDbSO7y+u1spAUXnJIPThifG5p50dGJse0xkrInmHZ4YRTWqz4z7BL9?=
 =?us-ascii?Q?7OFO7Eo3z/MUa2wDwAA/hfj7y/GaWj0T0xuP8IWm0TCPC8ZiJH7oxNcYq9QK?=
 =?us-ascii?Q?6QEC5CVSMV07oa/SOAKb0VjIaoTZqPLWWnqY4zOtXETCYEnz8abHBBebmpGq?=
 =?us-ascii?Q?E7OC+agh93AMUhoBm+xS9myeOMepHWblln6QNLcBTfH5G8VgeFixpnvxQ2pu?=
 =?us-ascii?Q?oidWX6gkpL6lVs5DKDxwRtBBqH7Z9MlDz8Mh7GkTIvOGxR5uhEwTerDIJi9Q?=
 =?us-ascii?Q?otOmr//jaSByLGNS8Psvmyhaz4OltS9UFhPbQHvqdCmjSke7AoObHE5vXaHl?=
 =?us-ascii?Q?Z+wdZimgj9b9ozqa1Osxoa1bx3vnGdF4L+KTEXaPRwSNzgNNz2JPhCusp/fd?=
 =?us-ascii?Q?CdMR299mYxxbMT+87uLFPEib1epbWuGs2AGUo4tzySW1tWD1vd8YEKaBVlTp?=
 =?us-ascii?Q?JPLmgNHhRIa/N+R0fPUA+qR9zyzy4Do=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dbf33a8-9766-4570-76c4-08de6fb6ba89
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 12:59:33.8333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZzkggcI4Fm+/mgnvp++vxfO8zz1CUcvkvjF75gFUMq+ovJsdOn6Zc46pde5uZtpM427TdkcLt6Sid/F8vd7Lp73jBREHtNoWYYd3ZgoNSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Lo0ygnqtsVmKVgI_8l01-awyLWw8wiwa
X-Authority-Analysis: v=2.4 cv=D+xK6/Rj c=1 sm=1 tr=0 ts=69970938 cx=c_pps
 a=5k1muW5XIJfqWNzrwyhXkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=3QBHEakNnMFf9g1FbPsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExOSBTYWx0ZWRfX3Di96MYlXlBU
 EkgnOv+rWS+Uy546cJifnPNUuqGa8ij4lWfmPWI0KuZhW4txm+LiX9RqF9JPyKrEKBFmP/TLkgH
 MZYBDkv2mwdobJNrv88b/fmbRMTGeySZcILq5OjUDo98/gd2hOdQVi2wDPqzWd1MDWPuDBOerAR
 N6WR4eC/SF2X7m+MqLlGJgFgfbT7uos2+9mqqMsSXjIZlwV0uts/Y3l0xMPTS4jUHzHaGTZhsZC
 grRmpHFEhzWW2+kNjyq2RPGcQEsdM4A1+5uJOnpb+U3+y/s4vDVSVfAt3QQ8GGXntpZnkINJHBm
 ubYVrm2vBIkhORqoVh1d6xpAUMgerZYrVFC6eZWMeR0i4uvL+Mclm2LbnTfXP/dVtS728CtxsdU
 bXtvU+dps/ZvOqq1xgtb6hegZUlh/P5j1ej5BJOWUeVUxW8C5QruJ96bLZEP4EJVHohrqroE03v
 rrDlcbdTAGqkNKHLcdA==
X-Proofpoint-ORIG-GUID: -ZUBB31TauBXh5kz_M0NQmFwTgMaRCZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602190119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 12:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231425

From: Sunil Dora <sunilkumar.dora@windriver.com>

Fixes [Yocto #16058]

A segmentation fault occurs in rustc (e.g. in
llvm::X86ReadAdvanceTable) when reusing sstate artifacts built with
different host toolchain versions.

Issue sequence:
1. llvm-native is built with a newer toolchain
   (e.g. GCC 15/Binutils 2.45).
2. rust-native is later built with an older linker.
   (e.g. GCC 12/Binutils 2.40).
3. The older linker statically links parts of llvm-native into
   librustc_driver.
4. The resulting binary crashes at runtime inside the statically
   linked LLVM code.

The corruption happens at link time when mixing static native objects
produced by different toolchain generations.

Enable dynamic LLVM linking (link-shared = true) for rust-native so rustc
links against libLLVM.so instead of static archives, avoiding host linker
incompatibilities when reusing sstate artifacts.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Suggested-by: Alexander Kanavin <alex@linutronix.de>
---
# v2 Feedback:
#   rust-native should link LLVM dynamically
#   rust-target should remain static
#   Workaround limited to -native only

 meta/recipes-devtools/rust/rust_1.93.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index a25f65f674..2be0bd8d89 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -124,6 +124,8 @@ python do_configure() {
 
     # [llvm]
     config.add_section("llvm")
+    if d.getVar('PN') == "rust-native":
+        config.set("llvm", "link-shared", e(True))
     config.set("llvm", "static-libstdcpp", e(False))
     config.set("llvm", "download-ci-llvm", e(False))
     if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
-- 
2.49.0


