Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E9BC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 18:19:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.94])
 by mx.groups.io with SMTP id smtpd.web10.2378.1721758743787782709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 11:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=DHi+O/vW;
 spf=pass (domain: outlook.com, ip: 40.92.91.94, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrtM3lb2735xlqHlspX+DQBLtROiOT78hP3zOpyauHqpGfrcmAuqr7wLTWD8pXqbz0tonQnh8bSaOPGAM5EQweYhU+gEBZ3A8uTAU6kxKCz+lTqfg16Fu24qnX37VSsHQp+QdzfPQgr0uKuyaWl6ShTtudtg4vwpp/lbNFI+bmyz241QLxHNEWGN7bg9vZ5knG0qBtf4UERHJUle+7mFBe5DMBSzKSSkf5AqXR1XxMcUoXAhAZbyS7SdDW6uuuoIwZGlVmCkznfbeXatqmwj8j8xOAtVXlEMCk59BvpfO0cXEOr9XAorK2Dr4S/SY/LVm31oPFGXL/pL7YRjNZO3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkDNAZMcwOXBuAFzSVh06vPW04EL0ut4AG7d4RZmxvk=;
 b=lSorMEZHGrjc5/L4Fu/4HIX2Ywcr7klBGu4SqYjY7LdfCgvRWUMH6KqHaOrs65K4BUHgN52U0qFOsYBe1CeRvi9gDDgEeWa0k6nAzCAeIoGoYP3FB7+tXwDtu22hhxsQpsEF5SrwqruLuPJCLlnnTIyLOsFzDllkk6ARjO93njt4MYutqrEeZhCM3u22/ZCoeza0XIeigsUjlfTxevu4P6xJMoxf8QjtWfKNitRK9xsCcqDxTEWmem7nh11oLcIvvYO731NZfwf2zh2XgjKMUJbWSbpVfToduQitHHZTAwY+2aGAQQz6rhbu97TL5wywTsKuCrXgYgdh7iBcbjVOrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkDNAZMcwOXBuAFzSVh06vPW04EL0ut4AG7d4RZmxvk=;
 b=DHi+O/vWmGb8fEjQxWuXOoOSW50rhJr4CLcJuGhUMBc3i3KrIHlgnxr5yaIG/xP3rs+EyyO8TAzit+gB8/WZZMfeHsEn6EbpPOVKgTuaWg1ksY/67yTCSnyqsnuiLuK9QzYpuZqjPtBN9S8yeHJdij9f29puP+EgHpEz6k92ffVqg6IhPwC+WXdk08NzkXi1KSeogHCht8wW2J6T4DB2kiq5yE3zV+1bbh34rhLVxAW+K9kPq1bsqy6GEfxwaTMv0FHcLM+ynMJo1WTjO40DYxvZZVxICzBjq3ciRTC57S2eI5CwbHZU1F4j14fhBWEQeHRRvdOlfxNzalXGUv5aYg==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by DU0PR07MB9590.eurprd07.prod.outlook.com (2603:10a6:10:317::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.6; Tue, 23 Jul
 2024 18:19:00 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 18:18:59 +0000
Message-ID: <GV1PR07MB91201E963D38D13A90E87B9EA8A92@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Tue, 23 Jul 2024 20:18:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Alexander Kanavin <alex.kanavin@gmail.com>, randy.macleod@windriver.com
CC: openembedded-core@lists.openembedded.org, Jiaying.Song.CN@windriver.com
References: <20240719164639.GN17572@denix.org>
 <15389.1721741918254132393@lists.openembedded.org>
 <878fe028-ade0-4646-8294-429eebdaeb14@windriver.com>
 <CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <CANNYZj9_8v+c_ddG8OOYcBgOidWQdLDMj5pJeTW9uGZk8fBw=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TMN: [niDhA2HEwSFpSd4gOxydEsLqtE/IXhP0SUEsSDXOVkQK2BgFdfdy08sMPqCu8th2]
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <2dfd0fe6-1576-4083-aa90-8f032927d212@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|DU0PR07MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 64bdd566-6ffc-42d7-283b-08dcab43ec52
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|19110799003|8060799006|440099028|4302099013|3412199025|56899033|1602099012;
X-Microsoft-Antispam-Message-Info: 
	Ri0FcqiDlPKQtt6UmWpbYRHMDgWORbXfzMfP2b25xeBXpAbdh+tT4bp0bLRylKziKwZLvc2oAAF9m9axfkMejG5HygvUiMYyhnlmHJksxML5gNIV6QSIqbvaqmIkuo+T129xVIlhGtUyjdgnsa/5sWz5R5FDISg1Vvw6UhDu1RvMw1eAayyrLAq2PyT1Hb1yBD7W7XQK91jqFznA8XwkL3LFjZauPgLuTp1hMTfBCTgPwYcozWcL9r9DMoBDi6Y818Wq85sXvAMsxjw/MKXp0WmDXzZIl+k1Bx8OS2EcnnjqPtSQkF4e5M8VZCrTwdF9f43r4+5QsBeI63CH3Pre16+LizgQFA0YwZ8PonD3aj9rlhZ0zcLqBelbbdjNNCAol1DZBC8rqmf+LfAHQ2SqVmG3alOAgMNrzoDbCXGKKhHQZei4QufJeU1QDkGtHfooIGuaDCtcH2ZRZeFefNwglqbD0MpYPmW074mUUmeg7nZLvSOfE9xPGYhgegYjWsv4MVB9Bd6Bw5zSqM3xWfDdi3Hl651VWWF8jABbtxUkcNZHWgldzQX4vWGVsJ2lrAfR/+2pAdjdsfuM2fKR3SMqhAZ4UroLHUBt/495nIqtr/4XwBL/3TfZXBWUq+jPCOaMpN4gKKZgYeM80qx+bI0zQsfbKvkHH/uGnBOuQeHdL4ti2Ytu2ch5Hk8GXPoInRuGMDBeVfVkavGJn2i/GWKMdgEEBWYKvU9o2weNDNJY0ao03mJqbiw74AKMrqu0kZA0zLtozTYs21yb7Rck+otYPw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D4SGxp2zDU8uSQr6AW5/lL/yjQOg0zePac5ZSfemFfGtdBxanuXZLlC7JfKu?=
 =?us-ascii?Q?ciZHqVbymohjdtMyQUJbtthB5A6s8AJsA5fFy31sH4Ho3BjUF0gWDc6r74Eh?=
 =?us-ascii?Q?ABhUzrurtbURsuLJYC+FkIVyV4FvyfFLyCg1QZZkD2cUe65NpO02rntMEnnk?=
 =?us-ascii?Q?LbbCW7T6IY0GbMP9z3zEajD14lszQUi86sas90O5ASDsDNnnVoh7XfWRypnf?=
 =?us-ascii?Q?l9TUWV/bFC089rQ6turE37baubkqHSuIDJwZj+HD5pSCcODQNSNfjSRolOnR?=
 =?us-ascii?Q?GX5w2PGGESrz7bEuiVl8BUmYpz1/jZeUAiZ/bo4clNvUI0cXFyoVi3yj60Qi?=
 =?us-ascii?Q?rUa/UsyyYTm55e+BuLPHRaSc3G1TwBLCRF2HshbdTWuc0eHtMsIQFW3Rapco?=
 =?us-ascii?Q?Isa8rQNIvkihoRjgowxPfkPvMI9fPS2SPRJI0Y7DI1stFUTLs9f/Eax/kDZ8?=
 =?us-ascii?Q?1CDXZXoSJMkbZTLFjkrFv5sStgoQUzdtR9pMcCAKk5r45x4oU9UJdYCp9jZo?=
 =?us-ascii?Q?a1kPN6p8GWGOyl3/M5EIf+9gzcTh4EvgXIyKNrpgZcA/VIl91b4WdbZWSWcD?=
 =?us-ascii?Q?2eFcdb4yIpo7QWVTueb2X+wmWHC0Zww4QV9ofCjtF74lwrbTnm2zsGk8NamO?=
 =?us-ascii?Q?Qbg5K5vZoXBh2eJcfYSKtiQmEo3DytfyqaPYDPkqcYUYmC7vZPkIHC0jygb0?=
 =?us-ascii?Q?ZUoybYjyrIvGnGCGmnu8L2VrjWHsZXxFWemRNz4Jc0r03Bdx3XhjCZDydtOV?=
 =?us-ascii?Q?fs+lJi3Pojz+NbcH2xK7/9iTfshjegl4aFbHPt+66b/IgDNA5HGBVQIREYe8?=
 =?us-ascii?Q?xoC5MckuaunWgrBUwiohwWgF8u4rHkL4dHkw8aDNvW9sr+CLXkHwsDKrhC9+?=
 =?us-ascii?Q?+aJqZHPS+X13XeRULb2rO4xCtKg5hkWTFHmCVQfL0bOPORW7lQl90Y38MtAs?=
 =?us-ascii?Q?Qdrp65fuOIVD9CW5TU/hUk1LXxgkvms3Wbr5EtfQdDF7zyb/5h+Mu4Y89iDx?=
 =?us-ascii?Q?+IQoBBOuYlReeQ7LPBBoUxXJqPeJzmCCqjj6UBWbsAW+gja5sOwjpm+aFVhs?=
 =?us-ascii?Q?cH3oD0Tbg76bZeRfdPgW4oCvIOOwvrkTT3wtnPtYgSPDn2H3Gc8rfJRx/8ll?=
 =?us-ascii?Q?tijlzYxynOLjsNO8WjRKANSesvvsWVt8hDCXljAHW6uphA+6oY5r4jfKt9aQ?=
 =?us-ascii?Q?7qHn4j4uGypaZDicBmWVCGxg4mMqdE5kzp24m0bvhgTdhhdkQ8gPMbjoMtjQ?=
 =?us-ascii?Q?wm61egBWwIatDUoNvswdlSOK6lrT8o1Tskl7QEvAjn07wyN/ceCdyy5Botx+?=
 =?us-ascii?Q?m8U=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64bdd566-6ffc-42d7-283b-08dcab43ec52
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:18:59.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB9590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 18:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202416

How about just moving it to an additional package out of the python recipe.
It's almost zero effort to implement and zero effort to maintain, while=20
not deliberately breaking builds (it's not that the users I know are=20
keen on keeping python2).

basically a PACKAGE_BEFORE_PN =3D "python3-python-symlink" +=20
FILES:python3-python-symlink +=3D "${bindir}/python" will do it.

And those lines will most likely never ever change again.

Like this it at least allows a RCONFLICTS to be properly propagated.

Followups could then replace the unanswered/rejects patches by=20
RDEPENDing on that new package.
This will also help to maintain visibility on the problem.


On 23.07.24 19:56, Alexander Kanavin wrote:
> I guess the recommendation to remove the symlink if needed was a bit
> poorly thought out.
>=20
> On the other hand, I fail to see any benefit whatsoever in a separate
> python-is-python3. If you do not have python 2.x installed on target,
> there is no difference in whether there is a python symlink on the
> target or not. And if you do, you still have the same clash between
> 2.x scripts that refer to python, and 3.x scripts that refer to
> python, and no easy way to resolve that clash.
>=20
> What I am proposing instead is this:
>=20
> - python to python3 symlink is still provided by the base package.
> It's not accurate to say that 'patching' things from recipes to use
> python3 is what people 'prefer', it's that up until now they were
> forced to do it, Randy.
>=20
> - if anyone is still using python 2.x in target images in 2024 with
> yocto master (nevermind that the public python2 layer is dead and
> unmaintained), and is relying on python 2.x being symlinked to python,
> they should be adjusting their scripts to point to python2 instead.
> They no longer own the unversioned python symlink and we should not be
> catering to them.
>=20
> Please reframe your arguments.
>=20
> Alex
>=20
> On Tue, 23 Jul 2024 at 18:44, Randy MacLeod via lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> On 2024-07-23 9:38 a.m., Konrad Weihmann via lists.openembedded.org wrot=
e:
>>
>> I also vote against it.
>>
>> I'm on the fence but I'll be swayed by the "against" voters.
>>
>> There are pros and cons to a system-wide solution but it seems that
>> people prefer to have these problems fixed in each affected recipe.
>> Best solution is to update the script to call and work with python3.
>> If the upstream refuses to do that, the layer would have to carry a patc=
h.
>>
>> This is how most such '/usr/bin/python' problems have been solved.
>> It's a shame that upstream python didn't mandate a specific solution.
>>
>> Btw, some people could use:
>>
>> https://github.com/Igalia/meta-webkit/blob/main/recipes-devtools/python/=
python-is-python3_1.0.bb
>> https://github.com/Igalia/meta-webkit/commit/b2156c282a6e727100dee25155f=
bc38d1532b573
>> https://github.com/Igalia/meta-webkit/commit/46fbfbc58f82abc3dc8794c6301=
72d4554be0830
>>
>> =E2=9D=AF git log --stat 46fbfbc5
>> commit 46fbfbc58f82abc3dc8794c630172d4554be0830
>> Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
>> Date:   Mon Dec 19 20:29:05 2022
>>
>>      Add a new image and distro definition for using on the WebKit CI fo=
r WPE perf bots
>>
>>   ...
>>
>>      * It adds also a 'python-is-python3' recipe that creates a symlink
>>      to provide the unversioned python interpreter as python3.
>>
>>
>> but both oe-core and meta-oe maintainers said on today's YP tech call th=
at
>> they would *not* carry that recipe.
>>
>> ../Randy
>>
>>
>>
>>
>> While I see the convenience in dropping a lot of patches the better appr=
oach would be to add something like python-is-python3, for the ones that re=
quire it.
>> (meta-webkit does provide it already https://github.com/Igalia/meta-webk=
it/blob/main/recipes-devtools/python/python-is-python3_1.0.bb).
>>
>> Adding a link by the base package and recommending to the user to remove=
 it again, would create two very unwelcome situations.
>>
>> a) it will clash at image assembly with an error message that will no ea=
sily point to the python base package
>> b) create a need to run with a permanent remove operation on top of poky=
 (creating the need for new sstate cache artifacts)
>>
>> What I could see is to move the symlink into an optional package, which =
could be used by the few recipes that still use the "wrong" interpreter lin=
e via RDEPENDS, that would be the much cleaner solution here
>>
>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#202412): https://lists.openembedded.org/g/openembedd=
ed-core/message/202412
>> Mute This Topic: https://lists.openembedded.org/mt/107264938/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
lex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

