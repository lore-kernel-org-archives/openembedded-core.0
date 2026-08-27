Return-Path: <adarsh.jagadish.kamini@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9170FC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 10:54:24 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33446.1787828063260955446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 03:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=HAn1l9bp;
 spf=pass (domain: est.tech, ip: 52.101.65.11, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kaa/gjVz5R+fZ++panW6N/EJ+4rwVvVOj2CQmr6DcvLSMy3duN9SFT2uagf2/OKamxS8BY3Xrc05TFYDcFMkUFOW1MbH/Q4FfTQ+zUNpaB8r5RjvgHWruMJGhy5LdjMgy+jPIYhjyk0mQdRAn2YYF6c6Buycsvf9XvtadIw3uFo8FdR+YvbuckHTlRINS/1w2v6OgTznjsut9e52vnFKcwvQBViAXbHqdxyi42Nlc0nqJcWKYbnwX7XqSVL8QiprS9VI4tMJ3Zoirb2EtHd0XTS6AMFXh1MMoGJxF+yW1asWuWUu8mEovlNvKa73qlON0H9ad6EATKqAZGZ+DO/VMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/q/iWrMRnj5Z+H10vWU3VeFiBztuwb94gEHZjJfHmg=;
 b=HLgFFskF81DE9/5o1oJq6fITW1gt2rFb4TVMA6jvtplaMBgECl+axz1HEu2BovaunK7HA+2kPK/J92WUXoD+E/R2OA3sr4gu/LWdiuOyyKIJZibhHFpAzYk3RnznYSUVmzmrnks727zYTFQSy3oBKNjFzHpm3ZSvLHKFeEYKqbKsuB3ZS6MZwnRkW82adFAuA9U2tsY96TQuSWNTLTOMXdxUinu2+kEnU5z17tmPbNbgDFdk4jrSaksznuLLsr6QYy+9KGRiqteagf+wVdDysW0Pz2yGM0LrOPulTfeCgWNu8NGn/3DJRHGyr9zoAYCk9xPZr7rOFG/xIz7uoltkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/q/iWrMRnj5Z+H10vWU3VeFiBztuwb94gEHZjJfHmg=;
 b=HAn1l9bp/MPpVpqXC/HGVG9R1EqnnogKPgMgfFsT0Yeq4wp8k3z/QC6Rj/gZkChQzckwODF9rNlGfDOb9kfZTMSpZhjv5F8tqHJVch11oy2C2QgGvEviElls/+pzZ/b29Qc5U5u+ScjBKZc1yD0paooT28T+sfXw5cFFnPtdzkt5TW0nO4fLdfWp10sc20RfQIvUGawI/MpF+zfaRAahn4UYmoJbuCVHw/o0FfQP2yRZtYERtaoQ1dRUhSnKM3d5zyaSXpLRtlHGPb31ZDwSbNZhUgQkWS20PKJmxBUw0/3RLewnzjvVomQec8nUL9QhwQZSy0S9dIXVej2/jr+aqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7PPFFC3D2F303.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6af) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 10:54:18 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 10:54:18 +0000
Message-ID: <b8b848b9-81ec-4a9e-bb4c-d1e196eeb479@est.tech>
Date: Thu, 27 Aug 2026 12:54:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH 1/3] expat: fix CVE-2026-50219
To: "paul@pbarker.dev" <paul@pbarker.dev>
References: <20260824152023.19501-1-jakub.szczudlo@nokia.com>
 <042a154cf3f65594e4d46156f4df835195b68f90.camel@pbarker.dev>
 <2789044.1787732076156082495@lists.openembedded.org>
 <a801b816ecbff66fc39732801eec691af21ce3ac.camel@pbarker.dev>
Content-Language: en-US
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "yoann.congal@smile.fr" <yoann.congal@smile.fr>, jakub.szczudlo@nokia.com,
 Daniel Turull <daniel.turull@ericsson.com>,
 "david.partain@est.tech" <david.partain@est.tech>
