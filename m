Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FACEC982C4
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 15:24:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17635.1789572242513980584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 08:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dnnM35T7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3719b62dd9=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFCtcI1650312
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 08:24:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gmqdymSsCGta3tV8Xowh/s/4ID5Ij99R0Z3gcLYC4bs=; b=
	dnnM35T7zXObK7//9CF4zXnUj/BfZFi5LxcWEMnNk3aCUxNhfDy4YuOintUuGVPT
	qnfB3O2mKq9kOwyqy2rtVzBg7F6b/0unZ1guXgTN7Bq/3HFLdKqdz2vNJoTOL0BZ
	+kB0+lsW+44GO7uCMUjE0ZFZmF8m0BOxuz6LxH9E7eUFHrecVO4QzyEd36KyC0wG
	a9iAJp3+BdQYEk5l3902GMu2D0bolTJxCoOTDDxae/D/SJ/e08B/NuF1kY09nf34
	cuWBqQ7UNE/CIsyrcgKnpkb5yO0yZgc5+tENgZJ8bTobMCneFhJku8U+zMZlq5g+
	9sptl3U86/4OmF4VUmqhFw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021111.outbound.protection.outlook.com [52.101.57.111])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn210r8qe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 08:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuEahFVbvCLOo48Pfv21cDXv2gKK6hEunSmRWoi/9DcSsA66dDyFkak213fRYfGs8ZtASSYiY7EXJUP7oUuyJBpD/xDGyr8xKFuW+7va0ViK719pXHdP/E6wWUV8Z8L6c/OtEN7xH1G+0cJwzbYmoS/fPuxwjPnBlZOiN7zgxEGRgYgJtK4G5g+cLqkPND3elMJhWdptSYqL7mM5IzJIWaxHSWR2r8mBEXG4f3ke3Q3FBW9R30fiEXr8AfS58FytKmSNxrmh3f92TkdGABvRq+J5VYEfnfYaUu0dvqGhXraxWKGBFl1em//0czEXBl6o3GdgUpWksFeTouAukBj7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmqdymSsCGta3tV8Xowh/s/4ID5Ij99R0Z3gcLYC4bs=;
 b=BGJx8s7rDuJkvsZVTm/4Z8DjQuDOlPdQkpCSfpw88zMdxFihWQ8RAW4n35eTWvACy2tC31DM+Ad9Fu+CcQn8aq7RSrT4/vKK/h2F5ognAi0clAcTQJFV/QiTbq0Pgd1lj5811Uz4dS5/SWhZ445SZHEhMnUXHfNFodDC1p3wVS3UxaJbfOUSTVSZ4077B30JUvUE8reQ9coK/yGAfKgdJ0RsTi3J0ytwfzIDUJO0QlSpCxwQm92WUWh8MlqAoDWM33hZQPTyxuydPChj1OkMBGPUHOJ/6VVpp46R7kKh4tK87GlzNXplN1HH2y7V8CnxDTNo1JnNPnyOcAr0PfmSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.11; Wed, 16 Sep 2026 15:24:00 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:23:59 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        Randy.MacLeod@windriver.com, alejandro@enedino.org,
        antonin.godard@bootlin.com, sunilkumar.dora@windriver.com
