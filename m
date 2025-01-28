Return-Path: <sst@poczta.fm>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D665C02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 07:32:16 +0000 (UTC)
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
 by mx.groups.io with SMTP id smtpd.web10.12809.1738049521549497701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jan 2025 23:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@poczta.fm header.s=dk header.b=Kdz1cpwS;
 spf=pass (domain: poczta.fm, ip: 217.74.67.49, mailfrom: sst@poczta.fm)
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Tue, 28 Jan 2025 08:31:56 +0100 (CET)
Date: Tue, 28 Jan 2025 08:31:55 +0100
From: Slawomir Stepien <sst@poczta.fm>
To: =?iso-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Subject: Re: [OE-core] [PATCH RESEND] kernel-yocto: fix merge_config.sh flag
 set when KBUILD_DEFCONFIG is used
Message-ID: <Z5iH6xr_ffrhXkiK@nr200>
References: <20250126132005.1540374-1-sst@poczta.fm>
 <tymbfhiwtonqtgdulmtqdhaswoxq43asvxtizp2zeocaytipdi@5k6e2fmt22p7>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <tymbfhiwtonqtgdulmtqdhaswoxq43asvxtizp2zeocaytipdi@5k6e2fmt22p7>
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1738049518; bh=8u1yctrKJYW2XouWMau6+ovZsknKhpPh3QfJ1QYOOZM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=Kdz1cpwSIjYNJptGjCrAa7wBkI2V2O6mhYZxolyrjiTLE/Cbj4tfFrlm0+Ycck1IR
	 Ye6H/Nza3/fRm3nWgv7SkmdsYURPQnF1sOYQI6n0ISWcMG0CfE3TI4UmSh19JEyP7s
	 EIPzkOUOOpTl+Zr4a9cJHsqC0LC1GNP7cL+vFkNM=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 07:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210311

On sty 26, 2025 16:51, J=F6rg Sommer wrote:
> Slawomir Stepien via lists.openembedded.org schrieb am So 26. Jan, 13:4=
3 (+0100):
> > Based on the documentation of KCONFIG_MODE[1], when we use "in-tree"
> > defconfig (the KBUILD_DEFCONFIG is set), then the alldefconfig mode
> > should be used with merge_config.sh.
> >=20
> > This commit fixes the logic behind setting the flag by checking if th=
e
> > provided defconfig file exists in the linux source tree.
> >=20
> > [1] https://docs.yoctoproject.org/ref-manual/variables.html#term-KCON=
FIG_MODE
> >=20
> > Signed-off-by: Slawomir Stepien <sst@poczta.fm>
> > ---
> >  meta/classes-recipe/kernel-yocto.bbclass | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-=
recipe/kernel-yocto.bbclass
> > index c45abf6ddc..ffda41ffc9 100644
> > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > @@ -113,6 +113,14 @@ def get_dirs_with_fragments(d):
> > =20
> >      return " ".join(extrafiles)
> > =20
> > +kbuild_defconfig_exists() {
> > +	if [ -f "${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG}" ]; then
> > +		return 0
> > +	fi
> > +
> > +	return 1
>=20
> Hi,

Hi J=F6rg,

Thanks for all these good comments. After Bruce's comment, I will not pus=
h further this approach.

> (...)

--=20
Slawomir Stepien

