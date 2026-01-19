Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C43CCF2DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:50:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42214.1768848644628405672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=r6aFNi9n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5479d6ff07=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JHOH7Z1727476
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=iovvOyovNk/Ma/3aw6NMoA
	m2ualbjH4S6YPGNfjqpHA=; b=r6aFNi9nw7tAK77pimkqj7c6XK9CKXto7fdSNK
	+AdnzO1NRyXiLYyVkaJGwek40eutGFFSqc6xYzWtTkYjKmXH3B8sGJdVta/BjKjp
	h8SD1CIBm9zm5jeXKjnxCHUhrDDb27NkWB7GMGDAYgPtdPMAlTkWqwu6WYv4vvHJ
	zyLWVAbsgVWJizIzE1/SKFFx4PPEW1/8PjJzNdV35F5sr7gDezt8A2y0apdWdqaP
	vqzoXmGtg8KGCApD9wBs6uUD6SGLAI+jNTLZ2obFlJnutTu/f0OkJAlNfQJBDBMJ
	Nv1bU2RoEF5xvYtQwdftdydCLLkEMXtkoH8gshFrP7CafEnw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqymuj7h0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 18:50:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrXlGbJO0esKoJv6pp6utd7YdyhNp2dz4LUr8/Axv5G4KnXGC13N5TOgvEqMIwOnQcZKS3HxR6qQUg4ngkj1el8olE2cRGS07n9niz9+40IgMjze7bXAIgzt5aI3cPS0CnNyMycPRPCXbtdQ8IycDSeOmtoFtkSM+HYxnXfk4Ww4HtWXHFk8S5bVKT0g0jAMcI4GMJH9SYq07ues2EFNeLulfq/rTFQkThbUewKohD/ay6fR0rVt5L7nyiHHHGserPnLVf+Z0i51eUsbBASkH/tvfbDv4iTX5mKEFptmOd75g2GRNhLM/ZI2eosR4wL3jSnOYwT9Lv5c2FmKG+5jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iovvOyovNk/Ma/3aw6NMoAm2ualbjH4S6YPGNfjqpHA=;
 b=aJqTBBabXAhaoU89wlIFYoxV/I+hLY+mIEfznaAbglY5ZybJMMV+0YoBaBMgNwsk9bdeyfrlB1N0FlntBPsohxG9my6p5twJEtNjAVVAheWp4DYkbByvWidcRkydL9Kx1FiUHjwJMUIzLMtD3CqpqQZu8XVHbv5QvhXfeW2T11reGlBnHaIWLb7trjosOHd89L3rzOUhwqpTKQMbA/PqmP8l+rvU6lBNE1R8r1+dOBpoxbLM8rZJIR+foQKixin8cP93Eb+MhkXgzgDLZh9KPB8eIXaZA3+EvUTSVADjaBtH/4X0l8DB2EUYjlNVvx7H+WojGizg4sAoqK1KfbBhaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 18:50:40 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 18:50:40 +0000
Content-Type: multipart/alternative;
 boundary="------------2KMrCe8fR01EnQE2mQkddCc5"
