Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8716.1613574256142757636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 07:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=opjNgHkl;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613574256;
  x=1645110256;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HsmzFgB4YY8kJpQqFfCFEJq1UXE7mVIUSgPrub0c4M8=;
  b=opjNgHklrt2Q9YuInGMYqCmMdD3DpTKMW/0AD3HdxprN91uIZRKb4MXr
   2ut/WmaWcxUzIlg4sfGSwrzUBavqJAZ//h7Kimr5sCzDzVICIJ+Zx5HC9
   yDeHheJuccmCBZgWnA1Yrgvjyd+ay2YJgVvMry7YURpSEkirIhPM6JS71
   W5xgfyyOrNxXSqGWk4Ifw2x1ja1lWqjHvZx2SiCmVoMLUpchlYvUAmB+M
   a8FjCEbAcqfKRN5zKiaREKKsjRZfDyD4OQhRemHS0abtc8iRl0n3Hd/xJ
   qAvepml4xwZTiwddsDfMG9CoSbIL1exgSVtbunlp6q2gcWz1h8DlqTnqM
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
Thread-Topic: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add
 functions to split and canonicalise license strings
Thread-Index: AQHXBOGVjF0TgksbjUKVaOctc9LLeqpccGbQ
Date: Wed, 17 Feb 2021 15:04:14 +0000
Message-ID: <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
 <20210217040033.21541-5-idadelm@gmail.com>
In-Reply-To: <20210217040033.21541-5-idadelm@gmail.com>
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
> core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> Sent: den 17 februari 2021 05:01
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add
> functions to split and canonicalise license strings
>=20
> These functions that will later be used in package.bbclass simply make th=
e
> source and recipe licenses in the same format so that they can easily be
> compared and the ouput warnings filtered accordingly.
> split_spdx_lic() splits the license strings and returns a set of the
> canonicalised licenses.
> rem_false_lics() does two things:
> - Converts '-or-later' licenses to their canonicalised form
> - Gets rid of "WITH Linux-syscall-note" from license string if specified
> in local.conf
>=20
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/license.bbclass | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index dc91118340..576464cb26 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -435,3 +435,30 @@ python do_populate_lic_setscene () {
>      sstate_setscene(d)
>  }
>  addtask do_populate_lic_setscene
> +
> +
> +def split_spdx_lic(d, licensestr):
> +    """
> +    Split the license strings and returns a set of the
> +    canonicalised licenses.
> +    """
> +    import oe.license
> +    split_lic =3D oe.license.list_licenses(licensestr)
> +    spdx_lic =3D set([canonical_license(d, l) for l in split_lic])
> +    return spdx_lic
> +
> +def rem_false_lics(d, pkglic):
> +    pkglicsperpkg =3D set([])
> +    for l in pkglic:
> +        if l.endswith('-or-later'):
> +            # Converts '-or-later' licenses to their canonicalised form
> +            lic_ =3D l.replace('-or-later', '+')

Given that licenses such as "GPL-2.0+" are deprecated by SPDX, shouldn't we=
=20
instead introduce the canonical "GPL-2.0-only" and "GPL-2.0-or-later"?
And then add mappings for, e.g., "GPL-2.0" to "GPL-2.0-only" and "GPL-2.0+"=
=20
to "GPL-2.0-or-later".

> +            pkglicsperpkg.add(lic_)
> +        elif l.endswith(' WITH Linux-syscall-note'):
> +        # Gets rid of "WITH Linux-syscall-note from license sring"
> +            if d.getVar("LICENSE_WITH_LINUX_SYS") =3D=3D "1":
> +                lic_ =3D l.replace(' WITH Linux-syscall-note', '')

Looking at https://spdx.org/licenses/exceptions-index.html, there is a long=
=20
list of predefined exceptions and "Linux-syscall-note" is just one of them.=
=20
We probably want a more generic solution for how to handle exceptions.

> +                pkglicsperpkg.add(lic_)
> +        else:
> +            pkglicsperpkg.add(l)
> +    return pkglicsperpkg
> \ No newline at end of file
> --
> 2.25.1

//Peter

