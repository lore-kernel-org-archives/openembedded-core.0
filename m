Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.98])
 by mx.groups.io with SMTP id smtpd.web11.7706.1601039659158225969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 06:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=C0Y+uEQf;
 spf=pass (domain: prevas.dk, ip: 40.107.15.98, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfIxLrV7/OCpsUjHtsF0sQJBLB1QTmo6r3pT7sYYrceT1f2GXgOqInI5C/bWlbtYfc/1TlNkQrjeLXr+ass3XMsZwom7PUxftDpzPTvrv+p0HqeByupw1x5IT/8R6sikUkkKveKWE1vROusREyIkx8W7veEvO7OFTBfKrPJ65xNwGdadu+1de0cZmN6IWO/dKfndcuiKsnUP0auV1NbRP93PH0JuI4fzx40wTnt8uWYFzoDS033y8+0qy0JdVFms60uh90gNYK7xe8zx9lYlq0RCv0FSCtBuz9xdSRI/iBMVlykiHCakatzDvMP8/n0k/kwNh5k2Rw6jo4evma4Pvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNMPSIo3t/V54hGOhcdX33pZaNJGnwdwnbYjVOKCapU=;
 b=FGeJ9LJQbstYTj2r5kUWCmt40Dqlyu5O5DeYE17JyHjQUcTeukA3ztjP7jIJW8j/v1HfgkEWZyNOefRwqfMkE1vZ6wvCp6JKDD9R1it4CUqjZWWhU3a9vUdb/SP31ehE6OSDwbWz75jcFKtLZLGpJq0VphEJBV6yc9fZ6shko5Y/CJluTEQ9E4guASUzm8YieSxvdckQIYSlXgafNkCqfmr51uedMPmaabtEZ5+Bi2F+mSSnLpR9KMOHPabGHVWcyo3B2Nd7DDHcbaoc+G1Br90WZbhNLnLovv5UawXVqxM1pqnEXnaOeHrxlwGOEIbZUJV40HXaMdNjhlbxCyBYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNMPSIo3t/V54hGOhcdX33pZaNJGnwdwnbYjVOKCapU=;
 b=C0Y+uEQfHyogHGW7c8OWLSu5AAyvM65/s/F3vpW3vuLjQ9Y7lH1OQWrMrrahTuaKjrord7Uhm4cvd2AiK51uCKUvi39LeYiCl89zgk6ktYtVG1+7DsqdxRevvNl47rvlEFXJyYrXPGbqU/1QyTmYSkhQpQTrT5dwhIBMNwWsKIk=
Authentication-Results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2819.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 13:14:16 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::acf4:4f51:6c3a:8cbc%5]) with mapi id 15.20.3412.020; Fri, 25 Sep 2020
 13:14:16 +0000
Subject: Re: [RFC PATCH 0/4] fix externalsrc task dependency issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: parkch98@gmail.com, Steve Sakoman <steve@sakoman.com>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
 <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
 <4a415c1606881f5f2786a51405c46b978443ba73.camel@linuxfoundation.org>
 <e923307a-eb4d-d716-82b9-ca420a317eee@prevas.dk>
 <3bcf67c6bbef25101b2f8b6bef4948b222a0fb64.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <3d7f7409-a89b-12be-5d3e-76bd7ca5a0f8@prevas.dk>
Date: Fri, 25 Sep 2020 15:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3bcf67c6bbef25101b2f8b6bef4948b222a0fb64.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6P193CA0037.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::14) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.115.188) by AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 13:14:16 +0000
X-Originating-IP: [5.186.115.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c9e7de3-7685-48dc-a470-08d86154e7ba
X-MS-TrafficTypeDiagnostic: AM0PR10MB2819:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB281900ACFB52444CFC1C4ED493360@AM0PR10MB2819.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bg6hfB9vV5omdB/VS/w51GyPxnJ6we3/s699kFE3U+bqAyNq0SMijExNralsyjKybhd0jaIrNmDaxJ9IwNPm2i6tnSpIl/tWwrHREaeZjik32qUtvimRKF4VRyVbpAOwkHJ5L1pKoD/bTaOlg/kbuHsTrEiVut0zGCnARZOgLIoab6tUYpqlHma4ZzqRHq6Fag1eKtDRLpKq8Y3s44v0Tyx+67UyVoG5KFFSFtKeCFOnOPYVYGqQvPIvL3qzxW92K2EUOvx5fzF8trQCZlPs811B/gQunZl8gI28UktpMwuM6YpL5zNTk9EYGD06k03EV8Ed4i8Myg+rWXVKcGHOVyCVPb0/QngC3UFBeW0WPcn7j/JPDt1d8tlaIx3W5baWKaRoajRZsFCW7H2tnAidjdrSr3ZOnLvYvn5UFAvD4iJNosJSmEANVwJsEtyLbp5y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(136003)(396003)(366004)(376002)(39840400004)(6486002)(8676002)(86362001)(44832011)(4326008)(956004)(16526019)(186003)(26005)(8936002)(478600001)(8976002)(31696002)(5660300002)(66476007)(83380400001)(52116002)(66556008)(2906002)(31686004)(66946007)(16576012)(2616005)(36756003)(316002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	ZSQ8gyTSUHIuar2X58TgM0p8t+/iGoBRY/IXEyILWBPD/9ymx3asLfa9N1epbRxD3Cymq7dUr3Lja/GsMPXTfxypoa35KSWlu+8ug/T9/P2RYf/pM0h+/ZtEufV4pAODG5+DIOkjm6NNlazPkVAO/XrzrmVHZ+7x9OYVF18+I6DTw6NpRNPt+KMyxGJmnGEIKUW41EXqxa5nXhFC7RnhUvQ61+ugURtJDrgN00hJL+WMM8Jc3pGP0DoNWTz2maUnOR5GnUj3Kc+X8CncSY1NcxaOfp91GuduMpihCVEjfLVOTrl7+O74Z367Usg3LbkRFe4hJRssd78XPGL2Bzx8k/gXITFWJ3IexAxOQEVv3xcObemEYjQQr4j8HwDcYeJnRp/CSb7Y0Y1XdNHNMxeD7fvqRzjTCiYanzv3p98lieKppqKjoNGzYtam6KLswxK4WYqECPcQMU0Yg+aW/cZG/pJK5hFY4IKYH0kobhnZMzJeMBvtKPMBGtg4QJYAFD58i26eOrmqSu+pxlw3Rpzzk7AaacN583/UliY89rzAOPP1U70R1yKpI1+9Ph0YMIAo+8WunOQmyzOKCFeJIKjY11vfoV2WfBIM70IiPegLVMqs5Yla4xrek+g1QlMbWO4tfkHtkBnsu3ssVbcMOoY6eA==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9e7de3-7685-48dc-a470-08d86154e7ba
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 13:14:16.9079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mf2vll3WlAwUXfXdQM/KWntgL7VK5BObhqdwtPMYHMOqccUXzzXeNBgEvP6K4lnmT9fLn9gmOdzqNvDnqI/UzySTdLjTiHdGwQAR3EPtlAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2819
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/09/2020 13.43, Richard Purdie wrote:
> On Fri, 2020-09-25 at 12:31 +0200, Rasmus Villemoes wrote:
>> Well, perhaps listtasks could be taught to say "[noexec flag set]" in
>> the description - currently it seems to be somewhat random whether a
>> class uses noexec or deltask.
> 
> No. That would just confuse things even more. That would hide do_build
> for example so the default target would be missing?

I did not say "don't display noexec tasks". I said 'say "[noexec flag
set]" in the description' - i.e., have the output include an indication
that that task will not be actually be executed. Perhaps a slightly
longer prose would be helpful, say something like "[disabled for this
recipe due to noexec flag being set]" appended after the current
description. There are already lots of noexec tasks, e.g. all image
recipes have a lot of ordinary tasks disabled via noexec, so that should
help address your concern that

