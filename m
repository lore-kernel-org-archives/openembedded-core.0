Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157A9C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 06:45:14 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.835.1787899509094561113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 23:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=DGamhLk1;
 spf=pass (domain: est.tech, ip: 52.101.83.35, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adqvYm7xS+n4PVbQG6Bbg7mitf0MTNKWtBer+LzYZyvyZk5AcJ3LcJrgbRpBmT6TKMCiSu1USuYDwo4f9NnsFiOE3vK+fV1vn8m8/RzPbyGsfUJkXEGIf0ZHGGMcg5I/qOTXM81g8tEL8TrUt0tY4XHwdMbhfgCYRxUCLebVmqAaLvQwXNVkYdcFl/dYa06IekjRjs4ByQQjQ/U08wC3558CJtg0v9Q1nKXmjtIpVWWKlUx80wtBBPHYL/R7wXKoDNdNAgxk58eKpZcXCHVfqtAtLqBj3gbybQVck8YUxTpv1suNySptUUFlBqXQEG0IvqQOAq5ldk7hTiMGK1npkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2toJMkeZyxyRUKy2Igt6xxfZ7Z6hLb03C9a/R9nO1cc=;
 b=jT+mLJtBXRvyPQCW0nZsPUxWOC+tUDlC+Js1XwOAtvPHHfJh+y0EDGGSl/xK2UQJ/2VZLBOVb1vy80IJBrWaWTPi7Tmdg7Nw667aRRQRUghw35yk0o6c9SHsJ4MtyOL1vSWE9YIV48iJ2gulF/nAX8X59ADo7d0tRvFCSo21XnM/2zWy3dYo0mRff8NKLkTCZZcoZeMzHkreffuUTAdx4P0/XKDC7bDO9CTCsTKLz9uTTJc0jcnVI6g1bK1Fr4Z8j+2FsOQ/7qHAMAmtW6ebIoeY00V2uQMNnWDAtHctjsHnPm0AkotqQaF45QFboKoE4jNPqVNZBi6pUb2oiLuA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2toJMkeZyxyRUKy2Igt6xxfZ7Z6hLb03C9a/R9nO1cc=;
 b=DGamhLk1HSFSf9IRvpuxrV6Bks8ryLBFn9If3vAtOGjS3w6CJthi84KLlmk1XpCOD4a4nA9ntD7HivI5KQXRNSmDx+4uI1lU0F1tfr+IrCOOYCfZrCJsiRngJW+2AOkdYrv9dlhjBCi2TNjrvZzJFBcNHbeIJpowgyIztFLRLDx4p/B+uOyCrKt142xHV/tkg9NSjljGl0yT95GeSDOt+GmJRD+C3l8gQxJOmiZoy+AZWq3UQS5tfUeudDsvd9KUaea6gThCdoP5t3JsYpbR4xzneBcT6csHBTmNL9ZU7JM1dW0R672UwOb896J9eaHpKY2nOnXBBL/UnXEtAg1wWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by VI0P189MB3113.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2cd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 06:45:02 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 06:45:02 +0000
Message-ID: <d5e4f76a-1f84-4822-bff3-76422e4463c0@est.tech>
Date: Fri, 28 Aug 2026 08:45:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-4360
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260729093555.426053-1-leonid.iziumtsev@est.tech>
 <DKZRZV1Q6L2C.3AZRHXJZ8RXKV@smile.fr>
Content-Language: en-US
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
In-Reply-To: <DKZRZV1Q6L2C.3AZRHXJZ8RXKV@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::16) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|VI0P189MB3113:EE_
X-MS-Office365-Filtering-Correlation-Id: 7147ac2c-c209-40b7-1ac2-08df04cfe33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|10067099003|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LDw/RzGySJ2cR7ZVA7/hZcDtLviS5sN5xnpjrUFsuSwvu6y2oi2qsZ96HEU+w8zjdchhfF7uL3Y/yrjE4szwXemXpIhwkcIJFoHMIexJr0UcMlnvgBk0dk+AAm4GsZiqVE2AzvWhWyr71OFdLlaLrzFc0zoWUdre/qJl0Bk/j00OMCCaKQ6VnEYY3SuSjy91fgeC2QDY8DxpC6SRPOWZ19eMNart9hfJHzZXND/k7GF/JDZs5GAC6ngJjcXdtuScNC4K2Ha5nSRZ9ffRXlpBW8YrwKBJad3ptJHFWDPngZVwTrcoMwmtv0/Snd3Owu4LriOs4tlsqXn6tN22vbjrKtNAo19/q1p+yTt0lGe3j+7A5tUGw0DaNZB+RxD9FGASGsre5CjUsYTND7uT8z2P6RV7GSC606O2NHV7Fu66cn68LpzEN9/FCDh4biHIfX17gMQpnrdNFpQjxA+INVlTa95R3Lp1TohBrU/r84NHfIPFJ3WYBBrFKYyl7+EzVuNxZWtM3FXXWfeM16aFBpgY7fm0zT1/IhdSuplsdelDGLD+LIp+D/PqOeQb7JjmDVJcvJxFWyMbEYGpr38gLRbb0NqD64h884L3vhum6dcBL1vDLcOH9l9wrJVTJ9PDa/z2aPbbkb10eHbqUOU75YhEY0W9+/9O15CTh82/9c/GbDs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wld5SDAwVlM3M2VkR2JvWDBaRGxIenEwajBOOFp5VFVrNXQzMlNLaFhjZjJi?=
 =?utf-8?B?ajg0Tm1GakNsYWZJdWV4eHlRZy9rVVFPZHozY1NhSUZuRTE1eHNBeU9FcTdi?=
 =?utf-8?B?dmljYThzWW16QUhaSXI1RUFOdW14WUVjcTlNYW4yY2RyVVN0ZW9mMTdxVE1H?=
 =?utf-8?B?NmM1clR0a1pYVFkrcEVKdmU0em5LdlZmWDBnQlBSdi9iSGRRWlR3WWJUdVJY?=
 =?utf-8?B?eVZhVDlySmQzaWxWWGZYbmRLd2s1U3FKUHJwb3hZN3Q3eDJaMVlMbkpaTFFy?=
 =?utf-8?B?Q3JqWFVQR1p5V202NGI0dEZ0eldYNG4yNEtWSDMvZ3NKUCs5MTRpSU5SbW5u?=
 =?utf-8?B?N1RrNUtzMm1LVE1xNlVaRExldStvT0VURmgzNkNtSC9xNHpwUCt6S0RaSUNX?=
 =?utf-8?B?a0VzUnlQWmtNYjFpOUtLL2I0MHU0UmlrajI3cXcrSHZjWVdzOXNaQWZYYnQ0?=
 =?utf-8?B?WDJpditPLytnbUt5QUpocGFlWHJkejRhVnRLczZMc0hTaVAwejdTMmR0WThq?=
 =?utf-8?B?UExCOWV6bHNJT1RLdXRDVFlFYm1ySm92OGsrelJMbllVTHFZeVJNbVRZMWRp?=
 =?utf-8?B?WS9zMHNJTzM1YVRIeGhybkpKVXE0VnJJNFBDMjlsN2o4aGp5d3NadFFRUi9U?=
 =?utf-8?B?cEFDN1B4QVhVNXozaXllWXF0MEhERysydFVrdmpWRTFjZHpyc2Z0VTdLMDFD?=
 =?utf-8?B?ZUY1OXEyZTUyU05TWjQzNWlUeGNYSSs3Rk91b1lCaVpjbDZsLzZaaThha1kr?=
 =?utf-8?B?N2pOY0dWU0VKUXlkN0R4amluaThueXdpQjVMSkZNdWwydVE3UkhXN1ZDK28z?=
 =?utf-8?B?RWR3ZmFmOHVVT0hxdFZyUmtFaU80Y0tHK2RKcTBsSEdHVVNWUy9zK2h4Yk9W?=
 =?utf-8?B?cGlBa0U0ZGRkSW82Q3lGZnBVNkFad1FvMDUrYXBSZE1UTzUwdTVpdDFnYzQ3?=
 =?utf-8?B?ZDlCUk4wa2U1UFlCNVo5Q1NXc2JoSEllSjgwZTZYdzI1TGNTSStoN2h6UXJn?=
 =?utf-8?B?RUZNYTdWc3ltR3BpU1gzbzlKRndMWFRKQTBMTVpxMnNkbmlaZFhEeUtkbENT?=
 =?utf-8?B?UTZ1NjZxaHYvbnJmeXhCS1pnVjVYKy81Wmp0VW12eFZJelpnZXd5TlNWcXJT?=
 =?utf-8?B?V2I2WlZzRHRrTUdPWERJQko4WFREYWpaTmkraGh2RFREK2xMdUlxNjdWcjh2?=
 =?utf-8?B?Wlg4ZVVRazRTeFNhL1NiSGdTRnYyVWVoM2RIQU5aMWViMmtzbFVLSGVFVDVW?=
 =?utf-8?B?YWRZeEcrYTB2blA2Q3V1LzByZ0hSZnBSSHUzQ1hYQjNLRFFVd3c4UjdqalBm?=
 =?utf-8?B?VXhOcjFZVURObk11Z1dCa2JMUmhVTDJiRVB5UDIrZEJjZmwwditpT2pRUndh?=
 =?utf-8?B?bTBURzZTRDFNUVNQZzdjOFRuaDgxQTVKYlZmV085SklRM0JyREJoT2hKUm5J?=
 =?utf-8?B?YlZTOHRraHRtU1pjamtmbmdMNHZUL2pkclVPbnhFa3lWYXNXUDYzSU41dXds?=
 =?utf-8?B?R3FGcEFzL21VRm9DNWVyMHJZOVpMajJlcU1PTGVMdVluOGhrSU95SHJRNlhy?=
 =?utf-8?B?ZVVMRnVJRzVVSStiYThrVUYvb2ltcDd5RW1zOExEWVpOa2E3akVHL2MxMFlN?=
 =?utf-8?B?ZFZ2Zk9sa0hFQjZwdGx0OHd5MjVsNlR5T2JRbVNGL1R1V2FBaHptcmhJeDNl?=
 =?utf-8?B?M1NobFFNK0tkYlhHNnAyS1I4VU93bGxPelpsOGxLdDNWNVVuVVhHUm5FblRS?=
 =?utf-8?B?TUthUHZaajZqaVV5clpJN1ZYTHQvMmFiZm9PdzhZWFU4VXBIaG1NcjVSRW5o?=
 =?utf-8?B?Z2luSW1pam9TU3VQVW9lenZuSnhFZUV2ZTMydWcwWi9hQy9OYUk5V0JaYWNJ?=
 =?utf-8?B?SURpQnBVZEF1VllkczZmeFlHMDdIeUhKektMbWZUWG1Db2t2WUVoRVdHUlow?=
 =?utf-8?B?WklpQit1VCtybFU4TzZHQXRpdjZpb3BIajEvTmIrVGliL3ZCTGx5dUhJZGtP?=
 =?utf-8?B?RGhoV3lBbTJlNUlzSy84MHZIZjFRems1TFVIYnVHT0FCWk5GZ0VkOTFveGVM?=
 =?utf-8?B?UnFiaW1NSXgzYmdEb1d1VkhSQmpPK3pHLzROb3I0R2dkYXFseThXNVJ6MDho?=
 =?utf-8?B?M3JOeG00MnVYOUlYRnBDTE13WWVqZmU2Y3BQUFJyZ1ZEdVdjcEV2MXN4d2hP?=
 =?utf-8?B?MWpBOTJxanBzeDhyMko0alM0ZTJpYlkrcG92RUZMeXpJUUhvK2hwekV3ZVR6?=
 =?utf-8?B?SHJ6cWR6MERxM2NrcHpIdWNHVHdSZEc4WlJvcmNDQnpsbXhPaXBEelRWU1or?=
 =?utf-8?B?N1BzNVdrbWE2WUVSQ1orK2JsVnZPdTNRaThRZTRvN212My9za0E2UmZFUTlK?=
 =?utf-8?Q?q/uWCQ/ztJ+L32+GYM8BTe1oFc571yzoxLqG7qXqwyls3?=
