Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.10244.1614941625926213750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 02:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Ssby8I9g;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614941626;
  x=1646477626;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k9h/ZNbK1dWwlOpoAKM68mLU0XIveFVKAYGV4MibVzU=;
  b=Ssby8I9g6mQL9XJJrhOfqDDgUqxw+DyFRYvbfMdZSA0J4r2uwfeCns6a
   e8LtYFqQNvUlgkYMVRG8AKBB4eX2VpmvOJE4mts4HlQQLlwptgz1zsu2t
   pHzxvE+nXV7u8ob4U3bibS5skE2meTJoSwFleHNph3pobVh7YgGrcVMSV
   bY0W2P2yLS7BQb7Cq8OEfZVpigZMaKdHtxwEBEVBF6CO5Eoe1m2NyqmaN
   2BC67uDIykE98An88VkU7CN9Wh/+y0woptxe+6XBR86wwGhwLFPIye5fw
   ZaEWdXtytRgCiNQRRTP+IFwnmB4gX0U+nSPvuQH6APjUxoAj7Et4GTXv0
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Martin Jansa <Martin.Jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "anibal.limon@linaro.org" <anibal.limon@linaro.org>, "geoffhp@gmail.com"
	<geoffhp@gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Topic: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
Thread-Index: AQHXD5xPurcQ4I2XYE+3ZHRfllSLwap1OySg
Date: Fri, 5 Mar 2021 10:53:44 +0000
Message-ID: <43af2c15ab8349ffac3d7e56de896e52@XBOX03.axis.com>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210302193229.175044-1-Martin.Jansa@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Martin Jansa
> Sent: den 2 mars 2021 20:32
> To: openembedded-core@lists.openembedded.org
> Cc: anibal.limon@linaro.org; geoffhp@gmail.com; Martin Jansa
> <Martin.Jansa@gmail.com>
> Subject: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
>=20
> * some build environments have relative paths in THISDIR, e.g. from OEROO=
T set in:
>   https://github.com/96boards/oe-rpb-manifest/blob/1e3345c26c56f77f3a15a3=
978f412a25955d2606/conf/bblayers.conf#L4
>   and then the paths in filename normalized in:
>   filename =3D os.path.normpath(os.path.join(path, meson.cross.d, element=
))
>   don't match.
>=20
> * COREBASE used here before didn't have this issue because the value is a=
lready
>   normalized when set in:
>   meta/conf/layer.conf:COREBASE =3D '${@os.path.normpath("${LAYERDIR}/../=
")}'

That is not the only problem with the change to use ${THISDIR}. We get a mi=
llion=20
errors because we have bbappend files for glib-2.0. This is because bitbake=
 will=20
now give an error for any potential cross-files from those layers, regardle=
ss if=20
they exist or not (they don't).=20

I will send a patch that I believe solves this in a way that also avoids th=
e=20
need for the bb.error().

//Peter

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes=
-
> core/glib-2.0/glib-2.0_2.66.7.bb
> index 882a89da7a..a2fa5345b4 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
> @@ -31,7 +31,7 @@ def find_meson_cross_files(d):
>      if bb.data.inherits_class('native', d):
>          return ""
>=20
> -    thisdir =3D d.getVar("THISDIR")
> +    thisdir =3D os.path.normpath(d.getVar("THISDIR"))
>      import collections
>      sitedata =3D siteinfo_data(d)
>      # filename -> found
> --
> 2.30.0

