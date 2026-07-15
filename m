Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5643BC4450B
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 06:00:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.625.1784095248420680981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 23:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wm9s0A+c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=165692db3c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3ud193641469
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pD47tWxsLYuRs5smGShBhL+SMvTFNSEJIrMbKT0tzP8=; b=
	Wm9s0A+c8ihYh5YXnijO+Kxn4jnDo4167Zk+ylUVdxkWqOaiTVQwBRylF8FStzgD
	b5xb0Es/qFQsttpkuBkfCrGyiuQYOZc8vaSDNAdjDAAM+wya9TA6bbQ6qDYjpl6z
	CTe6Jc9v7s3pwV46A3j73G7JEzbVMAe+lkLEwzAkBsO6OUcqF2tIk0Tk2IIUjRD4
	L2zDmhHQI9IFNDM7FhfXDWoxEbx4iuJYsNH2YMpsetMIjBJzKiTAywBUGeRMbE4c
	qUCqCV26POqPRm6K/x+dx2ZXOTVF5No57yN3EM3L9HQHh0M6Uz7pvg6rhDsWCn6i
	QhJAGOzt/mCcNgMMvjlnQg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012004.outbound.protection.outlook.com [40.107.200.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbh40wfvd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 23:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffn4HPMdkCLRz/gWRs83Bwx0zs1sDgC1bn3NGhxziynGlOyKqtC0g2HC555+JITbZFM6oK18CwwBslJrXbolX0whPx3pp/uV9BKyfvbxrMWUCniyfR8yfrwJbQ6+mK2jTRHVC2JDU5BpRfCUNmqowI/J9hew0H2u9HljjGhGZxJWZ3/8cBoOMNIJXfkL7E2GHPgw6Tp7J2ALPpBcae9vj0uj6R0ci30qrsOsSk3e9OHlj2e47ceVPR1XzEQ4ChXBhABelhqkepiUXmWXBUKtn0qzka28vzda4t+yFS6aVECt/Aua1hV4+BXFEKSRHDUG0h+Ogs8MZDLsTFGIs5wQww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD47tWxsLYuRs5smGShBhL+SMvTFNSEJIrMbKT0tzP8=;
 b=hx8QyPRUOHbIAjJpBXctNuvKBN0SIDNU8bUQxoThlpFqiLCsdTST5L95ruoEs7M2HlsJTxvP1T9ts9qJbw6QciIUfD//aOXwljT8FeiF6HMkKmp5oT42T5bWWDbmUrGB5Z8TgZJDW/pXbK0kxZzkMgqxoUEs3zPLGvtw5bYiXxm+y6EoTcHA88xlYkdDyLK7Q4fktx7FqmNv+bv47BI7L7nWvi77aMYJ7FblYAZLOfbQ8jpmYL6cG+faZlZJm8lV88HlJ9bei5LgNuPhSrHYnx/z4j3UOgh2fykWDyKWn9TcOQJoWQVgDXsB/sNvYEPsKhG8cuNhis2UtZbFtlylBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 06:00:45 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 06:00:45 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/3] clang: Enable cmake flags for llvm, clang, lld tests
Date: Tue, 14 Jul 2026 23:00:20 -0700
Message-ID: <20260715060021.579656-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::10) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS7PR11MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 7901ba7d-a60e-4275-f22d-08dee236692f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|18002099003|22082099003|38350700014|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	VblGhwCySLpvIAc0nBZu6NbQdeOKLPCks7RBaOZGVA4TbQVIFOlqFpeWio/FGRDuAts5OME/E3zwa05cT5pnsbJIpiWWwD0Ru3QdVPVLdhu47aEktN3HyAwTRIJWeJZ6aubAKpQ/7AJ4JVnvM8HmbQaRYLYlSW2faSkNdgaXHfB4jRIkUz+iCqLaLl0/MmFKyCazr5F69FhoSk0l+4HsA/SwVb84vpMn/bE2uKq9s4zfMhdSaPdInr9rmNEajc6wtfSo2+gIVIJaR3LKGpzU49s+Yn3RU6B7/IFS94AC0IzisDOCzvjCC2gAr3TFRVSJDjLNRsg0tKaKDpJjsTcKAx87RZLsdKVG0G8OCRKSHS2J31iqOKQ7+X96ABYHbxliBwRz44d7+jJrH5k/XfRF29fVqPSIRONv6os20T7bDJ5vS9IsTRauHhuesQqfuiWAlZX2rrLR0lXIee1KSni4RxTnkcGfFfO4yUrSVemwaHwDn9n2SVPHQWKma0r6aSKXW15P689+ZU2mQFyuhTaZYMTaNOeZKY1tBDZ9eVjMAvlIcBuFzfiPoJTqwHTwyy5JKW8W6JVid6tFLvAo5rhdApqNEBCJ3tovAr3XaTGe6PTh33n5qjAd2Vm/4VnV1gjKYAA95XO2wkpqXARoP4APw+GUDdFiztNkCwTJv8wuN3URC3SFc74fOmY0WKdVU+keiTlrzcroymYWEjAUwmsJ4ZXCfqgTeSwmX4DqSRLuZ90=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(18002099003)(22082099003)(38350700014)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gri9HkQvgQfMaeIwLJL6OK1QbyANE8GtrjV1zJbHU4AxmD3T/s+0xmGtHcj2?=
 =?us-ascii?Q?LS8hPpDjXTdD3wDTMaHbtnO0qZE0ZiLKOPZfT6j1pLA7XwNDlPTKq1LFTfBx?=
 =?us-ascii?Q?DUUiK4+1nQZCQ9kt51yb+aj5VlY3hQkPLjuo2VM+2hqF77XpnEN1+frYIfLp?=
 =?us-ascii?Q?2O5ZwmReG8pcljlIqplQsHKhtPCUKqwCkfCjj7254VOWHxnxdF/iJwpcTNRe?=
 =?us-ascii?Q?iT50jLBDgqT9FJ3UvbkDLUgXtS+EpNlY4RJ+RA/F57v4UBMTpJoAxEAAS2BT?=
 =?us-ascii?Q?tpTSjzxgRICJBVsxP5kwnZeDt+yKOJYak+E3aHV4Mg2B8CADo/SojB3SxX54?=
 =?us-ascii?Q?bwH1fnAP75hFY8vvVdeDjgmq1cUvggB3mtZmuKOxmcatHFzmxc/ELy51V5JG?=
 =?us-ascii?Q?gZJW7pMf3pG1I1Wg9tB0SCRBOD5EkPHL6DhfrvlAdANALt4+4ug4c25nDX1h?=
 =?us-ascii?Q?NQGH71985XvPTK7EiACKuVpNODPHvxHNrucMAq9vPyX7WQ7zjT2wkSZyjDrR?=
 =?us-ascii?Q?SaeeDZcs1lCjK1s7KaK/KMewoU+i4yBRKk5jIA45dsdk8z7l1aaZzyZsIoT5?=
 =?us-ascii?Q?fm9BJag8wvL1QNnYAwZch14ZhTysVyq78Ni9r6hwWdLIf+uErNPVqvElmraz?=
 =?us-ascii?Q?NTtJZUQ0IDw3fYZfnK90o3KR9bWcQ+ixJCOIL4WAUuyLLMt2W8ll4wVrwuwH?=
 =?us-ascii?Q?nNdo9Y5J06Xoh8UOFIKF9fkYSUfEpsj5GO7NTKFqLz/breR3cHVcyrNcXfKS?=
 =?us-ascii?Q?xSVPdZfVwLKBs243h1jPSNLasaRTCvFpo1fBgBunIJXQDQRf+bBwKVp9wlGZ?=
 =?us-ascii?Q?v9XGyXLdb6VF8TkRJ0x4ubnT5aLgBvFFK3Y6TpJO2UFSn+81bQ/8Abvoviur?=
 =?us-ascii?Q?Tek1IZxbQT2WI80nlkAlhvee9ioXBtkWkVGA9W92qHBugXFENSAioHfFph1T?=
 =?us-ascii?Q?DkQqQceL1f54uBxAY+N25F3E09xHw//6XPcqCEMVFdyYgx4/Ho+u3LS6xOlA?=
 =?us-ascii?Q?h7LMzA+MSdsiaEnqHwREzE+BzkxO/XAMT7jq0kIPK0Gn8Y4jXvvhk2jfTRRe?=
 =?us-ascii?Q?4CgFeDrnWTtOqqIj8s7b0h4c8lMNJD6gOUYIsVMU/b5PMKrdqlxhTYyDn2Ge?=
 =?us-ascii?Q?dXIxgOxTAw0Cq+dkkLc9xUqMxlye8KRXao8f1k2rtUO8aQ4PloI06hn0+12s?=
 =?us-ascii?Q?pS5kVg/54zPgx3MfKa3r5tpwf4oPe9VcA4gRnEsOw4f1NSz0KpVx4JwNf2Dn?=
 =?us-ascii?Q?OTziLLiytVtHzs+Pq4BKVFlkqpLk1lRA1/Dh6XVhOzavP0yOKN/yyNrg43me?=
 =?us-ascii?Q?zODKIo5HruD42s7Rm9neYIPaGM7nfsysah/XR1cdWWSZEdPup+nEeILZO1qm?=
 =?us-ascii?Q?ThN9qTTnJmxH6D9vIvTYpfrMk3J0W7VMdH4tbOwFxf6GwY1mg93mCy30WW6r?=
 =?us-ascii?Q?2zfsTosYLL2VkS4jm/An/8zYEALe5Zr/ZSFIeMD1bJVpSMyr0YmLwhMbPDSh?=
 =?us-ascii?Q?pQYulIXkGXrcx3r/F1axq5Hu6FB1VM1Fy/1mrYWVktMvvt3lyk4Gegi5t1Dx?=
 =?us-ascii?Q?q4UsdDAIkWLca9vUD3H0cxfm0M24GkEc3VNcTXzg7wrIHs3bp+1hg4i7nB7N?=
 =?us-ascii?Q?iFKCKDID1eCPQvVfx/RRhyI6PZdc1hevflDfHhPGECOIzeTslCGlqxnZ1Oa7?=
 =?us-ascii?Q?GYov1UoJfN5b7n3RKDtQq2CatNPkrsQnPOHh+xOoBOL1m8sTNK+4hLEA5Pn2?=
 =?us-ascii?Q?GweOX/Iv9u/Gj9ogh3LRq8h4vuyNnkn1AmZC37i8tFvIj2/0Ywka?=
