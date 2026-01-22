Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991AAD489BF
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 01:59:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28047.1769047155401520377
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 17:59:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aNXgOyfv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54826ed0b6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LKhK8a2822955
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=; b=aNXgOyfvyUD8
	l3AV8S4JRP3KurBUX8NHeLZN2Gp4wCc9O7lEAOdfshRBcLBR30hMGQacA798pbwh
	WPdiJ4kJZveVlVZqcZhKlYNcNG03uePqR7yDCb+yvxUZMzIObqVCpZvR+K1kp8LC
	DDGpC1myEuLcb3+OqKybmlwmZT91HDcdM2D06Idb5UbM55XItRd7YhOAeNlb3WNo
	U3hziG1AuTenlAnEa5Gy/aB2Rdke6bqOmbJrXz02lJ6+NTPoAcf8+fnuDCbTv+xd
	Ry8BiTETRTH5MZ0jJcZ9/7jtKT2H9B0p1Jch+OJlhM71Tjtj7YVqY2eLPv8S6/PF
	Yn5+//64RA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btncwhmdv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:59:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYe3ZrEA+UVcMKsxJapZw4zM/2VO441t1ldfOzfYB9CrUmW2x5d2ceAHVI6mWHj+WBF3i4YL7/D2YRyzxqosZXFf7gQkN+I/icztJ+QcB5Q4mbRnUEmv1Ue53QOuSHVOxUp+VGgiPiRiW3zbK5o5XnTIvThuxPPaWNfubLeEGZA6+GuowUGC1Qdu2MZoMngyf2xlrNMnKmU/MkHAzocMh77mWHBQWyamIQET6GTGAvDiZkEvAISxQzCIjLRUcDxLm8zxfidc8AIpA6dEwvomtmMChOe78cfr6j0b15W3wh+sZ8lyrt3zBtTKfZdb5/jnK+A0BxznCAuvTWieQgYdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=;
 b=gYnuGjE7mttKL0iHV/Pt1USkk8gEILj/xrrvwHmkUn6inyiEs5RjYN0Md08lwmTMufMNsosVKRdZx0nAtEhAYbd3SSLR7V9SRKDU6FcmHZUK398/otLDZQOqOj+mt9f8jizWj6rEpSM6qBlcgdb6QQFjDKuNfabtQS4dbUyS8EuEe6dIvvfJGOAyhVUXkWqzxDR7BKP1tFTJA8qN2A8zUSCEeuQwIM5RHE9A63aEirI7beBQsC49xQP/wVZSgvGCXax3OiGSfSNi2KTyN7Ne+rLc0vMndDw7PsO8XgUaPvg9oMbloTRrhFi+F+6/k/ZUaowOX6pdQDrFX8uioZblqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Thu, 22 Jan
 2026 01:59:12 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::73cc:6f62:3c66:cef4]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::73cc:6f62:3c66:cef4%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 01:59:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v3] epiphany: upgrade 48.5 -> 49.2
