Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BB1106ACC7
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:11:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25484.1773331886767725484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ACt3oiaI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75312e9bb6=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C6es1W3162649
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=JoHqLZAlX
	ZqqWR/8b/ydds8S+PYsr/3aUyCbXDUnovM=; b=ACt3oiaIl2Dbq+yBn/zHyPSVq
	4epg3lMmUu8swwHriXqHP9ojlQ4F7VuOupD0qcnJVJhvcUu3BUAnKLvwWmg2DwTI
	NJMRDEpRm8EF5MsVlE4KXYX6S+Sa96EHWuPpSemVphgnFi69Hfq7AvaJl9NBpF+Q
	j5fnCdzO4ZRok2IpXAArXx9x8CZJX5WrFXu+zkViWczjO9CeAvVs/FW7k86WYts+
	L8jmbKR4GFWGxRZa5bGRfDIb0rltLQuz0IlQWhy6uDevH8G7QuqwMIMlm+F0XYzr
	EO2KPIsxFwyeeHO+HJUJLj7WGwe4ZL67N5K9SSzUrTa10s7bhSEfJ0mtWi9EA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013049.outbound.protection.outlook.com [40.107.201.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78h0c6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WN+0W5jyNntS7paoSWQCS73Dr1is1oFhaemu8VQakKq88Eo08KQirA4+OzkzTfTisNa5Sr3AOqx0MJ38vlTFfSHHlqt9HNTtQHAVyq+RYRo4R07/6Z3BOr/j2jW695rI19s8c9vTTiEtUU7/l/YEDFBoc46blltPLu73QV6aFHWQrGBPvnvqS/w5rhZDK0H8dF1Ei9m82jtNGsetO+xJ/X7BXXU3pEpxmwb+fSXZoMdwX+Y/SHop1+ZkpLbrSXveBzOJAIVDLcSA/NUrWLzGoY9RXFm66YVAz6clTOUBADE7sT3ZmWji6rNqW1mGeJsW14FhCd3OGS4hI2P+VmNqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoHqLZAlXZqqWR/8b/ydds8S+PYsr/3aUyCbXDUnovM=;
 b=jfiXpU10evwU4Pnb2WvH6M/fhuYJGsaP80HsauQ5dveA/GOsNah3EmFkBIJ9SsGdRGEjOHM4NE2u+w5gqq2L68hq58crFomFOt6w3UVt07pSO6z9zkKYT4VTELevsTdAQ9TCkoGEXODt0I1SeZD+/+gowSG0pY7NyL2G9njtK4e5tZYAyU8o/oPY9k86JlAJRSX1lSPfCpThOgotVsYsu7nNnkAQ90wD/7v4AuoMmlPl2ieH2MI1tPwbcRy/78VkTGw0ZO/EZMhwmiICmZ59KhSi9rA4qfMGrt0sddjfmes8HWRYFfFhD6klCa0g/S5lmeyfaMmwia8AE9envX3R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 16:11:21 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 16:11:21 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH v4 1/8] glibc: Upgrade to 2.43 release
