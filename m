Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DEED2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 14:29:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7522.1768919360450664114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 06:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=CtLsZqgl;
 spf=pass (domain: cherry.de, ip: 52.101.66.50, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgCy2AhvGiaD0dDX419CHccXMBbRcuOkk7SG0GDHDJXmio9aMBYxme4znM7LDNiWFRnxJTMebRClNWoFiuw39ET0nuWh8tn0ZZ9E/EvItAodhTR3plRYp82uKEyG5QYJjKCh0DVCFKwHR6oTIymT2cMeVSQXh5E0rJJfl3XQC3rdEmyhH0MZIsG2h+BKv8mCX75P0V+IdLJSSn4VShBtSmO+RsfBVDOjsv+EE9pyDuZ3Jo9OZdc0tn7otDFhs2PpjrLn1132lu9HhtbQXCYEkevjK/YsFPkUHJF6cB5SErY7su8BqOsWkJa1NULMi907rdHaJdR0ryi1RTsVDWWbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VWklkoxJdWXL1uv5D9Rus/+Mwo13B5JG9MRjYi9omE=;
 b=VZy9mgt8G7d7LnjbbuVh2usPqzPAWdCMxr2xkgrj6UAVSE73Yz3Ij/seror7NFY2aGGT6IhVllZ6bolS0VjaumvdSzAi/ie8b7LZ3btPdlzvmBUWAjF3QFqkNYe66vJEaua4uSyX0Ujv40ee+9crCQUAXkIyESW1syH53sIB6eoHp5D3h4w39nYk+tUlWPcVYzk234yFit4VP59IDhSlTAFKnaQvvas190Jcq9X7DxQQ/9mwIYeT2Z9PPhrKelaZnDFfLRqgeJnR1etLUfRRBplhGFlmozXhhUuYvA9r2BEiTlEBQMHuwRaWkDWMjwJvhBH8iMl4HQRjwEGiDEAoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VWklkoxJdWXL1uv5D9Rus/+Mwo13B5JG9MRjYi9omE=;
 b=CtLsZqglY83tmVht7YRB8FGOKJbzvsZxr6ftpXRLgFcA4FiDPEF1dO5Sdhy59XwVDVhTE0D90lqgblcS8HNqHIo4OhyWoCSJqWPLeZWMQLcAvxLdSASqnVzf46QW7pGG3bjhTfHLTYVCTADcHyzV3rbmB8LUnlVvS185L/LhSlc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 14:29:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 14:29:16 +0000
Message-ID: <48468946-8e7f-4fcd-899d-64520551ecdc@cherry.de>
Date: Tue, 20 Jan 2026 15:29:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] should a vendor layer override the base "u-boot"
 recipe?
