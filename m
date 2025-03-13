Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9982C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:49:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22942.1741891743304975970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 11:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5167dd2ec4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D82rZs031546
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:49:03 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4tdym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:49:02 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52DImd2q017201
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:49:02 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4tdyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 11:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ut9iGMqpEo0cBbP1e2MAh61HlcL+hcEgsmPWrKnz9LXii1LgKNnmb9mm84TRa/Zor9MI0FAPou/vz+FOxIFz4sFwoktR67ueYW53QhhUC0TJvVS8SiSZr5aKwznWKrfgE8rVjbRsK0WBvq9pIdpx0LccoOjuUnqiIqdn+4mGFXX0zS54BJh7YZbTDDjKIflviOtMdIk0JDd/oSjs1xG2byZIMC/hsUataTwWHp1krQ+fDaRmpmviE1OOIJn7K7rfdGKC4VKWhY0zgNOm1RHpAnPAebDbn93Bn6Pi5Ym3l9X1aIdaB5chlXYKDZ2WmzcJ1R5dQn9d94ZV+D/E8J0epQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsJBBdJeBNXZlQeDjYbZDpkNsIXm/ck/v2QUBW+p//E=;
 b=m/LgjK8EHAT36u5Jj80IVjiQpiAnR75TKjqJW4n4ezHAj0SFG4qyG/rNTVqEuDvc8RFf8OOXXtK44C0uWBCYgztM/mREfNdaFYjFuYDrgifjBTlPn7kpIargxVCtdxoOTcFPTm6+a8HqXVifqS8uhPmsGL65q1gY4SJnJQRowbCxnF97jjlJ/SxRggHlDuLmtNyVc5EyRQePC4nUUYd83fBjQsg9xoKdt+YoJ8WNMHrZnemPFT+xMtNDB0kOmkdGFaZ6zVrS8ArZJ50KvF317DrSQx0JP25AhdHktUI1tpFq+vKfivkyyNDw5YKJ7UgnlgYlOZ6gBQ/LHki/UXzMNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA2PR11MB5018.namprd11.prod.outlook.com (2603:10b6:806:11a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 18:48:59 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 18:48:59 +0000
Content-Type: multipart/alternative;
 boundary="------------WbEnpArZ0VoPR0VtTxLjns0c"
Message-ID: <03997060-1f1c-4784-af57-bb83b0514ebb@windriver.com>
Date: Thu, 13 Mar 2025 14:48:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0 --> bloat
 alert !!
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        deepesh.varatharajan@windriver.com,
        "Shinde, Yash"
 <yash.shinde@windriver.com>
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com>
 <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
 <c411d58d-bd27-4107-9b98-e39de14204df@windriver.com>
 <5d748ede629df75d0ed30df5418b42b936d5416b.camel@linuxfoundation.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <5d748ede629df75d0ed30df5418b42b936d5416b.camel@linuxfoundation.org>
X-ClientProxiedBy: PH8P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::17) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA2PR11MB5018:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a12262-e19a-4c94-0a03-08dd625fb6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UWx1dlFmRWZmcFhhVGJNSnNKcllrZERiSmNWQUJHYVkyMXJyRjcrbVdnNENS?=
 =?utf-8?B?M09qRzlEVGlPNE9qZ3BrYWxPVW9raDBESk1Yd0NVZ0RFbXBGSWNLNjVSWkVh?=
 =?utf-8?B?NVB0ME1zYVVLQS8rMTh0WEFNQmpyREc3bmNNNW9qTnZZWURHTGlSNjlJTHZs?=
 =?utf-8?B?K3U2dk9QOWIyVTNNOGgxNVdLMjlrUjRUUkZacjZ6OWhKdUdDMzlnRXlLbzFt?=
 =?utf-8?B?S2U3ekd4Wmt4V2s2S21SY3cvN0Z4MUZiVml1N2JQcDczeWdKU05tTmFGVUJk?=
 =?utf-8?B?Q1l2MlZTNVBtM004SXVnSEFHRHY4R0t3UW4rbkE2SWt4aEJLdzdJOEkxbi8z?=
 =?utf-8?B?alBHSCs1ajJyUGJQREpFNmNjWVQ2K1daU2FaN0ZMenNrWjZkWDFQdHhZM3g4?=
 =?utf-8?B?ZE9VV0hiMmVJZmhTbmJIV1BheitWRXZ0NC9BUHdaclYrK3hrNjdJblE1NkxY?=
 =?utf-8?B?SWZGMHBMQk0waFZYck1RMFU5MkcrWHlsQ3I4eittWkNFQk43eHF0Q0xKK3Ro?=
 =?utf-8?B?RGR3L21tQ3lyelpaZitoQ0F2VDdsWmYzM2JLVGpOUWs0dkl5YzJTRVg5Y3dH?=
 =?utf-8?B?cUdLVGhGdEZNUmlaM0tUMlgyNS9YZzFtOERaTWhTSlJGcTdXbjh4V3dvV2h0?=
 =?utf-8?B?T25TdmRnS1czejV6bHZFeFcwb1hvRjBsYmVPbFZZeDhUOUg2T0VIbzd0dzUw?=
 =?utf-8?B?dmcydjNkS0h3U0tIM2ZkWElHeUdYL2NXejZYN0FhdDBVM3JMSmUxc0dPYUpV?=
 =?utf-8?B?QTVPc0lnQmhlOTEwRUU2NXBmNHFtODRHeEl3dFo4b0o0NVNUbDNwc0tOVmxw?=
 =?utf-8?B?Ti9sc05GRVE1VzRNY0RQYUd4c0xpL3h4eXJKSWtKcXNodTVJQWs5c3lSbzBt?=
 =?utf-8?B?cXRVcDdjdVpWbjdzdk80dG5yU2JodGp5UisrTnJUVTZSdkgycEE5bi9KNk1I?=
 =?utf-8?B?MThOS3BtMmt3bVRJSWUrWkcxT1ZOYzdJWVZ5a1AzTVZ3UGxzMVpSdHFTbk1Z?=
 =?utf-8?B?QklXZm1JbHJGd21tRWpGZEN6Uk5MK2Z4VTEvN2Q1NzdrNG8yVmFBOWpZdzYx?=
 =?utf-8?B?clhJMm5rUzIrZzZJNkMrc3pUeUtkTURwZStLNVg5aThLOEJnL1YwdXV6bklq?=
 =?utf-8?B?OFBYZXA2em9pRG1VUGordm8zdVNkTkhPQkRUNStiWWFvTDJmaHFleXBzWkdR?=
 =?utf-8?B?S2JXaUMwc01wRFlOc0JCTFVVR0dKV0N1eGtadTZoQWdYa1B1UGlKT3hnL3Rw?=
 =?utf-8?B?UVRvMy84NHplV0VZQzE2aGZmeXBvUTlqNy9WNjJvZGNablJFOWZiZHF4YzJE?=
 =?utf-8?B?SUxad1c5eTQ5bVliZUs0N2tWVVdyZUNUeVE2aHBPOEVRYTYxOUtlenRVSkhQ?=
 =?utf-8?B?aExzcVNkSnJrTUVUZVhHenQvelVXektJMTlRUUZFSjRGd21rcWdjVk5qRHRQ?=
 =?utf-8?B?dEJISFV2eTdNMHZTY0N4bEFEZ0hHZHF5ZTNYcFd3RXA0aXlWMEVObHZXZ05u?=
 =?utf-8?B?NWRNT25tSnVPQVJaS0FHMytVanRZM0pSYlRvSUNWTzNPazVlVzV6WGlCRUEv?=
 =?utf-8?B?NmlTTlNZM2JGclpha0RsLzZXZUVOSDNMYllmQm9DemVMM2NDNkZTYzJPY2pw?=
 =?utf-8?B?OTJUaDBnWHljYjZ1blRDSkYxMzVtZll4eTkvTCtzREl1TWpwc1pGRXUwRi9z?=
 =?utf-8?B?Z3BPRFJLSlo5eGc0YnJGZGVZeWdxVVpud2dibERKcTNTWGRMVVFiRk5zaFpU?=
 =?utf-8?Q?8Mw2c1bPRW2HVA6mxeFuiaUkPdGzjv6H52kkW7S?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkxYdit2dzRERmI5K1NJc0hwNFhUR0IyUWRFSnRhVkNQTWgvVkhoTWpWT2lT?=
 =?utf-8?B?cGFNcE42bEZLRlc4ZWdBRUphOVlTTVlpMm45Rk9xTmpWVjR1MFRSWE9HSFZp?=
 =?utf-8?B?anAwWjh1elVMaGxnL3BZbnN3YngxS1hyQjg5L0gxYWtkV1MraTRBNUNiVGE2?=
 =?utf-8?B?eTZ6NW5ES0VSSkZLTjRPclhMWFJQdGxtOUR2bGc1c1lNdzBXQldvcjlqVERw?=
 =?utf-8?B?dEU1SC9qSzNTMWs1Y0U0NTgrdERoV1VCd0V6cFE1MGtaY1Q0WUs3M0o0U1Vh?=
 =?utf-8?B?aEVrVTNQOStHZm1BT2pUS0h1T1MwOHJ2SG9HVUdNZUorc01OTkNYMnZNZ3F6?=
 =?utf-8?B?VVRXOE55SjhwYmtYTC9mMGlKZXM2cXZNVDlNMWJwQnNFMHRkSnRCekt0QjNN?=
 =?utf-8?B?WHJMNEgxOVFwNHZ2aGV6SE80OWMwSS9WRVk2bjJXY0lkSDFFTFIyRDZCbW5G?=
 =?utf-8?B?cW14TndISytvR0hFMk5IeHRSdXpkbG9Td3lmTlBPYW1yQ1RJVWFJT1BDUDcw?=
 =?utf-8?B?d0x3OCtzMnZZMHdCQUpZalNaOXc2MjJKQVlIZDFBVlAxWmExN2p3QjNhQnNy?=
 =?utf-8?B?Zy9ob3RPWWN0TWJGdlE3MHNXTHUzaWtEM29FOWY4TEVqVVlSdy80dEpxUFdl?=
 =?utf-8?B?NE1scExLMVJrTjNhZWRORHc5TXJ3VitSU0Jlb0Y0M3NwSll6R2RmaTQ2N1Z6?=
 =?utf-8?B?ZXJTdHR5WEl4eFIzZkZrSzJHTndNcGxmY3N0Z3FETER0ZG04eEJEcmVGTHl0?=
 =?utf-8?B?ZkN5YXJjMzl6Z3cyRzFJUEVsYkhtK3A3RWRUMWcweGdRYkkyOGpJVnlpdFB0?=
 =?utf-8?B?ZjgyN1MrZXB0dHU3RytlYVFoVVZSVzhseDVneWpmeWNJTXdOUkp4eFkrTG9m?=
 =?utf-8?B?UW50Wm5FS3A0amduMXpVVWUyRGdRRDNnNDBLTHpscG5yUVRoUjVCb1FVa1Z6?=
 =?utf-8?B?K3lLMFgrUDk3OERiUFBKbjVaQVZyUzNIOUpmTk5FQW9BR3Z5WS9vb21RQzVs?=
 =?utf-8?B?M1B2MCtwczd0Y0NoWjlwUVNxSVA4Vis5M01aY2wrL05LYmlQVGtFcDBaNWdP?=
 =?utf-8?B?QmNOSE44ejZjRi9pUDMwTGtLM3JTWDJIbFAweTRiR0FiTnV0dWFPUDdsYnFx?=
 =?utf-8?B?aUhmQ0luQUxnR0Z3eVBaVEdLaHpqdUNzZlJERThvbTNWMHNWVmdEajVTbGlz?=
 =?utf-8?B?blJ2QUJsd3lvSVNHMSs2RzZnb0UzdzIxZVAyZ2R2ZlFHcmowclptWnBaeTV4?=
 =?utf-8?B?Z1RUbVQ0SGhGQUJaM25XaFBPWkdwcTJmV0gvWHV0QTd6TlJDREtiU3RtLzFM?=
 =?utf-8?B?T0tSSkdWQ1gxMk1xUVZ1UWRlcTFLdTk3VWg1L3N3WjZJaVo3aWxkWEh6OG0r?=
 =?utf-8?B?SEJST3V1ZDg0NVZLUjZxTEhtTy94N0EzdTVSME1COFhBVHplMUlGY0JXVGdK?=
 =?utf-8?B?OUtOR2E3VDZMOXlmMFVMSkNzVS9iQWZGcC9weE02K1RVajFiQ3NOaEtySXU5?=
 =?utf-8?B?T3VNcERSWXo5aEhSN1FmZFd6SHY2ZVpDSmdsYi8rZGkxSXNNbXpIQmQ3d0JE?=
 =?utf-8?B?S2Q5NWw0SlRnclVoMlhFcHh3MGdzWGR1VmNuS2NjZzZBdGpmYW5zZVQ3SXYx?=
 =?utf-8?B?bWRhN25CZXlSTC9vTWo1U25IdG83RW45WCtsYVF4aVZNd0lQNCtBeS81RjF5?=
 =?utf-8?B?Y0ozeTR4ZzI5Qy8rTUxMM0pYcVFvUTA3azR0T1hDNjFLY1VYSlRhUjBENXEx?=
 =?utf-8?B?czNKVTBqNnFBRHNzSEJxa2JZYkJtMnR5UzkzWDZZbWJSbStSNjZLejVYV1h4?=
 =?utf-8?B?VTBsZkpRcVJBUWdZa3d4YUU4OUVOcFpBb1JTaUNCY01xWjRFRVcyZGx1V3cr?=
 =?utf-8?B?L21TcG5KVFpMQXp6Nm0zMEM0QWN3YmRGWVdKUmlpOUYyaHNwcWM1dmNXZldM?=
 =?utf-8?B?OHVDKzVFQ1lraXhMTFVlQ2xJYnF4K3ZxNHJRSFRPSXE3Vkp1ejdEZzhEL3Zt?=
 =?utf-8?B?eHVwL2Mxbkc0amhtRDNZMUlRemZ3bHpBcG9tSHNpSHgzMEV4WkRoV3FhTU1Y?=
 =?utf-8?B?QlJhbDc0KzZOM0xDaFZaVkV0alg2Vk5HR1gyZ2N0RGNwSko3Vk9scTJnZmhU?=
 =?utf-8?B?RnFsSkFYYWhiYUVaRFZFQ2JpT1JmdjZYY1lEZW5KZ3JhaVhqSCtjWWFWRVpO?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a12262-e19a-4c94-0a03-08dd625fb6fa
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 18:48:58.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6nFcohXulLWCDaTg1Aa5pz/qyN3b0O7yKiIF2heIAWUJ0gU8qrtigHI7xRSxCDIWsZamjKGOqtu1AeZsdKDhyizdOOtHMcQGz7iv+Z/nvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5018
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d3289e cx=c_pps a=CZyBIZNk7+VlD+/eRBofeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=iGHA9ds3AAAA:8 a=Vm3fI9Ul8ISHkK0xiFwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ag1SF4gXAAAA:8 a=XVP9M1yeY91XspFWo-IA:9 a=UZCjmXDf8yDmc8dL:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: yOEhB4Cx-dfk0tzAlwGHvIXQNyRUSpNQ
X-Proofpoint-GUID: 4W2C-rk_TTHzg1BEgMvZDGJ2ktYZN8X8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_08,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503130143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 18:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212802

