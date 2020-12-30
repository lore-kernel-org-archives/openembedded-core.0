Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.14374.1609371519991712205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 15:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mhSA8QlP;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1609371520;
  x=1640907520;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TJqw1G6ddn4h32i3Dk8NSgRdxbk7QkL/lAbbA/ZgaZE=;
  b=mhSA8QlPJttQrKjMW366jqfTnE6M8wocvd3LDGYEObqcMor9u2w+YZt7
   m9wLt3ryRBrcN4tb/2NnkQah8kXqriVKT6hlHWq1u9Moat4pF1/oAFp7i
   cHSSuBTTUwRuZ7EgP3U5/gaVfed1+vdmeH2vAxSkZ/1Ia6MT6UfCiJS1E
   3SXBTnreUaf1pMn5j1K0oediEc+WFUqtNbjNiTXrW+00yjTskbx+ZDw08
   jW2iWuLDuiNLtaWXjIA0UM9NpzzkbbrVxzQa5XnqsjIMDfIFvfh61jKC/
   zKuEMIFFwHJTTsoJDVpSQr1Phj8M5YL+H0SALbB2Qy7Tr168xJIHWK8MV
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Randy Li <ayaka@soulik.info>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] meson: don't turn sting into a list in nativesdk
Thread-Topic: [OE-core] [PATCH v2 1/2] meson: don't turn sting into a list in
 nativesdk
Thread-Index: AQHW3ZaZ0PomH8Etc0SN3aHqfmt4PKoQTMmg
Date: Wed, 30 Dec 2020 23:38:37 +0000
Message-ID: <a3c9fb86ae674b038915c02aa594abfe@XBOX03.axis.com>
References: <20201229035550.226617-1-ayaka@soulik.info>
 <20201229035550.226617-2-ayaka@soulik.info>
In-Reply-To: <20201229035550.226617-2-ayaka@soulik.info>
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
> core@lists.openembedded.org> On Behalf Of Randy Li
> Sent: den 29 december 2020 04:56
> To: openembedded-core@lists.openembedded.org
> Cc: Randy Li <ayaka@soulik.info>
> Subject: [OE-core] [PATCH v2 1/2] meson: don't turn sting into a list in
> nativesdk

Change "sting" to "string".

>=20
> In the current version of meson, some path variables only
> accept a string not a list.
>=20
> Signed-off-by: Randy Li <ayaka@soulik.info>
> ---
>  meta/recipes-devtools/meson/meson/meson-setup.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py
> b/meta/recipes-devtools/meson/meson/meson-setup.py
> index 808e2a062f..7acfe373fa 100755
> --- a/meta/recipes-devtools/meson/meson/meson-setup.py
> +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
> @@ -10,9 +10,13 @@ class Template(string.Template):
>  class Environ():
>      def __getitem__(self, name):
>          val =3D os.environ[name]
> -        val =3D ["'%s'" % x for x in val.split()]
> -        val =3D ', '.join(val)
> -        val =3D '[%s]' % val
> +        val =3D val.split()
> +        if len(val) > 1:
> +            val =3D ["'%s'" % x for x in val]
> +            val =3D ', '.join(val)
> +            val =3D '[%s]' % val
> +        else:
> +            if val: val =3D "'%s'" % val.pop()

Change to:

        elif val:
            val =3D "'%s'" % val.pop()

>          return val
>=20
>  try:
> --
> 2.29.2

//Peter

