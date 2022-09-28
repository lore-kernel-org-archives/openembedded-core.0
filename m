Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03F3C32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 23:16:21 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.4451.1664406976301030270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 16:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UhevbTpW;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664406977;
  x=1695942977;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vqrg2YX5+N/9tGbX6UVl8Cz+RXlRXmMOcYk//njaiIU=;
  b=UhevbTpWJzh3XWk2gbnBFpDvpZowjDeSMeo4N6OU9A7Ft54m3ch4D2rr
   s/CLUuad0NfexKqOxiy7GeF7ZgWZOuePQAXK0KV+BWdX5CWkS06LSzf7d
   0JU2jGyn2Z8moJOyj5MKCTNXLk7sxpKgiEVIfcfiUjWPzv8/u1qWy5DzW
   /sSzOEWo+uVdvcgaNboGWb/UzWi/m6FK+KDLercvL0IM0WympPzxp6AMs
   PGgNG3wnQ/WvZEFEuNYS4wQX1qpEGycAuZ6BkCIxMuhLtQPIvfnPTQSEk
   VFbAKK07vCdV+qtfZzeVWFe8mdYHz0Azx/Y5ra1jahjHyWUm2IG5BeIjg
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] scripts/oe-setup-builddir: do not read
 TEMPLATECONF from templateconf.cfg
Thread-Topic: [OE-core] [PATCH] scripts/oe-setup-builddir: do not read
 TEMPLATECONF from templateconf.cfg
Thread-Index: AQHY03/kXTWT+Kru7UyBImjSX18IMK31eHTQ
Date: Wed, 28 Sep 2022 23:16:13 +0000
Message-ID: <6cadedc725414789a49899ffe264ebfa@axis.com>
References: <20220928211832.576609-1-alex@linutronix.de>
In-Reply-To: <20220928211832.576609-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 23:16:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171159

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 28 september 2022 23:19
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] scripts/oe-setup-builddir: do not read TEMPLAT=
ECONF from templateconf.cfg
>=20
> Also, write to it only if it does not already exist.
>=20
> As discussed here[1], reading from templateconf.cfg serves no purpose:
> it exists only if the build directory has already been initialized, and s=
o
> the scripts will not change anything in the build directory anyway.
>=20
> My adjustment is to keep the file however; it is useful as a pointer
> to the original template, which can be utilized by config management
> tools in the future.
>=20
> [1] https://lists.openembedded.org/g/openembedded-architecture/topic/temp=
late_handling_in_oe_core/93968540
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index e3c8c6d437..3a91bbf5b1 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -34,16 +34,6 @@ chmod -st "$BUILDDIR/conf" 2>/dev/null || echo
> "WARNING: unable to chmod $BUILDD
>=20
>  cd "$BUILDDIR" || die "Failed to change directory to $BUILDDIR!"
>=20
> -if [ -z "$TEMPLATECONF" ] && [ -f "$BUILDDIR/conf/templateconf.cfg" ]; t=
hen
> -    TEMPLATECONF=3D$(cat "$BUILDDIR/conf/templateconf.cfg")
> -    # The following two are no longer valid; unsetting them will automat=
ically get them replaced
> -    # with correct ones.
> -    if [ "$TEMPLATECONF" =3D meta/conf ] || [ "$TEMPLATECONF" =3D meta-p=
oky/conf ]; then
> -        unset TEMPLATECONF
> -        rm "$BUILDDIR/conf/templateconf.cfg"
> -    fi
> -fi
> -
>  . "$OEROOT/.templateconf"
>=20
>  # Keep the original TEMPLATECONF before possibly prefixing it with
> $OEROOT below.
> @@ -132,4 +122,6 @@ fi
>  [ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
>  unset OECORENOTESCONF
>=20
> -echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
> +if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
> +  echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"

The rest of the file uses four spaces for indentation.
RP: I saw you have this in master-next already so I guess it's easiest=20
for you to fix it there.

> +fi
> --
> 2.30.2

//Peter


