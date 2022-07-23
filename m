Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE8DC43334
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 07:04:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.4153.1658559835723390034
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 00:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=J+c2ZW0p;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.66] (dslb-002-205-011-086.002.205.pools.vodafone-ip.de
 [2.205.11.86])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0972084039;
	Sat, 23 Jul 2022 09:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1658559833;
	bh=xMmSkJzX6zyqZSg2gSz9xPtUriuhFE/LVjcnvkYKHCE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J+c2ZW0pQRQ/SIRtRYcHkqtnKVglRdXA8Qh/XxGnj+8n39MCrQBpUt30RSwvMMudS
	 yySdacsdPJ+Die+Dlj3UVYu9BCOcwXS5o7DPiOz5FR9sWRciPxA4X/IDhDWBk2y8u8
	 MMHbHn8sVJge9fwAbxLprJG/Vg7/l9khdyQWc5o3I/p1CP98meKbD/iw155nmAHT32
	 Ku7HkDCqViCZ5b/KCiNlTGWFi0x+xgCtkYcKroIQjKP965SmYgEOOdom2GKVBri4Ug
	 UYqbAUZgAyrZrVBY9m6bHrQUl//Lgp+StYm700YIhTea2hU3Coigap7Clz8cyFNVfD
	 NG/c6eBXlU/KA==
Message-ID: <e0dab0cb-4eb9-78df-6854-8fdf1ba5d059@denx.de>
Date: Sat, 23 Jul 2022 09:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to
 service
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, drew@moseleynet.net,
 Kyle Russell <bkylerussell@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>, Alex Kiernan <alex.kiernan@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Alban Bedel <alban.bedel@aerq.com>, Wes Lindauer <wesley.lindauer@gmail.com>
References: <20210917080804.2545478-1-ch@denx.de>
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
 <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
 <CAFrQVPNiHZ8MEv0uaHUpi4J=Erefa1GLzGYh_af19X6A-gxg4g@mail.gmail.com>
 <3aad56dc-ae73-6449-c680-b9da234830f0@denx.de>
 <CAFrQVPNeNPnOErKJN73gp-wrvVnWazfENppLoUey3AF5mzC4Ng@mail.gmail.com>
 <77cc90ef-6c06-caee-c0a1-599628a986f4@gmail.com>
 <2022e0a9-cd4e-fbf0-47ac-4a8beae2fee6@gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <2022e0a9-cd4e-fbf0-47ac-4a8beae2fee6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 07:04:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168427

Hi Khem,

On 2022-07-21 17:29, Khem Raj wrote:
>=20
>=20
> On 7/21/22 11:17 AM, Drew Moseley wrote:
>> On 2/3/22 9:12 AM, Kyle Russell wrote:
>>
>>> Thanks, Claudius.=C2=A0 I really appreciate your responses.=C2=A0 I'm=
 not=20
>>> trying to be pedantic.=C2=A0 Since I don't have your test setup, I wa=
s=20
>>> just trying to make sure I understood the context of the problem as I=
=20
>>> figure out how to deal with issues this is causing in our setup.
>>>
>>> I was also hoping one of the recipe maintainers of either systemd or=20
>>> rng-tools would comment on systemd-udev-settle.
>>>
>>> I'll take a look at the caam module to see if I can understand how it=
=20
>>> works.
>>>
>>> On Thu, Feb 3, 2022 at 3:35 AM Claudius Heine <ch@denx.de> wrote:
>>>
>>> =C2=A0=C2=A0=C2=A0 On 2022-02-02 17:26, Kyle Russell wrote:
>>> =C2=A0=C2=A0=C2=A0 > Thanks, Claudius.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > On Wed, Feb 2, 2022 at 8:08 AM Claudius Heine <c=
h@denx.de
>>> =C2=A0=C2=A0=C2=A0 > <mailto:ch@denx.de>> wrote:
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0Hi Kyle,
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0On 2022-02-02 13:38, Kyle Rus=
sell wrote:
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 > Is this the correct approa=
ch?=C2=A0 Even the
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0systemd-udev-settle.service m=
an
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 > pages recommends not using=
 its service.=C2=A0 Were the kernel