Subject: [PATCH v2 4/5] rust: backport deterministic DocLinkResMap serialisation
Date: Wed, 16 Sep 2026 20:53:25 +0530
Message-ID: <20260916152327.1765623-5-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
References: <20260916152327.1765623-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c53e3e-1e2b-48e4-9ebb-08df1406882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|23010399003|1800799024|13003099007|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|12006099003|22082099003|18002099003|29003799003|25016099003;
X-Microsoft-Antispam-Message-Info: 
	++LzR0Xr3G8d9vhF5j7bwc6AiNcDUZeb1BfyUOsIuisDF4bH9eBuWyT1TsLhyghav+0iSyBCebQps9AaNbAANKf13lng82FzPO8/dQseH+VaD4SoStkx029bx31bpMUYfeMlrUQi49jbYW0dDPPT4MwxUebkc8G9NkeJLZQj8p0Du2oOV8CW4Qw5PQhfzHiPUv/Q3GeQrygKoBFScLrdJQ3wcb+IyEZTtMJQAGOEkKejjaYNs+d880c2Z4Cjf+I+hkCHQo1wjrIsf4wmUqnuoyVSymLUGwJUvfya+xI4FRZU9XdbpRFn8Temi9qJRTGaJwNiHDdOkTnK9H+F+qSxFLQoLHsLllaI+7qyfRj8vopIgKSUj69igMbugvzfgbWqQuQ25YuQaJoEJPUWgBGYR5soag8UJ2Qcm9DZPKFq37oMrNa3h2+q3lgf4Oe3bvzc33MIkp38u1F9vZdSwsJVl56Omjq1limImpLlqDEzM1WBpLmpO2AdlMPQptYr47LecJ40RbpgY3NZgdlL+tAyyXmMNM+aRv7b7dyrtd8bDfpDV6lfCtWF8mcvQKai4pAdM8vYAPn7OyOkBf23mB3a/kq9vMguK0mCe2jvBAneOA7DgFhDYlxcyYYVC1NQs1Bjd9If9iyvNgbfdrVGE5sqfiRmywYNZXzE9aheV+u60A0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(23010399003)(1800799024)(13003099007)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(12006099003)(22082099003)(18002099003)(29003799003)(25016099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dxz6iQkDxlXLCCbsmqwLHV1AS4bkxWetp0Y5MP5e8FUTTifr8tVTVNIc91Yz?=
 =?us-ascii?Q?Oyx/TBTh/Dv3EOyGg9YwYD3TmiXzn5rw62ATeYzx71mNTUeO2pa1SEdZDEZS?=
 =?us-ascii?Q?CYjBpPKk2/e+Q6+1crU3zMXpqLujUk4AuKTyNDzVA2B5Oc2xHXoRJuukRiOD?=
 =?us-ascii?Q?ArDr5picDRXuOCXQ1LolzXrD8IlesfnqQI83fbkQtWfNbhOItToFxjfwsBMJ?=
 =?us-ascii?Q?quG3rcMrL61FOo//JAa3D5wX+1Pd87nZWz2Nq9/anNlfpExifx52tuB4JuJB?=
 =?us-ascii?Q?b3kQySBWYtB2Vaiv1e5L4NSZD1k2rDneVWKpjAC3mYTLuGedk28qgvdTvzZC?=
 =?us-ascii?Q?zrLV12PheOH7WYpKPsB1v5B+0AltTWSfHZTzJ602gLoRvtOkMyinFyCx9VzH?=
 =?us-ascii?Q?SYOt5+VM7RuNyS50RA7mShpGL4qE+lyKdZHMpNFBE6iSVJ2Gvro6Xy1lZKm0?=
 =?us-ascii?Q?HE7BTd00sWulRx+wFPMYSnEgf6zsRXxMIBY1ufxJpzZSL4NZU0eStOBjwq/h?=
 =?us-ascii?Q?LVIc7qtf1WcZ7g4b+d2kcaXfOGRbohRc5QHW7kMm16bjBXblsC5bRFe9mXlZ?=
 =?us-ascii?Q?ZY2rOMtdWlakn8U3qVT5LBzV98wVTsJp9QpfYoCCM0fEqnLRK/ZEkOFyDB5x?=
 =?us-ascii?Q?TL1nIQ9HxIKYrcpKEnos3sBIl5/ygjROKDW58I0f4Ym2bGU5na4tZmeiR320?=
 =?us-ascii?Q?VyW64YpBMGchs81n2w1uRh9B216a7SGlkGV+RWzNfk/e8U/0ab/z5aVrJtvj?=
 =?us-ascii?Q?IxHNgiTLOf6ulAaNptxiC2uEknNvhBToLihOs4d57u0QGY0PpWFIO/Fa94hh?=
 =?us-ascii?Q?5G53wNGf1JSOqdhr6KgGVi1rqguxld4UK6xWBfPJBX+Tyotp8fo9byFb4Vad?=
 =?us-ascii?Q?YlqCJ9fxL7OndQlHihxmZVfUckrw/RIMq5DGfzqQlMe3CfuMgpWlnpMhm0d2?=
 =?us-ascii?Q?tCBws8UGYvvEzPi0cpoAhankgloYpvKv131xY+bGApnQiazlTjM7pU4SUNmc?=
 =?us-ascii?Q?21a2q0mcWnEfKwTmbxeLuV8ZLGVBqL3h9ps+U06pvo+sn/q3OeJfjVrU9aLd?=
 =?us-ascii?Q?9P0glJDmPL2fdFrouC5Ufsqajrw9qh6Z5W9LVoMiur1yJkprxLgPzFgOMmUJ?=
 =?us-ascii?Q?kaz+x0M9vktGzQy41UrwaSNZAPqlNeinSilYgad7YIHM1EmhhgOP9TSeCuxA?=
 =?us-ascii?Q?jQOfclqj+6xMiKRUgn2gccmfiGUM2kGo3bi0RsB1jn05sEhni4uL7rbICIEJ?=
 =?us-ascii?Q?Y8bKrMxpFP8pvPFInypdA7A/4H92BaFnhQqrxcWafFUmNhjFhpnTV42FbNU4?=
 =?us-ascii?Q?iVtfLwWaPkZcAzyPkoboAKWTOk432ziwmEfB2xGqD6jTZnyMs7mqCLUJNvSb?=
 =?us-ascii?Q?MBcDJdQlLLxb8gwv3MIfFJgNFN56IBeX9saLDURRCxJCgdx3oxrHhErQv77x?=
 =?us-ascii?Q?TZoTEZYkpkpLWsbl40paRcYjSpKNMsi2Khu6TLhBOYjv1TzXjd0qwRRct8WH?=
 =?us-ascii?Q?0BG7HXHBG5n6zIWAPt695Bdl+yfnzFeE02GuzVABquu6mKLJkpal7zfSH/4Z?=
 =?us-ascii?Q?FExV+ndzf6iVJ98PqqY3s9AcYqElT+T5mSjHjd+A+RhZRVyaxIRxc2bfBU3/?=
 =?us-ascii?Q?wxo7vHR4nN00KecYIAUvTyBB6FeH7+7uiGtdhDhWzA7AM8i/8AyxRYUq7cyQ?=
 =?us-ascii?Q?us9sn9hHd3DzDRF+dUq+a3frZwNk3NHs9wAcc120tmBT2luwDtV/zjotAg2F?=
 =?us-ascii?Q?f7T+Ml+0UOfK2Uk6zX2dE31s8G9szRo=3D?=
X-Exchange-RoutingPolicyChecked: 
	LBFeqN8DCyYmxrTF0Jqm3pUNn2w4IqqL8WuT+G0WJIp7xmzC3UsVR/g3dHUGJE1ak0kDAm/eLuP3eWXv0qg47I2fxXI2x5j+LsxqT8r5q9ST43oWiaoovXH9ZgnsQ0NeZmX8BHie1GxOoJeMWCpaPBXv43PSGtGx1YU+Oezk8pfDxaPnhjSSKKeI2OFiqTnve9+fI6v3+tj4Ole4QH6A6ZVj85jiezC2B7uWrvmceDzLQWUO8UhXplUbhyvea+hSMkuaC2afp+WxYZFt1EG1exkQqv0BQBaVqs9hLVVBJh5uHyQhv49Tu+qSPZ9j44w5pPacPb8QY17v73p3RW/how==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c53e3e-1e2b-48e4-9ebb-08df1406882c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:23:59.7967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOo+euWoIOmuZB2ETQglIIjuUjEAwB/orbZYq0RcFD8eaujInp/C843btWcZIYy4V45TvU462HV9YCuqMCQE9O2C5UhhVYwFMC5VRmnZw3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: WyoR2uVSE6YwlR9aDjhvfdkoNBfIKcI4
X-Proofpoint-ORIG-GUID: EG3c08o0TBxLKvtmTtmV5ZWkBBNw397J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX9DcOSv1l3OL/
 GZ248VJp7QqsxIWuDjc+yXBaW2ycdmL7/xvzBMWvteUphlByBevrgRpaqilbrsneiCoICF6GnT5
 Z0uaGZ8r/KMgwtjzL+O/gN6NMfyQ7sIbWgyr12i0eRNaOQD3a6uI+lr5bwGQrUnKXg/+Vs05DVK
 DlOxmKpswTacsHOu1hm7ZzmJSQ3vRvni3tcDD1eoRIvYrYMi1KbdZHKJs4+1bhvIchKLCt/JqY2
 qmt5FaP7LMGFRHIu37qTLoxDQKKGhRRaz1A1PdUn2/gAViWIJheg8BC2MGnNxLJLenRWbIQDq21
 20Px1I0HjeJ24q4uxDD2tGnZ8CfuvPzfVnCxyfBoc6ADqgrnsuawBDlezt3KeS5sGbBFJGcl3g9
 YpeUh117V5wMg/7z4KS6lVLq8DndTiI1Y2wpRbuB2m0V0/wMjckHNqAPc8jwylrL9EroBEDYt0t
 Ko3Ce+xIaiao64N3v9w==
X-Authority-Analysis: v=2.4 cv=J5Y/fwnS c=1 sm=1 tr=0 ts=6aaab492 cx=c_pps
 a=tCAl8lrDRzME13Kae+DQfw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=kx9bFl9ssQdwfPT5i8IA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX9ADcuPY7b9vZ
 c85pF8uMbKZequNsppltaH9QaaqmG7O5CkWogUszQZGMUdbK89tUs2I817DlkIfY9UcpCHRhMY4
 EO3e7+WunUm4aByjs1nHNAaKvo9nMXWfOrVk4sanut2AJXUSAt9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 15:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245985

From: Sunil Dora <sunilkumar.dora@windriver.com>

Backport of rust-lang/rust commit f9d9939 [1] by jprochazk and mejrs.
DocLinkResMap was an UnordMap, so its iteration order varied with the
build host and that order reached the encoded rmeta. An FxIndexMap keeps
it stable. The commit is in rust 1.99, so this only carries it until the
next rust upgrade.

[1] https://github.com/rust-lang/rust/commit/f9d9939467a5185a72f0ee8da778a0b71fc966ae

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
v2: upstream commit reference added as a footnote link. No code change.

 ...oc-link-metadata-order-deterministic.patch | 40 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch

diff --git a/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
new file mode 100644
index 0000000000..8cd64f21bb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
@@ -0,0 +1,40 @@
+From 6630363e7bc9bc0926300e242aa538b8d92cdb95 Mon Sep 17 00:00:00 2001
+From: jprochazk <pjanv42@gmail.com>
+Date: Tue, 15 Sep 2026 17:05:36 +0530
+Subject: [PATCH] make DocLinkResMap an FxIndexMap
+
+DocLinkResMap was an UnordMap, so its iteration order varied with the build
+host and that order ended up in the encoded rmeta. An FxIndexMap keeps the
+serialisation stable. Only the code change is carried here, not the
+upstream run-make test.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/f9d9939467a5185a72f0ee8da778a0b71fc966ae]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ compiler/rustc_hir/src/def.rs | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/compiler/rustc_hir/src/def.rs b/compiler/rustc_hir/src/def.rs
+index d0300d6..e903c0c 100644
+--- a/compiler/rustc_hir/src/def.rs
++++ b/compiler/rustc_hir/src/def.rs
+@@ -4,7 +4,7 @@ use std::fmt::Debug;
+ 
+ use rustc_ast as ast;
+ use rustc_ast::NodeId;
+-use rustc_data_structures::unord::UnordMap;
++use rustc_data_structures::fx::FxIndexMap;
+ use rustc_error_messages::{DiagArgValue, IntoDiagArg};
+ use rustc_macros::{Decodable, Encodable, StableHash};
+ use rustc_span::Symbol;
+@@ -969,4 +969,6 @@ pub enum LifetimeRes {
+     ElidedAnchor { start: NodeId, end: NodeId },
+ }
+ 
+-pub type DocLinkResMap = UnordMap<(Symbol, Namespace), Option<Res<NodeId>>>;
++// FxIndexMap is necessary because its data ends up in .rmeta files, so its
++// iteration order must be consistent. See #159677 for context.
++pub type DocLinkResMap = FxIndexMap<(Symbol, Namespace), Option<Res<NodeId>>>;
+-- 
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a294201c6e..a50a3fd001 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
             file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
+            file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
-- 
2.43.0


