Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788C9C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:11:21 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128.1784135475323986927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BrI/tl+P;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=X3WQgOas;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 3848B1D00081;
	Wed, 15 Jul 2026 13:11:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 15 Jul 2026 13:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784135474; x=1784221874; bh=kbVHOY9qUm
	bFIDt3BiBApxVFmet8PLqkDTB+A0LA5ts=; b=BrI/tl+PbxNqL8dkGLNrevo5In
	JEqLG/AGg4xX1jV9VMZD5PqY0d/++5oHNhWG3wZQAdNx1w6uxN9UqaUuzqEZIAOf
	IECMiGKICzZRlXhsL/QUqP555UxNzLlmrFvAcNZpCoraDtHuL1+6uKz/t0BFrbbp
	L0fsRlfoLnkCpT6t7UNDqlu1Kc5mnPIrKfWD1AhFsg8oUd4vdlPthzE80PWh/8ET
	ZC4JdhppIC+rjHaJXFoJfrtdZcbMp3GhqHagqnqQJ1wPuqtt/UYPjCwQWdPm7OWS
	kzenzboGV8w07WQ0PVjNrd4umm1/bYTbOoGeG+iJ3wI8klBCy4Ju4W+csyDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784135474; x=1784221874; bh=kbVHOY9qUmbFIDt3BiBApxVFmet8PLqkDTB
	+A0LA5ts=; b=X3WQgOasD8mfoMcteE+j9qMzECeNQU6mZeG5t3qveeKcfXU0Gxh
	XFHS7uUezvA+R0x2kmDlqvSorCsim3SRhYuMvRyVMTft4Pt+9qygnEWXPAxpjvfn
	DrlYd20ixU33QGvA+1faLLggqKS4ES51155ZoFnQqwm5vtxhRpEjZ+BeElvsQCd9
	3R99nahDo5ZEyRugwzeZ1Nbkfb3eqd10ujS+5P+xiNh0V2RBgW5ANOYm2ZlrQb7i
	5opAMyf+btgeKkvJz2l4fkpZQoKJWd5aWk7CFmXm7IPRqPsQMGzvoLfwtAfk7SjW
	EEnCZYD7h9bPNo2EHgbt3ToW/zhRkfKP5RQ==
X-ME-Sender: <xms:Mb9XatcEHo-mTDzJwXZ-c7xbUCkBnC4qj9UDlvapQLXwHU1XYD8W-w>
    <xme:Mb9XahPZ6KhzHrY7a0NZsnnzMVX9sOFo8z6OJyrwAk1e4183wAAvI7UTkv_oak2vJ
    KBVsJRH3q-VCSwiCyXX-gJTg3j_USGN767Wj3in6L61d3BbJlAiYio>
X-ME-Received: <xmr:Mb9XakJ1-OnwwrvruyKvma4ki_Pku9v_ilu9avsu7CrR_ASb2tPsxEmMNlBMyLIkTKALuO9DpX2ptBllCAOnOYBft_DPkBoZUguSTYre0FsJ>
X-ME-Proxy-Cause: dmFkZTF2IvutW2DoQUZ7avUj59D7et/2ObLelZu93n1D6fp+d4AcKM2P6NtTFJ1qabbwtD
    08HCi7yFTDBccrDmlb924L9RvogJiCHrimwFkiyhemLIE3DmAViZ22vr+Nw6JTU1Gtkh4Y
    N/++Xac9xKRV311uVPRf7tdJBVCEiTIGpZpJYLnwFjn2zOkH56FeID7TjwWAbGKWGtuOVl
    ZoNnFF06OvgEpziHvKFquPTGkv+b079r+o/dXZQ99md+EjyVk4NMhv4OTr8aY0rOnLIo/6
    1E28UpMqHuOPWB07ecyaaH8h3dyikyvM5dg+NVsl9bB24rVWk9E2aFG9N/+Lepa6u9rGrV
    GEX6FDXsfKSX94BJPhOov4b4iQnYBuxsA6hYTayZY/eyS4V0FSmSA1NHqbOIXL5i7j95ta
    H4MEQR9OHbA54glMqP4a+oEbS5czY5Mg5f7kUxRlThj+ihq6aYn0Y0RD5Jl75tRVbJGaxW
    cLVbx3OPLYTlYhj2bHhDp87wTVwNdjcvqU4y3qWGAJ7lJx4f4hniEYrjo33LFsaUothhA1
    pvG/BywCaAn7Nvk7m/12jdntdjlb0tBNEZEv3Hzh+qjCIJQ5AZ3cl6DwDPcHHrx/2jCzW+
    wI1c87rCYPt908Xmn9dSNEiUNNGv+7R4am6kt26EOvN0e2zncc5nDYzPP2uw
