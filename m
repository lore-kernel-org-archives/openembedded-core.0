Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A268EECAAD2
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 00:12:36 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.860.1662077555405091081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 17:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=n04XtWG3;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662077555;
  x=1693613555;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=msbP+LKfX+xIUAV2lsyDDyGYnEQCO/Eqww7vDl7TJn4=;
  b=n04XtWG3RoweyS/hI1KfBjG4iBJZ4N0XvxpGu8wBwsVCHe8p3MnDfFES
   DDH9Jo4LCaTsk+T+0Tz6d/Xbx5/ZnnBWFNPDgx2E1apSZOUzQGlRzrNlh
   Gm7f18/gXAhHAQmGzUuaij1ozuq2d+tN1ySfPmZ3dmVnULdywa/Lu4BIg
   pI8zlS+7wabtaN8+Ij5l65RGoOgGUAnpYolA8IkEDCu7PZZGsxu3jtHEG
   /i833oDh6SvsEAfuqLxUkt+cHKItcP6KJ60Cn+pcC422yse0A0aIpSABt
   ub7crlFRSlQ/P9crtRPxbyJFE3GJ+5Q14q858DLrfL9gg+nWHv0/ueE4K
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
Thread-Topic: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
Thread-Index: AQHYvg5w+gc06PVyMEyd9jx0rCMZKa3LPiMQ
Date: Fri, 2 Sep 2022 00:12:32 +0000
Message-ID: <d9ec6fa663d94bcc9229066100a140fc@axis.com>
References: <20220901142328.268769-1-alex@linutronix.de>
In-Reply-To: <20220901142328.268769-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 00:12:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170232

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 1 september 2022 16:23
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate build/conf/=
templateconf.cfg to new template locations
>=20
> This is done only for default oe-core/poky templates; for anything
> else the locations themselves need to be migrated first, and there
> is no way to tell where they would be.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index bf832ee0ca..32bc6580eb 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -40,6 +40,12 @@ cd "$BUILDDIR"
>=20
>  if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
>      TEMPLATECONF=3D$(cat "$BUILDDIR/conf/templateconf.cfg")
> +    # The following two are no longer valid; unsetting them will automat=
ically get them replaced
> +    # with correct ones.
> +    if [ $TEMPLATECONF =3D "meta/conf" -o $TEMPLATECONF =3D "meta-poky/c=
onf" ]; then
> +        unset TEMPLATECONF
> +        rm $BUILDDIR/conf/templateconf.cfg
> +    fi

Since the test you added previously now requires that the path contains=20
"/templates/", we might as well do this for any faulty configuration. I.e.:

    # The path in $TEMPLATECONF must contain "/templates/". If it doesn't,=
=20
    # unset it to have it replaced by a (hopefully) correct path.
    case $TEMPLATECONF in
        */templates/*)
            ;;
        *)
            unset TEMPLATECONF
            rm "$BUILDDIR/conf/templateconf.cfg"
            ;;
    esac

If .templateconf hasn't been updated to comply with the new rules, the=20
test later will point this out. But if it has been updated, the case=20
statement above will avoid the problem of an old, non-complying=20
configuration regardless of which layer it comes from.

>  fi
>=20
>  . "$OEROOT"/.templateconf
> --
> 2.30.2

//Peter