Message-ID: <d52e2bbb-5a81-4af5-897f-3811e85d8d46@windriver.com>
Date: Mon, 19 Jan 2026 13:50:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] orc: upgrade 0.4.41 -> 0.4.42
To: liuyd.fnst@fujitsu.com
References: <20260114011902.10064-1-liuyd.fnst@fujitsu.com>
Content-Language: en-CA
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260114011902.10064-1-liuyd.fnst@fujitsu.com>
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ1PR11MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: a8aade57-8741-49fe-c925-08de578ba40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NnNRWGN2MjdCblZSaGF6TG1qWmV1dFJURTZDZ2lNVXF3RlN6cHBoRHU2NzNG?=
 =?utf-8?B?SDVYdHh3VnFkd3MxbDJZTlY4clNxYTlpTjl5NTU0MWRhSmxSZlZoQ3N2Nm8z?=
 =?utf-8?B?N2xHZUYvRFhDN2N0UlVDK0I2QUw1SG9hZ0F0STVscjhVYVdMUHNIMjlMbUZ3?=
 =?utf-8?B?dHkvMG5LSEpZcDY5TjF5SGJ4WEJMc3BGdGJMZ1lYUldRcVJ4cnFxQmhsd3B0?=
 =?utf-8?B?N0k2V1VRZDd6TnlUUVZOSmZybldWWlNJRDZVUUZQTWRabDlnbGNFNEx1R1hP?=
 =?utf-8?B?SGVwaGV2ajdLWUw0a0RObFpSMms3c1Z5cDFHNmkraVpXb05leFpXNlVIWmRG?=
 =?utf-8?B?TUhzRXkyZC83NlA2NGpDMGd6QnU2d1ZvMktKU05IZkkxVTZsODRPMHFlTFdy?=
 =?utf-8?B?ZHRyV3FXdmo3a2F5bW1pU1ZoWWdUNlNackVHamtYRWxnWWhsek5vNWNhUEZ6?=
 =?utf-8?B?UktlK3BrM2dUWWdicERGN2d5R3VDM2FSMHFDZDFFOG9sV1pFMUdhd00rNUtX?=
 =?utf-8?B?b2JnNUppdUVyT0doenRGTFN2MmNWMHdzNzJOeGVldVpGeUExOVBEbWFqalVB?=
 =?utf-8?B?T21nQitEZ2YxN2d5N2NYc3l4K0E5OFpxNytrUWk4V3g2TXZ6UkJ6RUZBMElh?=
 =?utf-8?B?VUNuRDFNakFkb3RJN0xTcnhrMWhGK2kvZ3YvWnNPU08rZVFjRjRyMUNhYTVr?=
 =?utf-8?B?WXBUb0h1c1hZTG8vclpYZDE4NDM3SGU0WVlyUTlzcWdUaU9vK0dPait5WEww?=
 =?utf-8?B?Z3VqbERLR3FSS1d1YnVHc0QyRzJiYlVrekwyTmRkc1RabUxnZkJocXlLZldZ?=
 =?utf-8?B?TURscEFDdWl0TU5mSmZOcW9MSS9DbE1KcEo5Zk9acTVmM2lrcDBDdGc0NjRI?=
 =?utf-8?B?OGJBN21ZSjlYcFYxbUdqTTJBTC9PRHg2VThQaUxvaEtxaWlCYyt3SmVhdllo?=
 =?utf-8?B?MnN1WG5Pc1ZQOE1mbU1ERmU5SUNjNXowNzRXc1pmbUUyMXJaWGt6c3VRaVl4?=
 =?utf-8?B?RjRPL21DeTlOR2F1VnBPSlFZb3hXK2twM1FxT0VYc0xPRzVOYWw1WnVZdFFk?=
 =?utf-8?B?N2daa0dYTmhoYWlOKzBUQzZBRC9GNjhZbFRUZGtadm9YSzBSRUFZYThzRjg4?=
 =?utf-8?B?TkR6ZXpiSGtmT2xDV0I0ZXc3RHlRTEVNMUN5OElJMUp4NEgyK1lES0JlbllD?=
 =?utf-8?B?NXRBTFZHcWJRNG43S2xZdzNqOWx6WFgvUHc3NDhWTlpQWHdVcjBSNDg5b1R3?=
 =?utf-8?B?ZkJSeFdUTHlNNzlhNkZvZkdHRkFrekk0NTlrVTdVNzVXQTZpNWpGd3FKOFpG?=
 =?utf-8?B?ZFRIY3I1VUwzcE4wcG1EV0ljSXp1MlNRNkRkN0c1RDZOWWVZTUVMZHJtcTh4?=
 =?utf-8?B?akxlSUpvakRUZzBwbnBMeGdBVlRrWUVpOFN3Ynd1Um53dGlLSkozREtpSW9P?=
 =?utf-8?B?L2hyTDduZWNHUHc3dXBrOG1oeDF4WVQxOTNKNUpSZFE0NitOdHgwOE5yWWtl?=
 =?utf-8?B?RGNlYng3SmNNSmZzQS9Bb1NYTW9LcnNoalpLV29JK1hhR0lScFE0REVzdEt5?=
 =?utf-8?B?OEVlMVg2WTE0WkpBUmZxQ2syS2lvUnZRQXJ0OUkwSEJyNEF1bXZlMEdWOWU4?=
 =?utf-8?B?VFcwMFkxMmdQRVRLUHZMaHYwR2g3bkxYOGczMmFjTGQ4KzhBcWVEcWh1SVRC?=
 =?utf-8?B?OTFuZGVZYjRxQXJiVFFmMHRyOXRLbTRHUVZTcmJuS2c3bW5pWHZROHBlak84?=
 =?utf-8?B?N0pkWncwQ05zK0ZGc3psUFYram5Oa0sxNUM2emJXK3lmemlzeXRBOVZXSWQz?=
 =?utf-8?B?VTB5VXZLamtlVC9aMDBsSUxVUU1idlo0WmdvazQ0RmE2NkhwYTczY1B6Z0FX?=
 =?utf-8?B?QUQzbnBnaUh6Y296UFlqY1phV1FmdEJNS20wb0JQK3RnK1Y5K1BaUVdVVjNT?=
 =?utf-8?B?aUlHcWVYNFhiMStjRDFBU0pQSktvRkFVRVoxY0RKOHY5bFRMZDZLZXQ2Q3Bo?=
 =?utf-8?B?R0NyMmM3UEU3YkFHNGZBdTZzU1Z2ZjFUbHlaRXpPVko5eWs3ZGtpczk3Y3Rn?=
 =?utf-8?Q?8CJ99l?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1hjajBpSmxRblB1bW1iY2cyeHFueGFycU1DNldzRnc2ZUlsZG94bWUzLzkx?=
 =?utf-8?B?a1VicldBaWpYN0dpSDVzY1lybjNTcVB2OGhmL292SjBWTFRveVI4bGhHUlVX?=
 =?utf-8?B?Rkk4R2lPYU4rSTkwbnc0SVE0dERJT2RwSDg1WjNkTEc0aS9SNS84ZGdIU0tV?=
 =?utf-8?B?cktseVlaMnVyUG5DK1pxYVJDekdjNU5WNlFvVVh0UnJLQkY1cnpxR3RuWEhZ?=
 =?utf-8?B?RnRQc0lWWnM0S08rU1NxY0xJMHhOakZXYXZIdEZzL0NOS3dwMStPSGVGazA1?=
 =?utf-8?B?cExYN2krOE5sQ2FiSG04Ym5XNStKL3NXQnlVR1BBL1R1LzVWSXdEYlBISmtQ?=
 =?utf-8?B?WEhWK3hzay9yWDF3aldEd2prZ0xuQUpjQlRjN3pqMFl2ZmlLSDlsTUswVVNu?=
 =?utf-8?B?NFh1YXExVmRBTmlGVVJyRFlRRU1SVnNIZERpUndGN293YnV6L1BKQThUZitv?=
 =?utf-8?B?ajQ1dUJkSHUyVDNzb3hSZVdYUkp4VEQveFFzakQya2lQV1lJbjNFMEVNQlJC?=
 =?utf-8?B?d2txRGs1NHQ0NkhTNHVKd21NeEJrYXZzME9JSTM2M1FsMXBoazN2YUNJcXV5?=
 =?utf-8?B?TmI3SFk2NjU2MFI0dXNTMGJVTm94c1VtbzcwUUlEVmpiMjZGcjI1Wm5sQ3I2?=
 =?utf-8?B?UmRNNWtnek1XQlZKbUFPZDBqTHlhODQzZWU4SWlNeEQ4TFVienRkYXdSbEZh?=
 =?utf-8?B?WGlLOCtVYXB6STZoZC9maGk4MXBOWnFRbnBMSGdXdUNxclFSS0ZnNWZ6VHd1?=
 =?utf-8?B?VE9pVWVlbnl0c1ZlQlNSSlFldjVyb2ZraXVzT0dxVEo3K2xVZC9FRnllUWhj?=
 =?utf-8?B?MWl5NnlodmR1M1RGVnJiTTFDWmJpaysxU2Exa2xYeEg5UHJ2b3d0T09JbVVZ?=
 =?utf-8?B?aVhvN1ljeWZKcGFxR0hqamxFZER6MUMwM1UzNWZFcEdrR0VzbEVBd0hXcytP?=
 =?utf-8?B?QmdFcFEvU1k1MUVOWmI1U1BEai9weHgzaXM4TlFyTFZ5VXJTRW1wZ0J4ZnhT?=
 =?utf-8?B?RFhNVDE2SFhWYS96UVpVKzg1REZyQ2V3a0dzVEhxRmMxZW1NS1A4NHlaa1c2?=
 =?utf-8?B?eThvY2hldTdhYnZiSjg4d3BTK0N0ZFdtb0RhelpwVFh6dFVqd3VCRGhYenpw?=
 =?utf-8?B?NmdPNnF0V0YxZlpOSjdudkRRc1dkdW1GbzYvaHNZY0hlVWhhc3gyVFRNQTE0?=
 =?utf-8?B?MWJOakNlbVZLNkJSSmFQZWFmbHN3VnVHdE8xK0FscDg4bXBUdnJYMWljbHRX?=
 =?utf-8?B?cWlPK0xZN1lZUDQrYXROVWpVdXArN3ZBMjJ0ejJsYWhQVTU4anR4ZjBicHdS?=
 =?utf-8?B?bWF4OE1Xa0NoZC9SMStpaXZhT09SSGRDbUJmTldWK3ZMWUl3Y2Y3NzJvQ3Ni?=
 =?utf-8?B?cEp4QnFJU2kvYnFUdVVXKzhpREdBV1ZlcDR5Qm4xWk1KWWluYlBCY0ZBVlRy?=
 =?utf-8?B?TktsR3ZOd2NvOXhTa0xpNDJOWjdLeUoyY2IyOTByTEQ2Z1JHLzVzMlRNN1dT?=
 =?utf-8?B?RXcxTzZsMWlLN2YvNktreXN6bnVsM1hxbVlraVpHdXRoamFmdjJFZzJPUlQx?=
 =?utf-8?B?NERjQXF1Q21kOHF1NHVFcUFGQ1pPTTltRlBxV2JNT1BkanlTblJaQkxmeXFz?=
 =?utf-8?B?aE9TNmtlSDllZG5hajdqc21aQ3JwQmZER29jejRZRURUR0hGcnRuc3RlVVY5?=
 =?utf-8?B?VVZnMURRVDEreUxZWEhKNFZ6K01BTDBiazdMZ3krNSszY0lkUzQzMU1QOXQ4?=
 =?utf-8?B?TWV3S2dOdzd2OC95SXphNkptOUw2QU1qUFRmeDJWRDRoUjVJZGVpUEkyOGxD?=
 =?utf-8?B?R3FLY05nWURHQXV4akVBQUVVZGRYalc1bFYzcURXT2RpbWJKbGI4MDdmYnMx?=
 =?utf-8?B?NE9Va0lRMGJlZ2RLYmNYOFl2aW1MQ3ZqQWpTQWc5eDNaQU1nYVBPSVlzWC9u?=
 =?utf-8?B?OHZqRk9sY3orREs3ejludVpzdGJxWkwycDd5RFVkTEpKRmxzYU1reEthbkU3?=
 =?utf-8?B?RnE5K3BMQW8rRWMzZ1FnT0liREdGRHF2NkZLWDRhR2ZGQ2g4SitmNjErbExx?=
 =?utf-8?B?K3Rwd2M4Y0o2RGRBcDVPT3RxRHl1Q0xtSTRrSkVMRnlSQ2NBRnB6R0lEMFJ4?=
 =?utf-8?B?NVhmNU1GSkpJWWJjK1A3OXhucE9QK3JJVG9Yc2d4RVVZemRXNzNZNnFMWnY0?=
 =?utf-8?B?SmZ6NnZ2cHlMUVlobUl3dU9RZ1FYTEJuZFJ6akJIeDg4cEwrdUZLWDRkTEUv?=
 =?utf-8?B?WGYvbktnT05LbndEejYwY2JDajB2TkRWYkk3U2RyVjZ3cGNEYnFkMldMcWFw?=
 =?utf-8?B?alZ3SitCN2pnbW1zN2ZZQzc0dmh1aDdna1pWdE9yWVhxQUxCNU8xUEY3blg3?=
 =?utf-8?Q?RG2ASr7id0ZXsEok=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8aade57-8741-49fe-c925-08de578ba40b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 18:50:40.0529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMcyFLhrgvZ0IgHtMpHa5GxUfru30ayczXfx6G3Zsi4tq6pnKdvb4W2fkUUKDnQ5xu8kgnJGv4X2RrjPtChfpg6cgGMaqPJmDgg7EY8uF7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6204
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=AqDjHe9P c=1 sm=1 tr=0 ts=696e7d03 cx=c_pps
 a=Bsy78vmKOeQIAJqgrxlU3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=hF23PusoAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=AxJXhVUQO5BT87wG5zsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dwYwnBzfXyvo5VqISMoA:9 a=IAFXs5LqsFPRiCr1:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=STbmsxK-VnoOrN7PgZM2:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KAI29Gi2sbAo1qS-KteSVqbLVYK44zzA
