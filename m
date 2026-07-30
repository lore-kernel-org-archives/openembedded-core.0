Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97B7C55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:15:14 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9291.1785410105517493039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 04:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=loPHpAd5;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=oGEIzBAgcjxAoqpGlLJ1Axho1LCCE0lcTSr+eiH1eb8=; b=loPHpAd5trywseE/svHmPBjFFU
	VPZspqYwZAUbQ2MiFM97gqrkYLdY9VL0zv3YHyn4WF9hBFqBOYpZTf+YUXFrDLR4+cmi7/q8qUkRy
	LsjzJTxuKZQTOlTksr8PnOywqZ9gm4wqWgtgpfdpqOjxkQMlzo1PncIzij2vk7dzQSaQxVkMJHt2+
	fCJVZmGa+Fne0jw1LVEGV4HvG5H6fXFXdCHZMzLntISfJqeynThdBLlFEaxruj3BJMp3aUgjeQd7X
	izsv4eXQ2XTBEy8axXApWBjv6PRTbAyVt1bs9heV5UXLMqxpOcGEhe+sgYxE2vEexO28zZ8jt3QG1
	Ufh0lvPw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wpOj9-000P4H-0M;
	Thu, 30 Jul 2026 13:15:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wpOj8-000Av3-2s;
	Thu, 30 Jul 2026 13:15:02 +0200
Message-ID: <b0b1e1501a23b315704c5a6ef99a2c826408a56c.camel@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH v2 1/3] kernel-uboot: move FIT_KERNEL_COMP_ALG
 to image-fitimage.conf
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com
Date: Thu, 30 Jul 2026 13:15:02 +0200
In-Reply-To: <f0ab7f4d7d6c72feb2b1b8122a4434db98799370.camel@linuxfoundation.org>
References: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
	 <20260727090601.489155-2-nora.schiffer@ew.tq-group.com>
	 <f0ab7f4d7d6c72feb2b1b8122a4434db98799370.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28077/Thu Jul 30 08:24:42 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 11:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242339

On Thu, 2026-07-30 at 11:43 +0100, Richard Purdie wrote:
> On Mon, 2026-07-27 at 11:05 +0200, Nora Schiffer via lists.openembedded.o=
rg wrote:
> > It is a bit weird that FIT_KERNEL_COMP_ALG also affects uImage creation=
,
> > as kernel-uboot.bbclass is used for both, but fixing that would
> > unnecessarily break backwards compatibility.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> > =C2=A0meta/classes-recipe/kernel-uboot.bbclass | 3 +--
> > =C2=A0meta/conf/image-fitimage.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> > =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-re=
cipe/kernel-uboot.bbclass
> > index fa28be1715..9beccc2dff 100644
> > --- a/meta/classes-recipe/kernel-uboot.bbclass
> > +++ b/meta/classes-recipe/kernel-uboot.bbclass
> > @@ -4,8 +4,7 @@
> > =C2=A0# SPDX-License-Identifier: MIT
> > =C2=A0#
> > =C2=A0
> > -# fitImage kernel compression algorithm
> > -FIT_KERNEL_COMP_ALG ?=3D "gzip"
> > +require conf/image-fitimage.conf
> > =C2=A0
> > =C2=A0# Kernel image type passed to mkimage (i.e. kernel kernel_noload.=
..)
> > =C2=A0UBOOT_MKIMAGE_KERNEL_TYPE ?=3D "kernel"
> > diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.c=
onf
> > index a06d30e494..abb17186a5 100644
> > --- a/meta/conf/image-fitimage.conf
> > +++ b/meta/conf/image-fitimage.conf
> > @@ -48,6 +48,9 @@ FIT_OS ?=3D "linux"
> > =C2=A0# DTBs are provided separately in a FIT image.
> > =C2=A0FIT_LINUX_BIN ?=3D "linux.bin"
> > =C2=A0
> > +# fitImage kernel compression algorithm
> > +FIT_KERNEL_COMP_ALG ?=3D "gzip"
> > +
> > =C2=A0# Additional mkimage options for FIT image creation
> > =C2=A0FIT_MKIMAGE_EXTRA_OPTS ?=3D ""
> >=20
>=20
> We're realising that the kernel classes are a bit of a tangled spiders
> web and we want to improve things and clean things up.
>=20
> Adding a dependency on "fit" from the "uboot" class does therefore feed
> a bit backward as you note.
>=20
> You mention not breaking backwards compatibility. I think given the
> other work we're thinking about, it might be worth considering that and
> seeing if we can avoid tangling things up even further.
>=20
> Cheers,
>=20
> Richard

Okay, new plan: Change uboot_prep_kimage to accept the compression algorith=
m as
an argument, so we can use different variables when calling it from kernel-
uimage.bbclass and kernel-fit-extra-artifacts.bbclass. kernel-uimage.bbclas=
s
could then use a separate variable UBOOT_MKIMAGE_KERNEL_COMP_ALG instead of
reusing the FIT one.

A more radical approach would be to skip the deprecation of using a linux.b=
in
generated by the kernel recipe as a FIT image's kernel and drop support
immediately. This would result in kernel-fit-extra-artifacts.bbclass not ne=
eding
kernel-uboot.bbclass anymore, and maybe kernel-fit-extra-artifacts.bbclass =
could
then be dropped in favor of listing setup.bin in KERNEL_IMAGETYPES if it is
needed.

I'm a bit worried doing all that at once might cause too much breakage, and=
 I
think an incremental approach with deprecation warnings works fine here, bu=
t of
course that also depends on the other work you want to do.

Let me know which direction you prefer for the next iteration of these patc=
hes.

Best,
Nora



>=20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

