Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483FBC88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 21:14:30 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8838.1789420466048318305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 14:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=GAkgW9dQ;
 spf=pass (domain: est.tech, ip: 40.107.159.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOB47fcKUMh/GqhoXSM2skhJ5QgRL3ltF4oW4UQqOkW6JRaBcJTh71aOI4dXeirDA3E8Yie3nNNajnD6StBRQalIcdN/ga58RqjwA8/cxo21uZCVOUjUcVXsPGw0y+1tIxH18OoOrOZp8JC+XzS0aJr8mxusHjTqJRC7dnXrVPKKYE7nM658/5badnbpTjiDCI6nrWUwuW3XrBxY3cUdAIiEB/4vQ88HoPpfkXuGoSx8TSBpVkjPatY0PEVg+aU/sYdbM7aQNfR7F9Ot+ThePy46JIRMA9TshHxPfFAIM1gQh8zj+7QFZ3hBZy4AM/hYvUhaOpKD2xHWVxhnQbkZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6CS9sGjlfUAQeuVWjNfwl67wwR2Y2POCNufgqR5olE=;
 b=Z9frEn7G7BrC6ueDBz4EjCTbSeX92OOkGvxSxP72sQxYXT3PCFBFLfMPTn34lEDemjq0PMeg0QBr3spE02gic4orWcWqdYnEdXDFmFealtNhiIPzML6T/3jNj2syKRTxZ4PBr5OgBWiTxMx9Nx6e4s9ZD6WdAcTBixWsndSCrZ+xBJUKT1t6tL/u7+wmLRqRPtn7mUk3cbLPYR4c69TeCNqlbOuHU7ZFO9SstNwOgRqGx8skDAgzf4txNfejGodoRpgwl40JuRetp1ImVhzK50EenrTUw4dangNr70ES67FTawWr+UsXaejf0Y41rstW3ER0RIJTjDy1MkHMlm0MOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6CS9sGjlfUAQeuVWjNfwl67wwR2Y2POCNufgqR5olE=;
 b=GAkgW9dQFCI8iKzE07lqVf7WoOv1r38F8dqAZ8TIo+7RAefF+iO+foYKRJhGOXsT/4CIAU6NbtQojzFj+Ut7krc1fTiPRnn+lITSzCAxHUotRTuSg5vs40hWnI0VowgjpZDKDhkSDhlu8i1oybt1RFOVoso2+AE5HA8xOtAPRR2pxpDgcvoDvieCy7BMW2LuAIZe5GutEMdoY7UuZ0Mxb7zAHcdQxAgnDjDTW3vSMMFY1TAZ3SRJWfYhK/mzmoxapw3+tAnjsZKjiaLDlfWUp48Ms++Do4/FQQGvtoq6dccLuxKn172UmRxaoH5xA0k53U1neDKt6N6gQG+CJL5pAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB1990.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:505::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 21:14:21 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 21:14:20 +0000
Message-ID: <f25c47f0-4c6c-4f1d-9d49-945e7d0711c9@est.tech>
Date: Mon, 14 Sep 2026 23:14:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] libpwquality: import recipe from meta-oe
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1789116540.git.jaipaul.cheernam@est.tech>
 <e1d67ecc9f9f0acf2c15207475576d8cb192ad01.1789116540.git.jaipaul.cheernam@est.tech>
 <AS8PR10MB5073BA08B6580E8F89299182FDBC2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <AS8PR10MB5073BA08B6580E8F89299182FDBC2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB1990:EE_
