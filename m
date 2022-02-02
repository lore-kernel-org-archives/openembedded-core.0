Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1600C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:08:45 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.63649.1643807323162587389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=eM+0t42B;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-002-205-233-038.002.205.pools.vodafone-ip.de [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 28F8683388;
	Wed,  2 Feb 2022 14:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643807320;
	bh=ojQy/hbqpWaGtz2Ut3Ri56yzJvchuNeTui3p6ol7l/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eM+0t42BJrmuZgo22N8daOq8s+xgrY80S8j2s1RS9jk/pA58+dC1Za7GqaQB5TJgY
	 Vae6YyXffmM4mFQehY7sjaV0/PmMDWhix6+ROd8+VBuMkb2ukqhzHIqDiZwW5QoxYN
	 3OmjxL3yWRi4LdMS9LF9cHPW6S37E4brnvJLRWBAuxDNLAa1zol+cU3SuhW/hId7Ez
	 bdbg3J+ja/doGPcS5Buaa1Puf2RcLkaxmBI0NgrA6zbtCuQ4TyqGhmy26Sp5NvztJB
	 YG1n2sEWs+Y+izeSJjpvhWj0cdKmmFCErChqEwXQQR/vNwsOcMv5Wn79M0oYtrf7F9
	 rW8YJgqzI2nOA==
Message-ID: <fa9e9247-c4f0-8896-bf54-95a03eff2105@denx.de>
Date: Wed, 2 Feb 2022 14:08:39 +0100
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
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: 
 <CAFrQVPNNvMxNDgP7GkSQitP6_4D5u1wDvzZRcJKd195Byo4u2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161195

Hi Kyle,

On 2022-02-02 13:38, Kyle Russell wrote:
> Is this the correct approach?=C2=A0 Even the systemd-udev-settle.servic=
e man=20
> pages recommends not using its service.=C2=A0 Were the kernel modules r=
eally=20
> not loaded when rngd started?=C2=A0 Or is the original problem just a m=
atter=20
> of waiting for sufficient entropy?

IIRC, the rngd could not find any random source device node (/dev/hwrng=20
in that case), so the service failed to start.

The patch you are commenting on only adds `Wants` weak dependency to=20
make sure `systemd-udev-settle.service` is pulled in to the job queue,=20
the `After` ordering rule was already there.

So changing this service file to be triggered by a udev event or maybe=20
wrap it in a script, which makes sure the right modules are loaded and=20
device nodes are available, could be an improvement, but it would be out=20
of scope of this patch IMO.

regards,
Claudius

>=20
> On Fri, Sep 17, 2021 at 4:08 AM Claudius Heine <ch@denx.de=20
> <mailto:ch@denx.de>> wrote:
>=20
>     rngd needs to start after `systemd-udev-settle` in order for the ke=
rnel
>     modules of the random source hardware to be loaded before it is sta=
rted.
>=20
>     However, since the `rngd.service` does not require or want
>     `systemd-udev-settle.service` it might not be scheduled for start a=
nd
>     the `After=3Dsystemd-udev-settle.service` there has no effect.
>=20
>     Adding `Wants=3Dsystemd-udev-settle.service` provides a weak requir=
ement
>     to it, so that the `rngd` is started after it, if possible.
>=20
>     Signed-off-by: Claudius Heine <ch@denx.de <mailto:ch@denx.de>>
>     ---
>=20
>     Hi,
>=20
>     this is a fix, which should probably be backported to the maintaine=
d
>     releases.
>=20
>     regards,
>     Claudius
>=20
>      =C2=A0meta/recipes-support/rng-tools/rng-tools/rngd.service | 1 +
>      =C2=A01 file changed, 1 insertion(+)
>=20
>     diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service
>     b/meta/recipes-support/rng-tools/rng-tools/rngd.service
>     index 0559b97991..568686e80e 100644
>     --- a/meta/recipes-support/rng-tools/rng-tools/rngd.service
>     +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
>     @@ -3,6 +3,7 @@ Description=3DHardware RNG Entropy Gatherer Daemon
>      =C2=A0DefaultDependencies=3Dno
>      =C2=A0After=3Dsystemd-udev-settle.service
>      =C2=A0Before=3Dsysinit.target shutdown.target
>     +Wants=3Dsystemd-udev-settle.service
>      =C2=A0Conflicts=3Dshutdown.target
>=20
>      =C2=A0[Service]
>     --=20
>     2.33.0
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#156129):
>     https://lists.openembedded.org/g/openembedded-core/message/156129
>     <https://lists.openembedded.org/g/openembedded-core/message/156129>
>     Mute This Topic: https://lists.openembedded.org/mt/85671578/4454381
>     <https://lists.openembedded.org/mt/85671578/4454381>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [bkylerussell@gmail.com <mailto:bkylerussell@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

