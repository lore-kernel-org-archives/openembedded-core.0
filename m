Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF53C61DE5
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 12:59:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8084.1788094769530408599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 05:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hnsbDvMe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3702f0b8a2=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UCnB9T1367518
	for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 05:59:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0TVtfCGFD4v/GDDKUstc9INr1+mboxs48FMs4dTLq6M=; b=
	hnsbDvMez2PIvkdVF9rhS4wECxSBguZqcJYHj6xIH1qNpM4j0/43lBJOEiU8wIZa
	aPNioYLpoSuntBieJ6ndy2o58kgmDHuaP5+6iLAmmNwPTSmbwDSHspE9PQkGBZX/
	VGl5oDqrL6SgPWzJUXssexhUBaImmccc0xli8CZ17tIp5g2ZSm7aA7cNklaPVVUp
	57MoXp3gUPfJEdS7RIni6Df0a0QKj8VNCN25MTvHMqa1KfM1ac3Bli0zxmSct7ec
	j58rnOWvRI6eIGXakGYXPuneLZxU/DJ3M7wzt62x/UWc2FwH4AOd97woBkvi4FSh
	gSz7EszqaPd5GU4E3clAxA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021107.outbound.protection.outlook.com [52.101.57.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxe8wbs-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 30 Aug 2026 05:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIkuIySRGDptnz7jBZJ8P5PyAB83eFONH0ldbhSbZrqKAaW2q8rDrRVZ+1MGHPCZjwPdNOkVqOxVtaX23oTiN7lgCI3ShH3295g+6pDQ/DUz0yoW+DCfQrGwBE5QHcdxEMJJlfO0PL3mR7btrVCbi1NT8pZmgnh78syOb3d5Ks25wjjcPwjV4UG1BmbEZadvGlXUoG9tDoBJCx4k2cfkbEiRAD5lWd1Siq9LhKlU8LwHB+L0KX0Hd7ZZ5eiAyi2AUopWJcGaULIeZVr5b5Mk5n6xI4suvOAM5E4oNjNjQ/rUWymDQbfcGnuER9Kj4nit3AdcUgGUfjUhzb38ZDApHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TVtfCGFD4v/GDDKUstc9INr1+mboxs48FMs4dTLq6M=;
 b=Uex1JqQgLqDorwy3JBEqHsaYOW7rN3kWmEEh4JSSqJstgbsYIi1gVEP9JZm4F+5vvRdT8xS7p+6o1ExlJD2sKWCBRAqZxxa/ENFt8a2pMs4srrD9Ddp/EUeQtrYcLCHF2e49uD+fXhitJSnXcxrlKYxz9viuSFuSm63ulDHmlEJ7e/K7sZohwNGTmuBCvcv9GtKwxUwluec8zgLT0cnWlPyOW5BmPHmLbWlWK4/Id0sb9qIqrWj9/rTU80V7VDaK/Q2E0P+274vRbx7gSDJ0qYGo4tXThf70hulRjfs8Tg3sGx+t6p0euDhWy7tqBG1bUOHTrLfPvQBGY86GaGpK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 30 Aug
 2026 12:59:22 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 12:59:22 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, randy.macleod@windriver.com,
        sundeep.kokkonda@windriver.com, deepesh.vatharaj@windriver.com
Subject: [PATCH 02/11] spirv-llvm-translator: Upgrade to 23.1.0
Date: Sun, 30 Aug 2026 18:28:42 +0530
Message-ID: <20260830125853.1139807-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::22) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acd4dc4-57f5-423a-90bd-08df0696833f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|10067099003|3023799007|56012099006|11063799006|38350700014|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	qYfISswepVONo0FwZGUHb7McMQNV1tiF4DFlfZQng+7/GmMxrm30ve8iuUYMJrKFXQJ8EZ20teZumCfRVy07XeuBZJx8bn6oNM6cqAV4399MMD0lZIUnFGyrBjD+BJCPZJE3GdtoC9JzI3D0C4FOUNCd1aHl3wx8nW8MiInyqalNJzsu4IIt+4epTqylORWOY3AJd1TxU7H/OLyaJeFYPZMfQZOZs4oIwIwuAFRGnG/ZRDlnEqIUitFfKBxYKWAsc6zbZ9cAgBHf/rq9kbHLsIqEKzp+4sDigCO5CYCCuR2Qs+xl6/NdsYETA6Pg9ObYQn4X2+av3Bj0Q6+SktjgFa5BnA8T1iG9oADx+JUmrPSiKXu/AwOc02qWoSqwe3qNNNv9qpUtAMPzQFP3wb4CM0/S3w/EoXdcq4vmo3p8uhkvUHM0wtP7G3M/u0DDTbA8hu6qesZzz0IrW9jpf+KcRthBQK//dfGLZP5CwzPMmtZXzC0f7H2LJnduYgWtvLFJWUVbAsMM0+yNxeBR024GhjjtJov/ElwDQfG+8YgMRYM3pF3AC9L8izlZF0rbCPqQCPD7qckvsjNT13YeUN+oxKgTnAxxOSyFguqeh25dIFx5sXIarSB+aTw7cz3DqfP2DO1B876WHpaNEJtvZj1jlwCAnwpv14PnzwEudnO450HPPosClqUPgRW7zbx9Ha+d4/mVU5JyXcUW1xnpNTrXk03KsF8zd0mJQXNH5jySGv8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(10067099003)(3023799007)(56012099006)(11063799006)(38350700014)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ifey2MOguV1ugLm0QTA891kepwWWgH5VFWpRb8nV9J5JgbwD9iTDu/Bv4sbv?=
 =?us-ascii?Q?tuZspcP/o9mdLEv1vJL/xsUepCspbmC2SmNnC+So94erYYh4rlMpGgNZlU4l?=
 =?us-ascii?Q?xkFzF9CtFXcJaLRBfzmkCDomXvI7N4NP2frK0Lym2ACPtKrnTdGnMtRu4MTK?=
 =?us-ascii?Q?g1nBwWzih3v3x999uFgS70ToOhodH3fO4LpMhZ189DJXVmqQsQe2rKCaAe7I?=
 =?us-ascii?Q?DHOs7WQQLxYXFdU8fa5dSfFpJ6ZGVj38SZJZGCjDBSoUxDDS5NHPx3i53tpP?=
 =?us-ascii?Q?hLRreKAnVKIDVE8k4TsyhbITFkaoTalb1YnFQ86q+PTHaYlj0WHzUf6g9Q3G?=
 =?us-ascii?Q?6qBnpEYdB4MVrOqRpE8O8ISP7ocVaD45ENiPVkg8/lU8v3r41Olmqo3gForo?=
 =?us-ascii?Q?2kHIR3cqOwljmjXBN9jhepPXZxs9/WWjEBE5UJ3LbN2qa2MyaE6eM47xoqh+?=
 =?us-ascii?Q?sD8UsaTg4DgaTrOQSnwY6Nj85e8mo8oVSz0r7XgMP9LkM+0boxS08FAQ8wrh?=
 =?us-ascii?Q?b1QVkirvrqHLHZdlVEddLJBPbd0dyYDstBIui16gjBjABAJHlyL3JIVdfRoy?=
 =?us-ascii?Q?wxTNpGYxX7vTTf1Lgvku3uoVfwu28t+73/+F9YXREe9h1DvLNcPnfInP8lbB?=
 =?us-ascii?Q?WwPTQ1kw69+EX4TCSd5+VK7jo6SZmFYKoglGi48Z8VLG/UwjOupsW/7XrLU/?=
 =?us-ascii?Q?J+Cb8q8Oz+Jn0YsQB0MvAH89Zzo276kOCF0M+au4AIfJAZ6IulqNtBG3AldY?=
 =?us-ascii?Q?TktVMAYKxuLWjoSOhK8Kl5zzy7J8s+prgXfSDltgC7FrlwcrsnfSlhif0clG?=
 =?us-ascii?Q?OgUiHpoPctPK5rs0nrDveStl+hy8l2Y1+iS9uelshUMdO1uXsheUrsSBN9Zh?=
 =?us-ascii?Q?SCK7mZxfP+AsdaC/BH7uysgmOcTsPmCeq7sjJpUMA7Hfm1dMgKAiyh5ZtidV?=
 =?us-ascii?Q?qc1hr0xJ6yKmxjbTuxWbvVwWvfOIdjyTLH/atZIGaLPZGlk/2qSCB3bVq1Ea?=
 =?us-ascii?Q?43WyLElcUNYdZfUVaO+qm4+3D/D8gy4+2fQovVkXN4VpKA5xcpCzLj0lDqio?=
 =?us-ascii?Q?nzWGnQj8TE8CEyOsA5L7ZKqaqwvhFIhecUhyNlK0WsHkXKcWFSiCgHNAaFfU?=
 =?us-ascii?Q?q+/5wxm1hfKYt267mUbPeYJghCdLq6HOKTySmVsIU7f5CUIXrC81KKyiA40/?=
 =?us-ascii?Q?xq4gy901NEEPsPx5+Xaqj2pVH73G7oS6OJX31flR/PyGrYNq926aH2cf2Gom?=
 =?us-ascii?Q?H36dsSqrNrHjeVlGSJQl/3+9WHfN9QWp/hiKAjpVzEVzWfd9Yo8RthjNE/ow?=
 =?us-ascii?Q?2ihR/V+mNFpNXujGpdEvRmzrvQ/s57XQw0io7jCONqpwG59v1NT4mNywa8BI?=
 =?us-ascii?Q?OmEqL8I1PXz1q/4t0UdR/PWqC/uUa1u8aXvQrP9i5Eid9tJZTUwbgMD1vAVg?=
 =?us-ascii?Q?DiWlrpaNBxarbFgMcPUsHe1nZ4OujmiHq5T3rEYf6lZ9txpJ8+R6HascTDQ2?=
 =?us-ascii?Q?G/3borrmKCc2Qi140IVW2WQH9yFJibxK50E6p++dKqeDcT1cMnzA+LWgEAeI?=
 =?us-ascii?Q?lMrV0+nl0wwfGS0nEqR/Wd91TQEYr7N9klDYjo93BgkiHIonNqx/eKzz4b9a?=
 =?us-ascii?Q?Ii8Io80MUlTclJrASd8xIjT3Rwxwb12QrjTflKHtvJQWm4ISKwTTkQ9St3Fo?=
 =?us-ascii?Q?lw09YdnDIacHcrkkmj/mhkj/ays4/avEDASrRpqkCtzcLFvuFKTcnxXDR5SZ?=
 =?us-ascii?Q?Lc4h7aCtNLmb4GdaVGqhLnmnxNIy020=3D?=
