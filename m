Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C915CCCD187
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 01:27:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3084.1760146029766233901
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 18:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b9tUEIwN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23790b5689=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59B0ZYZM3870448
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 18:27:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bFSkILkQotU0ZWtQupoprMnbECaBt6L9q7PEZMssGxM=; b=b9tUEIwNnk5H
	wUqT9gZHvUXrdIN/azSnBJ8KoLoybftjo0BSDG3OgK+1B/MZQwUb2mlFDc2II6R5
	6lZ1eh6sQ57QGvP96zUTksUZmuCbLOYY4YnLficDHpaJNHA8rzrc4PAs8vT4QMmu
	yUMUwlP0HPyBATVMdMOph5nebna/6Inm4cPuP2SkAa5tq2Bmphe4wPOuEJ0r6Djb
	445veXnFzAnbXn5egKxoKTZHGRq8a9CNT6BuLiurPit6IuRY451dK5AXSwm8BurY
	fpOi5GqOcsjPwwI7hdOf4qreJJaIj1ShJzyOpCR/q+xsFGPA539Ifefq78dRTp4X
	42QdBPw0Ew==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010007.outbound.protection.outlook.com [52.101.61.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49q677gbxk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 18:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTi0QfDrPeoU2Vdk/rd7D5ZSU65xB0mMM9Etf0JOPb8kWTAzZzkf6vDrzrgw00d9VbhIOaCo492Ne4pETfybbAZpsT2LCRKfhKVfDWwBHNbEYKJfunKRuN16Jqs2WChAOmvW2faMFoa1UeRseyal+a6azc2IQApBiIPuFhLBBxnnV48UsC2iANgk41lZ6Hlk6T/6SvQ8YhlbFvtf5yZfCGUySiJvz8zyKJuYopmOHdiM02fHG2LciDTBB1Krvz059WBdCcxx5BD0q+ea8FmcWh8OtZlg0886VlhFPFvRwrX4jAh7DQ+8ewvaoyi+XMAqzA/+BfqTJ4S1Dcc+XGuo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFSkILkQotU0ZWtQupoprMnbECaBt6L9q7PEZMssGxM=;
 b=JUCcD5qSTE8iztu0PkubziZ1ZK4c/TP/Ar0Pc6wCVft+nfQu1SujdlL9DmouYE1E5cyOIigi2jkSu381Q3VUO/StxNRZpgFTfhYycheLmQ6+m7qfb6IRsRPD1L6u4ZO7b69Dk35OgLHBvyTmobeS9x54qeKH+FgnknhcczgZhmWJCqutZqolMLBJNs6yI2bkmvinW0Jak9mw+YtJUexhFkPbpBFss1LHtvMPvD78XOOSgvXixyDVhVNaRBGCdO+0b/kEGKU0HJfvn6MUbkPsFIMAS1wzooH5U30XRA4xXc2gLe/Z7KkR8Wy7CHZx7uMaM+LTiMNd+CzC63C5ZWcBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sat, 11 Oct
 2025 01:27:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 01:27:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] ltp: upgrade 20250530 -> 20250930
