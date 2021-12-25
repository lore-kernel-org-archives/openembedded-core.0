Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407EAC433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 21:09:41 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.78])
 by mx.groups.io with SMTP id smtpd.web10.10849.1640466580300246350
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 13:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=i27xS+bK;
 spf=pass (domain: outlook.com, ip: 40.92.74.78,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCNab+CjN8mEoZ98+rcEslslhZGrWsHFt1OkBfszmPc/wwuLnclOchVz430vHKLP2t54kZMdNYXheAG76J4RXU22lw/rVwzGUZer5txdp4Tvj7N5aObzRKGmCDA2QYaxRL/zdo3acQN+THGzt2KPXWjL6obuE4uElRfaNomP82zz8OyZhdy6VIXNWmhhwazIywT6V/L2Ji4MpRsPXQKjB/yrb14x5l16NBLLzf7TktxMuKso4dFEZ5qjc2LkFsw5n0Sox4cjbLp2KyX4NpKIRAgrcUTe9Aw0WGdo41xdJyqaJEoaptVyck8Qn1+3Er5a7R0XHp5tvEDIZ8nl5pa6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GL7XaPS1VgJvVwXRsteA+vNxZJEUxONeBC1oVQt0S4M=;
 b=e/9HUZY7/g0Yw6pRNe8uaNZuTQkpDKiBKXjhW5WcVYiGel38ANhctqdBC7KmVFUAy2bAbqGZVHFMHfGUyyK41i3W0lUF2yGbSMBL+ejvog73kALHVaHK9gn0P4KNbiE8X1Lx/InnPYn9L/uxl17i7F4r5FbhXj21pYv/CImI4sr2hFsHI9YlyEJq+cPTQrgLQhECBCmUsgF2y1VC34kymVZ8KKkYtcdbWfc8PbYxdpPXYl3jU5KaNmcZpbZeBspa0FjL+Cgb7EWe/FTKWCjhoS3R1ZXTKbZEykYZaBu/zg6OEsgR0/1o+iuekoNu1YeE0UG6Munxj03J8+3YHxpE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GL7XaPS1VgJvVwXRsteA+vNxZJEUxONeBC1oVQt0S4M=;
 b=i27xS+bKwNYc3zu9I7VfwZ+DcWbTWb3J8tW8caLnCLa/7F1UQpkuwJdc/QmXirHa3NzTm0XKCwIjFEwXHmyG765OG91VpLFxlozb5hk6e3UZu5j7Kfz/9uKJG777+2w8TC8WJ+u1p/rMjqUQiMnDt1dbYXfTQOYBLElS84LCKr8WEwYbWr6CmaeyjhsT99oUa9JsTwC3XvNKNMBlE3JkXTfxdhAH5RvDcgVHx5Vz+3ePurD6WCphJqdr7CzUPOOU6Pvj7bt7UYUiXRwEh8zvAYiq1hiSi/1NCX/8kFhHtNwT/lfM/p3zEu9TtEphQ2Zo99D2+OL9EwoGAwdGMtMjxQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4388.eurprd09.prod.outlook.com (2603:10a6:20b:162::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Sat, 25 Dec
 2021 21:09:38 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.022; Sat, 25 Dec 2021
 21:09:38 +0000
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
From: Konrad Weihmann <kweihmann@outlook.com>
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>,
 Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
 <16C41A407A5C2599.27787@lists.openembedded.org>
Message-ID: 
 <AM9PR09MB4642B580A2438B5FB960E5FEA8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sat, 25 Dec 2021 22:09:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16C41A407A5C2599.27787@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [q5AVk/HbAlo/sqZhwoBQmIhuy+R1ApKwM3xfC8zaxiEhdrBMK3xVFx+HYBTfvCsd]
X-ClientProxiedBy: PR3P189CA0034.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::9) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <efbd6bcd-81e7-210c-8cf5-ff7ef521dee4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46282b65-b673-42e6-ec60-08d9c7eadc38
X-MS-TrafficTypeDiagnostic: AM0PR09MB4388:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zxuZQ0a8gu978D4pm947nUkrJywqIhvCIcAMNZUITsBrNSaFCZDg6lm4n09ajI5/J1whSXH2M8OchIQapMtpm4BOVvVdRE1bqMLVFC+Lg59W+SO0Dtga5IumWQlSbm/r8ZHX0ZiOGAnHIjVfaFVz/h60XxM2xTRXQ1VlQ++YoyiVeypoyKbRgEKJO7g+JVn5I1p+q0s8W8wEYDxXsE18RkwtHWm19vQ5F3XHBgv9fUb0qAkFE5+aVCcgTcovtb7CZ5ox8Nvnv9IeAoFHHdF1SZJAVS+YdJFsO7B2HB+OFqcJ9/RlqAIigELLv5K0hfkjijns1fwkZtwy7CoyYhdY2NzkA7NovOeRQ50ut1y/tBWfqXO+UBvB6imjVeJdsp3MJlPWobbutk5HB2yLaIKCCcCozdo5LkSzphMGlW+eqXiAIybBkVKZN3hYSCEHtbqYcDTgWPLT69HkE3ohZ9nE7gPrJqqX5j8jvo83+vOTfikBPcmyohYdkVrhZoCe/E9YVCheknIMLi17/NhwO3ckRRa1c1J/bwboWoatkSjYF6rtARrCEl0GwSxKV/od7w/02ayVoFY1PTcpSENwkGgtp60FDjiZAUUpx83yqKGj/JWZ9/sOryATThSMMtWWzjAReR9zpr/BsIaFbRD92TF0JsUsZZ7vBesN9FbWh9/g/UE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlFFWVczeWxhUTYzWDFSV0d0djFPN2luSTFlU0dlZE1ieTBUZFlVRExaQWRp?=
 =?utf-8?B?WGcySjY3UzhmdUxWK1FwRkcxTXdsTnhTYms4R0tZSllmUEFjdko2blQrby9a?=
 =?utf-8?B?NVFVNVhVZzhiTlZHY1k5WWtmaGVmcEg3WWVnbWdvcnZUQTA1cmdWaW9nNyt3?=
 =?utf-8?B?bUhvcE9Jc0VUSHhtYi9EVStrcndnV1J1YitqR1B4aXFHdnB4ZEhTcDNhWkky?=
 =?utf-8?B?RmRwMkl5Qllndi95cVhLSHhIRzBDUGdkTTN2Ujd3WVpTUTlsQU9ZZUY2WlBM?=
 =?utf-8?B?R29uYTgxUGM5bzZvVSt0dVphT2kyNTU3WWg1UHRESU5hZ1pyT3J2RzNja05U?=
 =?utf-8?B?ZFNGbnU4djRGNytkV055cy9uenVSNVkwUDlaMm9mN00yQ1VEQ2RyRk5lKy9K?=
 =?utf-8?B?K2NYMndKbW9QTWdEZXByTFVrc2lTUGtjM3g3RENBdjhRY1llaStZUDRpMmZG?=
 =?utf-8?B?THNSWkRsdmFOVGdmSS8zSW5PZmlDMjR6NFJwS2lDUHowRzdiT293Q1VpY282?=
 =?utf-8?B?bElaNklTZE1UbEZmQVl1R3g2dEZEbGZTdWZnZDBFMjUxK2V5SzJhSmlZemly?=
 =?utf-8?B?dDNQejZCZHlscWZiZlhLL1RnNkZGdG5NQkx2Y05aVUhnSGw1NDF6bUx3d2kr?=
 =?utf-8?B?VnVxbFcrSGxuOFg3eFpDeHZ6cWpPRmFreW9rekI3TUluNmQwQnJ2NVUxV1p2?=
 =?utf-8?B?MFVESGlwTi90WjNSMWYxRFdTZWhrQTVLdTgyZVJHNlM0Tm95azdZbHZiL29P?=
 =?utf-8?B?bHh1bzVjMVF2L2lIcitXNEhSS3crSWRqRkpFTVFUVkpqMEhlUUZxeEdoQkxR?=
 =?utf-8?B?c0wySmEvWE9RL1pWTnU2Z1RJeHpXRlVLMCtzYXR0SDlYUExZa09zNlJ1bkNE?=
 =?utf-8?B?dGZ6SFBpOERXbUJZV3l4ZWs2OWU5NERpMTFuUFFjNFl2Z1N3Mk45QWplcldZ?=
 =?utf-8?B?dER2SzhkanFpU0tNQ1ZXK3hBNFNJakxzc0hYL1dLTXBiWjJmZEN3VDluNjBG?=
 =?utf-8?B?b2k5L1hUZUdCNmUxbmYwdEFaZmlUeFNPdnN1R0lGcEcrRkdMUWhCMHhvelMx?=
 =?utf-8?B?YXNUOU5aenFlTVhuWEhFMmZOYk9mSFBsQXJSSEVsR2FPTVRncENiRTU4VnpC?=
 =?utf-8?B?NjZvUHN0a0NiK0JHUngrMmsyMVdZc0ZrdjFCdHExblFzYTN6Z0J1Q013MVhk?=
 =?utf-8?B?cWhnNy9IN3NJd3hEZkVabDgwT3hRRDdGRGFnekZFVjhIcFpYTDc2cjhDcmVQ?=
 =?utf-8?B?NUxrcTlhK0MrZ1Bjby9DVzgzRnppU05BRWU1RXdGRnh3UDlXckdzazR2TG43?=
 =?utf-8?B?ZjQ2VzVHVzhZVjlObzIvMGJOZ1diVldTS3BMcW5hc3JCeTRrZ3hqL2ZXV01a?=
 =?utf-8?B?VCt0dXVlTGJrS3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46282b65-b673-42e6-ec60-08d9c7eadc38
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2021 21:09:38.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 21:09:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160010

One more thing that came to my mind is that the project is missing demo 
recipes/real life examples in core that actually would show that one can 
achieve reproducibility in the sense of the project's definition for 
both npm and go.
So far there is the fetcher code but real life users are living elsewhere.

So one could add consumers to core or push the code to where the "real 
action" is (meta-virt for instance comes to my mind)

On 25.12.21 21:43, Konrad Weihmann wrote:
> What I so far don't really get is why increase in parsing time is such a 
> big deal.
> I admit when we're talking about npm it's some kind of a drastic 
> increase in recipes one would have to maintain, just because some random 
> project decides to use a trillion dependencies instead of writing two or 
> three lines of code more.
> 
> Still I come to think this might be actually beneficial, as it shows how 
> broken npm is from a distribution perspective - as it may be that some 
> users actually start to access the situation when they are actually 
> aware what monstrosity of a dep tree they are inheriting by just a 
> single npm module.
> 
> So this is mind - and I don't want to sound radical - I would rather 
> abandon npm and go support in core than to sacrifice closing the one 
> main loophole in core that is preventing true accessibility at the moment.
> Which is uncontrolled fetching outside of the fetching task, as this 
> invalidates everything you will get in the end in terms of licensing, 
> quality reports that haven't been done as part of the build and even CVE 
> checking becomes pretty much worthless if one is allowed to inject 
> random code on the fly into the build - and in the end everything that 
> can't be assessed outside of the build is pretty much non-existing for 
> most of the assessments I had to work with.
> 
> In the past I showed that npm and go can be made to work with these 
> principles, even if they would introduce a different way of working and 
> maybe the need for better tooling - *but* they can work with how oe-core 
> works at the moment - to the expense of parsing time - and that's pretty 
> much it from my point of view.
> 
> Still the gains outweigh it by far in my opinion, as it would make all 
> of that accessible by common tooling already in place - including true 
> reproducibility and builtin quality reports.
> 
> BTW I don't think rust and therefore cargo is heavily affected by it, as 
> the cargo to bitbake scripting works kind in the way I would imagine for 
> npm and go too - so far just npm and go are really really bad to handle 
> in this case.
> 
> I'm happy to help on such scripting and tooling, but I don't see much 
> worth in either accepting the fact that "modern languages" have to 
> include some not validatable "magic" (which then would mean allowing 
> uncontrolled network access) or working around the fact that a trillion 
> dependencies is still a trillion dependencies no matter how you put it ( 
> :) )
> 
> Regards
> Konrad
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160008): https://lists.openembedded.org/g/openembedded-core/message/160008
> Mute This Topic: https://lists.openembedded.org/mt/87909311/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

