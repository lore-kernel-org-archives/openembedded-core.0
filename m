Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DCAC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:24:03 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.125.1667489035878947776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 08:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hFJ7J5l4;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667489036;
  x=1699025036;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qQBOnghtyGIh+w6YmsLfKE37LLOvLUspAU/dAXl7Srk=;
  b=hFJ7J5l45CFM4CE96R/y/4v8M19xyZV38bxGIFskmIJ5KMpedxeoInZ9
   N+wGRBW3ILN9WjHIagHvYg5PhRMAE0iagF0qson24MJHzYzMQ5vIZ8jZY
   ydL3CDkApP4c1RJh2iOmvb5BOpTgBFE8n1YBJbrVP6T47u8WPA04OTVjb
   kbyJ4fsNmoqTjTWUvqI6JEjj1rpR0a41K8kBhLQiJcRlfEfvMimrpmIQk
   aM2k5d3QPbRw596qKTssbKRKu/yKgnH3wlZDgkhEa4sJ6ZaVa7f0lYJNv
   KDsnViphr5W5e6LQ5agCTpa7FmUTgEQrXWkE8VDD+kc6mVcX62A/9RiWv
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] gcc-shared-source: Fix source date epoch
 handling
Thread-Topic: [OE-core] [PATCH 1/2] gcc-shared-source: Fix source date epoch
 handling
Thread-Index: AQHY74GcQG/Fn4ks4k+cr+FbpaDKvq4tTY2w
Date: Thu, 3 Nov 2022 15:23:53 +0000
Message-ID: <22395ca2bbcb4a88a4b4295bfdf6ae2c@axis.com>
References: <20221103124123.842602-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20221103124123.842602-1-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172637

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 3 november 2022 13:41
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] gcc-shared-source: Fix source date epoch h=
andling
>=20
> The source date epoch for gcc isn't being transferred from the shared
> workdir to the current WORKDIR for the specific recipe. This results in
> the clamping code within sstate.bbclass using a value from 2011 which
> changes the timestamps of many files. Since this happens part way
> through the build, if pieces of gcc haven't built, or build/rebuild
> later, we see things rebuilding when they should not and for generated
> files, races are possible.
>=20
> Fix this by copying the SDE from the shared workdir into the recipe
> workdir.
>=20
> [YOCTO #14953]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-shared-source.inc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recip=
es-devtools/gcc/gcc-shared-source.inc
> index aac4b49313c..cdc27deffdb 100644
> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> @@ -9,3 +9,12 @@ SRC_URI =3D ""
>=20
>  do_configure[depends] +=3D "gcc-source-${PV}:do_preconfigure"
>  do_populate_lic[depends] +=3D "gcc-source-${PV}:do_unpack"
> +do_deploy_source_date_epoch[depends] +=3D "gcc-source-${PV}:do_deploy_so=
urce_date_epoch"
> +
> +# Copy the SDE from the shared workdir to the recipe workdir
> +do_deploy_source_date_epoch () {
> +	mkdir -p ${SDE_DEPLOYDIR}
> +	cp -p ${S}/../source-date-epoch/__source_date_epoch.txt ${SDE_DEPLOYDIR=
}/__source_date_epoch.txt
> +	mkdir -p `dirname ${SDE_FILE}`
> +	cp -p ${S}/../source-date-epoch/__source_date_epoch.txt ${SDE_FILE}

Even though I doubt the name of the epoch file is likely to change=20
any time soon, I think it is better to avoid hardcoding it here.
Thus I suggest the following instead:

	sde_file=3D${SDE_FILE}
	sde_file=3D${sde_file#${WORKDIR}/}
	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
	cp -p ${S}/../$sde_file ${SDE_FILE}

> +}
> --
> 2.34.1

//Peter