X-Exchange-RoutingPolicyChecked: 
	1NoEUmpaWDWcc80JAMLPjurraZHC6JybG9s+ONm4lDsa/8LLMnPUguUmleZZMQ1m02pLAd+q/jb6IJAtkgu+ja1Pot7H6l7zMSYUxJ0ek5UFPSms2zF70IYSuGfE6EpJ3CkttBU2jDdNULGVDY/EdAiWQaLI3VPdBDOr848FBSXYi5Q6Ei7PbwH+i8u27bZ84LInkOBgv08K4+Ir0+HSRxp2QLOnyNPwLkBCqFAk56M3GSsuyVdo05Q5iJ0TjlWbWaOgCCoAjVCM2Kai3862HPC7HC49BsTFR2zRlZ4t4ROfcZ3MigfI/HXy3b/dOpNnVAqoq/QMd+UHtdVH14XxAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acd4dc4-57f5-423a-90bd-08df0696833f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 12:59:22.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFxgGWD+cUhM4OVf5RLU5zlISdbbmaqkq0MTU7PYYGPsjR6LR3JetgTNbo3BIID22NUke91grU+QUlOIBH3caJXBC8DOvFucWUVYG8/oR0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX4I36ITM/Xwhh
 6vEEeuQVkh/txqgvDoaZLJDxGKjjnAAfNsV1rbRFa/cK6hoJFC2TGyoA1cGj+A5BhOdeIY9+GEW
 CTfEVW4YaRmarqkachhO8V2iY4bHUacktDmYKmNKiRz1AvHTnGZBr++hxEO5X7CyguZkH/UbVeD
 gQzpGkN+F/NELcBubat7o2jCJzsQaWKP4Pce3ILg9pS1RrorTVgU2Dc3rksPPwvn/LQ3u6Xys9D
 njfAg6V8mHgUb3lfIBejjjpP0bqXTCqsJk5fvvecnDMBBn1sr5tsA7TL/gTOKId6UC8vhnAAeau
 bW9iGnfMBxpBDIyhv2SxF6v/X6TAYutHmDn7pu7w417ejgsPvkVMFvNlQYhG+rZz7Uax7U/wzQ2
 SpWTOcrMUG/DyputCU3M+oZBHe9YhFEc1OmqFs1h6DFFsOWUhXBNwUM4Nx0hN386KX5YaBhuP2z
 8CwdqhA8fFX8WjovAvg==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a942930 cx=c_pps
 a=AVViaUQ/FgKrFaIAxxVSSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=_D-eGIWcj6IcTbUoBEQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDExMSBTYWx0ZWRfX4i5H04jFAZCD
 saZxuPFOQX9iaOYUkbNUf+Y/5duwrq9PGB5XBIS5yo7v6GVlpJGNT2vESFTVDbIfboZ/vmnNbye
 CWEYMQt0woeuMV10erm2fEuzTEbIbo2DizH+OhePugjP91IFS9u5