X-MS-Office365-Filtering-Correlation-Id: bb09a95a-e15a-4a97-0e31-08df12a524d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10070799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	9k0T8KnV06uRmuhknvRRpprBJ2qhsvwDXWyce9m8Ex9aDJSBJ2V9lu2lgkeaZ5AxqEv95pfDbAE5xHLSW/DIvUZ5qj65ETXJFWOUwIU5oLVVWdjpQdXT4MJAy/B/ISgbSCM1eDpoj0zieCHCx595JP2hUBQoqua8nMbtzeoKMTGHg0Rhqa9mHWLAlc6TPl0Ft3Kvss1SIo2rhRU9c1mwRhEbxCtKr/YnIrYrpoQnddRqvrOwxP5fINRL+ajHv/GanaCS1enY3sIGpJ/oAwNt0Y0gzVWIBRSZOmunyt53aOKN6U0PzNnywdCauADf0esHx6ES25AqUeJEX2/3pbq7Na+QCEprUq+7GJAy1evFqjzqA8nSVlsKrDTQuPYG4uBzBCxrM7oVaV+KA9PYNEXdIEPzlcN5E31IsCaRWxfi8yl9ezemztvZ8eo/Yq4cx//4guMdtuxJ6ZN2p4LYGAcOOtiVu/JvgXfNmk34Ya6IwZwA0sdK05EY/qXLESlcG5NzesU5pS5SHhlXgKoR3INQGo2PTKF0/PvHuRbD7iGG7t49VHH4+bvXhBkGU9ErHsZ0hMjSAt2aN6FIpr2UIFkoKXHZmnhevhoEbal0Rg9GytnA7iTasCUTKnYwe86vVTQ8HJj3aG5qQAuk7cKebf+lvBa2Id/KuN/l4snJwf+4CZw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10070799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVZTQjlkNGZ5TjNGY1BMMUR0ZmNGV0hUQ3ZONmxwcFo5eTNSYlRNSWdwOHhL?=
 =?utf-8?B?UGRud3pmQkt3YVpmRUNJU05VYzdJRnRHOWx3VmlzOG5DMCtmT3J4aXdnbFpN?=
 =?utf-8?B?MFZ5ZEliZnQwRkxkNHFacThpV1FkcGlWL05XWDVBSnJGNFdvK3dnOWpUb1dR?=
 =?utf-8?B?Ulg5RlcyK0xTaGVrQVFpNGdPZlpOaHEzMEFCUmdFTEhWSzRiUzJkTFN0V0xx?=
 =?utf-8?B?SThPTWZraVBUcG50KzBaN1FQemMvZmRiUG1YemdXMktPUVRncUlsK29NRm5n?=
 =?utf-8?B?SnpnYmtTN2luZ1gyUEhRU3NzRHZyZlZPS1RrV2dMRGltNDc0djhjR1RBbXIy?=
 =?utf-8?B?ZVZaRFB6WlplWGRTVGpuclJvYzZPRm5CYThXcHFhSWFVa1RHQ0VUQzJ6OWNW?=
 =?utf-8?B?R2oyZGRFeXlVQm1sb2Y3NFgrY3B4ZEQrUkRlWlFIVDB1Y0hURnh6VXFZQXVo?=
 =?utf-8?B?WWQ2TWl5eXlvQVVOK1p0c0lDU2FGRnhmcUlLdzdvREJpT2d0MFVCYXo1ZWF1?=
 =?utf-8?B?UXN1Rkp0QjJRN3RTYlhrd0thQm9kODZwMFRueWtYbE1RS1BaTDZvY1pON1J2?=
 =?utf-8?B?K1VYeE1pTUdTQitkY1pUd1dDc09HTFk4dWFNbjFZSmtBSTQzaHI4NWhMNkxQ?=
 =?utf-8?B?bk9Ic1AveCt2V0NtTm15dGlnS2pYN0lGN2FETkZiNTlmcmV0VkpnVXIwM2hu?=
 =?utf-8?B?cmlBd0dQdUE3ZG0vMDdKNWN3ZXV6MWx0b0pVcnM2d2t0T3VRVzN1WkNhZW1F?=
 =?utf-8?B?YkN5eHQ3cUJlRDhIUjVuZGQ0VlV2dUI5NkY0dXk2WnNmLzJCUC9vUUgvR29l?=
 =?utf-8?B?NmJXQUo4enpqeWF1dlNsTWl4V3RENzRLeUFLUklqM0RqREljTjhndWVTL1E5?=
 =?utf-8?B?ejdsYnZ2MkRvaEs3ZnZyVUhBNmpCa1E2V2crQ2IyVE5XZTZJQmNnd0Ewa0Q2?=
 =?utf-8?B?cVVTeWZlWmJQSHpXZDRBOTB5a1pCUDVTaEZ0ZlRlbWFEMU5SL2tjR2x0dTRa?=
 =?utf-8?B?V2dTU2lkV2d2OWZDZ1lyQkxnbnV4anJ5bTdiYUdFV2N4djlJYkdMVys2elJn?=
 =?utf-8?B?Y2F2N2tMRHNyczEwRU5TaDNMMHpXL1ljUVl2bkYxR2xINVkzQnliNGVyOE1B?=
 =?utf-8?B?T3pnR0lxbWlFT2NqS2RjT3JBQUxKWGxwZERvNGUrVUJpSmFoaFYvTlRERmgx?=
 =?utf-8?B?VXRRVFRBeVhhTHRHQlZRaXBuUVplT2R3eTgxTkNTQTJuK3N4VlkxTkNKT1Jx?=
 =?utf-8?B?alZpOUxjTDNNZEV4TVJaZlpQVkc1eWg5SUJhLzdVWjkzY3FhTHo1dkMxWmhu?=
 =?utf-8?B?NklUVm5WVzl5SndlM3FwbGNxQkk2cVBlY2RWZWM5NFpXWmZ4d1F3TDZUOGtm?=
 =?utf-8?B?MStrTGRMRFBzT1JPTXIvak9ndGlDbkFGWkN3VkJzdldoRjIyZFRoL29HaVVV?=
 =?utf-8?B?OUV0TkgrT2xMUFN2ekdSTEtsRWg0U1V5VWdSZnBPd0Q5WjVlMTh6NWRsL3Bj?=
 =?utf-8?B?SG9EeENwVGpoWFAweHNDNWduaFljbHB4ZXYzN3QrVWx1L2RCUkVnOFg4RUVq?=
 =?utf-8?B?MEM1eXNSMUYvbDZhTFdOUXBGVHlpcm8xY1VmZkNTYno5UmtCVXQ2b0RXQzVz?=
 =?utf-8?B?NExOMmw5SDNwRkV1ckU2SVNlc05iQXNicS9JVTJWVVFlQnliTXIxYWtMTlFR?=
 =?utf-8?B?VllWZTFPMnBOUVMzUmxpN25vUHpCdEp2d3ZVc1BBNkxVTk9ncVhxVVlWNFRp?=
 =?utf-8?B?VHFyT3RUSzJGT0pSdXFIWW1QWFZCQU1sVUIydW9qaDA4WFM2YlJjQjNORlo2?=
 =?utf-8?B?bitxYXJYeUJOQmhvQTMzNTQvbGNEcmN1bkd1a0QrZjFYZDFwWnRZN09GVXJ4?=
 =?utf-8?B?Q3B3em1wZ1RJYUhzVXFEYjQ3bmpuaGdXK1BkUUIwZW1IbEtSRU5uM2lHV0o0?=
 =?utf-8?B?SWJSbzdrcExLNWo2ZFV0S0xoUk1yTjdHUlp6SHl2OUZub3YyNjJoRW5xbU0x?=
 =?utf-8?B?RXh4dlgvSEd1dlhVNittd3FHQ3ZPVDlwbTRZbjY1b0VzMzBnZlN4aVJRcHRO?=
 =?utf-8?B?aFVmZ2dxallpdnpDSTJCenJlSmFhdm8zMlJ3T1djc3JUSTdwNGt3RXZmUkNX?=
 =?utf-8?B?ZG00VlV6eVlBeERwUG5DTzNoM09tSlpYVWdMbGZ0ZktzaXFURDR4bWxhQ3pX?=
 =?utf-8?B?TUF6a0hqRkUwN3phMTZic2hWUm1nUXo1V2lMZFRrMksyUnFlZElDSmU0ak02?=
 =?utf-8?B?ZmVjNG5kRWxGQmxPLytmeUZNS1lUVU1RVGJFWWY1NHZJdldaMnAyMmptZ2pz?=
 =?utf-8?B?SnNKNkp6eDFNQ0ErNEtxQy9COUhNMDd4aHh6YVdyVTN2RFlPRWpwMU93emNI?=
 =?utf-8?Q?3sK3PD16ljwiAL+VWsbw+T7NFhqPQPMe+2ht/6iDQC45f?=
X-MS-Exchange-AntiSpam-MessageData-1: W8h7SmZ5W1X+3Ph9FIzf3usXivueF6hDiD0=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bb09a95a-e15a-4a97-0e31-08df12a524d6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:14:20.8093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IRYBF1RsBy1n1hiivpoxXiZtAsk5HfxGBjqVJGVGASg1Itl1t8it+UF0m1wH3nNqXE9mSyrhtUm+ySIBWMJnxM5fVE+ggfpCn2NeSKvfb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1990
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 21:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245795


On 2026-09-13 23:25, Marko, Peter wrote:
> Please add ";tag=${BPN}-${PV}" to this SRC_URI entry.

Hi Peter,

Thanks for review and I will add this as separate patch after this patch 
been merged. is that Okay ?

Regards,

Jaipaul


