Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08724C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 14:40:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53647.1748356835954384990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 07:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7242073f8d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4mPSk025233
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:40:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm2fed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:40:35 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54REeYk9008831;
	Tue, 27 May 2025 07:40:34 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm2fe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 07:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYMwyUsrR6vpQVaxVHHmAD5POS2M3AVKU3+QiykPqToVVUojIcEHvjwepAwkyIFdHe81Y7DSgM/y66LRtZEGzga1U1JqOpscrEvaYRDSGk4uMVOtx3dHWt8GmUCZjMyI/KiRnUit6HGzZq4LEOakUbabsHq2U5pvEKZy2oPx7UXVE//CwLGtkkLEzkVDfmPcyRQ7GqVmTG1Wyv8DhwMFhesNotFvE9j7UKtCerTd6l65TUqNpX6dJXwfDMnoXdcAAL5V2BHoJSuGk4BPFEH4Sy9IWJuq8uUebEs7ambsaazYK0uxDkTXlrvi56YnB7pN472wl3OE5/f47pO4nCmTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26bY9XSkZ1HlYCYc3no78G9KyHDxJV1nHXB8is6aI6Q=;
 b=uqFBIF72vTvqPUYSFg88p5G0m3DKrvNk/YIIFLn01hSL9hWeK0RuawpH6y6S9bkJ2STEI8PxdB18kQqel6BuIsu+R7URhM3SUanbaGQqYnQ1MnEpxBzwN9qHOfg4C7mjAJFb31jbzQWTPnviNEkrha+gVsBeKhrHoSACFR9t0pSTfsCwq/2WDGWdYJc8fOkrdCffQCUdOYmOpnW9jwEHyIzsdzaizb1d9kx04ndr2N/PRAd5v0BYz1qLZpbk9sHVxEsc7E0b63VLBs1IWqf+o93rLnvjBx2egXB4GcwqP9iQOiKLL5i/JpNPmfQl5PPmYRXS44FyDc37Kp2hSkvOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8543.namprd11.prod.outlook.com (2603:10b6:806:3ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 14:40:25 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 14:40:25 +0000
Message-ID: <d550759e-95e2-4be8-bde6-7af2329bc12f@windriver.com>
Date: Tue, 27 May 2025 20:10:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <184363192F51E64D.13855@lists.openembedded.org>
 <CANNYZj-tN0ONWxYPb9JJms3hj0fUp_9i3xhwd=GtXsEdkXb7AA@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj-tN0ONWxYPb9JJms3hj0fUp_9i3xhwd=GtXsEdkXb7AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR15CA0018.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::11) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: ae94c7f4-aacc-4623-728b-08dd9d2c6ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UVIzb3g1eWRVVFNCcDVJSW5PTXRlYmlmVTk4V0ZiR1pPRHZZZ1hldWswa2N4?=
 =?utf-8?B?eDk1L3YwWllXRUhTTkNRN0RUbEQ4RzRRaEtpM0lWVjFUUnlkOTY5QlJuYzcy?=
 =?utf-8?B?eGVDSmV5azJ2SDVIbzI2Q3hoaUJoWGd0TXB2dGM0UUJacGhBRXk1UXFuckhj?=
 =?utf-8?B?N2gwMTBzMnNlMndVVGRqSEIweld0bHFaTHAyRWgycnp1a1EraThFekpOUGhl?=
 =?utf-8?B?Wk9wcjFWZXY5MSthaHJyMUhJQWlleVlzRVluUXdoSXM2NGxwdUVMT1FZZ0xC?=
 =?utf-8?B?UVc1K3AweDRTTlRyQXNWQnJGNFpveTFlR2ZTWTRaSGtNa0hJZmN4ZmxYV1Z5?=
 =?utf-8?B?MXdGcE9USVhtZ1RZMExJYUtIU1RrYlhhaDFCTmtrd3prTlR5N2pJV1lCZklh?=
 =?utf-8?B?UVovcWUySVRQV0o0dEtFNVQxc1ZXQTM0REdUUmphdG1VdnZSQlpwbklBRTVS?=
 =?utf-8?B?S0pPQ2dWSlplN25SaVZzZDdRVVBJMDEwM2NCak9UVVBHV1F0cjJQRkp4R1Jk?=
 =?utf-8?B?MEZkbW4yR0h4bERQbW54OW5SMGRUekVIdnVqU0lnMVdaSVhmK0t2YzZDd2lV?=
 =?utf-8?B?MlA5UDhabnhhSFEzN1A4ais4Sm5yTisza0o0dWhpaDJxYTRMdFJnQWZieEVx?=
 =?utf-8?B?N2ZqWG14OUdlK2Ria3FvRWlvcGp3dHlWR1dmUjRvQVRmMC9NZ0dNOGFVbnhz?=
 =?utf-8?B?dmFqcUhveTFCY3RzeGdIK0pjVWx4M2tJK2YrRWduU3Iva1hJQ0VONDR6T3pp?=
 =?utf-8?B?RnFZVVUwOERSMEdzR0VuSzFkQzRYTXhsUUVNbkFMRXRDdmtaSUxaNkZZSXor?=
 =?utf-8?B?YUNIRllSUjhOZmRLYmpBYXZGdTAyVnhMaW56WlBOR3Q2eVVYRXdScldLOE9m?=
 =?utf-8?B?eUJNVGpSZ1ZialhUNmMyTmV1dFdrRHg1SVVnK3RNZGJ6QllSTzFHMWVuQkdW?=
 =?utf-8?B?cXYxNWZyMG1HQm14c1JvQnd6K3RzWnYzUEowSGlqYStCKy9WRDdLL1RtTG5D?=
 =?utf-8?B?ZGsweTR0SWNYQzAyb01SSTQra1Jjb0kvbytrUHFEbmFobExNcnJJNWNDTjdV?=
 =?utf-8?B?NWxtR2s0b3VRTSs5ZmFMNDdZdWZvazZvanVHdWFLci9xekN4Z0dKQ2k2MUlG?=
 =?utf-8?B?a0plK0JZd1FIcVhJVjdoRzVsV21DajM3NjNuSjE4Z1JhdjNNeGpNRndzd2hk?=
 =?utf-8?B?NWlqZmVzK3lPOVBQNmw4d1ZOTVcrOThrY05SbE1Xa0lzR29uN1NoNzNITkR2?=
 =?utf-8?B?R1VRbzZtemVFTUZNbUNWTkdUU25xdkpDUjRjYXdzc1FMRGpxN2hReXJ2ekdt?=
 =?utf-8?B?WmczY05KM01LOW1UdHVWZXNmS2NSN0ViOE1Id29ZdWh3SktmYkpYK3c0cGV1?=
 =?utf-8?B?QXFsQzg2L3NiSUJsdXNHSGMwZTQzczZYT2tNTUdNOGpiQ04wSVArK3R3SGVn?=
 =?utf-8?B?UDhURkdCWEpkWWRNeGFCbTdyTW9semVramZMbWl1cVlTNVFzclRYbHFsNUM5?=
 =?utf-8?B?MUxydUJ6YzhUdUM2OFJES2dZQ29ReVJmbE1SMXQyc2RnNlV3MGxkem9zQkNV?=
 =?utf-8?B?V1BqRDMvSFJHakxWTjZyYnVybGV6OVdnUlBNQlduN3pnNXIyVzdEbThsc0tk?=
 =?utf-8?B?RjFmQnQwbjlDTGMzZFh2dkNob3dINFIwZG5Ld2R3OWJla1JpYlhKbjFwUWNE?=
 =?utf-8?B?SUNKOFYxYzNBRVpjZjFKOGJKWEkrYVN3MjR4cGk5ZHhhS2syKzlTVmpkMkhK?=
 =?utf-8?B?alZzMGpUQzkycXJvZXVMZXlqUVBpbDVhd1B3R3NBMkxMbFBtMXVXMWFlMGc0?=
 =?utf-8?B?bHZvS2VuTko3L0pwdTh4NzB3ZmM0cDVhSG9Fc05qZ0JMSzVoOUZRWVdQU01P?=
 =?utf-8?Q?eOyJ6RyAHCwbm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MzhpN09GV0o1SWdvb0Z0RFRxRGdTQWNvZVFvaVVtMGgyMXdmRG5TTlV1d1RM?=
 =?utf-8?B?VlpMalRZUCs4eThlRHViSWdncnRDbU9oTFJoZTVheHBWbk43OHh2VzNPTXB4?=
 =?utf-8?B?WDh0SDJsOEN4RnoxUUIwQmdSSTBpajZEL0xZQU52aStzNE8wMFhUMVlIOENy?=
 =?utf-8?B?SjRIZEFaaEUreXN1aXVqeTR1UmZSdkxSdlNVcWNNWEpWU3lPMEVpUi8zVUcz?=
 =?utf-8?B?U2FUaUt6UngzVXUxTHVkZmtTWmMrMGFpY0wyZE1TNzFlRUdlK0xOTWIvVEtV?=
 =?utf-8?B?czZZTDVrOThLRG5YRGN1VU9Cemc5VkUvRnZQMmhST0pEbTlzUEZmYUhyVlZ4?=
 =?utf-8?B?aXVCZzFHQlc0RSs2aldMQVhqbVVHMHV5YVdtdlZCbGNRMzZScnM3Q3BnTmdl?=
 =?utf-8?B?OXNrdmdvV1NwT1llMjhkQlZXV21yRTlrRGJ5Qm9pTXFlNWUzSTFZRHZURWtU?=
 =?utf-8?B?Tm9vSS91NHdJWWdPQUFoajZFdHIreTJ5V2w2U3NLdU9LMmFFeS9qZngwb0p3?=
 =?utf-8?B?TUs5dzdGQzZIbHNYOTVJT0JtRkhUR3pjY0xiL2syVXZNeTluc2pSa0RlRUtH?=
 =?utf-8?B?cCtsR2xYTUFrTTVxRlpHRWJMOEFVL0wzSmpWNzlMU2pFL3hwQjcvQWFJMU5z?=
 =?utf-8?B?Nzc1K3d6dkNJMzlNR3l1VHVobVNTS0xQVWxjU2YwdjhvOVEzZERST05SeXRm?=
 =?utf-8?B?M0hCaHpWVUoxMVJkSkF0N3NQVnowaUkzL1Ard0laL2VXZ2djVjJPdlVsbWgz?=
 =?utf-8?B?d21tQjBBQzAvVnNMSSt3TVFWdUdSV0tVMjhmc2swb3ZscXJnRmVCL2pFY2hZ?=
 =?utf-8?B?TjI0N3l2T0k5Ym02aFlCR3NuL3pqbjRGYXB5dFNuYUZGYVQyZDJrK0kwWU1x?=
 =?utf-8?B?L3hKLzhPMUhaTi8xdTNqZTFGbCt2ejNzaG1DSldRVnBLdFJqRnZ5S2pyVE1F?=
 =?utf-8?B?bWVMY0EvczVNOXFBRjdybW5GSExXT0p4VmtiR3lNdUVSR2NsUUk3b2p6ZTJv?=
 =?utf-8?B?YUh6cnpoWFo3VWYxY24wbWZaWmtYZjlDOVpMeTJDUU00U0FrT3IxWXl6aTls?=
 =?utf-8?B?ZHhKbHJrcmRYbHJ1UlF1SXNnb05JdzlZM2pDUWdISGpJNjhkWXlJR01RSEVT?=
 =?utf-8?B?aU9nZnAvMDluMUYyUThKYVl3S2s0anNHQnh3TnBlbVh6OHBtcDR3QUJrNVZz?=
 =?utf-8?B?M0hZYmhhdGV5RHE4dHljNThlVHhIek43VkpOWjFSTGowcnBCaFJkdUQ0Q3JW?=
 =?utf-8?B?ZWpGcE05UE5mRURJejZjRCttY01YNTdjSVNHeTltMVZwM3NwSmMxRTEzaitu?=
 =?utf-8?B?ZVNSSlc4VkpONmFJWEVaQ2dFUmVrSmMyZlAyalZNdTdNQTJOQ1pCcjNUTUJj?=
 =?utf-8?B?V25JcXAwK3NpTlZzOEhwcmN4Y1VpQ2tPcGMvYzllVzdSRnJXdGJIQWRiUUIy?=
 =?utf-8?B?RWd2aTRTR0ZtRU5jdDZob0VhbEliMWJFaXJwdkVRQVcxeXd4QlI2OTA2N2Y1?=
 =?utf-8?B?ZnliNy85em5iWGRoTko2Q1JpeTdObE5FRlZVMkZqU0lpak9yZHpmT0dPRGVI?=
 =?utf-8?B?blhBUk9yUnVUNm5tTnhBRUlQeWlrOVVaYjBvUXRXQnViQXgyeWJGZHJicys1?=
 =?utf-8?B?bkxuclJ4T3I3ZExrTFV5OXk0NFdUYnpjVDVOeENwSm9rTkswNFNCWTV1aGk2?=
 =?utf-8?B?dmNqK3lzRzdDWld6N3Bjc1A1WTdOeEoyUnhlMXo3VUF5UHdXSkRWSTVVazIr?=
 =?utf-8?B?RFUyUERTRVQ0TjRzWFhFUDFDSG5VRHA5RUZLb0VLZ3gxaVRaYnhlMUpyWWoy?=
 =?utf-8?B?ZkYxaUdqT0srZ3hmcHdCckF0bWhrQkdyR211ek94a1BZWEUvdzZHZFJHNSt1?=
 =?utf-8?B?WUZZc0JuSnFTOUhGem9rSTJxd3ZwYmVEN3dhSGppTXlTakpOQSttWS80Q0ZJ?=
 =?utf-8?B?bnV3WlBWU2pjaENXMjNVcERqUjRMVUV1SU41cUhjUU1XbUpEaDIrT3Awd1ly?=
 =?utf-8?B?NW1tLzE0RTUvWEhxSkNkMUhpbXZrdy9qbTJ0UzlLNXEvYkRFbGY0R1FSUkVU?=
 =?utf-8?B?Qk9Eck43ZkFSVmRtellzWFl4QVJPdjNqNEN4aERLMHVzd1ZZTGFHczRKWTRK?=
 =?utf-8?B?dmNSWTVqS1F1YUlUSjZjRXNiOVcrTitZZHRtN1hvQnJleFgwL2xHajRESkhr?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae94c7f4-aacc-4623-728b-08dd9d2c6ada
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:40:25.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: in4A+YeROFsvELmSRJuR8DujFZ0bQ20G+jOodSGce6Wv8zEx+tAEbtMJp7a3+zFTO2T8AUBIgIn463TBB3IvZ0Lwq7CtLJrCIHcX65/ZaHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8543
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6835cee3 cx=c_pps a=jp/Y3J+1q1HyW0yI7KzyLA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=aF86MXKbvCt3vlOhc7wA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyMSBTYWx0ZWRfXxy9xumixkyTl +PgmxWallLmtrNqbmIV/HxZ6nvFMvIz3YRB4Sdgk6eOwMhi3njFbc0aCBtSQOCVyx3ySPgQZvSa cO2QWtdqlKBrp/PV2/381YFIUkKkuJRHt7jcU1rsTpcHJxFunlVAmUn7ePyOfM3jmaZ4l9AHRI2
 V7MZ4vPsRau+5GfCjBXXROG1CfCsKY4LM2kb+XsbFKsSLZTOVt64pydYGamZRNWBKD7Bz/FPo5d M+D08ug3KYrllrpn3F3kxxg05vexd4UAubxi7x5eK/fCofPbN9Ohe+GNcpCA2TnJcVfwZe67Gtm R+7GFgquIOxNUKboMbjEXK4RHRIoPkq9dwtH1cIRAJU7eJzDUzUKFPL2VbdDXryGOwjkqwwO0e4
 0vx7WSkXvpTE6A2fkbLfE9pQMCB0JJ9w614QID9drP9aLLRpduNDSLYw9+nSjAxcjUWW7w1i