--------------WbEnpArZ0VoPR0VtTxLjns0c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52D82rZs031546

On 2025-03-07 6:37 p.m., Richard Purdie wrote:
> On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:
>> =E2=9D=AF for i in `ls -d *src`; do du -sh $i; done
>>
>> 3.5G=C2=A0=C2=A0=C2=A0 rustc-1.82.0-src
>> 4.8G=C2=A0=C2=A0=C2=A0 rustc-1.83.0-src
>> 4.9G=C2=A0=C2=A0=C2=A0 rustc-1.84.0-src
>> 3.9G=C2=A0=C2=A0=C2=A0 rustc-1.85.0-src
>>
>> I didn't check for the other 4 GB yet...
>>
>>
> rust, rust-native, nativesdk-rust, cargo and so on.
>
>> Should we do that an host the tarball=C2=A0 on yoctoproject.org?=20
>> <https://urldefense.com/v3/__http://yoctoproject.org?__;!!AjveYdw8EvQ!=
fJXJLq5zUX_ORAdT0imsy5PfIAHVBjw3rwJRpJH0HgmwRJiTyMFIQebHf7jG9o_l7GKu06t9z=
K2RNaNX3CujsTYP40pyXJxYOXO78vw$>
>>
>> Should we write a custom unpack rule to=20
>> --exclude=3Drustc-1.83.0-src/src/gcc ?
>>
> Or just delete the directory in a do_unpack postfunc?

