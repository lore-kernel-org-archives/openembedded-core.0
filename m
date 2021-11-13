Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E031C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 12:12:10 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.5259.1636805528354882525
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 04:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=QA2lL+Ah;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636805528;
  x=1668341528;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cpyUR3/de4VL0Y3usYLvW8T9mQkPKQWJs70jGLKFCWg=;
  b=QA2lL+Ah0TgACKgcU3/6wEuKfQnTjfvB9tIMr8ByIVvf6MxO1wCJWolK
   4VQCl05v8nLj5zdiDUquw2MNmlfP77kBz3Wmj5MpKMsfQgk41LxCXJ/6s
   QCr9Sdg0qz1HdqYAddbhwveCeGqvjUgFXo8tO4HhrffQcDzLkTjbGdxxJ
   LFQB5eZQfZD8hjUE5galAXqYjKB6G4MbRcISaupFq3vba5msU7l3lADlR
   Sw2plKUd70y0bNERkYsu+eSITs4v2/qIalUaijdpxjfkEwyYJmY9RRP8T
   EHEXX0cK4+Accciax4xDxnw1ROWuAM6pa8+qLJqVQj9HwILYJ1/y8U1/8
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/4] python3-pygobject: Do not add
 -Dintrospection
Thread-Topic: [OE-core] [PATCH 3/4] python3-pygobject: Do not add
 -Dintrospection
Thread-Index: AQHX2AjbBgTRfYmtt0Gb3qDfaIalrawBXVrA
Date: Sat, 13 Nov 2021 12:12:04 +0000
Message-ID: <e4d246fb17f546cf823dc1a7e7c0a3da@axis.com>
References: <20211112210347.2004455-1-raj.khem@gmail.com>
 <20211112210347.2004455-3-raj.khem@gmail.com>
In-Reply-To: <20211112210347.2004455-3-raj.khem@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 12:12:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158242

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Khem Raj
> Sent: den 12 november 2021 22:04
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH 3/4] python3-pygobject: Do not add -Dintrospect=
ion
>=20
> meson 0.60 turns unknown options into them hard errors

Remove "them" (and correspondingly for the gstreamer1.0-python patch).

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

May I suggest squashing this commit with the preceding revert for=20
python3-pygobject, and similarly for the two patches for=20
gstreamer1.0-python. Otherwise this layer will be broken, e.g., if one=20
happens to end up on one of the reverts during a git bisect.

//Peter

> ---
>  meta/recipes-devtools/python/python3-pygobject_3.42.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/m=
eta/recipes-devtools/python/python3-pygobject_3.42.0.bb
> index 461ddcfe319..b07969c5efb 100644
> --- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
> +++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
> @@ -6,6 +6,8 @@ LICENSE =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb742476=
9c7"
>=20
>  GNOMEBASEBUILDCLASS =3D "meson"
> +GIR_MESON_OPTION =3D ""
> +
>  inherit gnomebase distutils3-base gobject-introspection upstream-version=
-is-even
>=20
>  DEPENDS +=3D "python3 glib-2.0"
> @@ -18,8 +20,6 @@ SRC_URI =3D " \
>  "
>  SRC_URI[sha256sum] =3D "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb=
427e307a6fe4367b"
>=20
> -UNKNOWN_CONFIGURE_WHITELIST =3D "introspection"
> -
>  S =3D "${WORKDIR}/${SRCNAME}-${PV}"
>=20
>  PACKAGECONFIG ??=3D "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'dire=
ctfb', 'wayland', 'x11' ], 'cairo', '', d)}"
> --
> 2.33.1