X-Proofpoint-ORIG-GUID: P7jSep1zBRWKgI0tsvFK2YnayU_eAcUE
X-Proofpoint-GUID: Ro9dReI8Ob3aurRva66UDQ9F2Y7lKMui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 12:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244646

From: Sunil Dora <sunilkumar.dora@windriver.com>

Each release branch of the translator only builds against the
matching LLVM major. Move to the llvm_release_230 branch, pinned
at the v23.1.0 tag.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...translator_22.1.5.bb => spirv-llvm-translator_23.1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_22.1.5.bb => spirv-llvm-translator_23.1.0.bb} (87%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
similarity index 87%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
index 1f80c6a27f..fd1dd9cfae 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_22.1.5.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
@@ -5,8 +5,8 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_220"
-SRCREV = "27afcfe385cf542197dfde8c658e1f5ff53fc2fc"
+SPIRV_BRANCH = "llvm_release_230"
+SRCREV = "19a29d4376ab470909ba43ca014ae668fb1156c9"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "
@@ -18,7 +18,7 @@ DEPENDS = "llvm spirv-tools spirv-headers"
 inherit cmake pkgconfig lib_package
 
 EXTRA_OECMAKE = "\
-    -DBASE_LLVM_VERSION=22.1.0 \
+    -DBASE_LLVM_VERSION=23.1.0 \
     -DCMAKE_SKIP_BUILD_RPATH=ON \
     -DBUILD_SHARED_LIBS=ON \
     -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. \
-- 
2.43.0


