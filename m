Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE31CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:29:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1437.1758036539802213144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ioXTXmJL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1354f8bcfb=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G7Vk3O2080303
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=GrKbHkA1dBAmZ6JRMx3qT6
	WZmow5tz7hHKfhyblHMxo=; b=ioXTXmJL8jvg2cM2DbSTm6FLWZlyP9iyktVtv3
	dBPbWwMawqaWu7Liob+fjOgEkwq9qTTz0Ib03GQ48U8DrYuBIwGy0XUUzkFL5dTk
	UKAkCpAzTxejqxRO87WnB6QskMqFQSf9d0JIcMfgKkwdN8XhVlE6AnaN1N3hLMXv
	Tr5Yjo7hiQy+Rs6igh1ORllfoj1+9UaiCKYeGfkH22PpOspekBuqeYhak3XTMNE5
	60MWCmn7kjtlpI5LwYBlepCoAkwpu6eR4y0aMIL3uTvN6iGujWI1bGyz2BZqobIt
	Cjg2aSB1vHDAWB6Q5R780XTj4Gqh68kkKzkuaw26CSf0fnxA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu13n8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Sep 2025 15:28:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vh0DgxHJ818/iuqqkk/yWXlRHKjWmt1bseQweQc3xPsqbwAsc6dw9och7SgavTqXEqBXqAHfJaAo0gPC2wOh1CzcgVgwxiFNkkCRsM1fCaUAFIB7eSux7lknprd2KzLGxe9wjcm7HA052oRnqBANGPkKiMznn0LSlgacVFfgDR23q0g2qLX0EAxUrcjevWBrqlYjhB60eACH02L3nLKCmllw5SKCFSMyqRm7cnNC3a0AS94axaTStvr9QCkt/nkZuyqJaVr7ZTzBaHp+DL7wdUtJQjYXmlz4VJaUBpQQ6ujTVV39EThOxQuTl937lSJJ0hqs/wned+3KL29R2ymd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrKbHkA1dBAmZ6JRMx3qT6WZmow5tz7hHKfhyblHMxo=;
 b=xQI7upkTBQb2MFozIbhwvmPj9FNh8V3gmwkjlX3pVljmB5AIUhJWf8cs9nGMOWrsoOgimWaXGe16N9VmCX6UHIHCKaaNR/sX+jAb3fICggX1ReaWc5sVWBqr8TzW/eclZLWoOZ0e4TVePA09l2GBdxBsFIW86X0bkr5wRayLWUnsWBZ7bTXEMURMnvsK/UHkny+94f2pBRxIPCxFCW2Y2nHsniv2j3fDWi901iIyB8Olwtwn5VVODxc4gkGyPzv3m7mTVnNXXZoORb6u5Gl/AGhQxs0tEFq5+R2zyYdbFnymWg8IEqEEUd1zWSSK6Es3wPdQtZkClsnrW/4tPRN7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA1PR11MB6242.namprd11.prod.outlook.com (2603:10b6:208:3e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 16 Sep
 2025 15:28:54 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 15:28:54 +0000
Content-Type: multipart/alternative;
 boundary="------------6DEm0Q2Qol5d1b30nCzbv00w"
Message-ID: <0254052d-c03c-4304-913d-1bd504db28fa@windriver.com>
Date: Tue, 16 Sep 2025 20:58:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Performance Benchmark: ripgrep Linking Time Comparison
 (GNU ld vs rust-lld)
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <sunilkumar.dora@windriver.com>,
        Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
References: <d602b56d-c8a7-4659-b962-d2d00cc9bc5f@windriver.com>
 <268e81f5-2ff6-4e8d-854a-a8faefb1dbd2@windriver.com>
 <9F392464-759A-4B10-803B-38FC9A78AC81@arm.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <9F392464-759A-4B10-803B-38FC9A78AC81@arm.com>
X-ClientProxiedBy: PN4PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::8) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA1PR11MB6242:EE_
X-MS-Office365-Filtering-Correlation-Id: 56bcfdf6-1e5a-4a9d-722f-08ddf535beae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmthM3p6LzJMbUYweVpuZWpvTkljZ3RMQzZrMTN1V0FJa2hMMG1NNThPdm02?=
 =?utf-8?B?dXVCa29xL3BSVVdiN0pGMnVBRVgrang2UFpjQk9wazF6b2tIZmovN29JNUZN?=
 =?utf-8?B?S1FyNXd6OFRYbG9mMkRGZS9pSVUxL3B2TnROcUx6NGw5djY1QXhhUXFZV1hv?=
 =?utf-8?B?T3oyQmYrdERWeitza0srTUtTTUgxdjQ5dkI1Ti9INmsvK1lxRlZvdFc1cG0v?=
 =?utf-8?B?NTBmeEREQ0U3bUJGZEQ1NXVaY3J4YVE2bzBFTUVsWDMyUWU3VTZjVHJCU0s2?=
 =?utf-8?B?MCttUjQ0WHNYTWdBeDArQUZGN3pIakpOcER3R205MDhqQW5OMGZGQUFWYlZK?=
 =?utf-8?B?Q0J1WnRmV0YwdGxacndMR2hXa2dJUnZZancrVURvR25rdlorbDBvdmE1UFor?=
 =?utf-8?B?MGxselM2T3J2aW5HQTNIeXdsWHEyZHZLOUYrRjJrWUJ5WWdVVEFkTUNpc1pl?=
 =?utf-8?B?eTlvSUx4Uk8wemxGejdJZzRJdHFnN0FEY2RZQm1TeEdwbUNRSkdycm85cWpC?=
 =?utf-8?B?MzBPUmNIek1QM2M3ajVYVmpxSTZCb0hmSVZ6T2ZsdWNzMmVPWkZ2OThuNXkx?=
 =?utf-8?B?R2kyZFFMVXdlZUlwOURiZG0vSExiMTlZOHI0THlBTFk2UFlCYWhkRnFiaEtD?=
 =?utf-8?B?K3N1Y29LeWpVbkhvY2VYK0d2SGdXaWdQbjRsTm9CL3FYVm84d0drd3Ryd1Bo?=
 =?utf-8?B?OUNWNTVGSUUrcFVHd3EvdmMvM08ycGNsVHVyM0dVZHNrRDQ5ZWpIa256VCtR?=
 =?utf-8?B?U2E2cUhlRFdqdTlLTTlnenBrOUpHS2tHRkhjTTZ2Zks3WS9CUnZ4RlAxTFJE?=
 =?utf-8?B?S3pkWHhQeUl1SS8wRE51T3NXcW9uSDdyWmVYdCtjWkJyYVh2V2c2WmR0M3A5?=
 =?utf-8?B?UnZSZkZYaVJhdmd3bHZ1WVFuT2NPSjc1TjJWcVpsdTFCbWQ1c1ZubkhkcEtV?=
 =?utf-8?B?elFpdm1ZVEx5YS9hdTQ5WjBnZUV3TnZMOEZTbU8vSk50ZFVEYUdvbFdESzYz?=
 =?utf-8?B?OGkzYUZHNytxOWE1aUcyRHJRekVmK1pubndoWDU5QnpZSFI4c3habElRK2U3?=
 =?utf-8?B?NHc2dFZ1aXh3R1poM2w1dFF6cHk3Z0hsOTAycFd4bmZSWU9RczV0UWVEWkdh?=
 =?utf-8?B?bzhtRVhhRkEzSFl2eVpXeFBuam5KMTVKQ3BNYTh5Rkx4VXpRMHNOOHhUOEtE?=
 =?utf-8?B?MnNsN2VpRmxVd1hUZXY0bVB3V295QjNKYXhpWXB4b1pMWFdwL3h6WXRrVUxY?=
 =?utf-8?B?dzlxSmhVSnhrQldHQ1hRdnl1R3UrNXVuUjdjNHBGSDJLVDNKTjgyVEVtWlA2?=
 =?utf-8?B?ZnJkRFpMWUdtK0RXRzhrN1BwQUlmcjNuV3VhODExV2xxNWJNRlF1NlpGZVJn?=
 =?utf-8?B?RXRRUWw2aEVqUThvdExYVXovUXNIUmlRTWhKMWNEQ3lQUU5QZXBTYzhud2dk?=
 =?utf-8?B?TVZtN1VtVWdGZFhBdVVoeU9pM1Nzc3VjS0V3K0JUOXFHb3pvWE5ReTd4WFBD?=
 =?utf-8?B?bWJCTGJxbVl6M1VJSnJZWVNHU1d4RzU5TExiMUpwOFp2Y1A5aXdEY0VEQlBn?=
 =?utf-8?B?MTcwRmJRTkMxM1hLY2V1R1ZucW5KbkVpNW1nckwzd1RSYnZoR3YwVGk5cVZx?=
 =?utf-8?B?aUViSm40cU5jaVhiaVpvVHZEemI1UndXYW5vMlVjVDVyYmhIeHJnQUVoQnVS?=
 =?utf-8?B?bUxENmVGT2hBZnpzeXQyVjZXQTZ0S1RCeGI5eUJSWDh4TEU4dmlVeWU0SE15?=
 =?utf-8?B?Nlo4TGJ1ZDR5czNMVi9UOHpaOE02ekNPWXRBbXV3eGw3YTRjVnZHdDREM0FY?=
 =?utf-8?B?TkdFZEZQd1pzUmQ1VkpGZlZSamhuQ245UE5Ldkg5Mzh5ZVBva3VlUWtwY2FR?=
 =?utf-8?Q?qPhPXC+4SF6qg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFhBbDM2K2RHN1FaUCtLc0NFNTlFd1BlU2FuWVZiV2RQbG51VWxVZHFJVVly?=
 =?utf-8?B?UlB1NWo2MHFhdUdTNkR6QTZoaFY1MEpaMnJKS040U3FYdXZoTVRjRlNTMEJY?=
 =?utf-8?B?REFVVE5KTHp2ZEk5SzFkYWNmYmR6QlRnL2RtKzZpWldRc25UbHJXL3Nmc1Nh?=
 =?utf-8?B?cG9xNTc4ZHp6MW9paGF5UW1qbVhrYm4zSUlTK2F4ZEk2K3k2RmtnemFGMHg5?=
 =?utf-8?B?VTlMUFA0bVlERHJhczJLek1ydWRQTmVqd1BnMFdZQzN5dU1LbFhlKzVwdGJF?=
 =?utf-8?B?Z1Q3Qkcwb3pPc3NYdC8rRG1YVlZoc3B4TEoyenpNVUNjSXJnNEZTcUM3Z0sy?=
 =?utf-8?B?ZnZ2TUZkUFg5MEFHVnVYZEtmeTQ1dUlVNmg0SElCU25aT2JvQ0xlM2RrczlI?=
 =?utf-8?B?a1pTbndpeEMyZEFXN280UEdNVWl0UUlCOTNLNFpLNGN4U25sV2RoNlliellT?=
 =?utf-8?B?QllCN042TSsxVTIwVE9mMzF2R0ZDNEdVYUNKL3EwMHdnSkV3a1dLV0NvRlNv?=
 =?utf-8?B?QzV2dnJ0WUhCSFJCdkpIdXl0bUxMeldqcU9WY2l1dXA5UmxWK29BUDhWM3B6?=
 =?utf-8?B?eWpmZzE2WDFWbU5FVXpVMUVncVl4QWRJcUVaMUwyTXpaL0t6RW5vNkJ5UHB6?=
 =?utf-8?B?UEhGQzI3bHlJZWFFRzZBbExWWXVVZlFtdWdBVkw5MWczOWJpU2RqY3I4VUJQ?=
 =?utf-8?B?K2d0eU83RzZpT3I4SjVXN1ZHNkNYdTl3Y3lUVzZHeFo3dUJ2eWkxU01XV0JC?=
 =?utf-8?B?WVBiSmR4QmRBVUFpWWtzdktReWljenZMbnlMV2dPTmc0eFFkbXVUN3JtSWhK?=
 =?utf-8?B?VWdORjFEWHBnK0ozWFBqSjg2YnoxOUFrY091OE5QZ2RyNHlqUG9QR2w0WHlj?=
 =?utf-8?B?Zi9YU2dyakJnRm5kc1pYRG9qakRXNmlhMzRnYkVOdXdJcStDMElYRCtHYy9s?=
 =?utf-8?B?SDVsWmZSQnlQZUpNMWI2elZBV093UmUxbWVqcDdMR1J1eXp2Y2NweGlVOWJE?=
 =?utf-8?B?SWJ1M3hzaFBXdHBCY1ZEcnZTTXJUSzFFNXIrZFpNMXdxZ2Zzc1NwaU1EZDRD?=
 =?utf-8?B?OFRkTjJIZHIrOUhXZ2VHcFJ5aXcyTUF6Vy9NZm9TY0RvV0FST3VIdkY2U0Zz?=
 =?utf-8?B?NUQ3Ym5yOTEyNnM4U1ZpRitoaVgremhGeExucjFWa0Y5d3FhdzZac0h6Yy9u?=
 =?utf-8?B?TjF6Unoxay92N3plTFpidU9vcDI5UTZqS3VyZUtYUHV5UHJYemgvWExPaWIv?=
 =?utf-8?B?cW54c1NJTjdSWkkrSVRDSWZEQStBNUlsbWNlY3Rmc1g2VjRBN1ZvNk4yYWJm?=
 =?utf-8?B?OEdxZGcybm53Njg3a3FCekk3ZzlHNzZOczJrcERnM3VRVHk0WUM4N1RJMnhy?=
 =?utf-8?B?QVNOdnE5TU9BQURxdGVZVk8vdUdEOHFxbEloelJETkp2NGNTcnBnUXVrRE0y?=
 =?utf-8?B?WkM2aWRPSnozV0laMTVKOGtIYnl1UzNSMmpEek1OSHkxclBkamY1bzlEUnFR?=
 =?utf-8?B?YTJDKzJWaHcxbStXRDEzNk9NZzZGTzY5YXVsTlFRNlBvMjUxS2dFNmUxYnE4?=
 =?utf-8?B?WjNUWFFvbFEwakc0bEMrQUdhK2FoSEIxNzlic1Ivc005L1RURlpqV1VmRGVV?=
 =?utf-8?B?SEcyOWg0MUljMG1vei9RdTNUNDlWT0N4SVJLMmFlNm1ibSt0SGxxaVF5WjJ2?=
 =?utf-8?B?NnliOFRUWnJGN2lQazR6dDdwM3pMdmU2UkR1cVJxRVlxSi84ZTE4NEtUcVpN?=
 =?utf-8?B?YjhoQWRNUWpSQjJaTXp1SWhocnFwd3FhS0kxTEFQVzYyS0JXaWZTWXFUcXR4?=
 =?utf-8?B?VmRaN2pGRXIvOFFuVEJ1dXdCWDVLOEEzY25pL0FFNDlLcTVKN2IyMVBlOHg2?=
 =?utf-8?B?UmRHNHRCQlhZT3YwTnJDZVNDMW5oTkJJdFp2OFJWNHJwLzVZTUNNVmtvaDU3?=
 =?utf-8?B?STc3dzJQT2ErNmdqZFZMK0FXWmowKys2d3BxVW13eTRvQkxiVnpBTmlyRmZr?=
 =?utf-8?B?ZGhDbUpIR3BTbTZORkZoVlRQRkwxaE9IMmVrdW1IRVJTcG5QbGo3MGgxVG1x?=
 =?utf-8?B?Uk9SSzcrSkd6MFZrQnFjc3MyS00zblg0TkJqbnd4eWxZMmtPSGJ3WEt1Rjgz?=
 =?utf-8?B?WVBJNHZxcDUxUjNxdU04SkxwQ2l4OXVhSTA2ZzA3b1ZYN2F4MlNGWGpaS3A4?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bcfdf6-1e5a-4a9d-722f-08ddf535beae
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:28:54.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPUl9DCF/wl2FtgI6xwj5rjFe5osG6iLaRrvHXZEdgG5b+E+AqYfWJGrdLi0vV+s2mnmGs2zZso2dK0q7fxCH58zR3WXCPFuYz7fq93m5ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6242
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: U7cl0VQpgScjoTe0s_Al3W6Nr-VnpP4M
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c9823a cx=c_pps
 a=MXKEcm+r4KK8PT7sjGsI9w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=0hQyLEuBAHEchtFIIRsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=7CQSdrXTAAAA:8
 a=iePJy_sQ7xn-1A-Ud7EA:9 a=ZkqhsPcilvYJRsZ0:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: XnMrUmjTMngPR7Lf-WMhYYMl-7zVn8FA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDE0MyBTYWx0ZWRfX3m6koTtRBgcY
 4/qseK4EcWyjSAGRciO7aGDr92RTVh1/83pBFR30GrEFwBr3tSILGdjVX6nDe/ueRo703jcqmxk
 uMptQ0TJ0RAz1gJTyPfK0ppKVwhk4fy1ogJrkrSMAbxLQ/xDeQpmeDmw6kU+481kaq7mSl+PaxF
 Dw/n4bWuoIMetUmGFfRLxTabCXlYzzu9E0tKh1ZAaf5I3KIvNTlepo2VM4jrXqI97l8vNtG+oCN
 MQ9GYAHIHnJ6T6W892SQJqWac0YKnckDk1hd0Qb87KcT991nZQY56YA/BfNgzqoUlxKHjOmYy8N
 WM4opn0J4yzAviaysv99OuHVGMwWJF7ry7pSTsv70ToHMuUJP3CgLMrCIZ/k+I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223563