Date: Sat, 11 Oct 2025 09:26:48 +0800
Message-Id: <20251011012648.1012302-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251011012648.1012302-1-yi.zhao@windriver.com>
References: <20251011012648.1012302-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 9385eaff-ea39-4323-4109-08de08654acf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7YHNE69nb7JzOZmA/ZJ092fYhEcDKzvC+EpwmofboZnym2HRZZJ63V+S4b3/?=
 =?us-ascii?Q?om+1LpD9YatAZ84TYJHd7OLUTkWoElqVnKx6xxa1NY9n0FNctw2CiVw6okq5?=
 =?us-ascii?Q?PNWUSrOb7B4LuOqTM/ALnLSJHTqQDky49Vro4Xofd4Z8DWFBZzc0HsG47m4j?=
 =?us-ascii?Q?FVvQaWi6zdF5krZB7IKUoBENExZP8wwGXwk4FRP9Ar3JQdPNnKxxOd7AlHw0?=
 =?us-ascii?Q?uWAztlcPBJzWpIwE3UeNCTuaJ55ynLAmFgEZMu5sBYK5H3Q+uHD5LTjSs4NA?=
 =?us-ascii?Q?1zcMJOtmSq1/rfK+EvgVpoDnoDsyjD1QxYCiqhGX6E+wN8TPkWlc8qHtvme8?=
 =?us-ascii?Q?VSmxOIN+JnZl0wkWjE6CW/TR5C9L8UOylMgs6j5KbY1RpLcNT5TQROMiHYTu?=
 =?us-ascii?Q?23vV0zSC4J4Q69t2nCWFgsbWXsHt8eDE5ZiisV9bhN93yisW4RdUcL10kgLV?=
 =?us-ascii?Q?px2hm5pjJWMFLkwQ2e/Dr5D6IeSuRaLWXSyScM9acTKrp8w0pN2Hj/MOYKz+?=
 =?us-ascii?Q?fe6pSOfOuXhLjwSFHzWqHaAdKOr7K/1vEfMrlLKFaC5jrJQxe5nmjA4ssrql?=
 =?us-ascii?Q?BAnk2nlSsNQ7QOWhog/DHpB7LoXEaFLfDTPzVMNWaY02INjrl0e3Ub040/FO?=
 =?us-ascii?Q?WfP/EHJf4AvHou9lx0ojH+GLC4Ff3BLuO9uDb9xlMTb+oIxW15pFN0338co1?=
 =?us-ascii?Q?mdzI/nyPkuD8GgcX4I4BgslLBT8S6mt1jLvqLFu7mk0X15N+h2YjLBqBDC7F?=
 =?us-ascii?Q?fCBoavkjD+ch1ncdOVkbbo9LIQomNrU4DaxW43wt8+bJ2W6qbQJ+SqNqT77F?=
 =?us-ascii?Q?jzIvN7VJEYuWoc3EVHjsFhyI67gYjkt6Y9lf4WHbAU1yVlfvwCCx1K9/yBBD?=
 =?us-ascii?Q?JxkLknAH9UdGsCj3KKSB+1L7xUwMPiRCL2IVAGKuI+LguTI1s9nXs2huv+aj?=
 =?us-ascii?Q?BOSECsc1CyRIrcbj3AQkqhgAsXTcb8wtH5S6fQAlsgGnXTezUZGMWOVjpyI2?=
 =?us-ascii?Q?C2IzUJ/J77Voxqhj+Yjeah3uh7M8NhNEdoCHqklpYo8SHGaSAD9DqirDtzNc?=
 =?us-ascii?Q?M8a/11Dxqc/YsLQ/5tW9IObWQBZuavxi5ttDpsafcjiK3TeCpj98igJu9Bcn?=
 =?us-ascii?Q?we4TNS1cU6WdxX3kr86xReg1lnj3mmUh7G/9ev34sxuETvFlrK8AjoRmjwZh?=
 =?us-ascii?Q?LkvEypzkxoYsSex0yjM4wUZEG6sIAGRSbjQaWLVZSqCb/aCqPDONhnbULIx6?=
 =?us-ascii?Q?2OQfDZQ7sN+j55pY6BIPc6UhcKW0oJ60WyEdI09DqLASwjFAtB5IZlbpCj2P?=
 =?us-ascii?Q?GX1Pmyr7pC9K3rdq4VvlowRgjkvw8JjegY3avegmRRSo+U8YpLX/HhmmmQxC?=
 =?us-ascii?Q?dV4iTVdhZFDv++h5av0j6kTyLekAgFSdw911bvdim/3JAOFyGvu9E8cSZ6zr?=
 =?us-ascii?Q?cgCxpHKJviOJTdF4wT2YC+G+NKZ2YyOZMhlCyrI7Tp+F8IO4s/gK680BnCdZ?=
 =?us-ascii?Q?WjQ99cG09TfOU6hmwkJ8l0YJhUwz3njtWEPQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1BWbuRiZGGyVmRedZ9levOfo4YgJNbwQFlYx0k7cG+hHwhetDV5UMKn+NQsc?=
 =?us-ascii?Q?4IQ7Xv6H5I0nQof3thz0jJqBe3wKrgMKuKz6+rUFbob8552euqIa46hzM4+E?=
 =?us-ascii?Q?7yQt3t6kz87ZG/dymhV5D7F555Wxc38EkCZtA45lWl/TAbegruk4K2BWxsVq?=
 =?us-ascii?Q?Q4Dt+6J1BRlmi7rgk1lJsMkMbqJK5v6b5qQq93/Qu0ICQlqTWFMOBZaeTtBO?=
 =?us-ascii?Q?EajQUqGhMd5PQk1b229WUW1XyZ3rxA6JvsLsmrUBuzjRhPRRgDsUUbMRg980?=
 =?us-ascii?Q?Wl+ohfu9/Nw1JjeD/820tPeNQRcaP8sVhCBuINWLkw+okR244foG2EZzne10?=
 =?us-ascii?Q?L8cckUTkkaKRsX7DCJ+BDTj9oi4V8N0uhHeFxshRos9iteqQnsZZZMZ5wPhp?=
 =?us-ascii?Q?uMSmqIe4GqVcKE6QdQ4fqXwpJICbVCGLI5kj2gi/r089gr9kQo5nNM0CodYm?=
 =?us-ascii?Q?qbXqQI9Cd0aEwDzkBY5lFzPna7u0Deg9yRsk7M1txaGRbG8oEW7Fiv3ti50p?=
 =?us-ascii?Q?Jngm+PD4HDqiD+IyYS7nA8TWXVB7oDxF6AGqGtaC6RMEBbdhQpgxzR+FRBwe?=
 =?us-ascii?Q?i8ibIpghgjvXZOyI7NR7FHOxDXuWgEItlFs+na1R8lfY8VaAe8FKjCHmGw+6?=
 =?us-ascii?Q?94nRCdZg8rMw0sHtF6M5JMkrjlhUfu40kfpcpnTJR4fiEo/dzZtxuCsjhpmn?=
 =?us-ascii?Q?uPr1l4ftQa/iJ1AhWHDHb3n3xaNmOdQc53Ywr1NA9sb0ZtYZxdu8WAk/3p5M?=
 =?us-ascii?Q?fEIyJfV/IcT+TTDid+dzWRK0VU2h3uF6gwbuhkDudMLXrqPPQeOPTXk2o1B+?=
 =?us-ascii?Q?Rw47Fr3swmGhTq1iC3vy92MlSv/FXi7/N9JAPlgjKWANapKn6iuSGGRsfoCa?=
 =?us-ascii?Q?J3dPy3eldJ08XlXxHW27Ov5W1fUTpNcjo6GrSZydz5MTI/dlBNWgR5KP4OPy?=
 =?us-ascii?Q?YE4egZfKIbrEFLVhemjJtLr7Hhotce0BEIsraD5XUV0iRSqjdFve2FG+8p3k?=
 =?us-ascii?Q?NJ8pZmdtAfYznt7Rg4D8miS3r+uoicLL6RKdFA+qZ4ZLAyDzMKvnCZxNibs7?=
 =?us-ascii?Q?MxpiTyVbW1DCQ3qPGiqM2HgbR94mSFH3fV66PIotoFembDqDt0VzkiZ7Zx8c?=
 =?us-ascii?Q?FbPOWfi/N/G1K105+/G7EW9qhr/qXejf32xpx6JHO3TS8/jERn4nRSThP/rI?=
 =?us-ascii?Q?F4WOzLfHlH2DfZ/3zzdfo1khpk52h5XlavGbH+oT7TuRc++w3A8zcAFNnIcG?=
 =?us-ascii?Q?w6fmUHzJfdCy/NyW1Gb2pPoaXS73oFdHLVRL6CJuswQmrhBMyW+5B07BxiPy?=
 =?us-ascii?Q?jIJ/GzPuESztkGNUj5Bxm3CpaAJpymDW+ckVZejy5lV9IOnlBTdR7PUEiYDG?=
 =?us-ascii?Q?vs3/dj5fY+rVx5eofVdYbiFD3F+G+7VCQGQ2bS5Uy8bohfKjOy/uL1G1rxag?=
 =?us-ascii?Q?Cez04sSMlZq/N37FvmgZl5o491OfEDwTIPuUkxIU+lVkm8rU0MJBmjURFokb?=
 =?us-ascii?Q?h7z99pnaD1QMuMb9IF4i1zL32x2OKZXUFtRWLii5VM/fhUAqu0+gT0JJk/v7?=
 =?us-ascii?Q?Lw28lq8+XDpSDKVJflknfbjVgu1bsR4Vxr4YZAL+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9385eaff-ea39-4323-4109-08de08654acf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 01:27:07.4519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/BSurFYDUkt/Re7D7dDulV2FNVM5l8t8Ha90cBYsKW3EdkflLGwT6NKb2hs8BP+YmfvavYgW9dOdAV514jarw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-Proofpoint-GUID: UjAf6gS98cb2JKnkKZfQo_jR_akQMSyB
