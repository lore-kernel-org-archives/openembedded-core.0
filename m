Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7868E80A8A
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 13:35:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web10.17287.1695821695791237012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 06:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=vUhk4b+r;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.49, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR++CsA7zzWPBA1K5Bd8mdfxmHU8XZM87CWdgFA77nOHDg15mrIy6NmMvX2nfk5rxjoJcEaxfFqRe0uhdco0E/CRP2hPImmupXZgx081Pkfjh1CvLeukZjWUFr5L7q1oBA381DREVq8+i0c/0spdKbxLEoSq201Gden6VEBbPrlFbKDaIymWWNDbCanRmoshCu66qFgi2qKQdjHoBhWCdnJ8oNoVN/oXnUkXxXXSUaBM7vqFD/FJarvysvgZqfTsT/V8MogsgA0PhkGbcVJK/qC4DjSmyrc5jvzthznYlsx7+AFx4bZBvnS9IfqGCsfLNVBas9hRh8wyCqFNJ6su9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37WQPYn6v+mGny6o4Ve7bqrs4RNbOWsb50PUQl2wg50=;
 b=GkqpxFwRPxmbVewZ89MjPdqEjoOlljSYyJAWIXTvAlOghe6SQPwyNnfapo7jppa/yX+Uy970VLeVbh7nENIzNWpk/Ubn6XK/JzU6lnX1PMyEtNDk4Hd/PI/FYtYK8O08B0o4vbTyOGN9F7QTUYOC/zAZ+VX7Sm5LyVe3HdgNXM4w9TIZMpjhQmyXeVNkoLhDdD5HfU1406F7UMaQJrYSR402J3Whsf3rHINwpHIPTzmNz/3PD0GR6DB7UzZFvrmU788ahg0Xy13x6/7kgLuWJRzCE8e0jh4r/kXqwdu1STg2SjUTZwntzwkTQPLP6m4v527E9GIk5XtZoGgXmk5B6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37WQPYn6v+mGny6o4Ve7bqrs4RNbOWsb50PUQl2wg50=;
 b=vUhk4b+rhqXNA8H95Tuy3GPNpzmrk9N8TnipuzDyzXyDNa6vn8kVg1j+erC+wUYtv3R/SH8nqsZWw7LaQZmtyYGhG/wXyr9c+7ZkwKPRIcTdVo8M9/QYQ0AOZLyomClxvkWejXOQI7KBnWSjVfji3NNz+tfmYKzR55gNFNkroDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by AS4PR08MB8141.eurprd08.prod.outlook.com (2603:10a6:20b:58c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 13:34:50 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::485f:c3e3:6ccb:ad51]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::485f:c3e3:6ccb:ad51%4]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 13:34:49 +0000
Message-ID: <bf3ebd99-4427-1fe1-7c3e-743e51667e66@weidmueller.com>
Date: Wed, 27 Sep 2023 15:34:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [langdale][kirkstone][PATCH] go-mod.bbclass: Allow
 network in do_compile
To: Martin Jansa <martin.jansa@gmail.com>
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 stefan.herbrechtsmeier@weidmueller.com, =?UTF-8?B?66+86rK97KeB?=
 <dp.min@lge.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, wonsang.ryu@lge.com
