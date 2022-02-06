Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F86C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 19:07:53 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.12304.1644174471977265548
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 11:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.107] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 216J5jto006089;
	Sun, 6 Feb 2022 13:05:45 -0600
Message-ID: <50aaf17e-9588-6d97-9d97-8f20769404d2@kernel.crashing.org>
Date: Sun, 6 Feb 2022 13:05:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
        OE-core <openembedded-core@lists.openembedded.org>,
        Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
 <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
 <d59a9eeb-4d7a-3050-bcdf-9cbdb284bdb6@kernel.crashing.org>
 <CANNYZj_sSHo29iDkJTndnyuXu57z=V976WGH6ii_T9OEAmKGxg@mail.gmail.com>
 <a5d6e75cafe701420bb355392870ffd412ac7f1f.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <a5d6e75cafe701420bb355392870ffd412ac7f1f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id
 216J5jto006089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 19:07:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161410



On 2/6/22 11:35 AM, Richard Purdie wrote:
> On Sun, 2022-02-06 at 18:31 +0100, Alexander Kanavin wrote:
>> On Sun, 6 Feb 2022 at 18:27, Mark Hatle <mark.hatle@kernel.crashing.or=
g>
>> wrote:
>>> It definitely works in Honister (I'm actively using it.)
>>>
>>> We produce a single package set, then allow for multiple image recipe=
s to
>>> select
>>> which init manager to use.=C2=A0 This simplifies the eSDK, sstate-cac=
he and
>>> binary
>>> package feed -- while still giving the end user the ability to switch.
>>>
>>
>>
>> Selection of init manager is a distro setting, it can be used by compo=
nent
>> recipes to make decisions, and overriding it from images is neither te=
sted nor
>> supported.
>=20
> There is a hybrid where you can enable sysvinit and systemd at the same=
 time and
> use them in different situations. We do test that and it is that test w=
hich
> showed issues on the autobuilder with this patch.
>=20
> It isn't as easy as pick and chose either in a given image but handy fo=
r
> initramfs and some other uses.

I've got the following in my distro:

# Create packages that support both systemd and sysvinit
# but only on arm/arm64 systems, microblaze is sysvinit only
DISTRO_FEATURES_BACKFILL_CONSIDERED:remove:arm =3D "sysvinit systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED:remove:aarch64 =3D "sysvinit systemd"
DISTRO_FEATURES_BACKFILL:append:arm =3D " systemd"
DISTRO_FEATURES_BACKFILL:append:aarch64 =3D " systemd=E2=80=9D

INIT_MANAGER_DEFAULT =3D "systemd"
INIT_MANAGER_DEFAULT:microblaze =3D "sysvinit"
INIT_MANAGER_DEFAULT:zynq =3D "sysvinit"

INIT_MANAGER ?=3D "${INIT_MANAGER_DEFAULT}"

Then a few configurations change the INIT_MANAGER, and (almost) all of th=
e=20
sstate is re-usable and things don't need to be re-built.

The issue I have, microblaze if the filesystem is over about 80mb it does=
n't fit=20
into memory.  On Arm, some devices are memory limited the same way microb=
laze=20
is, while some have full access to flash storage and thus can use systemd=
.  And=20
on aarch64 - most defined (but not all) have flash storage.

This is all about sstate-cache re-use (time to build the image) and abili=
ty to=20
have a SINGLE binary distribution that supports the image size requiremen=
ts of=20
the user.

--Mark

> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161408): https://lists.openembedded.org/g/openembed=
ded-core/message/161408
> Mute This Topic: https://lists.openembedded.org/mt/88853822/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