X-MS-Exchange-AntiSpam-MessageData-1: RaqR+pf+dJz3oyXyharngBEUzn8y2DxDOfk=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7147ac2c-c209-40b7-1ac2-08df04cfe33b
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 06:45:02.8026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir/9RhOHDUhNDI0XXO4liWLgNLx5pwdfkR9pAp2Fh49XPL3S4BLIB7huZTpKzgOGBEpIlggaiEda0EuPpSHmu3eyUTB+hQSdLHsdCe9B20Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 06:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244516

On 8/27/26 15:54, Yoann Congal wrote:
> On Wed Jul 29, 2026 at 11:35 AM CEST, Leonid Iziumtsev via lists.openembedded.org wrote:
>> Backport patch to fix CVE-2026-4360.
>>
>> Reference:
>>    https://nvd.nist.gov/vuln/detail/CVE-2026-4360
>>
>> Upstream fix:
>>    https://github.com/python/cpython/commit/5e0ef3f1afe892e4f64eb83368db57ac4c40cba0
>>
>> Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
>> ---
>>   .../python/python3/CVE-2026-4360.patch        | 148 ++++++++++++++++++
>>   .../recipes-devtools/python/python3_3.14.6.bb |   1 +
>>   2 files changed, 149 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4360.patch
> 
> Hello,
> 
> In this case, I think we can consider upgrading to 3.14.7 (like master).
> Can you look into this?
> 
> I'll hold this patch for now.
> 
> Regards,

Hello Yoann,

I will take a look.

-- 
Best regards,
Leonid Iziumtsev

