Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB99C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:44:19 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.18410.1658918650915300968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z6J+ljjX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 340D5E000A;
	Wed, 27 Jul 2022 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658918649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sdbl5U1dQdwRFoveCtsTSBSkAvwq5xuwN84c78aI1Kc=;
	b=Z6J+ljjXestPKGS9R3mfRGY2vOG0vLlvF+VbGn7kLptV4VBKkrygJTTlFykNlnRxYjW/cw
	r7b5Z86OZjqiYPLE4W61fDGJaTVDhjt2Pp+dQtPM9hvCHr2uDn15luxdRvUmpn4lVA+fh7
	maWyaiRjl9BR5gp28VwAVbe0tBo/uwt+1Yi/nRmgM6nOGx83WjcR6jM4XnjsWvzT7QKPnX
	qeSG6zMRzb5W59j/pw2ooQ/5EfZOLGrw2V8QIxJGLXQi8xQuUvqd3Ab4NQSY5XwsoXPAVI
	arJR0GzYtjcDumsp18IMN0tIt08hBqRoXI/iCA7qysQsJNdy4nezCIch2gQBpQ==
Date: Wed, 27 Jul 2022 12:44:06 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "An?bal Lim?n" <limon.anibal@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 otavio.salvador@ossystems.com.br, richard.purdie@linuxfoundation.org
Subject: Re: [OE-core] [PATCHv2]] recipes-support: rng-tools change systemd
 service name
Message-ID: <20220727124406.4f7bc8ec@booty>
In-Reply-To: <20220726193322.1569574-1-limon.anibal@gmail.com>
References: <20220726193322.1569574-1-limon.anibal@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 10:44:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168551

Hello An=C3=ADbal,

On Tue, 26 Jul 2022 14:33:22 -0500
"An?bal Lim?n" <limon.anibal@gmail.com> wrote:

> From: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>=20
> Change systemd service name from rngd -> rng-tools to avoid load twice
> the service when sysvinit compatibility is enabled,
>=20
> ...
> root@:~# ps  | grep rng
>    23 root         0 SW   [hwrng]
> 13109 root      3528 R    /usr/sbin/rngd -f -r /dev/hwrng
> 13117 root      2348 S    grep rng
> 29418 root     12756 S    /usr/sbin/rngd -r /dev/hwrng
> ...
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
> ---
>  .../rng-tools/{rngd.service =3D> rng-tools.service}    |  0
>  meta/recipes-support/rng-tools/rng-tools_6.15.bb     | 12 ++++++------
>  2 files changed, 6 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/rng-tools/rng-tools/{rngd.service =3D> rng-t=
ools.service} (100%)
>=20
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta=
/recipes-support/rng-tools/rng-tools/rng-tools.service
> similarity index 100%
> rename from meta/recipes-support/rng-tools/rng-tools/rngd.service
> rename to meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/reci=
pes-support/rng-tools/rng-tools_6.15.bb
> index 0696351903..efc08b5e0a 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> @@ -11,7 +11,7 @@ DEPENDS =3D "sysfsutils openssl"
>  SRC_URI =3D "git://github.com/nhorman/rng-tools.git;branch=3Dmaster;prot=
ocol=3Dhttps \
>             file://init \
>             file://default \
> -           file://rngd.service \
> +           file://rng-tools.service \

This feels strange to me: "rng-tools" does not look like a daemon name,
but rather a, well, tools name. Maybe "rng-daemon" would clarify?

Still I'm taking this patch for testing, I'll replace it with v2 should
you send one.

However please note there is an extra ']' in the subject: [PATCHv2]]
should be [PATCHv2]. This leads 'git am' to produce a commit starting
with a "] " prefix. I fixed it while applying, however you should check
that in the future.

Best regards.
--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