X-Exchange-RoutingPolicyChecked: 
	qwb/hfCOAziNsFca2y9bhNZpkT0AuqMuT/VRrnyMlYisvsg78Vn4rMmuzjG+EMhe/Ia5LoYv+Yw1Os0BGsI54Ns7ja2kaysR91tuY8xFP+MBiXZSaDpVPUg7RlIMp3RMabtigfQ2qQmaeG/9R10XUpPVNa1gMvfqVoipmI4ocZxbdTAX9vNRBO1c4QD3TJN8vhvcM2nuExWslc7pLUCjnAMrxteQketKGuj1m2xPTSFbnmdYe/9kYK313gUvtuUBNXmA/fCfkJJGNdVGCT6a2qY6aqwr2Wl5V1N+fZmWJ4CEvuNkt10COV7vmRMS0aXrD9vsM09f4DBuylR4tB2s9g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7901ba7d-a60e-4275-f22d-08dee236692f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:00:45.5389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c91wNZsT+3QvIgV88EiWHSbbAds8qAQzeItDQY8Ll9WdWEDHtkSnzCGqTy2EwHupWT3WdA2lNWGTjF33lcGu3Rs/wJRI1d2KGI9ntM83MeoDDFy+eHMRcnI4Ws0kVmum
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6077
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfX6RK/hmwNk/jX
 EOshEKODoTKxfpIyH4QOLaPCD7ABzo5MOdTyaTXm+lvsyxr25yTtz6s1YOQieFMmTmQ4EYaXlE4
 JMykmgPrEH8p8OrbUg8IM0Pvuzxv33UuhwRwONBcf2AfTUt4QKQalbZ69vB6OmibEXUgUbKTSly
 4EfRjtiVVeUERTijxFmObUvwj3E+wpvT0IYMIhJhgJQcCEU1b8kkmWBol1Ia3mT8b0fLl5K5JG9
 0u6iLjdgdaV/HIc1D2BaRkWuKTCMQLplCls9UayJg9eQjqofzf/fIRDwUdRm0ReQUEOM9cZH0Ha
 gaTFLiquYFkDTsfHEjwKktaFGI3hl0MlD1Bz5M8WwKxXFb7FxdhsVpMV6Hq1B5dTAM84oZIP00A
 Kn7k6H0Yy0JRWahR4xt4nRMyiL/8HL3Lnkw+yhjApvKrb+sfMtYcKB4KxpFrWpBkZ8PUcMiS7Q2
 /pVA1T3G2SRXCdAV2jA==
