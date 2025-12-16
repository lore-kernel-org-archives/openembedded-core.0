Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB1BD5CCB4
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 10:03:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19027.1765879397863812503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 02:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tCHDjhMZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444573d0be=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFCGHoE2623297
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MIWATIRkJ
	7fj+ouFX4NiaouBLWjsYsgKENoYZaYmVUs=; b=tCHDjhMZGtX1pMOTuHZerQ+zM
	2nvWrYSXjiNCL+vW4GB3hq1/a5DJlgoNEitDgYqyECvZnGVEuq0zflNc6DDzGLwm
	22aPJXmBj7dNoSuF7ahjA4bNhYogQ+HCVzgmZDhj9FwTQKBI8sbA/b1vavykKL41
	RiI+qaI5pq786Qv689uqeRCD9fC/FoXWfwNPVIzUa8S/x9hN7Tj2TsoOf5M3iEdS
	Kx7deSIVp/2K+zfVpIOF0kfJARrL4wL9nrIwkp4EWsFV3cFOVMHWSfze+45aPWtT
	YRd5nmkgw04McUygvNmbKfmBzdRXwFywFI9MVRocNnSwidNmBl5DLdqebcccw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0y48ay38-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:03:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6MNtu+/cRwriRpun+WIv8VE+ymLlDkiPGvJG6RXqhPRhYo8FvuutgrIRfFjTnRD5pOLEC/KsMkCcduG5KF3zsN3gaDCewD2aRCbVpwZD25wxNEmr1FZgnjfkWEdE4zPQlXiwpya7l8N8Ccw+a6EXzq2qPS4wQhh2p2/pDXpK84THJgI6B0wOzkQnKwgxbhlGt27ZRXtHCRrRvdv5yPvCumNot0wo/X9Atf13PFKWOhrzdikcM9/wIl3uAYw1lt1k4Kr+Cqkxsl9mzNtzTnMw1obSq4nkMM0U1+/8hOM9kLuXhOgHqJdTziNF3lcorY0ytM/q3qSxZJQiLyr7yFOXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIWATIRkJ7fj+ouFX4NiaouBLWjsYsgKENoYZaYmVUs=;
 b=R7L3FDD1ODfC1X+bAchcvUoI/s6o3Cytgwj5j7CL4jOPKHB1xA+mWHzxq82xcDGKe1SWAxz4hR04slHHrN21Q7wfM8WbemnctV7Pre2B8ApvRESA/B6+6DKK+0O5hJ/UdC+2PkkNaI9ziyXVAftMKBo24ifMgJ/2MMHgCwBJj91pBu4pbr71objQW8WNuXxc44wg8eE24FM12kx1jmXFYQASaVvSJyfYJyZvakuZvkj4VimOVxz2ur2KTf8FpcWr1wBsTaLqS3hEtckSSRz/bmkT7EfmJYFoETDJywJLLlVGqtZu1qn1qRq97jmBLtpVBvAEJDdWa7q4mwPLEQQzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA3PR11MB7627.namprd11.prod.outlook.com (2603:10b6:806:320::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 10:03:13 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 10:03:13 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sunilkumar.Dora@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2025-11494
Date: Tue, 16 Dec 2025 02:02:47 -0800
Message-ID: <20251216100247.3487195-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::20) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA3PR11MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 808b3bc4-68dd-4c4d-f018-08de3c8a535f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pdPezg8KvDBSUUGCcsSL1rOMsvlJcAMPXm+fDC72hxIlfFQBvarH/NmfXFxj?=
 =?us-ascii?Q?iffBAhk0M+n4GKHkqZdwv6UGiQWpGXoavt98IYrmcfwRV0MvIcmRG5U8D0LY?=
 =?us-ascii?Q?qnMD4U9OUFGl8VViXUxrmbmaOOmXCazU2wQT9mK/VC8f/npW8NZ77oRJu81W?=
 =?us-ascii?Q?zupbY62SZrlZ1QYDFjVn/+/yVC61uLB9/UuRnizfJwmAHSkXDhozU4ZdVQfp?=
 =?us-ascii?Q?uLdlPeyjD/A9eD9aGppqtFvt6pyuDNBNYscQt9x5qPtnVGlmq25BGE2z1Y/r?=
 =?us-ascii?Q?kU9NoAobR2JC7jtG0/6QHhC7NFoNEnZeTLw4fr6+HQelRJio6yLsjh5L6deK?=
 =?us-ascii?Q?VNF7H0QMJhImpByG64YLFE8tOU98DthZBzy4s5lmlZDr14uz4spFAtIdYwb7?=
 =?us-ascii?Q?uuODylv4quZtlDqWhvYH5CzH5awK/IrnA2M+Ndq/fRoZNYDEvOOqDUlSjBOZ?=
 =?us-ascii?Q?CBjU7/2kyAxe3g1gcNdksObgx0iLBSdMqGrPcATv1Pc0rDg0HlcyxJVa8iVO?=
 =?us-ascii?Q?lLgyTwLQUQRgPKIkGmP95cL9SY3Qk8uMuzdNsr4uGV6amIb7azBama8bfzPM?=
 =?us-ascii?Q?GsEQvYUVDUktSOEo8w8LXPtHk0nYFfDg6rNOPzfyZGDrWypuYeb1F8aMis5Z?=
 =?us-ascii?Q?hdSFTTXk2HglcVJ6t1SanpERRnZO8CSek1X7V9J7t+6i8u2uVqSrnPgVVheW?=
 =?us-ascii?Q?ageyWamyl5ge2QbftEPWLy3HTGNiJrgjDHiiEelHwbq5OekJa5n/kUgl0rbO?=
 =?us-ascii?Q?ZbTyIPPQG+a/lT9TRtILdWUrzithOErpzvB8o+dFpwOEpftQgDRHKhQ8Vx3u?=
 =?us-ascii?Q?G64VdR9L5+9jTZhcgsRwai+sbdQE/bimkLV3BatCOKcg04x1Ejzk0NaxENpK?=
 =?us-ascii?Q?xIDxxpPiu0DksniMcXKnnXMZJFsAOxvaEWSp0cqJk4s22On+OUh20KLYRPm/?=
 =?us-ascii?Q?dDRztF/gUKJtUY8YuFIbvCBWIHKevZ5e2DKyg7oC30pX89UcXH262bWBr4QE?=
 =?us-ascii?Q?RxLWfwIx9xieDPvnrkLvyAtX+PmWdstKUCFrlFUAP7QhAOxvyezW/mxLJIwQ?=
 =?us-ascii?Q?fPZGHL+4WtfEX/unbgzay/8vwCBM+TCjr2SfH8O5kDRQIO8/dAyIvSU+tiuR?=
 =?us-ascii?Q?7RGmhwg9rfec+a01jKK270Rd3+s29CG0ndcfbaIw+ZMnp7OEKlJHRJBZ7BWv?=
 =?us-ascii?Q?6imQiVZp39Z7n9AQ5doKGrfxx4gSWNURTPvae0znbC1rVb555p9s7sdeLO5j?=
 =?us-ascii?Q?n5KwKpiD78dSerT/xkLILUwdGr7yugZmoKUCWbbwB0eJYNBzWHWzAfL+WpCK?=
 =?us-ascii?Q?Hmh3b0PfUn389Fq3aRHCy1jymz1PBwLvbeRescCft/Ahh3dGAVQ0mdhUQuIH?=
 =?us-ascii?Q?mlZOoowWf2YpfG349lXkBtKRtIpJnuZ8diC8EtFlH/u5lAgfzuL4lYEk9F71?=
 =?us-ascii?Q?8WXH+AmrN2Anj2jFdJC/wy6dOWf7zZ8id/k1APXSo+99S2Na9kmESQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nsmijuL+/bU2vcvjB4M2l4XpLyb3gfflr53pQTfbaVESMCl129mgkyiNJKdP?=
 =?us-ascii?Q?wpGIIOAWvm1Usnjxj6Pvu/zlPxUXunGDWl730StrGSO6Ir4dh79g7YFvrVJM?=
 =?us-ascii?Q?gxDQdvnxqvhL1fQNNOMkpI9WPQBbiBzj/04OZtwbo6+6Y91nBvTRzqAvUrJa?=
 =?us-ascii?Q?yXUGJOlux8Gs4KRzFIkW2hQzV5edNc9ccIQZ5AeR30BvUpKV+y+nyJmj0z8Q?=
 =?us-ascii?Q?eo7pyvPsZ9uWWcZODqzM5jqxwT3NIk4x8jbHCxCzMrcIKy+nTVkvk0MwveaS?=
 =?us-ascii?Q?oZLOUE9WeI8Vm2JJL+AgiV0+UWj7pt8LkF1QdcG+YTjxGPCRlyQW131Ql+vW?=
 =?us-ascii?Q?LsO8+mrCsFyRORfZhQ4u7IhsO6R98Iw0dU7wrFgitZUWDwDrq3K5h+o8ZbN3?=
 =?us-ascii?Q?VDL0VcYs+uDSmj+czW0qQNhv+MyNshj28TukvbktiDhyn1m4zx0Mbsqh7ffd?=
 =?us-ascii?Q?uK2KjjR3e3MTtWLt+buPQsIwt1wbbaJ+7d31Pi6mrLgan/D0rsxdcqiVD8uC?=
 =?us-ascii?Q?X6nek+exyX4drWZDIi0Pu21D7QEdt1LkdfyauDydELP+o1s7LLp3ojxD4ZVt?=
 =?us-ascii?Q?t4O/ZMG0hSOdI12O0ktDJPiohYY3v+Rd36pWrUmRR9m6BSfHWn6DvzXyAp0h?=
 =?us-ascii?Q?Ye5lq799toZ4KOzlECkhxRnSIXUivmeZqdI9ruph5Go9dPWfVG4UXwzhoNjI?=
 =?us-ascii?Q?7GApCbhdjOpCmLtRAVfYtiYp+O+LAMvrargjV0zPFXdXrmk6sHeH6EgTvDZE?=
 =?us-ascii?Q?+5hgWdn00Y7urplBNks+9HmUkmR1vGTvYSszAU8OJl7VR8TsrW2bSh271nf0?=
 =?us-ascii?Q?voOwAATSF8gxiy4v2Tk9hrbC0E+d518y7h6OUnBDtuEzvosAuuKnx+vj5JvH?=
 =?us-ascii?Q?ODbH3MmPyBLGKXuz02Wp/OYuYuV2lhOukhK/SfA96omJeFATBBkU21g4CmW/?=
 =?us-ascii?Q?Em4aMI1T6Xr75k4EGS+k+/tSrmn50nwUodQdNK/0s2Bkz7bXG9kej1eUc+ce?=
 =?us-ascii?Q?pjbv0XWKz+k0iyE1i98EH4XzHtyLjgsEv+WYn7rnZQd7xS7pps6bGIiRcJ/F?=
 =?us-ascii?Q?HOpM5MY+OvL97U0ZWUxbza3e68eNSjRoBdpE4gtsV90osszMc4lgPyGaLPDb?=
 =?us-ascii?Q?eufvDPy5SUqlq2Y7bI+R7HifgxBbYra6YELNqk+xICILGP2iEtSkNMFnxf6r?=
 =?us-ascii?Q?Hbk12VFFKKBpUSo62zZM/hm8oPghCTDkFdSNNS2GOqpbQxD4WdFhRkKhulVg?=
 =?us-ascii?Q?ICChhYqv8aMOc/2s19LE1nofhgM+PMfIRxN4B6oNgADYUXvztKkyUM8eKG/z?=
 =?us-ascii?Q?KBW8y6qpVH9FBBuU6sKyMsU68P3D7b99IG64g4YE53CTNo43Rxe9HVf7TrgB?=
 =?us-ascii?Q?Dy0NRDBXfSGTJnRbjxwaGiWHKvmdeegNoIxWYBb4SLTosYwWl6olua9SNfv1?=
 =?us-ascii?Q?tvAdzFGp/s3VwsUBd153Iht8UeBrV+oBzLV58uRBiAk5DOKrhkJ4vBLVFNLe?=
 =?us-ascii?Q?1LIS2v5YMh7YSfMmC9g+wMgqvfggqfyLKYaxg1KbSRS9byZVr+d9sbYsv/tN?=
 =?us-ascii?Q?66L2snTEI2wEUeGaeFlMwL/znXnQWZKUXZdQ0tV38A1M3nMcYFlijoKeEhao?=
 =?us-ascii?Q?5eb+ImcHP2JKdM2mh78HDVk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808b3bc4-68dd-4c4d-f018-08de3c8a535f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 10:03:13.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJqKH3/rMxENM6YwPtPenQByDk8lZVVmDM37WKPUuVVpPskKfOanFhF1LK9yzAzpVidZTgqHKUDpc0S9XgjriAT8cl5KKspf5TIUyGz4pOn9/rgZRtyy4eJ7OE0A8mHr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7627
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MyBTYWx0ZWRfX8SJRf5kr+JYs
 mtRibGVqFwwU1zWNpcKU34yP3NZNGNJpydpe68G4ittvfHCPv8eOid4xpz1W7fNZg4nXs6pv/Hz
 wnj34+dD6NF7+IEzLa5vAZ8mGMEKF32Efv1hkjxydFI7yFpDgCcHyyjrsavMdhBxqfy8V6gBt9U
 WpctEOrlK4bJFToby7Cfyz1HpDkvT7mTWW80lvv+EDp87zudbh6FVgmsvuymKcvnUyr1p+s7aq8
 Wdxj3yiqlSuteX3uElPtpRmRzM9Y3S+S9cANq2nfznwpRYKNXeJcBKBFL775r1MkWc+Hblm2FRA
 muSn9cCD1DM2e0rMGj52LRgKg/340Y+NYsil/gvMOGkH0xHRkdG01F2J0JktU2ylksimDcCGBxa
 8wdr7mIUZk1rIunEmFiddTRj0JV77Q==