X-Proofpoint-ORIG-GUID: UjAf6gS98cb2JKnkKZfQo_jR_akQMSyB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX9zIW3mq4o9iU
 7U2SkXXeVdvY8zps2M2S774qpD/B7PvW9PX+mQpnWKqUsoE0UB4Qx93ErrfGWMPvDc4qu2Gk+eu
 ZCGD0kBc17gPfNUsyhKdbZu9kaBzeORApD6FGUldAzRMyO1h/7IZJWT2RXoydS9XvBAupYo2uHg
 983t3UdrND8es43yT3ulZ9xM1vjooH5gTRIC8aBz8sIsv950qz2871PCAPWOB7DSPTxY/j7fdV4
 37tkeYoU1nlzYFHIUnooS9ByZJpQFAyJbyKe4N2zjGFyvGnqPJ9ftLMil9O//z9CPxpEgyqU8pv
 EB5ZQL0lp/JMJKugdwQOG2gaSSC7IMeY5wBrps8SMYOmO8m6/HaHXtFPaP7bbkFT6Hqqggn3mCZ
 Cilw4tpgjuNc00s64ODG3gip/ZC02Q==
X-Authority-Analysis: v=2.4 cv=Hu172kTS c=1 sm=1 tr=0 ts=68e9b26d cx=c_pps
 a=jRvQvoFr2LhS1HEjeZSEyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=Nm1gRg_GFjpknBLT75oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510110006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 01:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224711

