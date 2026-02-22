Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A782C624D4
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 08:04:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10025.1771747438944407035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 00:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UQYYMiAX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3CE7B4E40F2F;
	Sun, 22 Feb 2026 08:03:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 054515FB83;
	Sun, 22 Feb 2026 08:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3D5610368CE5;
	Sun, 22 Feb 2026 09:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771747436; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FIyMK1Q4TsJ6JxlJB+KWHlZ9pUIlmn4QYD/PK2jglFg=;
	b=UQYYMiAXzOCCNVC4Xyj25dRJBRmj48NpAa3oVOcS2BbjSqrDGiqWEHSyifqbWl95MCOT2v
	Y7GXUcCE6XVd2I9So17KQatVxJHEI4vmxvueNi/bhOiSHBc3ucI7ITDS2j/70oYbEpcr4w
	jaBB/1zTs6O4SfRVUBwrDpAu4nwoMzlm1tio6OUGGxePjVLfyZISvsVISueZ3GTPyguzGG
	9R31VduejYbu0u1bMIKC2XQIyHhu9WWCvIYOnAXcHqSOUVQb3XNzgwcEgcffQEYhF11JmM
	J5U8PX0lVY78Hb4Zr+Pln7a3XSRCzwJVzqXdmceKdv9TlirR2cr01++4D0jrgw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 09:03:54 +0100
Message-Id: <DGLC1R76NVAU.1T2H9X9Z8I4J7@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/6] conf: Switch to systemd by default and
 simplify init manager selection
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 08:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231625

On Sat Feb 21, 2026 at 9:42 AM CET, Richard Purdie via lists.openembedded.o=
rg wrote:
> This change effectively switches things to use INIT_MANAGER to select the=
 init
> system and drops the old compatibility 'none' method. The init manager se=
lection
> is now complex enough that requiring users to select it makes sense.
>
> The new default is systemd, which reflects popular opinion. This is known=
 to have
> issues in some of our configurations such as musl but is also frequently =
asked for.
>
> Anyone replacing defaultsetup.conf in their own setup will need to provid=
e
> equivalent functionality but that is execpted for any of the settings in =
there.
>
> This change drops sysvinit from the default distro features backfill, mea=
ning
> we no longer need to remove it in systemd setups and places the init mana=
gers
> on a more equal and equivalent standing.
>
> This is a behaviour change for anyone using nodistro and anyone not alrea=
dy
> setting INIT_MANAGER explictly.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Hi Richard,

We got the following warnings:

genericx86-64/build/build/command-1-build-targets.log in /srv/pokybuild/yoc=
to-worker/genericx86-64/build/build
WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-64/=
build/layers/openembedded-core/meta/conf/distro/include/no-static-libs.inc =
in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core=
/meta/conf/distro/defaultsetup.conf
WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-64/=
build/layers/openembedded-core/meta/conf/distro/include/security_flags.inc =
in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-core=
/meta/conf/distro/defaultsetup.conf
WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-64/=
build/layers/openembedded-core/meta/conf/distro/include/yocto-space-optimiz=
e.inc in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedde=
d-core/meta/conf/distro/defaultsetup.conf
WARNING: Duplicate inclusion for /srv/pokybuild/yocto-worker/genericx86-64/=
build/layers/openembedded-core/meta/conf/distro/include/yocto-uninative.inc=
 in /srv/pokybuild/yocto-worker/genericx86-64/build/layers/openembedded-cor=
e/meta/conf/distro/defaultsetup.conf

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3233
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3242
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3274

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