--------------6DEm0Q2Qol5d1b30nCzbv00w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58G7Vk3O2080303


On 16-09-2025 20:09, Ross Burton wrote:
> On 16 Sep 2025, at 15:16, Yash Shinde via lists.openembedded.org<Yash.S=
hinde=3Dwindriver.com@lists.openembedded.org> wrote:
>> As part of evaluation of linker performance improvements in Rust-based=
 builds, I conducted a comparative analysis of
>> GNU ld and rust-lld using the ripgrep v14.1.1 crate.
>>
>> This analysis found similar reduction in link time of ~5x vs ~7x repor=
ted in the Rust blog post that
>> highlighted rust-lld=E2=80=99s impact on reducing linking time for rip=
grep.
> Very interesting, thanks Yash.
>
> Is =E2=80=98rust-lld=E2=80=99 actually just upstream lld from LLVM?  We=
 have a recipe for that, so if in the future we move our rust from rust-l=
lvm.bb to llvm.bb then I hope we could just use our lld.bb too?
Yes, rust-lld is a renamed lld from LLVM.
Perhaps, we could use it if there are no regressions.

Deepesh has worked on dropping rust-llvm and tested the builds with LLVM=20
21.1.0 successfully.
https://lists.openembedded.org/g/openembedded-core/topic/remove_rust_llvm=
_dependency/115274198