X-Proofpoint-ORIG-GUID: G5XQsHuL329BCwQ1jhDPKzMdboJUABcW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDE1NyBTYWx0ZWRfX0wEe4FcsMm8f
 5K8PyyU5QdGF0xkGSl9kNPfAmlgVaIi4kZffPoNIsZYXfCfRKrLUPTG+4U6/2HawFYs7ViMKqB2
 std5J0jqqwgnTwqXSv9nPQ4i5qb4Fmu++a3PXwDeZgC23TqqfaSjs1YfR0IjnCFkaogrnZX6Sg6
 Fb0Absb1txdX7UzRO3nas8D3x+Vd0XC8uLIDEwcmGS+ZY1FHcU5GBfYlooXyquSJgnMqy/7rwEY
 6mRITu8hMhZSdhcDSTgztR/CJ1Gy1A9GRpYT3AolnnmRitKDz0cFu5Cb0J1ONoA/ZxPslaCtfEO
 2AQ1FgaR+ySSogOFdUmPwSI/zsIot2zn5kOxsvlF5eKDgC57UHaKxCVZCukCaR5ksePf+g8AZ9f
 gEBcUlOnJKPDmYONN7jMpP8Z59A6PFq+OCKWzifMvVDdpxxzVSqR2XMf7ZwvUFN+A0pfg6yPHD2
 1p+rzt+j2ShakrPWKIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229633

