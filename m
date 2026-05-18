Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDB1CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 16:45:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1733.1779122708518070348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 09:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gjdmlLeK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9598d01d55=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEK0Zi1464491
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=nK2UMlv8dWbUU1yOZTbest
	yaH33oJgiuX7uM+3xp/TU=; b=gjdmlLeKzRAo7O/D1efu4GoWVEAFhidqio7d54
	SA1Wj46//RMhe/p5o+oJ/voWCBSmFqgfkYPu4ZurLsgrZjLeOYeIzPnT7uMQvDLt
	wRuRvlAq0CRYjVBqJFHiIs2mqhQAJS5D7XZR2xf4uYqvmNUMpC15JTCWik5+R/Bh
	zW8bfyWD1ZrfCER9rjmbzdqq43zapRMPAC10oQ0n9m0uc5lnKpOL1tXeJAwJd/Fp
	JGmhjbpdoWuGf/bdcx4TpM9t/PqmLHKuKgOWxudRI3lXTj04g5UM3RIpREsTN2Lt
	0Mi/AOuqXnOOdjCFoO0Ll3n5ENs5HmKEIADXOFyfXysrL0Ig==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3tcj9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 16:45:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsiDZ2JsdE6yCqZlBhUXRoTrYTYoiU0ajQQ/17jj+omR5MdSgRFUta2rsgmRtDQnzn8vbQoH37rcSmqWKLmZo8PZePI4kmg5sVaY3GoFCoa+c9YNztMkHmLmSpRQbgvIJ8hfDrFU/qBP8NNt1rc6BOQxlBCN1ZHNmFWvXjjO2Za6kzz78zVkF7pai0kWbL4qsAKLz6wZJV5vNN/2C6jTkuZx5vfyBDtlFHJf4mxrVJqLQkqwt/LbBgPItlOj3AIC4kEmz6WpIplvrnpvmfqETcwpsQcxzaGHSKFG0kuFLGQOUHsnA1ZTnh898E6ZLfN9TJxw3m2Ykn/UowJE5/87EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK2UMlv8dWbUU1yOZTbestyaH33oJgiuX7uM+3xp/TU=;
 b=JyOzds4+FsCHg8aI52aMCAsV643mNQ68L0DNhcXVX9l4vWaWf4yq/IOZkD5lTiP6JgtzK3vuvbYmYMVdij29BddAUe0z43Zh8AIleOOnOxDbA14UqS1CMqrfdFgidqPMhnXWZZ+m9NUgqUVm4IofnOG0m3iWmdou4Emk9g9E5Ixtd2x0F0mXMe32h4qBbRfOCsEedAjQphCCXU59vXVwQ0FPcSddkx6IrdLB+b/5V0BJp0x79Qn1BHW4C30Yj+aC7NRrJnNZtxDhrAjBJIPGd8KDyAwMqxYHC3dUUSnZuvAxU/yDZ1N/1fw3YXmAkBHe6qtSkTRVJCBpLtFemLzBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DSWPR11MB9954.namprd11.prod.outlook.com (2603:10b6:8:39d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 16:45:05 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 16:45:04 +0000
Content-Type: multipart/alternative;
 boundary="------------tPbO8A80NliyP81QX7V0n0cY"
Message-ID: <5d03c330-ded0-4a40-8f3d-535db5010194@windriver.com>
Date: Mon, 18 May 2026 12:45:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v1] kernel-fit-image: Check signing key files
 based on algorithm
To: jamin_lin@aspeedtech.com,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Adrian Freihofer <adrian.freihofer@gmail.com>,
        Paul Barker <paul@pbarker.dev>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
        Vince Chang <vince_chang@aspeedtech.com>
