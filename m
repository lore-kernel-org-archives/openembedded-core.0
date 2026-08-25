Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A25C5DF9C
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 05:48:54 +0000 (UTC)
Subject: Re: [PATCH v2] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix lookup
To: openembedded-core@lists.openembedded.org
From: "iwanicki92" <iwanicki92@gmail.com>
X-Originating-Location: Gdansk, Pomerania, PL (77.236.16.240)
X-Originating-Platform: Linux Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 22:48:45 -0700
References: <20260824201017.3914783-2-iwanicki92@gmail.com> <CAJdd5GZsDEKtHL3pNjuqg6xEOWLFMDbGUibbobjus3XJR-8BLg@mail.gmail.com>
In-Reply-To: <CAJdd5GZsDEKtHL3pNjuqg6xEOWLFMDbGUibbobjus3XJR-8BLg@mail.gmail.com>
Message-ID: <2283556.1787636925763155083@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="8SXfC4TejzZUDvWnDiT4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 05:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244192

--8SXfC4TejzZUDvWnDiT4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

>=20
> I'm not sure where the documentation you found suggests this
>=20

The Yocto Project documentation: https://docs.yoctoproject.org/ref-manual/v=
ariables.html#term-SPDX_IMAGE_SUPPLIER contains almost the same example:

MY_COMPANY_name =3D "Acme Corp"
MY_COMPANY_type =3D "organization"
SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
SPDX_SDK_SUPPLIER =3D "MY_COMPANY"

the support for this is already implemented by undocumented `_ref` suffix, =
so maybe documentation should be changed instead.
Though `_ref` suffix if I'm reading code correctly allows for infinite chai=
ning e.g:

SPDX_IMAGE_SUPPLIER_ref =3D "MY_COMPANY1"
MY_COMPANY1_ref =3D "MY_COMPANY2"
MY_COMPANY2_name =3D "Acme Corp

>=20
> but the values for any base variable are suffixes always appended to that
> base variable
>=20
>=20
> SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
> SPDX_IMAGE_SUPPLIER_MY_COMPANY_name =3D "CCCC"
> SPDX_IMAGE_SUPPLIER_MY_COMPANY_type =3D "organization"
>=20

This one I don't think is mentioned anywhere, and also doesn't work. Maybe =
you meant SPDX_AUTHORS which has this syntax:

SPDX_AUTHORS ??=3D "openembedded"
SPDX_AUTHORS[doc] =3D "A space separated list of the document authors. Each=
 item \
is used to name a base variable like SPDX_AUTHORS_<AUTHOR> that \
describes the author."
SPDX_AUTHORS_openembedded_name =3D "OpenEmbedded"
SPDX_AUTHORS_openembedded_type =3D "organization"

--8SXfC4TejzZUDvWnDiT4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<blockquote>
<div>I'm not sure where the documentation you found suggests this</div>
</blockquote>
<div>&nbsp;</div>
<div>The Yocto Project documentation: https://docs.yoctoproject.org/ref-man=
ual/variables.html#term-SPDX_IMAGE_SUPPLIER contains almost the same exampl=
e:</div>
<div>&nbsp;</div>
<div>MY_COMPANY_name =3D "Acme Corp"<br />MY_COMPANY_type =3D "organization=
"<br />SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"<br />SPDX_SDK_SUPPLIER =3D "MY_=
COMPANY"</div>
<div>&nbsp;</div>
<div>the support for this is already implemented by undocumented `_ref` suf=
fix, so maybe documentation should be changed instead.<br />Though `_ref` s=
uffix if I'm reading code correctly allows for infinite chaining e.g:</div>
<div>&nbsp;</div>
<div>SPDX_IMAGE_SUPPLIER_ref =3D "MY_COMPANY1"</div>
<div>MY_COMPANY1_ref =3D "MY_COMPANY2"</div>
<div>MY_COMPANY2_name =3D "Acme Corp</div>
<div>&nbsp;</div>
<blockquote>
<div>but the values for any base variable are suffixes always appended to t=
hat base variable<br /><br /></div>
<div>SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"<br />SPDX_IMAGE_SUPPLIER_MY_COMPA=
NY_name =3D "CCCC"<br />SPDX_IMAGE_SUPPLIER_MY_COMPANY_type =3D "organizati=
on"</div>
</blockquote>
<div>&nbsp;</div>
<div>This one I don't think is mentioned anywhere, and also doesn't work. M=
aybe you meant SPDX_AUTHORS which has this syntax:</div>
<div>&nbsp;</div>
<div>SPDX_AUTHORS ??=3D "openembedded"<br />SPDX_AUTHORS[doc] =3D "A space =
separated list of the document authors. Each item \<br />&nbsp; &nbsp; is u=
sed to name a base variable like SPDX_AUTHORS_&lt;AUTHOR&gt; that \<br />&n=
bsp; &nbsp; describes the author."<br />SPDX_AUTHORS_openembedded_name =3D =
"OpenEmbedded"<br />SPDX_AUTHORS_openembedded_type =3D "organization"</div>

--8SXfC4TejzZUDvWnDiT4--

