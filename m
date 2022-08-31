Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDBECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 10:24:30 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.23834.1661941456991612180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 03:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gkUpwMgt;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1661941457;
  x=1693477457;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DwmWd4b1kVK07hekM2LILfLWLtM1Yx9Ziw6Py5im9Ec=;
  b=gkUpwMgtVL0tF6HUbUAjJmTG18i3ljxYBodd5UE2qJN8i4RO/MqHZKmC
   1vXhHEmFdY6cEzx7GnlS+Drk+NZcrMsj73GRUra1ddnHWE28U6HY3XuAq
   8UNvBEdNY3UxLKfCg8plV6+QgUU9smI7MJcfAWjl3BMrdCAk4nS4FI0DH
   cUubpa+W0BGo1jrJY87bMuw56Aoi6XoqJiVtGe6kwfm8PCNdq/3N0a8OF
   YVg3s89lsJYRm/RNQVbebpDlYc5JSeyYb8vzxdj7bufeU5P9Mmt7T1s8f
   hezAIEHVCgwQsXRgcU/KdpQKBmAOJeinH+Muc0NA+UPvbwifcWLtegs3w
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH] perl: run builds from a pristine source tree
Thread-Topic: [OE-core] [PATCH] perl: run builds from a pristine source tree
Thread-Index: AQHYvRrCmtRFwEHvykuvDZJpu+DDQq3IzCDw
Date: Wed, 31 Aug 2022 10:24:14 +0000
Message-ID: <fda8f7dcbb044964be8ee272af4f4e3b@axis.com>
References: <20220831091906.3310501-1-alex@linutronix.de>
In-Reply-To: <20220831091906.3310501-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 10:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170097

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 31 augusti 2022 11:19
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH] perl: run builds from a pristine source tree
>=20
> Running builds from a previously used directory relies on correctness of
> 'make clean' or incremental 'make', and sadly perl (or perl-cross) does
> not have either.
>=20
> The particularly nasty problem, currently occurring, is that sometimes, w=
hen reusing
> a previous build, we arrive at a combination of timestamps in the tree,
> where make becomes very confused, gets lost in its own rules and enters a=
n infinite loop,
> never figuring out what needs to be rebuild in what order. Worse, there i=
s no reliable
> trigger for this that was found, and any attempts to 'isolate the issue' =
haven't produced one.
>=20
> Let's simply add a clean S/B separation for builds, and always run a buil=
d from a reproducible
> set of files.
>=20
> [YOCTO #14902]
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ctly-list-modules-when-cleaning-them.patch | 24 ----------------
>  ...file-do-not-clean-config.h-xconfig.h.patch | 28 -------------------
>  .../perl-cross/perlcross_1.4.bb               |  2 --
>  meta/recipes-devtools/perl/perl_5.36.0.bb     |  8 ++++--
>  4 files changed, 5 insertions(+), 57 deletions(-)
>  delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-Makefile-=
correctly-list-modules-when-cleaning-them.patch
>  delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-Makefile-=
do-not-clean-config.h-xconfig.h.patch

[cut]

> diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-dev=
tools/perl/perl_5.36.0.bb
> index ead7dace16..2dc558aaa5 100644
> --- a/meta/recipes-devtools/perl/perl_5.36.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
> @@ -28,7 +28,7 @@ SRC_URI:append:class-target =3D " \
>=20
>  SRC_URI[perl.sha256sum] =3D "e26085af8ac396f62add8a533c3a0ea8c8497d836f0=
689347ac5abd7b7a4e00a"
>=20
> -S =3D "${WORKDIR}/perl-${PV}"
> +B =3D "${WORKDIR}/perl-${PV}-build"

Any reason not to just set B =3D "${WORKDIR}/build" ?

>=20
>  inherit upstream-version-is-even update-alternatives
>=20
> @@ -48,7 +48,10 @@ export ENC2XS_NO_COMMENTS =3D "1"
>  CFLAGS +=3D "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"
>=20
>  do_configure:prepend() {
> -    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
> +    rm -rf ${B}
> +    cp -rfp ${S} ${B}
> +    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${B}
> +    cd ${B}
>  }
>=20
>  do_configure:class-target() {
> @@ -116,7 +119,6 @@ print(datetime.fromtimestamp($SOURCE_DATE_EPOCH, time=
zone.utc).strftime('%a %b %
>              ")"
>          echo "#define PERL_BUILD_DATE \"$PERL_BUILD_DATE\"" >> config.h
>      fi
> -    oe_runmake clean
>  }
>=20
>  do_compile() {
> --
> 2.30.2

//Peter