References: <20221222150246.91423-1-uvv.mail@gmail.com>
 <0c9483d89d86eae9a84362935108f0e915b31dda.camel@linuxfoundation.org>
 <CADkTA4NnDKC0LybGM5w_otZVpAPy3Gk8+0UR1s1_tn7NVUC0Sg@mail.gmail.com>
 <5910a96e-28a2-4af6-2dc9-bc21e8bee9fb@gmail.com>
 <CA+chaQebMbjndYC_vqjFohnNBzuov8X0p2F4a0AvMcjEFnqjyA@mail.gmail.com>
 <bce338f8-59bb-8786-87d2-7553f800d176@weidmueller.com>
 <174BA13431CDE838.27660@lists.openembedded.org>
 <CA+chaQc_dahtBYT+GX7ECsMbX7SN-hN5H5H2dOhvvKRw9+znnw@mail.gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <CA+chaQc_dahtBYT+GX7ECsMbX7SN-hN5H5H2dOhvvKRw9+znnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|AS4PR08MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ba9ab7-74e7-4966-53ae-08dbbf5e85d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2210Y5zueHj+pnm482Kagy61zJnuKKxnGr0Mxjv+70X16nqNoGGC9O+NgIIHUBHc5FlbcqoUEDjF6UtjYbKOKJLxDWhP5A1ItV7gefSnKoJjL0p8i0KbI2y1+bFOQUvQLpoS113oFp8oc8d7NQ1BfxtvJsnJBt0eN8uwJFQQS4oOdj4VABKfBk6+40uBZnCL3wj0wjN/S0nJTHKAEzf65iOmk70Nq1WtzS1yaCR10IXkSyuCLUS2bFq39tdrzqLav8pzWrdhESWaaWW64gTlDCZCXoaeRGoMEv6wduBZQjkXt3yf+b/hcbipK18Xdpv6Y+bDX1sYy+dI2ZW+lezPT47T551l8StczO+21cYjn/nYMOuXP7Bzf8eO/255WpFyjxKx0ABtc9151OTGH9tn/S1Rd+eWXTtglHEc4ZWu+j2zCKnpPDQ73PbLsYx5QiRYWILhgXdXIzIuc6y4piYt+JMOujGDcpbqFeABtDNkWjooXEyh5aFUYTSRA9KmAHm4V4z4FSvx3Nof07E3jbxH/R1XmDoLnajhJTQNYLBkti6Uw4KsV6CioMx0R1pk6eS2BEy5tJnK/duSIfpwZNsj291EWXU4A06D/Q4MU8P7k0U2JLHNsQPTJWmel93XdLdtecVKVmGwjVWEyJGCW5W4LX2uI5F2nKYxbvCR7w3EpOY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(366004)(346002)(230922051799003)(451199024)(1800799009)(186009)(84970400001)(31686004)(66899024)(2616005)(6512007)(6486002)(6506007)(52116002)(6666004)(53546011)(478600001)(38350700002)(86362001)(38100700002)(31696002)(5660300002)(8936002)(2906002)(4326008)(83380400001)(26005)(8676002)(36756003)(41300700001)(966005)(66556008)(6916009)(66476007)(66946007)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sVfCupgGCkp6R34uFEOqJmo46pu/oVxgW2jyTqJy7LdYrEo+GITXOQ6GfjsZ?=
 =?us-ascii?Q?sTK5wYB7PPEh9uBMyrmnVI+uXpEx41EChoRlTE84ED3eaZigcphxloB4c0Nr?=
 =?us-ascii?Q?wUCOtEneIyFR1E1g0diP7G+hsP9TcgA0cUBGw1QJnlhzXHCPoSP7BWmcjZWe?=
 =?us-ascii?Q?Ia4/FJ7/duWBBvjQIigG5nAA1aDUilrO6Zg5oAwN1WOYxjWSDH68LwhVvCsO?=
 =?us-ascii?Q?Dso32lYHA4SBbegL/oxlsJqe/tATfWGsJ/EpRXdpkeer+rEgJi2C39l6czKi?=
 =?us-ascii?Q?tY5p7ZrILDcqBzF0pnQfK8gyK7IGLh+ZVWTR7x3+uZawWuZeul64NdlUNrDA?=
 =?us-ascii?Q?QR1H9A4FM4ZzkgwVdPm6TxsAZ3mPqMMQYbvjJb8eLFwSGR4uSKaOWPEq15I0?=
 =?us-ascii?Q?XX9VKd1EhO98RpSfXDzypeeKIeZKJfrC5Q76Nha93GlIAVW6JN6nweiS0+xA?=
 =?us-ascii?Q?ywGRMDu+BW19GObDwCNFQcuwCY4i0CPpyadGNd9CUg1QhwqcAwpoovsl4i99?=
 =?us-ascii?Q?wy0mHDoTKb/66WiGJy7tAUYHXmdNsgpm5mNHb+rIgYuiHAOzfF0wIO8DBFgg?=
 =?us-ascii?Q?scukFkMABrSsPlUlBE/HcddClXjj52emXX8+DZ57SBCDeveW/8zvQ6COoadh?=
 =?us-ascii?Q?qdQksWClMBMOR/t+1f/2FY9VMxC58NULC5Kh9AAS40qk3V1uVTwCtOsiSXkM?=
 =?us-ascii?Q?WNXTXYxxjhFUGO4rnABZeA8kZdHU1nnpOaOULZQax+6P4ra2ffTz9MxoFX0Y?=
 =?us-ascii?Q?0lq2fRYieNOBeUPRHImIXurXhT2PsVVKtVPgyUkhMf6yEnuG+7AlGAVVNWGF?=
 =?us-ascii?Q?51US5wZofJ9BpgGT1ReJoVa9KDlknloTS8rok6swfGtVVKEDMpE5DThrNSgG?=
 =?us-ascii?Q?KVoW5I/Nyxpc28e1Dz7ZwoTZEJgUyBjZseSylCWGj4YRUpuaYNE2u2c61gwH?=
 =?us-ascii?Q?XmWkm+X6fCkBoSx5PSjiclqZE84HF6oKjsDOFNyga9mbZvNjdMrRqH1YHk27?=
 =?us-ascii?Q?D48z4BDWG1uunbnTMt1EhpDIaZq/8RlcTWsJIVUDBaNry61+CPqkBOfa/ce/?=
 =?us-ascii?Q?8f9iXB7/8guMHHkw65ANkWD0UzIMI5t/u02gjYtUNcS96DKtJsRnnsmlyNY7?=
 =?us-ascii?Q?+ew1TQvDIdkupJkEc97kk9G905aSEdC+z2hgLNfo6NvXKD+jMrMKgyZPpO+Z?=
 =?us-ascii?Q?77HBsasJExvBlIf8ZVxFs9GkKP1wFer8mfJ1g54k7EFllPNiP3TvyC79hBkX?=
 =?us-ascii?Q?igwHW7UQJG4sQUA6Gney372MeZfKuChSFUpoDl/WowCUAL6A0qii4AZrVvrd?=
 =?us-ascii?Q?/g4bxUJ+12UH2Cw8RpJkElTMzJ0lvyDuAQ3O0kJCnNA2avOy08yKcu9iMZWO?=
 =?us-ascii?Q?koQRNMzwYgTdvZPlnqIb1QycyLhCXAFd5xmjsY7IdvmY65IaPNH+TsFKTibu?=
 =?us-ascii?Q?ntcpmd49TAasKFa73PhEnVNc9r8cuWWWq6rxMScp7wvZZl8QfT1ZHTtj6Mur?=
 =?us-ascii?Q?4bJd9XhUqs+VPVRERMWNpkjtQlJWeFB47BmIQ8kYlzUs1otosIErxk+89o48?=
 =?us-ascii?Q?FraUpNMDrMmJ/F8rCUzlgey14O397paboHPTFESz/wetP/n1H9aEJCNOrpfC?=
 =?us-ascii?Q?rg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ba9ab7-74e7-4966-53ae-08dbbf5e85d8
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:34:49.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53psfDjpPXvzOFky35xzR0ov+PsD1MYJKr/oyOLspucryS6JbE2qv85d/3H0Npt8cp6VuPKqr4aAkdKOXb4XVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 13:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188320

