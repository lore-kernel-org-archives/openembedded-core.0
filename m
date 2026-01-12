Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15A4D25047
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 08:12:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29042.1768205537223287841
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 00:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=r8xfaf5p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5472523fd3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C3vSNA3802000
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SbFA4sY7ELdTD1mXgtZgsBjWgTlnsFfE8RyTLttBzkE=; b=r8xfaf5pLzTH
	1qkA9LymbCG4kaiRucX61ac0GRZL0I3DMZ3wP6LsV4Zei7iGfYBBVfmUDuq2TTju
	+GnFBsHU7oJVVa3g5g/LRo2qHsJ4Yl5+9mrVkqYESqTNqUeYWoCdRquDS1PK0ap3
	AcKu+Hq5/N4Y20YfkYGnUu+DkKEJEddh6bz6E2GEC++OHb7UZicxd/lv7EJUYKD0
	+CASvbvB/cHms2lTiVNoDS7JgFlR4zoSnABAgLksguOfeohIQyl4zX03HXJXQ0ap
	+3dAms3PzfEXzzPJ2SzUsn8FMwqMXi9Qd6Kpbgf1V3WKz5DJAbcLYWWkof3MV7LN
	s65uqTR+5Q==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkbythjbw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SX/JdqPZmq8k7wXxstJWP7AzM4ZFGnpoZD55dYKndxxQviTuqgQzq1+jfoyHcWT8Qw5kk6e4lQdYa6CBiGOuDMFxnJ1X879XTUT3YWPMM/JClRxl8k/7CrRG2YM43epXbz3b+0z+so4Tn5mPx2UQWWLS7TBQyLlXJ4bhwLmRH4jincgtV7l7lAJtZ5OvFyJsPX9gOWe13SPVFv/n/AG5N3kksrfhkOi4IuvBerWhHZ1ToydkMjc+i+m+Hc/RyfxsvwfpJl93Q/QeiV8oVd0VwzPlY5wOtJig3CnYREFOzjnWh45jNa/GJdxK3AaFjKwua9VSF8D+19uJukcGfqbK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbFA4sY7ELdTD1mXgtZgsBjWgTlnsFfE8RyTLttBzkE=;
 b=Mb0Mz0Cv4v90e841K0svCFk6Sakc92Vhzd3KZ9bMNwYIileIQVdfKOFYsGRBGoYOMv43m+FuLcidMu9iVRUnPIAh4NfsW6AI1/QWZssc1d93JtO5jR8V+nN8/2E1GOJRuIb0boEWgw7AFXtBf0HNXrS1OJiR8jhzd/+SQ8lDJLLdcpTyTxxvkTe2BQx+TaNJPpfrs8zHl67hgXXU0CYesKDIdrHkbVE0XHS7fEi7ndQ4lrGG7Pmr1qXkwtjUqvF1J1W3TmAjugHaFLMwfDhvS2tWCxC7frgcY2EA+sf9RVMsq64cBAOx2knVLDVjLm+q2D2AR3+UoiTMvfApvqpvmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8372.namprd11.prod.outlook.com (2603:10b6:a03:539::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:12:14 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:12:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3 V3] kea: replace keactrl with kea daemons in initscripts
