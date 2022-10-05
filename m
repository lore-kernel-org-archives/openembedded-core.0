Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D806EC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 15:09:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.24885.1664982556697532296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 08:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IqhWR5aU;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664982558;
  x=1696518558;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PrXwKaDVaDM7WN/bjuCTLP1qTEh18FueuESJNryFe1c=;
  b=IqhWR5aUJXm/ANO0AYq0AE7urFWAe/Fz0z6qNbNmEjFKxu5/bL/MIPqZ
   FMNnDsJMG3jBqyVnELpchtPF59RlkB2ZD5TDsg9zMjRHPyDU577uB0jNT
   2bxn4KeiAYRWIqTRye7J46MlbmCzI/bal0OymfxG/J4C5L3ZgWXO6nVCx
   /EHqLwb9mR4hPVYNITXHmPHLi6s7RosanmHfSX9UQQ0hpvJDfGu+lxKKi
   4/rGn9odvtqukr4CySttg420miRvn8EiVT0KIbU7s3ScW/Wzk1Cgt9xyV
   +9NIC7N5Mdhfj/5fsp8YXkAc2bGnfXeaVFyaVhIlE4WnsEZb18xn3mNkr
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ming Liu <liu.ming50@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH V2] bluez5: change configuration directory mode
Thread-Topic: [OE-core] [PATCH V2] bluez5: change configuration directory mode
Thread-Index: AQHY2MKdiQDHktLo1EuSh170tJ6j+q3/5tFQ
Date: Wed, 5 Oct 2022 15:09:14 +0000
Message-ID: <7825e5af50d04c1c92ebdfb813ba32dd@axis.com>
References: <20221005135921.4167614-1-liu.ming50@gmail.com>
In-Reply-To: <20221005135921.4167614-1-liu.ming50@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 15:09:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171463

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Ming Liu
> Sent: den 5 oktober 2022 15:59
> To: openembedded-core@lists.openembedded.org
> Cc: Ming Liu <liu.ming50@gmail.com>
> Subject: [OE-core] [PATCH V2] bluez5: change configuration directory mode
>=20
> From: Ming Liu <liu.ming50@gmail.com>
>=20
> Change configuration directory mode from 0755 to 0555, this fixes a
> following warning when bluetoothd starts:
> | ConfigurationDirectory 'bluetooth' already exists but the mode is diffe=
rent.
> | (File system: 755 ConfigurationDirectoryMode: 555)
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 79d4645ca8..48b8bcbe75 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -82,7 +82,7 @@ do_install:append() {
>  	install -d ${D}${INIT_D_DIR}
>  	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
>=20
> -	install -d ${D}${sysconfdir}/bluetooth/
> +	install -m 0755 -d ${D}${sysconfdir}/bluetooth/

The default mode used by `install` if not specified is 0755.=20
The above change should not make any difference...

>  	if [ -f ${S}/profiles/network/network.conf ]; then
>  		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/=
bluetooth/
>  	fi
> --
> 2.25.1

//Peter


