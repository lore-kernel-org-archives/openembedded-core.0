Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D367DC04A95
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 09:09:07 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.5768.1664356143250035531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 02:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=JsSwAfzO;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664356143;
  x=1695892143;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=teLYhuvXaIx3hZkt1u+szBXTrnExZ29pH5k2rt7z9ZY=;
  b=JsSwAfzOCPo00EAWr7z3ooi7LEwIeyDBJTc048St4XDXwJh7Z76XvF4j
   kLLecy1RhzI8wXugixgW/ii2LhINcgBJY9dQUIJWWehk8tMqyN1yfLI/2
   rS97A8Verb8XUnxF/emf+T9LtF8NrQ/3j3H2GzdPfiUxNMmNONvtskm5d
   i6rscB/UApKaR0L6mDVIkP7uWloqzNojq3fVvnO7Au/KVD61JkLqCrF/l
   E98cmWPvrOs1prrTzGPE8azXPWi+OHuTwX8Dq9P8NLJjKdqUzxx/AeOE/
   g69xCN5IqOKqIw+p/bPAN5fGhPytQzzmEqGALyJOIhkwOOBgg++7cu8XX
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Liam Beguin <liambeguin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
Subject: RE: [OE-core] [PATCH v2] meson: make wrapper options sub-command
 specific
Thread-Topic: [OE-core] [PATCH v2] meson: make wrapper options sub-command
 specific
Thread-Index: AQHY0uVRO6CN8C8KQ0WgnK8KIxqjGq30ixfQ
Date: Wed, 28 Sep 2022 09:08:59 +0000
Message-ID: <67ea95876495448f93c1412f49c3c8ea@axis.com>
References: <20220928025205.1286043-1-liambeguin@gmail.com>
In-Reply-To: <20220928025205.1286043-1-liambeguin@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 09:09:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171141

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Liam Beguin
> Sent: den 28 september 2022 04:52
> To: liambeguin@gmail.com; openembedded-core@lists.openembedded.org
> Cc: alexandre.belloni@bootlin.com
> Subject: [OE-core] [PATCH v2] meson: make wrapper options sub-command spe=
cific
>=20
> The meson-wrapper adds setup options to facilitate cross-compilation.
> The current options are exclusive to the setup sub-command and might
> cause issues with other sub-commands.
>=20
> Update the wrapper to make options sub-command specific.
>=20
> Signed-off-by: Liam Beguin <liambeguin@gmail.com>
> ---
>  .../meson/meson/meson-wrapper                 | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recip=
es-devtools/meson/meson/meson-wrapper
> index c62007f5077e..866dc33cf4be 100755
> --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -13,7 +13,20 @@ fi
>  # config is already in meson.cross.
>  unset CC CXX CPP LD AR NM STRIP
>=20
> +for arg in "${@}"; do
> +    case ${arg} in
> +    -*) continue ;;
> +    *) SUBCMD=3D${arg}; break ;;
> +    esac
> +done

Change all "${...}" to "$..." above.

> +
> +if [ "x${SUBCMD}" =3D=3D "xsetup" ] || [ -d ${SUBCMD} ]; then

=3D=3D is a bashism, use =3D instead. Also, you know that $SUBCMD will neve=
r=20
have a - as its first character (due to the case statement above) so it=20
is safe to simplify the above to:

if [ "$SUBCMD" =3D setup ] || [ -d "$SUBCMD" ]; then

> +    MESON_SUB_OPTS=3D" \
> +        --cross-file=3D"${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGE=
T_PREFIX}meson.cross" \
> +        --native-file=3D"${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.=
native" \

Change "${OECORE_NATIVE_SYSROOT}" to "$OECORE_NATIVE_SYSROOT".=20
And while at it, change it in the export line earlier in the file=20
as well.

> +        "
> +fi
> +
>  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
> -     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PRE=
FIX}meson.cross" \
> -     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.nativ=
e" \
> -     "$@"
> +    "$@" \
> +    ${MESON_SUB_OPTS}

Change "${MESON_SUB_OPTS}" to "$MESON_SUB_OPTS".

>=20
> base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
> --
> 2.37.1.223.g6a475b71f8c4

//Peter


