Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34527CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 14:56:06 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.13])
 by mx.groups.io with SMTP id smtpd.web11.11626.1761144959501746094
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 07:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=lxG4PgJI;
 spf=pass (domain: cherry.de, ip: 52.101.83.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSjvqt2rYmvHvpBYuGYP2CMJldcu1cbD0JW29MTIv0Q/Muz9HzIyzuRlawFxpJ4/BWG1BORO51qU11uFs5HmrgzMimEZjlREtKbHmsBYo5Q0DK83htleehWCKMjtwVOoWKDtC/V1Hj+g2thV0VCnOU/O6NHhf5uFzQ3PjLWopnfMQ0RGGE3uCo4BWapQ9yH0erbiYn65iPTXnW1ctF3OfkPDwjHkaBrwy2vIhgbPr1h96mWM4RH0wOA7vdHC7YUmDMqiFNeQDymrv3wXTCdeN2godqdAtjj8EVORFjVW7IHRPCe7QPsV/c8C3OeunPZb1XmAuZZvfD7dykw5gyLdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/2zfJIea0Mv9K7Rr0NUVC9v+KxrKfluFR9VVfVZrEI=;
 b=qPGXOlJIsN/JXZJqKL+b6ebkXdzyFKmJdVNRLGjt730XU9Js0fHZ/imuhmIybLv/r4OE+iB0qu3glz5Q7Cqb2j7fKsf8F7SDLvG0/YT1Bwf5tI8M1jvFQ2INyr8fnPf3s+t5CSUnXquDi/XMsml9O4xG1pl2qbdvxyDyx3unppnrmsxnamQM122q6H+tjYBsoQQZbvHENy0Mu05z5/yr0IiP6h5vIUgVCdkyFT/F3bDHbhquC8E2glBcEHtFjCJmhYl36H1vQU9BVktagKhT81Aq339LZ+NAS+uFsj3eW2JNw/ZNMYkYUaeCAzP6WjmK2PPttbFAp8vGsX7OpUDYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/2zfJIea0Mv9K7Rr0NUVC9v+KxrKfluFR9VVfVZrEI=;
 b=lxG4PgJIR/uYwECvoFPlrWX8spMBb0ZUsEGr/QicuXoZ4SOo9kTt2naIWxGC+XXO87Fi8TIMcSKYI8FM/V/duxcR9j6TT2ZWgAFTwAquUM3X+bmEUzh8oF4TPZU317QyRodkFYW1kd9pVzVWMKri1OmuJIs+3KSLZSlbEXNeL+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9381.eurprd04.prod.outlook.com (2603:10a6:20b:4db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Wed, 22 Oct
 2025 14:55:53 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 14:55:53 +0000
Message-ID: <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de>
Date: Wed, 22 Oct 2025 16:55:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
 <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de>
 <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 830b4fe8-8e43-471b-b6af-08de117b191c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uZMaws10A6kVGG7oF8QipzGqQxfx/meutTTzoPXmNGpn73LbheTypXBgnS+V?=
 =?us-ascii?Q?2AdLyGunR49sD0eMbL4uGs5vn7SuUDWnmJrIHnZAsECbtI641J24gIoGuIKR?=
 =?us-ascii?Q?emTmmI8m7DsJm5fcC1KsUYb3Xg/M+w+R4ck6KP+CwcQqQ6qFYyIslD0M/gM9?=
 =?us-ascii?Q?dF6iIVBvG7vUQ4cE5J8LWvssjAhBRc9SmxoCwyj274hLhyt0nMDjqz8eTOL4?=
 =?us-ascii?Q?VSDq0xHUaXOFOiQCNJOKLG+hAx8/WKsfAytWFl3WaH3OPenS9hvP4nbDjQAN?=
 =?us-ascii?Q?ZMmyyGuldSV8/ejF8+iQAj7NuEUdoHwk90lS4b2GsK+VmEtfeC2aQ1bJq88b?=
 =?us-ascii?Q?AdC9S2opvi73ZJb7es02TRHlN/4GnguK/7O0nNqqcmh+BRlZF6oJuHhMdQHn?=
 =?us-ascii?Q?NXvwnSCTsWUu4Ouphjrosgrm1oycH62qgnasvKeudib63DIU6j+cFm161R48?=
 =?us-ascii?Q?E+fs7GiY06bf8cmAPP7XOs4RO+TobaTXtJmQnx/rAB8lCNxMRmvATm4SNy/p?=
 =?us-ascii?Q?AmXaxm3AOWCodF2n4wo/FJ9odtwyXoQf2BO4nmXQeRiO05Sf+Xbh4t9cOD+9?=
 =?us-ascii?Q?kXKmvZu56Lit0OWlkm3TyURkpLsjiwlnmDgLmfALyJEeKxNHGj7LKWKAUG3z?=
 =?us-ascii?Q?rGJ9QQ01MQVn7jfzfCqv0HTjB2/Rz6OqNCS9uUoLtHgHKe/IpVH2TZNj5/gZ?=
 =?us-ascii?Q?mA1eBSNfJBtIz+xaJTVJASkQILMaNg++ViJ2faGw3n+uzJPcP9o4fWYS4oQj?=
 =?us-ascii?Q?qs5xmhHzUSffnWgkcGN4hTKTYrid5xwRwPcXNx1FtiC9E2Edf3lh7AdDLp7A?=
 =?us-ascii?Q?Xr/7raPpSaaJRBbPjiaSeI4hKMsRj07281lwkRkNmxPClIcKF3K9NyXewxWi?=
 =?us-ascii?Q?LvofMgHV2GqKHwxJR4kAlBXFFRFe4n9xtRJC3vVa0no9VA+Xll5NlHKUGr9o?=
 =?us-ascii?Q?uNqhr1Zxjk0zY/oAbzBqbu2AX56K1Z/IWVY4DckxYAq4weVImYwz4oWmmj7M?=
 =?us-ascii?Q?Lt0YXTzfJmCnxpXPr5NaKmLTgqATUQa1lhk1sBpPvUtfXbod2jmyKWkhVx1E?=
 =?us-ascii?Q?f1I/J+b2rvYXlTAmKah6UydlFr6sdjuBGR9Dc4yDQpckzF5wJdTEIrvbQWQ1?=
 =?us-ascii?Q?YehBIh6LstjDLVSdxRn0mCnOj3OYqKnJ3mskkQuPBWfHqWX/iuPrAAxJp3g+?=
 =?us-ascii?Q?jWGAszORHS8XCDS2EWyAXTy64iFPXVuSn2w5j0NUzTdT9v6y0OIXG66ZsDAl?=
 =?us-ascii?Q?0WVTK5sEIapaXkHzqEwpocjN1uagNjsvWmGH7yDqWknu49Uov3vTXYqrCtMp?=
 =?us-ascii?Q?gaVjk6jer4/xWRMLIS78u6bZcYZqJ8Uwcze3c9h3reF7Vabk6xifdyw+5kbP?=
 =?us-ascii?Q?H5rxPEh7sBOD8oBDw4Vw9G20D0+C+XtYokjoohQ0/1/8ChmwLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dAOfXtr3CG5AzfNbSQm0lfV+2X2A0mFdmmuelUwoJybXUkJc8MozlsyYJCBF?=
 =?us-ascii?Q?QXXXNwiZe/Eqw4v6muBgZr/FjQ9UFK7u9kTWQcmOZAnA/idnkGCaVFN9eJAL?=
 =?us-ascii?Q?QSXAKhQmg2MQyAKi2p/Tb1pzxBtAx0cqsObmT8m6G48KtU+0bdaEg8bEnvvE?=
 =?us-ascii?Q?cxrJDY2Qn7aEb5JBwW8RHT0R5oOTvMJrYSRvvt6t5LwZdN4oR2j9xKVmeKH+?=
 =?us-ascii?Q?CSerSuQHOfwH/5qeFaQuQdyuKgtZm0+DQasKkoZBrRkHSnicVHFGVqiWnYfk?=
 =?us-ascii?Q?bXEdmCezCsK0isF9K4kJw7D67C5cG0RMdLrp3luV1O8pHBF96ZSdygbVpdFt?=
 =?us-ascii?Q?wHmO4iR7oJ8l86g+LyfhdXZJpkRa9EXTJdpVGHOPqdxd07CJ7O5sK/XkWRb3?=
 =?us-ascii?Q?reD/AOGiDo0HZ+9CeBkX9u9YzV3TmHHZVDi8EGGmk+n4+BzDVUROp5uErV3O?=
 =?us-ascii?Q?yTMAbem0QNmdK4CbXJ74gtNvn+5iRFtcnau+1xIWW6WmJKdoq09Fr64ILklO?=
 =?us-ascii?Q?JHaJcyKhpd5GH+8eEa3MFefJt/uSMJtIXqTPG0vgTKDSGMqBSobvt5iHfWbe?=
 =?us-ascii?Q?2mvv7LmIsHBBLCyIkcFOGrTeBHBmKTOa31gHhz2AinDhTdwU/28rV7Euo8Gi?=
 =?us-ascii?Q?nP5teu/6uAJle0LlGewGJhGX6zA333ir+fCy78PVC0/+Y2neRCRwKoq9eEu5?=
 =?us-ascii?Q?MaCoxSrzdGfrwZakesPN2wn/Cqmz7JztM/HvBpKSS+onDoVcNI035o1sqbFz?=
 =?us-ascii?Q?gNwJv/ZGzQIZgaGPLUFECUl/Gh0EHfEnXh5t98VrFpj6PN9JgYLRstWYc04H?=
 =?us-ascii?Q?z+U9hKCTclKNpAajzeU8zFBvoYVTNn9l6K2TpDKxOJttCsD0wSSqZZ4mgxoo?=
 =?us-ascii?Q?vYp/81Ey5klqZyegMAN/3OJQaulEoUjEIKciT85j2xk8Avi4PS0vYmUNdAUj?=
 =?us-ascii?Q?r3SJe3jH6Y2Fjmf0GKlRacB5zES8YMgMXauIHkS4NEiY/pCRkwml2u9YSpf9?=
 =?us-ascii?Q?6qTc0qBPN+zL119fFb9P0tZTBdemgqM9d5QorBjx06yfqf/Y4pwFETL2L9OU?=
 =?us-ascii?Q?vAHr3iArrbEiT5APzgkrVRhyU/EwHL7p3l3RbLNmtGwVBeL/KpHTQKa3gaOK?=
 =?us-ascii?Q?2XgsshYd18kferzHcHUl5SA9c94hSfBwDzAXeBO8QsA9/Pvi1yb3XFmXsYG6?=
 =?us-ascii?Q?jn0tIw7ZP9gU82mcyMAcclEZeIqpb+Hwf/n1leNzZttVxueNAe9P6XvRGf+Q?=
 =?us-ascii?Q?bH5OxcMrtT9g56Gujy2rF/3qVuyp7zBOFHjgg0M1R+XDB3sxUi3YBKwK2d9F?=
 =?us-ascii?Q?2kKXlgvNiqUI0JsB3lpfthTNbQ3DUfFDWJQ2XK9vRCp0yBxPDoMORrxkHtT5?=
 =?us-ascii?Q?eBKDbfJqLB7wh3ZC4+q8tsROTv2oWPQPX7ONA34q40zcfIHwXw0DRpTY5j9i?=
 =?us-ascii?Q?YSmL7C+ZOW+IZE7NdI7SK+3Wa5RxvgziQ2JZRFMWff3kU2b4FJSKsb8wkaZZ?=
 =?us-ascii?Q?E9e7MqrZarpWXsGL3fZqnB8jWIo6R6ee/s/j3VbpyBhWGqS3gmxy4op5wnPH?=
 =?us-ascii?Q?mhU/yuiaToY85tVNSW0zBtmk/gn/TrjSQ2+iXoEqF3t6SDOSwBIefo1BhZw4?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 830b4fe8-8e43-471b-b6af-08de117b191c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 14:55:53.4808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGXaZ+3fCRViw4MyQ1AGjJWGTaegWcwGHKAwH52u8Vn0NxqzSHlMT9tD/0e1IR9rUgN1RZCs/PBF0yy1xhRLoHic8CcTar+22+BtQCBuNVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 14:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225197

On 10/22/25 2:14 PM, Alexander Kanavin wrote:
> On Wed, 22 Oct 2025 at 13:56, Quentin Schulz <quentin.schulz@cherry.de> w=
rote:
>> Does the sanity check still make sense if it simply cannot be triggered
>> anymore?
>>
>> In other words, should we remove BB_MIN_VERSION variable and its check
>> in meta/classes-global/sanity.bbclass? My worry is that we forget to
>> keep them in sync. If we need to keep it, do you think it'd make sense
>> to move BB_MIN_VERSION to this file here too? And if possible use it as
>> argument to bitbake_min_version so we only have one place to modify for
>> bumping the variable.
>=20
> I think the existing sanity check could be dropped, yes. I tried
> defining BB_MIN_VERSION here, and using it as an argument to
> bitbake_min_version, but at this point the datastore doesn't seem to
> be ready, and variable expansion doesn't work. Or maybe I did
> something incorrectly. Can you try it on your side?
>=20

$ bitbake -e mesa-native
ERROR: Unable to parse=20
/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandler=
.py
Traceback (most recent call last):
   File=20
"/home/qschulz/work/upstream/yocto/bitbake/lib/bb/parse/parse_py/ConfHandle=
r.py",=20
line 108, in check_bb_version
     raise ParseError('Bitbake version %s is required and version %s is=20
used\n' % (min_version, bb.__version__), fn, lineno)
bb.parse.ParseError: ParseError at=20
/home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:2:=
=20
Bitbake version $BB_MIN_VERSION is required and version 2.15.2 is used

But this was to be expected since in the BB patch it's simply a regexp=20
where we extract whatever's after "bitbake_min_version " with re.match()=20
which means only a string.

>> Another question is whether we should backport this to earlier releases.
>=20
> Probably not. It's a new feature, and the issue is most pressing when
> people move on from integrated poky into separate bitbake/core
> checkouts.
>=20

Yeah but this happened because the person updated their oe-core repo and=20
not bitbake, but the opposite could happen as well. We would only=20
protect from one scenario and not the other.

>> Another question is whether we can use a newer bitbake with older
>> releases, which this wouldn't help with. E.g. what happens if I use
>> bitbake 2.15.2 with scarthgap layers for example. Should we force the
>> version to be MAJOR.MINOR and ignore any patch if not specified? e.g.
>>
>> bitbake_expect_version 2.15
>>
>> would match anything from 2.15 to 2.15.999
>>
>> bitbake_expect_version 2.15.2
>>
>> would match anything from 2.15.2 to 2.15.999.
>>
>> =C3=A0-la Rust version resolver, c.f.
>> https://doc.rust-lang.org/cargo/reference/resolver.html#version-requirem=
ents
>>
>> Should we rather have an explicit max version (but ok if not defined for
>> e.g. the master branch)?
>=20
> I don't know. Enforcing a minimum version is straightforward, but what
> the maximum version should be is more complicated to define and
> maintain. It's probably a separate issue; this change simply moves an
> existing check earlier in bitbake invocations.
>=20

We historically (since Denzil) use an even minor version number for=20
releases (and considering we are currently at 2.15 in master, I would=20
say odd numbers for development). We could then match on MAJOR.MINOR=20
only and ignore the rest except if provided (but I assume this should=20
never happen except on the master branch since we would otherwise be=20
breaking backward compatibility of releases (e.g. min_version is now=20
2.8.98 on scarthgap means we are forced to update bitbake to that=20
version to be able to build newer releases of scarthgap) This assumption=20
would mean tagging bitbake for a release, then using that even minor=20
version number as argument to this new bitbake_expect_version (or=20
whatever name we can find) and then tag oe-core for the new branch. Then=20
the master branch of bitbake gets the new odd version number for the=20
development of the next branch, which is then used also in the=20
development of the next branch in oe-core. I assume something that needs=20
to be added to the branching off process we already have.

In any case, considering this patch is about fixing a failsafe that=20
exists but doesn't work, removing the BB_MIN_VERSION check and migrating=20
to this seems fine to me.

Thanks!
Quentin

