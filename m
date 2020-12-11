Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.13424.1607718855200935452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 12:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dNPQHrR9;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1607718855;
  x=1639254855;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ifmhlvXUR0XhLdvy1TnNqqZcD5F1cVyRUs/ynSZg/38=;
  b=dNPQHrR9uz/aAcuFl4ofgRoYsRL04MV5YNorARWceAs5hXX2bMF1FsJR
   b27DHrQtza3ELcShPviwb4+Ca6r1FdNjKJz2UQiVcDlDhmIC73WRDN5jD
   yDM5TuPqBByuxYNs5wn5e2o0l3M3sRJlZMlDBZjgbH+Wzi8YK7zFPRS16
   QDBJp/JLpjfHdm7p+xe4R6Mh1+kuomv/hANOwI2FJ4npIBUy9xQJUPsJa
   1ZEG7vPLH9Dy5HwSygZu+k6vDxsVTfQPI2BONqCbkPEtX1WEsAPBpXd8c
   igVVPJD5HIpYw7kqXskdW5Qde96oKYWMDRv3MT9pJnso6X91tKUv6H38S
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak dependencies, if enabled
Thread-Topic: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak
 dependencies, if enabled
Thread-Index: AQHWzvOJHD0NNHyi/0icOVMbXsz3danyWwJw
Date: Fri, 11 Dec 2020 20:34:12 +0000
Message-ID: <3de202170ea048ff8ab2bdd4d85b1163@XBOX03.axis.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201210125312.3302065-5-luca.boccassi@gmail.com>
In-Reply-To: <20201210125312.3302065-5-luca.boccassi@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Luca Bocassi
> Sent: den 10 december 2020 13:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 5/5] systemd: add RRECOMMENDS for weak
> dependencies, if enabled
>=20
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> Some libraries are now dlopen'ed and skipped at runtime if
> not available. Add them to the RRECOMMENDS list, to allow
> users to exclude them for smaller images even if generally
> enabled at build time.
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/systemd/systemd_247.1.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-co=
re/systemd/systemd_247.1.bb
> index f20e86d94b..951bffa23f 100644
> --- a/meta/recipes-core/systemd/systemd_247.1.bb
> +++ b/meta/recipes-core/systemd/systemd_247.1.bb
> @@ -603,6 +603,13 @@ RRECOMMENDS_${PN} +=3D "systemd-extra-utils \
>                        systemd-conf \
>  "
>=20
> +# Weak dlopen-style dependencies: if explicitly requested via PACKAGECON=
FIG, recommend them
> +RRECOMMENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'qrencode'=
, 'qrencode', '', d)} \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn', 'l=
ibidn', '', d)} \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'libidn2', '=
libidn2', '', d)} \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'cryptsetup'=
, 'cryptsetup', '', d)} \
> +"

Please write this as:

RRECOMMENDS_${PN} +=3D "${@bb.utils.filter('PACKAGECONFIG', 'cryptsetup lib=
idn libidn2 qrencode', d)}"

> +
>  INSANE_SKIP_${PN} +=3D "dev-so libdir"
>  INSANE_SKIP_${PN}-dbg +=3D "libdir"
>  INSANE_SKIP_${PN}-doc +=3D " libdir"
> --
> 2.29.2