Date: Thu, 12 Mar 2026 09:10:16 -0700
Message-ID: <20260312161038.2578649-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR03CA0303.namprd03.prod.outlook.com
 (2603:10b6:8:2b::19) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ac665d-a81f-4ab5-e8fd-08de8052000d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wVd1UuHrU8+pPWVlGho6laSg7CwKodcH3V4A7r59vS+0/2qyKVS5n8I0+NTDx/eqYESMX2MKtwyXbdZumq18nq+9FN+XlzZAexjgtWRnXthKtb6OdmmcwBViFsOle95GXgWDXaGw+VmP6CEV9UplH8dP5SE4kDSSpb92f7XLFmc4+h5XC/9zjPVdkbNKH+pAHX6oRw/d/PbTYndrzyrZPEoBRdhuOC423zDu8nuaLJSd/4kd37QvIe4T1FX3LduPV3QxxebpI+NG0EiOJ+EWA9ZC4IPjcXMyXRm4VjBDjUiXQzPKGV/Tndat8pz0DI7DphZeOXu9rNfkPmqeFp7Q2O9TXh30pZV31sF0uwI3ikQJEYrEiZGQtNm6SUqfCqYG/Tat+1ubTvLOUuYtNsi4ZYeT4maWs3QD804EHBwRbWEa+Cwz0qhCYqbSjp3nI3PrhJ9qP8daCcz+y/DebQeVGWcin5YwaszTzIIGVoDeTjXWbpLgR0tedZwwt10TWfx9MOqfrgBaCVUqnAEeD0Yc4VbKCY8mdwzA0kz5izNUrR6Bgszs7N8fRe3PqLHm3Ve78eEwx6x8OgKkkQa59hnacpWoztOapezIH2wo+gt3Qh+wKCFY2htRrDDW//OeAHKbhQH1QT+gK5j+ERbxxzGklV8+9UvMAxSkITZsNLEg2TBLfiAHuyc1SFJ1fAH1+kY8T0qMoULxs5eXxeUoo1p6i6SfT3uPQg7B7IY5340bbPk2DHU+ssp+YR10Y63AfvjTO0yyAaHIXtqn5q7TcKmup9KkADAPQKLPQ2VF2Czq10c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OSmoGmEcAGBbxZ6gXPkXf+ztr3sbqHsQcrzFfTVzkanvKKa8w1excCNZ7aby?=
 =?us-ascii?Q?u0Er5drJ+7Haf6p7fuVb4XK7HO9Ijs4N/q9Fl6gRpyXG5dBX7v3PYpD2HU5+?=
 =?us-ascii?Q?LQPO5q5kdyzz3lPr4+DWDhrqHgZZVMOiqOXSVQpwP7493ZOcOPRRbk9CmpnI?=
 =?us-ascii?Q?pZjFRw25o3guwDOk5Yr3mu07O1t2FyVwfBP1n86xhp15dh++0MSrGJet4Sso?=
 =?us-ascii?Q?R5QR9kEX5nohxZfFmL90a8qI/terWKbqVMta+ysKDEWspuEvw5+hUmluVk02?=
 =?us-ascii?Q?lbzbWeF6Br8TWlLL1YkXKv7QB0zmrEtcskTF7+IybmCkmwP3k4cZXpvJd/0o?=
 =?us-ascii?Q?jPG1W7t1PR9OCAmJFzAuX6lvCajSXRnzv79Iv6mV7sNRnXFa3jVLaikmH6Lh?=
 =?us-ascii?Q?H6+DdHTKDZ21IWfUYEKlbofUNgQazG+GI0uTH6WxSGEnk6JwBVfB28KqKLk5?=
 =?us-ascii?Q?jf2d4zGWBX8nsv1DaZJ3zgOBsRe5X6d2NdxOD50UgRdklI5nA9MV975qqR2Y?=
 =?us-ascii?Q?JmkRAb6n1StFjZ8M0LZgn1CI7LONC2MQPB5a2kRDESZuqgwRZibefOW9/LM5?=
 =?us-ascii?Q?9VA1+4zkqiDjhAawwnGn9QSydzf9P4wR1CmdINnQquASyNeF6OKd72+HrMBJ?=
 =?us-ascii?Q?0J5TdnogziNSsczI/xjFrQvGJQfPZCG42AM5JbxdRL4LJP73GOkwdmWzgG+w?=
 =?us-ascii?Q?KyrmY7QIZPYOXyCwXe0tFQkY6MnLVqKmU9XABptoA6Lfu0As1G3kcsE/tSMS?=
 =?us-ascii?Q?0xrp4xLanTv4urRZHvhb/zchOOuuZZRsrq5iT3l8IMLhU2J/wHfg/2Y2NM0M?=
 =?us-ascii?Q?Gc3KGdX8eV12paHNeH587zNEFeI5xjYur0IZ5P3HOgopSiLZlUuD2+WwufV8?=
 =?us-ascii?Q?2bxb7s27RfN4TgpW5fuT5xDNmOlZMUkWT2rCukyErsOg8dd82FVT7Ni26gsA?=
 =?us-ascii?Q?HzutMp7/VLSCbgx2joo6KRIwGjNHLcXwUIvCC2jFaDqM0ZA00tw98q8YXefN?=
 =?us-ascii?Q?IRbcvSIYQX2bBXqdYNRWw/6eUD5WCmDWyLWOYLg2/jNuT0P/IIF8TmXUysu2?=
 =?us-ascii?Q?Jm7TRDraoZMx8sq0yIoUHk5dNPOaBHtUt7P2Fc/j0wVsAAz7snRnRPXoxhdM?=
 =?us-ascii?Q?59lJgQgeRJyZjyPzJqQ65G0J3bcZRmu4qtsSJ+AMVWXsgylhyAE6Jx+pV7Ue?=
 =?us-ascii?Q?7btlFm50rEwrMK+m4J5w/xEYYWQQDJNrXfFd/KsnsGidFOkqYtUgd79Tozdt?=
 =?us-ascii?Q?g8DWJAxP+pZpZ1yyc/XMPbcswtn9KWpaN78JcQuPZ+Z3IFfcHGgDbM7fdylI?=
 =?us-ascii?Q?gGlZyi83GKsT6V0fJ5h/svzGa0Z/Ey8H0H9OP+qiDkXtyx1p3uDlC9de/3eq?=
 =?us-ascii?Q?1r8BUGKnoZhcV+UsZgUYKH/idIKu8kGAaV+L0TR/dZa8d1cmI5EbZ9hYFmMR?=
 =?us-ascii?Q?UsGLv2YPtsn+VOeyjkocg/C/VkkzTqk3puJ+EAKra39vJ5KOJYL6A3NjCRI/?=
 =?us-ascii?Q?4VyS1WaIaBXEXehNKbMmKlnu0Tyty6bl6HH6qZJ/FYBQwrOCXWpkOmsDCzWP?=
 =?us-ascii?Q?tPTcbeKF2fy7vqb3fhCuCX7yr7VSswEnVJ1n7UcrTIsD1Yd6m+OdoCd5rabc?=
 =?us-ascii?Q?gTPRolpYmsecmpgV4SVMxWeA5l5gtUS4CTQFNOCcIemBbBwsg8ZH5fEi4zBl?=
 =?us-ascii?Q?EDLpPafNTAgUwl7Kl2ZFDePMbYrKlKHr7qmfugP5EcxM4/oW5uCHhJI/cTr4?=
 =?us-ascii?Q?8vLDvP8DHplFYjb/IrzmQigHx2lKcSo=3D?=
