Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19634C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 18:14:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.2425.1669140837699814970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 10:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 5CE57B966;
	Tue, 22 Nov 2022 19:13:55 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.106]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxXmM-1bjnpQ0; Tue, 22 Nov 2022 19:13:54 +0100
Date: Tue, 22 Nov 2022 19:13:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Ross Burton <ross.burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <0BHRLR.X1RENR0XRLNC2@t-online.de>
In-Reply-To: <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
	<CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
	<CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
	<CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
	<1729A925BA1D06C8.25787@lists.openembedded.org>
	<CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
	<HRFQLR.NFABK2KMZ9XR2@t-online.de>
	<4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-RtTL1Ie0BltNPhojqMo5"
X-TOI-EXPURGATEID: 150726::1669140834-2E7F9535-E305D042/0/0 CLEAN NORMAL
X-TOI-MSGID: 672800c7-5a82-49dc-b42b-3b7606273ead
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 18:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173696

--=-RtTL1Ie0BltNPhojqMo5
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

I use a bbappend for python3 in meta-wayland for almost a year now=20
because i had issues installing python scripts with /usr/bin/python=20
shebang e.g. here in sway:
<https://github.com/swaywm/sway/blob/master/contrib/inactive-windows-transp=
arency.py>

Issue has been that, if adding this script to do_install(), package_qa=20
failed because of the missing /usr/bin/python provider.

Ran into this quite a few times in the past and then created the=20
symlink instead of patching shebangs

I just wanted to mention, that having a symlink would be an alternative=20
to patching shebangs and as i was asked to send a patch, i did. But I'm=20
fine with whatever is done in oe-core.

Basically I also think the best solution would be, upstream would=20
deprecate /usr/bin/python usage. Unfortunaltey it's not, and so there=20
will always be people using it.

Am Di, 22. Nov 2022 um 17:41:22 +0000 schrieb Ross Burton=20
<ross.burton@arm.com>:
> On 22 Nov 2022, at 04:42, Markus Volk via lists.openembedded.org=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>  On Mon, Nov 21 2022 at 06:48:07 PM +0100, Alexander Kanavin=20
>> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>>>  On my Debian systems, indeed, /usr/bin/python is absent.
>>=20
>>  Debian has a package for this
>>  <https://packages.debian.org/bookworm/python-is-python3>
>=20
> And that=92s a perfectly good solution that I like.
>=20
> Personally, I think people should forget that /usr/bin/python exists:=20
> the recommendation from Python is to call python2 or python3.  I can=20
> quote from PEP-0394:
>=20
> =93=94=94
> Depending on a distribution or system configuration, python may or=20
> may not be installed. If python is installed its target interpreter=20
> may refer to python2 or python3.=94
>=20
> =85
>=20
>     =95 Distributors may choose to set the behavior of the python=20
> command as follows:
>         =95 python2,
>         =95 python3,
>         =95 not provide python command,
>         =95 allow python to be configurable by an end user or a=20
> system administrator.
> =93=94=94
>=20
> We=92ve picked option 3.  As per Python upstream, that=92s absolutely=20
> fine.
>=20
> If you have a serious need that /usr/bin/python exists, and is a=20
> symlink to python3, then could you not make a simple recipe that=20
> RDEPENDS on python3 and ships just a /usr/bin/python -> python3=20
> symlink?  You can even put this in your layer to avoid having to=20
> debate it with the oe-core maintainers.
>=20
> Ross
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173694):=20
> <https://lists.openembedded.org/g/openembedded-core/message/173694>
> Mute This Topic: <https://lists.openembedded.org/mt/95156228/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-RtTL1Ie0BltNPhojqMo5
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I use a bbappend for python3 in me=
ta-wayland for almost a year now because i had issues installing python scr=
ipts with /usr/bin/python shebang e.g. here in sway:</div><div><a href=3D"h=
ttps://github.com/swaywm/sway/blob/master/contrib/inactive-windows-transpar=
ency.py">https://github.com/swaywm/sway/blob/master/contrib/inactive-window=
s-transparency.py</a></div><div><br></div><div>Issue has been that, if addi=
ng this script to do_install(), package_qa failed because of the missing /u=
sr/bin/python provider.</div><div><br></div><div>Ran into this quite a few =
times in the past and then created the symlink instead of patching shebangs=
</div><div><br></div><div>I just wanted to mention, that having a symlink w=
ould be an alternative to patching shebangs and as i was asked to send a pa=
tch, i did. But I'm fine with whatever is done in oe-core.</div><div><br></=
div><div>Basically I also think the best solution would be, upstream would =
deprecate /usr/bin/python usage. Unfortunaltey it's not, and so there will =
always be people using it.</div></div><div id=3D"geary-quote" dir=3D"auto">=
<br>Am Di, 22. Nov 2022 um 17:41:22 +0000 schrieb Ross Burton &lt;ross.burt=
on@arm.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">On 22 Nov 2022, at 04:42, Markus Volk via l=
ists.openembedded.org &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.opene=
mbedded.org">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote> On Mon, Nov 21 2022 at 06:48:07 PM +0100, Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; =
wrote:
<blockquote> On my Debian systems, indeed, /usr/bin/python is absent.
</blockquote>=20
 Debian has a package for this
 <a href=3D"https://packages.debian.org/bookworm/python-is-python3">https:/=
/packages.debian.org/bookworm/python-is-python3</a>
</blockquote>
And that=92s a perfectly good solution that I like.

Personally, I think people should forget that /usr/bin/python exists: the r=
ecommendation from Python is to call python2 or python3.  I can quote from =
PEP-0394:

=93=94=94
Depending on a distribution or system configuration, python may or may not =
be installed. If python is installed its target interpreter may refer to py=
thon2 or python3.=94

=85

    =95 Distributors may choose to set the behavior of the python command a=
s follows:
        =95 python2,
        =95 python3,
        =95 not provide python command,
        =95 allow python to be configurable by an end user or a system admi=
nistrator.
=93=94=94

We=92ve picked option 3.  As per Python upstream, that=92s absolutely fine.

If you have a serious need that /usr/bin/python exists, and is a symlink to=
 python3, then could you not make a simple recipe that RDEPENDS on python3 =
and ships just a /usr/bin/python -&gt; python3 symlink?  You can even put t=
his in your layer to avoid having to debate it with the oe-core maintainers=
.

Ross</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#173694): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173694">https://lists.openembedded.org/g/openembedd=
ed-core/message/173694</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95156228/3618=
223">https://lists.openembedded.org/mt/95156228/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-RtTL1Ie0BltNPhojqMo5--