To: rpjday@crashcourse.ca,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <b0c4382a-24aa-d421-c4b3-6b30e4309cfd@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b0c4382a-24aa-d421-c4b3-6b30e4309cfd@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|PA6PR04MB11949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c594257-9055-41da-7479-08de58304a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UXpuQTJ3SGZ4ZTVpdDkrU1VTQUQ0R1h3Qm4zYUwvT2YzY2ZhcUJmOFA1YWFq?=
 =?utf-8?B?NGY0NWVkNzY5R0tFdFRpRHk3K0xFTjVsTS9IdDJtRlF2L2Q3Nk9Bd1RTdzV0?=
 =?utf-8?B?K3dCV3hUNDhWanBqcEpGWXZvNWgyVHFvaUpueGRTc1NMUzZvQTQzMWpUcEtW?=
 =?utf-8?B?UklDYVdzMHkzQUFVblB5V2RSellCR0hORWh5THFnNTZYMEkyY3FBb3J3TVdG?=
 =?utf-8?B?K3pJdDAxQnRQbUZIZitTQjBjOUd2WWNYcjVySjh5ZEd0eExVL21JdmtnK0FC?=
 =?utf-8?B?VDZUMVkwbVZUTlJ1Qlp3TmRxNVY3bXNaTGdqYWlGbUZSN3JucCtDc2tWY2Zy?=
 =?utf-8?B?eHA2RVJJaEdPT0FMakpYN045SDl0dWw5RUllMU9GUHREZ3d2L0VDbW8zRVpV?=
 =?utf-8?B?NFRZeitQbTd6Qk5EYzR4Z1NrRGtOSER6M2NoSGRnMkxrUnlEdm4xaUgybThU?=
 =?utf-8?B?WVVJZnpWZVpPYVVsV25Lbm9VUWw1ZzF4L01YbWNEU2dlT2NTN0Jvc05lMTFF?=
 =?utf-8?B?T1RJRVlaMURZd3FQRWd6Sk5sa0dKSEVNalRGb3VCNmJYT2RPa0ZwU3dBSlV1?=
 =?utf-8?B?T0FCZm9pbExqc2Fzb0cxNW1xK3IydGVNcUZ0K0YrMHovbDFCTmUza3Z4NU9i?=
 =?utf-8?B?UzNXdThyTjlUbldLb0JQdXdrbm81SzdLUXcvYjRDclY1NW4rR1U4SDVSNURu?=
 =?utf-8?B?a1VpSS9RUkVvb0hXSDgwMjBwVzVoTFZ1ZXU0dStUcXdBblNMbmZJZGt3Rkxw?=
 =?utf-8?B?WHo4MDlDbUdUc2RPR2QrQjVGSVFGL2kvWXZSK1RjaWtGdk1yd2pLTDJGZlJ1?=
 =?utf-8?B?Y2lWMHlmUHdxcjJZdkJtNHVSMjhWQ2twZVpwTjNJekFQZUlJMjVkSEFSenFS?=
 =?utf-8?B?Z3JYTWlRdkZHUHR4azlYR3ZvVkdOZlEyN2g0N0k2YWhXUFRJODUwVGxGTHdR?=
 =?utf-8?B?cjR5UkZjMm94eFM2S1dqeVRRa1ZMLzU0RVJzbjE5b3dFbWNPd0RuYktHcjlQ?=
 =?utf-8?B?UFozeWNMY25oRkdMNkNiSm5HZFhnME1uZE9XYWZtOGY3RHp1NERuc0tZcG9r?=
 =?utf-8?B?TUlnRHNXcUxZYno2NTJaWjFGTlNjSlp6enpFMEVjbHNtcFRNZ1l1ZEFFcFVr?=
 =?utf-8?B?UEZ1MC9vdzhpSWtVWFA3VVRrbWxLNHZsbGZ4eFA3cC8wMm4ySkIyUFJ0N1d3?=
 =?utf-8?B?Nm9RSU5KK2gzb1FIc1YrQkI1WEFqdmdqVHBqNmZtUldxVXV4ZWwvcTNQQi84?=
 =?utf-8?B?TnhhNVNERjdmNTZlL3VJTkJ4R3FEQ3l5Qk9QWDBKOTZKRmtLWENxK3dCYVNq?=
 =?utf-8?B?a2kvRy9vMDBnR3FQTnlUd3JSbjNLL1pJaEpKaHpNWk9CVEhOOWZSNHg0U0ow?=
 =?utf-8?B?SzF4VlJNZzgvT1dKWXFRb1Q0aERubW1UZWlVTjVQM2FvSWwrdDNPdUtLZkQ3?=
 =?utf-8?B?dW9Yb285ZGxIY2hvL2pMWlF4WEs4WFJiNUtUMVF4dFE4NWJzeFgrT1pUMWVG?=
 =?utf-8?B?TFlibWxKR2VGZXFoZms2SlNLdHpaZXducDJNc0hxZ1IrYUFtWjVKRS8zS3o4?=
 =?utf-8?B?OHBQYmRIY0VxWjJ0QmIzZHNkVWRKbHIrd1ZRaGdjdVAvZkJaeFZzbmU5UXNF?=
 =?utf-8?B?MUZrbW04NTg1Rmh2R0JOVlVWdXk5ckpGamdzVnFjWS9JbDVqNTB4TktFd0FW?=
 =?utf-8?B?YVZsbHMzZTUxWDJHMkYxWHNBMGN2WTluKzdOdFFwRTQwRHFkTkdpSmJZOXR5?=
 =?utf-8?B?bWJhemZ0dHg0aDYvWHJMaERFNmZCMU5OUXltK2tFZElQd1oxYUliYnJCWklD?=
 =?utf-8?B?NUFlZCsyL2E0Vm0xTTUzZHZiaUw1bFpoNW1zVHBaTitlRTdRZjN6SEI5WmpB?=
 =?utf-8?B?OW83b3psZnhScUhLQ2lvWlNLUFhPbGlBZDkycXFUa1B3bjdpT2U1UEhuRmtv?=
 =?utf-8?B?SFkxaGlURU9CdENKaWdJamdjempRSzJXTXlHSzAvRitVYlVKTUhMRHNhLzcr?=
 =?utf-8?B?djFKNmpzKzliNkhldWczSzR3dmFmS1NMTnRiYjR1bWQ5a3hzWnBEelZDN1FC?=
 =?utf-8?B?OUVMMGQ1KzlCaDZOV3VWUXlVQ2w1M2lsaDI2aEk0eHJ3a096U0h5ZXpNZHFp?=
 =?utf-8?Q?XcBc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGJsVE03Sjl2TVBBK0c4NEx0am9NUEdzazllSmlsSDdFMHM0d0czUU9ZVmtL?=
 =?utf-8?B?NjZlMWs2WkN1ZWh3MjhmSS9xN3BucjdIYUFOVk1aLytWSGlOKzdBNG1Bcmho?=
 =?utf-8?B?MDc3WXQvelpPNlAyQ3haK2RyS2paSzRNVlBGeWUvUFFtT3hmaTh1RkNuVlU1?=
 =?utf-8?B?ZUFZQVQyMzJzTS9Rem9xc3NXb0NCV3RpRVFidFd2L1dsZGk0WkdDU0pVZE53?=
 =?utf-8?B?bE8zOUNhRGx1MUJHK2pJbzllSjM4ZmVUZ0RYMEtpVE1xNlNtRkV3TXZrZXdD?=
 =?utf-8?B?OVl1UHo4U0w3anpjT2VRdzZnZklSek1yL1Q3emF6dWNSTit0T3g0azVMQ0dV?=
 =?utf-8?B?MVI1NFdROG5EUVNVcklEeXZvTkZzb0RmYklYVHZKelJ5RXNLQW51Y0RIc0pG?=
 =?utf-8?B?ZSt6SXNDSlIrV3NJckZNNi96eCtWSVFONFZsYVFHZ0lQc0xhRnFnZjcyZCtT?=
 =?utf-8?B?ajIzYncwdDR3dEtCeFZwV1NSYk9ib0lvWnN4cktQUHNzY29mOTRBUzVLekJM?=
 =?utf-8?B?S0FKVmxwajduemZTMnNDT0dtZmd5QXYwTy9KWXB5Z0syVjF6b2NpdVJDYWVw?=
 =?utf-8?B?U2RXcE84ZGYvVlVCdTZaOUxoYk41RXlBRXIvVkpEZkx2Qmd5MkVETEJ1VmNV?=
 =?utf-8?B?K2UxT3QyTEt2Ylg3S2dVOHRqREFuTEg5UjNtV05LZUtjRXhVYkZnbGc2YUZi?=
 =?utf-8?B?eUpPeW1JdlA1a1FSdVRRdEhuMlpBWmdUb3c2Z3ptdUZpVjZEZ0NNNmtHaDdt?=
 =?utf-8?B?a3RnUXUxbnRJNExrUjFscUw2UnZ5R3FKTWNFeE5UbE5VMDNWd0xPdUVFQTFo?=
 =?utf-8?B?Qm1GZnR3eG5leFozUlpYaktDVEM1TXp3VCtDcXQwZDJEbGlZZlJCV3NoazVB?=
 =?utf-8?B?Z2YwTkNNTE1HOGI0VTZ4U2FsWitBdU5nWnBjM1JEeVNUSXl5ditDYVE0b2cz?=
 =?utf-8?B?blRDLzBub3lGSTN5djNxTmx2QUYvQ05QM0FScFA0MVNMNEJiY3dzZ0djYmJH?=
 =?utf-8?B?RmtHOEpKa2hVL3RTSTlzdWFvSDBuTGdIQnhoa3crZE54WDE2cXdDR1BrWkxy?=
 =?utf-8?B?VldaSUxmVHpGc2FIK3I1WGRrLzUzVlV5eFp6OWhZMjZ0T3AwRFRIeTFGQkRk?=
 =?utf-8?B?aG1FL1ZhWEVleTNQY2U2eVRwanlBSDVLVEQyVGIrdkNnTUNHWUZWSTBsTUJR?=
 =?utf-8?B?Q0NiSE12NStPbnpjZEx6c280ajM3TGtQbkVZTmkrNThEa2xhSTU5dk9JTXQ2?=
 =?utf-8?B?WCtsTjUxRmVEZGpWVjJieVhvM1ZhSE83b2l4N3Q5MmFUZjlGSHI1TEZMN0kr?=
 =?utf-8?B?S2xpVEhydlo2dDJrcVdyVXJpanlyU1k0K1FBSEFZWmYyK3RkMVVNaG1HSHRU?=
 =?utf-8?B?NEU3N05WaGdtMG1nVFNNL0dUWXQ4Y3pSYnE5YWphTDJHVlRUUXhuZE0yb1JQ?=
 =?utf-8?B?NlZ6Nnpua3FRblFmSXNNTzNva0VTL2xBRmNtY3dTTW8yelBkYzhYU29TM2p0?=
 =?utf-8?B?T0JYRGpaK3ZXU3NiL3lHT25TM2RNdE8vVmQ0cG5TWno4TlN5ZHVkTkNYdXph?=
 =?utf-8?B?VndzOStYNlZVeFlVaVhRT2xMTm5ETEUzK2lIOWgyZVY4YzhjU3ZUc0F5N2FI?=
 =?utf-8?B?eG0rdlpraEswelJjM1FsVVNvYnUvQ1VUdUdZWmlqclQ2MlNjNGV6UVRLekVP?=
 =?utf-8?B?S25tMHJKODF3SVhZWER3Rjl1Ujcwa3ZjZUIzd09lQXgzaEg4ZWVCVitHTmcv?=
 =?utf-8?B?N0gxdlA5TGtvWVN0TGFTWGZKM0k5MW9UdExkMTlnSGluVE1IanE0eG4yY1Zl?=
 =?utf-8?B?cE4zYlJOTkxQTi83M0MvVDBkSjIzY05hSUg3VnV6RysyZEVZQ3pHN1pKa0pn?=
 =?utf-8?B?Wm4xbk1UcVdMSW9ab3ZnM2wxYStQZ3QwQlBqUDVVZXB5RVYydXM5c1UwQStP?=
 =?utf-8?B?NDVSRDJQYy9EcDBBZTI0K2FLb24vVGNlVm0wVDBxY2l4MXdzZXMrS2FoTVAw?=
 =?utf-8?B?dGFtU3FPampiT2pnZHRTQWxxaG4rNngrN2t6Z3NEbTh5eFEzYlQzZFJNNG1D?=
 =?utf-8?B?NjFmVkJuR1dxOU1WcnVzbW9uMUJOZkZKR1BkcnVlb1NGUEQ3SzlNTVFkaFM3?=
 =?utf-8?B?MmdoN3BQOFBNT3hBU3ZWeVVmc3dzNFRmKytjcW00VTgvR1hadUJ1NllhZ2Mr?=
 =?utf-8?B?VGRsM0U0NHE2TVR3QWxjZkZpR3JyK1UvM0NiSWl5RTNEd1R4YnF5QUJWRUd3?=
 =?utf-8?B?WldZdzBwUkZGVFFRQ3YyeC9SWlduVVk0dlo1d0s4anZoTHdhWmMySWNtdHFX?=
 =?utf-8?B?ZjRkOHEzVi9OTFBRNGEvSlhTN1NGcFNMZzhLYzkvbkdnaDVKQjI2Y09pNmx1?=
 =?utf-8?Q?CUISwlDSpook5APv9dfgMFvYNC2O+dxPg8TGC?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c594257-9055-41da-7479-08de58304a0f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:29:15.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1OAz7vNKK0fwA9GO+VVD46jWk3RoldbszNIa87/tVQPdiM0UEAwaRihFOIP5DY6q9Fpq/E0jogEzmHYPQrHeFyJAwcrLe2EMiPWv1smNEZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 14:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229737