--------------2KMrCe8fR01EnQE2mQkddCc5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60JHOH7Z1727476

On 2026-01-13 8:19 p.m., Yiding Liu (Fujitsu) via lists.openembedded.org=20
wrote:
> 1.Changelog
>   - Initial 64-bit RISC-V support (Maksymilian Knust, Filip Wasil)
>   - Add 64-bit LoongArch support (Jin Bo, Hecai Yuan)
>   - Implement release and reuse of temporary registers for some targets=
 (Jorge Zapata)
>   - x86: Implement EVEX encoding and an opcode validation system (Jorge=
 Zapata)
>   - x86: Opcode refactor, improved constant handling and various other =
fixes (Jorge Zapata)
>   - x86: add missing rounding operands for AVX and SSE (L. E. Segovia)
>   - x86: Implement 64-bit single move constant load (L. E. Segovia)
>   - includes: stop exporting the private compiler and OrcTarget definit=
ions (Jorge Zapata)
>   - Use hotdoc instead of gtk-doc to generate the documentation (Jorge =
Zapata)
>   - ORC_DEBUG_FATAL environment variable allows abort on log messages o=
f a certain level (Carlos Falgueras Garc=C3=ADa)
>   - Error message improvements and NEON backend clean-ups (Alexander Sl=
obodeniuk)
>   - Fix a few valgrind issues (Doug Nazar)
>   - Build: enable tools such as orcc and orc-bugreport by default (Nirb=
heek Chauhan)
>   - Various build fixes (L. E. Segovia, Sebastian Dr=C3=B6ge)
>
> 2.Documentation are no longer built with gtk_doc,it was replaced by hot=
doc.
>   https://gitlab.freedesktop.org/gstreamer/orc/-/commit/0ad1f5884c654b6=
14cf1ddd114a7ec9140311a3a

