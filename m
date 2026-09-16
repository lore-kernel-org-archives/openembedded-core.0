Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F67C982CA
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:24:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17633.1789572238181344838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j2Wps5sa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3719b62dd9=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFDfx82198443
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=9iWAwkmP3WwijvPT5083mFgzFXfEeOP2KTUO0cYy7RY=; b=
	j2Wps5sa7d6oig0VRO4Luj8tD8/rFb8/jMGTsk+zHqNWE8zpZ5mGrSg0f7M7u8Wj
	71UOS4bIs2E7bZ9kNTOJ99/egcCh9lrtn9+eP85CeWkq0OVK87FvO+0GA6TZWMQc
	MsvFV2lnf1UigqnAoplj/irfsE0m7BwzLglUcmBYu0MBDMsyJCk7Og8dKlldVw/j
	lbz7h+KasBFjr/VSi4ioD4vUEtlNtgX5n/V+zZrnnZD0DtEqNSo11LQoXiMGUwsH
	xpzeYLr7H4QxP5leE+Yb10sCJMSrvWtwt2BJa35pH4484lSZCmds15MksuqSsKvo
	cqwkGlxjFjJbKvEMRpz/zQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020140.outbound.protection.outlook.com [52.101.85.140])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gqc1nhmmf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 15:23:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVPfM8GagArOq/bvZ/of+8L7hgmApEw+9wPWRPu98KfcOljBZihNGXJdsq0P67g6fay80FeDxqqmmpTHKjgvjlC8aTDchPDXJaFHFETZEbvxpHAh38eEm9s9FZJHU4MEcmn+JVDuRdKxQSPVP58GHCtqT2vuN1upHFxB+c+FQwsOyVtDiIqpmKjcLt9psWpdTGlM11P7JrnuxGw3/S57Fp8slU8suNOvr86Od2KN7RwYTMEx+iPDFu4JVPDoByOeQBUBi7qSnjGw7jWPrpawuenp4xiGgclstHVJ7A9Wmpc4rPMpDH+VvD/2Vkg4Xvmiz0J+U45zCo8dM0NGRwQpfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iWAwkmP3WwijvPT5083mFgzFXfEeOP2KTUO0cYy7RY=;
 b=NNS1O7cgBO8zLNuDrtp6wiO2ITh4S56u7y6QWQn36NcbPWuQJ6KOL2UgBfV66B5PgH/AIkkh6lVdjlqaieXPVHX49QvVLFKGStqML4wYXdHKJdIIj9CxAJ+I+2CeItFdnOh9mcycA9DUL7SADsw2IJpTXx1h86lfVFXCF5XsO0k1BpVHiXRYOFnzdj0mv8/3yYRqLNKUDCv/8Tkwa9v1zCV57iJnyzjGnp4WTM4AmwiphPRmTK+rVBTsQecQ3ew6P7eeS1YKjl/gARvRs1Oexe3/fpCFM7EiksG5ZG/tXnlZNgi+p9/Jr60JuNRQCnsYfEn3kAlhptmtR31XqePBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Wed, 16 Sep 2026 15:23:54 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:23:54 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, alejandro@enedino.org,
        antonin.godard@bootlin.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2 2/5] rust: hash cc object names relative to their source roots
