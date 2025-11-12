Return-Path: <dwagenknecht@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6401CD3429
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 17:00:09 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2343.1762966808398793461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 09:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=K2/thMMV;
 dkim=pass header.i=@emlix.com header.s=20250930 header.b=K2/thMMV;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: dwagenknecht@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1762966805;
	bh=46IWz1E3vDV7TDsPvCD6FwIXVL1T+VQyws3prxqOKt4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=K2/thMMV0k/Fc9+NB4JPR2Vq+2BDARmVVdGC3FdPhDKIx5MHMSIImd+PFoIZ0Yb+a
	 WgC1z35qOheR9lCH+GjuG/jFrYpQF+ggawWNGvvdEf9PyDKGvPTcZ5k1BKEdvpXYYd
	 oZtTbB2Qf58j12FNrVld6ekyQRbFw0r2sf+7vs57JlP3UvJ6dKKUm1Lziwnvwls3o3
	 HfCl+f4r0CKQTlYIImjaNTmhrMhJVmQuDuLAhdwcqd4/adKt4zhZQUYQxx2YR6WbrQ
	 hp3OV6i9EPXmbXQ78v12CCn2jz4y48/WwM4VT9wihFLETCqOt0Xsowx9Wb5fcTONch
	 ypEGak+p7uVeQ==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id E08A75FA80;
	Wed, 12 Nov 2025 18:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1762966805;
	bh=46IWz1E3vDV7TDsPvCD6FwIXVL1T+VQyws3prxqOKt4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=K2/thMMV0k/Fc9+NB4JPR2Vq+2BDARmVVdGC3FdPhDKIx5MHMSIImd+PFoIZ0Yb+a
	 WgC1z35qOheR9lCH+GjuG/jFrYpQF+ggawWNGvvdEf9PyDKGvPTcZ5k1BKEdvpXYYd
	 oZtTbB2Qf58j12FNrVld6ekyQRbFw0r2sf+7vs57JlP3UvJ6dKKUm1Lziwnvwls3o3
	 HfCl+f4r0CKQTlYIImjaNTmhrMhJVmQuDuLAhdwcqd4/adKt4zhZQUYQxx2YR6WbrQ
	 hp3OV6i9EPXmbXQ78v12CCn2jz4y48/WwM4VT9wihFLETCqOt0Xsowx9Wb5fcTONch
	 ypEGak+p7uVeQ==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id C60565F878;
	Wed, 12 Nov 2025 18:00:05 +0100 (CET)
Message-ID: <30a750da328e1a550743c7d818f5cf86bcf362e9.camel@emlix.com>
Subject: Re: [RFC PATCH 0/1] spdx: Add software file externalRef support
From: Daniel Wagenknecht <dwagenknecht@emlix.com>
To: Fabio Berton <fbberton@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com
In-Reply-To: <20251110171337.754568-1-fbberton@gmail.com>
References: <20251110171337.754568-1-fbberton@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Wed, 12 Nov 2025 17:59:25 +0100
User-Agent: Evolution 3.56.2 
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 17:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226211

Hello Fabio,

thanks for your comments and patch!

On Mon, 2025-11-10 at 17:13 +0000, Fabio Berton wrote:
> Our first idea was to use 'downloadLocation', but what I understand is
> that this is a package property, and files fetched from the layer are
> 'software_File' type. Looking at the SPDX spec, it appears we could use
> the 'ExternalRef' for this purpose.

I'm not to familiar with the SPDX spec yet, but adding individual files
entries as `ExternalRef` instead of `downloadLocation` to a recipes
spdx sounds reasonable.

I think in the long term adding a `SPDXRef-Layer-xyz` entry per layer
with a `downloadLocation` pointing to the subpath of the layer inside a
git repo.=C2=A0I'm not quite shure if it would be possible to formulate a
dependency on a file contained within a different SPDXRef, e.g.
```
SPDXRef-Layer-xyz:recipes-core/base-files/base-files/fstab
```
or if we'd have to create a SPDXRef Item for each file within a layer
in order to reference it properly. That would make it even more
verbose.

The approach of having a layer as an independent SPDXRef would mean
getting the git revision etc. for that layer would run only once per
build and not per `file://` entry in SRC_URI.
>=20
> The idea is to have two options to add this information: one to add the
> full path of a file, and another to add the git information

IMO the full path to the file is unneeded information, if the file is
solely available locally a `NOASSERTION` would be appropriate.

>=20
> Should I add a variable like 'SPDX_FILE_LOCATION_GIT_REMOTE_<layername>
> =3D "remote_name"' to set a specific remote for each layer? Would setting
> the git remote be sufficient to cover most cases?
In my experimentation I removed the per-layer setting again because
tracking the `vardeps` for the `do_create_spdx` get's more complicated
with per-layer variables.
>=20
Sincerely
Daniel Wagenknecht

