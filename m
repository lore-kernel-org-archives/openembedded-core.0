Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C92CD41C1B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 10:29:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6439.1765448971545960601
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 02:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nKJr/kBn;
 spf=pass (domain: cherry.de, ip: 40.107.159.64, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF8TCP4SOOMzE87Mjp3dM8b0IXgrB0Y77itScyoAb9uSxCXwTIdvcMN+5+sBgiMcBbuhLc1kg/xP9XeAX3cqzJexv9knaTgDjFfae2qDBA0yr81mTIcum0et35K38ftnxRQBDyIYUALIm1kS9LpB4X7wlUzTuPfxybEjkWGL5+v/32L5eT5kOYfqm5TDdyoWpwHuTWxZE3Z6vsTh0qBLVTboUhhc2Fisr2gj9yamarVfC6Mmqykpbp1hDXsMV/bO7L8cyHmPvB+x7Y8Kn7wgTcUZXNhjvrlhqgEYqrm4uiU7m9fKdtjqYv5u5FPuNmGirrJImDTu8vJPVx4IESs2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05/oaOKXc7ZndEtXb3cqj5LgwY2KsLRIij4VaCsgJHM=;
 b=YoYFdiMm2419FCposxKOOdSCAdWRXXehRfODUlGKJfFqiaH1lhviIuIfDZk9cp4Wdp1WAVwQKNVUpCzgidwfosJKK2XsmzWMrG4nsq0Or7nxmyC5ahvP85Mm4MdlBISJovnF1dZzabmvXbqiAQa3I5+enKIWlocTrXIdrFMziCqmfp1K8+e0IhOndnxY/TK1f4bI0NYl1eI9JhRx7nAkOoo5qyuisMhXkcKf4reeQaUhIeGhICiTrB7WIgmS99al1VWQJggTvqevVlJM1cFNrmkz1uL47pB7e0Tx0najzURipu7twje72M+5JN58Styzplld+7tENUpnRlZFiYNj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05/oaOKXc7ZndEtXb3cqj5LgwY2KsLRIij4VaCsgJHM=;
 b=nKJr/kBnWLdE0M72vGAF2MT8T+iqptJqO2fwBCMOeoJhHDE3rIxbQTU1Kh8qiAIEVfMDwaLi9XSVKtA1GRTSNBzeGs/WcnL5izPJYsU4sNrbr45NVEgji+5Vy8FHe2CXBEOs39vjye7Zpy3v8RRfqlCkniZJdxuL62LJK5hsSac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7899.eurprd04.prod.outlook.com (2603:10a6:10:1e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 10:29:27 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 10:29:27 +0000
Message-ID: <9bc6fecf-3234-4b46-8bad-84d93a5e030f@cherry.de>
Date: Thu, 11 Dec 2025 11:29:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/3] Add HOMEPAGE variable to several recipes.
To: Pascal.Weisser.ext@karlstorz.com, openembedded-core@lists.openembedded.org
References: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251209132208.402718-1-pascal.weisser.ext@karlstorz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0027.eurprd05.prod.outlook.com
 (2603:10a6:803:1::40) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7899:EE_
X-MS-Office365-Filtering-Correlation-Id: 896ca2f8-1a5f-475f-e49c-08de38a02979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OTZlejZVcFk3MVZkbE1aVHZldjVyVmVJUDJRRmpKbXRXRG5PVmZPKzFHZitw?=
 =?utf-8?B?ZjFrOTVYTElMM2VBam5aaWtSckxNVHVTdVZjYTNYSUQxVGlpOUNqQ0hxYUQ1?=
 =?utf-8?B?NXhHcVZmUDZjN2NrQk5RT1ZKS3J1Sjd4eEZCMmZkY1doTThSSGswZldMazdK?=
 =?utf-8?B?eTJ1ZnE1N2k1bi84Qms1MzVKRW13dy9RV1I2UTQ5TWJSc0gwNDMvd3NnRUlF?=
 =?utf-8?B?UkVRR3FycmxsaFV4WGJ0U3o1YlJPSHU2MUxiUGpLR1VuOEZKOW90QkVWNXF2?=
 =?utf-8?B?Nys1U1BWK0xGQlhuUlZDL0YrVElPYnlXbXpRWVZrdlZWZnBvODRJaGl6aEV3?=
 =?utf-8?B?YkcrZmlWeU9ySmJReG5jL280bnIxSEVFRmZIbkpjM3pqYlBCUmQvL2ZKNks3?=
 =?utf-8?B?SDRMOThtVS9UalVueThPQlRLTUswbUpIZG1Ib0Z1RzAvb1MyQTQzRmNnRHor?=
 =?utf-8?B?RHVKeDF4WXNRVENnbWNyYldEUjkxUjFUTVN5V3B2endyWUFJajBqRnV5cXJ5?=
 =?utf-8?B?dmplejMzZkVQSXFmcU81MDhhUXFFeExsUEV4Z3plTnpUcFAvd1A3MlphYXFM?=
 =?utf-8?B?UzZZV0xCQWQxYXZqN0t5WU01M1VDaVk1a3RyQk9PYzdBOGEyM3pHSEIvL2VL?=
 =?utf-8?B?NXp0OGllN1FubStVTHhSc3BjL3lIZnRIRFppd3dHYUNLdFZmQ1laVWJxRUFP?=
 =?utf-8?B?QkEyN2g5a09KcE1ZWGF3R1g3THozSnZWSGMwY3VSMk04ckJlamZCTGo3SlYx?=
 =?utf-8?B?UHI3a1kreFFjejJ3dU1oTFBqQjdBaHBubDVIS1FaWmh4aW1BREQ4MjRLS0t1?=
 =?utf-8?B?bElFTjVrbDVWejlPK0tlbW9iUXUyaTN1QTFsTFlJdjE0NzZZaFpEamp3dlcw?=
 =?utf-8?B?dk4vcXRaNGlDaStxZkNPL3JaL3NDUDVLU0xNdVdOUTJKWG96Z0pFYmdmZi9P?=
 =?utf-8?B?VVJQYzR3a3FMUzJKc2tWMHB0V0xNT3owUDhEYmdyMFppZ2tCVlJlQldjMlox?=
 =?utf-8?B?REM1Qm1WeW8ramYyenJuclZIUmxtVUN2dSt0ZHYyY1dJa1lBbklYZlgyR0M3?=
 =?utf-8?B?RDd5cW1ZdVE1R0I0dWNhN0l2bjllZ2I5T2J4eXU3OGhYSS9rODBaZ2tWRkcw?=
 =?utf-8?B?VzBacGRBUzdLbTRmemxPb01pNVJkZktzZnFvNFIvL1kzZTBGN01BM2d6WUk3?=
 =?utf-8?B?Z1pBNWMrdW9hdjFsL2tYT2RORlRacjd0NGxTVEtMYmovRUFBbTY1NGVDZSt4?=
 =?utf-8?B?SUtYQi8vUlR4THNFY1VPd1A4YkVUdURINUZEWU9qWVRRbHliZEZ0WUREMzRx?=
 =?utf-8?B?WG0rS1B3WUU2NGgwVmRET0E2R1d6Q21lRGdVRUhwL1lYUTFhd1I5a2tuQUl0?=
 =?utf-8?B?dm5qMmhkQU1tZHZEUnJhNkZ2VkZMNVJycTBScnNjV28wYVh1b0FQUW43WW96?=
 =?utf-8?B?QktQN05tNXlHVHZjQ1JydnZ4eSt2RXZscG94TTgwNUxTSzh2bUl2RXQzTkwv?=
 =?utf-8?B?aHpXVmVYM01XT3hPSllLV2lNK29DYlB2ZnRUK0o3am5iRFUweGkxMFJQWVQr?=
 =?utf-8?B?aHNiT3dUeGpxamxPWk1UUDJxVlBBUFJsMXBUNCt5dFhLQm5vQmNEYXloYUEx?=
 =?utf-8?B?VWYrOFVLT05OMzJRRzl4YmpTRG5Zc1U0cE8rWXhSb1lGd0Q3NWdKak5TTnJI?=
 =?utf-8?B?M0F5eDZjNTRXbHVWb0JjUkdyU1RMYzdmNFRMU09SSHI0a3R2N0I2Wmg2YWpu?=
 =?utf-8?B?MDlFcHNOZzdldlNNL0Q2Qk42MEdhYjVjMnlIS3pESVkyUlgrWnB4S0RjaUl4?=
 =?utf-8?B?TGxFNzM0RTJ1Rmk2eEYyazJqcm1jeGlNYXpwMmlVMldVeEVyaUNNVS9vVUgz?=
 =?utf-8?B?U0k1d1FjV0xsUmZYOGRudEJTV2Y2YUQ0dkppUXFCcmpUalBITjZ5L2RJNmJG?=
 =?utf-8?Q?YzDxZeMQF+5+gO1j8B30CAHCnPNzDmyB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wk9jMWFLMTMxYnFud1JOZkVoeFAySHExVU9Ja2NCRzYzWlRrUll6VlUyc2l2?=
 =?utf-8?B?TVJwY2dnOEJHU08rbzhNRzhMdTVrc1VvTFFiWTFyM2E3amNiSUFLMVJjNlow?=
 =?utf-8?B?dVpLaEE2VUdGZ1JOZGU1dERtSmRCUHU1dVN6UUs0VG1NOFlsQ1NQU2tlcGVW?=
 =?utf-8?B?RFYzT3lsMDgrSkExMzMvTVBPUU42dW9abEVtQ2VqeEY0YWJSQUVKa1ZDTm5w?=
 =?utf-8?B?aVFYN2FpUjlicHZFM3o1Q2hQeEx4czFIOHBzZTBCb2F4czYvSzlnblExbzJ0?=
 =?utf-8?B?T0tyMExkdWtuR2JmbHlWRnBUTTdWdnB0Nlk2SXVTMHJpRStQRndod0JPNXFz?=
 =?utf-8?B?aWxzcHZOQTlEVUpPNmFXbUluT1IrVmNmYWpxTEg2MVFuakV3MFZrMHI5TEhF?=
 =?utf-8?B?Ri9sRFlxU0FqaGlwYVBuWTcwSDdROVdSN0ZHa3IzNzVYQUZrQTUwZzJDM3F2?=
 =?utf-8?B?YmJ5c1g0WGc3S1N1WUU1K1NOOHlqdy9JRHJDUEY3SnVNcDM5b3BNNjFRV05Q?=
 =?utf-8?B?MFNON1Bta3RTaDYxT25PcUljeFZMclU2MmRiaE9Gdy8ydGUyQXNqc0xySk90?=
 =?utf-8?B?cmtDazBlc2N5blkzeUN2N1l4ZXBZS3oySHVEVmx4ZnM3KzNBSHpQaC9ORWlT?=
 =?utf-8?B?M1RZZjJWbXpIdkx6TEcyQ1RlM2JTc2xQRCtZT2o4OVdtU08xaTA0QlpDbEll?=
 =?utf-8?B?K3hraHlxNWltTm5LeCthMi9uUmFTYld2b1BzQmwzSlBuSm5PTjNCRWdjekF2?=
 =?utf-8?B?MHlkdEhMSFNzV2JFRXFsQTJ1VkRIWWU4cGNtR0tNcjNIaHI5bHd3RGN5aWZk?=
 =?utf-8?B?clkyMEJwbkdlUW1EZXM4TmY4MzJwOERzRHFMZTZzckdOZmg1YTdhQmFBQmZP?=
 =?utf-8?B?VGhmL0MrM2lzbTNsckdGdGNtZVI0MXd4NU5UTktDeFVqRjBRbGcyUE1XR3Ex?=
 =?utf-8?B?T2xDWFJ2ZFlObDdISTJxZEZ6aVBjWEdXd1hlVFdoTTJsa0pjWUtQTDhHbGU3?=
 =?utf-8?B?amYzblJYcUJpVEhFRXp4VitIb3RwRjl4bTFhcTVPZ2F6OG4vQTREdENHdHZr?=
 =?utf-8?B?VnFKMXp1bVppQkFzREpaTlpRSzUxVGJVdjRjUmRrL0NxSXpsMHdNSTZrRmZE?=
 =?utf-8?B?aGcraFJUUHhuVTd4ODY5MUtCUFhhYkIvWmlvamNPazd1ZmU1aW9hcXcwbjBo?=
 =?utf-8?B?Z2JLY3NLd3FPSW5aQzVBVjBKa1dWdU1jemx4L3ZUeWpLb2VPak9Ia2dSSEpM?=
 =?utf-8?B?UDU4ZStjbGpZWWZjVFJXaFgzVEkwN05RKzZlTS90RFp5VGIzc0doK0tHSU5D?=
 =?utf-8?B?bGZIcWdVbi9mQmxPVDN6MVROdVFrR3BWTkMwK0s2MGdoWmg1eVhYNzIrV2NG?=
 =?utf-8?B?bkFFTE1mQkx4Nkllb0tMUmNXWjVqSG1CZlR1d0NKcUhDSGFxSzUrR2xFUE5i?=
 =?utf-8?B?QW96dURDZWhja0VYNytxZnBUbEZNZ0RaYlBsUkNqZkZGY29CWHZSYW12TFBn?=
 =?utf-8?B?QVZQZTYvUW0ySStGdTdBZS83aldzWjhSdDNjbk9USEY4cXVBUm0wc1B3eVV3?=
 =?utf-8?B?M296QkxOSlFIRysyYWVyTHNTQjJiM3BIZkJIMGd2SzMycXlETTZXMHA4M3Aw?=
 =?utf-8?B?VGwxY21BSWxmNWg0UzM5cUJFZUhaMWovM1hIQXVQSGQyREtYdlhlZjhKLy9U?=
 =?utf-8?B?WVpwWDNpbzd2bzFnQXMrcERpTVVoVUo1YWU3SWNSUlVKNWhZWXJaWUZjTzRv?=
 =?utf-8?B?OUN1U2hzTklmb1M0L2FRcHcxemlXSkhTaW5EbTI1UCtkMFdTYmJZbXludFRN?=
 =?utf-8?B?bGdxaUpJNEYzdnhkTDFQRWplZjlGUHZndEdRQnJiSXgvcjNwWFNyb0tsL04z?=
 =?utf-8?B?cXFCOCt2azNReVZxaDFSRzY5a0F1dDV4S2JHYmRDOVZvOUhZSHg5aXltcE5T?=
 =?utf-8?B?aEJtSXdJMTNNbXN0cTFCTE1Xdk81dWhPd2Z4MGhhTkFQbFA3OWY0SExBQ3Za?=
 =?utf-8?B?aTloWXZnT2NFV0UyZ3BVeDN5YUY4N1pPN1FkQURJMDFqUURPR1FhejdyRzJp?=
 =?utf-8?B?SDIrUjJncDFyVXZEU2xCVmEvak9mUnp2UUxlTFZWWERsOGp6R1FkTHB3Zml4?=
 =?utf-8?B?UlkxTERFUUdDUjYwQ1Z0THJGeFp4MUFNWlBrYXN0a1FqY1dCTUxMelMxbVgx?=
 =?utf-8?Q?dj+rh1kWSdqRCdil6ks8d/E=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 896ca2f8-1a5f-475f-e49c-08de38a02979
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:29:27.6421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztmmGRcEtFhQSzHqmTlo+t4hnvdEnQYL0uGrw++BJQanAO1iUJf3yxy+amZGwvXpGzFWH2mwlKBpFzNTNlDmr6KQtEPp+RlAtA1bRsPPfrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 10:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227518

Hi Pascal,

On 12/9/25 2:22 PM, Weisser, Pascal.ext via lists.openembedded.org wrote:
> 

You have not explained what this helps with? The URL that would be 
specified after this is applied isn't that useful, so what does it do 
for you that this needs to be applied? Essentially shortened to: "why?"

Cheers,
Quentin

