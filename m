Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1437C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 08:52:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.3419.1682499145035496122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 01:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EZBHVZtw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 138F120009;
	Wed, 26 Apr 2023 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1682499143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZ5doW+4gpzjTzIz0xRO4DG2WCnW+G8P5eBFczwP0Ik=;
	b=EZBHVZtwn3MaxedYzimMzoIsQaV+4PZ+GI7W/+WSchK/4SZudEYs4WuNMIehSTLiBQc3wU
	xG/YGsmSMk7WfcUjgCSbT3XjWggkt3x4OYvbU3tlNUbka8DblAMA8WLyDtvE9yz2FafunD
	BKIn0/aViLnapj8i/MRucnAoezsfXv8ze83XUMr6TCZMAzasAc0t6Ag65d6V/bl3zKDb4u
	WQo5quwnthbAkX0mguWcfCv6xG3F/mIKGmJcSMAfnpchef5Mu2roS4XEjhxywUPeLcqGoY
	+bdvy+bKoXvVvBrlRGBr5nYsxhc0Ub8WlQkYB1ANatz1wAUPXE3DyJAb6JMMrg==
Date: Wed, 26 Apr 2023 10:52:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Enrico =?UTF-8?Q?J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
 <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Subject: Re: [OE-core] [PATCH v3 4/9] oeqa/utils/qemurunner: support
 ignoring vt100 escape sequences
Message-ID: <20230426105220.78e13af1@booty>
In-Reply-To: <20230425184720.456896-5-ejo@pengutronix.de>
References: <20230425184720.456896-1-ejo@pengutronix.de>
	<20230425184720.456896-5-ejo@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 08:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180413

Hello Enrico,

On Tue, 25 Apr 2023 20:47:15 +0200
Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:

> If we talk to terminals that like colors, we need to ignore the vt100
> escape sequences when matching strings.
>=20
> An unprocessed barebox console prompt would e.g. look like:
>=20
>   ESC[1;32mbarebox@ESC[1;36mARM QEMU virt64:/ESC[0m
>=20
> where we cannot match for something like "barebox@ARM QEMU virt64:/".
> The same applies to colored Linux terminal output of course.
>=20
> The "\x1b\[" from the regex catches the standard start of ansii escape
                                                            ^^^^^

I guess you mean "ansi" (single 'i'). I fixed that (and also converted
to uppercase) while applying the patch for testing, no need to resend.

> sequence while the rest catches the actual command code executed.
>=20
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemu=
runner.py
> index 6734cee48d..c3d8e9e815 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -30,6 +30,8 @@ control_range =3D list(range(0,32))+list(range(127,160))
>  control_chars =3D [chr(x) for x in control_range
>                  if chr(x) not in string.printable]
>  re_control_char =3D re.compile('[%s]' % re.escape("".join(control_chars)=
))
> +# Regex to remove the ansii (color) control codes from console strings i=
n order to match the text only
                         ^^^^^

Same here.

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