Thanks Yiding!

Most likely this commit will be merged into master this week, based on=20
today's patch review discussion.

Did you look at the HotDoc system and consider writing a recipe for it?

Only a couple of distros seem to have HotDoc packages so far:
https://pkgs.org/search/?q=3Dhotdoc
but if it's simple enough and going to be used by gstreamer, then an=20
oe-core recipe might make sense.

I created a YP bugzilla issue to track this idea:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16144

../Randy


>
> Signed-off-by: Liu Yiding<liuyd.fnst@fujitsu.com>
> ---
>   .../recipes-devtools/orc/{orc_0.4.41.bb =3D> orc_0.4.42.bb} | 8 ++---=
---
>   1 file changed, 2 insertions(+), 6 deletions(-)
>   rename meta/recipes-devtools/orc/{orc_0.4.41.bb =3D> orc_0.4.42.bb} (=
81%)
>
> diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-dev=
tools/orc/orc_0.4.42.bb
> similarity index 81%
> rename from meta/recipes-devtools/orc/orc_0.4.41.bb
> rename to meta/recipes-devtools/orc/orc_0.4.42.bb
> index 60677577b0..f56b9058c2 100644
> --- a/meta/recipes-devtools/orc/orc_0.4.41.bb
> +++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
> @@ -5,17 +5,13 @@ LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>   LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d8=
5797e"
>  =20
>   SRC_URI =3D"http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz=
"
> -SRC_URI[sha256sum] =3D "cb1bfd4f655289cd39bc04642d597be9de5427623f0861=
c1fc19c08d98467fa2"
> +SRC_URI[sha256sum] =3D "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec44=
7e8a102b2bd122c90c"
>  =20
> -inherit meson pkgconfig gtk-doc
> +inherit meson pkgconfig
>  =20
>   # distinguish from apache:orc
>   CVE_PRODUCT =3D "gstreamer:orc"
>  =20
> -GTKDOC_MESON_OPTION =3D "gtk_doc"
> -GTKDOC_MESON_ENABLE_FLAG =3D "enabled"
> -GTKDOC_MESON_DISABLE_FLAG =3D "disabled"
> -
>   BBCLASSEXTEND =3D "native nativesdk"
>  =20
>   PACKAGES =3D+ "orc-examples"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229300):https://lists.openembedded.org/g/openembedd=
ed-core/message/229300
> Mute This Topic:https://lists.openembedded.org/mt/117254623/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------2KMrCe8fR01EnQE2mQkddCc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60JHOH7Z1727476

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2026-01-13 8:19 p.m., Yiding Liu
      (Fujitsu) via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260114011902.10064-1-liuyd.fn=