>>> =C2=A0=C2=A0=C2=A0 modules
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0really
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 > not loaded when rngd start=
ed?=C2=A0 Or is the original problem
>>> =C2=A0=C2=A0=C2=A0 just a
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0matter
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 > of waiting for sufficient =
entropy?
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0IIRC, the rngd could not find=
 any random source device node
>>> =C2=A0=C2=A0=C2=A0 (/dev/hwrng
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0in that case), so the service=
 failed to start.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > If /dev/hwrng didn't exist, this feels like the =
original problem
>>> =C2=A0=C2=A0=C2=A0 was a
>>> =C2=A0=C2=A0=C2=A0 > misconfigured
>>> =C2=A0=C2=A0=C2=A0 > kernel or module that wasn't being loaded proper=
ly.
>>>
>>> =C2=A0=C2=A0=C2=A0 Yes, however it is a timing issue. The module was =
loaded properly at
>>> =C2=A0=C2=A0=C2=A0 bootup, however at the time rngd was started the m=
odule was not
>>> =C2=A0=C2=A0=C2=A0 loaded
>>> =C2=A0=C2=A0=C2=A0 yet and thus the service fails to start. If it wou=
ld be delayed=20
>>> until
>>> =C2=A0=C2=A0=C2=A0 the module is loaded everything would be fine.
>>>
>>> =C2=A0=C2=A0=C2=A0 It does not happen if the module is compiled into =
the kernel or if a
>>> =C2=A0=C2=A0=C2=A0 initramfs is used which loads the module (I think)=
. I our case it
>>> =C2=A0=C2=A0=C2=A0 happend with the caam module as an external module=
 loaded on boot
>>> =C2=A0=C2=A0=C2=A0 from
>>> =C2=A0=C2=A0=C2=A0 the real root file system.
>>>
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0The patch you are commenting =
on only adds `Wants` weak
>>> =C2=A0=C2=A0=C2=A0 dependency to
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0make sure `systemd-udev-settl=
e.service` is pulled in to the
>>> =C2=A0=C2=A0=C2=A0 job queue,
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0the `After` ordering rule was=
 already there.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > Correct.=C2=A0 Just because an `After` exists do=
es not mean the
>>> =C2=A0=C2=A0=C2=A0 service gets
>>> =C2=A0=C2=A0=C2=A0 > pulled into
>>> =C2=A0=C2=A0=C2=A0 > the job queue, so prior to this change no other =
service was
>>> =C2=A0=C2=A0=C2=A0 causing the
>>> =C2=A0=C2=A0=C2=A0 > deprecated
>>> =C2=A0=C2=A0=C2=A0 > systemd-udev-settle.service to be run during boo=
t.=C2=A0 But now, every
>>> =C2=A0=C2=A0=C2=A0 > device including
>>> =C2=A0=C2=A0=C2=A0 > openssh (which has a default PACKAGECONFIG optio=
n for rng-tools)
>>> =C2=A0=C2=A0=C2=A0 now depends
>>> =C2=A0=C2=A0=C2=A0 > on this deprecated service, which may cause unex=
pected boot=20
>>> delays.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0So changing this service file=
 to be triggered by a udev