Yash has 1.84 mostly working and

will add a post unpack change to rm -rf rustc-1.83.0-src/src/gcc

>
> Or wait for 1.85?

This likely won't get merged until YP-5.3. We'll see how long it takes=20
to be ready for review.


>
> This is annoying "bloat" which we at least need to identify and work=20
> out a plan for.
>>
>>
>>
>> Next week, I'll also dig into the 'tmp' usage increase to understand=20
>> where the 5 GB that Richard reported comes from.
>>
> See above, I'm guessing so it needs to be confirmed but...


Yashe,

Can you review the reason for the FSspace usage difference between 1.82,=20
1.83 when you have time?


../Randy




>
> Cheers,
>
> Richard
>
>

--=20
# Randy MacLeod
# Wind River Linux

--------------WbEnpArZ0VoPR0VtTxLjns0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52D82rZs031546

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-03-07 6:37 p.m., Richard Purdi=
e
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418b42b=
936d5416b.camel@linuxfoundation.org">
     =20
      <style>pre,code,address {
  margin: 0px;
}h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}</style>
      <div>On Fri, 2025-03-07 at 16:02 -0500, Randy MacLeod wrote:</div>
      <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex">
        <div> </div>
        <div class=3D"moz-cite-prefix">=E2=9D=AF for i in `ls -d *src`; d=
