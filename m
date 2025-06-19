Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2791C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 15:32:31 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web10.2670.1750347151093639374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 08:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PiqtOsG7;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F41B9442A7;
	Thu, 19 Jun 2025 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750347149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Ad0liPOvKQXsIacdiLfZzPsn8MRFwtPIq+pQyU0czE=;
	b=PiqtOsG7bW37r435JXuhoJa3N2DV8zvxpsTVQg8sBkvQzuSi9llP46HFgd74bZUg6NEUmP
	1Il/kpns+XtoxqVDBUTOV9XjHO3M/4PIxpIZ2pEyK5uCZLXLzPM5nk5BxFkODCWqr8rcvd
	VB076AxJM5lIZtK00DsrlqMckNu6D91OIBp10fqLbrsf6pNFTI0Ze2/Gg2Dt9Nuxn8uiGe
	b9g14gJ7zs/mxhC2eXC+9pt2hSdGrRDYpsV0Kod9hL6nQka3NeujvP1DLIHnlhEXLtIbvU
	CBflg3zd8YA3uSWoqBr1vX56QiSVRYuzlQUI7X442LlRyttnQgEGJJ+/ravcbg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 17:32:28 +0200
Message-Id: <DAQMA3E0OM0S.N9VZOQHC3GPL@bootlin.com>
Subject: Re: [OE-core] [PATCH] nfsrootfs: disable warning message if
 bootargs root parameter have not been defined
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <jimmy.ho@sifive.com>, <openembedded-core@lists.openembedded.org>
References: <20250619082919.12390-1-jimmy.ho@sifive.com>
In-Reply-To: <20250619082919.12390-1-jimmy.ho@sifive.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffekhedtfedvueevgeeffffhvdegveeguefggeduhffhfeekvdehkeefueejveelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjihhmmhihrdhhohesshhifhhivhgvrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpv
 ghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhm
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 15:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219089

On Thu Jun 19, 2025 at 10:29 AM CEST, Jimmy Ho via lists.openembedded.org w=
rote:
> we have case that don't define root in bootargs,
> if [ ${bootparam_root} !=3D "/dev/nfs" ] will output warning "/init.d/85-=
nfsrootfs: line 4: [: !=3D: unary operator expected"
> by checking  whether bootparam_root is defined can clear this warning mes=
sage=20
>
> Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootf=
s b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> index e67ee4c25d..1e76258ce1 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/nfsrootfs
> @@ -1,7 +1,7 @@
>  #!/bin/sh
> =20
>  nfsrootfs_enabled() {
> -	if [ ${bootparam_root} !=3D "/dev/nfs" ] || [ -z ${bootparam_nfsroot} ]=
; then
> +	if [ -z ${bootparam_root} ] || [ ${bootparam_root} !=3D "/dev/nfs" ] ||=
 [ -z ${bootparam_nfsroot} ]; then

I think a better way of fixing this would be to replace

  [ ${bootparam_root} !=3D "/dev/nfs" ]

by

  [ "${bootparam_root}" !=3D "/dev/nfs" ]

instead of an extra condition.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


