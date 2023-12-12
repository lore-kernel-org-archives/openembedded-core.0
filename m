Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE11C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 18:44:55 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.4380.1702406689950221509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 10:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3BCIimj9023210
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 12:44:49 -0600
Message-ID: <450aaabe-db45-4b84-9759-aa4a2709028f@kernel.crashing.org>
Date: Tue, 12 Dec 2023 12:44:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC] bitbake.conf/pseudo: Switch from exclusion
 list to inclusion list
To: openembedded-core@lists.openembedded.org
References: <20231211173553.2421931-1-richard.purdie@linuxfoundation.org>
 <EB76304D-B0BE-46D9-83D7-A627844088DC@arm.com>
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <EB76304D-B0BE-46D9-83D7-A627844088DC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 3BCIimj9023210
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 18:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192242



On 12/11/23 2:35 PM, Ross Burton wrote:
> On 11 Dec 2023, at 17:35, Richard Purdie via lists.openembedded.org <ri=
chard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>>
>> Currently, pseudo tracks all files referenced within it's presence unl=
ess
>> they're listed in an exclusion list. The exclusion list has grown to b=
e
>> fairly unwieldy.
>>
>> This patch swaps PSEUDO_IGNORE_PATHS for PSEUDO_INCLUDE_PATHS which in
>> theory should be easier and more explicit to maintain.
>=20
> I=E2=80=99ve never understood the rationale behind exclude over include=
 (then again there=E2=80=99s lots I don=E2=80=99t understand), so I=E2=80=
=99m very much for this in principle.

History:

It was originally everything, because files were referenced, linked and c=
opied=20
around random parts of the system and/or build and needed preservation of=
=20
components.  This was very early Yocto Project and before.  (Psuedo exist=
ed for=20
many years before OE/YP used it!)

Then the build/work directories became more standardized, and the compone=
nts=20
'copying in' from elsewhere was greatly reduced... but there were points =
where=20
reference files were still used (think .m4 files or tex templates for ins=
tance=20
for the kinds of things...)  Since we didn't know what all of the referen=
ce=20
points (to the host) were, we decided to be conservative to add exclusion.

So excluding paths where we could count on owners/groups (and more import=
antly=20
permissions) being standard became the norm.  That's why the primary excl=
usion was:

/usr/,/etc/,/lib,/dev/,/run/

Over time though we've gotten our dependencies understood and really seve=
rely=20
limited the external components we use in the build.  (including .m4, aut=
oconf,=20
tex, etc etc etc..)   So moving to an INCLUDE seems to make more sense to=
 me.=20
Since we have a clear understanding of the path structure we use....

/tmp - used by the compiler (and tons of other tooling) for temporary fil=
es, we=20
need this for sure.

/proc - there are referenced entries that MIGHT be needed, especially lin=
ks to=20
/proc/mounts (where the link inherits perms)

/dev - I'm not sure if this is needed, but things like /dev/null and /dev=
/shm,=20
another tmpfs, mean we probably need to track this.

/run - often contains other short-term temp files, especially for things =
like=20
trying to process pre/post package scripting on rootfs configuration.


Then the items in WORKDIR of course.  IN THE PAST, we needed source code =
to be=20
covered both to handle symlink references, as well as specific copy funct=
ions.=20
But I suspect this is not needed any longer.  The actual build directory =
also is=20
likely not needed anymore (but had been in the past!)  Leaving us the ima=
ge,=20
package, rootfs, etc directories.

So I think this maps well to "how did we get here".


The one question I ask, is why we're using ',' as a separator and not ':'=
 like=20
standard Unix style paths.  But I suspect the answer is Windows level=20
support....  but I'd be very tempted to move it back to ':' to make this =
more=20
standard like other path separators.  (But that can be done at another ti=
me!)


--Mark


> Ross
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192185): https://lists.openembedded.org/g/openembed=
ded-core/message/192185
> Mute This Topic: https://lists.openembedded.org/mt/103113368/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

