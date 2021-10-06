Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C391AC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 09:43:17 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.77])
 by mx.groups.io with SMTP id smtpd.web11.9785.1633513392301835556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 02:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=e0+xWEEa;
 spf=pass (domain: outlook.com, ip: 40.92.69.77,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OflvSKKBTAOW7lfdzl0EcCCyBMEHOCkx+Q3M3wV9RdVGxQNVYD/vosBfNeK9L1T2o3oSls9UAd2R7enWQf+cIt1TmZ7r9uFdLwayS1/b4u1A/d5iq/xdFSSlI+2v3aXkXHLZnkWiy8NYq8EOrN1cbNLD+LIjJtGSjke/0oRnP6P3uGHVRTGpT8uucPkbFLpCq+Hq6b/BAabP2WBrDWc32BCoHJf364R7t2yKvfI6ZxLmxajSxQdo0NynbYW3cRZS5ogP0jxlS8bzztzpGLGI7sCpJqwW9kwNbKqXYNrLktDWdNBL4lrHBkPFbjw1QyL6h9cZCEscDtrjOVhZ+Aerlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSlgQkrIvratj3wlRQ2r1j0SS/lyKJjAsLUGsPFo6rk=;
 b=aR+lYYkNt6ZtQYW0IB2WJqY400yV7yYZL6/HqpzpEz8AokS0Ialm/ha2Pj/tVtx7lTF3Det9/+fuY2NIqCQ1Pvm30k7FLwHgxY0uoLwahx8VpaySatDMs8H5qNQk4ajIF8v0W6bCPMkI2lmu01l7/mvNN3cTwYRdRC73CWGKtZdQuW1l33NfURBvSJ4bv+2j351QLfm/QDDh3H/Gd1V+6zTIyU3kX9Lwn7Z2y4MvzigBZrh7PpcJOLXe9i7WiS97XYOLYWWFxQAPScUjbkULYXvzGivlcQt4YliugRs3PEEH71V7+Do2r4Z1T0w7p/8fYsB5p0N0o5ftvDl1v/Rz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSlgQkrIvratj3wlRQ2r1j0SS/lyKJjAsLUGsPFo6rk=;
 b=e0+xWEEakhv8zsfP46o3X23L51ZQWNPeNaQVoW/3wCFNL7czAF9kk2KnsjmDAucWqHfLOKYthRNYqe6SvF2cr0PjYNz++rL0yoHrnUqXGd897hkbCT6lGzrUa46n5GalmSOxslP8v0e2qmtAtpN0byK48Zyhd0en/RFp5LZQqKqk7TUDgpxNosXv5EfZsxVHj1P0x2dmpDNkgvmviSdn2ExW2TArAxahdkkpRpB6mneBkwbeo6fFJOhGnP7LrVQfRuJa7tOOzfPISxM9WPrPRl4SR2mJ8rqMobSbmNak8+ckLdkg78iDKLPAkuba/3J8g5bnCWMs7kEucGnaJ4OygQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4433.eurprd09.prod.outlook.com (2603:10a6:20b:14a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 09:43:09 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%4]) with mapi id 15.20.4587.018; Wed, 6 Oct 2021
 09:43:09 +0000
Subject: Re: [OE-core] Improve npm support to run build scripts
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <37b61ef2-5ea9-7e90-75fe-50cc662d9124@weidmueller.com>
 <6318d76222b819d3a165d405fc48dbcbadf29085.camel@linuxfoundation.org>
 <50d4d79f-a7cd-fd0a-0c6d-597b6dc4ca6a@weidmueller.com>
 <CANNYZj8Fns4xWre3_ajv-5QADpCi0f+WS2wRXCKXezOgj5fhzg@mail.gmail.com>
 <0bddcbc4-cf11-39da-5797-131fc59d7f6f@weidmueller.com>
 <CANNYZj_Xudaobe6W2TTnugjovq3KcHWBYsvZ8kS0kYZaWwkLCw@mail.gmail.com>
 <AM9PR09MB464243B2852B92E67D825612A8AF9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642A8B32B686649507B9406A8B09@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 6 Oct 2021 11:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <71df6b93-bdcc-b09f-48c7-3ec822ef3228@weidmueller.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-TMN: [73eEl5JeWm5cgOhJO4kP1F25tUODBO7/uOsHX0OMS7m/bVWhn3D8fbwP05bFh5EY]
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <cd8486fc-82b4-b5a3-c748-c00ffb5f4e0c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:400:bc27:b3ce:9dec:8bd7]
 (2a02:3103:205c:400:bc27:b3ce:9dec:8bd7) by
 FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::23) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.15 via Frontend
 Transport; Wed, 6 Oct 2021 09:43:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58a3c6b2-7405-4618-9166-08d988adb48a