X-Proofpoint-GUID: ldUx_DufETgskcfAfbjRpz8GumbyXcZa
X-Proofpoint-ORIG-GUID: ldUx_DufETgskcfAfbjRpz8GumbyXcZa
X-Authority-Analysis: v=2.4 cv=e5ILiKp/ c=1 sm=1 tr=0 ts=69412e64 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=d8HPVgtQaXFDFom2_1MA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 10:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227940

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
.eh_frame section is non-empty.

Backport a patch from upstream to fix CVE-2025-11494
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0048-CVE-2025-11494.patch        | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index d5ad3c0ecb..2fe4a17e0d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -86,5 +86,6 @@ SRC_URI = "\
      file://0047-CVE-2025-8225.patch \
      file://CVE-2025-11412.patch \
      file://CVE-2025-11413.patch \
+     file://0048-CVE-2025-11494.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch b/meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch
new file mode 100644
index 0000000000..dc4b413658
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0048-CVE-2025-11494.patch
@@ -0,0 +1,43 @@
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Tue, 30 Sep 2025 08:13:56 +0800
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=b6ac5a8a5b82f0ae6a4642c8d7149b325f4cc60a]
+CVE: CVE-2025-11494
+
+Since x86 .eh_frame section may reference _GLOBAL_OFFSET_TABLE_, keep
+_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the output
+.eh_frame section is non-empty.
+
+	PR ld/33499
+	* elfxx-x86.c (_bfd_x86_elf_late_size_sections): Keep
+	_GLOBAL_OFFSET_TABLE_ if there is dynamic section and the
+	output .eh_frame section is non-empty.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index c054f7cd..ddc15945 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2447,6 +2447,8 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 
+   if (htab->elf.sgotplt)
+     {
++      asection *eh_frame;
++
+       /* Don't allocate .got.plt section if there are no GOT nor PLT
+ 	 entries and there is no reference to _GLOBAL_OFFSET_TABLE_.  */
+       if ((htab->elf.hgot == NULL
+@@ -2459,7 +2461,11 @@ _bfd_x86_elf_late_size_sections (bfd *output_bfd,
+ 	  && (htab->elf.iplt == NULL
+ 	      || htab->elf.iplt->size == 0)
+ 	  && (htab->elf.igotplt == NULL
+-	      || htab->elf.igotplt->size == 0))
++             || htab->elf.igotplt->size == 0)
++         && (!htab->elf.dynamic_sections_created
++             || (eh_frame = bfd_get_section_by_name (output_bfd,
++                                                     ".eh_frame")) == NULL
++             || eh_frame->rawsize == 0))
+ 	{
+ 	  htab->elf.sgotplt->size = 0;
+ 	  /* Solaris requires to keep _GLOBAL_OFFSET_TABLE_ even if it
-- 
2.49.0


