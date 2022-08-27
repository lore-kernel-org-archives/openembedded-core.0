Return-Path: <edwin@etorok.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894E4ECAAD1
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 19:15:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.52116.1661627742687904176
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 12:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@etorok.net header.s=gm1 header.b=VmsXWEep;
 spf=pass (domain: etorok.net, ip: 217.70.183.198, mailfrom: edwin@etorok.net)
Received: (Authenticated sender: edwin@etorok.net)
	by mail.gandi.net (Postfix) with ESMTPSA id 0A92EC0003;
	Sat, 27 Aug 2022 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etorok.net; s=gm1;
	t=1661627740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvOg4NaZkTTnGV0PwtOleCOJtltnUs1/DO2ciqth1qk=;
	b=VmsXWEepBuq/Z3fJvcxIoUvHgV4C5IoBsUPadwsD6YhcnWLItB2hnnhkq/3oJQ1Gf1gehj
	aRqWr/0vmj3uPUAj7jDy6kLK/2YduTcyBi39vAVJMoyFwc4Zsaey4G8tqEKzZgkPNrL8fj
	++LMHJAaHwEsQTgCZrsxPASfCqbEO5CRPfLvkejLcjK5eX+0E9V5ivuvuMqiiMkYnWfrnp
	BkvmRMwSH4RhJIClxrcSArE0Omzm3+ROEeu1TgfrgSbksfTGuXyqs876NdGkqubQpf5t0Z
	6HqubAwty6WHY7zEKjPaGk5LrdYFp9rMzy5WFLvEJ4GU2FkeK/3T7+hpHg1lBQ==
Message-ID: <2e91bec4aeff2002d84b96f4c7f06b99119f948c.camel@etorok.net>
Subject: Re: [OE-core] [PATCH] xz: do not OOM with 3x builds, lower memlimit
From: Edwin =?ISO-8859-1?Q?T=F6r=F6k?= <edwin@etorok.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Aug 2022 20:15:38 +0100
In-Reply-To: 
 <CANNYZj8Wa7-u08yzSNEYUOtJBMYO5hNEiWWjAPjB0ieytSBQbg@mail.gmail.com>
References: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
	 <CANNYZj8GigGudbwsES8zvfKGUs9sr+wHTRZMP2uut45JtDgOcQ@mail.gmail.com>
	 <e40af25a1dedc9780f107df17cfb81320235653e.camel@etorok.net>
	 <CANNYZj8Wa7-u08yzSNEYUOtJBMYO5hNEiWWjAPjB0ieytSBQbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 19:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169969

On Sat, 2022-08-27 at 21:00 +0200, Alexander Kanavin wrote:
> On Sat, 27 Aug 2022 at 20:45, Edwin T=C3=B6r=C3=B6k <edwin@etorok.net> wr=
ote:
> > I don't think it is currently possible to limit the number of 'xz'
> > processes though.
>=20
> This is a general problem and has been discussed many times over.
> Bitbake historically doesn't limit the amount of compiler instances
> or
> any other processes that may start, and makes no promises about
> avoiding OOM situations.

Indeed the more general problem of limiting memory used by compiler
processes is more difficult to solve.

>  If you find yourself in one, you need to
> tighten BB_NUMBER_THREADS/PARALLEL_MAKE until OOM goes away

If XZ always uses 50% of available memory then adding more RAM won't
help though. The only safe value would be BB_NUMBER_OF_THREADS=3D1.

There seems to be an unintended consequence of XZ_MEMLIMIT=3D50%. AFAICT
from the manpage 'xz -9' is meant to use 674MiB of memory at most.
XZ_MEMLIMIT=3D50% is 32GiB in my case, so it appears to increase memory
usage beyond what -9 would use (and compression time) by quite a lot.
It can also create problems when decompressing on less powerful systems
(xz says it might need up to 20% of the compressor's memory, so ~6.4
GiB in my case, but that number could be higher if compressed on a
machine with even more RAM).

Unless the intention here was to use as much memory as available to
squeeze out a few extra savings in compressed image size I think that
perhaps the default should be '50%' or '674MiB', whichever is smaller.

(And then "add more RAM" is a perfectly valid way to get out of the OOM
situation)

What do you think, should I try a patch for that?

Thanks,
--Edwin

> , or add
> more RAM. More conservative defaults will never be conservative
> enough
> for every user, so we stick with defaults that make use of every
> available CPU core.
>=20
> That said, there are recent bitbake patches to track 'memory
> pressure'
> and (I'm not sure exactly how) try to hold back if memory gets tight,
> so you're welcome to take them and run experiments.
>=20
> Alex