X-MS-TrafficTypeDiagnostic: AM0PR09MB4433:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	obDZNVq64EZVXOc3reLmsq7cEA3nLvVclAyEPlMlr1HAQBZI6UFIADZfLe7VXvHwCXVMtGyBGZX3IjT4hhIqui8doqq2lBv8mYK6n2c174Zw7VAuuJeUFEjR1EPen5t+xYRlSnRHOJPpy+qnH+Vp5fVYODgV2LCGF0qb5v0jy9qHIMf03QFOGoTAWCdkj2oaeisndnkO49/VQgl42oOCCvcmisoFx8aUF5y5WLcp9OcX+geOKJUSBjY0Fju/F773X24loKf7L/SlLHK47gDWAqVoY6hyDkHbJAb7731tOEAz5TLfm7LojydakmAkzjwi+a3vX9UOmBJq9hxowjrpPmxxJJOSJkIJNM+HNC3t25jNMiM1KG1SkJIo7ANh37mdLJ8V5F/Z3Ro09ETBB41Smi+zxd0+u0xXR4zJ03JySl3vhwLEmBtc3QophpdDpLRq
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	q0xxA8pPTxE7JlkWj4s2Xg5xJ/jLUvYFtly/DV5sQYkwKCUcitwQxX43pkYQvbK2ohs2LYmAjC90MY2ILwNWnheq+t1YWQk49/Ai/4V+poLXBF4xeh8iDiT3EzXEAAQCJNl/15jvqM+AeDdd/M0zWkY31uL2+VMIlhW7YCcwo49MXdZCzlqoJ960BWB7/2um3engCTR2BirNatcvRrJdkQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 58a3c6b2-7405-4618-9166-08d988adb48a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 09:43:09.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 09:43:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156680



On 06.10.21 11:18, Stefan Herbrechtsmeier wrote:
> Hi Konrad,
>=20
> Am 05.10.2021 um 21:29 schrieb Konrad Weihmann:
>>
>>
>> On 05.10.21 21:17, Alexander Kanavin wrote:
>>> On Tue, 5 Oct 2021 at 19:44, Stefan Herbrechtsmeier=20
>>> <stefan.herbrechtsmeier-oss@weidmueller.com=20
>>> <mailto:stefan.herbrechtsmeier-oss@weidmueller.com>> wrote:
>>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 > A layer with thousands of recipes seems tota=
lly intractable.
>>>
>>> =C2=A0=C2=A0=C2=A0 What is your concern? The high number of dependencie=
s or to=20
>>> handle it
>>> =C2=A0=C2=A0=C2=A0 via OE?
>>>
>>>
>>> Generating recipes with a tool means the tool will be custom and=20
>>> non-standard, and chances of anyone outside of your company
>>> understanding, using and contributing to it are rather small. There's=20
>>> also the problem of needing multiple versions of the same thing for=20
>>> different
>>> consumer items, which oe doesn't easily support. The link Robert=20
>>> provided already exposes some of the pain points with that approach.
>>>
>>> I tend to think the best way forward (or least painful at least) is=20
>>> to gradually improve what there already is, which is the npm class
>>> and devtool, and send patches to various upstream njs projects when=20
>>> they're using outdated dependencies or otherwise need changing.
>>>
>>> Alex
>>
>> Just to chime in :-), I like to question this approach of having=20
>> multiple versions of the same in an image.
>> As already outlined npm is horrible in many ways, but using the=20
>> lockfile approach multiplies that even more.
>> But I tend to agree that using the currently available oe-core code=20
>> would be suited best for a broader audience
>=20
> But this audience loose the some basic features of OE (ex. version and=20
> CVE check) and have to manual fix or ignore the licenses.
>=20
>> - in your own layer you simply can do whatever you like.
>=20
> But this make it impossible to share recipes. Why don't we create a=20
> meta-nodejs with a different approach to avoid doing the same thing=20
> multiple times.

We could, but we have to think about the costs and ways to properly=20
maintain it - and that seems to be the main reason.
You could come up with a repo of your own and see who is interested in=20
joining the development (as I for instance did with a repo for ruby=20
gems) - still this would be hosted and maintained outside of core I=20
think, due to the limited time and resources available.

And **most important** the repo has to provide its own means of testing/CI.

BTW I remember I had a talk with someone last year about it and putting=20
a bunch of angular based apps into an image, with all npms as separate=20
recipes resulted in ~100k of files.

so CI and testing has to be extra beefy to make it work - which maybe=20
requires a good portion of automation, which then brings me back to=20
Alex's suggestion to provide some patches to devtool, if there is a need=20
for that.

>=20
>> While personally I think in the long run, every npm dependency has to=20
>> be provided as a recipe of its own (even I know the costs of that=20
>> pretty well)... esp when CVE checking and basic packaging hygiene=20
>> should be enforced.
>=20
> Why should OE provide a solution with doesn't support this? I think this=
=20
> is a main feature of OE.

It actually does, but having this lockfile based approach, basically=20
crams up all into a single recipe, which makes it a bit harder to check=20
and whitelist any false positives or n.a. items, as you might have to do=20
it for more than one recipe - but yeah, the basic CVE checking is part=20
of core and works as expected

>=20
>> Nevertheless for oe-core I wouldn't want to change a lot right now, as=20
>> there is simply a valid set of consumers missing that could enable us=20
>> to do some proper testing. But yeah fixes/improvements for devtool are=20
>> very welcome (also the available docu might need a touch)
>=20
> My problem is that the current approach doesn't support the build of an=20
> express or angular application. Does it makes sense to add this feature=20
> if we know that some basic OE features are missing (CVE and version=20
> check) and fixing bugs is a nightmare?

Just my personal opinion would be, to open up a layer on your own and=20
let it grow and mature first before getting it in into core - but=20
patches to devtool are very welcome
>=20
> Regards
>  =C2=A0 Stefan