However, rust upstream has disabled lld as default due some known issues=20
for the dist sources.
It's seems to be unstable with some distributions for now.

https://github.com/rust-lang/rust/pull/143255



Regards,
Yash.
>
> Cheers,
> Ross

--=20
Regards,
Yash Shinde

--------------6DEm0Q2Qol5d1b30nCzbv00w
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58G7Vk3O2080303

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 16-09-2025 20:09, Ross Burton wrote=
:<span style=3D"white-space: pre-wrap">
</span></div>
    <blockquote type=3D"cite" cite=3D"mid:9F392464-759A-4B10-803B-38FC9A7=
8AC81@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
On 16 Sep 2025, at 15:16, Yash Shinde via lists.openembedded.org <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash.Shinde=3Dwindriver.com@lis=
ts.openembedded.org">&lt;Yash.Shinde=3Dwindriver.com@lists.openembedded.o=
rg&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">As part of evaluation of l=
inker performance improvements in Rust-based builds, I conducted a compar=
ative analysis of
GNU ld and rust-lld using the ripgrep v14.1.1 crate.

This analysis found similar reduction in link time of ~5x vs ~7x reported=
 in the Rust blog post that
highlighted rust-lld=E2=80=99s impact on reducing linking time for ripgre=
p.
</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Very interesting, thanks Yash.