Date: Thu, 22 Jan 2026 09:58:55 +0800
Message-Id: <20260122015855.2022014-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122015855.2022014-1-yi.zhao@windriver.com>
References: <20260122015855.2022014-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0085.apcprd03.prod.outlook.com
 (2603:1096:4:7c::13) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c68a18e-cd2a-4390-f9aa-08de5959d6d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|18082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XaEqG26HDouA9mEjWKFkoe62MMqb8+zKuh5oxhqmvnNqGwShVLmEZg7rpeVv?=
 =?us-ascii?Q?QZT0xv+721wE8daJqTL2V95Ke5X0B/V+ZPhkAiRHJoPtpJtAQLwnst4CDzdd?=
 =?us-ascii?Q?I1JJ4u5ekc6ohZHyBHzDYzyeFwlAfFfL6V3sBUy18SuNbKmFZkjj6MILPAr1?=
 =?us-ascii?Q?PUYimssTXg8V4IAGcDsSUJ3EpDZDdGH0ZsTfXesnzWjGMHaL2LWbgLaFNFuI?=
 =?us-ascii?Q?c7eyY0PzNSOqJhrF1niDsCJt1AKLeVeWzohR+CcUmREMJAKX8qjqOGzIJiaS?=
 =?us-ascii?Q?cX/cWClDrH6OfApgXtWyosihvI3N2y9tVShJbSJx3JCiWGg8gXkDHkb4C51b?=
 =?us-ascii?Q?Poo+Al+/jhiONc3AQ/hzdhebtxFCJSJAJzg4NGRExMT50h5IVLD7mV3Qw2CG?=
 =?us-ascii?Q?xJRW/7WBnZZhx+3NWEdIn4cfrSotHUKJZVbascDWEeJ3AIskB82OvnCPYchH?=
 =?us-ascii?Q?aSTMpJjquG0gAAGnv7byrKyQ7+5+udH/ERT/seGBEYZiqJHebFrIDr0hb87F?=
 =?us-ascii?Q?6IcgJXqm7mQ5q2fbd8qgVMm9m/jY/Ze1soTmzefWH0va686Lm8C6ep6VicRy?=
 =?us-ascii?Q?TEePbw1y+40RYMPB5nxJuk4GKGAQ+geqoDzZJps1ZSf2gsQig27HeCYHbmIy?=
 =?us-ascii?Q?ba9o8Su0jBhVXIVBPN4Hvvc8OlUjbb/O5e0dSzea/Zj82GO36JR2WVVHPQr3?=
 =?us-ascii?Q?YdRPX981ClBjObWMrCn84bBB+slOBo0PwL29hwabs0A+V+tPOgvUW8iAIBtt?=
 =?us-ascii?Q?r3xoyDXS5hLsjRUstfwOA77nZBSNehWh5yKMW6E/z7+uZ4zBjdH1g4AG2qCN?=
 =?us-ascii?Q?1ppCnl5sFOUMM6alUZfmLFWJDOjd2j488JQNhXYE8V1tsTAYdzPtLHzKS1+w?=
 =?us-ascii?Q?3J5NDuHSnwlO9GuLSljIgsQvmJbKQTGchzgqvaD1CTdtYIj5ThFyLjAcExQo?=
 =?us-ascii?Q?F9JHmF7xJcP5ta1wS8AluovvfS9aYW3sbUBv0sbF+ZDgEK+rULZ6ILDvGBiv?=
 =?us-ascii?Q?d1BU/M1JNJcdaZeHEmKlni6YJeBxJpjBHOBhLrGnBN7C4uMYb8lVSmRHv1ZZ?=
 =?us-ascii?Q?rPcxsTt2TwaAuDsiFxMMKtyC9xC6Bkgtc17Pjf7q9chr2Kbn3gEfavWZ5Fuj?=
 =?us-ascii?Q?in6BHQrB22g7OLIb42Rv393QxsS+ARfSCyGqfw4HHJhAVORYu5gphFc7Fbao?=
 =?us-ascii?Q?S7CqK1gRZm076k7A/vSXdjBkJnKM+MOAV2MWzWsqnrYzza4W45F+zM1yKpQm?=
 =?us-ascii?Q?2Yv5cDniK2me6tmRfj6AsSbjyoVv3tgEjfdgBdSLRGS5ujdvC5PZ3wHpUwsN?=
 =?us-ascii?Q?Qz+9yH3jPTqlXefYdVaXCNaUQCeyE4bSYIwkFGhiziD50z0kIhLZiKzG2gOa?=
 =?us-ascii?Q?Dj5WxDtIUcSC/+Ncn+FcmllWcZi7EvZswB/QsjaV92gQv1gLhHN2ZmR2lg81?=
 =?us-ascii?Q?FiDujrDOkGPm3JdKT24axM1sylML3vy8rVeu7GIbZVJ6hIQ4/3ZTC+3ygUCM?=
 =?us-ascii?Q?j5RppASInex76syRdPjJJQLPMuF8FNi2zU0MYcLkD9im3gSG3gDRsTvO4613?=
 =?us-ascii?Q?9crZEqZTwET4962LeKw1V1HfZZZtwyk4N5xg6Po2vPWWK2g3cXS2NMDV4yX0?=
 =?us-ascii?Q?2tcEeXvSUMvMfSCnHPXuiEw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(18082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RTqFgxCkZ+7jc9jouEAobJx6Xt3XXOOTypqR02JcjcTOwNz9w4qelKum4wFf?=
 =?us-ascii?Q?nl4x4Ad6cQ0iwjJRR+4vku1TodgM/laT3TkfbDJqspLXyIlIfctnSIoh57fc?=
 =?us-ascii?Q?qrkqrFilXlySXhQJnepQdo8eHixDLrgvsVeZ8JBUPikGieoEydhFr4DuxZxL?=
 =?us-ascii?Q?G3Zl47muePPg/Mrnc77U9owOnLTUC0RHZP9jEfAXArr1Qovce8or4+MfRmeI?=
 =?us-ascii?Q?8CMSeQFjk5XyHUT14qw42XVpH9ID3apwiMb/cCa+RFR9kQBpEfxerSWgt2JX?=
 =?us-ascii?Q?GeZLie7JviSdgA/rLQdfqOIZhipqe+BCuVpAYzQ96F6403+A0FIVOhWJaIOj?=
 =?us-ascii?Q?Zvk7c5wGCb4qlNyf+LtrdsuwsibXb1fRHud8PLI58GmVpz60QGi+APQdj8m9?=
 =?us-ascii?Q?fTZqPsWbIeWPirwvCEUjoyiYVs9V/Iht2DCHurZf3jPEwKvm0PYxwj5WcG2d?=
 =?us-ascii?Q?RPw8/0ZTc+uRojWj2rq/E7o413D/Js0AmbZEK1mcVy/KGVrkgR//PITgc4fM?=
 =?us-ascii?Q?RZUuc4MWYoYVF1oHGT3LRIP3EwLd+gQlYQf3B6wJcMMtf1E0lp1m2sIV0wAl?=
 =?us-ascii?Q?uN5SgTBBJc2+Z4buSLfn5CLU7S0csIkEh58CQe8n/YwC/OQVSSgdbyR2OgEh?=
 =?us-ascii?Q?vzjJTSCl67SAQkwCSn1BH2S5RKC9rPPuFUnauE0xloV8xy97T9gKO7RHkBDE?=
 =?us-ascii?Q?79Pu9Qv5ILlicC+vw14/JZGLSTG3WLEHQh1Lqvb3MggbX5wnApDs7qMOVXzK?=
 =?us-ascii?Q?ByJRyQC1mybo5ohN1Tad7UHoaFuaYyk+Sh/+bF1odR2LxcFwHAUYaamdTcNJ?=
 =?us-ascii?Q?y0dMSjCXDrbbPW2pC8w2DoYUYhuiuTuxBk+mv0DFUPSye9QV5AF5BJgeB8UC?=
 =?us-ascii?Q?ZhTag3BxGItBPQs3Nwsgt3a0h3sgWMgx0WOdv/G33S/Mn9B7DwdpELvGRKB6?=
 =?us-ascii?Q?BNZnOe5BGkCcVZ2YRjMt6lffpTADz2ePMhUEoZPC5eJSd76z5cCVPYgVZRt4?=
 =?us-ascii?Q?1GsZIiksSspqkvUKhjjdcG9VLD3FXRKS5jUFDcr3Ia23KnVaxikzh0MqUTsc?=
 =?us-ascii?Q?35MvNFKENUYMTL4upueEFk6GNisgPqKyNXqpPkcY9BeE9RSxvV+GaP0hnyxl?=
 =?us-ascii?Q?gCtztUcDOUdT37Nl3hspiI7zXvoFenCDcxx9zD+Bqh7N9CM+B7oMj1lZwGlL?=
 =?us-ascii?Q?HiSzCdPgTgl+BBtQHP0JAgnmWKdREuGJtrQSbKUVf/nrv0NZOZI8w4mTpf/K?=
 =?us-ascii?Q?JayWAUeXuFUBMv80MnWtanQQpSFyk8DaPPA2rTuiNdqPFsq2qGsRMDgPcYUg?=
 =?us-ascii?Q?ezWImGO60cB3aSpd7oHBo8MIR6qK0GEvcUZjzOgOuSx4Kv0BxR5XmDjYiXpj?=
 =?us-ascii?Q?Vt5mKDd0NHNKaDmFpAtZH6AyRouAflanh7VhtTAZuyYfp1Nr8nUppRh3nvZ8?=
 =?us-ascii?Q?hqJSFV6hxHYaShqPKFC7tE0RS5uDKDHd17EU6Y1rGNrDxaA4TVNr/nrEoCNJ?=
 =?us-ascii?Q?M2rr+TDylb4JgbjjOL/bjzF2PQ2nSLAaAH+qKXYa+DpvaDYMz1S9uQLuAhxT?=
 =?us-ascii?Q?Q+ig6UqF2mI+nItmPbXQLnerTBzLuMFelMeypVFUA8mhWh8r8tHbMY5jv0Eb?=
 =?us-ascii?Q?af4VlC1nBgW4kKvzvS+vFt7cElwaRBSpR4TnkFGgObfIqr6AZ4EtvVlPuTtr?=
 =?us-ascii?Q?qO/jHfOA5SjHiZ+RPYztalzLzl9VL+UrnPCfCI/TJSv4BFNVsUAaO2plGjD+?=
 =?us-ascii?Q?/O147enwjg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c68a18e-cd2a-4390-f9aa-08de5959d6d3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 01:59:12.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7y7C2v9rWFTIOliZsi6znrWDEIQE8C7nVFjA5lmwD/dM84qHoG0xYqjFxM/K4CZuxqQ1KHFVjBu2F3Pl3OQsNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
X-Proofpoint-GUID: sEz1gqHD3uxdFWIbXEHN3aBFlEOjYkNu
X-Authority-Analysis: v=2.4 cv=ecwwvrEH c=1 sm=1 tr=0 ts=69718472 cx=c_pps
 a=kRgXGWC4h8N5Zk8PQP6WEw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=ACvvd1FpC_yVDdpOqSUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNCBTYWx0ZWRfX9Uz+r7u/JaTY
 R5HEfOdUsQEzgkGP4+rjGkoB3IaJvMwTbn1P/AhhqAuqDpZGui8QG8sKrpeTrNISqpQdcz2lT7m
 nwvaQGkToWwJDNw7VElXN0WGxsHtFZ1mjK+48jnI9p35yvyJbqJTMjIVw74mZAQ2DkQJPuFwA0/
 M2jNRUmwrOs5shizeLdkiRs47phPp83fpCH/Jscy7NRCcIrJZSkPY6PNM1Kqc2GcozLtfQH4aji
 K/9WRHcNLiRUeCFjKmQKd9lyhkCXzBGxraOamm6GHBZgPw/7IjvJ8a2p0PcWW6b1ec7SFnnRuYK
 jmSF77quWpvp//zhfZ/v+MVOgMkq38Nc070CK5VWxI8naERitiDAKnyNiJKTQidlQJ64yRBXEpW
 ULJowzWcFrNNDF6oP/0Oi2+yeO2M5pje+0POYr/VeOd5s5uyBD0A7JErFs95KYo/fK0PkJTXVDq
 ulPLW0eQ8/AFa7I8GiA==
X-Proofpoint-ORIG-GUID: sEz1gqHD3uxdFWIbXEHN3aBFlEOjYkNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229830

ChangeLog:
https://gitlab.gnome.org/GNOME/epiphany/-/blob/49.2/NEWS

Add a dependency on blueprint-compiler-native.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (88%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 88%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..4c27a6b6c7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
           glib-2.0-native \
           coreutils-native \
           desktop-file-utils-native \
+          blueprint-compiler-native \
           "
 
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
@@ -31,7 +32,9 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


