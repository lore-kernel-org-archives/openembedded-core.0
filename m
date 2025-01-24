Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB11C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 18:00:45 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.18944.1737741636122746100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 10:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50OHt8lP011271;
	Fri, 24 Jan 2025 11:55:08 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 50OHt63a017053;
	Fri, 24 Jan 2025 11:55:07 -0600
Message-ID: <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
Date: Fri, 24 Jan 2025 11:55:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
Content-Language: en-US
To: alex.kanavin@gmail.com, marex@denx.de
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex@linutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250123201229.182266-1-marex@denx.de>
 <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
 <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
 <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 50OHt8lP011271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 18:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210245



On 1/24/25 10:39 AM, Alexander Kanavin via lists.openembedded.org wrote:
> I wonder if we can just drop /etc/shells altogether from base-files?

/etc/shells is used by pam as one of it's multiple validation steps.  If =
the=20
shell is not listed there then remote login can be denied.  So the existe=
nce of=20
/etc/shells is definitely required.  The file doesn't need to come from=20
base-files (but usually should).

With that said, "something" needs to provide /bin/sh.  Just dropping /bin=
/sh=20
from a shell, by itself, it's the right answer as there are ABSOLUTELY sy=
stems=20
out there where '/bin/bash' _is_ the only shell installed on the system.

Just like we have busybox only systems providing /bin/sh...

or dash based systems where it is the only thing providing /bin/sh...


I'm more inclined to say that base-files depending on /bin/sh is the erro=
r.=20
AFAIK nothing in base-files should require /bin/sh (or are there post-ins=
tall=20
scripts?).   Once that is resolved, then various POSIX /bin/sh providers =
can=20
each provide it -- using update-alternatives to have the 'best' matching=20
providing the right /bin/sh link.  (This is why update-alternatives [in t=
he past=20
at least] run directly and didn't require a shell to execute.  I don't kn=
ow that=20
we have the ability to do this with our multi-package support approach th=
ough.)

So essential install order may be something like:

base-files
libc (libraries only)
update-alternatives
<a shell>
  - shell calls update-alternatives to register it as /bin/sh, as well as=
 add=20
this as a valid shell to /etc/shells.

End result (for bash)

/bin/sh -> /bin/bash

/etc/shell contains:
   /bin/sh
   /bin/bash

(Note, circular dependencies for some base components have been considere=
d=20
normal in the workstation world.  They work around this by use the 'insta=
ll' to=20
temporarily provide the /bin/sh and some other resources until they can b=
e=20
installed into the chroot.   This really isn't anything different from wh=
at=20
we're doing, we expect some host-system (native) items to be available in=
 order=20
to populate the image.)

--Mark

> Alex
>=20
> On Fri 24. Jan 2025 at 16.26, Marek Vasut via lists.openembedded.org=20
> <http://lists.openembedded.org> <marex=3Ddenx.de@lists.openembedded.org=
=20
> <mailto:denx.de@lists.openembedded.org>> wrote:
>=20
>     On 1/23/25 10:18 PM, Khem Raj wrote:
>      > On Thu, Jan 23, 2025 at 12:12=E2=80=AFPM Marek Vasut via
>      > lists.openembedded.org <http://lists.openembedded.org>
>     <marex=3Ddenx.de@lists.openembedded.org
>     <mailto:denx.de@lists.openembedded.org>> wrote:
>      >>
>      >> Remove /bin/sh from bash RPROVIDES as this has a side-effect wh=
ich
>      >> confuses rpm package manager when also busybox provides /bin/sh=
 and
>      >> base-files depend on /bin/sh . The problem is broken down below.
>      >>
>      >> First, bash depends on base-files and bash pkg_postinst must ru=
n
>      >> after base-files was installed, because it requires /etc/shells
>      >> provided by base-files to be in place.
>      >>
>      >> Second, base-files depends on /bin/sh, which is provided by eit=
her
>      >> bash or busybox in this case. This is the actual problem here, =
if
>      >> bash is selected as /bin/sh provider, then there is cyclic depe=
ndency
>      >> between bash and base-files, and that confuses dnf which may in=
stall
>      >> the packages in the wrong order, bash first and base-files seco=
nd .
>      >>
>      >> To make this worse, if busybox is also /bin/sh provider, it can=
 and
>      >> does happen that some systems pick busybox as the /bin/sh provi=
der,
>      >> while others pick bash as the /bin/sh provider, and that cyclic
>      >> dependency does not always appear.
>      >>
>      >> Attempt to break this dependency, drop RPROVIDES /bin/sh from b=
ash
>      >> recipe to always force base-files to pick /bin/sh from busybox .
>      >> (I am really unsure about this approach)
>      >>
>      >> Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de=
>>
>      >> ---
>      >> Cc: Alexander Kanavin <alex@linutronix.de <mailto:alex@linutron=
ix.de>>
>      >> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com
>     <mailto:alexandre.belloni@bootlin.com>>
>      >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>      >> ---
>      >>=C2=A0 =C2=A0meta/recipes-extended/bash/bash.inc | 2 +-
>      >>=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >>
>      >> diff --git a/meta/recipes-extended/bash/bash.inc
>     b/meta/recipes-extended/bash/bash.inc
>      >> index 634209c9115..6a061b8a612 100644
>      >> --- a/meta/recipes-extended/bash/bash.inc
>      >> +++ b/meta/recipes-extended/bash/bash.inc
>      >> @@ -134,4 +134,4 @@ FILES:${PN}-loadable +=3D "${libdir}/bash/*=
"
>      >>
>      >>=C2=A0 =C2=A0# Limit the RPROVIDES here to class target so that =
if usrmerge is
>     enabled for nativesdk, it does not
>      >>=C2=A0 =C2=A0# include host system paths in /bin/
>      >> -RPROVIDES:${PN}:append:class-target =3D "
>     ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh /bin/b=
ash', '',
>     d)}"
>      >> +RPROVIDES:${PN}:append:class-target =3D "
>     ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/bash', ''=
, d)}"
>      >
>      > Does this now mean that system will always need busybox ?
>=20
>     The system will require some other /bin/sh provider than bash .
>=20
>     I suspect there will always be one , but maybe I am wrong and there=
 are
>     systems without busybox and with bash only (probably yes) ?
>=20
>      >=C2=A0 some distros
>      > may not want that and simply use
>      > other variants to fill in the shoes. I wonder if shell choice co=
uld be
>      > a distro option or image feature which can then
>      > help sort this out ?
>     I don't think this specific fix is the correct solution, I think wh=
at I
>     need to figure out is how to make sure base-files is installed befo=
re
>     bash, even if there is this cyclic dependency which confuses rpm/dn=
f
>     into installing the two packages in arbitrary order:
>=20
>     base-files -depends_on-> /bin/sh -depends_on-> bash (the /bin/sh pr=
ovider)
>=20
>     bash -depends_on-> base-files
>=20
>     I still have to check the input from Martin Jansa , there was some =
hint
>     which might be the better fix for this.
>=20
>     Any ideas ?
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210242): https://lists.openembedded.org/g/openembed=
ded-core/message/210242
> Mute This Topic: https://lists.openembedded.org/mt/110778651/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

