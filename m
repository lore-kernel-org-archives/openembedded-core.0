Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.266.1615564774711884939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 07:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dZSCkrVW;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615564775;
  x=1647100775;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=DdaOmF/UChQxo2OItRXjGbDnxjKiWun3nXPoP+XUvts=;
  b=dZSCkrVWt6T7kItpCYA7MTfgJyDoCZ63jzoCgLXoa0kTapM6apwd1Dul
   GSK147dbLfNQQlgnCThASWQbFhLojvcmyBXI3dZybQ58uDTcnOK1ZK1em
   AkFtPisBmbfF6XLFEr2oakbQ96Cu3Wxgrx3esOGBh1NO7kCNQ8R8/vFHI
   AFDqIg9fM2XhiHCJ21vlk3PBAeC9LqB5MLEoYX93jZeJ0KSsg3Gtq3maf
   VI8OTqmG43pz1VmYcJuGXs36slc0HQguZDBBv7bOgqlUrr+wtGbEOeMru
   l+EL6nyJfWWuCiMtJfkwqsurLx/LJziQZR0FioxAZNgXI86/zvl9Aw+UJ
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky-contrib][PATCH 1/4] oe.license: Add functions to split and canonicalise license strings.
Thread-Topic: [OE-core] [poky-contrib][PATCH 1/4] oe.license: Add functions to
 split and canonicalise license strings.
Thread-Index: AQHXFTxlsuVDk2lsQU+0VTEsS5Ooj6qAgvIw
Date: Fri, 12 Mar 2021 15:59:32 +0000
Message-ID: <c1a2d05c715e4310b939dce81ccc243c@XBOX03.axis.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
In-Reply-To: <20210309233130.104839-1-idadelm@gmail.com>
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
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> Sent: den 10 mars 2021 00:31
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [poky-contrib][PATCH 1/4] oe.license: Add functions to=
 split and canonicalise license strings.
>=20
> These functions ensures recipe LICENSE strings are split into their
> individual licenses and then canonicalised to easily enable their matchin=
g
> with licenses of sources during the packaging process.
>=20
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/lib/oe/license.py | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index 665d32ecbb..9e9957be1d 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -236,3 +236,26 @@ def list_licenses(licensestr):
>      except SyntaxError as exc:
>          raise LicenseSyntaxError(licensestr, exc)
>      return visitor.licenses
> +
> +def canonical_license(license, d):
> +    """
> +    Return the canonical (SPDX) form of the license if available (so GPL=
v3
> +    becomes GPL-3.0), for the license named 'X+', return canonical form =
of
> +    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
> +    or the passed license if there is no canonical form.
> +    """
> +    lic =3D d.getVarFlag('SPDXLICENSEMAP', license) or ""
> +    if not lic and license.endswith('+'):

Do we really need this if statement now that there are entries for=20
all relevant licenses that use '+' in the SPDXLICENSEMAP? Isn't it=20
better to rely on the SPDXLICENSEMAP to handle any special cases=20
like this than to add code all over the place to support this=20
legacy way of marking licenses as "-or-later".

> +        lic =3D d.getVarFlag('SPDXLICENSEMAP', license.rstrip('+'))
> +        if lic:
> +            lic +=3D '+'
> +    return lic or license
> +
> +def split_spdx_lic(licensestr,d):
> +    """
> +    Split the license strings and returns a set of the
> +    canonicalised licenses.
> +    """
> +    split_lic =3D list_licenses(licensestr)
> +    spdx_lic =3D set([canonical_license(l, d) for l in split_lic])
> +    return spdx_lic
> \ No newline at end of file

Please add a newline on the last line.

> --
> 2.25.1

//Peter