> ... If
> someone can "see" the task in listtasks and trys to run it but nothing
> happens, its very confusing for the user.

>> Oh, and for debugging task ordering issues, it would also be nice if
>> listtasks showed tasks in topological rather than alphabetical order -
>> that won't necessarily always show an implicit dependency that went
>> missing due to a deltask, but it would at least reveal some of them.
> 
> I think showing half of some information would be much more confusing
> that clearly not showing it. We'd just get bug reports that the order
> was "wrong" and it can't be fixed in all cases.

Can we then (perhaps via some listtasksfull or whatnot) get bitbake to
display the tasks along with their dependencies. Or how would I, today,
go about figuring out what (intra-recipe) dependencies
some-recipe:do_configure actually has?

>>> I think there were technical issues as well, such as recipes which
>>> inject other tasks between unpack and patch. We needed to stop those
>>> other tasks running too which deltasks does effectively, noexec would
>>> not.
>>
>> Eh, but the other side of that coin is that there are obviously tasks
>> injected between unpack and patch, or some other combination, which must
>> _not_ be prevented from running
> 
> Some need to be prevented, for example where they do extra unpacking
> type operations on files. Those would actively break externalsrc.
> 
>>  - cf. at least the two or three workarounds that seem to become unnecessary.
> 
> Some would be unnecessary, it would break other use cases.
> 
>> So can you give examples of
>> such tasks that _should_ implicitly not run when externalsrc disables
>> (one way or another) the SRCTREECOVEREDTASKS tasks? That's actually the
>> RFC part of this, I hope somebody with far more knowledge of various
>> corner cases and odd recipes can demonstrate why deltask is more
>> appropriate - and then, as I said, some comments to that effect in
>> externalsrc.bbclass would be much appreciated.
> 
> I will try my best to find them. I don't have a list of these things I
> can just recite from memory. One that did come up in a quick search is:
> 
> classes/dos2unix.bbclass:addtask convert_crlf_to_lf after do_unpack before do_patch
> 
> I would note that the class doesn't appear used in OE-Core any longer.

OK, that counts, even if that class appears unused - I can see how such
things can exist.

> Proving OE-Core is "safe" for such a change is only part of the
> challenge too, there is the wider ecosystem to consider.

Absolutely.

>> I think it would be weird for a recipe to inherit externalsrc and at the
>> same time define a task ordered before do_patch, then not expect that
>> task to run at all. So I'm genuinely curious how such examples would look.
> 
> devtool takes recipes and adds externalsrc behind the scenes to them to
> enable it to do things. Its expected these scenarios work, its used for
> example by the automated upgrade helper. We're not risking breaking all
> these tools just because you think the code might be cleaner.

See, that's the kind of explanation I'm looking for - and again, I'd
like to see in externalsrc.bbclass itself. The thing is, I never knew
about the existence of the externalsrc class until I noticed the bug
reported on c5dfc2586b. So when I tried to figure out how to fix that
bug, I had to understand why externalsrc removed the do_patch task,
breaking the configure->patch->symlink_kernsrc chain.

> Your approach also concerns me as you are basically asking me to
> "prove" your code has issues and it seems aren't interested in testing
> even the patch you did send.

That is not how I intended this to be interpreted. But I was really
curious why deltask was chosen over noexec, when even the very same
class then knew it had to do a fixup - it could have been that the class
simply predated the existence of noexec.

> I'm struggling to try and keep things building as it is, without
> changes like this which introduce a lot of risk :(.

You've convinced me that changing deltask to noexec is too
wide-reaching, which means that I think just patch 1/4 should be
applied. Please consider doing that.

Rasmus
