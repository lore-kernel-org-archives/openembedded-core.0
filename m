Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.125])
 by mx.groups.io with SMTP id smtpd.web12.4844.1601029887402564124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 03:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=XPTRvTY0;
 spf=pass (domain: prevas.dk, ip: 40.107.15.125, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1PwITNoAf7JPrgrpRwlHC+Vxeht4feQoBJYy/n/kLTA/w9/BkrqYB8/VEidqId3H1iai3wfYoTa1xRYysPT+Yr5YsVABqljmiYOQetyy/MrfST8qu5yKE44OcZePO7NjE6wsh86KgnBsDf/dXSS+QhSzOnF5I2mTYjdPhT9oE/t/TH8WTFzeJz1HqhJmuAjByl3J3qAld0+euIFWGUV9nalBZZku00nlIrXXxUcVPtGxzOI1unSZ6I2VQu6c22/Ks91myLpbkKtw4knN8lf3BKtW84c5aFwwzzr+iUan+DZKy87MFoMKr3l6s1xSQcux/frcRuNiEClEVw/WmRU4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVP3GMQ1DD8PadgGQ6zqDq20FkAO38vEA81XvO8wQaI=;
 b=Hx8nWPV1fDvbCrVUGv+2axqy+xVNo/6hMmjdkbZt8f6fm7fKbuJrLxPJCl0gkReRDfOV4dWtkmpiRG6v6SpoBskfkbdwgXMWMEldW7/HL/mY084F8Y2V/6XDSRwkhaBLXGzCtaqHUJuGZ2eyA0ZZ6DNkReTlXUwf8/5ohUNI1AYCe2Ac+uXyKbSc0J6ZB2949Xp8pRixzII6ean4Jr6RiWsWbiWGObW3OOKTpNLzHBwFhRgNT6Uxggs+D1V6+XSNLmiEgGct7bXBUjkc5kaLMbM7G3xzf4con1HuETobjcvAV83fPsyYWgner/L7S0ogxwA9uMZ3DCp6ABpvRBRXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVP3GMQ1DD8PadgGQ6zqDq20FkAO38vEA81XvO8wQaI=;
 b=XPTRvTY0svwz/8tShQLf8YCZcZCyVTyNCJ22d89dW4hVyMR4dDjoWtiFqY/55GLFOlRyvj9PAZKmY47o1zvteNr0bIfL131M7rfHCZvztJ/UpVgDG0PcNwS3nmMnj8yUzzOlvCyefFjBeRzwC9KAaKsmkxWCSP92AkhCrFkz/VI=
Authentication-Results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:4a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Fri, 25 Sep
 2020 10:31:24 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc%5]) with mapi id 15.20.3412.020; Fri, 25 Sep 2020
 10:31:24 +0000
Subject: Re: [RFC PATCH 0/4] fix externalsrc task dependency issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: parkch98@gmail.com, Steve Sakoman <steve@sakoman.com>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
 <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
 <4a415c1606881f5f2786a51405c46b978443ba73.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <e923307a-eb4d-d716-82b9-ca420a317eee@prevas.dk>