Is =E2=80=98rust-lld=E2=80=99 actually just upstream lld from LLVM?  We h=
ave a recipe for that, so if in the future we move our rust from rust-llv=
m.bb to llvm.bb then I hope we could just use our lld.bb too?
</pre>
    </blockquote>
    Yes, rust-lld is a renamed lld from LLVM.<br>
    Perhaps, we could use it if there are no regressions.<br>
    <br>
    Deepesh has worked on dropping rust-llvm and tested the builds with
    LLVM 21.1.0 successfully.<br>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembedded.org=
/g/openembedded-core/topic/remove_rust_llvm_dependency/115274198">https:/=
/lists.openembedded.org/g/openembedded-core/topic/remove_rust_llvm_depend=
ency/115274198</a><br>
    <br>
    However, rust upstream has disabled lld as default due some known
    issues for the dist sources.<br>
    It's seems to be unstable with some distributions for now.<br>
    <br>
    <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-la=
ng/rust/pull/143255">https://github.com/rust-lang/rust/pull/143255</a><br=
>
    <br>
    <br>
    <br>
    Regards,<br>
    Yash.
    <blockquote type=3D"cite" cite=3D"mid:9F392464-759A-4B10-803B-38FC9A7=
8AC81@arm.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Cheers,
Ross
</pre>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------6DEm0Q2Qol5d1b30nCzbv00w--

