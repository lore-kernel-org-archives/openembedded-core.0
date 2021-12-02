Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1935C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 21:32:51 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.3421.1638480763121327042
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 13:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=gwC0FQaR;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638480763;
  x=1670016763;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8HtXRMK957TgIOlgLXjz9biZxIuLKHi8Pq6NYDpepOk=;
  b=gwC0FQaRzlgwuf/aik7H3G3lSjXrtorT9rmBkXhchaT7eWIwetIWGkKN
   5YFLDWBZWnhgYhLUu3PGXpGglQJJ3+V1R/RrOs9s27Czok0CLMV9BtqwT
   VDGc62N6McW60ffTox1yWy6QOk9Svkk6yj4GTCG5LJI92zEoUuAcicLuI
   PHs7G9wemSTHJ+F4Ms0/YJfnsYZA4WhtvsnOFc2cOy1pdop4b25hU1ps5
   R2Sn+8SiIUtLaumUrRnLSEadXpZlEZK7DVVYjXnvurpSFN+rAfXw0jajZ
   4o5qJ7R8aME41DDayZG9yzOGd1DlWqUSdFtWSnzZJ4FdwP6HaSy8pjQqa
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] tune-cortexa72.inc: Add tune for nocrypto case
Thread-Topic: [OE-core] [PATCH] tune-cortexa72.inc: Add tune for nocrypto case
Thread-Index: AQHX57opuwNCd2ikFkC8saZealykbKwftwkQ
Date: Thu, 2 Dec 2021 21:32:39 +0000
Message-ID: <a346808b3be445a880c78236394174be@axis.com>
References: <20211202202056.698020-1-raj.khem@gmail.com>
In-Reply-To: <20211202202056.698020-1-raj.khem@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 21:32:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159104

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Khem Raj
> Sent: den 2 december 2021 21:21
> To: openembedded-core@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [OE-core] [PATCH] tune-cortexa72.inc: Add tune for nocrypto case
>=20
> RPI4 based on BCM2711 soc which does not enable AES extentions
> in hardware see [1] fixes [2]
>=20
> [1] https://forums.raspberrypi.com/viewtopic.php?t=3D207888&start=3D25#p1=
642862
> [2] https://github.com/agherzan/meta-raspberrypi/issues/964
>=20
> [YOCTO #14641]
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/me=
ta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index 2a510bd45bd..b2eb35f111b 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -6,8 +6,14 @@ TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', =
'cortexa72', ' -mcpu=3Dcorte
>  require conf/machine/include/arm/arch-armv8a.inc
>=20
>  # Little Endian base configs
> -AVAILTUNES +=3D "cortexa72"
> +AVAILTUNES +=3D "cortexa72 cortexa72-nocrypto"
>  ARMPKGARCH:tune-cortexa72             =3D "cortexa72"
>  TUNE_FEATURES:tune-cortexa72          =3D "${TUNE_FEATURES:tune-armv8a-c=
rc-crypto} cortexa72"
>  PACKAGE_EXTRA_ARCHS:tune-cortexa72    =3D "${PACKAGE_EXTRA_ARCHS:tune-ar=
mv8a-crc-crypto} cortexa72"
>  BASE_LIB:tune-cortexa72               =3D "lib64"
> +
> +# Some implementations do not enabled crypto ( e.g. BCM2837B0 in rpi4 )
> +ARMPKGARCH:tune-cortexa72-nocrypto    =3D "cortexa72"
> +TUNE_FEATURES:tune-cortexa72-nocrypto =3D "${TUNE_FEATURES:tune-armv8a-c=
rc} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-nocrypto =3D "${PACKAGE_EXTRA_ARCHS:t=
une-armv8a-crc} cortexa72"
> +BASE_LIB:tune-cortexa72-nocrypto      =3D "lib64"
> --
> 2.34.1

I do realize renaming cortexa72 to cortexa72-crypto would not be backwards=
=20
compatible, but is it really a good idea to introduce a name like this=20
that does not follow the naming other tunes use?

//Peter


