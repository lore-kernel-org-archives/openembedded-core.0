Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEAECCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 12:43:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8598.1762346617778419538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 04:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h56GQvcM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3404098041=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54AOKg1459459
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Nov 2025 04:43:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=1xRlVNFdC
	pftX+OLMJY4m3Xc/KpKYS8E10mGZMLQn+0=; b=h56GQvcMnhZWp9tgKS0SiiwMW
	wJSRN26fQr8/DN1fbVK/njXS17reGTr/rwLF3iiaQYO15XFclhbm9GfpmfqT0CGP
	ao1/iFoEpgtLPCb5SmgeSbd4NVo2kBuuUrWS0Q/kth8JgYJpyeFNNit8lz7NAdSF
	Mo0N6HePYcoM3RS63zr1X3Dx8kNdhf27ivfuc6WlkIflW26tAoS+UgPwGoeTl0k1
	V/JmnmezDKIkFbVctGYtrijLQlC/ozAyjdEAxVoF2M7s54aA20cLsKeG8TF/dyr/
	oO5mHQYxdY7WdvVBheDXS7w428weYkL1tBpvdHfTcz63PaYsJ7g3ZD63DN1qg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7gfa9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 04:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFYFCRCeUFY9AZXeOeXFVmq5JWS7a54RzYMJ7qWZVZraBMXUEzGBIW65LCLu2OXtYlrNREThriaaR36G2Q/xflD0Hro/tqfN7elcVlynyjLeEY73eQReBDck9yptEFRSm1/28MOLHQBQT9qXNaxeQPERL04L1GZqM3hXXZYDD+OZQX1JMBDA7t0H0xLIoXgeFhCqB107D+LWSx0h/VaKy2nG2c48Oyixpbadya2QjoJuXM8W6kfODR/w88bNBB2KsHKraVCHgX2HUhHj0wWlrIJTLRVExAlbfGLKt3kje2OSJxh2Wws4tINsePRYxAzLFi8z1FiikTzB69yNiwAcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xRlVNFdCpftX+OLMJY4m3Xc/KpKYS8E10mGZMLQn+0=;
 b=bG1nUHWR6e2CtgL1UXZBgoecpiXAh2/5scnM5xieF8kw3uZMQhXvk/cDRG80yxdCQF0ALrBWZfJlp6+9Oa2QjSEvv2DP87xGyOak97TVZdrkCrDoWbAIH1LSdUIYW4029bTXgUElYXi8leyJ22O7dxJsJR5F1l0ZHkP1/Whguj6wR6xJnQ4m8VyFqhrjWtU4IfqcbGZwb6T/mDPBaAScPYHVohZT7MkFQfh6yvBkhdSuMsCTYMQvPzEyQ2n2GP6eigrRO1IIBMATocMti/zp1duSbPBPdNsl2adaOWzWookw8Ehbn8X5viOn7w5dSorVMzB4Ai6PM6BvM69DHOYRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MN2PR11MB4741.namprd11.prod.outlook.com (2603:10b6:208:26a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 12:43:33 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 12:43:33 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] llvm/clang: Upgrade to 21.1.5 release
