Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7DBC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 11:53:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.17131.1679054026383740737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 04:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=hgU/FUCk;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2D4D285B84;
	Fri, 17 Mar 2023 12:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1679054023;
	bh=FaMWdYtjdTdSC73xzqLzZ8HuEm8myO2Kf0lxO/SmbO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hgU/FUCk6LGcBQU0W70nKJS1sUV91yrDXsrdk91DnzBw94/+ntTIQwL7uNTRD/TCv
	 lmfSRMmHqcTVRwwUkUK4sq9lp/Rj/Dh3V5cC66k3qycQgI/c3TmSGI0vzF7Uwo73Ad
	 UXG760WUCNZTT6esMiNhhIOzGmNjXDM9XMaCl9xx3wwhYFiEXRZIk1g5AivXs+R8z3
	 jHsPyDi44cpJxEE6bapWqbuCVjLG0Y/xl/XkI8LKLkbnD/iaQePvniOsHBbH5zjzz5
	 kZWnxS0QiT25UN7dzC2ru8XkD5F/u1tSijZQlyPjIpenPs8V6vG+/5tnDy05Oenc0I
	 VCbQmWzFcE8sw==
Message-ID: <34a6fdfb-f96d-536d-7761-fb46b06a302f@denx.de>
Date: Fri, 17 Mar 2023 12:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
Content-Language: en-US
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Armin Kuster <akuster808@gmail.com>, Bob Henz <robert_henz@jabil.com>,
 Kristian Klausen <kristian@klausen.dk>,
 Nick Potenski <nick.potenski@garmin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230227191548.95504-1-marex@denx.de>
 <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 11:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178750

On 3/15/23 11:10, ChenQi wrote:

Hi,

> This patch is forcing systemd to do preset-all at boot time (first boot=
)=20
> in a function that simulates 'preset-all' at rootfs time.
>=20
> If we look at the comments above the changed line, we can see that the=20
> /etc/machine-id file was deliberately created as empty, for the purpose=
=20
> of making systemd not treat the system as first boot.
> """
>  =C2=A0=C2=A0=C2=A0 # If we populate the systemd links we also create /=
etc/machine-id,=20
> which
>  =C2=A0=C2=A0=C2=A0 # allows systemd to boot with the filesystem read-o=
nly before=20
> generating
>  =C2=A0=C2=A0=C2=A0 # a real value and then committing it back.
>  =C2=A0=C2=A0=C2=A0 #
>  =C2=A0=C2=A0=C2=A0 # For the stateless configuration, where /etc is ge=
nerated at runtime
>  =C2=A0=C2=A0=C2=A0 # (for example on a tmpfs), this script shouldn't r=
un at all and we
>  =C2=A0=C2=A0=C2=A0 # allow systemd to completely populate /etc.
> """
>=20
> I'm going to send out a patch to revert this patch.

Hmmm, the problem is that without this patch, systemd firstboot does not=20
work and I would like to use that. How can we accommodate both options,=20
i.e. no breakage for you and working systemd-firstboot ?