X-Exchange-RoutingPolicyChecked: 
	muuVByrFhCurPXLOxBE/ZEZf1eCvfkdf6h8Yub7DCaKzPTKIJEYJildmUrQh3yYeyhNFzk4qsohTki/qHwx5/dz9kc/prnxNMGi88HMWpvqAIE/5xkYSaoq9JBlnKNXmHCUiDqtJZ6eI4l5UR4MpQilBrW+L7VqvvamFiVUvirBxCzU5pnOSJPi1dQ1E0kl+I0sfHtkhgp2KF1v16Nl9FQ9/T983vuFwIXt0fLyZP1wI0yXQNcqS8YxGc0y19ohiA0WXAPZI6/+r9GG4YrvoC6bWUmGtdngcng181XiDina9DorgzS6Oovlr9LWGmcvLhZV9yhYjEoZO7nOOgOz69g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ac665d-a81f-4ab5-e8fd-08de8052000d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:11:21.4074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60yO3D6mXwcE98+kHSG7BZ/dqtHo8mZ8fEFhANisHujp6noWdhhEvUe5T9ImW01LJU+Y2Kx+7q1ytk4ylyIf0U9crtCURb56PDQJ3AQ18Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b2e5ad cx=c_pps
 a=Yfwwr8Yczqb7c+94X7Exug==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=CCpqsmhAAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=dI5JW_sUrKJV-tv36hIA:9 a=uO91iCofaAnC_pvr:21 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzMCBTYWx0ZWRfX6cV+N+L9JV0W
 IF0V8IGTo4EWCLuWntwNJCWwvgr5JVMQXjds6fN7AtNF7YjhK9rWPDv9ZOQ7P+b/4PPQt7CQVw7
 EJKYPL4/xN5UA9iedZKpLeSA/8ZCD+cOpp8WQD6pkrjoz7XZQnZfZ/RwiD6f+RT0xTHU0phRyVF
 5fNQEqEjyPUlQqffCaSO8vzx3nK90dMur+tgwGTuBtXr6XtkFPrA4ItWR4XVaKfW1rRAHuLjKrv
 GxUEhLqJLzyfNrHl6Romh8GHrUWAbGazP8zkaUrw8FSKN97LktS3tkMKe1j4mrLKexnwJhm4RFH
 ayoYFyHq2A0c9i3MfwSkw/8tCy52M3kV3qSDL6uSPHsbb5Y1UqBK55Vp10vZVFCum47uzjyB8Ww
 eGV/KFnwBG4p7pADM7pkCQm2IHPg/X4h29Rm9U2Xl0C7Pe5MA7eWw+dzm4ID2HLaS3+lShq0jTY
 6FSPuQt4IDZOQYNjHyQ==
X-Proofpoint-ORIG-GUID: z4y6f7DqPNeYS2I6REQTwrWpzj5mSAfq
X-Proofpoint-GUID: z4y6f7DqPNeYS2I6REQTwrWpzj5mSAfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232989

From: Khem Raj <raj.khem@gmail.com>

License-Update: Match to changes [1]

Added free_sized, free_aligned_sized, memset_explicit, memalignment, and new time bases (TIME_MONOTONIC, etc.).

Support for the Linux mseal system call to protect memory mappings (sealing).

Added support for the openat2 system call, allowing more granular file opening options.

New, optimized, and correctly rounded functions from the CORE-MATH project (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).

Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by updating ldbl-96 implementation.

Improved remainder, frexp, and frexpl.

Experimental Clang Support: Added support for building with LLVM Clang (version 18+) on AArch64/x86_64 Linux.

New CPU Detection: Enhanced detection for newer CPU architectures.