References: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260515094251.433364-1-jamin_lin@aspeedtech.com>
X-ClientProxiedBy: YT4PR01CA0284.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::12) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DSWPR11MB9954:EE_
X-MS-Office365-Filtering-Correlation-Id: 46265ac9-5bf6-423a-edb4-08deb4fccfef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|13003099007|11063799003|18002099003|56012099003|22082099003|8096899003;
X-Microsoft-Antispam-Message-Info: 
	1mhx6Ijh39KjV8dJWZJy82M1fOGTIkQNGJx7+ko+PSIveA5KMvrZKdiyd8dOnePTYL9NaYwryz2FzfQRBDaZbGxxg07T80DeYb1XmTDl3dqPlmJo4OJrxgIgW7P931UPgaghFhZeC70bsDoLDJcUQ2oD5Wj0T4r4gYJe+hS0Ho+4KXnEejVd11l1xCdqV+3OpcV6BeWSV/i/VCwx7k9MukqNg0ZYsR5PVzujcCzm4y8lXY4URqu5SPZPzJ2wixHOTnyc7FfEcIncZC5WAOLuNJdcqFZJT3/UDc9OfXM5YsRSeYak/XN6KraX4A6UNB7TTaWPYEGqXCBO+U92RCkf7hixfwdlSs0E5DvYq+z348eLPfbXCmxc2MA1qkef/vq++Tplxj2X43zLadzyh3oLNjjgt7DQA150mmnVMRvQNTwbdzcqrriLRIbM0Plm/HhxsRpt/PstGaFQqIi85MZ86t/m9zqeCuGnOsDW5kyP6Ed1fsuCxb3u3aC8bnQb0O25kbG+YR8URTJ3Kg3t2ywXfajDj0tYNqJUahkFvazT8UQLk+ns8GGFApqSg5O/Z7iN35hpSwElnHcadOzdJR4pocmJKrRzCjD1nWvFpU+qP2Ii4epoMNdtyyE7e/QN8WQcBXnk6IthngYtwAhjbDqtAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(13003099007)(11063799003)(18002099003)(56012099003)(22082099003)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDMyQ1BvNmEzSmhZYXA0RW9pQ3VNbHhWblArTFROakw2ZEpzUFAxdklMRDBG?=
 =?utf-8?B?KzRicXY3YmpPK2Z4aFV0U3RBT2k1MkY0cjdyUUFJZjRFVUh4NndNdGJPZkRu?=
 =?utf-8?B?bnppelVFdnZuSmU4Mi9rRGJqMjZjTy9Kd1JKdGpvTkZLSXZXTXBPdzExdDNv?=
 =?utf-8?B?WkRJeWIxbE5nbDFsSksxVDFaakxrVGJXM2tIYklJcFovS3ZRcGRyZlRPczgv?=
 =?utf-8?B?LzBTYjJDalo4RGE2WVA1UFNmbU8zYzlFejFTblo5Sk10NWxHK3hPS2o2Nkdy?=
 =?utf-8?B?UE5RTTlQWUhqbDZKU1plL0x5aGpEb0pnSG5veVF3MkxZN3U4elVBZjZKU1ZS?=
 =?utf-8?B?RWhrTTJ3UzMrRFNvNVJIYU9SVVovdExLQmJxZEdkNDFnNTl2TjB4L0lsZitW?=
 =?utf-8?B?S2Zjd041S0gvNmVkOVFnZ0VlTTRJWUswbFh1T3JRcG9neVByQ0NEWWV4UDZz?=
 =?utf-8?B?OEFFenNKTi9hUy9NcUNXTXJKVll3c0JQSk1kZ3pNZmZaUkMweEhVZXgwbUg2?=
 =?utf-8?B?RHVGcGpOZ1hpYUJHcWJzN1Exa2RNenNBUlJZNEhWK1UvZ012c0p6WGtlL0xN?=
 =?utf-8?B?d2FaMURNd01LcmxxSjh2bzBpOFZwQVk2SktyeDZQdzJyMVc1L0l1S0lKTnor?=
 =?utf-8?B?cGgrNmtYc2FraHpBbTZnTXpKSWlxd3o5YWRHc202bTZVZGhqY1l6Nmc4ZjhD?=
 =?utf-8?B?Wit1aW5lZFNwNkwxYVdPOUVRcEJaZVlZRmJDUUpnSVhPcFI1a1l3TlNHZDhG?=
 =?utf-8?B?a3YvTjdkcUthbnFSR3pEcThIQUFaWGF6bnN5bzVtQmUrSlpRVTVET1Rvb0dX?=
 =?utf-8?B?ek1WRkNoekk5TmdDL3hYTXpTS0ppWWVJcXcwQnNpOUpuU0tja01LU0o1VENI?=
 =?utf-8?B?K3VxbVUxUEhuNUxrSFdPaytXazE4bC9abUxTN3RlZHNQdlM5VTZJZkxaWS9E?=
 =?utf-8?B?VldVUVliRFdWQmJEbWxkc2NJcEVqNXJtcmRycWlWQmk1U0o1TjJXSmlSQmp0?=
 =?utf-8?B?TU82cWIyTW1OS2U4NkRsTTVYYlBxVitnSUltY1FnRUIzMkJSUDJXMG9uQXo4?=
 =?utf-8?B?WXliMlh2UnBuSWJXWkdyaTU2dzlLYlN4M1U1OFVUbldwUjZKRmJiRW5NREtQ?=
 =?utf-8?B?aDZ3Y1hSRys0Sm1zVElNTUR0SkxKTkhyUnZ2OFhUQWZ2dU9HT0pGYzd1Nm8x?=
 =?utf-8?B?TFByaXg1dFhoOXN0L21jQ1R6WUx5WkROZGZkRWNvbEw4Y09DUlJETmhRMzh3?=
 =?utf-8?B?RjJhVXRvK3N1bDBsR3d0anQ4SkR4cFlpN09vRW8wREFZb29lUjNuYmVUSmJT?=
 =?utf-8?B?akNaaCs0V3BlMSthY05URjdKQ1hUNklwRWJsTFRuM0llbk5kcUpjZnRNVVpC?=
 =?utf-8?B?d3BMYnd0bnhlRmdtLzNia2VNQksrVUlaelJjWHJYZ3N0T0lNYyt3YWxDZ2tX?=
 =?utf-8?B?WUdsQnlOUkIwR2xRbmZVNWhlSTE5RWIrRWxzM25za0R6cTRsM3p5L2g3Zkpz?=
 =?utf-8?B?WXRESzlpblJaQlJMbG80R3BNSXhQOWJjcjEzS0JWR3poYlk5ZFVIRzQxVHc4?=
 =?utf-8?B?VEhtc1drOEdGOWVPeHp1TnZ2VVZpUStoNzIyQXlnZjQyNE54OXRBTmYvL3kv?=
 =?utf-8?B?VERoOUNrbUlpMWRIVkdnL0xBWFk5REkycm15VjNEUXZRQjFjY0wzeVY1YWl5?=
 =?utf-8?B?d1FkSStTVUJpMVZUS3hxQmpCeTRwMCtOQmFlNFJ2WE5DK1VIT1hLdVp5OXRD?=
 =?utf-8?B?VHhvZFlaOGtseHRBS05Ka3BiRlk1a0lCUzdnR1M3dkpZKzRraWFHL2s3ZG5m?=
 =?utf-8?B?ODcrVVAvS3dOU20ybm8rbElHcDBFWVJnZ3ArTEhkbTUwdVNtb0FjYktZK1ho?=
 =?utf-8?B?NXlObm9Idms3VEVrOHBpazh2WUVGakhmREVvRmd5amZDZmJON1FxZ3hFRkw1?=
 =?utf-8?B?WnErSG1UZVlsNzNOUXpUclFsLzY3bG0xWjdBb042aERzVFMvTzFPUnhua1Ex?=
 =?utf-8?B?NTVxM2JZRUg5Z2VMOVZ2ME9VajZxZ0d6WDdDclllSkU0dFVLSExhaXczRnBu?=
 =?utf-8?B?WkNUUnVsSVNyUnBBT2xHTitvMXVZdkJxWkFqZmlaODRxYkVJNFFtVDEweFFo?=
 =?utf-8?B?QnlXME5VYjdtYUVRVkVXeXpZMitxdVNPNUFUa1BSMGhIbndpZ3ZpMklMU1ds?=
 =?utf-8?B?TGpxSlRRVXRUZEFQTHAwTG5zNXRQWERnTVJHbFgzUktJV2JQWXRqbDhjdWh0?=
 =?utf-8?B?cDVsMm9IVjY1elFPUVJFN1pKSnBUZmNSTzB2TFF2ZTZEK0tPWG1neGJWMHE2?=
 =?utf-8?B?QjM5UFZWbE96QXNIQ1UzVk1sOVV0NnBlTUJaSGkrdGNyVHRicVpFUmJLOUZL?=
 =?utf-8?Q?Vs1jpMq+HYPQj1zU=3D?=