o du -sh
          $i; done</div>
        <p> 3.5G&nbsp;&nbsp;&nbsp; rustc-1.82.0-src<br>
          4.8G&nbsp;&nbsp;&nbsp; rustc-1.83.0-src<br>
          4.9G&nbsp;&nbsp;&nbsp; rustc-1.84.0-src<br>
          3.9G&nbsp;&nbsp;&nbsp; rustc-1.85.0-src<br>
        </p>
        <div> </div>
        <p>I didn't check for the other 4 GB yet...</p>
        <div> </div>
        <p><br>
        </p>
      </blockquote>
      <div>rust, rust-native, nativesdk-rust, cargo and so on.</div>
      <div><br>
      </div>
      <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex">
        <p>Should we do that an host the tarball&nbsp; on <a href=3D"http=
s://urldefense.com/v3/__http://yoctoproject.org?__;!!AjveYdw8EvQ!fJXJLq5z=
UX_ORAdT0imsy5PfIAHVBjw3rwJRpJH0HgmwRJiTyMFIQebHf7jG9o_l7GKu06t9zK2RNaNX3=
CujsTYP40pyXJxYOXO78vw$" moz-do-not-send=3D"true">yoctoproject.org?</a></=
p>
        <p> Should we write a custom unpack rule to
          --exclude=3Drustc-1.83.0-src/src/gcc ?<br>
        </p>
      </blockquote>
      <div>Or just delete the directory in a do_unpack postfunc?</div>
    </blockquote>
    <p>Yash has 1.84 mostly working and&nbsp;</p>
    <p>will add a post unpack change to rm -rf rustc-1.83.0-src/src/gcc</=
