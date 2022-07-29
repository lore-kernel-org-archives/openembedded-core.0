Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB75C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:55:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1425.1659124510390337632
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=emHg7sPM;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1659124510;
  x=1690660510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uBUeYBaYWBOAEzHXW+wHbg7xTXek+Wbni8l3OeT6m1s=;
  b=emHg7sPMI4lWa/VpH6C4XEI6x+LokZhD+3g4I7vdYF282xoPRD9jqcdV
   V0DiGnOdz9eq090o4FsF2IdBaqNZYQD/EN8M2tJ3Poco8Pb3+N8DQGP13
   bAQB76Tr3tfMPcRr7xCmaXgNjJlmLy6aO0YsEPwTmJoCxdM3TeXPa3/xp
   MlEN6prxOZ/rSgxgzxsDjaF4WQclVuEnjTmB6moPStb+TvqamXdRRIFrM
   u7Z+5dK5iZ1qKhfqsZvVxNPxIA/vvF7GBy+3z5Y5VlYebYyxGAl0O1rJU
   lOuPyVA4LYeaAiIob0qngvPpOve7odvPbHByYluOBZBYk2l02hcAxPf6m
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
Thread-Topic: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
 where configurations come from
Thread-Index: AQHYo1UKfJ7Ym5nsbk6mb2lrYFGOz62VwDsQ
Date: Fri, 29 Jul 2022 19:55:08 +0000
Message-ID: <57a6142f5c2f444288e16632839dc647@axis.com>
References: <20220729141049.835733-1-alex@linutronix.de>
In-Reply-To: <20220729141049.835733-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 19:55:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168674

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 29 juli 2022 16:11
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 1/6] scripts/oe-setup-builddir: make it known
> where configurations come from
>=20
> "with some default values" isn't clear; if the user wants to change or
> inspect the default values and their history, we should help them find
> where they are. This becomes especially important when using template
> configs other than poky's.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 54048e62ec..b4fec4d120 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -74,9 +74,9 @@ fi
>  if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
>      cat <<EOM
>  You had no conf/local.conf file. This configuration file has therefore b=
een
> -created for you with some default values. You may wish to edit it to, fo=
r
> -example, select a different MACHINE (target hardware). See conf/local.co=
nf
> -for more information as common configuration options are commented.
> +created for you from $OECORELOCALCONF
> +You may wish to edit it to, for example, select a different MACHINE (tar=
get hardware).
> +See conf/local.conf for more information as common configuration options=
 are commented.

Please continue to limit the text to within 80 characters (as it was):

You may wish to edit it to, for example, select a different MACHINE (target
hardware). See conf/local.conf for more information as common configuration
options are commented.

or:

You may wish to edit it to, e.g., select a different MACHINE (target hardwa=
re).
See conf/local.conf for more information as common configuration options ar=
e
commented.

>=20
>  EOM
>      cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
> @@ -89,8 +89,9 @@ fi
>  if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
>      cat <<EOM
>  You had no conf/bblayers.conf file. This configuration file has therefor=
e been
> -created for you with some default values. To add additional metadata lay=
ers
> -into your configuration please add entries to conf/bblayers.conf.
> +created for you from $OECORELAYERCONF
> +To add additional metadata layers into your configuration please add ent=
ries
> +to conf/bblayers.conf.
>=20
>  EOM
>=20
> --
> 2.30.2

//Peter