Date: Mon, 12 Jan 2026 16:11:57 +0800
Message-Id: <20260112081158.782266-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112081158.782266-1-yi.zhao@windriver.com>
References: <20260112081158.782266-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a15c69-b99c-4429-e735-08de51b24b20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TyYirQNUwrCfRnPQuH9FgHgrLaUJzqYpUdNSDlgqAlFWVznQyVy1mneD/608?=
 =?us-ascii?Q?5p/KikJQUEvf0h/ZaFhDsqd/tzSFPCJ0pS/3aY6jaJe2YuHVxF7lItMUMdi/?=
 =?us-ascii?Q?BD0egs3uxUmfcmtiVG4S+e7dJ8DfoGFiiztq4VtF23eKBhzOaN1U05IX+8s3?=
 =?us-ascii?Q?BWWlsmwTszwPCZ0meFImP0LryRYUGpCjjOyf5UlegxozKpnptSlUzgQsHgXI?=
 =?us-ascii?Q?RW/MnwelhU1Egbb3NCp+P/Osbnxk4tsAo6nO21d+zIW/GZ9XUN2dzCbHIGs2?=
 =?us-ascii?Q?3Q/Vsd78q1AiVY7dbukecfDvi+GAlo/4fwt8jsDduIQOMHSXN/VaZcdkKKni?=
 =?us-ascii?Q?8b3ttECoLKnteaAEruFXWV0AfciB+aIaLjNgiJzq2Vg4lf2a4h8o0vISc/hZ?=
 =?us-ascii?Q?h5U0R3HARnWPSqBYEIJSoCM0EYjRo/Q8aBq175TqdyuugdqP007uFCRFqZN1?=
 =?us-ascii?Q?X/dctrZHiXZwwdMi9faPyMX0lfPG0Yt+tyjhtDIvh889pvXhB+rKafRSpkf8?=
 =?us-ascii?Q?Q+8cVTexLX85cTrxXuT2tZx5pcmd+b57Gq63MYZsJQ2dCtXwpA8hBQBQAZuR?=
 =?us-ascii?Q?V6ttAmH9C1mYn1C5LL83BZexR/y29uCLAflnFZ+dqr10QG8APEqaVjDfJT0t?=
 =?us-ascii?Q?w5pH8cYuDu/BCiGWic/eUXWPOr7aJ2GYF3Ia8dVxZz6XxC+aGdouFnAJ/7OO?=
 =?us-ascii?Q?kQTCW8GzODVM1Y0XtxfBsXVB8XVp4Ef82THaWR40K3a+bFw78I4eLHesi2X9?=
 =?us-ascii?Q?NbnbppJcux+j6DERI5G9iOyqGFnWGltc8vLb73PoMg8wzgYdVymyz8rP0uiM?=
 =?us-ascii?Q?LILIVKdeF1Krz6YMM0LmLyVYtcBQ8Y6qlHnWsrTHHtp9Ag/pRXui3biDjx7r?=
 =?us-ascii?Q?EwrmS8FvzRxUji0hH/44ishq2S0MhsFnZ/ZpVDTdB7Vc/gxJ1vL05dg9NV09?=
 =?us-ascii?Q?nJ/AV3yKtsDIJAL/lsI8/ngrIOW4UN8IPRhthK7FsdZXdoz5km77wmq9SXCf?=
 =?us-ascii?Q?g4TDc0w81YrhTmGixZE5vCXrz/lANvO/P5dqwPk/hed2WUTDLo6SRsN3nqiE?=
 =?us-ascii?Q?hyrfGO/b8R2mKWId2+7wpe7UEASicXPQ5ShkKDkYtvahlXJtv+c0yQK3q6g3?=
 =?us-ascii?Q?jY+vcQ2TULsIrAPDN/QfXcTq+qP+GUXGqYyGmqqrHn44Tcawpv10O3Uza5oR?=
 =?us-ascii?Q?GB4dH1zq15xOx1Th518P/3iVV19KGhmJSJlr66SQUvqRpLpcbALJgHe0J8L0?=
 =?us-ascii?Q?1sIYEhw5PIpYzmNT/aH3kjMhIcdRBWSkXAIzTDj7IjzPFHcXNuQXr/HCk85m?=
 =?us-ascii?Q?+wBSGp+6tmSavLnPVnxQO4iIO1liyPLa1flICTMTE9DhLARItWEKHq6llsSy?=
 =?us-ascii?Q?ZppLURrFcjVHtgUnWAryli/IcR+nOPR+pS+T1rQoINdCW4nmaX1IoOIriYn5?=
 =?us-ascii?Q?XrViM7PSfkGiDG552MZbbOgKXOAPAmJU8dtFl0MX71z9Cf3UOF/u/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rZzOvt6fizTsG2bIuvzOd2uzsBVMsgtXAk317oIPN32RowG/a2JoQmfmfU4/?=
 =?us-ascii?Q?T9VLlzjElfS6ymwh7fdqAnWWcO63oNDxnTu879gtdNsHwRFBsSvS520Oqp3X?=
 =?us-ascii?Q?eotbRf9NwaopxnjCoyuJG8dLUmUknZMtDISbNkNVtg3Zx6j9uvN4dR2zcSWm?=
 =?us-ascii?Q?L/TCOGVr7Ur8KBInfMZi0AtW704IgYD2zWJeTSA41Npq/+YRglPfWmoLEXkV?=
 =?us-ascii?Q?tqxlilMBHGOC5Jw15rwhlLhyyGo3N3ZyGr8DHT36lPoFDL/ulHaQNbL7XaVc?=
 =?us-ascii?Q?a1pTc9M1u2wZj6SkkfnspyD7rH9pOGu+4YOeu+hxWyXvtW7AgVXAXwyHTGop?=
 =?us-ascii?Q?drxLVkSnhn26wJ5+iWyVPiWiWQb1WVPsyMS2O6v0vsHmy4o6ns48uSc11ZBP?=
 =?us-ascii?Q?zyFNHIQdaZy7GpZIUR8uodq6piZfPAYq65SLV4G98/NgP3z8ewptZxQ3O1WU?=
 =?us-ascii?Q?C5Mk8VxDdyAhsmsbCb+3mKZlu5mA84G4SKqNrNToYM+gMYnPk95lK6CeIUiG?=
 =?us-ascii?Q?SXtdI3KZpDkG2tbTUoSDLe50TG02/Fklwcn1vv+BZq0WIYHsbTvZjPOhpaQQ?=
 =?us-ascii?Q?mut2sEfRq8mT+DVXlyb05FeYae2g6qP5gG9Nir0uH6MmO6WjFa9ekHEF6kAH?=
 =?us-ascii?Q?cJJ/1Vef17j/OODTeULfpDPtJt9efgEtwPwzDoPd9a9iLjPUf0ii/BlDZgFU?=
 =?us-ascii?Q?jStt5QEu/G1shyx/bpulTTmjHDE9jyniN8m3nzVxnAAk+MuEIUJfbW2u7M6p?=
 =?us-ascii?Q?aJIYtGpmyCiosAgn3kZrspOCN8QqeAEcvD6/Zli5F3sTyIQEyBXimma5d70z?=
 =?us-ascii?Q?XRx/4+nsIw7YdRsW7O2xdSIZURJVmM/NfELAuCU4vLpFy3Dsl5uFrVdNaioQ?=
 =?us-ascii?Q?Y1hna9ibifBrvKOCFq6K+QD4rPW1/ReAxbzbo8nQHcRnvxmCtk2j/ET16yLW?=
 =?us-ascii?Q?JvxTsfhwwnZQVVD6bcVjihG4EaDd0nfsQev1rpCuNDPFYxSuX6ypMjnOlV4Z?=
 =?us-ascii?Q?1Oi3DSerAy6rA+Esg3JijujRGNwjEbFwJNbBCfMZJvkKdLQYyYh3B3E9+LMD?=
 =?us-ascii?Q?672uYsJFrZHsd2Ror3cJ61fCFg4DItunn5BUHVjuCazdDCRUd3R6/YslP+Ne?=
 =?us-ascii?Q?GinmGwyHcav47/GzQ+fvGa7t+lMhWjjh44Gs3bKi1t0rpDf1MVFqhp21ykNJ?=
 =?us-ascii?Q?iepEIq+H+R8hQk3CgWutBEKfs5cxFX5qVjN8pPFpGWrgkCq9W/tCzdOlUddC?=
 =?us-ascii?Q?1VOhCBWPpOXHIvIbgkumwUgZJLgbkSu8AbGBmA1sU1Pas/nKuPtQ6mc//MRa?=
 =?us-ascii?Q?lJtuYGr+6i6nIeqtfc+dbo75zFL9mWvymALlMU/CpawRWE6aXUyn59i/PUxz?=
 =?us-ascii?Q?2ehJIyODVp+sRvVVhBAtZfjjFdXCOSKRD3SaaUY4gu9Og0INYeU+hp9UteS/?=
 =?us-ascii?Q?xFpfBNcUF8VFXHRDp80ZkPPXnpE95zWRLW8cYzKS/z1bST1dTsOigGc7qk+Z?=
 =?us-ascii?Q?1FDElkCZMzXQQs8rwUatOMRQpkxc9P0iz0wL4RYn1BbTdc/7ywcZMwYe/H0J?=
 =?us-ascii?Q?PLHV+z+FDZKLvXgtEqPIpxww3JKO4y48NRbRvENflv+GP8QcbGEalDAhICEK?=
 =?us-ascii?Q?s3jspi4C24Qj2pFFERY2rFkNtdV7po5CNIL5deRwcld5z0N0CBDmRULxYxnH?=
 =?us-ascii?Q?fSDCAq90qxFeTo6bxkP8GaF9xwh3vhcB2XpCNHaPxrUDcdGeMNoyv6iu0EvY?=
 =?us-ascii?Q?LadTtkQ0hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a15c69-b99c-4429-e735-08de51b24b20
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:12:14.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vJKdwCjikFRBknU7ft4CyWn36p/Q5lmXJ4wFQ8lYgZDDjSbCnFtfsOBZ5LqC6JWkb9a9Q4Q3Lm+pwTQW0IQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8372
X-Proofpoint-GUID: csxpaENjrTial-AufB0muFMxf9yp0OMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2MyBTYWx0ZWRfX2zX0A5ebP29m
 CdPS1aWXtAjwpRUEs+4ZPqgvHDeHYu/sQHLo7QU618pPed5+ra/8OohHHn37iMXfSa/rvOpDYZE
 BvYy05WogA9ztqdSx/SmG04dv6uvgm2jSqqWfJmf3o0NQ1/uJ5drVo5TMq9Df85vNUYwCW+Hcl4
 EQ8jhUhd+ya9yQ+oAvgdRQ9y4+fjOMgqtXHer0+QxjArScGJI04LdcN2gVgRa/+Pfk8rnzv+VMm
 LJc9QbCEDzZhkei5J2kAj/4/qAo1cVKXm+5vFOX0ySimySVeoPan03LWIjatcQ6+8RmO1a/MSNo
 vwoG8/VSviurRIySdwVy+UeNSNQq8spTg2+CNI5T42R+Lqxz2nmvPcWD8XZ4JC7uiIuswXUkKBe
 gj0L5LayJimNwlH5FpIp+161bILwk2fxdjiFhf8KK87+XhYUmBDkECuN+8V9SY+hJcDfZSAiFHz
 8OgblAlji1QMq6YVhnw==
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=6964ace0 cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=xM-FUPNtTvUpdSPhqdkA:9
 a=MN5MmQDxNtH1qPK1:21 a=Hti1SrPgC-EA:10 a=nwb-CePKZZm3gL-ai9HY:22
 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: csxpaENjrTial-AufB0muFMxf9yp0OMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 08:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229189

