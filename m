Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBCCCF394B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 16:48:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11850.1763570908984457450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rzOZIvt9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186f8fde=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vuuD4101401
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=v0ORxS/EwFa3RMe0LODcxQ6D19Nc1Tm7sq9GuoafUXo=; b=
	rzOZIvt9agH+f9sWLQYjphhZr5V8EanbAggmGHW789WZW4GX8r2reNdUqFNegz8K
	jFS9CGLpTFNh+EwGBzgPvxJaxU5639i/m6fGtT+J3mYFkFJT5xMlfx8lHUvti75F
	ELRKLfiMs3UNxdsVabcVmeOoD84eCVzIP0WcCA80TR3pz1z44NHMnIX2SzAcKUqK
	HGwzl3qgJfy/Q7nfOeqpiT86h8IUd5AIPdgNKFMmPhW6s7OVMU/tyoNYV9BjHdaC
	ZufKcLuRsOJywT9yLn5kbiVKR0hGn3sFnTuwvLpY+VZZN8L64o/ktHDXgoKFz68n
	aB67h1eCj6fnpk+gw426ow==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwncu5-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 16:48:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9U6DrH0/w/VXZzJNJgfPJfs2bJWbF6D+c2li8M8r3OSn8SQRZU/t8l2SbvknSWlYSriwnBASWfNYggpU9ZWvZX1TcMGq1/htuPeqQo8YgHuesEj6/9VEUv7dGpvGqrqAjxBA1exRHD2CHeGgA8uPnTvWIJ64/73oXfZx1TJcQcr/WhkvRxj9zRGOflJBROkJ3+Ifj4N9XsdwLP1GWycb1BXaxAFrxNS7nGe3YSFcjEn8UxPnMKs83kTlVqbBRrspE8QklzWvTI5Gv4ICAGdi7bgE9beW7+TFvEh1aq6tGQWfxEBSI3ij7TDcV17BERRTbxq3bmm+n3IYHXTf8UxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0ORxS/EwFa3RMe0LODcxQ6D19Nc1Tm7sq9GuoafUXo=;
 b=rwblmN/0+nSwTvLDFzQXCCw+WS1amOqcug52DKtpKP2+tek9eszb/Kl+fBymSPHOwCNqJZ1jymLvfaxpuFxxoOGsNPObCI4OqW1lvCqk5Sn9bit8t1trhM9SpmfM4nbaokZvYxEUZTlPn94FfTH1rcRYc9rM0QgTe4MG/l4Eycv9Cx91fZKc5kHpbQ4RA9zlvIoEGVgugTqZAz16iMqKosE06l5QeZZNkwPnLzU7OOeG0g61EqS8gcgUX9gdx+vIb0FZEVGC546brZvCfWubfx7mrwohjxnvTi63uwms9D6fJegyirDmDo0aTsaUDmaDQdwRFEW7xvYcYvu6pL7rqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:48:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 16:48:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH RFC v3  02/11] linux-yocto: add clang-native,rust-native and bindgen-cli-native to DEPENDS