On 10.09.2023 23:26, Martin Jansa wrote:
> On Sun, Mar 12, 2023 at 10:15=E2=80=AFAM Martin Jansa via lists.openembed=
ded.org
> <Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> On Tue, Jan 3, 2023 at 5:03=E2=80=AFPM Lukas Funke <
>> lukas.funke-oss@weidmueller.com> wrote:
>>
>>> Martin,
>>>
>>> first of all: thank you for testing the patches. As usual the corner
>>> cases are the most tricky ones.
>>>
>>> tl;dr: I'm working on an updated patch series to address the reported
>>> issues.
>>>
>>
>> Hi Lukas, Stefan,
>>
>> and update on this series?
>>
>> It doesn't have to be perfect, other people can help with remaining corn=
er
>> cases and right now there is nothing for this in oe-core, so any version
>> will be big improvement :) and it will make it easier for others to subm=
it
>> incremental improvements - I have some as well, but haven't sent them as=
 I
>> don't know what you've already updated locally, so I'm waiting for v2.
>>
>> Mickledore is already in feature freeze, but maybe RP will make an
>> exception as this is new important functionality which isn't likely to
>> break other existing code.
>>
>=20
> Hello Lukas,
>=20
> any progress on updated patch series? Nanbield release is near and I don'=
t
> remember seeing the updated patch series in last couple months.
>=20
> Is there anything I can do to help? The last version looked reasonably we=
ll
> and IMHO could be used as starting point for everybody to help fixing tho=
se
> corner cases where it didn't work well.
>=20
> Regards,

Hello Martin,