Date: Wed,  5 Nov 2025 04:43:12 -0800
Message-ID: <20251105124312.3947447-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MN2PR11MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c129e4c-c743-4205-ac75-08de1c68ee14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SHUtBcxf6RUqas5SlRAzW5w3fIlND+MQdfUOfZN+KRLMjF9srfslp3DYI0oV?=
 =?us-ascii?Q?8fH/bGERrsF/KmUTxGzsDm0i//rhlAt8IYmdqOoqyaJiYKIQrQ4D5rijUGw0?=
 =?us-ascii?Q?BEUJDYmjOTaqNtklJeVEq8Obqi+cDqPB4rFWuh69VWnjzATFogPwWZJtLN3H?=
 =?us-ascii?Q?5lwqfsmbYhw1ZejIuotA7dGm0yvnoDZU9KXhUrnBe+KlLw9oFrAYY2/Q5Rhy?=
 =?us-ascii?Q?OhFKSJoJuYsYMlmotLLzpcFCxsa58B6tScD/TfUeTZLHtf4L7Wz/EWb32KHX?=
 =?us-ascii?Q?mvpmdKxjL/naQHmb0qVVvswR2s+GebjPpytpStzjjFTGFIVKb6381VA+xevj?=
 =?us-ascii?Q?iaMgH4ghkV5w7Tb2YaY76EHrOlWCzefycy3+Jpyl2UWO2a39Ac+1F6p9FyXg?=
 =?us-ascii?Q?eM9ZA48nZpWzNoOGxPBVovzezqLvZ2VTJO/JrowVlyNW1DSAqdsZFgHbSKGI?=
 =?us-ascii?Q?Sy6k4rrWbPrJMMJL+d0BxrOZPHoruc4nyg8SzNBihBFoKtEJ47RgXlDtf6+a?=
 =?us-ascii?Q?+rycuooeKHN8/yV4pgPuRgugrkJzdMSJUmVbg4hTaTiTtN45HvSLVeE+8Nvh?=
 =?us-ascii?Q?O0fI7aVYYTkyCMkWWbJYC5vQQiqbmQAfv5Taf4zmlJ53uzW4GZBiIkUX11lu?=
 =?us-ascii?Q?1xGLMp4+icaMksx2BdQuMwXhdTyGtPozFwOxs0hlgJXiHS4Fl3RhPMc57NDD?=
 =?us-ascii?Q?uU8rnShX0TiE6zRxY5EPzfsshaaGgnaDnMTLjSFhUXLz4+7uLKba1Br9NKOV?=
 =?us-ascii?Q?cZKAyPYZJdKv4bjROCBfQGih+cP1lu8aiHeQzSOigxRufGSweIM/gofiY1Ro?=
 =?us-ascii?Q?sEBUcFj7CtWi34Y3rsfzBL/H0VJluzrj30dIDIQegj4tud+4vW4wFt/ow+TT?=
 =?us-ascii?Q?rR4lky+ocjyaTuF3ObELPatXjHQ9Rf7Zc+XfPo6YwrtXBDdhLygf1M5/nlyG?=
 =?us-ascii?Q?8iG9DrTwS0TAwguDDLak9jvJp/guVS21XharD8N6A6Z8DoeKCznwjtDMzqqX?=
 =?us-ascii?Q?uzJd8aV9LBGx55Ap3JZjBM/ibtDsfnM/bumxdsvsKuqsUeE6s/owVLsHiiY2?=
 =?us-ascii?Q?tG0blpG1C5hYok9iMLFMjK4YlGQJrJ8XFIbAW4f+Jfswo1JjC7MsSQq8g2V9?=
 =?us-ascii?Q?/HTO/0ZliK+LfXp6CRUvzXDw9ITEvCcFylyZXQaCbc5Z+ypWnEyayKe73xqd?=
 =?us-ascii?Q?/uMYxlvewzm1dAyizG9OZH2kLDnZ5b89ZRMqjnCaH5VGC0M18Q6Q7gf68TeO?=
 =?us-ascii?Q?ov+Uprot+dtxIIgpfUxKkRfgsdSlnrdIy8uVJ45OGF+DTtGPQpu9EMfTHA83?=
 =?us-ascii?Q?/Aeq1QlQ4CNvOG90fvyI+Du8im+n9KgvX/y25r8WyXyW7thQNiFSZ1NQEAso?=
 =?us-ascii?Q?ACZtPxFLcYP7KOxwIktviwmjRPUDF/+bU04iM3vfqOSLyjl77uMnfbHluUlU?=
 =?us-ascii?Q?e5D8oUXMcbP1+dE5ibMgmXV8UOkH8SUOWhka29epEttbJWjH7gagmvGRwzlS?=
 =?us-ascii?Q?JXixZd0KNIIG7AyCtTY1MiyluCyoscL0gSJ7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zsT/eDghclpVRp58BEYCI88GNv29AbfzJcoVIET0vbFu4Q0ldXHhQsHmOQR0?=
 =?us-ascii?Q?8JIn4qn3meIxYkk/8hZ4+6FVROGimF0J1m3y8uAH6VQap0OfPh7RCUL5mWs4?=
 =?us-ascii?Q?gh7HfyEcCJU/UJbzqvhD9e2+18UY5u9aeqkYK6f7AmfUT2ZTbCwwSgqZJiRE?=
 =?us-ascii?Q?5JKPih+Ib+clBRNRECa/m1vzBOC+FMVZ5tWurvEvdg2L4Ov8TP3Xena6YHO/?=
 =?us-ascii?Q?iEoEy2sG9yLy0LC4iBJ9ds+A1MnUtWiUgGhHI1vp4R7N73GkftPeZeF4EXcH?=
 =?us-ascii?Q?yc+XIroXrOq6ha8poXakjFPKNnPs+6Oiem827WZXVEckci++NA25QhfHQb7+?=
 =?us-ascii?Q?xthE/alNIwv/kJSHFnfwSyfNdND0hfN4KtGyjtHGLeVoe7hg/tIAg4ySKm+l?=
 =?us-ascii?Q?SAd+3IGRev+U+9mM1GVUWG5lP40QWhWiNSer0sVulI7N3FliuEpvSN0GI/zl?=
 =?us-ascii?Q?LLkcFOrGfq60dB81j6B9IO6PngWZnlsBiTTef/zvZRdrjUxpSWclqctHqVyL?=
 =?us-ascii?Q?j6nIhMs/Y84NkZ49/EBtFrEX0FD/z7KD0P03anXJDcSdfktPS9CYeynuTdZS?=
 =?us-ascii?Q?CD3l8fuqlGbY/7CtODMVns2M0aY5jSvK8Tkj62bwPJY0GqVyoe0L1/aWLEDE?=
 =?us-ascii?Q?pMCp2+n90KAuvLVYW/52ZFugfEeiezETmblkQcoWUDIJbZgvsn60RRY/GkW7?=
 =?us-ascii?Q?UzrTlWT4Drle+C8NlQdTWCS8zYtF/BHnROsL71uk3/unwR4LhkqbfqyVXZId?=
 =?us-ascii?Q?FgtbetxmWu27h5J99yea1dd5DTJHCI4eTCKA5TuRjRbhTZh1LYB+7veP4xKu?=
 =?us-ascii?Q?zPvWUf+riwRf3Xlg4XFEYi+QjRg22UjiUTSSspohPssHhtK36HobC6dkZWF7?=
 =?us-ascii?Q?wfZIuz7/c1tQ7y8/NlhLNDaF2oQ3J+UsgO9NOt7s6Bibmma8nGB7Rd6JxIpf?=
 =?us-ascii?Q?YOuRzADQOlNy9K7Gk/Gs1AhVnic9OWZ/k2lyK4CyO2BMqAAJCrNx3HpOWlxR?=
 =?us-ascii?Q?c/CqxtHdiiyvVZu2i5lhyhWwJvOhsFDG1zeINUeDIN/rioAAZGzxyLOaLCt3?=
 =?us-ascii?Q?/tqZu5Bgeyo6A+Zaayt8DpDV4oL1dVUu5TvlIrhWyxvU2KT3pCUPij0jocNX?=
 =?us-ascii?Q?B6zMPplme2inkTD+bKe/9ldbZViPj8IaDBvx1+3YnNkK02Wo1TXBcvEud3Aw?=
 =?us-ascii?Q?2wvNcDUwabLB4wu2kiK7fa9+RgPb5iVT/STuhIopX49TnlfCLT2pjRm6ROt7?=
 =?us-ascii?Q?O42CZROZPrVWm+DF5mOa/e7JUM1LH5fnU4C1ab9+QJ50jeC8vad4yqLNo58Q?=
 =?us-ascii?Q?clKKAYgRmSwbRUsc8lGn7rGWbtK5shX/hGPBbHf2AE4ny31ZMI4jWljgDTkO?=
 =?us-ascii?Q?V7/Ch6X1uGBVho11fuSrTLbqhNMIVjPUcAuMPEXnXssdj1oTXmchMt+SxJ1M?=
 =?us-ascii?Q?DOTb9b6Gylha1wilvmY3KD7vxcIhk74uSWFdEYokC/z+jH5ym/1jhksaxD3k?=
 =?us-ascii?Q?ig6YHwYPPHlhlILF6AyyfNJ8MhnBTCP8HpKrhclqN3zjPPf7/n5WdsdDbPuB?=
 =?us-ascii?Q?Lrclp1JVlJ+qfnzLeZU20mRfJ5v9SpVxX20OD7lIE3DXXpI4NwrHbRjYysjI?=
 =?us-ascii?Q?FQwtRQMcRSsFrt4aL0wsOBI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c129e4c-c743-4205-ac75-08de1c68ee14
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:43:33.1391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMXHJJwjVMyP2lnRmQ47XpFs7JTdv2F8YF3DcVzV8+E8eTCVy8l/xK672JcWhEa4UMngry8gW3PVWCCVZZaGPmENxJJxfjRVisgP84lGtbJwO9k+LUE82jWV/vad9Db5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4741
X-Proofpoint-GUID: m1eVrwMKqtSHZPzfQgNlv9IM53mHnh96
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690b4679 cx=c_pps
 a=espmfoAAVKQgPoIy+vmhGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=RYXynjdlEnl4icuXT74A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: m1eVrwMKqtSHZPzfQgNlv9IM53mHnh96
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5NiBTYWx0ZWRfX4/SxRNVUdWJL
 1Svmprcvjd3tr/DaVDy0sonG0Icw3F6L6bpI17m84MeBE1Ka6b1tGaby2iUYW2zfOx203K3jntI
 5boMdncre2aagr2cMLNRTX2vgxeASSERi8/GjvxZTvExPHXE35epytxx8XJmjt62v73JZ9mINXw
 +ZW5agBOwmqN70X0Q8LcLT0S7UQaxxeEoQFc/5Ap6FyIlwSlxJwRD8BrlVPvNarjsVynwDMW+QG
 6z70qoqb0SDvkF47FN6PwUyN90oqaVlU0FM8g9QIrIFr0nA6Npo+D4fxOD6+E+5Z/RMKsYX4d6t
 yFVeSuRohk2iolHb3I1fmjU2tFPWfEBlCCOHbfd1dX4o9XVd71ahC6aHzrWuLq/yjyJl6NNncQ7
 yQpsTRc4JNQmAqGWq0A1vccNr59EVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 12:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225756

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.4