The keactrl script is used to run Kea from installation directory and is
primarily intended for developers[1][2]. The initscripts should call kea
daemon directly, rather than through the keactrl script.

Also add a volatile file to create runtime and state directories.

[1] https://gitlab.isc.org/isc-projects/kea/-/blob/master/src/bin/keactrl/keactrl.in?ref_type=heads#L10
[2] https://kea.readthedocs.io/en/latest/arm/keactrl.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/kea-dhcp-ddns-server            | 16 ++++++-----
 .../kea/files/kea-dhcp4-server                | 16 ++++++-----
 .../kea/files/kea-dhcp6-server                | 16 ++++++-----
 .../kea/files/kea.volatiles                   |  2 ++
 meta/recipes-connectivity/kea/kea_3.0.2.bb    | 27 +++++++++++++------
 5 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/kea.volatiles

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
index 50fe40d439..ebdf6f4dd6 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
@@ -11,8 +11,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp-ddns-server"
 NAME=kea-dhcp-ddns
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp_ddns"
+DAEMON=/usr/sbin/kea-dhcp-ddns
+DAEMON_ARGS="-c /etc/kea/kea-dhcp-ddns.conf"
+PIDFILE=/var/run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid
 
 set -e
 
@@ -25,13 +26,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -39,8 +39,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
index e83e51025d..247f15d7fb 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
@@ -11,8 +11,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp4-server"
 NAME=kea-dhcp4
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp4"
+DAEMON=/usr/sbin/kea-dhcp4
+DAEMON_ARGS="-c /etc/kea/kea-dhcp4.conf"
+PIDFILE=/var/run/kea/kea-dhcp4.kea-dhcp4.pid
 
 set -e
 