X-Proofpoint-ORIG-GUID: Oc_2bFjaVGjQZC1kPpF8B2f0-KyitV42
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA1MyBTYWx0ZWRfXzbPe83gpR5oG
 6u1qqIXUA/iESM7EelGt8AThqYwkDPLScBcN0Sw1imHv0GJLZxPCI1u2h7byFn4qdXTTaBGhhXp
 DjqJxwEm9t8bjxyGCdg0wyVwgb9ByYh0eSZhbDb1NBy9FdFnS1mJ
X-Authority-Analysis: v=2.4 cv=JbGMa0KV c=1 sm=1 tr=0 ts=6a57220f cx=c_pps
 a=QZ+jOWKMuognynx/2ZkwyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Q7J_BWS0j0Z7kq5DsWMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Oc_2bFjaVGjQZC1kPpF8B2f0-KyitV42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 06:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240940

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Enable the necessary CMake flags to build and run tests
for LLVM, Clang and LLD. Install the LLVM target tools
needed to run tests via llvm-lit inside QEMU only when
CLANG_ENABLE_TESTSUITE = "1".

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  8 ++++++++
 meta/recipes-devtools/clang/lld_git.bb   |  5 +++++
 meta/recipes-devtools/clang/llvm_git.bb  | 18 +++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index d55c59ffa0..a8c5e8cb2d 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -75,6 +75,14 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_STRIP=${STAGING_BINDIR_NATIVE}/llvm-strip \
 "
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+CLANG_TESTSUITE_FLAGS = "\
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('CLANG_TESTSUITE_FLAGS'), '', d)}"
+
 DEPENDS = "llvm-tblgen-native llvm-native llvm binutils zlib zstd libffi libxml2 libxml2-native"
 DEPENDS:append:class-target = " ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..8960cac2d3 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,4 +19,9 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLD_TESTSUITE_FLAGS = "-DLLVM_INCLUDE_TESTS=ON"
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLD_TESTSUITE_FLAGS'), '', d)}"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..e7823154b9 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -80,6 +80,18 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
+CLANG_ENABLE_TESTSUITE ??= "0"
+LLVM_TESTSUITE_FLAGS = "\
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                 "
+
+EXTRA_OECMAKE:append:class-target = " ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', d.getVar('LLVM_TESTSUITE_FLAGS'), '', d) } "
+
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
 DEBUG_LEVELFLAG = "-g1"
@@ -118,7 +130,7 @@ do_install:append:class-native() {
     rm ${D}${bindir}/*-tblgen
 }
 
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess ${@bb.utils.contains('CLANG_ENABLE_TESTSUITE', '1', 'llvm_sysroot_preprocess_testsuite', '', d) }"
 SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 
 llvm_sysroot_preprocess() {
@@ -126,6 +138,10 @@ llvm_sysroot_preprocess() {
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+llvm_sysroot_preprocess_testsuite() {
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
+}
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.0