ChangeLog:
https://github.com/linux-test-project/ltp/releases/tag/20250930

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...0001-Add-__clear_cache-declaration-for-clang.patch |  2 +-
 .../ltp/0001-Remove-OOM-tests-from-runtest-mm.patch   |  6 +++---
 ...-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch | 11 ++++-------
 .../ltp/{ltp_20250530.bb => ltp_20250930.bb}          |  2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20250530.bb => ltp_20250930.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
index c95d7220cd..24e8762f77 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Add-__clear_cache-declaration-for-clang.patch
@@ -1,4 +1,4 @@
-From 859d27dd6dfc6e9d26ae9a05f4b32ac45b911887 Mon Sep 17 00:00:00 2001
+From a2ce04cb82d545f3dbab71de7fa55eaad3df3063 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jun 2024 22:52:56 -0700
 Subject: [PATCH] Add __clear_cache declaration for clang
diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
index 936e23ebda..860b2f127f 100644
--- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
@@ -1,4 +1,4 @@
-From 7096737fbbe19d0765f0a8c62ef7667bf4875780 Mon Sep 17 00:00:00 2001
+From bb9146dd322af98a7bb96ad0d84ec376589c6cde Mon Sep 17 00:00:00 2001
 From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
 Date: Wed, 29 Jul 2020 08:47:09 -0400
 Subject: [PATCH] Remove OOM tests from runtest/mm
@@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 6 deletions(-)
 
 diff --git a/runtest/mm b/runtest/mm
-index 5566a7742..8014d509b 100644
+index 41d624ad8..1e8c22638 100644
 --- a/runtest/mm
 +++ b/runtest/mm
-@@ -70,12 +70,6 @@ ksm07 ksm07
+@@ -69,12 +69,6 @@ ksm07 ksm07
  cpuset01 cpuset01
  cpuset02 cpuset02
  
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
index b4859a6f0a..364e203e23 100644
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-semctl08-Skip-semctl08-when-__USE_TIME64_RE.patch
@@ -1,4 +1,4 @@
-From 55b48d66857a43c2609fc351293b5601e2eb955d Mon Sep 17 00:00:00 2001
+From 09364a758df9d89a0968894376f82f636441addb Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 23 May 2025 15:17:49 +0800
 Subject: [PATCH] syscalls/semctl08: Skip semctl08 when __USE_TIME64_REDIRECTS
@@ -20,10 +20,10 @@ Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/ipc/semctl/semctl08.c b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-index 1878bd4..3b799fa 100644
+index f4549adf4..28776f266 100644
 --- a/testcases/kernel/syscalls/ipc/semctl/semctl08.c
 +++ b/testcases/kernel/syscalls/ipc/semctl/semctl08.c
-@@ -10,7 +10,11 @@
+@@ -12,7 +12,11 @@
  #include "tst_test.h"
  #include "libnewipc.h"
  
@@ -36,13 +36,10 @@ index 1878bd4..3b799fa 100644
  
  static void run(void)
  {
-@@ -47,6 +51,4 @@ static struct tst_test test = {
+@@ -49,6 +53,4 @@ static struct tst_test test = {
  	.test_all = run,
  	.needs_tmpdir = 1,
  };
 -#else
 -TST_TEST_TCONF("test requires struct semid64_ds to have the time_high fields");
  #endif
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20250530.bb b/meta/recipes-extended/ltp/ltp_20250930.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20250530.bb
rename to meta/recipes-extended/ltp/ltp_20250930.bb
index 9ea5de10ee..1514aca8fe 100644
--- a/meta/recipes-extended/ltp/ltp_20250530.bb
+++ b/meta/recipes-extended/ltp/ltp_20250930.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "14331e1ecfcd63426c9d270d88b7bad9f60c6d64"
+SRCREV = "d2550ffbbcfe163212cd7e9c132db65ae0fa06ed"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.34.1


