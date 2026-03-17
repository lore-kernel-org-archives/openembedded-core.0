Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5905DFD707E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 11:16:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73405.1773746164924054386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 04:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CzVawF5Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7536f7b35e=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4fECm1352420
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:16:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ungEaWo7v5/RdUZLBirmzxsbgd/Mi2It7Y67NiZDQTY=; b=
	CzVawF5QK45RRSyqGg0no0a9gr0Nk6TY41etrvjjylA+jNUU/dgKrT+MyaOOkfCX
	ff5P02tLBFHY4QBp7fyVR8PvEExvpZZa64KziPz1xk+LLpDTlX/hUp80Hi02YhHS
	nygpcVv9jGnXBPDwg3Ses4WgHDmQXbvUEN4WEILmkpzUYs0v2KI1t887KAsg6FNZ
	wjqPJqkvXYO76bPfxwqUj+7jEdsx/sMppZQQl1W5qyqph0VvHwl2k7FMSg8Uvsxe
	+uq2K9rh312qpSs1fhY8Mw+CRSn5whJGUs8qB2Nq3L3+d22lJh/QsVKssxSTdMlU
	YCM3w1Pf9R46G8/yd01j+A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010049.outbound.protection.outlook.com [52.101.61.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw76dtx3t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 04:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l47+m+IrhauqQcbbiIUJpnQsdWWR0+vsc/Uj+GU0AuuaOtfM0LwSzMIATyuK3Z0WK8NexCG+1cpQ/kkMFv2AS77+ByuNUrKYWAaNlFE7TXLlgMht/EDQ4JthtltX4oCp5lJ2CQivlFut6L1Bnqim6/iLGozmhAi/4VgclxlKMbf5HdM/7OCRhrUum4XKpBYAnqJTzPDX9ZkHXnAiswizEsukmlELCnFKGQ29nD9Cag9aEUtxDubZzPqolrMsZgPoyRlCZvE1Qv/2M/DZm+clYviOFNC1xHMUf2sb5IF8Ov1+5/Y0wrVdoLYRKqBrVREBIIya54PC0wxFWCDNdI7MjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ungEaWo7v5/RdUZLBirmzxsbgd/Mi2It7Y67NiZDQTY=;
 b=MysCe+AaHs+Dqs5UHygHIIj1aw5ApLhscolq3kGpI4gs+HHmeCnX0GmN6fKNZKQkKnLqjmNvzCpqw2MXPoBD3lJYBzxnq//z9jIDUL6FU1yivfEDcuDZjVXUNk+h5mqcHuGcAWx95itTwt5nGsDCoT9yCe0Ww33FrtJfM7Zg3W2buwiPqdFOKJkK1qTyHu6/EVCM5vmY+N+fkAXSDqLJa4EdjuGu2ibxUM6Eogcw/dhJBTvjrMHHyBZZMA58dFyq+axqUTBtWMF6gklaR/MLKn80k2uWDf3AKZfgR033WIts3oGmodGgTgbYoO1QTQfDvAXqmnRKHwClvE/UfxSmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 by CY8PR11MB7874.namprd11.prod.outlook.com (2603:10b6:930:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 11:16:01 +0000
Received: from IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53]) by IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 11:16:01 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
Subject: [PATCH V6 1/1] gdb: Upgrade 16.3 -> 17.1
Date: Tue, 17 Mar 2026 04:15:37 -0700
Message-ID: <20260317111537.2699962-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260317111537.2699962-1-sunilkumar.dora@windriver.com>
References: <20260317111537.2699962-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To IA0PR11MB7910.namprd11.prod.outlook.com
 (2603:10b6:208:40d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7910:EE_|CY8PR11MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: c39a728d-30d2-4f55-3060-08de84169271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	FR3NLeFepbdiQHjNZUMqCnFjG9Ij++CdsgjaX6Lr9inEhLkVoIRuAi5Y0lz3jnB+pg4Yppy+r/GjMSKQZi6lw5IOSjCVIIsUsS+d6BC4apWCUuvijjDQTy6rQbEo6+ULCAoLJwmmIobsMpp6ZxlAwCtwO0ot2G3XU0fNtZTmJ+CGgTCZQOWQ9UO1Hs26a4fSASUbrvdkrFZxCkoC96sWvac/8hSoGTEh0bTpSUMOyQ1WNq71kIR1+VtubQghTiejeKdM6SB3N3icBAUISvq/x9ZnueHkPiONTeJl3IDYQ7q47Gs23jxwqUl4HfM0zRGwvwWdjSFmS5RiIx2d6EMSij1P+cHIiezEcU6GJKOVhEuVl3KSbLZBXUyegtSOBLQmKJNHnxDTHDWsNe4uCcadRBOIw6EMRIe2+MR6d7wgbosrGDPOh049d3m1cgfeQUR6oiilulSwDjrQ5ylhqmq3LNn9rJKjUudVR8YN6SkodjiLlhyLJPoNLTGekcgNYFdrCM8Idce+p8tJ3e07Q3fVYOUcsFId1Ch3yU8AboDfpUDdH4W37r7TWmo2HKWimXWnaRIuCY7wl1XSmezmctFyLCyiNbPl37OT/m+nNFhVNXR9Axp3q55H9Ejrwo/x38GvK/ehB49ZFPW3czmD8xjIVFg4Fjmg1bx2i7qewW+9jkcG4F7ZirOGTHOx7c6/Rhzu4uZJEv5Srrz9AIqDJPQBGJZCop2MchKjVMTtimZ9a7rZ2Oc8wLBtKM1FFVEMz1T6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hYhHExRdp99TtyCspB3mkY8HqTf+ECl8Np5BP9WKoguMGqEKpsblAsCj78c7?=
 =?us-ascii?Q?3EsUsaywxDiUoVVMxTY9wn3Vkx81a6HtxeepVJxUpoaS3lwXIf8NcQAeNGUv?=
 =?us-ascii?Q?NHXlO/Ut76fd6FIiA059HAGhdVskJ69svdjEUcXSlbwWfNasx9SFQyajNIy0?=
 =?us-ascii?Q?bj1Mz+Gsb9DulepUogBXFteDuJ0BlWOEwdHnASu8KiGBpKJ3iU6YfjuaMi2o?=
 =?us-ascii?Q?lbOWot3Vh+S42VSAsuGRBl1IZy1c0SLQJXDBgdIIGbu6f6+Vr5DdTodc2RPU?=
 =?us-ascii?Q?yJ1hxVjnMosegYV9k9LtHTIkVvdG5GTphOptfzdKaMuS+42g1CGXO2Lm57AZ?=
 =?us-ascii?Q?KqX5tOFwUbIZJnSOOJEyryopFtra9FPVrq6xWUBibHnBmufgIIdxbPiGRFZz?=
 =?us-ascii?Q?PlGGGePsXyZQh1Nt7VXejnnZWuYrGd4YLHRA7lPIunT82Cbff4tDRMyOQ7s3?=
 =?us-ascii?Q?/pPrZe2Me4zLuQND30/VZlWEB4/dur3MQD5p6o2rb3T79BYIGqgo2/eZwxW5?=
 =?us-ascii?Q?d7/8GwQCFLY/CjAQGMqdfkG3tMXWFDSuVa/voST08XF888a9Y+r4JL/uJt/M?=
 =?us-ascii?Q?ds2mg6n3ApNpso0ZJ3XYy/+TgltZEZ0QpTAXqfR6km9n/yOT1EmIIwcRH0Vs?=
 =?us-ascii?Q?BrGfvlMO1cDZbVptXE5aDj76JzmLPzk7nX0HU1xCZz8mGokR9TvKilq6X1R8?=
 =?us-ascii?Q?NT5Niq15Xd/WYemPw+4Es3+xJuE2F/7tmiMizLhQU+Lr4hnAsFZzjYDkluo+?=
 =?us-ascii?Q?gQ5VPp9x5JvvfFP8MABOshmvdxTIOm3J4CkByvC1zp1Ookx6f/osRJda+Gln?=
 =?us-ascii?Q?TYiMQRF8uQ9+izDNsF5c+gDKNKCjnboYPxrwWpbuXWKYYjsMWK34QW4o0SsG?=
 =?us-ascii?Q?jquIShqZUrv6OJS/mknujmxKZ6T8+Ltzy3ctJNUzwjIKcPz3TAeqA4nDspNg?=
 =?us-ascii?Q?0fkJqpn6nizvzSRKw+yQE0heDX1q1YuUoVX3I0HmsBhnvNm48evHZNGEgplb?=
 =?us-ascii?Q?HvSqkDARoLlCXWWWh0incSROBDMyyIyfGMaPZZHLBo2QQGcae/55bWDvz88G?=
 =?us-ascii?Q?843gvz3PNDqNzpW6dLHrTBnLSowx+w2lpKG8vINWKGP3N0++u2ElqtivJzHk?=
 =?us-ascii?Q?BjJy+J7a0D6kEmmTIZ5D+urfwIZkgJ+EUlKJsi2ianw8oj3I9fBFVmz6s5Ea?=
 =?us-ascii?Q?j9kH/Rlr9nHWBJmEtuGJppZ7smvXeOHCWewYq7lRdkERdh3Y/z9hTssS+Iwf?=
 =?us-ascii?Q?h5d2iCKPUTFDrmLLs9dsrq4HCxmU/d6xvPLst74LsbPnTn17GV7cVnU3oaos?=
 =?us-ascii?Q?HA+lOVV37rNKATZGbvd6EigYTcpCfOAQ10iMyFDzsm+VPTb0qFdr9KG8nbCC?=
 =?us-ascii?Q?MYmOSfgplI2yritoS5QD1w8wTrFExouEkhO4f16xGH+X8k8vV2T5/bKSrmPp?=
 =?us-ascii?Q?LEB6hMNiDpNXtVDPWHEV/FjaxyA1xUMQ0qZ2EHaZGuQJDC1X0YNvzmYe+Svp?=
 =?us-ascii?Q?qPhYDpVSinh3vxjKf9kHNqRcJ4yNf0g5eseUSpJDMoG2gsWuPlYIu9VjXqGu?=
 =?us-ascii?Q?n0hftByu3GdlvavcSjPEPox8Inz4bE0tDPR7QYm0QFCsqfcF8cRyoHxNGWDx?=
 =?us-ascii?Q?dD+N3Z/ym/hCjq/Yh1nSJqKqTFITYN+pzXKIK7xzsRJ8o8jGVoqIdBpBBsl4?=
 =?us-ascii?Q?alfbX8AxxaubJZYfLof5e/4apteuuvYTReiamq4H6EBwlNAxD/VePLx88ORM?=
 =?us-ascii?Q?Qlc0TEZJQ0Q4B8QmQHGZhGnauUZ+1Z4=3D?=
X-Exchange-RoutingPolicyChecked: 
	hsSnckn273oO5xoGaNJWcOntx5fGRJXO01wWas8T9ncvdR88KbpsTNl9KDQGxp22L9UOCr6FTFpHibZJ7xUMsvRptcH0+GZLeJFLyXpOiIqFrerSlrzVP5CJ2oeWWYYRuhnc/jId5KrX7qTPau/4hKNt2GWhfQHotJ/d6woYtkiSmVIqoi/Abn71RNnUNABoWFImQ9n6oH9gVgnEpTkK0De4gw0PVICFSpSz7eyoz6fOHMfO0zoscwjKHr+sd9pjkT1tqywblRWV1hSlFumvSokQ6pgbiG+ZRPEXAxaLDljC3tMzlUG1CuKbUbxawNdll9c04UaeBuVKlaYbqxixrw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39a728d-30d2-4f55-3060-08de84169271
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 11:16:01.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkltXFDpFqlBJ1B0eMGWLpFUvfiNtAdo0QKTwOKejQMjUwn4VQb0eIg/NikKipCbXpkIybHv+PzdSW77js0PuW8QQstmswTijiRbRjwDhV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7874
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b937f4 cx=c_pps
 a=Vharl4M+XVTaKge5CdhMZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=CCpqsmhAAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=BcPKCTjPAAAA:8
 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=-_S8qYoIjy4GqIv5iQMA:9
 a=0tv6_NoqfL2jZyt-:21 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=MNXww67FyIVnWKX2fotq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwMCBTYWx0ZWRfX3f0N4ZKohR5A
 G7e93r9pTpqJb1fnMAhqXWbN6AzrXuJW5dDk8vonEPdv5Sh5a/Q65cYPrYLjlIvg1pkWrfFiBUU
 L1CTaQA/N4FvQTjLNHjrA9m9Q7yld7L8SGHurWBe7Sc2ASJKKQZ9DLtpX6BK5aPOf96nbSVbITz
 i0U7jSlsiNB1T5GNwg6ychMSzjT5zZn3lfMlq5+a0Ne5EZQM8e8rbDCGZAoxItLfXsKpQTFxf0F
 0yBrw+kcdU753i/+5y43sJWL6WBOZfi5w4F9/lWMYkm2Wvfz+uVsdb/K+Xs0UCUcz6EpD/mKI7I
 Zfbgr2T5TBIakibA3E/yYW7L4AVp1/d8eXXvzYY2Sine1MLt0+72r7sFX0snM6RX0GNCk+tvVR9
 cALJi2MY2kik8Sie+LxNNVY0Fw+disYyHyrBKXeYnPvC5s4uoOYrBJVHuBjMLna/fstMuSbbhGD
 QdgNw5UcLWbNtslKm2w==
X-Proofpoint-ORIG-GUID: Uu-gx83gU0kXHg5_P7Pz9PgFIlXsdzAc
X-Proofpoint-GUID: Uu-gx83gU0kXHg5_P7Pz9PgFIlXsdzAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 11:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233316

From: Sunil Dora <sunilkumar.dora@windriver.com>

GDB 17.1 includes the following changes and enhancements:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release

 * x86-64 CET shadow stack support
 * Debugging Linux programs that use AArch64 Guarded Control Stacks
 * GDB record feature now supports rv64gc architectures
 * 'info threads' command support for two new options '-stopped' and '-running'
    to limit the list of displayed threads.
 * On Linux and FreeBSD, the addresses shown by the 'info sharedlibrary' command
   are now for the full memory range allocated to the shared library.
 * Linux checkpoints now work with multiple inferiors
 * Improved linker namespace support
 * Warnings and error messages now start with an emoji (warning sign,
   or cross mark) if supported by the host charset. Configurable.
 * Built-in support for TLS on Linux as backup when libthread_db is not
   available. Supported on the x86_64, aarch64, ppc64, s390x, and riscv
   architectures, when compiled with GLIBC or MUSL.
 * New command "set riscv numeric-register-names" to display risc-v
   registers using their numeric names instead of their ABI names.
 * The Alpha target now supports target descriptions.
 * Python API enhancements
 * Support for Python versions older than 3.4 has been removed.

Dropped 0009-Readline-8.3-alpha-release.patch
Added 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
Added 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch

Co-authored-by: Sundeep Kokkonda <Sundeep.Kokkonda@windriver.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   5 +-
 ...-ser-unix-modernize-Linux-custom-bau.patch | 248 ++++++++++++++++++
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------
 ...ux-Fix-build-failure-on-musl-systems.patch | 196 ++++++++++++++
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 7 files changed, 447 insertions(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a36f78fe67..d367486d02 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-Readline-8.3-alpha-release.patch \
+           file://0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch \
+           file://0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch \
            "
-SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
+SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
new file mode 100644
index 0000000000..30d22b21f9
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
@@ -0,0 +1,248 @@
+From 1a77c71303b552140613d49595baebdff1a4716e Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 17 Mar 2026 01:58:55 -0700
+Subject: [PATCH] PR gdb/33747: gdb/ser-unix: modernize Linux custom baud rate
+ support
+
+The Linux custom baud rate implementation previously accessed the
+struct termios members c_ispeed and c_ospeed directly. These fields
+exist in glibc but are not exposed by musl, causing builds to fail on
+musl-based systems.
+
+Update set_custom_baudrate_linux to use a capability-based approach,
+with three distinct code paths:
+
+1) If POSIX cfsetispeed/cfsetospeed accept arbitrary baud rates
+   (HAVE_CFSETSPEED_ARBITRARY), use them to set input and output
+   speeds.
+
+2) Else if Linux termios2 interface is available (TCGETS2/BOTHER),
+   use it to support arbitrary baud rates.
+
+3) Else if legacy struct termios supports c_ispeed/c_ospeed, use
+   the TCGETS/TCSETS fallback (primarily for glibc on older
+   architectures).
+
+4) Otherwise, emit an error indicating that custom baud rates are
+   unsupported on this platform.
+
+This preserves existing behavior on glibc systems while restoring
+build compatibility with musl and other libc implementations.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33747
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/225952.html]
+
+Suggested-by: Kevin Buettner <kevinb@redhat.com>
+Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gdb/config.in    |  6 ++++++
+ gdb/configure    | 52 +++++++++++++++++++++++++++++++++++++++++++++
+ gdb/configure.ac | 22 +++++++++++++++++++
+ gdb/ser-unix.c   | 55 ++++++++++++++++++++++++++++++++++--------------
+ 4 files changed, 119 insertions(+), 16 deletions(-)
+
+diff --git a/gdb/config.in b/gdb/config.in
+index efc3100cb9e..b2469c8dabd 100644
+--- a/gdb/config.in
++++ b/gdb/config.in
+@@ -110,6 +110,9 @@
+    the CoreFoundation framework. */
+ #undef HAVE_CFPREFERENCESCOPYAPPVALUE
+ 
++/* Define if cfsetispeed/cfsetospeed accept arbitrary baud rates */
++#undef HAVE_CFSETSPEED_ARBITRARY
++
+ /* Define if compiling support to gdb compile. */
+ #undef HAVE_COMPILE
+ 
+@@ -517,6 +520,9 @@
+ /* Define to 1 if `st_blocks' is a member of `struct stat'. */
+ #undef HAVE_STRUCT_STAT_ST_BLOCKS
+ 
++/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
++#undef HAVE_STRUCT_TERMIOS_C_OSPEED
++
+ /* Define to 1 if `td_pcb' is a member of `struct thread'. */
+ #undef HAVE_STRUCT_THREAD_TD_PCB
+ 
+diff --git a/gdb/configure b/gdb/configure
+index d0bdba6eb36..8a0e2fa2771 100755
+--- a/gdb/configure
++++ b/gdb/configure
+@@ -27336,6 +27336,58 @@ if test "$ac_res" != no; then :
+ fi
+ 
+ 
++# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates" >&5
++$as_echo_n "checking whether cfsetispeed/cfsetospeed accept arbitrary baud rates... " >&6; }
++if ${gdb_cv_cfsetspeed_arbitrary+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++#include <termios.h>
++int
++main ()
++{
++
++       #if B9600 != 9600
++       #error B-constants are not numeric symbols
++       #endif
++
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  gdb_cv_cfsetspeed_arbitrary=yes
++else
++  gdb_cv_cfsetspeed_arbitrary=no
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_cfsetspeed_arbitrary" >&5
++$as_echo "$gdb_cv_cfsetspeed_arbitrary" >&6; }
++
++if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
++
++$as_echo "#define HAVE_CFSETSPEED_ARBITRARY 1" >>confdefs.h
++
++fi
++
++# Check for members required by the legacy Linux custom baud rate path.
++ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
++"
++if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
++_ACEOF
++
++
++fi
++
++
+ 
+ 
+ # Check whether --with-jit-reader-dir was given.
+diff --git a/gdb/configure.ac b/gdb/configure.ac
+index 52924106bca..26e8d1ee276 100644
+--- a/gdb/configure.ac
++++ b/gdb/configure.ac
+@@ -733,6 +733,28 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
+ 
+ AC_SEARCH_LIBS(dlopen, dl)
+ 
++# Check whether cfsetispeed/cfsetospeed accept arbitrary baud rates.
++AC_CACHE_CHECK([whether cfsetispeed/cfsetospeed accept arbitrary baud rates],
++  [gdb_cv_cfsetspeed_arbitrary], [
++  AC_COMPILE_IFELSE(
++    [AC_LANG_PROGRAM([[#include <termios.h>]],
++      [[
++       #if B9600 != 9600
++       #error B-constants are not numeric symbols
++       #endif
++      ]])],
++    [gdb_cv_cfsetspeed_arbitrary=yes],
++    [gdb_cv_cfsetspeed_arbitrary=no])
++])
++
++if test "$gdb_cv_cfsetspeed_arbitrary" = yes; then
++  AC_DEFINE([HAVE_CFSETSPEED_ARBITRARY], [1],
++           [Define if cfsetispeed/cfsetospeed accept arbitrary baud rates])
++fi
++
++# Check for members required by the legacy Linux custom baud rate path.
++AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
++
+ GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
+                 [directory to load the JIT readers from],
+                 [${libdir}/gdb])
+diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
+index 6f2766518be..fbd73970dbb 100644
+--- a/gdb/ser-unix.c
++++ b/gdb/ser-unix.c
+@@ -508,36 +508,59 @@ set_baudcode_baudrate (struct serial *scb, int baud_code)
+ 
+ #if HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(BOTHER)
+ 
+-/* Set a custom baud rate using the termios BOTHER.  */
++/* Set a custom baud rate.
++
++   Prefer the POSIX cfsetispeed/cfsetospeed interface when it accepts
++   arbitrary baud rates.  Otherwise fall back to Linux-specific termios2
++   (BOTHER) or legacy termios interfaces.  */
+ 
+ static void
+ set_custom_baudrate_linux (int fd, int rate)
+ {
+-#ifdef TCGETS2
+-  struct termios2 tio;
+-  const unsigned long req_get = TCGETS2;
+-  const unsigned long req_set = TCSETS2;
+-#else
++#if defined(HAVE_CFSETSPEED_ARBITRARY)
+   struct termios tio;
+-  const unsigned long req_get = TCGETS;
+-  const unsigned long req_set = TCSETS;
+-#endif
++  if (tcgetattr (fd, &tio) < 0)
++    perror_with_name (_("Cannot get current baud rate"));
++
++  cfsetispeed (&tio, rate);
++  cfsetospeed (&tio, rate);
++
++  if (tcsetattr (fd, TCSANOW, &tio) < 0)
++    perror_with_name (_("Cannot set custom baud rate"));
++
++#elif defined(TCGETS2)
++  struct termios2 tio2;
++  if (ioctl (fd, TCGETS2, &tio2) < 0)
++    perror_with_name (_("Cannot get current baud rate"));
++
++  tio2.c_cflag &= ~CBAUD;
++  tio2.c_cflag |= BOTHER;
++  tio2.c_ospeed = rate;
++  tio2.c_cflag &= ~(CBAUD << IBSHIFT);
++  tio2.c_cflag |= BOTHER << IBSHIFT;
++  tio2.c_ispeed = rate;
+ 
+-  if (ioctl (fd, req_get, &tio) < 0)
+-    perror_with_name (_("Can not get current baud rate"));
++  if (ioctl (fd, TCSETS2, &tio2) < 0)
++    perror_with_name (_("Cannot set custom baud rate"));
++
++#elif defined(HAVE_STRUCT_TERMIOS_C_OSPEED)
++  struct termios tio;
++  if (ioctl (fd, TCGETS, &tio) < 0)
++    perror_with_name (_("Cannot get current baud rate"));
+ 
+-  /* Clear the current output baud rate and fill a new value.  */
+   tio.c_cflag &= ~CBAUD;
+   tio.c_cflag |= BOTHER;
+   tio.c_ospeed = rate;
+-
+-  /* Clear the current input baud rate and fill a new value.  */
+   tio.c_cflag &= ~(CBAUD << IBSHIFT);
+   tio.c_cflag |= BOTHER << IBSHIFT;
+   tio.c_ispeed = rate;
+ 
+-  if (ioctl (fd, req_set, &tio) < 0)
+-    perror_with_name (_("Can not set custom baud rate"));
++  if (ioctl (fd, TCSETS, &tio) < 0)
++    perror_with_name (_("Cannot set custom baud rate"));
++
++#else
++  error (_("Custom baud rate not supported on this platform"));
++#endif
+ }
+ 
+ #elif HAVE_CUSTOM_BAUDRATE_SUPPORT && defined(IOSSIOSPEED)
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
deleted file mode 100644
index 206b4baaf0..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 8807681557d9f30aac819186369ee62f4f8d1d96 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 22 Apr 2024 10:41:37 -0400
-Subject: [PATCH] Readline-8.3-alpha release
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/readline.git/commit/tcap.h?h=readline-8.3-testing&id=69e5c5e4c9778bf86c3d1c6b058ddece70854de8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ...ap-Add-function-parameter-prototypes.patch | 37 ++++++++++
- ...d=cef614441f99b7b6e444ba601d8465a6e88f5a98 | 67 +++++++++++++++++++
- readline/readline/tcap.h                      | 14 ++--
- 3 files changed, 111 insertions(+), 7 deletions(-)
- create mode 100644 readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
- create mode 100644 readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-
-diff --git a/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-new file mode 100644
-index 00000000000..f28e31fd0e0
---- /dev/null
-+++ b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-@@ -0,0 +1,37 @@
-+From 0c16af6ebf0bf81138c973e5e6a7c4ebf71f2489 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Wed, 30 Apr 2025 10:41:12 -0700
-+Subject: [PATCH] tcap: Add function parameter prototypes
-+
-+GCC-15 with C23 dilect defaults expects full function signature
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ readline/readline/tcap.h | 14 ++++++--------
-+ 1 file changed, 6 insertions(+), 8 deletions(-)
-+
-+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-+index 859e6ee..2b22ff7 100644
-+--- a/readline/readline/tcap.h
-++++ b/readline/readline/tcap.h
-+@@ -46,14 +46,12 @@ extern char *UP, *BC;
-+ 
-+ extern short ospeed;
-+ 
-+-extern int tgetent ();
-+-extern int tgetflag ();
-+-extern int tgetnum ();
-+-extern char *tgetstr ();
-+-
-+-extern int tputs ();
-+-
-+-extern char *tgoto ();
-++extern int tgetent(char*, const char*);
-++extern int tgetflag(const char*);
-++extern int tgetnum(const char*);
-++extern char *tgetstr(const char*, char**);
-++extern char *tgoto(const char*, int, int);
-++extern int tputs(const char*, int, int (*)(int));
-+ 
-+ #endif /* HAVE_TERMCAP_H */
-+ 
-diff --git a/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98 b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-new file mode 100644
-index 00000000000..02e665b143b
---- /dev/null
-+++ b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-@@ -0,0 +1,67 @@
-+From cef614441f99b7b6e444ba601d8465a6e88f5a98 Mon Sep 17 00:00:00 2001
-+From: Chet Ramey <chet.ramey@case.edu>
-+Date: Sun, 14 Jan 2024 15:19:37 -0500
-+Subject: Readline-8.2 patch 8: add missing function prototypes
-+
-+---
-+ bind.c     | 4 +---
-+ patchlevel | 2 +-
-+ rltty.c    | 3 +--
-+ text.c     | 3 +--
-+ 4 files changed, 4 insertions(+), 8 deletions(-)
-+
-+diff --git a/bind.c b/bind.c
-+index 971116a..2596006 100644
-+--- a/bind.c
-++++ b/bind.c
-+@@ -1167,9 +1167,7 @@ _rl_init_file_error (va_alist)
-+ /* **************************************************************** */
-+ 
-+ static int
-+-parse_comparison_op (s, indp)
-+-     const char *s;
-+-     int *indp;
-++parse_comparison_op (const char *s, int *indp)
-+ {
-+   int i, peekc, op;
-+ 
-+diff --git a/patchlevel b/patchlevel
-+index e340b58..6c10f12 100644
-+--- a/patchlevel
-++++ b/patchlevel
-+@@ -1,3 +1,3 @@
-+ # Do not edit -- exists only for use by patch
-+ 
-+-7
-++8
-+diff --git a/rltty.c b/rltty.c
-+index 882a3d4..a4863ac 100644
-+--- a/rltty.c
-++++ b/rltty.c
-+@@ -80,8 +80,7 @@ static int ksrflow;
-+ /* Dummy call to force a backgrounded readline to stop before it tries
-+    to get the tty settings. */
-+ static void
-+-set_winsize (tty)
-+-     int tty;
-++set_winsize (int tty)
-+ {
-+ #if defined (TIOCGWINSZ)
-+   struct winsize w;
-+diff --git a/text.c b/text.c
-+index 91c3f33..30fdaa1 100644
-+--- a/text.c
-++++ b/text.c
-+@@ -1764,8 +1764,7 @@ _rl_char_search (int count, int fdir, int bdir)
-+ 
-+ #if defined (READLINE_CALLBACKS)
-+ static int
-+-_rl_char_search_callback (data)
-+-     _rl_callback_generic_arg *data;
-++_rl_char_search_callback (_rl_callback_generic_arg *data)
-+ {
-+   _rl_callback_func = 0;
-+   _rl_want_redisplay = 1;
-+-- 
-+cgit v1.1
-+
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..467ea60e903 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -1,6 +1,6 @@
- /* tcap.h -- termcap library functions and variables. */
- 
--/* Copyright (C) 1996-2015 Free Software Foundation, Inc.
-+/* Copyright (C) 1996-2015,2023 Free Software Foundation, Inc.
- 
-    This file is part of the GNU Readline Library (Readline), a library
-    for reading lines of text with interactive input and history editing.      
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *, const char *);
-+extern int tgetflag (const char *);
-+extern int tgetnum (const char *);
-+extern char *tgetstr (const char *, char **);
- 
--extern int tputs ();
-+extern int tputs (const char *, int, int (*)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *, int, int);
- 
- #endif /* HAVE_TERMCAP_H */
- 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
new file mode 100644
index 0000000000..2d91a351d2
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
@@ -0,0 +1,196 @@
+From 654223c799910837c80d0964a971fbdf7808864a Mon Sep 17 00:00:00 2001
+From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
+Date: Tue, 17 Mar 2026 02:24:48 -0700
+Subject: [PATCH] GDB: aarch64-linux: Fix build failure on musl systems
+
+(cherry picked from commit 02090062127d59978ccc312dabf63c6ea838cd85)
+
+When building against musl (e.g. on Alpine Linux), the following error
+happens:
+
+    CXX    linux-aarch64-low.o
+  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:42:
+  /home/bauermann/src/binutils-gdb/gdbserver/../gdb/arch/aarch64-gcs-linux.h:35:8: error: redefinition of 'struct user_gcs'
+     35 | struct user_gcs
+        |        ^~~~~~~~
+  In file included from /home/bauermann/src/binutils-gdb/gdbserver/linux-aarch64-low.cc:35:
+  /usr/include/asm/ptrace.h:329:8: note: previous definition of 'struct user_gcs'
+    329 | struct user_gcs {
+        |        ^~~~~~~~
+  make[2]: *** [Makefile:565: linux-aarch64-low.o] Error 1
+
+aarch64-linux-tdep.c fails to build in the same way.  This happens because
+aarch64-gcs-linux.h uses GCS_MAGIC to see whether the system headers
+have GCS-related definitions.  The problem is that GCS_MAGIC is defined in
+<asm/sigcontext.h> while struct gcs_user is defined in <asm/ptrace.h>.
+It's fine on glibc systems because in the set of system headers that
+linux-aarch64-low.cc and aarch64-linux-tdep.c include, <asm/sigcontext.h>
+ends up being included implicitly as well.  This doesn't happen when using
+musl's headers though.
+
+There isn't a macro in <asm/ptrace.h> whose presence is correlated with
+the presence of the struct user_gcs definition, so a configure check is
+needed to detect it and conditionally define the struct.
+
+Also, this change requires aarch64-linux-tdep.c to stop using
+struct user_gcs because target-dependent code can't include <asm/ptrace.h>
+and thus even if HAVE_STRUCT_USER_GCS is set, the file won't have the
+struct definition available. To fix this problem, also backport the
+definition of AARCH64_LINUX_SIZEOF_GCS_REGSET and use it there.
+
+Note that there's another build issue with musl, described in
+PR gdb/33747 affecting compilation of gdb/ser-unix.c.  In order to be
+able to test this patch, I applied the patch in comment 11 there.
+
+Tested with a native build on an Alpine Linux aarch64 system, and also
+verified that all gdb.arch/aarch64-gcs*.exp tests pass on it.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=33926
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/gdb-patches/2026-March/226049.html]
+
+Co-authored-by: Chris Packham <judge.packham@gmail.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gdb/aarch64-linux-tdep.c     |  5 +++--
+ gdb/arch/aarch64-gcs-linux.h |  8 +++++---
+ gdbsupport/config.in         |  3 +++
+ gdbsupport/configure         | 36 ++++++++++++++++++++++++++++++++++++
+ gdbsupport/configure.ac      | 19 +++++++++++++++++++
+ 5 files changed, 66 insertions(+), 5 deletions(-)
+
+diff --git a/gdb/aarch64-linux-tdep.c b/gdb/aarch64-linux-tdep.c
+index 76bde85188b..6c402e7ecdd 100644
+--- a/gdb/aarch64-linux-tdep.c
++++ b/gdb/aarch64-linux-tdep.c
+@@ -1684,8 +1684,9 @@ aarch64_linux_iterate_over_regset_sections (struct gdbarch *gdbarch,
+ 	  gcs_regmap, regcache_supply_regset, regcache_collect_regset
+ 	};
+ 
+-      cb (".reg-aarch-gcs", sizeof (user_gcs), sizeof (user_gcs),
+-	  &aarch64_linux_gcs_regset, "GCS registers", cb_data);
++      cb (".reg-aarch-gcs", AARCH64_LINUX_SIZEOF_GCS_REGSET,
++	  AARCH64_LINUX_SIZEOF_GCS_REGSET, &aarch64_linux_gcs_regset,
++	  "GCS registers", cb_data);
+     }
+ }
+ 
+diff --git a/gdb/arch/aarch64-gcs-linux.h b/gdb/arch/aarch64-gcs-linux.h
+index 018ca37a522..632823a8120 100644
+--- a/gdb/arch/aarch64-gcs-linux.h
++++ b/gdb/arch/aarch64-gcs-linux.h
+@@ -27,8 +27,7 @@
+ #define HWCAP_GCS (1ULL << 32)
+ #endif
+ 
+-/* Make sure we only define these if the kernel header doesn't.  */
+-#ifndef GCS_MAGIC
++#ifndef HAVE_STRUCT_USER_GCS
+ 
+ /* GCS state (NT_ARM_GCS).  */
+ 
+@@ -39,6 +38,9 @@ struct user_gcs
+   uint64_t gcspr_el0;
+ };
+ 
+-#endif /* GCS_MAGIC */
++#endif /* HAVE_STRUCT_USER_GCS */
++
++/* The GCS regset consists of 3 64-bit registers.  */
++#define AARCH64_LINUX_SIZEOF_GCS_REGSET (3 * 8)
+ 
+ #endif /* GDB_ARCH_AARCH64_GCS_LINUX_H */
+diff --git a/gdbsupport/config.in b/gdbsupport/config.in
+index 0beacf22c05..2957ee0f030 100644
+--- a/gdbsupport/config.in
++++ b/gdbsupport/config.in
+@@ -271,6 +271,9 @@
+ /* Define to 1 if `st_blocks' is a member of `struct stat'. */
+ #undef HAVE_STRUCT_STAT_ST_BLOCKS
+ 
++/* Define to 1 if your system has struct user_gcs. */
++#undef HAVE_STRUCT_USER_GCS
++
+ /* Define to 1 if you have the <sys/param.h> header file. */
+ #undef HAVE_SYS_PARAM_H
+ 
+diff --git a/gdbsupport/configure b/gdbsupport/configure
+index 133ddfa7f6c..66135791aa5 100755
+--- a/gdbsupport/configure
++++ b/gdbsupport/configure
+@@ -14307,6 +14307,42 @@ ac_compiler_gnu=$ac_cv_c_compiler_gnu
+ 
+ 
+ 
++# Check for `struct user_gcs`
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for struct user_gcs" >&5
++$as_echo_n "checking for struct user_gcs... " >&6; }
++if ${gdb_cv_struct_user_gcs+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++#include <sys/ptrace.h>
++	 #include <asm/ptrace.h>
++int
++main ()
++{
++struct user_gcs u;
++
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_compile "$LINENO"; then :
++  gdb_cv_struct_user_gcs=yes
++else
++  gdb_cv_struct_user_gcs=no
++
++fi
++rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
++
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $gdb_cv_struct_user_gcs" >&5
++$as_echo "$gdb_cv_struct_user_gcs" >&6; }
++if test "$gdb_cv_struct_user_gcs" = yes; then
++
++$as_echo "#define HAVE_STRUCT_USER_GCS 1" >>confdefs.h
++
++fi
++
+ # Set the 'development' global.
+ . $srcdir/../bfd/development.sh
+ 
+diff --git a/gdbsupport/configure.ac b/gdbsupport/configure.ac
+index b7ccfabd6c6..d3b4c05daeb 100644
+--- a/gdbsupport/configure.ac
++++ b/gdbsupport/configure.ac
+@@ -68,6 +68,25 @@ GDB_AC_PTRACE
+ AM_GDB_COMPILER_TYPE
+ AM_GDB_WARNINGS
+ 
++# Check for `struct user_gcs`
++AC_CACHE_CHECK(
++  [for struct user_gcs],
++  [gdb_cv_struct_user_gcs],
++  [AC_COMPILE_IFELSE(
++     [AC_LANG_PROGRAM(
++	[#include <sys/ptrace.h>
++	 #include <asm/ptrace.h>],
++	[struct user_gcs u;]
++      )],
++     [gdb_cv_struct_user_gcs=yes],
++     [gdb_cv_struct_user_gcs=no]
++  )]
++)
++if test "$gdb_cv_struct_user_gcs" = yes; then
++  AC_DEFINE(HAVE_STRUCT_USER_GCS, 1,
++	    [Define to 1 if your system has struct user_gcs.])
++fi
++
+ # Set the 'development' global.
+ . $srcdir/../bfd/development.sh
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gdb/gdb_16.3.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.3.bb
rename to meta/recipes-devtools/gdb/gdb_17.1.bb
-- 
2.49.0