st@fujitsu.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">1.Changelog
 - Initial 64-bit RISC-V support (Maksymilian Knust, Filip Wasil)
 - Add 64-bit LoongArch support (Jin Bo, Hecai Yuan)
 - Implement release and reuse of temporary registers for some targets (J=
orge Zapata)
 - x86: Implement EVEX encoding and an opcode validation system (Jorge Za=
pata)
 - x86: Opcode refactor, improved constant handling and various other fix=
es (Jorge Zapata)
 - x86: add missing rounding operands for AVX and SSE (L. E. Segovia)
 - x86: Implement 64-bit single move constant load (L. E. Segovia)
 - includes: stop exporting the private compiler and OrcTarget definition=
s (Jorge Zapata)
 - Use hotdoc instead of gtk-doc to generate the documentation (Jorge Zap=
ata)
 - ORC_DEBUG_FATAL environment variable allows abort on log messages of a=
 certain level (Carlos Falgueras Garc=C3=ADa)
 - Error message improvements and NEON backend clean-ups (Alexander Slobo=
deniuk)
 - Fix a few valgrind issues (Doug Nazar)
 - Build: enable tools such as orcc and orc-bugreport by default (Nirbhee=
k Chauhan)
 - Various build fixes (L. E. Segovia, Sebastian Dr=C3=B6ge)