Hi Robert,

On 1/20/26 2:36 PM, Robert P. J. Day via lists.openembedded.org wrote:
> 
>    sort of a policy question but i'm working with a vendor layer from
> STMicroelectronics ("ST"), and that layer provides ST's version of
> u-boot -- a recipe named "u-boot-stm32mp". fair enough, and they also
> have an include file that makes that recipe the preferred provider:
> 
>    PREFERRED_PROVIDER_virtual/bootloader ??= "u-boot-stm32mp"
> 
> so, ideally, someone would not define their recipes to refer to u-boot
> explicitly, but to virtual/bootloader.
> 
>    but i decided to build the "base" (OE) u-boot recipe just as a
> baseline, and ran:
> 
>    $ bitbake u-boot
> 
> and was surprised that nothing further was done, and i noticed that it
> tried to build ST's recipe, and then i noticed this:
> 
>    PREFERRED_PROVIDER_u-boot ??= "u-boot-stm32mp"
> 
> is that normal behaviour from a vendor? does that not mean i can't
> even try to build OE's version of u-boot because ST's setting above
> will hijack the recipe name?
> 
>    is this considered normal vendor behaviour?
> 

I don't understand what's abnormal there, can you explain what's 
bothering you?

You're including a BSP layer. This BSP layer provides you with include 
files for a specific architecture/SoC. This provides defaults for things 
your vendor tests, supports and maintains. This layer adds a recipe for 
their own U-Boot fork.