Date: Wed, 19 Nov 2025 08:47:54 -0800
Message-ID: <20251119164804.256364-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0203.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::28) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: b8154d03-c724-4e7a-42c2-08de278b73bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?od8qIQtQflyx7oOXs3DGrBnmyuwjM8LEWrnTOm8gwjDNSa47y7YAPfDCmGIb?=
 =?us-ascii?Q?eILRCwPXprSDT9wm5KU5V8/K70ygfdKX0dZ10+xDsUpI8j1j1mTET/37IUlP?=
 =?us-ascii?Q?lsmP+ohPL84NZuNE/kUbl+hv06JJRjAFgK4YFqMgBU8vTcMKS6S6VSONGmhD?=
 =?us-ascii?Q?UJO8ZzLpwCYE3MvxhbPATGHKvicsWOq1UATmVsrFp2kWuHaZxdv9M35AB6Bq?=
 =?us-ascii?Q?8ZH0EqdHuLk0bzucZEh4JYxA5KkwOfRA1EZPI/C7kOdvoEUlflI7qLK1w8MO?=
 =?us-ascii?Q?+kZEBfpQ3U7TPg/1MZ5Wzq19Gsu7f43kcFqCTJtLKPC1PVMTrpQlICwYpS7t?=
 =?us-ascii?Q?d5hIYzBE5KzhrQyKcmMzT5J8lGgY1ADq13Gp4Vz3RSNMjj0V+IDzd3eLoA0j?=
 =?us-ascii?Q?rL6NtLbdO2TBRarXhLb+ymHEIiwwPjTL0sLMNKGkXJS0c+mibmmuH2dk+sao?=
 =?us-ascii?Q?OIEsupY1W+AS2AVrw+DMMvQ//BGzAPMMQ55qwFUZDwZclUxBR657kRDnrpqJ?=
 =?us-ascii?Q?wib2uA0AgTcLVWkElNDifEa9qKw5qk0hZW5CHQf2sCVnXMmpbpBSPiFwNe1Q?=
 =?us-ascii?Q?YTCrRLHVg9uZEpWcHg/2q71NdwMn2/QN0b28412nMnbdat8WwLGClfFWjAAT?=
 =?us-ascii?Q?NCNe09SzJDdPZIgcMGqgD8JqUUex/YmElPfNRyzLxRy6EgT0rMlbMgINsSe4?=
 =?us-ascii?Q?JJMfbc/xVkQQOtiajg6sgLtKhFesGvykETqKW2iqrSX3Pqs8ah3jwG19h0My?=
 =?us-ascii?Q?PhyuZEsK2NNoEayX/x98nhVavdB9Bcr0jtmI52dOLrtXi5Xroe4RDWQmt0ps?=
 =?us-ascii?Q?8vseDa+P5xPn0PWHlF9cYBYoJNt1bzEfkDr6J2QmSbtIrf2boOSURvKSAiUp?=
 =?us-ascii?Q?SzGadzhB25MGZK7n7Slu0DVT+AUHh1OcRNBZzRZrEFxn9pCWf+WVdUMiLbRw?=
 =?us-ascii?Q?kTmjfql1FYYgi/GL9eLOX2qFUgMsybHL1J0lth8y6hHAyPFS4289+FntbN8S?=
 =?us-ascii?Q?AkaxwtdYxlT6DpL2pdpEbzS/dum32DHRYkJ2f4rn6eD65hy/sxG/vI5avfWk?=
 =?us-ascii?Q?4LgLyIzg1oldJEF28fEy5MVmJOoC4flOotuMk51xLglGRwRInZrd9eQ0LOZy?=
 =?us-ascii?Q?2JjabCGBw8J1f/PkcnG5F/fEnCbpH0fhafiILlIVBU8dGmP7LGn+3gMc5fq4?=
 =?us-ascii?Q?aEyUye9sxqYRt0JgwCSDnuzarultqhtlD/s7aZl8hexUPf6jcWN/tAOoEchy?=
 =?us-ascii?Q?zyTrqzEIzgGoXKqvbJCfBBQVOAV6esLd4Iztodc1S3C38o7vfowrQys+SnV1?=
 =?us-ascii?Q?/SWss0sdCBqepr7M95PPfGac8BhrDpNvmXGRN15T+obp+ju9PVqYsW5mcJiG?=
 =?us-ascii?Q?TMsYlMZGfsYq1gHPoCyLULaqMrfCs715FHG5SjHkoRPqwNLSiPtApwuUo5nh?=
 =?us-ascii?Q?4A5tKQQ0713JxpKuxsVsiODipG1AqY4QH28U+IwkMF6XgNYzaA27FTho4qIV?=
 =?us-ascii?Q?zRSlkG0hbMYUILm/46JQi0hy2/EUi0ZXeqls?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lJxEiFtqHF09xaTjbVv4oBz3fgUfTmvOXEKwhXFOdAEQWa20CuJslCcnJDF0?=
 =?us-ascii?Q?WHri9wpOGDbHZwAcrkiyct1grAK0u2NaJV4awWBPChB0SM0INKwaJSWFES7B?=
 =?us-ascii?Q?l+f0mQAV3pDfSOrYiWeXSg7ILL5PjNX9/vfDxMpuvuNMnjrCSwtPrGkXe6K7?=
 =?us-ascii?Q?iIOhpSMFcH+1OASoXtX4YLyOz3AKU1FayhwdzowBt+2ad4BNqaxJsVr9JuOF?=
 =?us-ascii?Q?sS9ocR0LYkQQK8j3DJhWAHGvyGSOtotGfsSBUrI0GVsfoIzYRMDwVdLshLT0?=
 =?us-ascii?Q?vqkaV8jBRRnWhUFxNbOLyr1W4bU0vFsFrh3xwH2rZaVos/W8KcsWoqL+lMVN?=
 =?us-ascii?Q?2FNO0ZkcTcnpFnKgcmKEuzP7ew6w7/+RnH6ho/m9T9W1ZCGkocE4X1o2bfv8?=
 =?us-ascii?Q?LypllZMHcrqRQhYsi+Y6X0/SU6/ifAgrODdPeYClhFyaMgyqR0EE06Q+C4SG?=
 =?us-ascii?Q?rE9Cd7IXoYfItB125iaFHBR4fNhpXtBcLMXIh3KPXq+2sNyowx9i2ZlOtkfE?=
 =?us-ascii?Q?D0/jIuR3nmzJZRPMkBMOQY4upj1DYYAgvQiCK3NRcoxTP431cCmBL/OhamEI?=
 =?us-ascii?Q?Ocy95QD3XOn6IWuBMyLVJtQGDOP1HyvfedRxtnM0kX9QRCiLlvHqeV7eQA1s?=
 =?us-ascii?Q?mypGKVL34pZMkiZIQXnLvlWcZdNhnO/pJWNiIDhszROqI1nIEtfMqlzYHBMR?=
 =?us-ascii?Q?/zExukP1Ab9MsKAQX02VP5jThsgIs4P+6diWOOMrYeDtOmBZySE9kqnmJCou?=
 =?us-ascii?Q?zTEttBU8BmGiI07IoyWoZ4LPy5NMe6dUz3Cp9BG+/vfQXUTgEJKqpcZ2+dZa?=
 =?us-ascii?Q?7KUIj8NSPKY3F5AeP8BUqjUvuWHz0iWnwTzjGZQey2R9hlogbhiH/w1EQkSq?=
 =?us-ascii?Q?eBL62GpF+pgYAT545zvLt1Xbyar94E106U+6l/W+lAxXhjHOKe7tYaIXOrNN?=
 =?us-ascii?Q?9uPmzfjqjyYTwW4gjWcBRNJ0/sJ5yCOuVI+6kxpNTzWSJHgRb5l0IMcETKQS?=
 =?us-ascii?Q?ohzkTtGIfs9turAqF+yZXsSxR3LQOJWlztplBV9Ck73rCkw06T6CkpPsDyur?=
 =?us-ascii?Q?arEsPJKg3nqP+QEc5v5b5cTG0hnAOoaU3o6KuLVkJpN++AR2j2xvCAZjENOb?=
 =?us-ascii?Q?TnDmtknU/WPFxz97F51Njt09Icp3vmE6StANFu6ETKe22BlditAhx5QGrJd2?=
 =?us-ascii?Q?vxK804rVOpuqjKVt1P1rHL1GFeTtFXrp08cIp5xrZthKEXBILLYnx0a+gbPT?=
 =?us-ascii?Q?5sIrJs40Kn9elMlfcVsDdQW8xzmUgxbY75Moro5/7Fsz2KS/OQ1b/v7tR3au?=
 =?us-ascii?Q?uAj69x6mscEybZOD6ve5qmbL7zUMEgeEeTZcHeC+Onw80v45XRcPDZb/Y039?=
 =?us-ascii?Q?F4bJRa0IZKQKgi2p3Io1G0hX944glXwFfYi9amlR7MKr4RzTZ+nGdBFf7lFJ?=
 =?us-ascii?Q?4/APKBL7dtToflEDTjU6pUJnqe+ouzRGoFxDILqijCBGuJjJQCfX2cYH9G2c?=
 =?us-ascii?Q?hWfrr9QxDYZ76XkEPj8XPP2UYuOCB5a1J0x/TSeqs4NOfNB5GDZ0GphlGpLV?=
 =?us-ascii?Q?zoD9KPGKdtIMgEEtiSz8r7GYFJT9a/6yplptNfNCAJd4a++e/n5iHjnaKx74?=
 =?us-ascii?Q?W7f40Qw7X2tI/4VI+14gpw8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8154d03-c724-4e7a-42c2-08de278b73bc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:48:23.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8FUgUegozyVSb8Zsa0KLL+fB9//A6tO+u+5zVtO9XNDCOm+4gmaFpVvkyoT03lhcgpAT8Zh5rkVD2u7DNxrzV2OsE9HyZ4M/yQrcHLcN5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEzMSBTYWx0ZWRfX3Tg90U9euq0z
 UHdsWz46PeyF7TLKElqHyyXZYAjuqbud8XjBY3ESYsQGC5U6Nua6UXvqjIO86GFu8igk0XkJA8H
 bbvQkv8w3sEL2htFy8npqV/UkuUjZKKOSp/bhOiCKLAVQvOdkjQtsxIrD5DqgSy5UNVhUibU5aG
 R+le6Aw90HJpN8k3ylFo4+oStxO40IUbkHwlWbVb/5sUfnm9ItYs0yJm/wX7v2aYDgZIVY7ssSR
 C6TZiB572dxb5f29cMOOqKJczqc39oM0Tz8xPidGFoIfi7dPtd37E7nDC07TkNozxxKjginX2eI
 TizH2S5e3BSj4DHKYa3YKv97oxorylN8XoBFeedK+aorCq0We/s3yEkxDqqSEpE2HYsJnVNyXQM
 4WyGCaPp/7uwU6O1VJFPjHFMOsGjuw==
X-Proofpoint-GUID: eWKqetjtRPJFzZUuT5QstCFoylX27Tjk
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691df4dc cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ga3FLTKcI_4KsN0Wi6dT7gQOCQlr-JW7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_05,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 16:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226564

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add `clang-native`, `rust-native'  and `bindgen-cli-native` to `DEPENDS` to support
Rust-based kernel modules or features that require generating Rust FFI bindings using
bindgen during the kernel build process

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