Date: Fri, 25 Sep 2020 12:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4a415c1606881f5f2786a51405c46b978443ba73.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6PR08CA0041.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::29) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6PR08CA0041.eurprd08.prod.outlook.com (2603:10a6:20b:c0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 10:31:24 +0000
X-Originating-IP: [5.186.115.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b4d2385-c925-4c05-14df-08d8613e272d
X-MS-TrafficTypeDiagnostic: AM0PR10MB2065:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB2065E53A40C70C3372FA47E993360@AM0PR10MB2065.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F0hc2NxUTOMHLkcBosIVf4Ct53SglMVSKtgDTOW6tacXIHvl0mrfufD7KXAsDWHS6CjAZUV3XuZ1Ok/u2MWTVQz6YbuLupWzYrPXfN0iG8LGx5rCgysK60aWOpFkoe6d3ANNRs/u7lwebeC0D5EeCrvlP4sjVCnfuEaDoLXyPWJnxVDSqDaWB78lRS/VSjGq8jrziY7AExc5Plzw+5W+EPFnjH5Y4ahXRNKmRSPR5Q8S7q69N6NgL0EC+g3wv6AGqJfOYY224FP9KaenPaxe0/AXkD3H7l2tdUyBcHoUBOsV3S4y6OIlp23hlwJOWo1SV4bQ1zyubqVpnIhDGVF32vp54nbacbd3Y1dHXqxQh+TTxuZ26hOakvYy2SACmzTu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39850400004)(2906002)(8976002)(8936002)(5660300002)(6486002)(26005)(8676002)(478600001)(16526019)(186003)(52116002)(316002)(16576012)(44832011)(31686004)(956004)(2616005)(4326008)(83380400001)(66556008)(66946007)(66476007)(36756003)(31696002)(86362001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	57VeXbffTzMbkus+cjb2SAHcKiZysbciovDbZdoIcZg0k3LCxGZF5PLG6cmhOyrORy5rR4ZJGS/APuoJeSN9aS85aCmnLlvDYGIkEDRrvuwhKfWc7N1f9HNuBCxuFs+DG6wANVCeew0kVOm0bboc8vXP523cKOv8JaCTfvh9JLJDi2JGOySxcMfr/CM/RR8VPph51HpZ45VbqrtTOVTmZ0DEpB6fDhWITa5IDh+8C9M+9xD2CU/mS4sT06M2Ndca3rINzdXVaEQbhgZmtfEIpSD6JGojpCGmO/lusQuxLTIT4vJsnDwAZ1kvY5ebibQfLVeRbpsVB2+3glKNFKB0piOoyYzlWNvxL48HdTWDlsXPDfIuoZbL3+kCGfsZb9rDME8eI5SYvkfRpS80l4tkgavKmzj+fTWCOrOJqhtwMMPad/ItW+G+9PnIO8Nu+TxxqhRq+KwOqQJxwmBJ7SsiUcb9Q7t7+hrxVdNW/Q2y/wtC3i4ew/8sE6bOKMEpREEEssLpPFxdbm1jh1hEWz9/GM6ufJ/sXQANLtnUY7cqcBHihJpEtjPkmwWQeo+zlhFZxdKmAGMnQCG6+6DmNnymDGKVw6rxK/uNReSyqQDwQnaeO2ilW+BeeKzYmByr4oIXWUWR1Bntckr5oHRcXV6MzA==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4d2385-c925-4c05-14df-08d8613e272d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 10:31:24.8926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyo/PPgB2GrpglEqf8XTiadalsm5l3Flfh5p4+Vj6mSbpOWsCJDAKJjJIuP+noHygSmFJkpIILPDmOUr6DsP7U8LJsSl0/V9XHlxLUaIRxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2065
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/09/2020 11.22, Richard Purdie wrote:
> On Fri, 2020-09-25 at 11:06 +0200, Rasmus Villemoes wrote:
>> On 22/09/2020 17.15, Rasmus Villemoes wrote:
>>> This is all entirely untested, hence RFC. But if this doesn't work
>>> for
>>> some reason, I think externalsrc.bbclass should grow some comments
>>> as
>>> to why deltask is used instead of the noexec flag.
>>>
>>> Patch 4 is a revert of patch 1, but I did it that way to facilitate
>>> backporting, in case patch 2 is too dangerous for backporting. If
>>> that
>>> is considered safe enough, it should be enough to apply patch 2 to
>>> avoid the churn. In any case, patch 3 is just a little
>>> simplification
>>> made possible by patch 2.
>>>
>>>
>>
>> Ping. Chanho, can you tell if this would fix the externalsrc problem?
>> Richard, any comments on the deltask vs noexec usage?
> 
> You started this patchset with "This is all entirely untested" which
> I'm afraid made me rather nervous. Much as I'd love to, I don't have
> time to debug every patch series people send.
> 
> I'm fairly sure the deltask vs. noexec was deliberate and Paul and I
> went around in circles on this several times.
> 
> I have some memory that at least part of the problem was usability. If
> someone can "see" the task in listtasks and trys to run it but nothing
> happens, its very confusing for the user. By deleting it, we make it
> very clear its not there.

Well, perhaps listtasks could be taught to say "[noexec flag set]" in
the description - currently it seems to be somewhat random whether a
class uses noexec or deltask.

Oh, and for debugging task ordering issues, it would also be nice if
listtasks showed tasks in topological rather than alphabetical order -
that won't necessarily always show an implicit dependency that went
missing due to a deltask, but it would at least reveal some of them.

> I think there were technical issues as well, such as recipes which
> inject other tasks between unpack and patch. We needed to stop those
> other tasks running too which deltasks does effectively, noexec would
> not.

Eh, but the other side of that coin is that there are obviously tasks
injected between unpack and patch, or some other combination, which must
_not_ be prevented from running - cf. at least the two or three
workarounds that seem to become unnecessary. So can you give examples of
such tasks that _should_ implicitly not run when externalsrc disables
(one way or another) the SRCTREECOVEREDTASKS tasks? That's actually the
RFC part of this, I hope somebody with far more knowledge of various
corner cases and odd recipes can demonstrate why deltask is more
appropriate - and then, as I said, some comments to that effect in
externalsrc.bbclass would be much appreciated.

I think it would be weird for a recipe to inherit externalsrc and at the
same time define a task ordered before do_patch, then not expect that
task to run at all. So I'm genuinely curious how such examples would look.

Thanks,
Rasmus