If you are including this specific architecture/SoC-specific include 
file, then you'll get those defaults. If you're building another 
machine, you'll not have those defaults.

You can always supersede those either at your machine conf level or any 
conf file (see the use of ??= which is the "weak weak" operator).

Imagine your vendor added support for a very recent SoC that upstream 
U-Boot hasn't merged yet, would you like to debug yourself why every 
image for your machine isn't compiling, or worse, why it isn't booting 
your image at all or would you rather have a sane default which is 
approved by your vendor?

BTW, this is what I've done in our layer too, see
https://git.embedded.cherry.de/yocto-layers/meta-cherry-es.git/tree/meta-bsp/conf/machine/jaguar.conf#n38
https://git.embedded.cherry.de/yocto-layers/meta-cherry-es.git/tree/meta-bsp/conf/machine/jaguar.conf#n40
for RK3588 Jaguar for example.

You can always override this in your machine conf if you want (or in any 
conf file).

Your vendor needs to have a U-Boot recipe that can replace the upstream 
U-Boot recipe (via the PROVIDES += "u-boot" stanza) so that you don't 
have to go and replace every u-boot dependency with u-boot-stm32mp for 
example. See u-boot in PREFERRED_PROVIDER_u-boot as 
PREFERRED_PROVIDER_virtual/u-boot if you prefer.

Cheers,
Quentin