X-ME-Proxy: <xmx:Mb9XaiGC1VS9OyI4DUAv2DXGcm83ppGvRZ7-eWo8dYhUaX05UsBQfA>
    <xmx:Mb9XasSLBHC7IwthJxeuZp-mG5RTjAO4P2yap9kQqyBEYNop1b7MtQ>
    <xmx:Mb9XauGFyTWWa5FxkVUINr7qjgWc884CEqBWL4UA-_SI1o7JI3hUPw>
    <xmx:Mb9Xao_ZFlrC7mwBrFJ59zW_XXNmg_cAnyYWqP8uN3fWkUpSAgKsFQ>
    <xmx:Mr9XaitJeS6ZjcUFdZpjNrU0Q1LiebaVfxWHD2eP1jHf4-mz6X8nDhDI>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 13:11:13 -0400 (EDT)
Message-ID: <b6095f7ae705b87895634e1d8143e2ca399e0618.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2 00/25] Rework LICENSE to be SPDX License
 Expressions
From: Paul Barker <paul@pbarker.dev>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 15 Jul 2026 18:11:07 +0100
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
	 <20260715164739.364323-1-JPEWhacker@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-E841IuR9kGP0jIrwt60F"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241019


--=-E841IuR9kGP0jIrwt60F
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-15 at 10:44 -0600, Joshua Watt via
lists.openembedded.org wrote:
> Reworks the way that the LICENSE variable is used so that it uses valid
> SPDX License Expressions instead of the custom expressions that were
> used previously (which are based on Python syntax). This includes
> support for the SPDX "WITH" operator which allows a license exception to
> be attached to a license identifier.
>=20
> The old licenses expressions are still allowed, and will still be
> correctly parsed, however a warning will be issued that indicates the
> new license string that should be used.
>=20
> Most layers should be able to use the newly-revised
> scripts/contrib/convert-spdx-licenses.py script to do the majority of
> the conversion work, although some manual work may still be required if
> conditional or complex LICENSE expressions are encountered.
>=20
> SPDX License Expressions require that all licenses listed are either a
> known identifier (e.g. "GPL-2.0-or-later") or start with the prefix
> "LicenseRef-" which indicates a custom license. When converting from old
> expressions to new one this will need to be followed (the suggested new
> license in the warning and the conversion script will automatically add
> this prefix for any unrecognized license identifiers). This will most
> commonly be the case for NO_GENERIC_LICENSE files; for a good example of
> what needs to be done here see the changes to the linux-firmware recipe.
> When adding new LicenseRef- licenses to a recipe, the actual license
> name should be prefixed with the name of the recipe (e.g.
> "LicenseRef-myrecipe-mylicense") to prevent conflicts when merging
> multiple license documents together (e.g. in an image).
>=20
> SPDX also introduces the "WITH" operator to add an exception to a
> license instead of using a bespoke identifier to combine the two, as was
> done with the legacy license expressions. Because of this, the logic for
> dealing with the INCOMPATIBLE_LICENSE family of variables has changed
> slightly. The main difference is that INCOMPATIBLE_LICENSE will now
> match the LHS of a "WITH" expression (where as previously this was
> "ignored" since it was a bespoke license ID). In order to allow a
> license that would normally be rejected, but can be allowed with an
> exception, specifically allowed exceptions can be added to the
> INCOMPATIBLE_LICENSE_EXCEPTIONS variable (keep in mind, EXCEPTIONS here
> means "exceptions to INCOMPATIBLE_LICENSES", not specifically SPDX
> License Exceptions). If an SPDX exception is present here, any license
> that has that exception will be allowed, even if it would normally match
> INCOMPATIBLE_LICENSE. For example, to disallow all GPLv3 except for
> those with the GCC exception, use:
>=20
>     INCOMPATIBLE_LICENSE =3D "GPL-3.0* LGPL-3.0*"
>     INCOMPATIBLE_LICENSE_EXCEPTIONS =3D "GCC-exception-3.1" # This new li=
ne is required
>=20
>=20
> Additionally, "PD" ("Public Domain") is not allowed as a generic license
> identifier. Aside from "PD" not being a valid SPDX License Identifier,
> most "Public Domain" licenses do have some sort of text associated with
> them (see the HPND family of SPDX Licenses, or use the (SPDX License
> Match Website)[1] ). In addition, the meaning of "Public Domain" can vary
> by jurisdiction, so the actual text with a LicenseRef- or a SPDX License
> Identifier needs to be used instead.
>=20
> Finally, "CLOSED" is also no longer allowed as a license expression
> (since it is not a valid SPDX License Identifier). Instead use a
> LicenseRef- to point to a file that contains the actual license text
> (usually something like "Copyright <name>, all rights reserved")

Hi Joshua,

I've had a skim through but not reviewed in detail, this looks good in
general.

I'm concerned about removing support for "CLOSED" as a license
expression though, that has been used extensively on downstream projects
I've worked on over the years. It's helpful to be able to bypass license
checking where it may not be needed.

After applying this series there is still handling for "CLOSED" in
several places such as populate_lic_qa_checksum() in insane.bbclass.

Best regards,

--=20
Paul Barker


--=-E841IuR9kGP0jIrwt60F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCale/KxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkjZAQDOhW44munuiN8BRnx733zoR3mFJc6mnlcO
actT0fXXTAD/ae6xLWgRXbLdj3ff0unnM4WD/Ts9/zWl68NQmhthvgk=
=ZjUe
-----END PGP SIGNATURE-----

--=-E841IuR9kGP0jIrwt60F--