From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
In-Reply-To: <a801b816ecbff66fc39732801eec691af21ce3ac.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0462.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::17) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7PPFFC3D2F303:EE_
X-MS-Office365-Filtering-Correlation-Id: 6343a841-2fd0-49cc-1a31-08df04298b2b
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
 ljd0dGVNDJm3JEk4dubPjMeTjK9kXD1zEgBt/KcbChIYEm6cp1jUA1xDab7+fa8ed7XWfcdWnnZsoRwiEh4h8Fs3ftBGOsK8diVmZjGO844c8GBIJKga45KQVtwLX6rSp6f9u3tjxY0lyC8UrAr8KrYYZpsi2itR6fHtxxXpggdAfHgay0afnE0iaWSr0iJzaJdBwsEf2nUdnTDW3uEQi3lXyZsNsqwA/kmndOYZ6giZ4NlvFtUZMQlKFFCnYoLnkDSQZ4MNZZOCqKp8MqkvEsnlCdCJFmVnfQnU733Ljm66cCtTYB7bzF4zOhPJFa9j05ypiDo++mZ/+7stX04Et/wezteeM8dofPWdBbVb6O4cfwv4vtlWHy/AgzP2tg5ImtEFsdW7Wu8BsfZAZV/s4UzRCIxyCA0Xds7sBzfmLE1XyNBL1rALHJvsi7wYl7o48lKrs/7UNMe5Cnvrgyx9VbaBNZC42HNMx71fg5u/7+l1PgrPCY8sHfbtgJcz2f/JCvks+9aMAt18yXIkEW+EYTHW1aS1x//gFSpjnujlEQct6JGeymhALtYJewCmZkxQHDpvijXHcSFNZvoSNFB70zAIvjrZg+H27lRSdMkwhO83snoNDmJ7FN/q5fjReA5pNhft/buUmhmhkNCHG3IG0IPd19lTamnABscj3NwWTb8=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?cWVyVWdNdjh4VE01ZVQzM0oxTDBXT3JRT1ZzYjFYOUMva25zT0lFM3Vxb004?=
 =?utf-8?B?Q3I2T01nM2VPdmk1OGlKT2JNTG1jVy9qaWQ2ZHl0a3E3QnYvL2ZXYVplTnJH?=
 =?utf-8?B?dytyRjNKYjJCWjg2OUVxTGJKMDU0cE5FdTRFSXBzZGhpaGVYQm1CaGNWUnVR?=
 =?utf-8?B?SEk4ZzVZT2dSYjJYNS9QRy8rK0FDemZVVXR3eUVZY3F6bWJueXNSMUJZSy90?=
 =?utf-8?B?aWRzR2dBV3FobTF3SkFzeUpGcTVrK09xZHFmNHA1bXZ3NnNWNHpyc0lBdFUv?=
 =?utf-8?B?K0Y0T0pSZkkxditRUDdtRnF1RUxRMmd6Ky9LQVFOWGJlNkFob1pJNWN3aGxH?=
 =?utf-8?B?a3FTOXR0UXhpWHEwNXBzVjZKRzE0ZGw0M3ZvMmQ5L0lYVjlkN2FvMUJoSVE3?=
 =?utf-8?B?SlNPTGY0WDZLYWVoR2M0Zk1sK1dTR0s4SjhwUTEzWjFhNkpKdS9TTDRrc25j?=
 =?utf-8?B?ZVdNK1NYaG1FU2x5cXdJWnNUY3V6by9rbzBEVzJhT3FGK3g3eWRCVmppanhL?=
 =?utf-8?B?RnVoMVc4QmNHNnBFVHYyZlVPUHUyTFphQm1ZR3dOMEdnM052N3dvbTZWR1pH?=
 =?utf-8?B?RVVVNDlTUlRJUzBSYkFrUkg3SHpDSUc4RHpFa0paM2E2ckszR3p3UlBxdFBZ?=
 =?utf-8?B?MllLQ1MrQWhqSFhvNk0wNjVMOUxoSXY3ZHQ2dEsvam56ckZvcTlBQjVhejVr?=
 =?utf-8?B?ZFJJTU5qOTZqMHJkcHI2OXpFQjUxTXRjaU1saHZxWlRXTU8vQ1pCYlQrVnFY?=
 =?utf-8?B?dTkzZjl1MUNiZWpiaVM0TFlYMkFLb2cxcXBQaDlKVnRGbWRoTjlFdW91LzUx?=
 =?utf-8?B?RkhmVW1WaGhPRjE3dGc1dlNZT2p4ZEJUVGMyZ0hHeWJNZmZoWGRuVUl2R0pn?=
 =?utf-8?B?cHJzT0lwM01XS2FYeUdZM25KODV6OHlJbnRjc0FtUXV1TWRBMXQvQW5QcE9v?=
 =?utf-8?B?Wm9uTVNSWnY2WHZIaTdacEFtU3BMcG40RTFpSWhUTWZDTlVsdG50cmkxQ0FS?=
 =?utf-8?B?R3krY01LbTd2RHFqUzdxRlBUTlFwT0JzdUJlblZDYVdYUnZXOXJSWG43MmpR?=
 =?utf-8?B?UzU4Z3BBdTBQM2owYWtFbXF5QlMxVGlmc0pMbWZsZWtqdU9CQU9kMEl4SVpW?=
 =?utf-8?B?WW1qaEhOZzhNZTlaNWtGVUo4bHd5aGtrcXAvZkh2WlVrM0laWEJncjBLcm5O?=
 =?utf-8?B?K1BYWUxHN2tvNFBFcHE4SzVlenljZERrKzZ6cmFhbjk3OVk3MFNlaFJRa3ds?=
 =?utf-8?B?MndlRlJqem5IaU01bGw2eDBBcllXREhzTDZzcDZCdWZieWRiT2xqdUcxS2Jq?=
 =?utf-8?B?c08rNzNDM0ZscjNKU2Y5Ni9PaitTb2kzQmxwWWpIcFNSbTBkN3NlWFkvYVl4?=
 =?utf-8?B?R2J3ZkhUL25JSGprK0xGOHk2V081bkJnRkRHcHYwME1iaUQvRDNvT3kvNVo5?=
 =?utf-8?B?blhqNHlYdnhuTXJKN3ZLQTVsY045TEdkWkZvbU5IWUVRdmZkMWlobWswa0JP?=
 =?utf-8?B?VExBSUd4R21Ockc4ZnRvQXJaa2xldktrK2pNaU1Rd3E4RXI5N1M1aW5wUkZa?=
 =?utf-8?B?YVd3MmJmS2UxWDFMR0lZYnBzRjkvVXZscGZMZDcvSDdDbzRkcGVUZW0rY0VG?=
 =?utf-8?B?QzNFa0Y4R0FqSitwQ1E4dS80R2FENU84cGtzYmhFaEY1WTZrcWM4NWlEUU5O?=
 =?utf-8?B?TnhwSTFubXpxTTAxZjMrNnV2S2hOdkRqeFNVTlZsemlHNlQ0M1dEZjdmYUt1?=
 =?utf-8?B?UUtiQlcyTVJSQ1RCSkdrWWQ5dVlzbGpaZm5vdHBkc3BXVmRBTjVaY08yZTda?=
 =?utf-8?B?RVhDR3BEWHYwQUVNSUQ4OEZHYUNtSmJsOVh4VkNOTU1idWpKblFxSlo0ejdq?=
 =?utf-8?B?Mm1CdEpTMFZYNVZZTzE5bGE1eVN3aHlYYXRSaGt1aEFqaHV1ZHdHemYra0d4?=
 =?utf-8?B?djBjTXJVTEJUT2FiSGZtZTRkVXRrZWY2eUdvV3R5eU9WK0E3RGRhQ1AxRHRl?=
 =?utf-8?B?MTZsS2hsUFc3ZzBEWU5waDd4MHplL3BkZ21tYUMrNkJLQjFmOXhmd2FhTGVi?=
 =?utf-8?B?amE2ck13WjV1dU5XdXQ1aVFFUWdJOFA4RUh1b2NxSEFUc1dxanlWWjVUL0lM?=
 =?utf-8?B?dnZiLytPOWk2TnFaa250cEgrcHkvMXg2ZjFTOUdlNnNqcVZBVSs1bE9tVjdX?=
 =?utf-8?B?a2Exb0dWOGZOQzl2VnFCcmdYWU42ekVkRlZjYTRqTEorYkVVKzVIUXhwR3pq?=
 =?utf-8?B?cWpaR2YvMk1CZDF0c0ZLWlVaWVNuOW56WTdoRXV5MDdGNW9xNTdTbmR6VEdS?=
 =?utf-8?B?cGZzSU5iaitMc1RjVHpYbVJPV0N1UnJYKzBqUmhhdEFZR01XQWpldEJoMW5t?=
 =?utf-8?Q?nFZdwjksHiVDKm4s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6343a841-2fd0-49cc-1a31-08df04298b2b
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:54:18.6840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0k0IrO2BV67ZyB245VeVxfpgbN5aWKVJ19gBVI02MXfLTOsEMr4GWz0ecvCymfCbrQH7DiI/0TXvZ1HR6Bj3ZDEM7GsvZ9ttfqpu8YEA2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFFC3D2F303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 10:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244474

