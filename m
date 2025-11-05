Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C4ACCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:10:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9074.1762348200017201983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=chrg/mlH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34043e1a29=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54AOLY1459459
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 05:09:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=VmlnEFPxaPd9Vj//iz5TkXEdoTTtbPm33ibXyPIUytQ=; b=
	chrg/mlHscD1kT6GtRHhC6WSJa/pErQKt+biSQpziBpretfzP/ZjuxIrNOxboLwr
	q2kJh30JlXFzKX5GfPEcMOW/10YzH37ns7Pi6WYekJhzVxwzwy75oqI4/gJYCnjL
	uZRExqyPT3TOBOjfpDH78qI3TMbz/+L1YgntUGxMVVubxNOn/DrZG9cR03a2ae7o
	xY+yY5kSo+0ZM3lSafimMs42CWUxwwTtHX/IiiYAmfaCk82pbKyLjQS8KKvDtuE1
	XP/iZdDJpXAAp3huRttgb7a3VyMQmnBNW23KV+P1GhoyTDVABw3+QnhMflwxeM+E
	Vo6oynupzW3ALzvw3ncv6w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gg0g-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 05:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap8ze5iabs8weZAYZhkPuZrzPwlGt54axXYKa+pFWem3McEhoXYXjh46Zw4OoPtrU3n40N3zzVcxeJz5AH4eNrwQ8RG76orM7oT0/cPTSOxBa4hHBlY1Il8XWdaT51vo1NNJDkvhFWVdAQgz7XpQew3d7yv87CWIEeO+Zau3sLHKnEAXn1uBZII8y0cAu+w6Y48sftnfJ4Lgl8IFnjCXuPHZvaMFPzhbvlad7rxUJrC5Qe1DlrYHCrxuMkq5y/6MunJiH34FD+BFEvsJmVcLQY0/sXau9SWgCjeNugx1NhqfTvuyKHvPvrM3AnhVSej6Xh8iyoZJmmIdm/ZWBHfhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmlnEFPxaPd9Vj//iz5TkXEdoTTtbPm33ibXyPIUytQ=;
 b=nGWqhcIHQ+bh26sAN7fUH9MbTIeeDrBDTjXbwkuuCDkRKat1Sq1JtGC+aQJGBJaRg7EB8vOBe3nUCsf87SMLM9iaQTpLVum7T5fdgSvpF7JRmAKrzsUQUAOcktpmLivTbvUKy9Ml++bz4nZbf3cIWXntc89jE8ZpC1+8rnzoevSd9jPrTIPK+CfHPjesFwVdT1AjXAFsERLz/hyt/rwLNvlLV1gHFTO/LYq+LXuvNUaPkEac8FBiOSmGjpVC7/OqIX59vDaqcXBIO8GcgxIv2TiiKAOmI89eeLMEoNSpWe1LP12clpEubbOZahWxXNOeHTi8voLHyxI+s5IM8kB7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB6528.namprd11.prod.outlook.com (2603:10b6:8:8f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 13:09:57 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 13:09:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Subject: [PATCH RFC v2 2/8] linux-yocto: add clang-native,rust-native and bindgen-cli-native to DEPENDS
Date: Wed,  5 Nov 2025 05:09:36 -0800
Message-ID: <20251105130942.833204-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:a03:117::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 41672979-faa5-404d-f8e3-08de1c6c9e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zrmo/XfWxt6vbfCbzdANTaVuRQhpqB/3I8Pff8L0Pj1qBPFir8LbaE59qFgZ?=
 =?us-ascii?Q?VE66hK7jSTb0vkQhPI1K8u7PqPwqSvqGrQEpV3s5KyHjdIgi01ilPuza+o3v?=
 =?us-ascii?Q?2PLKVM8pnk6ylPh6thxYPD1TqPd5QojjmHqp8CzAssPt6CjrXNSUuYIN6v6E?=
 =?us-ascii?Q?ORWktp9Eybv7+DHnoQmNn4xWHia7p704bgWcsRqRRIfFYD6DtPEbsa5lgUhk?=
 =?us-ascii?Q?OMmRwILmOaw4v3Jq22+9jAm02F9UuRXtdMBgXzf3ZlPgfq/o7JOSYZc3j0Ea?=
 =?us-ascii?Q?0R7eCzXF3G4gh4bpwwxslZzYyz6xL+xqXx2+1DoyU4Up2g5dYeB1qvxdCTbz?=
 =?us-ascii?Q?yD60wL1IaMpd4bJTC4F+ncIEvXQ36J0qfazFPO8YyogLlDOaVclV6er3V6pm?=
 =?us-ascii?Q?FHF/K1mbiZ9tVaBGpo9GMhmK/xKmY8YHxqGQsH4NLK+ZzlhjLFgTVjZ5NgWl?=
 =?us-ascii?Q?LzrH/Lm2JB4qx0FOy23imLoeJKuVYtIRoFEewYqk8/XF65bCFBRR7krRTWxO?=
 =?us-ascii?Q?gMgiTEi6sbxznypZsvkcjPDHDt44U3PP0Jm4kNSzpdCdHYxZaPuWKonkkmSi?=
 =?us-ascii?Q?wzECUZwg366rV46noV5MGu5DRxImLiM/9PA0ls0JiTQpvkqjonqum5IQys3h?=
 =?us-ascii?Q?ReuInsDcpbvgvVMzPQ8Xn4fdeMiBlsBvSxrNeObEwAxQYpcBNtAJ2zNbOJ+w?=
 =?us-ascii?Q?1C9OGnnx/6mI/8Wzs5qoigPyon9NJEprd3XjrLL4bE8Ke7rKzlFEohd4zMFh?=
 =?us-ascii?Q?2QZZ6yjZQ6edrc5KLnFkNQQZnEWeov/SN/LUI2If1xxGowKu4i20acf6x4Tx?=
 =?us-ascii?Q?k9VSsAUPY1N8G+lsCH5/DQbB/225znxpr58SRKa7EQ7+wLJKRztBbMvYJtsI?=
 =?us-ascii?Q?+SvEtD06zq3RZMftw7YpAa9enNXmfEdfveA8vjg1cEQiKM2S+0D+Pvmuv1Un?=
 =?us-ascii?Q?Z9ouNWqawWC0PIjHO3hKNTnj9mq83daTpo37dAdMntFtyN3jWpFHbvXDaYR6?=
 =?us-ascii?Q?4p7fL55Hpm4n3Xc1hsCWX/4Vyj9WJNxBMiXa1UmQVlv9HH0uvhVOQjTVqGm1?=
 =?us-ascii?Q?LXJgnqJ3GiHjLRDdzU0+wyIgHAS81Ywj1A+RkJnz+jLj5jW7xKnphv8LMYM0?=
 =?us-ascii?Q?YmKRmI1JJ2kmzm7VVRavWKSr0MuvgSgEq8CVNvcGRDDRXQDc8SikxdainiMN?=
 =?us-ascii?Q?ww4Hg0LWK9Y8wcJXW84rlXK1V5cu9SPZ9rOIfxgnJzd7JDuKgh0ewUl0aBhJ?=
 =?us-ascii?Q?TSnw8v0i+Zq9gDCMEQQcYcLkpPdYSJ69ycA8pkJfYiQPx468b0mDc6+18cSw?=
 =?us-ascii?Q?n8qooRT114gL96WPbmqv6q/CKOwIFTgzuq986zrnY4SeTXRV7tQpDyo1yplP?=
 =?us-ascii?Q?wRELZThVKDbhBbU0CXTfEfnavd4VQ+7AwCHwy+cy30E2BVMEckjsCjHnv8q/?=
 =?us-ascii?Q?4K+LgwEXt57rs7sa0qtJByfL4W7iV/sdYbDM2eZ+fmxeSY/yN9vu0e1y/QYn?=
 =?us-ascii?Q?3OTsXq5qbDMqyyYS05srVm3yMkNaQZb1UsrF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dpr3UuuN/5x8yAGjL6JZX8/mAf0G2VN1wE0xxzvkR0X83dO46DzOnkedU/tD?=
 =?us-ascii?Q?jlSpkZ1L7cnuZnWYp5nq4AJEwBBYlYA03pH7R6fLCtQPAQB2X8PhL1TUt/BE?=
 =?us-ascii?Q?F61swLvhTfmn5WDRRZ2fvoFfT/yKsugJPtH24GOPpVWdRNR12bn79qd3KLEF?=
 =?us-ascii?Q?/PZVxtSVZILIC4l+c/Q4pIE/XaA9oDXS1ibhWxsOntQGw25lt9/x434Nu4Lu?=
 =?us-ascii?Q?f+onwyJDZvDZYS5UXVozgyYpHdWpvjYowbmhwB+aF6miW3MMOISxmlAGyFrx?=
 =?us-ascii?Q?mX41ldd2LNUqfFnfsSMG6gCdtoV+eLk4UNxVV1KVmJ7HKNae2cFePyecxVRP?=
 =?us-ascii?Q?Z8QosnnMXw2HVh/y9oRzxvYk1z7g2h72rbE2t/d9CyENZAabYH9M16WOS0Pd?=
 =?us-ascii?Q?b4Zs78jTE9b2tvLTswcu24kr4VcqslUPNKP0lzut6CVx7HwlsCM34yJF48HK?=
 =?us-ascii?Q?JjpThDMwS/TW4VDOMYaVCkO2RTHKd53Cy86nMnHZpA903AjVuZ5KLyS8u4OG?=
 =?us-ascii?Q?DoQL3TBfkZQlayi6PeojNaAu3sPwFkkEkjpcl5phH+BA1EjKn+x2NoVD+q4i?=
 =?us-ascii?Q?M8hXZJ/nm/HqPt0p344xfXmqST1WeS4PgRNvHHRkmnzOOFlk5kk2hkQEj5AO?=
 =?us-ascii?Q?+x/TVuG6HK3rHmwKwb273agiv3HEPbhBOSRkHjF+9DaKDVrlFYTEkwCtqBlL?=
 =?us-ascii?Q?98+gJ/vECJ+/1rN8eagdBJeCx/80h49kHUDJOsjkmDo2tqGCJBlZguYuTTrG?=
 =?us-ascii?Q?ODITtOeNhSapINYS9xW7oZyC79864/tXQsiGE3vmjVjmP3+JsfhKShHC7RLZ?=
 =?us-ascii?Q?yB/PbRfGh7eR1U+mRDhihw8PRipiCkQ3EsRIQIApueOGD2pJm2wnEQZwTqKH?=
 =?us-ascii?Q?wMcY6xbx5X6fXbb/JdnPeKMYR3+sxx0/4lzfwW8YR7567tUhmE3ApTTs2Ag1?=
 =?us-ascii?Q?7LvU+CPJyvy5SmVTDjHeHO/nigaJ5JqFlgq++CX2ZJD+FrTieUVeP4MJf4oN?=
 =?us-ascii?Q?UqiOrl58SpV583n8qMziAnwbSxRzHHHC67aLiFYrNfnfr3RqiRNHzR16HGHH?=
 =?us-ascii?Q?KoHK9vYPgazRR5kQuZGOVR637ZGzwQ2r5MiYcDcg+ioJ20kZ9yUgfi0l1bLb?=
 =?us-ascii?Q?IIFddQgOzUgz+x1Fg0qsVOJDKS3rRonIPXyiKqRRZzn1fKgIxjNg4dCrrbAr?=
 =?us-ascii?Q?mwNu2o2wkTumgoMbf063XqFVrf85jUIu7YgPZsCLnuu7R1FxhD70PCrG43Fo?=
 =?us-ascii?Q?FZ1rdGiL7A0dk1QEqYjl+Lou5j9FqC7RyqJVwyGbkbnqRSnsPLFdIoN8jJBh?=
 =?us-ascii?Q?0hdK7fXOF5q6GYTx1gwQPx2Ayyo6IA0HXekukYqZkUbfg0HcElthIQv72iDf?=
 =?us-ascii?Q?GsFG5IXDDkmicxHRItnerH6TYVZGy8V76HpLM4h32oz5d7ZgcNY6IH/SI+EZ?=
 =?us-ascii?Q?1pStkbD+wEq1zq7f4aEIHNEh+14qcG2GVBXrM/DzFVjaLjVc32EGjBELInUi?=
 =?us-ascii?Q?Lc/KFKhs+KZC1YQmsEkTSL8TDKCtGBUZtHyrwZUdW/oYBZEvnu+3sZZSWqGC?=
 =?us-ascii?Q?TdkbFhGs3EsBq2IkGbo6dfg9xlLlMn/5vgu5aozpj9s1LJgW2MM9lgQ5umRl?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41672979-faa5-404d-f8e3-08de1c6c9e51
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:09:57.2690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jB5iqnz774lXv2blEnGpB27d6v9AD2RUVx8EjEopgtHX1aJ6GCswHrCRU04X2ze9C2z0v/qPNlC2tdh7g8pRgSaiC/dBB3HfCN8UW2Ry0t0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6528
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -CKyBukrm6FpkXIlxugQKGvIgJ7ynPBM
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4ca7 cx=c_pps
 a=wodMs23R9wL6gmOfRTd43Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NwgyFg4b6P2yPbGLKLoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9uP6esTpdhzFYx49278Tn3fezEgEY65W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5OSBTYWx0ZWRfX4umY919oe74N
 fFM6uSOa3i0i2JjM6Th4JNbZh2HEsI/tDgHoCaKDllmqKokAWdaRubCC1fJb8/8kgtttlBDB9Ol
 RESBEgNbET9TjYNsd1sLPl2G2Q1orT6jAOybnYlWRD8aLIOslSd27ddotmCpYGBz6u6T79GM+nB
 dEhiUzo/YFzvyPc81NFegDv3s4EIHNYm8pEtB8fBZl9ABAKrk49DNwxJXvaXb4GUS2DAX/cMJ4z
 K6SWZnV+Jh9j7kwAAfLKLQA/O7phiqIEVR3wRHIZ96E/bw4XMwpqM9t89bP36ZFR0sud/y2Elui
 Qy7BLmKmgF6RHrpbYn2Ah5ZgnCbHE8SmX8BKzK4PV1NDLFCuvIRobJbJ92a5lhbNzw+HkXl36PV
 fBStFMCs0INjQMTtQ2DASkyNeCWMWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225759

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add `clang-native`, `rust-native'  and `bindgen-cli-native` to `DEPENDS` to support
Rust-based kernel modules or features that require generating Rust FFI bindings using
bindgen during the kernel build process

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..e2ffd96b59 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,7 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


