Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEC4D64095
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 08:58:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10484.1765961893912071964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 00:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sWgt87ig;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446a1d75a=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH4lgfr2427350
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7U35D43VeHUCAThbJ6Pc
	EgdmH+QA8BPhpx8nvQZDCjk=; b=sWgt87ig9q1IxJi4fLhHb2sTkpUOSEAfUGJi
	R9Vsjfzwa/sTDEvmbpIJ+5wdMrkVmcas0xvfg/AAmYxnrPIjotHry5V25c5/ZcPU
	5hBJMIloC1DTOs/yuHgNC44Co/gfbkfbBdoR7yQontlOArtCJpxkM5nDwAdkyOas
	MgebEpGwzmyc5Uu+tuK3Zx81h7jJHN81cK4HBmiZcZiouR+DgtOD0n/ZWQ9b44Sc
	VszcK/WuMiOmbxE/dXXqA7GcMctnshaYC8cfH4KQjzn1SmUU16rSTXhnKl5mM3sf
	dNPqaZBS7kRVcmmw+O45vsMsyRp4DJY4Sgyry3StMMb06shrcg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0brba7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:58:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvdhNjzCOT7gr/4NrzY7hm9JaCOiWKOQWrGJkxZORlY+yWlPUnflG4Qo0Yv6WsSvdQqIdv2GushqwWOrjKDfWAUNh7m+at36G6HtdEtsJrEjYPB/xaKfT1z2sPWWo1OKkkhlO0qLuv89Lih+GLGNjhR9yGXwhm1wnpkAMCsdW4ahSA0OpDac/XP6ilETwoukPK/bkS7IL6xABrZwAh4gFem3ANy74LAu25MEVcXac9wVlmfKtWwwSK2rOIjOyK5NcdZHM3ovhGCEvpzz7ZjM3mQK5tmptgAJATn8ljB/yOk7T1GW0buG/4RXoZ3xO2TXU1dc0Yy0HuZk7TR3z8OaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7U35D43VeHUCAThbJ6PcEgdmH+QA8BPhpx8nvQZDCjk=;
 b=VeZrC9eS2ujHBNb5G3lO8D46PT4Knq92yY8OIRZ4yThbfcLlLCZNvi2e17yMPGrZpwtEOzNyAawKIxqr9ehsBS1FOTeYyfmeHG47rUPJnEJkrVrluJM6qp5GEQz+75ZfAahi0GC9RQLMZsU7RrivCHNe18tZJfjSz+zYz8vyC2p1Bt4elyhgGIFfRQ6mnwaKOOXTwxS6sG3UQtPN037R7lw2+chWg2hfzY3rla0p4Js4ultOVJ+YfgLX4tWeFCdDeNUeEt4s7VQdX4lniRQaJfP+0nk34OQJQT8PanNOhAK/pKaw89jPqvUIdBW3BsYFLDzfTVlWRkNj3ia1/YgwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB8896.namprd11.prod.outlook.com (2603:10b6:208:57d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 08:58:10 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 08:58:10 +0000
From: liyin.zhang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] rsync: fix CVE-2025-10158
Date: Wed, 17 Dec 2025 16:57:52 +0800
Message-Id: <20251217085752.1938978-1-liyin.zhang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0126.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c347714-9d94-4bd2-6068-08de3d4a6722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/AioDBfbevwfS/pCaM+l0hiVdtimWwxqlaNtHFeJdFXEBNvmXiZDkAVAF7k6?=
 =?us-ascii?Q?DSyJKsdTgXPzolAmvMofyxcxKayN0+a6X/fah9TnUtrZQ2RaLKOjsu3P94Wf?=
 =?us-ascii?Q?iJFFm5/HNZNqLfUYAOFCi3BVcdbumycahGkILSu1QgF2vhzIf+znxVx/yeiI?=
 =?us-ascii?Q?MOxItCpPbpEWpyY8SSegyx364IWRvUHrkIpqLC0PvgVs2EsX2Sfeom46Uryq?=
 =?us-ascii?Q?g5K6n/ndmdXJwiCjQwxVBm/h4w6E8nkGTBBbfVG+20SONRhzW0JeYPYC0FVl?=
 =?us-ascii?Q?2GmeTnStRMdcfS7fEbw9REfhavf4u4tb8NITfyEQzHtuTnMZgiU8THcS8ceo?=
 =?us-ascii?Q?gfPIs7MkoJsCHulPAnINp72hx7x7eYRrtkf0md7CMy7cSYPTtCUIVnXREJbi?=
 =?us-ascii?Q?uqB5mFdzP/iFeCLWRIrcyICEN9dK8xKgZWKK6/4pvR/axv3ZwRhRNpb+DHQ7?=
 =?us-ascii?Q?Eo1u7DvgjDMraU5t6zB5iwE+gqIc9PElfpA/INaipxtqVq5H5H6v4sEmcHZt?=
 =?us-ascii?Q?OqEul1SEFLQbZLlRmQc+Zmiq5PdTcggpObMZi71m/b1cFGGF7pGBsBEdLV8K?=
 =?us-ascii?Q?BZQ6uSToFkBrvZ953pbpbPz/EDeNa2Pef4XUu75v0TwzNFGa4ejo9rKPUjlP?=
 =?us-ascii?Q?utJ0JH4wuVZHCyMzHxXaZMKiJLhaGrlSbg1pWb9OWA+UzRdR3BKXFcB+vtcr?=
 =?us-ascii?Q?l3a48jQn+CzUeGVLUxeHfmGNaAmrORsnGCcrTTOEzL76JcvCCbBtGFSlRrak?=
 =?us-ascii?Q?WYRh09MaQXbYPPB+/5mEIx0wVZfoawGgAvvbyd4e0Skap2FYNE3znDKjgE7o?=
 =?us-ascii?Q?GaA5c/owUTU70m/6+1W1Fmshk2hm3BE6UpCbWoFadAHWd3eXG6Z3RpFd0yq+?=
 =?us-ascii?Q?R+refcnzM68HAi46Ok2AewXeHnjCVhg+BzZMAzxRMrHAiLKIHE1iDotuxTkm?=
 =?us-ascii?Q?mr9YFNi1L8hewiOEVqvSjwPf/Vl3r/sZCC3f7QGQTAqhhCXaYmfeZ1Typ0Sk?=
 =?us-ascii?Q?0uOUHkEH5skXhjduqFeR9tn1SfqZvGfsoV+xAqnMMTCfS/DQs/uTPwSXytAj?=
 =?us-ascii?Q?Ecy4e6fljKKp47N2frPwNpouFf9jCNiJjdvxPQ6IDAHMsfrBQXovgicDrEOo?=
 =?us-ascii?Q?RPL0+0MfavmFNw/0wy0eUzWKjqoRFRqsP/uWG7bd9XX996YZYXCkmzYFHelZ?=
 =?us-ascii?Q?BCB1C73wfxEJf/eAEcpzVEfrhlO1VyyLDTRKMKFS771wq/bdtwGWjyF2UjaN?=
 =?us-ascii?Q?uU9o5tFD5ecZtTWPC9JVUJ7A5077PKl3WDn+zEnMztD3b0k+IFu8Y5T18MsL?=
 =?us-ascii?Q?ULgxIrOOzmnlIPBh3AD91HgaDdSWogdshfjSYgEsfe08OFBiWXkG6XC0FH0e?=
 =?us-ascii?Q?yapJEEtlJVa1IBbnWrLEzxQ3LOFn4YMAxjLUXkajnH8H7nE9VfiEoZ2pmgZh?=
 =?us-ascii?Q?egDDcP3PsMUEJ/pK2BA8HgOB2MBI/cpN+UG9w4lTHCxQlh/jeDivt/UgRWzK?=
 =?us-ascii?Q?7SJciB6Xgb1dynzdiOG/GN9Yd+foX9xvmuuLjwn1YWjwjdssLYgk9ZPyZA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j3jWbGyf5IpbGi1elv7bvVpE30RszMhDkQOJjxftCElLMdnw/j6XgXIzcsw0?=
 =?us-ascii?Q?wUVNsvj05bJ0/VWUeXKLzlyXTbFMPB2+PVvmub8Cb02d2q+qxrNgnB2MVRef?=
 =?us-ascii?Q?Hi+7hxdlTQWwJP4yHff7fVHeZiK9WxuOgIIccS655pRJR1dWCftqEmJRGtpg?=
 =?us-ascii?Q?UvYAEr3ksNM5/JunGkY3EKNHyFKXzTmgYPhiQF8kAzyIEgUEwSaRBZJzfrJO?=
 =?us-ascii?Q?PmF6Pp46YhH7LW5Rc3QDdKzqZXRUO939c/pDKfXKfGs1iWk7HTNpy5RNln1p?=
 =?us-ascii?Q?LcfSA0StGzUjGUNH6Gj/EyUN5Z25wxVafdEA45p5a/YYGKxvNBQpFyVQrvT2?=
 =?us-ascii?Q?+jgGdbLvxDMoPh1fFLd+m3bYvWlPcIeOiUQKlaWWIWIW3SxfWZTxYhoUcWu7?=
 =?us-ascii?Q?o02unqQ/Zdg8W1mMFfRECOluXtvy7DVE7gSF5BcNUMH8rHADapzF+bd+444e?=
 =?us-ascii?Q?11YMh6RPBsDX9p8AQ+NE/z4SjY0V6kBwg2qShGiWcJ6jCRZFpHmQTJh0g+Vj?=
 =?us-ascii?Q?Q3dmJRci/CWPpJyelTVHr29IGdJSs2+XNe7xhaRpqCFqQ4lK6q/SqPVPvFyP?=
 =?us-ascii?Q?fmqlcwTPNNk08cOMj1GXSqLQle/lTX+/K2p6YG7LUz4HBSiUiHRVmoAvlLz/?=
 =?us-ascii?Q?x4nqkpArIza15OajZzzmAxDlySDqjU9qswf1toA5aK9tsLYvBoAEkIOQlPKw?=
 =?us-ascii?Q?kG0wWNU11AIkv3b8trpJrPMzQsHdo5iNTCmPxaMxYua4deTLOktJDWjDrLRf?=
 =?us-ascii?Q?f4/EzXmFWpLVS8mLA+xMwtuu52D9zyzgrYOqeBRm0uQ8ctd34rsNUL8sOR0A?=
 =?us-ascii?Q?pEzmZBn4SStxGO4SJtiJlEXHiYHtVazkOOGpQZHPTpxWgKt3KOd/C5lYpTCb?=
 =?us-ascii?Q?ZoO/2p54Tv3mUKPXi+Rdira4TeyRKxVFDDQhl6kuko0RBDsjnhG6COkvMj5x?=
 =?us-ascii?Q?QhNc1kWi3ZhhcF/2c885i9Yp1h2gzN6Txj4Y22p/apw+/8I3mQlRvCgP5ljt?=
 =?us-ascii?Q?w4V8lzwFpt7SsBDT7ZBJpLFm82SGn+9Mv6JRr7dhbSF5yC0qNLajTDXTNgNR?=
 =?us-ascii?Q?SJVROs3fMVcvaTUOfDDf3NqWg7ZIu3VxROKmzCZNiDHP2p9V3U1PcbdOByep?=
 =?us-ascii?Q?/QlXP2OSO+m/pJfCSLmIuzICDQCdJi6wEhugArnTrBdwfQGXNkuOeVXW5Udb?=
 =?us-ascii?Q?/dt0pUl8iFUsliYNzbF7eFc/bpn6raunO1mkaFYFbSQGQ0yfNzPS+P7fN8xF?=
 =?us-ascii?Q?6eCRO3yDpSexbped+ZwPT5rhZwi7OmqNcHH9s+82+P004Bj1dsVAAo1RiTOk?=
 =?us-ascii?Q?VYq+3WQ2FL3JQkr0poDrbNdqhTEAAzqllL6qasO4pE6SiNllSto3yru1h1tu?=
 =?us-ascii?Q?bH7RoD2MPdMb2PPUmLmdnU0L9LvZN4DaGEIR3Syf0T2M3Jqoh5ltG1arObhy?=
 =?us-ascii?Q?ajWEmbpFcAo7Vhj+qHcXc9DXx/Nad2BcKXFuSoLEjS/Tw4tDMlIrHbGEe3nt?=
 =?us-ascii?Q?IkF0irdsbBzVcpLLr3NJBnPxAiAvSwUNQREUIhr+fKLAgIb0Ei8CG2d4EGh5?=
 =?us-ascii?Q?arZKdpTSP0u5+BW16TdCw4VBDH3NNauD9MBrhIhBMzfyujKVHNL051j2/C5n?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c347714-9d94-4bd2-6068-08de3d4a6722
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 08:58:10.2126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1r60qsPsiBbbUSP6RXZC6VUTAEDS70tzrvYtj/VSq+HDnKd30b2AghJKUVOkhLqkTeT59MW6xkmTEZ6TucnbLDDD8ClypMGwZnOfoyG7Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8896
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MCBTYWx0ZWRfX89PujKZKeUc5
 au2RdgrKd6MPC7blLVZJapGeqkKgzEiAvqcyWv9BJI3Qbz+fl7v6wsB9IK3QUWmScGBidX6zcOB
 O2v9tdHriMApQH1W6umJk7jWONOpr3Z35ZHOU1IVYR6Tu4FhHhHq+BErg7m9cGeBQ/T4OxzCe5B
 A7I092LF5NjveW65yGL9/VDNQxk4i4rNcs1WdFxkotT1cljUbzOrDRQDbP/nq3MkHnygl4QKmk2
 A4iVx6Dhxvo8xdFM25RVc6f6UBjQ0EX28A0nhk3L7gPhik1CBDkLsjJ+iGuEbF7bPCxO/T9X0em
 reAQaFWxSvSjoyi5/SsjyVAJMRiQiWe3IR0LUFVA0/Zmr20EBdymS2wSAm7cwczjL+2AWbOgrSs
 KgyRfqFbDGNbLZuQQjBEwj0V8VH4ww==