Date: Wed, 16 Sep 2026 20:53:23 +0530
Message-ID: <20260916152327.1765623-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
References: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: cef0bebe-80c1-45fc-a789-08df140684e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|12006099003|22082099003|18002099003|29003799003|25016099003;
X-Microsoft-Antispam-Message-Info: 
	lZ7Zs0ONDp93ajz/8dXzCslyj3W0bfQwwpwBLjAtpglN6Hb3Zb7gElCkeIr4HC0XbET4uOVjmnF2icfJikB8eZVEQpYbemF2wYwrDT5wEzyuK1yI1lD54HtOmphYn4xdiVrhLNrnRP/LTDYOmWz6mdvmVR8algxi2YAWuakzKVvkWvPhWcaC9pNsZj3rdF8pvoOY5FXB8IArj6XGqj3Gu4bmpYg8W9whU4RcfOS7uBd4KoDWxyH8vuprK6EU+VYsWbN11IpfecaIZpTO7oAaJ7Pm5drg1OGWvdJKJO5zb7mvkcbqSzEcc2Y9h5ACXke0qzDIQ/lbYiD/3henU8W7+4sCIEXruq8AMgEKZZxBgzwRu/MhHd40GyuMRC3huiEAwF9Bf7dWOgdKXPaBUAgyqViANf0cgGFisKDAl6lnWw0NTzpjg/Zi1B1P5MQ6/Z2i5nstYGRdL749N3OaaTvcjHNc7newtpKL+ayt7gzdF1kgnb6BV3vjFEkK5aylv0bqwnd3prhnOt2Ch0E+8b/IeqMrY9lR0apupNuzlj4fafeBJodrX1Uc07WwDWRVOa6ASimNyZFhZCJr9YmX/vV7E4dYJ+JNU+EplnYrif6IgWAnFcABsR5Uuvm2f1ylOQnkERF2tuvC1RgRZ2/ajNyJ0QzKrOXbitSV+fP+B8Sfg7k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(12006099003)(22082099003)(18002099003)(29003799003)(25016099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6Fjo+aUIrBGbdUNdHkDrnQS8Bwv1I+ZvC8QOPrbB/kbjuQ6ujIdveG0G54m8?=
 =?us-ascii?Q?i30IJkha9OJ6RjypnF1qDN5nmH9ie5hbhbzl1F7sMy2C0f4q/x2a3uEl13wd?=
 =?us-ascii?Q?ijrhVZlZMvthDXFON/2sRYLU3aE3N9rX56VqcniXYVkFDRAOKLfB3jNUkPC5?=
 =?us-ascii?Q?8LaM+7Ywu8lZGjNeRdLtCFU6BNMBe1yUdCynOybyF5gL+bFdZ2Z7Rvt3m09s?=
 =?us-ascii?Q?JbJC7v7rnkwdPwB2HAE3AGhJIv/2u1PW3jshs/Ytzx5G7YuCyP7FnmdsFFsE?=
 =?us-ascii?Q?Whu0GhyIzSn7JpL5JFDgCglCfx/AXrA3y3pe6kBdfgoW62spcYM4IwNL6HUs?=
 =?us-ascii?Q?gJf9nwTOYqff3m4+5WA7dPQeiGlRrsBGK0QczG3rCtJExP7i2RUptLDG+vGn?=
 =?us-ascii?Q?5hM+FDlfTd0K7wj58l5nnAcFnML3iQMQ4Z/6lfOnFfxHGi/8QehgKXJ7ERYB?=
 =?us-ascii?Q?P4bGgF7LDqxzhd6bOndeuiJ68KFPKwZlRkCJwXMLvicuzxN0GvCjwVuBmI70?=
 =?us-ascii?Q?pUnl3WoC8E8CcghMd0kiO5l6BSFGSVeqwOs0qKl27TSVod8jzkmedLtF9Obh?=
 =?us-ascii?Q?xAYX9t/3lgbrIrHiKmiXeERmFj2wDPJo2TYz+ik8K5WGdf1bNp5f2j2Myka2?=
 =?us-ascii?Q?2dYUcW+00SE/ui2MQhx4YGOOsygn0SF+OT2GZzElxa1ldcBa0Y/zhJ/UeuVy?=
 =?us-ascii?Q?tno+nZXD82tkMpgwmBZytAGAjL4psaoU3QpfZWfiX7eHP+qFnd+60/Thw9ck?=
 =?us-ascii?Q?qiQ89eApW3VpoCH5/jHYkjLtrmRqOpW4bbq5YtIL3kRmaGCQa3DsLnIQHwrH?=
 =?us-ascii?Q?UQNPJXVEfAFvfi5et3aPKrurSsl6CK3KYdWjDFveg6flYRWRR0gE3P1dg+ar?=
 =?us-ascii?Q?Ay0Z/Z4eMbSlDdth/rVJfNZc2BlduTkIQ/jU1Br7cc4skaERJm7dD2zomzzB?=
 =?us-ascii?Q?gQ3wkqV+3b+KNWYV5q5mvqmhQkvTYr83+KWia4k2S5b7zy9m1gim8jQCgO1i?=
 =?us-ascii?Q?G9+QcMyugUWLmnIRp+s7crCCfXEfOxZCYZLl2aelopTmBhkoO4xyhdcO/FYF?=
 =?us-ascii?Q?OdT8tqfkrXTrhnhZ7iKM1g06ZxxiJEyNj38CY0WhzDbfIkbPKsKPmwiBr48K?=
 =?us-ascii?Q?qCrKyo18VHCSNIu68kc+vLh2Zg019IGLTnSCrTwnlLA8N/5crW1j6IpVaRWc?=
 =?us-ascii?Q?oCMvPnv4xbUTKROEmvsZqO5Xx+1bz6N7biV2IGCQU50jbp6C73nWV4Tg/Irz?=
 =?us-ascii?Q?9Hy1ZZlBWVLBYcIetsz8eN1QHEVKgGAzWHF+n+Feyd2vxlpB8FZ4RfmRUGJm?=
 =?us-ascii?Q?FQ3GH4iPiu9baA8xNQjXifOE0zl/irV1XkALOi5KLpaU0YT6TfbkrJolgk10?=
 =?us-ascii?Q?asZxfg73poAcBIKPffJcW+zlWU87rkV4yS52Q81JEzxfJOSafsv8/8TZhmm/?=
 =?us-ascii?Q?qRRUdrsaRgdePM6MklJdP2xMRJLPLLgG7kUzdkTnXS57O8qqdvYcsKAltkMv?=
 =?us-ascii?Q?DuOU18N6eXj48u82V/yBieoPbf6zo+1BKwG4+gdDwnVGLfCn7XaqpFSuIRlj?=
 =?us-ascii?Q?/6VhBQurG9ezko9R6aehS8q8JSCfU7CxK8IODz97DNe62+Ha40skMkpsqrvX?=
 =?us-ascii?Q?e8YpHd8udLgc6DcnWVHCn+kw1j8NN6RoFpabiVyD+xUfDcc6A+uOiWKxGnIB?=
 =?us-ascii?Q?zHsLDgrd4qLSYV2fym3FPXrSrF7qsaKrm/QKzlw4Xxm27pQK1K9hn9/z2hYk?=
 =?us-ascii?Q?aByW8Iu/ngrLlcjyfwVWscoqJliq2lQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	nnVIzADRbX3gD2eQm8C+/Q3k/AnQmMyFSEOuOHEX7s55IWwyiYOx3E2NbH/ai90YAF1sABSwc7sKUnsSPft+kOJLwVVXFOgWFtljLp51aGXTKUD+uBU2HXsAc6SSNoGTOCvxoktdySu+mZCe6Jay9fdUy+c05m1DLbhODrP9HFdcc3312afXIvaxmfarSG4K5Ai1/M2Pbe2NJGAWCCDRuh2q6di+sPHW3Ve3pdGUCRAGpPYZvqFNKM4r1u0y+tWgrIVQe8LsXGYJSRUjgsmLpk7cr+6SIWcCpdygIHzn1a448sZ/3TtNxrqtpR80Av05/i6gnCi1gPV56KWGWuDrJQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cef0bebe-80c1-45fc-a789-08df140684e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:23:54.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTfsr+MD0KZMi2jMLJNRmuujLJs7/ggU62JW6qOJCHVSpHkoKGuZGOs0cTGNAXJOQ8SXaOKxGd0OFAqP2ud5+MXgpUQZu2SsWOrc3/0EppU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: DYUTS9e37p5vQ1iISq1jmOEK62YBCexi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX5ksPa/QMA5Y1
 4QB0oVhaETJgkMvaT4EhiI4jggYozRlx0RewHmUC8QGWe+XBbwrWGoYmoH95uyg6alVmJnbeKo+
 3YRP8HkcPS8XcBdTbXDrckTup/kY88sJMuBmlIyvz1hwJlmMUjRv
X-Authority-Analysis: v=2.4 cv=L+GI0OT8 c=1 sm=1 tr=0 ts=6aaab48c cx=c_pps
 a=qT2ADiACooojDGKohgXUBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=vKHuM2cOITC_-77vfx8A:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Oq4Vy3458gLamwXu4UIl:22
X-Proofpoint-GUID: r0bBSoJf0I-wXLUKdtc01EzEzH7IIseC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX75GGHz8wdwow
 IyAbVLbXv9E1HtDd71lDlSDYMv1SknjDCDYgqSOv+EixnbfH1Ge5iCNTO/1UlhstRA0msW8WGDW
 6fWNDnv7Y11gsjeeK+FkdYAcseD8teRTQfMhvLiXywaUIAbFllw8+2GwXvCoAP0DfSrjVsEb9sP
 DNu9Cy2Dodc70Ns/O7NFVMuVBuxEZJFYD+haBU6jO9R0f8KfZQzCmSOV3HScRsYHxV1zazyVBoC
 FcaKSQmoWH2yzXW//0BQV/HBPiPDmFI4QhCmClU/fQFYXmTQw4NueFE0xRg1/Z3MTEA2H7Ax0uO
 Hk2sAuJjLewtNNsZQmVDhJx4ZcqXrPmzrBwGB01j2f74JkRaSNP00djQDcOy/9qOjsUgetJh3+9
 zD6FTnKpOGQtPOefs/sk9x7xFffsC0ql9P8xCd4TH78K6yd7zWmkzARL5uNU4rrTw6BOI/KQvuh
 +sfX88Xg0p4EMo8kGrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245983

From: Sunil Dora <sunilkumar.dora@windriver.com>

compiler-builtins compiles two sets of sources with cc: the
outline-atomics files it generates into OUT_DIR and the compiler-rt
intrinsics it reads from RUST_COMPILER_RT_ROOT. cc hashes the absolute
source directory into each object file name, so the names change with
the build location.

The added patch strips OUT_DIR or RUST_COMPILER_RT_ROOT before hashing,
falling back to CARGO_MANIFEST_DIR. It replaces
repro-issue-fix-with-cc-crate-hashmap.patch and covers both sets of
sources.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: Upstream-Status of the added patch is now Backport (cc-rs merged
the OUT_DIR half); its header wording updated to match. No code
change to the rust sources.

 ...bject-names-relative-to-source-roots.patch | 73 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cc-hash-object-names-r=
elative-to-source-roots.patch

diff --git a/meta/recipes-devtools/rust/files/cc-hash-object-names-relative=
-to-source-roots.patch b/meta/recipes-devtools/rust/files/cc-hash-object-na=
mes-relative-to-source-roots.patch
new file mode 100644
index 0000000000..c128bd7144
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/cc-hash-object-names-relative-to-sou=
rce-roots.patch
@@ -0,0 +1,73 @@
+From afb2b50f588cc02042f50aadbd1c28f19bbcd586 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 15 Sep 2026 17:05:37 +0530
+Subject: [PATCH] cc: hash object names relative to the root the source came
+ from
+
+compiler-builtins builds two sets of objects with the cc crate: the
+outline-atomics sources (lse_*.S) it generates into OUT_DIR, and the
+compiler-rt C intrinsics it reads from RUST_COMPILER_RT_ROOT. cc hashes the
+absolute source directory into each object file name, so the names change
+with the build location and the shipped rlib is not reproducible.
+
+Strip OUT_DIR or RUST_COMPILER_RT_ROOT before hashing, falling back to
+CARGO_MANIFEST_DIR as upstream already did.
+
+The OUT_DIR part is generic and is merged upstream as rust-lang/cc-rs
+commit fe27e7b6262, in a slightly different shape: the upstream tree
+moved on from the cc 1.2.0 that rust vendors, so the change here keeps
+the form that fits these sources. RUST_COMPILER_RT_ROOT is set by
+rust's own build system, so that part stays local to this patch.
+
+Upstream-Status: Backport [https://github.com/rust-lang/cc-rs/commit/fe27e=
7b62629daddccf1bdc9e9a447a37de2cd06]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ vendor/cc-1.2.0/.cargo-checksum.json   |  2 +-
+ vendor/cc-1.2.0/src/command_helpers.rs | 18 +++++++++++++++---
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/vendor/cc-1.2.0/.cargo-checksum.json b/vendor/cc-1.2.0/.cargo=
-checksum.json
+index 470ecbb..2ff8a08 100644
+--- a/vendor/cc-1.2.0/.cargo-checksum.json
++++ b/vendor/cc-1.2.0/.cargo-checksum.json
+@@ -1 +1 @@
+-{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"b766a70e39b8ea7bb57afd288bcac205a23f6a26ac561=
9cb1d5b10f70c5dfdea","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
+\ No newline at end of file
++{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"010873ba1ab0ea4b7e3b5eac72aed5f50e535d42cb94d=
a943d2aa3d74904aa0f","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
+\ No newline at end of file
+diff --git a/vendor/cc-1.2.0/src/command_helpers.rs b/vendor/cc-1.2.0/src/=
command_helpers.rs
+index adedab2..c911306 100644
+--- a/vendor/cc-1.2.0/src/command_helpers.rs
++++ b/vendor/cc-1.2.0/src/command_helpers.rs
+@@ -315,13 +315,25 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
+=20
+         // Make the dirname relative (if possible) to avoid full system p=
aths influencing the sha
+         // and making the output system-dependent
++        // compiler-builtins generates sources into OUT_DIR and reads the=
 compiler-rt
++        // intrinsics from RUST_COMPILER_RT_ROOT, so try those before the=
 manifest dir
+         //
+         // NOTE: Here we allow using std::env::var (instead of Build::get=
env) because
+         // CARGO_* variables always trigger a rebuild when changed
+         #[allow(clippy::disallowed_methods)]
+-        let dirname =3D if let Some(root) =3D std::env::var_os("CARGO_MAN=
IFEST_DIR") {
+-            let root =3D root.to_string_lossy();
+-            Cow::Borrowed(dirname.strip_prefix(&*root).unwrap_or(&dirname=
))
++        let strip_root =3D |var: &str| {
++            std::env::var_os(var).and_then(|root| {
++                dirname
++                    .strip_prefix(&*root.to_string_lossy())
++                    .map(str::to_owned)
++            })
++        };
++        let dirname =3D if let Some(rel) =3D strip_root("OUT_DIR") {
++            Cow::Owned(rel)
++        } else if let Some(rel) =3D strip_root("RUST_COMPILER_RT_ROOT") {
++            Cow::Owned(rel)
++        } else if let Some(rel) =3D strip_root("CARGO_MANIFEST_DIR") {
++            Cow::Owned(rel)
+         } else {
+             dirname
+         };
+--=20
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 28c6d0b1dc..54502ccc9e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -3,6 +3,7 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux=
-g.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
+            file://cc-hash-object-names-relative-to-source-roots.patch;pat=
chdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch=
;patchdir=3D${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.p=
atch;patchdir=3D${RUSTSRC} \
--=20
2.43.0


