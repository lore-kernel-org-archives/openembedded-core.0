Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4DC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 08:35:21 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6802.1643877319463375106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 00:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=BNmeFSIB;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B022C83A0D;
	Thu,  3 Feb 2022 09:35:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643877316;
	bh=qtkYfERZE2juIU7/kxQDrhz3NMCz7jHGkXqsmVnhOpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BNmeFSIBkSEhaOWx6aRhhTEsPeMkUangCV0ugFz0qX+hgoT2/IM9cBrWHuN6r5El3
	 jCPa1mgHFzECBQ10+FUji4DMIAsVyqLLYgRipycXlGIyWi2rkBe+pbaxbzQgjmfBuo
	 X3TYJsMalQ70RNYedPK7zGjrgUVP8EordY1DkyOkINM82Y66zLa7uPSbO3P/Axi748
	 /cw04BjdIRXKj7zCFKVNeJTEfIxgEi0M9OuzzDTBApXMLAexW3cfioHksY9T0874fL
	 +PH8NUPhSVbI7lnjBinYCRvNU7MrTYBqqZzJJ02U6fyrJD9Tqu4gi6nUp9ZafnrSes
	 njl9G/aksaQ2A==
Message-ID: <3aad56dc-ae73-6449-c680-b9da234830f0@denx.de>
Date: Thu, 3 Feb 2022 09:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to
 service
Content-Language: en-US
To: Kyle Russell <bkylerussell@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Marek Vasut <marex@denx.de>, Alex Kiernan <alex.kiernan@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Alban Bedel <alban.bedel@aerq.com>, Wes Lindauer <wesley.lindauer@gmail.com>
References: <20210917080804.2545478-1-ch@denx.de>
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
 <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
 <CAFrQVPNiHZ8MEv0uaHUpi4J=Erefa1GLzGYh_af19X6A-gxg4g@mail.gmail.com>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CAFrQVPNiHZ8MEv0uaHUpi4J=Erefa1GLzGYh_af19X6A-gxg4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 08:35:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161266

On 2022-02-02 17:26, Kyle Russell wrote:
> Thanks, Claudius.
>=20
> On Wed, Feb 2, 2022 at 8:08 AM Claudius Heine <ch@denx.de=20
> <mailto:ch@denx.de>> wrote:
>=20
>     Hi Kyle,
>=20
>     On 2022-02-02 13:38, Kyle Russell wrote:
>      > Is this the correct approach?=C2=A0 Even the
>     systemd-udev-settle.service man
>      > pages recommends not using its service.=C2=A0 Were the kernel mo=
dules
>     really
>      > not loaded when rngd started?=C2=A0 Or is the original problem j=
ust a
>     matter
>      > of waiting for sufficient entropy?
>=20
>     IIRC, the rngd could not find any random source device node (/dev/h=
wrng
>     in that case), so the service failed to start.
>=20
>=20
> If /dev/hwrng didn't exist, this feels like the original problem was a=20
> misconfigured
> kernel or module that wasn't being loaded properly.

Yes, however it is a timing issue. The module was loaded properly at=20
bootup, however at the time rngd was started the module was not loaded=20
yet and thus the service fails to start. If it would be delayed until=20
the module is loaded everything would be fine.

It does not happen if the module is compiled into the kernel or if a=20
initramfs is used which loads the module (I think). I our case it=20
happend with the caam module as an external module loaded on boot from=20
the real root file system.

>     The patch you are commenting on only adds `Wants` weak dependency t=
o
>     make sure `systemd-udev-settle.service` is pulled in to the job que=
ue,
>     the `After` ordering rule was already there.
>=20
>=20
> Correct.=C2=A0 Just because an `After` exists does not mean the service=
 gets=20
> pulled into
> the job queue, so prior to this change no other service was causing the=
=20
> deprecated
> systemd-udev-settle.service to be run during boot.=C2=A0 But now, every=
=20
> device including
> openssh (which has a default PACKAGECONFIG option for rng-tools) now de=
pends
> on this deprecated service, which may cause unexpected boot delays.
>=20
>     So changing this service file to be triggered by a udev event or ma=
ybe
>     wrap it in a script, which makes sure the right modules are loaded =
and
>     device nodes are available, could be an improvement, but it would b=
e
>     out
>     of scope of this patch IMO.
>=20
>=20
> I'm more curious whether this change should be reverted from upstream. =
=20
> It seems
> like a drop-in file could have been applied to your distro instead of=20
> adding a dependency
> on a deprecated service for all openssh users.

This patch just adds a missing entry into the service file. If you have=20
solved the described issue in some way and can revert this patch and=20
remove the `Wants=3Dsystemd-udev-settle.service` then you can also remove=
=20
the `After=3Dsystemd-udev-settle.service` at the same time and at that=20
point you can just remove both of those entries directly in the patch=20
that solved the timing issue.

I agree that `systemd-udev-settle.service` should probably not be used=20
anymore, however that file already used it in a non-functional way and=20
all this patch did was make it fulfill its intended function.

In retrospect I probably should have tried to find a way to remove the=20
usage of `systemd-udev-settle.service` completely, when I looked into=20
the issue, however all this patch in essence does is revive dead code,=20
which was already in place.

Also I think at that time I couldn't find a more precise instrument in=20
systemds massive toolbox to delay the start of rngd and services that=20
should be started in succession until the just the hardware random=20
generator device is ready and `After=3Dsystemd-udev-settle.service` was=20
already there. I guess some `ExecStartPre=3D` script which delays the=20
start until the conditions are met could be implemented, but that seems=20
a bit hackish.

regards,
Claudius