64-bit atomics for 32bit x86 patch is no longer required since upstrea has dropped this logic in 2.43 release

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...2.42.bb => cross-localedef-native_2.43.bb} | 18 ++++----
 meta/recipes-core/glibc/glibc-common.inc      |  6 +--
 ...bc-locale_2.42.bb => glibc-locale_2.43.bb} |  0
 ...bc-mtrace_2.42.bb => glibc-mtrace_2.43.bb} |  0
 ...-scripts_2.42.bb => glibc-scripts_2.43.bb} |  0
 ...tsuite_2.42.bb => glibc-testsuite_2.43.bb} |  0
 meta/recipes-core/glibc/glibc-version.inc     |  6 +--
 ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
 ...Fix-buffer-overrun-with-a-relocated-.patch |  4 +-
 ...Raise-the-size-of-arrays-containing-.patch | 18 ++++----
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch | 43 -------------------
 ...ake-relocatable-install-for-locales.patch} | 10 ++---
 ...all-back-to-faccessat-on-faccess2-r.patch} |  4 +-
 ...he-path-sets-wrong-config-variables.patch} |  6 +--
 ...s-building-and-testing-instructions.patch} |  2 +-
 ...libc-Help-bootstrap-cross-toolchain.patch} |  4 +-
 ...glibc-Resolve-__fpscr_values-on-SH4.patch} |  4 +-
 ...ort-cross-locale-generation-support.patch} | 24 +++++------
 ...archive-uses-a-hard-coded-locale-pa.patch} |  4 +-
 ...o-not-ask-compiler-for-finding-arch.patch} |  2 +-
 ...-the-header-between-arm-and-aarch64.patch} |  8 ++--
 ...-printf-builtin-in-nscd-init-script.patch} |  2 +-
 ...gure.ac-Set-libc_cv_rootsbindir-onl.patch} |  2 +-
 ...ll-interpreter-overridable-in-tzsel.patch} |  8 ++--
 ...se-bin-sh-default-shell-interpreter.patch} |  2 +-
 ...-failed-in-unprivileged-process-BZ-.patch} |  4 +-
 ...-tests-that-can-hang-in-oe-selftest.patch} | 10 ++---
 ...e-prefix-map-from-CFLAGS-to-ASFLAGS.patch} | 10 ++---
 .../glibc/{glibc_2.42.bb => glibc_2.43.bb}    | 35 ++++++++-------
 32 files changed, 103 insertions(+), 147 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.42.bb => cross-localedef-native_2.43.bb} (73%)
 rename meta/recipes-core/glibc/{glibc-locale_2.42.bb => glibc-locale_2.43.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.42.bb => glibc-mtrace_2.43.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.42.bb => glibc-scripts_2.43.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.42.bb => glibc-testsuite_2.43.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
 rename meta/recipes-core/glibc/glibc/{0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch => 0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch => 0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch} (91%)
 rename meta/recipes-core/glibc/glibc/{0009-yes-within-the-path-sets-wrong-config-variables.patch => 0008-yes-within-the-path-sets-wrong-config-variables.patch} (98%)
 rename meta/recipes-core/glibc/glibc/{0010-eglibc-Cross-building-and-testing-instructions.patch => 0009-eglibc-Cross-building-and-testing-instructions.patch} (99%)
 rename meta/recipes-core/glibc/glibc/{0011-eglibc-Help-bootstrap-cross-toolchain.patch => 0010-eglibc-Help-bootstrap-cross-toolchain.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0012-eglibc-Resolve-__fpscr_values-on-SH4.patch => 0011-eglibc-Resolve-__fpscr_values-on-SH4.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0013-eglibc-Forward-port-cross-locale-generation-support.patch => 0012-eglibc-Forward-port-cross-locale-generation-support.patch} (97%)
 rename meta/recipes-core/glibc/glibc/{0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch => 0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch => 0014-powerpc-Do-not-ask-compiler-for-finding-arch.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch => 0015-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch => 0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch => 0017-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch} (94%)
 rename meta/recipes-core/glibc/glibc/{0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch => 0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch} (87%)
 rename meta/recipes-core/glibc/glibc/{0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch => 0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch} (93%)
 rename meta/recipes-core/glibc/glibc/{0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch => 0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch} (96%)
 rename meta/recipes-core/glibc/glibc/{0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch => 0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch} (88%)
 rename meta/recipes-core/glibc/glibc/{0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch => 0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch} (79%)
 rename meta/recipes-core/glibc/{glibc_2.42.bb => glibc_2.43.bb} (80%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index bd4eb87ba7..4e4e3e0cd1 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-GLIBCVERSION ?= "2.42%"
+GLIBCVERSION ?= "2.43%"
 RUSTVERSION ?= "1.94.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.42.bb b/meta/recipes-core/glibc/cross-localedef-native_2.43.bb
similarity index 73%
rename from meta/recipes-core/glibc/cross-localedef-native_2.42.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.43.bb
index 95acb3fc56..cf48b9c83b 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.42.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.43.bb
@@ -4,9 +4,9 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 
 LIC_FILES_CHKSUM = "file://LICENSES;md5=df6e0948b55669789c30764c5fd9bc41 \
-      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+      file://COPYINGv2;md5=570a9b3749dd0463a1778803b12a6dce \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+      file://COPYING.LESSERv2;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 require glibc-version.inc
 
@@ -25,13 +25,13 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
            \
-           file://0010-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0011-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
-           file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0009-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0010-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0011-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0012-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            "
 # Makes for a rather long rev (22 characters), but...
 #
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 7422ede04d..2eedd2950e 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -5,9 +5,9 @@ SECTION = "libs"
 LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=df6e0948b55669789c30764c5fd9bc41 \
-      file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+      file://COPYINGv2;md5=570a9b3749dd0463a1778803b12a6dce \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
-      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+      file://COPYING.LESSERv2;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 CVE_PRODUCT = "glibc"
 
@@ -22,6 +22,6 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.42+git"
+PV = "2.43+git"
 
 TOOLCHAIN = "gcc"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.42.bb b/meta/recipes-core/glibc/glibc-locale_2.43.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.42.bb
rename to meta/recipes-core/glibc/glibc-locale_2.43.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.42.bb b/meta/recipes-core/glibc/glibc-mtrace_2.43.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.42.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.43.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.42.bb b/meta/recipes-core/glibc/glibc-scripts_2.43.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.42.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.43.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.42.bb b/meta/recipes-core/glibc/glibc-testsuite_2.43.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.42.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.43.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 9991c02495..89be8fcb88 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.42/master"
-PV = "2.42+git"
-SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
+SRCBRANCH ?= "release/2.43/master"
+PV = "2.43+git"
+SRCREV_glibc ?= "856c426a753450b8c6861a5b994a564f4fc16d4b"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index b63e05b2a3..5a4e03e924 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From 47dfcfdc8399801ee18317ec155295eef33882ef Mon Sep 17 00:00:00 2001
+From 65c1a94d4227d92b2945baea141af1937d13c290 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index cbb0ad3ef9..b865c8b355 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From 5ca14c7ac7f389d8a1bf34bb49cdbb2029779dab Mon Sep 17 00:00:00 2001
+From 3ca5838cb04addab174361cb53725ac6bc6cd505 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 04ae8fda97..e4d97b5827 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 8c06fcbaf863f83b72445a8b2b70c62a5ae55fe7 Mon Sep 17 00:00:00 2001
+From 25e211815d9298f979dc29af9f0586fd8b092e33 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 13:54:16 -0800
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 00b9da9ec7..bb31af89da 100644
+index 7355eef8e7..2d32ae9676 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2038,6 +2038,14 @@ _dl_map_new_object (struct link_map *loader, const char *name,
+@@ -2043,6 +2043,14 @@ _dl_map_new_object (struct link_map *loader, const char *name,
  			&loader->l_runpath_dirs, &realname, &fb, loader,
  			LA_SER_RUNPATH, &found_other_class);
  
@@ -48,7 +48,7 @@ index 00b9da9ec7..bb31af89da 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2096,14 +2104,6 @@ _dl_map_new_object (struct link_map *loader, const char *name,
+@@ -2101,14 +2109,6 @@ _dl_map_new_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 25c824c3bc..89eb32c703 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From c89731d75a2c15be0c1402556407ddecccd3e561 Mon Sep 17 00:00:00 2001
+From e39b52defe90067e5725e99c7238246c68a2500e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index bb31af89da..d331e0f01a 100644
+index 2d32ae9676..a706cef129 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -1750,7 +1750,19 @@ open_path (const char *name, size_t namelen, int mode,
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 23163d307f..9979344c68 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 3bc3bbda6092b1b6d497d24e319a10b4c8c48caf Mon Sep 17 00:00:00 2001
+From 179c398399444e772bb9f5c4ef6d8682ce390387 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index f9ca40de3f..407db2aa54 100644
+index 9458ffae2a..0e80847695 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -335,6 +335,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
@@ -41,7 +41,7 @@ index f9ca40de3f..407db2aa54 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index d331e0f01a..ee024f7136 100644
+index a706cef129..19a93ea9a8 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -107,8 +107,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
@@ -56,7 +56,7 @@ index d331e0f01a..ee024f7136 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/dl-usage.c b/elf/dl-usage.c
-index 31b27e5ea6..3cdb99caa7 100644
+index a5bc1cb4ad..7eb2ac1f1e 100644
 --- a/elf/dl-usage.c
 +++ b/elf/dl-usage.c
 @@ -24,6 +24,8 @@
@@ -87,7 +87,7 @@ index 31b27e5ea6..3cdb99caa7 100644
    print_hwcaps_subdirectories (state);
    _exit (EXIT_SUCCESS);
 diff --git a/elf/interp.c b/elf/interp.c
-index cc49e13c86..394c1ce0c5 100644
+index bdc7291966..5c401940a5 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -98,7 +98,7 @@ index cc49e13c86..394c1ce0c5 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 39b154c72c..c1014b773b 100644
+index aca967403a..dde1960347 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
 @@ -150,6 +150,8 @@ static struct argp argp =
@@ -111,7 +111,7 @@ index 39b154c72c..c1014b773b 100644
  static error_t
  parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 493f9696ea..2ae4a5d28b 100644
+index 29e7a4ddfa..70483518ed 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
 @@ -189,6 +189,7 @@ dso_name_valid_for_suid (const char *p)
@@ -123,7 +123,7 @@ index 493f9696ea..2ae4a5d28b 100644
  static void
  audit_list_init (struct audit_list *list)
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index 41ab0768c9..7c48c2b328 100644
+index a1f10ea88a..888d9a18f3 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -35,7 +35,7 @@
@@ -136,7 +136,7 @@ index 41ab0768c9..7c48c2b328 100644
  /* Type to represent search path.  */
  struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 0ee6571315..792308c0ab 100644
+index 26f0c1e0bd..41541a889f 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -34,10 +34,6 @@
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
deleted file mode 100644
index dc9e73832f..0000000000
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2152334c3be94993763c5abfb2911ace0b191cd1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 14:35:35 -0800
-Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
-
-The fix consist of allowing 64bit atomic ops for x86.
-This should be safe for i586 and newer CPUs.
-It also makes the synchronization more efficient.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/x86/atomic-machine.h | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
-index 5452716d22..8c7408feb4 100644
---- a/sysdeps/x86/atomic-machine.h
-+++ b/sysdeps/x86/atomic-machine.h
-@@ -26,19 +26,14 @@
- #define LOCK_PREFIX "lock;"
- 
- #define USE_ATOMIC_COMPILER_BUILTINS	1
-+# define __HAVE_64B_ATOMICS		1
- 
- #ifdef __x86_64__
--# define __HAVE_64B_ATOMICS		1
- # define SP_REG				"rsp"
- # define SEG_REG			"fs"
- # define BR_CONSTRAINT			"q"
- # define IBR_CONSTRAINT			"iq"
- #else
--/* Since the Pentium, i386 CPUs have supported 64-bit atomics, but the
--   i386 psABI supplement provides only 4-byte alignment for uint64_t
--   inside structs, so it is currently not possible to use 64-bit
--   atomics on this platform.  */
--# define __HAVE_64B_ATOMICS		0
- # define SP_REG				"esp"
- # define SEG_REG			"gs"
- # define BR_CONSTRAINT			"r"
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
rename to meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index ca1160bf78..d9b7596265 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From bfd7e42968f20a8c46716c4319def621e8c75d1e Mon Sep 17 00:00:00 2001
+From 21f7195d1d264c1534debc5fc35511c793e813bb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index e5e2bd3974..bdd9b79f83 100644
+index d6d83d1a99..4cfd972d6d 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -41,7 +41,7 @@ index e5e2bd3974..bdd9b79f83 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index 058a467cde..af62f3c304 100644
+index 01c99b0156..cff04101fb 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -54,7 +54,7 @@ index 058a467cde..af62f3c304 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index f503792d04..c71be7f4d9 100644
+index 3109f2e20b..dfbdf3e933 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -346,7 +346,7 @@ _nl_lookup_word (locale_t l, int category, int item)
@@ -67,7 +67,7 @@ index f503792d04..c71be7f4d9 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 diff --git a/locale/programs/locale.c b/locale/programs/locale.c
-index 7e8832dc3b..7fa484f092 100644
+index 15f109f328..8b1b6352e7 100644
 --- a/locale/programs/locale.c
 +++ b/locale/programs/locale.c
 @@ -631,6 +631,7 @@ nameentcmp (const void *a, const void *b)
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
similarity index 91%
rename from meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
rename to meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index e43c81203a..ad0ceca359 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From bd5a7b22d32d47a7d3b9ae0deb6e2d196025e57c Mon Sep 17 00:00:00 2001
+From 82af88bf6ab520d50d326abac4ce522fc16a1a9f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/linux/faccessat.c
-index edb22ebce6..b67684a3ba 100644
+index 97efb740e5..84f95a40fb 100644
 --- a/sysdeps/unix/sysv/linux/faccessat.c
 +++ b/sysdeps/unix/sysv/linux/faccessat.c
 @@ -30,7 +30,11 @@ __faccessat (int fd, const char *file, int mode, int flag)
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch
similarity index 98%
rename from meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
rename to meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch
index dfc734a707..df49a2fb64 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 8a67937e136ba22f062802c1df276604b3f58579 Mon Sep 17 00:00:00 2001
+From 0804cd4b41d81095705b8f7f93c222277201dc05 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -31,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mode change 100644 => 100755 sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index f364e65fe7..258a344620 100755
+index 44b833ea1d..e49e45306c 100755
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
 @@ -157,12 +157,12 @@ else case e in #(
@@ -50,7 +50,7 @@ index f364e65fe7..258a344620 100755
    libc_cv_aarch64_be=yes
  else case e in #(
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index a9a1b747f1..879db7c57c 100644
+index b9981861f6..b52cbd88c8 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -13,8 +13,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0009-eglibc-Cross-building-and-testing-instructions.patch
similarity index 99%
rename from meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
rename to meta/recipes-core/glibc/glibc/0009-eglibc-Cross-building-and-testing-instructions.patch
index 25330faef5..4fdc3c6596 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0009-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From b8806cd4e2595bbad4d7c1e39554a382572e1e94 Mon Sep 17 00:00:00 2001
+From d1186e02e67f4c839e2b286c3dca01b9d86f66eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
rename to meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch
index d5ad72d8dd..b61e2afcf8 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 86e15dc8bc5c4756bc6fa9326226ada7721b8c3c Mon Sep 17 00:00:00 2001
+From 082861ced3a5dd940f563caae87674d4ae317f83 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index cb927fb9f9..e62fb30d11 100644
+index f81572c20a..127b91af5b 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Resolve-__fpscr_values-on-SH4.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
rename to meta/recipes-core/glibc/glibc/0011-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 92c1821dbf..11bd376cfc 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 41d83a92776e77bf82461d0219ad9720702b20c4 Mon Sep 17 00:00:00 2001
+From 807342e306756b73bbb47a0a68d415a204f31263 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
@@ -33,7 +33,7 @@ index 3ad702e165..931985b5d6 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index db898e9e39..6e2972e814 100644
+index fcbc30c9e0..5a9b2022b7 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch
similarity index 97%
rename from meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
rename to meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch
index 0bad6d7ba8..c87f193604 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From ac8410f1f87a9b93107a0d6a46707fbe4532d154 Mon Sep 17 00:00:00 2001
+From 6e7ac803914dbe730521c41ef0ba9803eded0ddd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index 9d9c1a7691..bf271fd0a8 100644
+index fc38c02114..05dd3066f3 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -30,6 +30,7 @@ headers = \
@@ -87,7 +87,7 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index c71be7f4d9..7e3cf2b920 100644
+index dfbdf3e933..ef496a8bd1 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -245,7 +245,7 @@ extern __thread locale_t __libc_tsd_LOCALE
@@ -100,7 +100,7 @@ index c71be7f4d9..7e3cf2b920 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index e635a01ede..10e34a6da9 100644
+index fdf60a453a..b0e3f78453 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -18,7 +18,9 @@
@@ -146,7 +146,7 @@ index e635a01ede..10e34a6da9 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index 7de3ba064d..3256427d21 100644
+index 40dc62b94c..960394c616 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -352,7 +352,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -195,7 +195,7 @@ index 7de3ba064d..3256427d21 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index 15fd39c637..d4c5e0c9e7 100644
+index f887cab7f4..cd1dac19f9 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -914,7 +914,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -277,7 +277,7 @@ index 15fd39c637..d4c5e0c9e7 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index 9529d7945a..554454b9c1 100644
+index a9b5a03239..28157493f3 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -219,8 +219,10 @@ No definition for %s category found"), "LC_TIME");
@@ -346,7 +346,7 @@ index 9529d7945a..554454b9c1 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 6f40ecf77a..573d051d0a 100644
+index d3c45fea35..9faae75f05 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -776,7 +776,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -359,7 +359,7 @@ index 6f40ecf77a..573d051d0a 100644
    lr_buffer_init (&lrb);
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index 7b66cd279c..dd0c3f1562 100644
+index 0ab4ec36c2..cb71249615 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -405,7 +405,7 @@ index 7b66cd279c..dd0c3f1562 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index b54fcbbceb..6110c7b369 100644
+index 7f526ec285..a88f26c8c5 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -543,6 +543,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -428,7 +428,7 @@ index b54fcbbceb..6110c7b369 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index 9103fade14..ecd878563d 100644
+index 740db0ad7e..21dea68aed 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -70,6 +70,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -517,7 +517,7 @@ index 9103fade14..ecd878563d 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index c04740ca19..12deadeb24 100644
+index 434907fe32..90c5dd2f2b 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
rename to meta/recipes-core/glibc/glibc/0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 62f7ca74c5..64d8bdcb75 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From 1985a7225e52d8d56e2e48a5ecab83bba8178f21 Mon Sep 17 00:00:00 2001
+From aca6f615886e3c1829c816146cd7f9912de73933 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index ad025a819b..0ca7465bcc 100644
+index 445f50b70f..812143b2e0 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
diff --git a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0014-powerpc-Do-not-ask-compiler-for-finding-arch.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
rename to meta/recipes-core/glibc/glibc/0014-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index a8a0c17774..85526371c9 100644
--- a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0014-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From 947d62bf6a6d341aaba3143df4a644126d2c34f1 Mon Sep 17 00:00:00 2001
+From 130f5c7b15cd73897013239082fbf98166e2378d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0015-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
rename to meta/recipes-core/glibc/glibc/0015-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 52ba027c13..a338c7498b 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0015-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From 14a3c302c1394781b19ff7fdb5c6f3c06aca5d51 Mon Sep 17 00:00:00 2001
+From 139b0ff379a5fc9b00a4ac3592119bcecd6bc9df Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mode change 100644 => 120000 sysdeps/arm/bits/wordsize.h
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 33d0e20566..57bbda568e 100644
+index c6a6cc7196..aa4f95c5d1 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
 @@ -17,5 +17,15 @@
@@ -40,11 +40,11 @@ index 33d0e20566..57bbda568e 100644
 +#endif
 diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
 deleted file mode 100644
-index be457d84d3..0000000000
+index 2f64147ce3..0000000000
 --- a/sysdeps/arm/bits/wordsize.h
 +++ /dev/null
 @@ -1,21 +0,0 @@
--/* Copyright (C) 1999-2025 Free Software Foundation, Inc.
+-/* Copyright (C) 1999-2026 Free Software Foundation, Inc.
 -   This file is part of the GNU C Library.
 -
 -   The GNU C Library is free software; you can redistribute it and/or
diff --git a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
rename to meta/recipes-core/glibc/glibc/0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index f0dead3005..fafcb74d68 100644
--- a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 806d6d37765d3a1454720c194758304768171f95 Mon Sep 17 00:00:00 2001
+From 5aa942398e125fa0e8edb3558cc480aac0a29e8d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0017-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
similarity index 94%
rename from meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
rename to meta/recipes-core/glibc/glibc/0017-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index b0e4d587b8..5eab29f22a 100644
--- a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0017-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,4 +1,4 @@
-From 6fca57088d013e22f9204570f72ac398b59b6689 Mon Sep 17 00:00:00 2001
+From bb16170c7584796afdfe4433d4f0315b00d3a164 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
diff --git a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
similarity index 87%
rename from meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
rename to meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index b95c2eb6d8..dc493dd3b5 100644
--- a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From 7bab0da0d299f7c1cf4111b0da2510fe0bc83a01 Mon Sep 17 00:00:00 2001
+From 21d5bbd98ac37ebff143836f3bf2964315e432c6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 7102d922b2..38a0b4a569 100644
+index 01d02180b9..603ed955c4 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -309,6 +309,15 @@ ifndef sysincludedir
@@ -34,10 +34,10 @@ index 7102d922b2..38a0b4a569 100644
  # Commands to install files.
  ifndef INSTALL_DATA
 diff --git a/timezone/Makefile b/timezone/Makefile
-index ebe5cf73a1..b5fa38f4d7 100644
+index 386731ab99..5d65520284 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -143,6 +143,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+@@ -145,6 +145,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
  	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
diff --git a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
similarity index 93%
rename from meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
rename to meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index ea4c0afb09..2973e25ce3 100644
--- a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From 38dc3d019fbfa6c4b15f242b46c95ad35f427594 Mon Sep 17 00:00:00 2001
+From 1c0987c983f3c5d1bbba92dba10781e61029cdae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
diff --git a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
similarity index 96%
rename from meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
rename to meta/recipes-core/glibc/glibc/0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index 09d5bf745e..91dc75e37b 100644
--- a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From 7c5d4f1c2161c0ff4fc0057ff0f1382bd784e06a Mon Sep 17 00:00:00 2001
+From 4d57cbea64811e854196ab5874aa43ca28e575b4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
@@ -72,7 +72,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
-index 9a1f27d017..9a48340055 100644
+index edb0a4b7cd..7fc9453173 100644
 --- a/sysdeps/unix/sysv/linux/clone-internal.c
 +++ b/sysdeps/unix/sysv/linux/clone-internal.c
 @@ -98,7 +98,7 @@ __clone_internal (struct clone_args *cl_args,
diff --git a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch b/meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
similarity index 88%
rename from meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
rename to meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index 1dc2d694ef..68d49c4278 100644
--- a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
+++ b/meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -1,4 +1,4 @@
-From 2630f675276f3be0d045f5ca7fd21b1e422a03f6 Mon Sep 17 00:00:00 2001
+From a410b7a7e4cd43dd5fbf351bde6b60a4baeb5edd Mon Sep 17 00:00:00 2001
 From: Yash Shinde <Yash.Shinde@windriver.com>
 Date: Fri, 5 Apr 2024 08:24:36 -0700
 Subject: [PATCH] tests: Skip 2 qemu tests that can hang in oe-selftest
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
-index c47cbdf428..1c4f3509ac 100644
+index 955d316362..fd072396dc 100644
 --- a/sysdeps/unix/sysv/linux/Makefile
 +++ b/sysdeps/unix/sysv/linux/Makefile
-@@ -220,7 +220,6 @@ tests += \
+@@ -225,7 +225,6 @@ tests += \
    tst-sched-affinity-inheritance \
    tst-sched_setattr \
    tst-sched_setattr-thread \
@@ -31,7 +31,7 @@ index c47cbdf428..1c4f3509ac 100644
    tst-sigtimedwait \
    tst-sync_file_range \
    tst-syscall-restart \
-@@ -232,6 +231,8 @@ tests += \
+@@ -237,6 +236,8 @@ tests += \
    tst-timerfd \
    tst-ttyname-direct \
    tst-ttyname-namespace \
@@ -40,7 +40,7 @@ index c47cbdf428..1c4f3509ac 100644
    # tests
  
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -274,9 +275,10 @@ tests-time64 += \
+@@ -279,9 +280,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
diff --git a/meta/recipes-core/glibc/glibc/0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
similarity index 79%
rename from meta/recipes-core/glibc/glibc/0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
rename to meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
index 81e580fc72..40c0b34bdf 100644
--- a/meta/recipes-core/glibc/glibc/0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -1,4 +1,4 @@
-From 111cb0b1f7410eea49ed8869c74352a11cdcbf0f Mon Sep 17 00:00:00 2001
+From c52e8734d043ed43d21370b2c29104fdc8cc8cb7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Apr 2025 19:51:01 -0700
 Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
@@ -14,15 +14,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makeconfig b/Makeconfig
-index 38a0b4a569..21a6ee94c1 100644
+index 603ed955c4..2f0e5d25f8 100644
 --- a/Makeconfig
 +++ b/Makeconfig
-@@ -1191,7 +1191,7 @@ endif
+@@ -1194,7 +1194,7 @@ endif
  
  # The assembler can generate debug information too.
  ifndef ASFLAGS
--ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
-+ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
+-ASFLAGS := $(filter -g% -fdebug-prefix-map=% -m%,$(CFLAGS))
++ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=% -m%,$(CFLAGS))
  endif
  override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu) $(as-sframe)
  
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.43.bb
similarity index 80%
rename from meta/recipes-core/glibc/glibc_2.42.bb
rename to meta/recipes-core/glibc/glibc_2.43.bb
index 76ef521a1c..7a2089140c 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -27,9 +27,8 @@ NATIVESDKFIXES:class-nativesdk = "\
            file://0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
            file://0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
            file://0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
-           file://0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch \
-           file://0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
-           file://0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch \
+           file://0006-nativesdk-glibc-Make-relocatable-install-for-locales.patch \
+           file://0007-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch \
 "
 
 SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
@@ -38,21 +37,21 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://makedbs.sh \
            \
            ${NATIVESDKFIXES} \
-           file://0009-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://0010-eglibc-Cross-building-and-testing-instructions.patch \
-           file://0011-eglibc-Help-bootstrap-cross-toolchain.patch \
-           file://0012-eglibc-Resolve-__fpscr_values-on-SH4.patch \
-           file://0013-eglibc-Forward-port-cross-locale-generation-support.patch \
-           file://0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
-           file://0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
-           file://0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
-           file://0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
-           file://0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
-           file://0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
-           file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
-           file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
-           file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
-           file://0024-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0008-yes-within-the-path-sets-wrong-config-variables.patch \
+           file://0009-eglibc-Cross-building-and-testing-instructions.patch \
+           file://0010-eglibc-Help-bootstrap-cross-toolchain.patch \
+           file://0011-eglibc-Resolve-__fpscr_values-on-SH4.patch \
+           file://0012-eglibc-Forward-port-cross-locale-generation-support.patch \
+           file://0013-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0014-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
+           file://0015-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch \
+           file://0016-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
+           file://0017-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
+           file://0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
+           file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
+           file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.49.0


