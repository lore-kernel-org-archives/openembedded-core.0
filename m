Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76918C433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 11:47:10 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.15770.1658663224601543974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 04:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Np9uujo7;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1658663225;
  x=1690199225;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LTlIGnxxQdX72eTSrVZx3ZXrNwC00Zf7u+v9Yr5gmL8=;
  b=Np9uujo7J/BBMhqeXnzKa0L0j6yDzBoa+Jmfc6DVhztXXDr+E5/MpP6O
   tEhhtfl/VeIvphs2g4rRVs5iekLUF6Nhvl73hjyDsLZjzJ5NgK9iyVVxH
   x6AdC7q7EaZHqU+3zgtUI+R6JQNVBWixQATBRXukoFR8TXHc2PMSz/GFm
   yoM0gkwboiC+qLVQs+QCfPUNxoy2xxyodlG8z/F2e9h018z+4d8/NAfZC
   cEd31k+xRu1Viwfn8nSn/8qpahvXuyIG0dKtMXDPe3C4A+qUN66gBkDn0
   e3JI0q7t8/heBX3YTFuk5jOIzAxrW9qSObIQ3ZRGeLvDy5ZjvAOZShAzg
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] libgcc: Fix standalone target builds with
 usrmerge distro feature
Thread-Topic: [OE-core] [PATCH 1/3] libgcc: Fix standalone target builds with
 usrmerge distro feature
Thread-Index: AQHYnqQpTm3SgabHYk+gU2/3ZGbwpa2NZuNQ
Date: Sun, 24 Jul 2022 11:47:01 +0000
Message-ID: <f4ea3fac3a7e405ea15f39e33744f39a@axis.com>
References: <20220723145416.1374755-1-raj.khem@gmail.com>
In-Reply-To: <20220723145416.1374755-1-raj.khem@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 11:47:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168451

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Khem Raj
> Sent: den 23 juli 2022 16:54
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH 1/3] libgcc: Fix standalone target builds with =
usrmerge distro feature
>=20
> Ignore the rmdir cmd if using usrmerge distro feature since the
> intention is to delete /lib or /lib64 but not libdir under /usr and
> base_libdir =3D libdir when usrmerge is enabled in distro
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/libgcc-common.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-d=
evtools/gcc/libgcc-common.inc
> index 148c9f85a7c..9d4fd41f975 100644
> --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> @@ -44,10 +44,14 @@ do_install () {
>  }
>=20
>  do_install:append:libc-baremetal () {
> -	rmdir ${D}${base_libdir}
> +	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}=
; then

Since the goal is to avoid deleting ${libdir} in case it happens to match=20
${base_libdir}, I recommend to change the tests to instead be:

	if [ "${base_libdir}" !=3D "${libdir}" ]; then

> +		rmdir ${D}${base_libdir}
> +	fi
>  }
>  do_install:append:libc-newlib () {
> -	rmdir ${D}${base_libdir}
> +	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}=
; then
> +		rmdir ${D}${base_libdir}
> +	fi
>  }
>=20
>  # No rpm package is actually created but -dev depends on it, avoid dnf e=
rror
> --
> 2.37.1

//Peter