X-Exchange-RoutingPolicyChecked: 
	kIP51F0bFRkwDbt2cTTy/kwfEkiL+aJC6Kkq2MfwjeAa9qXH/sagHAAF1fj/bwA2RmFgIYRvCHLTjxT4FSk332x3v7DFk9l7GgiD/k4icuXnFG3s8wY0MxnkQFlUGvmSs22r0nDTfxFkGFzM1XavRX5zxasmgDSPIRUy0vmGViSO7ib32WbDtLi4Htgd1Nywu+hvz7uWKgkFxjaXBMySBy3QquJOCbYLfLJl4ubla5TuR+2iKuySWhTlBnqukeT1gwIhbqMY7aMfmcYX615TezrNOe0wMxwovlkxVqXZvHL69r6/2WP3kx7VvXBZ28tlhhAJvMKEm5Sao5+n4csEQA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46265ac9-5bf6-423a-edb4-08deb4fccfef
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 16:45:04.8228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bb6oerrkqIrRUdV2votdaQcKHUm1OrL71dPsHuMJUMqTdSFWUmTJa0RsfM3Wb/rPPDq4TY6a3gJDMpWi4V1chvUQqeGWYYKZKWE7RgUCDcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9954
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 5fGpmedBrD2ppz7Cvkcv118jOdUPFEmj
X-Proofpoint-ORIG-GUID: emsoivVzSomaOCF_IykyJgbDdRBnaA9g
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0b4213 cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=V2NxCb60AAAA:8 a=t7CeM3EgAAAA:8 a=s9nPqgrB4uHNebHeMVEA:9 a=QEXdDO2ut3YA:10
 a=OCKoweWkqSq2xHcYslgA:9 a=uhuHXnlJ1MyIrIgm:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=3L6qF29SlnrayQqPM2jZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NCBTYWx0ZWRfX/4xuIN2uayGh
 7CNzrCRm8uLGsF84lxSJeu9HdiFK4+H/WDSKBDjsj9rz+WE+iRqfl2AwgbIbIpYlvH4prDszd5K
 1efuW6s6wUyxKIbae2GT9ICHFDnd5FHS88habGQV4SQPd7xUFCxPViHTt+56Ta2inS1MhHUZebP
 Gh5GWQk+x8UmAinAhjJTlbHQR8JWE+hmOT+mnHz+L0dAxivZ2GvZu6DaQ7p+onnKiHfTRLbX0N7
 v0dqHnTH0lNYeHIzGPhzAv7bGwsuT3C08omHZ2bY2csy0MBR3PL6/WSWRisdNI/GWCngxdLOgzF
 QQalB5tgnCfZ5kSJjjolT6U9CmOg8o3ZUP57E+GQiDYTvyilmausI22+40kzZnbFYcSBddOeABr
 EfBwLQsq1SGfnI9eQvnwU6P3wg5I1PpTBizMX5tcUiqbOPc190hKSTPA3XPr5I6UDDNSaXPmyG3
 YcWbvXv6tFydECfBX9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 16:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237252

