Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9191EC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 03:21:55 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.59308.1643772114328427972
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 19:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=cA9Bbd2J;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643772114;
  x=1675308114;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=h3S3+a8UtQ+WNBTz32N/aV4xLDnF9rzcn6KXU3Iyafw=;
  b=cA9Bbd2JcTX+iu9y7BRWFxiBsJ7mHYpgR8LtW2XzR+rATu4TXGS03FRQ
   hyKacWsFxPHxl2647IUABEfLA5sV1/+GIa8Ap4sVEtXN7DkCSbInDm2Sj
   nF6b5wbRWMgO7y3C1CTfxFGkNmDxfIjI6nYTeb5OyzmKPvTc+yw8ek4u/
   SeBmS2sH8IwFhHSHf+5k7qasjNe7d/1cVSYc7T77Q9VjakyuEiE8YoFfi
   o9IQIDLqvljSBXydySd+j5kaTGB46nHrQ8oxAFksRU2pNLy6EhcwOxq/+
   6n7ugk/V9MlJRkHQfvvNs89AQm4zEXsT78gVif5K8SPbcDvk3z3X8OhNv
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Saul Wold <Saul.Wold@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "JPEWhacker@gmail.com"
	<JPEWhacker@gmail.com>
Subject: RE: [OE-core] [PATCH] create-spdx: Get SPDX-License-Identifier from
 source
Thread-Topic: [OE-core] [PATCH] create-spdx: Get SPDX-License-Identifier from
 source
Thread-Index: AQHYF8gm4Gy2vLoAz0aBsqX7auIT/6x/iEBw
Date: Wed, 2 Feb 2022 03:21:51 +0000
Message-ID: <f7190e1f3a454459b0d5ffc2202f9626@axis.com>
References: <20220202000148.1462-1-saul.wold@windriver.com>
In-Reply-To: <20220202000148.1462-1-saul.wold@windriver.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 03:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161176

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Saul Wold
> Sent: den 2 februari 2022 01:02
> To: openembedded-core@lists.openembedded.org; JPEWhacker@gmail.com
> Cc: Saul Wold <saul.wold@windriver.com>
> Subject: [OE-core] [PATCH] create-spdx: Get SPDX-License-Identifier from =
source
>=20
> This patch will read the begining of source files and try to find
> the SPDX-License-Identifier to populate the licenseInfoInFiles
> field for each source file. This does not populate licenseConculed

I assume that should be "licenseConcluded".

> at this time, nor rolls it up to package level.
>=20
> We read as binary to since some source code seem to have some

to -> too

> binary characters, the license is then converted to ascii strings.
>=20
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
> Merge after Joshua's patch (spdx: Add set helper for list properties)
> merges
>=20
>  meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.=
bbclass
> index 8b4203fdb5d..588489cc2b0 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -37,6 +37,24 @@ SPDX_SUPPLIER[doc] =3D "The SPDX PackageSupplier field=
 for SPDX packages created f
>=20
>  do_image_complete[depends] =3D "virtual/kernel:do_create_spdx"
>=20
> +def extract_licenses(filename):
> +    import re
> +    import oe.spdx

You do not use oe.spdx in this function.

> +
> +    lic_regex =3D re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]=
+)[ |\n|\r\n]*?')

I assume you meant:

    lic_regex =3D re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)(=
?: |\n|\r\n)*?')

Not that it really matters though, as it will yield the same result as:

    lic_regex =3D re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)'=
)

However, neither of the expressions above will correctly match all the=20
SPDX-License-Identifier examples at https://spdx.dev/ids/#how.

Use this instead:

    lic_regex =3D re.compile(b'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]=
+?)(?:\s+\W*)?$', re.MULTILINE)

> +
> +    try:
> +        with open(filename, 'rb') as f:
> +            size =3D min(15000, os.stat(filename).st_size)
> +            txt =3D f.read(size)
> +            licenses =3D re.findall(lic_regex, txt)
> +            if licenses:
> +                ascii_licenses =3D [lic.decode('ascii') for lic in licen=
ses]
> +                return ascii_licenses
> +    except Exception as e:
> +        bb.warn(f"Exception reading {filename}: {e}")
> +    return None
> +
>  def get_doc_namespace(d, doc):
>      import uuid
>      namespace_uuid =3D uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUI=
D_NAMESPACE"))
> @@ -232,6 +250,11 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv
>                          checksumValue=3Dbb.utils.sha256_file(filepath),
>                      ))
>=20
> +                if "SOURCE" in spdx_file.fileTypes:
> +                    extracted_lics =3D extract_licenses(filepath)
> +                    if extracted_lics:
> +                        spdx_file.licenseInfoInFiles =3D extracted_lics
> +
>                  doc.files.append(spdx_file)
>                  doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
>                  spdx_pkg.hasFiles.append(spdx_file.SPDXID)
> --
> 2.31.1

//Peter


