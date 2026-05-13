Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53165CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 07:18:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2070.1778656727470907994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 00:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FNcED8l/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2921F4E42C8B;
	Wed, 13 May 2026 07:18:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF680606CE;
	Wed, 13 May 2026 07:18:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 280DF11AF8C85;
	Wed, 13 May 2026 09:18:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778656724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fKHsPEtUjs11fc0Vhat7Eo89aRJ1LYxFV4umWbel8DE=;
	b=FNcED8l/q/cQqxylBCavpmcKxnrVk5hkwQCPaW/8UrFGZ2WIf5oh+x5SLy1fARKKPG6Yom
	EUK+9d7CVdRkW4cV21Rstfk+In5A5bcN/MptOe38rEQsC9HFNSW/TlL8Y/MWmULXpY6OcD
	LIdAjpjno9WLy+glgPwOn6ekDBXYOZBMZEJrvcVT/qMEdz53pUVbK+ISIp66nbR8TKO8p1
	1xrIQ3Q7fuEPsmv5UjHtJKBhcaYWu6Mkak3q0CJIsb/3Ke0cHnuLyZDG1yUk7q+MjNrzh9
	rF/axcZH0cBc/MWFVxnlTsZA18zrX+hlVvktF8O/ssNSi/votZCHR9x/jxMwGg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: jeremie.dautheribes@bootlin.com, Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on
 SPDX_SBOM_EXT
Date: Wed, 13 May 2026 09:18:42 +0200
Message-ID: <4IxK-KmrSyWeqjlMbRmw5Q@bootlin.com>
In-Reply-To: 
 <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
References: 
 <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
 <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com>
 <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 07:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236934

On Wednesday, May 13, 2026 at 12:27=E2=80=AFAM, Joshua Watt wrote:
> On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes via
> lists.openembedded.org
> <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Add support for optional zstd compression for all types of SBOMs,
> > including:
> >   - image SBOM
> >   - recipe SBOM
> >   - SDK SBOM
> >
> > Zstd compression is applied if SPDX_SBOM_EXT ends with ".zst".
> >
> > Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boo=
tlin.com>
> > Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> > ---
> >  meta/classes/create-spdx-3.0.bbclass |  3 ++-
> >  meta/lib/oe/sbom30.py                | 11 +++++++++--
> >  2 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create=
=2Dspdx-3.0.bbclass
> > index 785edb9865..6cf8fa4688 100644
> > --- a/meta/classes/create-spdx-3.0.bbclass
> > +++ b/meta/classes/create-spdx-3.0.bbclass
> > @@ -75,7 +75,8 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base varia=
ble that describes how to \
> >              SPDX 3 spec. Optional but recommended"
> >
> >  SPDX_SBOM_EXT ??=3D ".spdx.json"
> > -SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
> > +SPDX_SBOM_EXT[doc] =3D "SBOM file extension name.\
> > +    If it ends with '.zst', SBOMs are automatically compressed using Z=
std."
> >
> >  # Agents
> >  #   Bitbake variables can be used to describe an SPDX Agent that may b=
e used
> > diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> > index 0f1f9281ad..2184c1a07f 100644
> > --- a/meta/lib/oe/sbom30.py
> > +++ b/meta/lib/oe/sbom30.py
> > @@ -1036,8 +1036,15 @@ def write_jsonld_doc(d, objset, dest):
> >          serializer =3D oe.spdx30.JSONLDInlineSerializer()
> >
> >      objset.objects.add(objset.doc)
> > -    with dest.open("wb") as f:
> > -        serializer.write(objset, f, force_at_graph=3DTrue)
> > +
> > +    if dest.name.endswith(".zst"):
>=20
> I'm not sure I like this detection mechanism; I think we usually do
> something more explicit for compression rather than relying on the
> suffix in other places?

Do you have an example somewhere in the code base?
I am not opposed to use a variable like `SPDX_COMPRESSED_SBOM`
and to have the following code "duplicated" (or create a function for it):

sbom_file_extension =3D ".spdx.json.zst" if compressed_sbom else ".spdx.jso=
n"

The goal was to simplify the code, and to allow user flexibility.
The user could choose any other extension (even if it violate the
ISO standard extension for SPDX documents).

>=20
> > +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
>=20
> The API is oe.utils.parallel_make_argument()

Thanks, but for information all code instance calling
`bb.compress.zstd.open` use the BB_NUMBER_THREADS variable :)

So maybe this should be fixed by another patch?

>=20
> > +        with bb.compress.zstd.open(dest, "w", num_threads=3Dnum_thread=
s) as f:
> > +            serializer.write(objset, f, force_at_graph=3DTrue)
> > +    else:
> > +        with dest.open("wb") as f:
> > +            serializer.write(objset, f, force_at_graph=3DTrue)
> > +
> >      objset.objects.remove(objset.doc)
> >
> >
> >
> > --
> > 2.54.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#236897): https://lists.openembedded.org/g/openembed=
ded-core/message/236897
> > Mute This Topic: https://lists.openembedded.org/mt/119282964/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