--------------tPbO8A80NliyP81QX7V0n0cY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Adrian,

Can you review this patch please ?
You were nominated in the patch review meeting.

Thanks,
../Randy

On 2026-05-15 05:42, Jamin Lin via lists.openembedded.org wrote:
> The key file validation in run_mkimage_sign() unconditionally required
> .key and .crt regardless of the signing algorithm. This prevented ECDSA
> signing which uses a single .pem file.
>
> Extract the check into _check_sign_key_files() and detect the algorithm
> from the algo string (e.g. "sha256,ecdsa384") by scanning all
> comma-separated parts so field order does not matter:
> - ECDSA: requires <keyname>.pem
> - RSA  : requires <keyname>.key and <keyname>.crt
>
> Signed-off-by: Jamin Lin<jamin_lin@aspeedtech.com>
> ---
>   meta/lib/oe/fitimage.py | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index 881d0eae0a..e6ff66ca43 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -574,6 +574,18 @@ class ItsNodeRootKernel(ItsNode):
>           except subprocess.CalledProcessError as e:
>               bb.fatal(f"Command '{' '.join(cmd)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\nitsflile: {os.path.abspath(itsfile)}")
>   
> +    def _check_sign_key_files(self, key_path, algo):
> +        """Check signing key files: ECDSA needs .pem, RSA needs .key + .crt."""
> +        algo_parts = [p.strip().lower() for p in algo.split(',')]
> +        is_ecdsa = any(p.startswith('ecdsa') for p in algo_parts)
> +
> +        if is_ecdsa:
> +            if not os.path.exists(key_path + '.pem'):
> +                bb.fatal("ECDSA signing requires '%s.pem'" % key_path)
> +        else:
> +            if not os.path.exists(key_path + '.key') or not os.path.exists(key_path + '.crt'):
> +                bb.fatal("%s.key or .crt does not exist" % key_path)
> +
>       def run_mkimage_sign(self, fitfile):
>           if not self._sign_enable:
>               bb.debug(1, "FIT image signing is disabled. Skipping signing.") @@ -581,12 +593,10 @@ class ItsNodeRootKernel(ItsNode): # Some 
> sanity checks because mkimage exits with 0 also without needed keys 
> sign_key_path = os.path.join(self._sign_keydir, 
> self._sign_keyname_conf) - if not os.path.exists(sign_key_path + 
> '.key') or not os.path.exists(sign_key_path + '.crt'): - bb.fatal("%s.key or .crt does not exist" % sign_key_path)
> +        self._check_sign_key_files(sign_key_path, self._sign_algo)
>           if self._sign_individual:
>               sign_key_img_path = os.path.join(self._sign_keydir, self._sign_keyname_img)
> -            if not os.path.exists(sign_key_img_path + '.key') or not os.path.exists(sign_key_img_path + '.crt'):
> -                bb.fatal("%s.key or .crt does not exist" % sign_key_img_path)
> +            self._check_sign_key_files(sign_key_img_path, self._sign_algo)
>   
>           cmd = [
>               self._mkimage_sign,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237076):https://lists.openembedded.org/g/openembedded-core/message/237076
> Mute This Topic:https://lists.openembedded.org/mt/119327152/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------tPbO8A80NliyP81QX7V0n0cY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">Adrian,&nbsp;<br>
      <br>
      Can you review this patch please ?<br>
      You were nominated in the patch review meeting.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Thanks,</div>
    <div class="moz-cite-prefix">../Randy</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2026-05-15 05:42, Jamin Lin via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260515094251.433364-1-jamin_lin@aspeedtech.com">
      <pre wrap="" class="moz-quote-pre">The key file validation in run_mkimage_sign() unconditionally required