p>
    <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418b42b=
936d5416b.camel@linuxfoundation.org">
      <div><br>
      </div>
      <div>Or wait for 1.85?</div>
    </blockquote>
    <p>This likely won't get merged until YP-5.3. We'll see how long it
      takes to be ready for review.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418b42b=
936d5416b.camel@linuxfoundation.org">
      <div><br>
      </div>
      <div>This is annoying &quot;bloat&quot; which we at least need to i=
dentify
        and work out a plan for.</div>
      <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex">
        <p><br>
          <br>
          Next week, I'll also dig into the 'tmp' usage increase to
          understand where the 5 GB that Richard reported comes from.<br>
        </p>
      </blockquote>
      <div>See above, I'm guessing so it needs to be confirmed but...</di=
v>
    </blockquote>
    <p><br>
    </p>
    <p>Yashe, <br>
      <br>
      Can you review the reason for the FSspace usage difference between
      1.82, 1.83 when you have time?</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:5d748ede629df75d0ed30df5418b42b=
936d5416b.camel@linuxfoundation.org">
      <div><br>
      </div>
      <div>Cheers,</div>
      <div><br>
      </div>
      <div>Richard</div>
      <div><br>
      </div>
      <blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex">
        <div> </div>
      </blockquote>
      <div><br>
      </div>
      <div><span></span></div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------WbEnpArZ0VoPR0VtTxLjns0c--