8e2cd28cd4ba (HEAD, tag: llvmorg-21.1.5) [OpenMP] Fix preprocessor mismatches between include and usages of hwloc (#158349)
df3145bf4239 [clang-shlib] Fix linking libclang-cpp on Haiku (#156401)
6bb6ffef0a5d [LLD][COFF] Fix manifest UAC trustInfo namespace (#165285)
0921531330ad [llvm-objcopy][COFF] Update .symidx values after stripping (#153322)
c346c16f93d5 [BPF] Do not emit names for PTR, CONST, VOLATILE and RESTRICT BTF types (#163174)
11ef7520536c [BPF] Support for `DW_TAG_variant_part` in BTF generation  (#155783)
495a2ab653ae [Hexagon] Add REQUIRES: asserts to test
a2178ebcb02a [Hexagon] Incorrect MIR after "hexinsert" pass (#164021)
04102d998d0e [AArch64][llvm] Relax mandatory features for Armv9.6-A (#163973)
5c802f9eac66 [Clang] Do not warn on UTF-16 -> UTF-32 conversions. (#163927)
e94561caef48 workflows/release-documentation: Allow secrets pass through from calling workflow (#162765)
1600cf040584 [Github] Only look at previous commit for MacOS Premerge (#164483)
cd7d2db5a50c [lld][test] Fix AArch64 build attribute test cleanup
2cdfa9d9383c [X86] Use pseudo instructions to zero registers in `buildClearRegister` (#163358)
9faef12c7209 [sancov] Fix stack-depth tracking to use debug locations (#162428)
45afac62e373 Bump version to 21.1.5

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6902bc0c44..79830ece99 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.4 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.5 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 416258c5d3..f5e3875d2c 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "4"
+PATCH_VER = "5"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 20adbf2610..6aec58d44d 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "a01ad7e5167780c945871d75c0413081d12067607a6de5cf71dc3e8d1a82112c"
+SRC_URI[sha256sum] = "1794be4bf974e99a3fe1da4b2b9b1456c02ae9479c942f365441d8d207bd650c"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