X-Proofpoint-ORIG-GUID: V0sZjNa6EspQ5JpySJ2eaPqLzx_70MPM
X-Proofpoint-GUID: 8F5jlt-G99Lj2PrM-Pcps16JKIzvas2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 14:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217308


On 27-05-2025 19:10, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 27 May 2025 at 14:47, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>
>> I'll try to see if ldflags issue can be addressed properly, but first
>> I have to note that there's a significant build performance regression
>> in rust-native: where 1.85 do_install finishes on my machine in under
>> 9 minutes, 1.86 from your branch took 23 minutes. You need to
>> carefully review the logs to see if somehow rust-native builds the
>> whole set of tools, rather than just the compiler. Or if it's doing a
>> full bootstrap, where 1.85 is able to avoid stage2 because it's
>> building a native compiler.
> Target rust as well regressed: 18 min -> 33 minutes. This does need to
> be addressed :-/
>
Hi Alex,

Thanks for reviewing the changes.

The Rust build now includes additional dependencies such as pkg-config, 
ninja, openssl
which are required for building rust and ensuring better compatibility 
across various build
environments.
(https://github.com/rust-lang/rust/blob/master/INSTALL.md#dependencies)

I believe the increased time is a result of theses added components as 
they can trigger
more comprehensive configuration and build steps, which naturally extend 
the overall
build time.



Regards,
Yash

