Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E67A5C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:26:34 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.5462.1657200384818917917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=P0lxzctA;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1657200385;
  x=1688736385;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bqH1GHJEod46+RfzJxIfK3FAXjMYbjL4Ic/jBTQWfsU=;
  b=P0lxzctAT5RLDH/FWSxmh24aPl/Knpxti59gK2rZKFo7lgvrE70ssNX3
   9YXU1wAaYveO0gezu3XzFo0YMwjoS2hWCZWGu/FtRCh4OP6O0/C/NeV4P
   0Ko35bLbFnGzELKmzuy6EoDBjUIClGcxsvy9D6GReduTRdXlaUq641+xR
   hnQFrI0woHaleRQgGpRq84nB7+SFFOqgp2/JiDEvUDWhfvGS085jCzbmv
   8ki/HnCxy0yQyJNZWUEvqFxNOZ2qdX4RkCnNCL2tdktNtHhc6gZidMzD4
   AVpX70CqgtE++XHoWw6JgY4M/cKoXcvWljcMBFill5uAH0BZfSQCQL/2R
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Topic: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Index: AQHYkWWsuIJ0GxnyT0ak+urHDmj9Y61y5WKA
Date: Thu, 7 Jul 2022 13:26:21 +0000
Message-ID: <d04fa3ca7398489a99f8356b17f1174a@axis.com>
References: <20220706182329.3085564-1-alex@linutronix.de>
In-Reply-To: <20220706182329.3085564-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 13:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167778

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 6 juli 2022 20:23
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
> site.conf.sample out of template directories (if it exists)
>=20
> This allows:
>=20
> 1. Showing users where and how to define these settings correctly when se=
tting up
> a build from templates in poky (meta-poky/conf/site.conf.sample has comme=
nted
> out examples and was previously unused).
>=20
> 2. Distributing site-specific settings with template configurations in ot=
her layers,
> so there's no need to set them up separately.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  scripts/oe-setup-builddir | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 54048e62ec..5ad6dd4138 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -64,6 +64,7 @@ if [ -n "$TEMPLATECONF" ]; then
>      fi
>      OECORELAYERCONF=3D"$TEMPLATECONF/bblayers.conf.sample"
>      OECORELOCALCONF=3D"$TEMPLATECONF/local.conf.sample"
> +    OECORESITECONF=3D"$TEMPLATECONF/site.conf.sample"
>      OECORENOTESCONF=3D"$TEMPLATECONF/conf-notes.txt"
>  fi
>=20
> @@ -77,9 +78,11 @@ You had no conf/local.conf file. This configuration
> file has therefore been
>  created for you with some default values. You may wish to edit it to, fo=
r
>  example, select a different MACHINE (target hardware). See conf/local.co=
nf
>  for more information as common configuration options are commented.
> -
> +Also check conf/site.conf for site specific settings such as proxies and
> +download cache locations.
>  EOM
>      cp -f "$OECORELOCALCONF" "$BUILDDIR/conf/local.conf"
> +    cp -f "$OECORESITECONF" "$BUILDDIR/conf/site.conf" || true
>      SHOWYPDOC=3Dyes
>  fi
>=20
> @@ -107,6 +110,7 @@ fi
>  # Prevent disturbing a new GIT clone in same console
>  unset OECORELOCALCONF
>  unset OECORELAYERCONF
> +unset OECORESITECONF
>=20
>  # Ending the first-time run message. Show the YP Documentation banner.
>  if [ ! -z "$SHOWYPDOC" ]; then
> --
> 2.30.2

While I can't speak for others, this change will break our build environmen=
t.=20
We have a global site.conf file in an NFS directory that everyone use. It=20
contains all proxy settings and similar that are required to build inside t=
he=20
corporate environment. Copying a dummy site.conf file into the local build=
=20
directory will prevent the global file from being used.

//Peter