X-Proofpoint-ORIG-GUID: gaMbwp9Zm4trQub4-b6M5UoGIfCaGwIf
X-Proofpoint-GUID: gaMbwp9Zm4trQub4-b6M5UoGIfCaGwIf
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=694270a4 cx=c_pps
 a=jJEkL6Umpl9hNhu6gfQ4Mg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8
 a=oq-7gxcSAAAA:8 a=OXj39j_Rc2b4oze2xNMA:9 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 08:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228009

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

CVE-2025-10158:
A malicious client acting as the receiver of an rsync file transfer can trigger an out of bounds read of a heap based buffer, via a negative array index. The malicious rsync client requires at least read access to the remote rsync module in order to trigger the issue.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-10158]

Upstream patch:
[https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
---
 .../rsync/files/CVE-2025-10158.patch          | 36 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
new file mode 100644
index 0000000000..cba7002870
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
@@ -0,0 +1,36 @@
+From a8fabf850c3c5164520c307199e9abc5ded45e4c Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Aug 2025 17:26:53 +1000
+Subject: [PATCH] fixed an invalid access to files array
+
+this was found by Calum Hutton from Rapid7. It is a real bug, but
+analysis shows it can't be leverged into an exploit. Worth fixing
+though.
+
+Many thanks to Calum and Rapid7 for finding and reporting this
+
+CVE: CVE-2025-10158
+
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/797e17fc4a6f15e3b1756538a9f812b63942686f]
+
+Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
+---
+ sender.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/sender.c b/sender.c
+index a4d46c39..b1588b70 100644
+--- a/sender.c
++++ b/sender.c
+@@ -262,6 +262,8 @@ void send_files(int f_in, int f_out)
+ 
+ 		if (ndx - cur_flist->ndx_start >= 0)
+ 			file = cur_flist->files[ndx - cur_flist->ndx_start];
++		else if (cur_flist->parent_ndx < 0)
++			exit_cleanup(RERR_PROTOCOL);
+ 		else
+ 			file = dir_flist->files[cur_flist->parent_ndx];
+ 		if (F_PATHNAME(file)) {
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 37e79e1e56..e3dd1702ec 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0003.patch \
            file://CVE-2024-12088.patch \
            file://CVE-2024-12747.patch \
+           file://CVE-2025-10158.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.34.1


