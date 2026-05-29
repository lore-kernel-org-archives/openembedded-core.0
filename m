Return-Path: <Quan.Sun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBB4CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 15:52:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13785.1780069968385000598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 08:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=acn+j7XI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0609d6bc0d=quan.sun@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDjq4t258966
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 08:52:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PeHSeAmLNgf1UMn6Nv2SiN0Gy8ZVyfyro18kKOc/Lhk=; b=
	acn+j7XIRFJDKWDaU1YEhxJjLGZQqKkMamapVeysp/Q2oMMBtvK5Ie/aGtUekcwD
	ZVpPcoIRQXsXfx8PfPU3LAybiNZehOkRPmjzsNgVJ9uGcNgvJhJg/oXDYwfy1igl
	Cwhcb3LmIp0pAPipLTF4xHeLI9qvjg9UoYFO6YSzF5rvy4HEKPuLY4aapgzaEby1
	oP0f9khpGKofkxLgBPgGxlVgOh/2gOnqzSO0ViVE3zu51Xks0GbLZdpWGGKLIvAE
	K5OJJYGAgiVVs/hf3/YjtOT/g0HUJDtN4GGWCpEy49ujXTNklQbvISXhEscfDRdz
	BbPW31nthnwrAEjVWuoK+g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6jq2c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=coZxOnK+wtiRGJh0dGulx9zgDC84XFbJ1KFlLH8pUJaAMahQgzJviHbFQiUJBDL8MUAYm/Y1uSdj5KAhSUu9HPUL6AONfH190QAn+jdspBcH0CaWtQxuw4Ss7cMjf+AlbiqZvdAMaERMivs+XtG6e0SGPnCGP4GTzHZDgzEu2UnFJRalaicqgClB1d5ypuFydUQalPClwigqSlBrhEXurqAD+d5uZ+n3ctyQwF24J6OQsMGoU2vi4mSCuSqR7H4mesEKLoClh+ZqKqX0cFE2lLMC3dqA7nsv8TpMxKl7N9ImGucvEWTbpQpwuCBa6ZN1mDtsWRHzGH4wdcbKPJ6vaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeHSeAmLNgf1UMn6Nv2SiN0Gy8ZVyfyro18kKOc/Lhk=;
 b=sig9Masp4qWN1FkaubQtcZSh6XvHJFb0sbengF+RvF8bPzk5h9PcUUvrqAzuZgp8kQHkJnuiqTFkEPbuNj4tY+0RTvyOs0L2co7j9BDQcFLWZmCXGPZL1h0v3WRqnE616oa0JZ4AhnlEDJPejSn0nZgRHWCX3I9lqpxp+qMKqebdCz8P7LfJVmHpmhQ7tUOtoltn8cx/CTAwKr6uiCSDxw0jiU8CXtmLNfjR8Ur2ZkIh4jXUQ+FJja6R2Nw0hWl9kYxmfbwNBvbTXFaoivfnLBrC+GV3cjO6R98/GDPfutSRT+w+3Lf75e61+qr+DrmtVlPjEdzTMNV04nAbUVcCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10)
 by PH8PR11MB9806.namprd11.prod.outlook.com (2603:10b6:510:3c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 15:52:45 +0000
Received: from IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8]) by IA0PR11MB7283.namprd11.prod.outlook.com
 ([fe80::6e41:656f:120e:8e8%3]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 15:52:44 +0000
Message-ID: <71990304-87b3-4b91-9d58-dfd0b756a0ca@windriver.com>
Date: Fri, 29 May 2026 11:52:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com>
 <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
Content-Language: en-US
From: Quan Sun <Quan.Sun@windriver.com>
In-Reply-To: <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YQBPR0101CA0230.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::34) To IA0PR11MB7283.namprd11.prod.outlook.com
 (2603:10b6:208:439::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7283:EE_|PH8PR11MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: ee60f4f5-b57c-4dbb-1a74-08debd9a52a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	bNTGVA2Ih+y2gLSdpmYabNnfBvksQP1Uw20hSyi8WAYAClkJpFgWyScNOnXLTcwaBwaojEyrEP3JHQHA9uW/9V4g/yRkWnHErgkUn8A9RXYB2A5wR+KlvlLLWNYLA/cKXz+oMcEaNTWg+tqDO+RrOzNRhfLaI309ghqmr8D556q1iJa4j39eFOSXIbz5rkBQf7B0asRd5AMMq3TaUhz5eZ8IM/WwbXop+PQG0/hBr2F4HzCghZ4AB7R2hm0PtJzhiS2ZaS/ZaJtQxNenj+QNwIPjW44nxvNfeUs75cxpiSU7UjhZ+QjnNt2/kNBmVsz7CLWl25Q/qABAm/FpJWHNTSs9Nz5ZSk6GgFKB0sNFOEEmg3Y6xHqYQvLfcFCTxsFdS40XnRXuDatI1q0pi7UCtQ4fVkj8dMMbGHxfswpRcKqBXtF/LvZsoi6DRL3h2xN4VfnUucAW9vt6+disZLVWF/Lrhw6lbvEBLIj62GJY18DNMIdpObcd+7knH3rtFHAurUsSrsArZ1s7AqZVsGSmsdtPgFkIMUYNHpSC67PyQZbYIzg02yOFMAjXSnpbwLor8+Mf+dM4NogFz1JeXr+2V78YtL8EV85E5Ebo8lyZRR5yDq0cewoOSsYCXzY+nBJZGUiyxoEEg+WQXhWSKrNNzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WExOL3p5SkxEczNsV1FOaGxBMWNEZDNyUDNXcVBSdFVycE01eEp4Q0dUdkZM?=
 =?utf-8?B?Q1hpbHhzM0IvU3dBZndvNXMxeGZQZERHOUxON0tEOUQ4V2hPODc3QzZrYnVj?=
 =?utf-8?B?QXVuU1dXeHh1TGpLS2w4c3E4ek43bVV1N3FnZGZnRTRVdFU3eWhCV2YwR3pr?=
 =?utf-8?B?NTd5UFpYWWh6a1gvYTVQSlp3UmNKVWs3NG1oeEIwQXFBQWU5SmFwMTk3ekRU?=
 =?utf-8?B?K2tiVjZoUTM0ZkM0WmdiT1BqZXAvVzRIZk8rbm5Pc0xEQklOcjJFZVExTWcr?=
 =?utf-8?B?THNHTTdUOTdYWStpZFhLNVJJUGJHeVFTdVc5VDdSTUNNWk1EYVY4WGE4L2hB?=
 =?utf-8?B?NHVTV3NPZ2JIdjhPcFIwTEZEbDdpM3VCU3lyOGl3enhoOXhLbXlZbGNHV29S?=
 =?utf-8?B?Y1NCQ1htaXMzcnBmOTlheGlibDF5UWJQRUJHMGRuWGFJUWlxcVM4amo2MVFw?=
 =?utf-8?B?MlpVM2h1VU9TRElDa1c2SDloUjdxUWhmVGJYaVhVbHBEbVJZckZSOFc3RmJR?=
 =?utf-8?B?NSt3YmZQYnh6VWZWK3NWRXB5ZDhBZk1YeDJYbGVVTGUyUFFZbXdLQ3pXb2dN?=
 =?utf-8?B?YU4yNXZsSDFTcjVoUG9pL3NSdFM4QStIaGp2bUJQMVJEZmJObjIwU2Y5NDZu?=
 =?utf-8?B?azdnbkZLR0hOOHlndm1LbmhzeTQ3b2Z5TnhTNjYxd0RtVFA0MUtjdTdNTFFu?=
 =?utf-8?B?S29JeHhiUkFwaEF6dCtEcnRvVWtuSDNiZXI5Y1UzRk9KeEp1R3dYcDJUaGUy?=
 =?utf-8?B?MUVBbU9RV3pLcW4rVENRR3BVWXFBTUFHWW1kREFPdEdJb3YxNXdxYXpPRi8y?=
 =?utf-8?B?YXFFVnQxMjhIMm1KVkdJcERWU3M1SXE5d3J3K0x5MUo1OGRvR1Q3cmlUVzNv?=
 =?utf-8?B?QTFEb0pzTUtDRU1nc3hqVG1Hb0lWUTd2SGZTUDRZNlZyNFBTSGZHSndkS0Nk?=
 =?utf-8?B?Y2U5bVhTMHJteEFzbXNhYmpkSkk3NzN5YTk4cXZhMHFEVlF3U3lYeHNHSFdD?=
 =?utf-8?B?SGRHNGkyNnlCRjBTMmgwYmpGTkgwQmYwc1IzRE84SGcvOWlrY0lVOTlzUTFT?=
 =?utf-8?B?N1dybmYzVUhrYmdlcjJzQk5PWDhDVVZ0Y0tiZzBNYlpRZE5JSU4vb0VxaHlx?=
 =?utf-8?B?YWV5cElKRkdKeE4rcTQvWWR2TndpM2xJZjRWVlN1V2xIK1RwVVI2bjM0Z2Fu?=
 =?utf-8?B?YUJjb2poTHFwK3lzMUZ0WDJtbjBUelppNlI2MWlQdk96V0V1dzY1VHV5MXNX?=
 =?utf-8?B?cTQ5VnkweTRyNC9lR0Z6RE1aVnhkVGdkbE15cEx0TGs0RkRMNjFoMDNHTytm?=
 =?utf-8?B?MTgvUWlnVENuQ0diWnZtN1c3NVpmUEZyZFhzVnVKcytSYkdMVm8zSkJablRh?=
 =?utf-8?B?ZDdkZDlJMHhqYllKV1RIVVplOUFML3lHWDlkVWNVU3NhRm9zaDE4NHN2WEl1?=
 =?utf-8?B?NkhyYzNDRXAwRS9kM0x1b2R5QnNuTXJGM3dDMnVCZjZvYTQ0dlI3WmNnWHZW?=
 =?utf-8?B?WkhJaGNEbkFZQi9oMUZKNHdzRy9oQjRRNTJNT1BzZmMyV085T1lKMFcyQzJp?=
 =?utf-8?B?em5TeTdQSElnVEUwd3g1NkN0cDMyUWtVOEd0a0ZyV1ExY2xqM2lYU0xSRUhQ?=
 =?utf-8?B?cmJWRmFDNkt3Mlg3dVJRTEh2MUc0V3lKNGYzTlVlaW9FYTNPcWFZVTQ0NUlp?=
 =?utf-8?B?SUxiQnljZGhUa0EreGY0TE5qODZ2d3JwSHNFUzJ2MDYxOXF5SHFRRkdDdjdz?=
 =?utf-8?B?V1BreG10YkFxVW1IamFLaGNaaGljRk1lZUxyc0VrMnlGUGF1WVlrUjIvbWpy?=
 =?utf-8?B?c2kzSFE5cTVuMEUvTGQ2YnJJdGJjOTJhMitBWkI2Qks5Y0lGT1lnaEhrdWFY?=
 =?utf-8?B?L1ZudU9SSWFYY1hrWkVuQkhrbmlzMGlDQjI3SXRwVVpBVVh4TWh0QWpFUXNV?=
 =?utf-8?B?dWlrSE4zQzdWQW85dGVrakpmcDUwc3IraUV3blNDbzU1UjdEdWZRbHlxbXZy?=
 =?utf-8?B?NjczUnRTVE1ZeUVyMU9WUFlseFU5SjZOQmp6UnB3L05FRUxlOFVQZHk2OVUw?=
 =?utf-8?B?Q2xvVWo0QkpaUnIwQ1lVVnI2aTVsczhkWC9YRkk4Z1pCS3BlcktIWU5Vc0FR?=
 =?utf-8?B?amd3QXE1YUFyU3NxR1hPR1VzQVBtbVdhNHovckl0ak84MTBvenpwaW03SDM5?=
 =?utf-8?B?N2t4UDhRY3gzN0ZMS1JYaEVoTGxaaFZLamtNUlFLb1IyWGVodjlGS2FXR3ps?=
 =?utf-8?B?ejI4OThQdEs2Y25nVWhORUQ3QU9wdGsrZ2lYMnlpVXBrZHRSQkpZV2hFV3ht?=
 =?utf-8?B?Q1FPM3QxaXEzekM1Zkd1UDBnRWFoVzJwYmZSWkZzQUJTK1JFNXZ2QT09?=
X-Exchange-RoutingPolicyChecked: 
	PY1bUk8ooQ9b+LoR+mWwRdTSLT0D9GJon1kkeGPxy8T8WOkSq6h4R/wF4jmEOMVIgYYEhL+s0QwUjLYUW4nhe3G/vZ27FsTxHpRXY/VOu6RDCfzGFjeSr17YKBzvGkhZ+qHxL8p/UxRXDvXuB18B6yfJWrZk3I2PAdYDQT/6MIdb9o58tTzHVpoRB02KzGwWmiZ1uvcEYg/Ba2bfvTpNCyfFXsw0wwmkA/P8M7QRqWNuOkXIsqCMXkpLYopl8LBaWtm67Ki1STHeW9UGXC+UVq7VmHD3JGpTBu+LMjy1Ou0+2PBnBpPIOY6hOuaxOhCuJeTh3NoYfWc7VKvYr1UY+w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee60f4f5-b57c-4dbb-1a74-08debd9a52a8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:52:44.4726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5XjYFveiz0YNLKNwyK63YAeJK7Ncii42xtVX5+RcFdyhX0FzHesMYLhz2fqwxwsgLnchM/9LxRSPTBmL49uvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9806
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: zaJiFQ__tFo1gVkRYy6hjQIoZycnrsuF
X-Proofpoint-ORIG-GUID: 7C716mStl5_L9_7wUDBAxMhayhFCYnfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1OCBTYWx0ZWRfX8F8gSBE2bD/6
 AEtIgtITY+wKzv0oT9jxRl7nlv7/QLPSS/h+8vslV5elyrEM89ztQfwgw7RmDH08pmUkjTI4gL7
 gI7tueqsCjQ6WugWuk+hS7I9ohJH7erKTdk8lclIjvam4LAJHvxQ2pklbrLB5W6DoiqMh/jWw+M
 9xwXcy9lqEM87ec4qFCa5yzkNaieeHSzYiPNz41D2ieYUgV+Zzr+47nRG2fXMiNfUc7epFKw2Xk
 pOBtqxyka0w/UXhW+gp1q8ybxqAuAvvHKPujYHfIoEIWu1yd9kPzWiQUpFNpZQzzwU6VJZfrFsL
 0qUbCr6tlz2s82iyzh+NKxz/rGdTawKNtf44CGxiR7zf+nCYqC1/y70mI5NMNuOhRDOT1Laqp7E
 uSfJhymlstxxJqWiftssrybRdWOO5boDK1jto/3iRXwQG8k39z0j8aquaRPGt/bxaSbq7wt0g8V
 ncu/on7CbToD/6qPQpQ==
X-Authority-Analysis: v=2.4 cv=bY1bluPB c=1 sm=1 tr=0 ts=6a19b64f cx=c_pps
 a=huIvVN+S9WGU6koxVvae6w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=xGupElFT-oDDhlqmsoIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290158
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64TDjq4t258966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 15:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237763


On 5/29/26 11:23 AM, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 29 May 2026 at 16:45, Quan Sun via lists.openembedded.org
> <Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
>>> glx: failed to create dri3 screen
>>> failed to load driver: vgem
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/39=
24
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/37=
86
>>>
>>> Can you have a look at the issue?
>> It seems this issue is not caused by the qemu upgrade. I also asked an
>> AI agent to carefully examine the build/test logs, and the following i=
s
>> what it says:
> Unfortunately AI has produced a total hallucination in its analysis,
> because it looks only at the build log given to it, not at the actual
> change that is being tested (e.g. it wouldn't see in that log that
> there is a qemu update, and it wouldn't go and analyse the qemu own
> changelog and commit history, and it wouldn't run the same test
> against qemu 10.x to narrow it down and so on).
>
> I went and tried this test with qemu 10.x on the same host, and it
> passes just fine:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3928
>
> Then I cherry picked the qemu 11.x patch, and the test then fails:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3930
>
> It's still possible something is misconfigured on the host (it runs
> tiger vnc standalone server to allow X clients such as qemu to render
> into it), but the issue is clearly triggered by the version upgrade.
>
> Alex

Hi Alex,

I looked at your test logs and not sure if you performed the test by=20
really using the qemu 11.0.0. (Note the QEMU binary used in the test was=20
built from sstate cache (1851 of
1852 tasks were cached =E2=80=94
Sstate summary: Wanted 187 Local 187 ... 100% match, 100% complete),=20
meaning it may have used
whatever QEMU version is already in master's sstate, not a freshly-built=20
QEMU 11.0 ?)

Regardless of the AI agent, but the earlier test really failed on the=20
worker ubuntu2510-vk-1 because that host lacks GPU/DRI3 drivers. Have=20
you performed your test on this=C2=A0worker ubuntu2510-vk-1 ?

Thanks,

Quan


