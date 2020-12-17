Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.10937.1608222083244157187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 08:21:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=NUTtbqOS;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608222083;
  x=1639758083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sT5aP4tShA8FCwcAutq6AdJL599MU8gOXxha6Zp48a0=;
  b=NUTtbqOSNF+kBHeNhr1JeMPNO+lN+mi6itJLN2nlESOLCGKJdZry2s0k
   JQPb4YwcXrfD0LL9RcljvCYl3bFr3cWIjOvZhaaHWJ6M+6g4YKtU3GVWO
   Na8h/oZpWCL11bfNY4Nrg5upahoXSqDZzJOs3r18G7LNpube2eg/RvBvS
   YQEG4mE0oSzHsJqP4C81/QrO102VJ67/UZVBo83oPAKDMbYfDC/tsxOjA
   jlgbdFaXvNZWxLpo2xjgW9x7bL8p0uirUJQ8eNHCPpFsxivSh3fE2irYV
   zrV5l3N568lmeuvMudzhwM6+tDJO+5fRSKlojCnPH+W+V7LMcDU+UvLtw
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Kory Maincent <kory.maincent@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
Thread-Topic: [OE-core] [PATCH v2] ltp: fix rpc build error
Thread-Index: AQHW1H4Nn1xWXFMU0EmwWkfaBA2LA6n7ctHg
Date: Thu, 17 Dec 2020 16:21:20 +0000
Message-ID: <ce781b6c4aa644f3ba1f322396065bcb@XBOX03.axis.com>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
In-Reply-To: <20201217140756.30688-1-kory.maincent@bootlin.com>
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
> core@lists.openembedded.org> On Behalf Of Kory Maincent
> Sent: den 17 december 2020 15:08
> To: openembedded-core@lists.openembedded.org
> Cc: thomas.petazzoni@bootlin.com
> Subject: [OE-core] [PATCH v2] ltp: fix rpc build error
>=20
> Add support to tirpc tests build.
> Export incdir and libdir to have the right path.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>=20
> Change since v1:
>  - Use PACKAGECONFIG to enable rpc tests
>  - Improve ${libdir} and ${incdir} export
>=20
>=20
>  meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-
> extended/ltp/ltp_20200930.bb
> index 7acf15b360..9da5d90353 100644
> --- a/meta/recipes-extended/ltp/ltp_20200930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> @@ -42,14 +42,14 @@ inherit autotools-brokensep pkgconfig
>=20
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>=20
> +export libdir :=3D "${exec_prefix}/${baselib}"
> +export incdir :=3D "${exec_prefix}/include"

This should be a little bit better:

export libdir :=3D "${libdir}"
export incdir :=3D "${incdir}"

>  export prefix =3D "/opt/${PN}"
> -export exec_prefix =3D "/opt/${PN}"
>=20
>  PACKAGECONFIG[numa] =3D "--with-numa, --without-numa, numactl,"
> +PACKAGECONFIG[rpc] =3D ", --without-tirpc, virtual/librpc,"

I assume there is a --with-tirpc as well, so this should be:

PACKAGECONFIG[rpc] =3D "--with-tirpc, --without-tirpc, virtual/librpc,"

>  EXTRA_AUTORECONF +=3D "-I ${S}/testcases/realtime/m4"
>  EXTRA_OECONF =3D " --with-realtime-testsuite --with-open-posix-testsuite=
 "
> -# ltp network/rpc test cases ftbfs when libtirpc is found
> -EXTRA_OECONF +=3D " --without-tirpc "
>=20
>  do_install(){
>      install -d ${D}${prefix}/
> --
> 2.17.1

//Peter