.key and .crt regardless of the signing algorithm. This prevented ECDSA
signing which uses a single .pem file.

Extract the check into _check_sign_key_files() and detect the algorithm
from the algo string (e.g. &quot;sha256,ecdsa384&quot;) by scanning all
comma-separated parts so field order does not matter:
- ECDSA: requires &lt;keyname&gt;.pem
- RSA  : requires &lt;keyname&gt;.key and &lt;keyname&gt;.crt

Signed-off-by: Jamin Lin <a class="moz-txt-link-rfc2396E" href="mailto:jamin_lin@aspeedtech.com">&lt;jamin_lin@aspeedtech.com&gt;</a>
---
 meta/lib/oe/fitimage.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 881d0eae0a..e6ff66ca43 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -574,6 +574,18 @@ class ItsNodeRootKernel(ItsNode):
         except subprocess.CalledProcessError as e:
             bb.fatal(f&quot;Command '{' '.join(cmd)}' failed with return code {e.returncode}\nstdout: {e.stdout.decode()}\nstderr: {e.stderr.decode()}\nitsflile: {os.path.abspath(itsfile)}&quot;)
 
+    def _check_sign_key_files(self, key_path, algo):
+        &quot;&quot;&quot;Check signing key files: ECDSA needs .pem, RSA needs .key + .crt.&quot;&quot;&quot;
+        algo_parts = [p.strip().lower() for p in algo.split(',')]
+        is_ecdsa = any(p.startswith('ecdsa') for p in algo_parts)
+
+        if is_ecdsa:
+            if not os.path.exists(key_path + '.pem'):
+                bb.fatal(&quot;ECDSA signing requires '%s.pem'&quot; % key_path)
+        else:
+            if not os.path.exists(key_path + '.key') or not os.path.exists(key_path + '.crt'):
+                bb.fatal(&quot;%s.key or .crt does not exist&quot; % key_path)
+
     def run_mkimage_sign(self, fitfile):
         if not self._sign_enable:
             bb.debug(1, &quot;FIT image signing is disabled. Skipping signing.<a class="moz-txt-link-rfc2396E" href="mailto:)@@-581,12+593,10@@classItsNodeRootKernel(ItsNode):#Somesanitychecksbecausemkimageexitswith0alsowithoutneededkeyssign_key_path=os.path.join(self._sign_keydir,self._sign_keyname_conf)-ifnotos.path.exists(sign_key_path+'.key')ornotos.path.exists(sign_key_path+'.crt'):-bb.fatal(">&quot;)
@@ -581,12 +593,10 @@ class ItsNodeRootKernel(ItsNode):
 
         # Some sanity checks because mkimage exits with 0 also without needed keys
         sign_key_path = os.path.join(self._sign_keydir, self._sign_keyname_conf)
-        if not os.path.exists(sign_key_path + '.key') or not os.path.exists(sign_key_path + '.crt'):
-            bb.fatal(&quot;</a>%s.key or .crt does not exist&quot; % sign_key_path)
+        self._check_sign_key_files(sign_key_path, self._sign_algo)
         if self._sign_individual:
             sign_key_img_path = os.path.join(self._sign_keydir, self._sign_keyname_img)
-            if not os.path.exists(sign_key_img_path + '.key') or not os.path.exists(sign_key_img_path + '.crt'):
-                bb.fatal(&quot;%s.key or .crt does not exist&quot; % sign_key_img_path)
+            self._check_sign_key_files(sign_key_img_path, self._sign_algo)
 
         cmd = [
             self._mkimage_sign,
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#237076): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/237076">https://lists.openembedded.org/g/openembedded-core/message/237076</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/119327152/3616765">https://lists.openembedded.org/mt/119327152/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------tPbO8A80NliyP81QX7V0n0cY--

