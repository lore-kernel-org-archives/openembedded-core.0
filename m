Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0DCEB5961
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 03:35:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10733.1770780934778234542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 19:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sm8uybW4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6502e9d17b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B1KM1d3516150
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Zsy7c94gEnhpkuF6qyydrje5Ag7z+0sVzYzuUKTZ9F4=; b=
	sm8uybW4ONYxMO09EFaULn9Se+rVwnPIGf9r4zzVDmRmDTTlw6v1c/sF20LwfIDP
	o0SnErSvOrvZFG559G0hnJFxvmsKCXIuk4qCgYykDgl+tW8R8rkfuRc+JFQPvT1t
	iCFBHEedYa9jY9iyDfYVAT3MuM63ghwiMw8RGd42FQt5z8JBvQj20JbDL2kIDUVO
	rZvddX7V0wfv5g2K/CoFxcDDrh78wvNrb/ZkHLgS/V2FpHCizwfAnBy7NfbTUHHX
	jz1WXX7PVDfnpR8Gwpmjks/11iVX5/qiq/ZpiWdL4Iai9E5ztvUZvGYKsH/LSIUd
	j4yiKmY7v1QD79WUrVnDDg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwm8t0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 03:35:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBRYJ/J6eyjrpszmazxUWLBs7lWYo1mblNtGHezswDBpZPOkhvxCRGqqbAwEvutNqZ59EDYEST+cgnncYr3z7qvGFCrcuFdrlR3KI4N1zUtiDiy5LilBBC70bKg8yeUsf6M5wLYf0LSH0j7EwcL0ccLLERhqVQWOs7Ab8asSXFz/jGHsVMU2qLnVFhxXtopdxPsZhaL0/cRJDFUs0EHG3R32AF6TVjefV3FiJ5NuwaQqqTU80s4xre6c83g/g6BcPSO2K+nAFlhak0halSAEWAK6t2K1Mwmb3+udm08eVSqQhchdeUk8z9EqK6X661uOpHxsZL11dnXMI4GDw+kfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zsy7c94gEnhpkuF6qyydrje5Ag7z+0sVzYzuUKTZ9F4=;
 b=rsN7cHp/UMjd4hZu5UxIaAvFHgo723tSqgwS3x0n783tcAW72bfJybZ2Zq2MgqJOll4iRIKdNJmWQYMqFOBuc8S3Qf2HRBc6+l55CXRVxlFxvxSgZ6fQ7ITudLYnF1Fxewdvs2DyceIqCsf9kn9DcdE82t79WVKTyRWqKJbhIs1EKmiK8xxTC3GWcV5mAppRoTWg5RuNaensCrNAVaLW1/F9zISRPTUW60U+ZHzX5dANLI7wSvsANrKGVINKyB72P1t/hp8J5El5IJM9SOzFbHvtOKAIR1rrDLUNMAv94kE33h11WHymR4J8JbY2r3lXQ6EF8dFy6OMSMyYuQXHEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH8PR11MB6927.namprd11.prod.outlook.com (2603:10b6:510:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 03:35:31 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 03:35:30 +0000
Message-ID: <1467c88a-316e-4aee-a7f1-234c1d7dc23d@windriver.com>
Date: Wed, 11 Feb 2026 11:35:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v5 4/7] glib/python3/acl: Add
 pkgconfig to RDEPENDS
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <da290c16e090e47c2a7ffeb9d1ad905b88191076.1770779786.git.liezhi.yang@windriver.com>
 <0101019c4ac0b7c4-72c3c0e1-e0f7-4b6c-96bc-f2045d4d43be-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <0101019c4ac0b7c4-72c3c0e1-e0f7-4b6c-96bc-f2045d4d43be-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH8PR11MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: ceafb408-246a-475f-0d10-08de691e9b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmdmMTV1MExXTFpIamMyN3NJam53cDNUODBLSHk5cFY0dFl0MTlXZCtyam1R?=
 =?utf-8?B?VkUwUkdvT1pCZkxFdFpZVE9Ba1VZazI0SFI3V3hFMlRFaU1IVGVQeXhGeWVR?=
 =?utf-8?B?YTdoRkFZM211MWc0bWVrY0dvdkpISzl6bllaTUg5b1B0SXpEZzlldWlQcEVL?=
 =?utf-8?B?aW1uQm8yekVCdEZMMHRTaDFhOG1GV2tERjFpa2dpVW5XUkdCTmlxY2cxNWNV?=
 =?utf-8?B?dVI3b2VreEkwQnhjRjlrTTNYcUdXTHY3RGJGZ0grZjJDL2s2UGczZE5zbXZx?=
 =?utf-8?B?elBIMlJLV0xVOGlPSmt5cllmZHI0bzltYXE0QUxDUUg3azJQeHpHZmpvbXhT?=
 =?utf-8?B?ZE5HOGdwMlNQaUk3by96dnpHVytsQ25yd1ovUmlpNnpNYUVWTXFxWTVRR2M5?=
 =?utf-8?B?bm5NaWROUDJXWDY2eTlUQ0tMRzh5czNkOGhCbTBhRUI3dW83T1JCRTVKQnZ6?=
 =?utf-8?B?UngzUEVQcURIdmJYSnRDT3FkRE5hMFAzdkRYTHloVWhSQ0ZRK1kxdzVrVU8v?=
 =?utf-8?B?TGh2bStKc2VYWjFWMVVGUU5HR09EcXYrUUhhb2xvZkxEKzRUZjBURDJqbW04?=
 =?utf-8?B?dGxJQURmV1dGanI2RzZUNHJSUXZidHlmZHdtejJqVll3OXRtUjlWN1ovdVQ2?=
 =?utf-8?B?MXNaRE5xbDJNYzl1T1Z0Rng2VzhWY21hMmhEdHNKOC83VDhCeUdDbUtXcWFv?=
 =?utf-8?B?SDdYWTEwM0NGVWxNV204REZRTGJyQ1JvcVMveWRMbG9Dd1JrRXVrVTBUU1Vp?=
 =?utf-8?B?VWo0VENMdksvV2svZkNJOUE5WnllNzRwU2M1MkNxVXVMUUxrUHF2VlQxQ0dM?=
 =?utf-8?B?d0tKYnJJdGFFZ2Jta0Q1VzFKaTV0YTlPYVdBRWl3czlDVHpMTmFzV2FiNHZw?=
 =?utf-8?B?eG1paGFCODBLYzc2LzVSRXF3SmwvNTJheXE0N3l4S3haZzFjdFA2TlNkeUFB?=
 =?utf-8?B?SkVxMzJoU29HbnpWOUpNNjI0ZWFKdUVhR2lYUDdMVU92SnRaMGRKQWVmU0I2?=
 =?utf-8?B?WENDVXZwWnRPTFMyR3hBWUVZSTg0K0xmNkVzMXVJNWZQVWZ4SjNpTm1sVkQz?=
 =?utf-8?B?Q25qUk5kUmM3YncxN1FOa2xKZ00yMFArVjlFYjcyRWxvZ3o0SkROSU00a3Ir?=
 =?utf-8?B?aDBtRk1NVGtKTlM2V1ZEK3I4NVN0SDVncUUvcXBjdnFXZThVcmtDeFcrczFJ?=
 =?utf-8?B?aFBoeGFOWmhaejlxL2hTMXJlcjd3TTBtMzVqVStwampGU2pBakp3T2tCY0RZ?=
 =?utf-8?B?YWNZam5RcVNkNUVNUUJBZlZYU1lEMGZCYU0xT2RkRFh5ZDZ4S2F6SCswd1Rk?=
 =?utf-8?B?ZHpOSURydHFQd1k2b1ZlV1JoVkVmcEhLRW82R3RROXhaSWh4ZzcyNlZScHJu?=
 =?utf-8?B?VHEvRHlpVlFvaGE2eDd4TXRUWHdvQ0YrSkw0M3E4cDIvV3ZTMWxCMkhQZGl6?=
 =?utf-8?B?Z0MrdVlYOVAvbVZySGhzLzMzMVNvdWVpRWJjSUFhcTB6T0JzWUpQblVGVmJT?=
 =?utf-8?B?dVJjd1VJSlA3amltNzZTdkpOdXYvZWVwdERZbCswTzZweW50RXRQOXEvdGVx?=
 =?utf-8?B?MTZXQ0ZTUkRlRFJWUFBBN3BEbUJTQTFaSTVQYTF6UE0yY2dVeno2UmV1L1VT?=
 =?utf-8?B?SlBhS3ByQVJRbmFtbUhoa2NtS1ZWcmMxVllDSnlCUWZPNzFNbmFVendtbFBv?=
 =?utf-8?B?c0c5MTgxR3lrNlUwallITjVCeWk4eXV4RmE1SG4vWHc3a2dJVUpaaXdSQnZv?=
 =?utf-8?B?ZldGZkd2cWNsRGxwQnVYT3k1ZHkrakhOWSttcnJoaTJBTEpzNzNqcTd5WDdr?=
 =?utf-8?B?WEVrZFc1U1RyRzhMNkdma2xlbTZBZ3hyZlJuM3oya3EwQUNGYmdXd2Q3RkFv?=
 =?utf-8?B?VzJZSFhralpuSXFoWFk2V2JaK1VDUzlnZEtIdTY2U0lVcHZqQTFBQ2pTWXVD?=
 =?utf-8?B?VVFjWXpSU1J5OTQ4ejU2bTgzQU1ONTJDTlNucjhrY3k3bjNMNWs1aFlmSTdS?=
 =?utf-8?B?LzkyRU55S1Q4K3Q3MjFmR1BIWGZZZjNUSll6TnhJTktOaVpYUVA4dHEvZGxj?=
 =?utf-8?Q?tnaYps?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T3pIc0o1NzNYMFZGMHJHRkx4YStxblAxQUFBbFp6UHZVWHBsM3BXTStjMUE1?=
 =?utf-8?B?azB1QUh0NWNISU53MHUva015dFFoMnBGWGNZUkdockM0YUdVNzk0aUJwR1VQ?=
 =?utf-8?B?UGVxUmJ0SDJjRmJJakxJdWlHbExFSk12QlVrRDV3eXZzK2pNRVhUSEU1WW1J?=
 =?utf-8?B?aHJXZktaZFh5YUNuY0tpUnVHUWhwYWUxSDZMY1A2cEZBVEkyWXl2cXNxV0Jl?=
 =?utf-8?B?K3VSTW9xaUkzaDlmOUh0bVd0NGlnZU5SdE1XVUEvSGRMcGJHcHdKaGV2ZkVQ?=
 =?utf-8?B?dzBzYW83MXQ5ZHY0QVIwdUdjaENmOHVTdUZuZWJaYkhvWW1jZTNLRFk1T1Rh?=
 =?utf-8?B?VVVQM0w4NHRxbDN4MkJoOVZDMTVVMDdpSXRDRHpSaVlQRUdCMlQzTU1IY2xh?=
 =?utf-8?B?c1dJSkZacmozNWROQ29LUGZ4WkNOYWlHNVJOZVNUSkFVYk1yS3Eyd25ScXl5?=
 =?utf-8?B?VWpmbW9hYng3YzVuNEEwdlJLeVBoVHVXUGVGN2xiUENKam9NVHRpeGlNTWo0?=
 =?utf-8?B?QU1lV1VCTFhmY0lkODNXclBzMWZEMmtHNFd1dzhKcGNKSms4VnZ2eGZpSllK?=
 =?utf-8?B?N25mUm54RXJRck9vTHZsSXZrNWxPSkhrbDFweDJiUHhkZDRBZGZnY1pSanQ3?=
 =?utf-8?B?bFFoNmxDMjdQbHo1a2RBRVJGeDVaUjNuYlNRMjBEa2NiMTZHQnF1b3VtbDda?=
 =?utf-8?B?OVRibmVjTFlWRDBSbExGbjFXcG9xTXBiYU5kcTVZNDBkM2kzZjVhbE9heDNx?=
 =?utf-8?B?NmNBS0ZsSndCSENLdTlUTC9iZTFVUzR0amhQZmhKN2wzN1Z0YkZKdGNtcFFK?=
 =?utf-8?B?aDd2bjVNbHVXQzliZXhRR05WcUdKdEdsT3FYTHRQTU9nd1prS3ZxZlI3SHdN?=
 =?utf-8?B?bE93WCs2eHFBZ3QxZzUwaTd4MXN1TzNKR3VhMGkxNEt2WTVjenY2VmNUemFC?=
 =?utf-8?B?cmxRVVhaZEtub0lZamJXdW1ieklGQ2VvSkNTL1dFejJpQ1RNcUdERmk2MHZz?=
 =?utf-8?B?VlB1NUhYOUVQTVpNdUowbzMwTW44elBpQ2JYcnl2a01tdWtBU0RwR3BoY29R?=
 =?utf-8?B?KzltZm54VGRMM2hoSTc1cTRyekdqMnp3VTh6S2llSFQxU1NXMDBQTGhhcXVL?=
 =?utf-8?B?WmxSSFRzYjl4M1ZjcVRIV3BLZ2xBUDA1b2RObjVvcHpVekZ6TG96UW01U3M3?=
 =?utf-8?B?ZHBkZGdvVHFua2hEeHB3UUp5WGVNOWNWREh3bXdvQy9IMlJKWHFmZTZVTjdy?=
 =?utf-8?B?WXl0bEFwVGhNdlh0ak8rZE82SWZiNCtjak9TaEorSnZIQkVmU0xKNmdiTHph?=
 =?utf-8?B?MUVCTW5ZVmRWaXJqWkViV2FtUnRJOW9qUzZVdDdtSU9YeEZTWGk4Rnd3UjF1?=
 =?utf-8?B?QlEyTFJSZEF3T01Pc0RmZjA4OUh4SkRzWUpvMVJlaXFyM09wcnpXcE1lS1k2?=
 =?utf-8?B?eFd0aTk2aWxJaGdZQng3SjM5SXNnT094TElpNkRmQTZGSDRiSWpnbDlhMWlx?=
 =?utf-8?B?U0s0d3dJa0pVS1BEdEUzbGFvSlo1cEJIemhROUpqQlJyZTZNS0NISkhJcksz?=
 =?utf-8?B?QURjZmZvMUZxR05nUlJ5TzFOc2VaS2gzV3gxclBzTmxvUks0bXIyQjN4UlZp?=
 =?utf-8?B?SzRKTDJCVWFOOXBvbWhLRGlkaVg5TkRObzZST1JMdXRoek05eHEvZnlBR252?=
 =?utf-8?B?SkJHbWZkQ0pvNXNRRWhoaHg5cnFVczE2eFgrWFM5TncvTTBlUEd5b1JXa3Av?=
 =?utf-8?B?R1dyRWxEOEd6d3g5aVdjbDRaTHRBZnFtZVNCVDNHaVZ2WTh0OGdUSzJ1b05R?=
 =?utf-8?B?OHpMc2xXYThGNmEvNUlMSU4xaEVOaG9SQjJlVTgwSVh1OFhmakpoUk1WR01I?=
 =?utf-8?B?cDN5R3VhTzFiM3ZUcTcwZnVnWmFBa1l6dVJQRm1ab092ZTVySVRQS3RoZTZE?=
 =?utf-8?B?UWY0MXBoS1VpK1g3UHMrdUVjdndJdHBVZ09JbExzdHN4NUFHamdEaFhWZnp2?=
 =?utf-8?B?VE9SVHVVYWVMQU9SeVRVak1sRytiU0RaMXdhUmNrNWxITlBSL01hYWpubHpS?=
 =?utf-8?B?N1VlNmRWYURRbWliOU9FeXF1a1Y0SkpocjkrNzEwcmIzNXVTZUhnTnZ0TnZI?=
 =?utf-8?B?UDRsM1J5N0NtQzdvQkEyRVRydWYxK1VGV0VPeW5uOHdURzNOMVVaaGJ5M3Qr?=
 =?utf-8?B?L1EwSkJsbHpEYWRzZzN0RCtLUm5pRm1CRE9Qd0dmcWlITnJuY0szRnNoMUQ0?=
 =?utf-8?B?cm45c1ZEOHErd1VvMUJhUks0aUxBR3RNdTUzR2QrNE1WcjJUSG5vUnlGMDIz?=
 =?utf-8?B?UmltZHhKSUJEWEsxc3ppRXl4RzgzdXlMUm1HdjNpUG5uZ0lCdGlXRGhzMUZE?=
 =?utf-8?Q?foAwZR6MYOYDL890=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceafb408-246a-475f-0d10-08de691e9b17
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 03:35:30.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CRSIY/zOdUwlJZB9TyipfrLfPZc1uJH7ffPs3kMr+095J2IanfzsWmeuqnvr0HzXFtTuY5/mJzGKPNqgr8kn35YU2AE4dh4Z8Xzl6YuOQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6927
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698bf905 cx=c_pps
 a=V6MklVWPegrOQeIbI7BYwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=u321q_6X9ciCKB31TwwA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: qrzF6nrTVc-Bb2dKjdwe9Z-78qD2P_Kk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyNyBTYWx0ZWRfX1HptHXd6KzBr
 pMxTZbEvW5/Gd4ND4/qSeN5Ph+a4GzUEu/OhHa8+U/eRSRQTLVyrojwaNvIYFyHX+CzOoKiT2Sh
 JA1vhWRbowvzrLxToozymWqOmpShML/sTTtGyp5RBzrV0QA1UATXBjTp+OkXQuXqphiznkhFMPY
 +2XyYUqZkdn6P9gF5zXUvrpbDm1Bh4i/JIdnfSCXGklPY1xH0oikDIbHc45daIWNCRhgEoHmZSi
 0rj5qhdKahuEK13PCQhuz406a9n4nj3kv7dLrDYZiumwnRg9NImIawykeT/NIQRjJGJ2po7tyo1
 HsS2PCgpTAYAoQaQXga0cqBWC0vGKk5j7fmEEKkAkWtMQpuJRaF5RoBqvuAyAgu06hNVAGc7Z9d
 I/FEhKFRDdzH/oqCCIdVPD/1e1E33Ha2mlUns2NWsTbo7YUSfrWSL+bkAxcPqwuEqpV0iPfb44W
 laPkcxNh93sLILgDiAQ==
X-Proofpoint-ORIG-GUID: DSaSK8WSl88miSHoo7Ppa20aFciAfb35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230960



On 2/11/26 11:31, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/v5-4-7-glib-python3-acl-Add-pkgconfig-to-RDEPENDS.patch
> 
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_off_by_presence)

I added my SOB to PATCH 4, and updated in the PULL:

   https://github.com/robertlinux/yocto rbt/rpm
   https://github.com/robertlinux/yocto/tree/rbt/rpm

// Robert

> 
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!