>>> =C2=A0=C2=A0=C2=A0 event or maybe
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0wrap it in a script, which ma=
kes sure the right modules are
>>> =C2=A0=C2=A0=C2=A0 loaded and
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0device nodes are available, c=
ould be an improvement, but it
>>> =C2=A0=C2=A0=C2=A0 would be
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0out
>>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0of scope of this patch IMO.
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 >
>>> =C2=A0=C2=A0=C2=A0 > I'm more curious whether this change should be r=
everted from
>>> =C2=A0=C2=A0=C2=A0 upstream.
>>> =C2=A0=C2=A0=C2=A0 > It seems
>>> =C2=A0=C2=A0=C2=A0 > like a drop-in file could have been applied to y=
our distro
>>> =C2=A0=C2=A0=C2=A0 instead of
>>> =C2=A0=C2=A0=C2=A0 > adding a dependency
>>> =C2=A0=C2=A0=C2=A0 > on a deprecated service for all openssh users.
>>>
>>> =C2=A0=C2=A0=C2=A0 This patch just adds a missing entry into the serv=
ice file. If you
>>> =C2=A0=C2=A0=C2=A0 have
>>> =C2=A0=C2=A0=C2=A0 solved the described issue in some way and can rev=
ert this patch and
>>> =C2=A0=C2=A0=C2=A0 remove the `Wants=3Dsystemd-udev-settle.service` t=
hen you can also
>>> =C2=A0=C2=A0=C2=A0 remove
>>> =C2=A0=C2=A0=C2=A0 the `After=3Dsystemd-udev-settle.service` at the s=
ame time and at that
>>> =C2=A0=C2=A0=C2=A0 point you can just remove both of those entries di=
rectly in the=20
>>> patch
>>> =C2=A0=C2=A0=C2=A0 that solved the timing issue.
>>>
>>> =C2=A0=C2=A0=C2=A0 I agree that `systemd-udev-settle.service` should =
probably not be
>>> =C2=A0=C2=A0=C2=A0 used
>>> =C2=A0=C2=A0=C2=A0 anymore, however that file already used it in a no=
n-functional way
>>> =C2=A0=C2=A0=C2=A0 and
>>> =C2=A0=C2=A0=C2=A0 all this patch did was make it fulfill its intende=
d function.
>>>
>>> =C2=A0=C2=A0=C2=A0 In retrospect I probably should have tried to find=
 a way to remove
>>> =C2=A0=C2=A0=C2=A0 the
>>> =C2=A0=C2=A0=C2=A0 usage of `systemd-udev-settle.service` completely,=
 when I looked=20
>>> into
>>> =C2=A0=C2=A0=C2=A0 the issue, however all this patch in essence does =
is revive dead
>>> =C2=A0=C2=A0=C2=A0 code,
>>> =C2=A0=C2=A0=C2=A0 which was already in place.
>>>
>>> =C2=A0=C2=A0=C2=A0 Also I think at that time I couldn't find a more p=
recise
>>> =C2=A0=C2=A0=C2=A0 instrument in
>>> =C2=A0=C2=A0=C2=A0 systemds massive toolbox to delay the start of rng=
d and services=20
>>> that
>>> =C2=A0=C2=A0=C2=A0 should be started in succession until the just the=
 hardware random
>>> =C2=A0=C2=A0=C2=A0 generator device is ready and `After=3Dsystemd-ude=
v-settle.service`=20
>>> was
>>> =C2=A0=C2=A0=C2=A0 already there. I guess some `ExecStartPre=3D` scri=
pt which delays the
>>> =C2=A0=C2=A0=C2=A0 start until the conditions are met could be implem=
ented, but that
>>> =C2=A0=C2=A0=C2=A0 seems
>>> =C2=A0=C2=A0=C2=A0 a bit hackish.
>>>
>>> =C2=A0=C2=A0=C2=A0 regards,
>>> =C2=A0=C2=A0=C2=A0 Claudius
>>>
>>
>> We are getting report from our users that adding this "Wants" causes=20
>> extremely slow boots on systems where it did not happen before this=20
>> change. Has anyone looked further into this and whether this change is=
=20
>> truly necessary?
>>
>> We have it reverted locally to work around the specific issue but I=20
>> wonder if there is a deeper issue here.
>=20
> It seems the issue was that module load was racing with rngd in that=20
> case perhaps adding After=3Dsystemd-modules-load.service
> might have been another choice to solve it. Using=20
> systemd-udev-settle.service is a bit heavy handed as it will wait for=20
> full h/w discovery which could vary from system to system.

Maybe systemd-modules-load.service could be enough in many cases,=20
however it has to be made sure that the device node /dev/hwrng is=20
created before the service is started. Just making sure that the modules=20
are loaded might not be enough...

As I described the best, albeit a bit hackish solutions, would be a=20
`ExecStartPre` script that delays the service until the system is ready=20
for rngd.

It is a bit difficult for me to test this now, since I no longer have=20
access to exactly that hardware, but I will try to review all patches=20
and comment on it if I find any potential issues.

regards,
Claudius

