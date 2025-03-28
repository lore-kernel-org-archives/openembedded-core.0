Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D650C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:27:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.24])
 by mx.groups.io with SMTP id smtpd.web11.7282.1743154014231252743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CpY1RHal;
 spf=pass (domain: cherry.de, ip: 52.101.65.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSaY7vM+zRoijO450Mk7LFubz8rTn5ncjYYaG0Xe/oPQlTf9BMKSGGpNemGru+OLsKM/tvqwQcZdgmHci19CHuXuWXOPmdGHLKOLCSwYDyvcWazSKz/tVUrDyGDZHg9X/GNn7H+ATlhKf2zKCUhs74Qa726fMkbvOYmI5hxQFa0HE1dkqzdxGsJilX1uH6R6hr2D/5GjZ7BkGG8a8OVI++/R5l7SHFGz5iMY7p15NDIXLgkO6dJa96D1uWs0u/8PFiceiE+41G1ByCtphfNUFtMrB6/rcxu/e05SAM2ngvU5wuZrVe1FHeRGw4gNB2e3W6B9//nzqckUAWY9p4orXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFbEIStTW8fmTuMhUWCZwZnYKLEiYNAihXr2jdd4VzM=;
 b=iFNpYHp82V8ZJP3U0tSQ67TY2ENft4wb5iQwvhAXhyzQLykxyBf0QKpAEtsonpZNiOHsPmDGfcT/aNqj0QePkBqADg+LgBAkTW37nhMlr6k/a/Pv1vz6gx7tkvAp+AtEsQTVbAeyqDEQ6AK/ZXNTTgaPEl3C2Ufv5DqElxTzTsVzOLSteX78d6K3g7n/k0myv9iZVTNVeKnY5dMTGleto/iwTEVBsxgbOPVQO5NyCs6ZQoW3CgH3hkN98R5ubHXxctKtdA/YNfO9G30hnC24ASyNfbS+gtabOQOtH5nWGIfwJItF31M5mxvm1UtdXBqYDoqclTdGc0I7uj5wTmv8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFbEIStTW8fmTuMhUWCZwZnYKLEiYNAihXr2jdd4VzM=;
 b=CpY1RHalFtJo9gGSKZKeDHWB4nolGEkiBw/d0hwH0zrVimeY9bHn82rIbfRlpCyKN23ksZpr58a0d2OLe0qHcKUmq86JrjOyXUdXypTsDa4hjXN4v1YokdGdVM/3k7NgRQStX1fGXFTEbQVZBmuPXaBpQsF/gqp7kWjGByg31KQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7848.eurprd04.prod.outlook.com (2603:10a6:20b:288::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:26:50 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:26:50 +0000
Message-ID: <eb57a2a6-6413-4f72-bbdf-783918c21afd@cherry.de>
Date: Fri, 28 Mar 2025 10:26:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [styhead][PATCH v2 00/31] linux-firmware: upgrade
 20240909 -> 20250311
To: Hiago De Franco <hiagofranco@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Hiago De Franco <hiago.franco@toradex.com>
References: <5a7b5f6c-1be9-4c5d-bf2e-59e115762d6a@cherry.de>
 <CAOSpxdajP0E0uVMR3QmRCqqmmRMAMnXiZM3bPmOXHGyRrVTfDw@mail.gmail.com>
 <20250327171239.kvs4jtetjkcs3i2u@hiago-nb>
 <CANNYZj-+2ESLmCUjGR9ZXK62=wJno85DgFdU3tjsu1O7G5DPGA@mail.gmail.com>
 <20250327190137.sfgisyjocd3ktje6@hiago-nb>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250327190137.sfgisyjocd3ktje6@hiago-nb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: db26097b-3db6-470f-3589-08dd6ddaab87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cE9ScXNYVEZtTk0wK3RmV0VHMlFNZXBSMnd1bGRxOUh3WnZqR2xldmdwM1kv?=
 =?utf-8?B?M1ZZeU1QUHFUQ2EwL3VLa2RqVHlickJLdU9uUjl4UGxmOEJOcG5za0x1NXZK?=
 =?utf-8?B?NHAwNy95QncwVnJKVkZxTGl6RWJNWVMrc0VjazZPZ1dGaXpmVGJCWFJOeHow?=
 =?utf-8?B?SWpnWGUwRDh3bGZGbXlCYzVCZm11c00zcXVjQlNZS1FXczI4ejJDRW5YY1ZU?=
 =?utf-8?B?RmdIYys0dkp6RkpzVzYrUTdNWFJaOTdvVGlzWFg2alA3by91QWxNeHJXYUd4?=
 =?utf-8?B?OHhJWUROUytxYTZSaVlrR3p4c0xzZ1BiNUJzYmlCcmM3WlBpYVFON2k4VXpC?=
 =?utf-8?B?RUxxWWx0dEJUMUl4RlU1UXEzUnNTamhnbDhxaUhVNkhQckl3SXl4UksyZ053?=
 =?utf-8?B?TjFCcnU0VmhpTnhPYWJRNDh0aTRPRnE2TGVsLzBUSW9XaVhmMmNDYWRTYTFs?=
 =?utf-8?B?djE2bldvZmdZS3BGVEdiYS9pcHdPVEZsdVZXVUIrQkt3NDZGL3RIWmJsWDVs?=
 =?utf-8?B?dlgzZkxBR2ltMjU1cE1OUENCbThsSUF1alhCc0d2ZVEwK0RqU3k0WGdQTWpL?=
 =?utf-8?B?V3hxcTRlZnRYblc3YW5KYk94cGRRUUh6VCsremFTdVh4SWJQMStqNTdKd1d6?=
 =?utf-8?B?UmpoaWNDcnFaYTQxQkN0RFZhOFZQZE43RFdUcWJoWFNwb0dNZEtUNGRZVFBX?=
 =?utf-8?B?WjZRdURUNlU3YjMvWkNDSjFoNTFLTm1zV2U4SFNtdU13TkkvdDR5YmxRMDI3?=
 =?utf-8?B?anFWeko3OVB4Z3pvNFZkaVBuUlpycjFDZUVzc2R6cmc5WTBHMFhCOG9halFs?=
 =?utf-8?B?bUNLZHVlV0tzQWsyNWh0VTAwVFRiYTRacU1PaStuZlp4NWFOQlpnNEc0ZUs5?=
 =?utf-8?B?ZmxaM1R6K3pRQVlzaHRZSllDV2ZDWlY5N3o4RzhBR2RnZWZWbXF1N2dQd0VW?=
 =?utf-8?B?QXV0WFFkUmpQTXJEelRKV0NZbUpmSm9MNFYwL25sODlmWFp3NzkrZjJXc2h6?=
 =?utf-8?B?UWtIUDF1UWJ5R2g2dkVQOTJlVnhpbU4reXFqRVllVUc0VGJCT2I1OGs0bmJT?=
 =?utf-8?B?MnVQUytpQ1JqbDhKWUlyQkhqY0M1RitWZ0RtdWFqOTJ2MlhWajlWbnRDdFFB?=
 =?utf-8?B?dzRVZ1RZRERpS2srWEN3ejN1YjBET0ptdWR1ekI4R2ZndXRjeUFuR2ZYOXIx?=
 =?utf-8?B?NEdVanRZV0NoNDR0SkFOeDIxc3BBOXVCcGpHUVYrTUdyZWRhdkNlOVh6eE04?=
 =?utf-8?B?bjRLeGxqS0Vhck9VSzZMckdSc1pxekc4aXh4R1BhUTZRNUpMNFBMVWl6YmZ5?=
 =?utf-8?B?dVpyaExlNTlhem1DcWxVdFdDODdCNGZyQnRpVFdwbzRHc3BGOFFFYlhmTjN0?=
 =?utf-8?B?QlcwTEtuMWxZR1hENjNkRmNIQXVWN3RBMi8xanh5NGRqRDNSNFhyaEtKRVFX?=
 =?utf-8?B?dVJvMHVRSDc1R3dyMzBhS2htRmxpTlphZGJCaWNPWCs3MzZRQmcvbUxjeUp4?=
 =?utf-8?B?UGMzMEhibUt1ODR3cCtHZk9LSUlPVHhjQjZlWHpZSWhoanowYllxUzB0b0xs?=
 =?utf-8?B?dDJzOWNHekRmRkRRNitncEd0RE5MVUNrTnVtVTg2MktMeURmeklLK2p6SGlU?=
 =?utf-8?B?Y21NMEkrK25JMWQ3S2tPKytUSy9LMDgrYTVSNHNFMktXZjJiTnlYemk4SFRI?=
 =?utf-8?B?R0lseDJYMzZXemVDV0tLMXFvZTBpei9WdEJDTzhKdEtyNWhWK1ZQZEZqZjRP?=
 =?utf-8?B?UkxEdjRJeXVWV0VLZGNONGJjb3hOaDRBREJEbjJVaTUyNnFzQk1kZCtwZmVK?=
 =?utf-8?Q?jdx+L/i9d7NZX2cFV61fNLQgs31rP4PBJCzaE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWlGQnFNT2ozeTF1bXJ4N1BvNkZlV0UrWGhFV1VUbmNhMDBHN3YrU2R0SmVx?=
 =?utf-8?B?Myt1dmZGSExNZWRoSmJ1Y3NnSlJqclRTekl0RjIwem0zVTdxUmpFTW5HbDRx?=
 =?utf-8?B?M2tER2hoY0t3Z1J2YUQyQWxYWDNSU2l3QnMxSHdRcFV3M004dDZYR2VLM21I?=
 =?utf-8?B?MGFpc3NzZjFNRFplMGFZNHBuS0ZUWVBza1labEVJZDdBOXJ5Y2pmaGlyV3BU?=
 =?utf-8?B?Y20zOUlKeGdKcTh4N2ZWU2dEQVZWYThxSEJ0MUl3MHVSMDByam1LTW85bkdx?=
 =?utf-8?B?L3JtT29FMmNCRW9aWFZ0dVo2ZnMva0twV0I3UGNJeGxaU21JWUttT21NMGQ3?=
 =?utf-8?B?QkZXcWhVSWRrejBJWWpsOS9kY2tENjVBR3V3VzhOMm9yZU5zc3pvcHFHS2ZG?=
 =?utf-8?B?Mm94V01EYkNISkI5K3Z4RWFGa1pldUlyZjZGL2M0ZDlhWGRqVDlUUmJMeExD?=
 =?utf-8?B?WWtnc3o1c3ZqeUpna2FMZkF6L1R2ZG1vQ2xpZWdFMTNncUo2Wlc2b2V1UHda?=
 =?utf-8?B?bmRzVW5yYWIxOWkvRlNySkk3eG5tYXR2VWIwQXg0RGlYUnN1SUZ1aGRRVk5D?=
 =?utf-8?B?OHBGUFhzRkV6RG85K1h5WktNYVFJVzU1YVFtK2RRbjRwR0YzYmN6SXd0TE9a?=
 =?utf-8?B?djZYeVI5Y3JXQVdiVzgxczZUMnl1UEhMdGJWYllNbTFnak4xcFpXeE5TRldN?=
 =?utf-8?B?TVFYT1BmcHB4RllhWjJxcmRNZ3F6T2FwV1o4ZEZZTUx0MmlYcko3T2FPY1BR?=
 =?utf-8?B?UWJpSUgwU2ZBTFM0OVdYaHN2aUIzcWUyMlQyZ09seUdEbjUyQXNWSzF0TWZ1?=
 =?utf-8?B?Uy9kMmNJZDkyOWVuZjJaTG94SzlZNHo1NTF2ODBiL1d6Skc5ak00RkN3RUtj?=
 =?utf-8?B?T1J3cTVhdVpFQjF5Q0tDNWZDeFNRQ2JLbGNXL0p5VjAyNk5ra3QxRTNBaFJZ?=
 =?utf-8?B?cjY0TGtOM0FyVUNYWFNzY0dPRUFMZm9NTG9yK3l1NllJUnYzeEpjNkV2dTkw?=
 =?utf-8?B?RFBFM3ZoRWNkNU04MThRODBXL0o3M2t5SUd5OGxWdFRjM3kvcER4bmtYNStn?=
 =?utf-8?B?Vm1Qa0hSYUFtRWZQc0FSVW92WjVzcENzREVucy92b3VvU01wZms2RmxIM0Nz?=
 =?utf-8?B?RE0yTXIyaHF3bzdJbXV3ck1Nakt1ck10Q1JTSzNEQTFjZDJoazZZOHh0dWgr?=
 =?utf-8?B?RWU2c3ovMW45MzdZMktSREZ2WHhxajRnV2xUMGRHVE1IRzRNWExla3JlZm1i?=
 =?utf-8?B?M0lOZmJBRkFiR0xQa05udDlPcjIvYUs1YkJ6YWIxZFZyRkZUKy80eHVpMHFn?=
 =?utf-8?B?NFdKY1Z0ZzNjREVWUFJkbUltbFptWXNrU2txWmhIUWtpVUJVYnlncWxrYWcy?=
 =?utf-8?B?WkZOaGRtTWIzZk40YUE2cXErTVFSalEvNWwzNStkdVlIbXNmZFJLY3ZRVEVx?=
 =?utf-8?B?cjRBRndmYUR2Yjkxb1VDUXVtWlE1T2JHdzllbDJzUFlJTlJnMUh0SGNZb2NL?=
 =?utf-8?B?dXZLNW1ZY3gydGlwVGZBREk5Z25BdDU2bDliSXFubUdDSHdzNUhRaEpQdmVt?=
 =?utf-8?B?d3orZHc0TTdDdnFCbzNCYmt6TDFwS2xZZXRQUytqMThEUkwzcFdRWENjbzVt?=
 =?utf-8?B?QWdPdmdxb3ZIS0xXWDAzcTBvUFF0SUptbFZlZ3owcXMvQmFSaXJuVkc2TnZu?=
 =?utf-8?B?aDR3TTJ4ak8zTDdZWkh2ZW1PK0hqYVVRSUxNT01xeTh2NlBGbmxKcHk4UE5s?=
 =?utf-8?B?MzZZYTV1WWRNa1pCaWtONTBLU3d5OWJvYUQ2ZkdsU2lnSmJBeGUrZW9vK256?=
 =?utf-8?B?RUYwSWlxRGxXSmROQ0lKRi9kT0Q1cHE3NVFjS08yd2UyRUlzcHZKT01ia2Fq?=
 =?utf-8?B?MzNIWkJiZmFaVHRqR3JoWEhabEd5MWhhbmIxWlJxRnZPbTRZeEkxblRWWUdT?=
 =?utf-8?B?UlVqbjZaTlhnUHJ6SDFFSEd3cHU1M004SUJhTGFFcXl1bThyanY3dGlXeEV5?=
 =?utf-8?B?NllFbHE0anYvZTdPbitlTGcyM1lIdFMwQXUxSFhueFRZVjBJRndxbSt5bzF1?=
 =?utf-8?B?bnRESnJUWldXRnhieVltZmFCNmE1TWMvNHJ4amhkUHdkT0s1eTFBSi9SUVhh?=
 =?utf-8?B?aWJBamhGU2xmeEJocDlGM004bkdXaW83Rlp6eUFzQi83SmZ4QW1CaUVXWlN6?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: db26097b-3db6-470f-3589-08dd6ddaab87
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:26:50.6194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlZbn4Fo5dFLEZrMKSFKUS+xMZtXHMz6HGb0Fg+43B3Fa6yUo5TNfgVl8LdAmfGCbQ3tFmaIyGs+XbBrcZMNcHQzZoaeBbNIjdZJl30jhlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213817

Hi Hiago,

On 3/27/25 8:01 PM, Hiago De Franco wrote:
> On Thu, Mar 27, 2025 at 06:29:18PM +0100, Alexander Kanavin wrote:
>> On Thu, 27 Mar 2025 at 18:12, Hiago De Franco via
>> lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
>> wrote:
>>
>>> What do you reccomend? Should I try to keep the patch with minimal
>>> differences as possible?
>>
>> You might consider adding this to meta-lts-mixins?
> 
> This would be another option, but before going into this direction, I
> am still wondering if the bump on Scarthgap is valid.
> 
>  From the git history I can see this recipe was already bumped in the
> past, until it got to 20240909, inside Scarthgap. From the bugfixing
> point of view, it would be good to incorporate these changes into
> Scarthgap directly. I am not sure how is the policy/procedure to bump a
> LTS branch, maybe you guys can help me understand this a little bit.
> Then I will be happy to propose a patch and try to work this out ;-)
> 

https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_Acceptance_Policies

In any case, it needs to go through TSC 
(https://wiki.yoctoproject.org/wiki/TSC) before being accepted I 
believe. To reach TSC, it needs to be suggested by the release 
maintainer as far as I understood. That would be Steve Sakoman at the 
moment, c.f. https://wiki.yoctoproject.org/wiki/Releases. Steve said no 
for styhead (no further release) and no for scarthgap (not comfortable 
with the amount of changes and potential breakage). I personally believe 
a simple no on the mailing list can still be appealed by trying to 
convince the other person until a full stop no is given or consensus is 
reached, so you may try to find ways to limit the possibility of 
breakage, especially unforeseen ones so Steve would be more comfortable 
with the changes, essentially figuring out what would make the release 
maintainer more comfortable with the patches. But the current situation 
is, no desire to accept the patches into scarthgap via the main branch.

Cheers,
Quentin