On 8/27/26 09:27, Daniel Turull wrote:
> On Wed, 2026-08-26 at 01:14 -0700, Jakub Szczudlo (Nokia) wrote:
>> Hi,
>>
>> I understand this CVE is bigger than I thought CVE patch can be.
>> Maybe we can think about updating expat beyond the fixed version?
>> I now it's not the best because it is stable branch but I can't think about correct solution.
> 
> Hi,
> 
> Upgrading expat on wrynose & scarthgap may be possible. We are carrying
> a *lot* of patches for expat, especially on scarthgap, so it's worth
> considering.
> 
> It would need a few things:
> 
> - Review of the delta between the current version on these branches,
>    including the patches we're carrying, and the latest version. Check
>    that there are no features removed or other backwards-incompatible
>    changes.
> 
> - Confirmation that the SONAME changes won't break anything.
> 
> - Testing.
> 
> - RFC patch on the mailing list with a clear subject so people can see
>    it's an exception to the usual stable upgrade policy, explain the
>    review and testing done. This gives chance for people to object if it
>    will cause issues for them.
> 
> - Agreement from the Yocto TSC, based on the above info.
> 
> That all needs some time investment beyond what we currently have
> available, so if you have the bandwidth to look in to it then that would
> be welcome.
> 
> Best regards,
> 

Hi all,
I agree that expat should be uplifted to 2.8.3.

I have some comments/suggestions regarding this.
To verify ABI compatibility, I ran abidiff 
(https://sourceware.org/libabigail/manual/abidiff.html) for expat 2.7.5 
and 2.8.3, and can conclude that there is no ABI break, and can also 
confirm that there has not been a major bump in the SONAME.

I want to point to our fork of 
meta-binaryaudit(https://github.com/nordix/meta-binaryaudit), which 
wraps abidw and abidiff into a Yocto layer, which then can be used to 
compare ABI breaks in the packages.

I have also analysed the Changelog as suggested, there has not been any 
feature removal, but there are some opt-in feature additions (disabled 
by default), and new Autotools flags. I don't see any 
backward-incompatible changes.

I will prepare a patch to uplift to expat 2.8.3, test it, and include 
these results, and mark it RFC as mentioned.

Thanks!
Adarsh Jagadish Kamini
Ericsson Software Technology AB