I'm currently working on an update, but can't make any promises=20
regarding the timeline.

Thanks for offering help! Reviewing and testing is always helpful when=20
the updated series is on it's way.

Regards
Lukas


>=20
>=20
>> Kind Regards,
>>
>>
>> I've looked into the issues and would like to give some explanation.
>>>
>>> 1) the first module you mention ('gonum.org/v1/gonum
>>> <http://gonum.org/v1/gonum>') does not obey the go documentation for
>>> resolving the modules source-code repository (see
>>> https://go.dev/ref/mod#go-mod-download , Section 'Version control
>>> systems'). The documentation states that there should be a html page,
>>> queried by "?go-get=3D1", with a <meta>-tag which contains the original
>>> URL to the source-code repository. For 'gonum' there is only a 404-page=
.
>>> This page contains javascript-code that redirects to the actual gonum
>>> package page. Unnecessary hard to process. I'll open an issue for that.
>>> The second module 'code.cloudfoundry.org/clock
>>> <http://code.cloudfoundry.org/clock>' has a broken certificate. I
>>> already opend an issue on github for this.
>>>
>>> I addressed this issue above by maintaining a list of modules and their
>>> actual repo URLs inside the go-recipetool as an absolute fallback. Woul=
d
>>> do you think about this solution?
>>>
>>
>> Yes, that's what I was starting to do in:
>>
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/go&id=3Db973c7f17c8a613233a1a18de0bf6daa352c47d8
>>
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/go&id=3D61c6c9962b3b7d4c1cf6e6823de6c32b09998b00
>>
>>
>>> 2) yes, my bad :)
>>>
>>
>> as work around I was using
>>
>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa=
/go&id=3D5767819bfe96de29ab751d4a37a431a324f7e547
>>
>>
>> 3) The problem is that some repositories have a prefix in their tags.
>>> The tags usually only contain the semantic version string. I'm curretly
>>> working on this issue.
>>>
>>> Best regards
>>>
>>> Lukas
>>>
>>> Am 22.12.2022 um 20:08 schrieb Martin Jansa via lists.openembedded.org:
>>>> On Thu, Dec 22, 2022 at 7:39 PM Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>> wrote:
>>>>
>>>>      On 22.12.2022 17:48, Bruce Ashfield wrote:
>>>>      > On Thu, Dec 22, 2022 at 11:20 AM Richard Purdie
>>>>      > <richard.purdie@linuxfoundation.org> wrote:
>>>>      >> This patch is not in master and is not a backport therefore no=
t
>>>>      >> eligible for kirkstone/langdale.
>>>>
>>>>      My bad, the intention was to have it in all three branches: maste=
r,
>>>>      kirkstone, and langdale.
>>>>
>>>>      > 'nor should it go to master.
>>>>      >
>>>>      > If someone wants to allow go to fetch sources during builds, it
>>>>      needs
>>>>      > to be done in their own layers.
>>>>      >
>>>>      > Bruce
>>>>
>>>>      Probably I misunderstood the outcome of the discussion in my firs=
t
>>>>      link.
>>>>      Bruce and Richard, you both suggested to have it in go-mod with t=
he
>>>>      warning. I agree that it breaks reproducibility, and is considere=
d
>>>>      a bad
>>>>      practice in general (I'm aware of a few more build systems with
>>>>      the same
>>>>      shortcoming).
>>>>
>>>>      My point is, until a proper solution is in place, it should be at
>>>>      least
>>>>      documented somewhere that this should be done in own layer/recipe=
.
>>>>      Any
>>>>      suggestions where this can be documented if not in OE-Core?
>>>>
>>>>
>>>> Have you tried the changes submitted by Lukas/Stefan in:
>>>> https://lists.openembedded.org/g/openembedded-architecture/message/153=
9
>>>> ?
>>>>
>>>> It's not perfect, I was testing it on
>>>> https://github.com/influxdata/telegraf/blob/master/go.mod and I've
>>>> found some corner cases where it failed.
>>>>
>>>> But it seems like very good start and we should work with Lukas/Stefan
>>>> to get it merged in master. Then all branches could consume recipes
>>>> created in master and only the exceptions would need to have network
>>>> access (instead of the bbclass enabling it for every go-mod user -
>>>> go-vendor inherits go-mod as well).
>>>>
>>>> Lukas/Stefan: is there something we can do to help with v2 of your
>>>> patches?
>>>>
>>>> I wanted to submit better review on submitted patches after more
>>>> debugging, but here it is:
>>>>
>>>> 1) to resolve 2 deps:
>>>> {'Path': 'gonum.org/v1/gonum <http://gonum.org/v1/gonum>', 'Version':
>>>> 'v0.12.0'} due to 404 "ERROR: Error while fetching redirect page: HTTP
>>>> Error 404: Not Found"
>>>>
>>>> {'Path': 'code.cloudfoundry.org/clock
>>>> <http://code.cloudfoundry.org/clock>', 'Version': 'v1.0.0',
>>>> 'Indirect': True} due to this being redirect to github.com
>>>> <http://github.com> and failing with "ERROR: Error while fetching
>>>> redirect page: <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED]
>>>> certificate verify failed: Hostname mismatch, certificate is not valid
>>>> for 'code.cloudfoundry.org <http://code.cloudfoundry.org>'.
>>> (_ssl.c:996)>"
>>>> parse
>>>>
>>>> 2) some issues with LICENSEs:
>>>> INFO: Please add the following line for
>>>> 'docs/LICENSE_OF_DEPENDENCIES.md' to a 'lib/recipetool/licenses.csv'
>>>> and replace `Unknown` with the license:
>>>> c4807c5b058a56c02f592207b4e056b1,Unknown
>>>> Traceback (most recent call last):
>>>>    File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line
>>>> 111, in <module>
>>>>      ret =3D main()
>>>>            ^^^^^^
>>>>    File "/OE/build/oe-core/openembedded-core/scripts/recipetool", line
>>>> 100, in main
>>>>      ret =3D args.func(args)
>>>>            ^^^^^^^^^^^^^^^
>>>>    File
>>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create.py", line
>>>> 746, in create_recipe
>>>>      handler.process(srctree_use, classes, lines_before, lines_after,
>>>> handled, extravalues)
>>>>    File
>>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
>>>> line 349, in process
>>>>      self._rewrite_lic_uri(lines_before)
>>>>    File
>>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
>>>> line 380, in _rewrite_lic_uri
>>>>      updated, newlines =3D bb.utils.edit_metadata(lines_before,
>>>> ['LIC_FILES_CHKSUM'], varfunc)
>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>    File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1382, in
>>>> edit_metadata
>>>>      if handle_var_end():
>>>>         ^^^^^^^^^^^^^^^^
>>>>    File "/OE/build/oe-core/bitbake/lib/bb/utils.py", line 1280, in
>>>> handle_var_end
>>>>      (newvalue, newop, indent, minbreak) =3D varfunc(in_var, full_valu=
e,
>>>> op, newlines)
>>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>>    File
>>>> "/OE/layers/openembedded-core/scripts/lib/recipetool/create_go.py",
>>>> line 372, in varfunc
>>>>      uri, chksum =3D license.split(';', 1)
>>>>      ^^^^^^^^^^^
>>>> ValueError: not enough values to unpack (expected 2, got 1)
>>>>
>>>> (the license was just '/')
>>>>
>>>> 3) some SRCREVs set to None leading to parsing failure:
>>>>
>>>>    File "/OE/layers/bitbake/lib/bb/fetch2/git.py", line 762, in
>>>> _latest_revision
>>>>      raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream gi=
t
>>>> repository in git ls-remote output for %s" % \
>>>> bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
>>>> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
>>>> FetchError: Fetcher failure: Unable to resolve 'None' in upstream git
>>>> repository in git ls-remote output for
>>>> github.com/googleapis/google-cloud-go
>>>> <http://github.com/googleapis/google-cloud-go>
>>>> The variable dependency chain for the failure is: SRCPV -> PV -> BP ->
>>>> FILESPATH
>>>>
>>>> ERROR: Parsing newly created recipe failed, moving recipe to
>>>>
>>> /OE/build/oe-core/workspace/recipes/telegraf/telegraf_git.bb.parsefaile=
d
>>>> for reference. If this looks to be caused by the recipe itself, please
>>>> report this error.
>>>>
>>>> It takes long time to fetch all telegraf dependencies, so I'll create
>>>> some test recipe to more easily debug these 3 issues in isolation.
>>>>
>>>>
>>>>
>>>>
>>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#178380):
>> https://lists.openembedded.org/g/openembedded-core/message/178380
>> Mute This Topic: https://lists.openembedded.org/mt/95827446/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
>=20