2.Documentation are no longer built with gtk_doc,it was replaced by hotdo=
c.
 <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedesktop.or=
g/gstreamer/orc/-/commit/0ad1f5884c654b614cf1ddd114a7ec9140311a3a">https:=
//gitlab.freedesktop.org/gstreamer/orc/-/commit/0ad1f5884c654b614cf1ddd11=
4a7ec9140311a3a</a></pre>
    </blockquote>
    <p>Thanks Yiding!</p>
    <p>Most likely this commit will be merged into master this week,
      based on today's patch review discussion.</p>
    <p>Did you look at the HotDoc system and consider writing a recipe
      for it?<br>
      <br>
      Only a couple of distros seem to have HotDoc packages so far:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://pkg=
s.org/search/?q=3Dhotdoc">https://pkgs.org/search/?q=3Dhotdoc</a><br>
      but if it's simple enough and going to be used by gstreamer, then
      an oe-core recipe might make sense.<br>
    </p>
    <p>I created a YP bugzilla issue to track this idea:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D16144">https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D16144</a><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260114011902.10064-1-liuyd.fn=
st@fujitsu.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Liu Yiding <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:liuyd.fnst@fujitsu.com">&lt;liuyd.fnst@fujitsu.com&gt;</a>
---
 .../recipes-devtools/orc/{orc_0.4.41.bb =3D&gt; orc_0.4.42.bb} | 8 ++---=
---
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.41.bb =3D&gt; orc_0.4.42.bb} (=
81%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.41.bb b/meta/recipes-devto=
ols/orc/orc_0.4.42.bb
similarity index 81%
rename from meta/recipes-devtools/orc/orc_0.4.41.bb
rename to meta/recipes-devtools/orc/orc_0.4.42.bb
index 60677577b0..f56b9058c2 100644
--- a/meta/recipes-devtools/orc/orc_0.4.41.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
@@ -5,17 +5,13 @@ LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://C=
OPYING;md5=3D1400bd9d09e8af56b9ec982b3d85797e">&quot;file://COPYING;md5=3D=
1400bd9d09e8af56b9ec982b3d85797e&quot;</a>
=20
 SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://gstreamer.=
freedesktop.org/src/orc/orc-${PV}.tar.xz">&quot;http://gstreamer.freedesk=
top.org/src/orc/orc-${PV}.tar.xz&quot;</a>
-SRC_URI[sha256sum] =3D &quot;cb1bfd4f655289cd39bc04642d597be9de5427623f0=
861c1fc19c08d98467fa2&quot;
+SRC_URI[sha256sum] =3D &quot;7ec912ab59af3cc97874c456a56a8ae1eec520c385e=
c447e8a102b2bd122c90c&quot;
=20
-inherit meson pkgconfig gtk-doc
+inherit meson pkgconfig
=20
 # distinguish from apache:orc
 CVE_PRODUCT =3D &quot;gstreamer:orc&quot;
=20
-GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;
-GTKDOC_MESON_ENABLE_FLAG =3D &quot;enabled&quot;
-GTKDOC_MESON_DISABLE_FLAG =3D &quot;disabled&quot;
-
 BBCLASSEXTEND =3D &quot;native nativesdk&quot;
=20
 PACKAGES =3D+ &quot;orc-examples&quot;
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#229300): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/229300">https:/=
/lists.openembedded.org/g/openembedded-core/message/229300</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/117254623/3616765">https://lists.openembedded.org/mt=
/117254623/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2KMrCe8fR01EnQE2mQkddCc5--