@@ -25,13 +26,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -39,8 +39,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
index 10f2d22641..c04393ddb8 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
@@ -12,8 +12,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp6-server"
 NAME=kea-dhcp6
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp6"
+DAEMON=/usr/sbin/kea-dhcp6
+DAEMON_ARGS="-c /etc/kea/kea-dhcp6.conf"
+PIDFILE=/var/run/kea/kea-dhcp6.kea-dhcp6.pid
 
 set -e
 
@@ -26,13 +27,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -40,8 +40,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea.volatiles b/meta/recipes-connectivity/kea/files/kea.volatiles
new file mode 100644
index 0000000000..d0350e38a6
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea.volatiles
@@ -0,0 +1,2 @@
+d root root 0750 /var/run/kea none
+d root root 0644 /var/lib/kea none
diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-connectivity/kea/kea_3.0.2.bb
index 11e9bd13a2..ae1a1a74cf 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp4-server \
            file://kea-dhcp6-server \
            file://kea-dhcp-ddns-server \
+           file://kea.volatiles \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
@@ -63,17 +64,27 @@ do_compile:prepend:class-target() {
 }
 
 do_install:append() {
-    install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${systemd_system_unitdir}
-
-    install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
-    install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
-    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
-           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -d ${D}/${sysconfdir}/default/volatiles
+
+        install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
+        install -m 0644 ${UNPACKDIR}/kea.volatiles ${D}/${sysconfdir}/default/volatiles/99_kea
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+
+        sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${D}${systemd_system_unitdir}/kea-dhcp*service
+    fi
+
     sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
            -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
            ${D}${sbindir}/kea-admin
+
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
     rm -rf ${D}${localstatedir}
-- 
2.34.1


