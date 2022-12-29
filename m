Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1E2C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 17:16:23 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web11.210195.1672334174453490486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 09:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=default header.b=Zc74INKU;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1672334171; bh=4ZmoFk0eI6MsMvKwTS5NjD3HIacHgDgroyQmxeOj44c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Zc74INKUcHJ92zDATe4FFVg9o2++fjGz3DqXq2YFpYJzEnQmbro+3j9pnJ8sd2/41
	 rCYjvapcE11lOxQ5b7EgdvwxQPJoYiY+3swEiTQf07GrfpGXFk0UDqLK1kJzGv7m+0
	 gMGa2MhpoCFXjW1MhMBcoTgRxeMrA/9i8yrHtvgyYA9oD9h3nO33aHC3wMT7d7zwNX
	 BwFH9jnbX+Y7jV2UAviIZ8KpVSk38fZXmNkTtQvH2T4nO9O3fyn9gAPKXo4PpBMhUK
	 0o2zaeIqqSTYd5oJiHH7GpEEc6V9mMMWWrlUtxIfRvYHffHzRiq98WkgIOZ23Jl6hg
	 BCAG9I3BxN6HQ==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 2BTHG9g93457861
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Dec 2022 17:16:10 GMT
Message-ID: <5a3898d866b2bd752c091a30a7e3a6f9182ef766.camel@rpsys.net>
Subject: Re: [oe-core][PATCH] gtk-icon-cache.bbclass: replace += by :append
From: Richard Purdie <rpurdie@rpsys.net>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 29 Dec 2022 17:16:09 +0000
In-Reply-To: <Y62wQ3gdqXEFTB+/@nuoska>
References: <20221229151110.224320-1-f_l_k@t-online.de>
	 <Y62wQ3gdqXEFTB+/@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 17:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175122

On Thu, 2022-12-29 at 17:20 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Dec 29, 2022 at 04:11:10PM +0100, Markus Volk wrote:
> > While updating gnome-control-center I encountered an issue where
> > gtk-update-icon-cache could not be found and do_configure failed:
> >=20
> > > Program glib-compile-schemas found: YES (glib-compile-schemas)
> > > Program gtk4-update-icon-cache found: NO
> > > Program gtk-update-icon-cache found: NO
> > >=20
> > > ../gnome-control-center-43.2/meson.build:298:6: ERROR: Program 'gtk-u=
pdate-icon-cache' not found or not executable
> >=20
> > This can be fixed by using DEPENDS:append instead of DEPENDS +=3D
>=20
> Why? +=3D and :append are applied differently and it is crucial to
> understand why this is a problem in your case.
>=20
> IMO it's bad design to use :append everywhere because the changes can't
> be overwritten in a bbappend without explicitly removing all added
> things with :remove. In upstream and intermediate layers it's best to
> use +=3D where ever possible since these can then easily be overwritten i=
n
> product specific layers with a simple assignment.

I would much prefer to keep the +=3D and tweak the other place this is
being set to use +=3D as well so that :append isn't needed.

Replacing all +=3D with DEPENDS (which is where this path leads) creates
different and likely harder problems.

Cheers,

Richard

