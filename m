Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.4361.1630707301650766580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 15:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=lfDzB5OV;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630707301;
  x=1662243301;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8xwHpnefdmxMPwJ/WiNq1Bl8522pDRxzU4NcjPbLDfA=;
  b=lfDzB5OV/iAjxcxtziH+zOwnrLss499kNew6axOn2LSptMTpc5R6vVHn
   Cka66ghXiLJBmOdEVDy+DVOmYL+j7atVCtgaSE2FwhJ3uPifIoD6+xLQ0
   hPGPvTd6MkFUZtu+OFU44KZZRWs6ao24+MOaRqQZrlx55TNJjueFWf2DO
   6kLy538zzutF3bRi8LTQ/ZYAtedGaDGVaIWe92mLvXuITT7V9vXPIY4sb
   h4ABh1QE/VK6ESut2iYVPh3qcDB4XMRQYTgG3btqCa3JohIjrj85ehYG2
   QeKl1asGMgei0Jp6q0UIFTyDC83OQceMoA2q86TlMC8tqFZYY6AHBeDQG
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Ross Burton <ross@burtonini.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 4/4] create-spex: don't duplicate license texts in each package
Thread-Topic: [OE-core] [PATCH v2 4/4] create-spex: don't duplicate license
 texts in each package
Thread-Index: AQHXoNzvL+gtZHlszUSN9sQov7atg6uS4FbQ
Date: Fri, 3 Sep 2021 22:14:57 +0000
Message-ID: <a145b83d834c4caca4bc23a631450eda@axis.com>
References: <20210903160033.3141022-1-ross.burton@arm.com>
 <20210903160033.3141022-4-ross.burton@arm.com>
In-Reply-To: <20210903160033.3141022-4-ross.burton@arm.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ross Burton
> Sent: den 3 september 2021 18:01
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2 4/4] create-spex: don't duplicate license

Change "create-spex" to "create-spdx".

//Peter

> texts in each package
>=20
> Instead of putting the full license text for non-SPDX licenses into the
> recipe and every package, use links to the recipe from the packages if
> possible.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/create-spdx.bbclass | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-
> spdx.bbclass
> index cbb9239991c..1e0b3605587 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -50,7 +50,7 @@ python() {
>          d.setVar("SPDX_LICENSE_DATA", data)
>  }
>=20
> -def convert_license_to_spdx(lic, document, d):
> +def convert_license_to_spdx(lic, document, d, existing=3D{}):
>      from pathlib import Path
>      import oe.spdx
>=20
> @@ -109,8 +109,11 @@ def convert_license_to_spdx(lic, document, d):
>          if spdx_license in license_data["licenses"]:
>              return spdx_license
>=20
> -        spdx_license =3D "LicenseRef-" + l
> -        add_extracted_license(spdx_license, l)
> +        try:
> +            spdx_license =3D existing[l]
> +        except KeyError:
> +            spdx_license =3D "LicenseRef-" + l
> +            add_extracted_license(spdx_license, l)
>=20
>          return spdx_license
>=20
> @@ -462,7 +465,14 @@ python do_create_spdx() {
>      doc_sha1 =3D oe.sbom.write_doc(d, doc, "recipes")
>      dep_recipes.append(oe.sbom.DepRecipe(doc, doc_sha1, recipe))
>=20
> +    recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> +    recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" + recipe.nam=
e
> +    recipe_ref.spdxDocument =3D doc.documentNamespace
> +    recipe_ref.checksum.algorithm =3D "SHA1"
> +    recipe_ref.checksum.checksumValue =3D doc_sha1
> +
>      sources =3D collect_dep_sources(d, dep_recipes)
> +    found_licenses =3D {license.name:recipe_ref.externalDocumentId + ":"=
 +
> license.licenseId for license in doc.hasExtractedLicensingInfos}
>=20
>      if not is_native:
>          bb.build.exec_func("read_subpackage_metadata", d)
> @@ -482,13 +492,6 @@ python do_create_spdx() {
>              package_doc.creationInfo.creators.append("Tool: OpenEmbedded
> Core create-spdx.bbclass")
>              package_doc.creationInfo.creators.append("Organization:
> OpenEmbedded ()")
>              package_doc.creationInfo.creators.append("Person: N/A ()")
> -
> -            recipe_ref =3D oe.spdx.SPDXExternalDocumentRef()
> -            recipe_ref.externalDocumentId =3D "DocumentRef-recipe-" +
> recipe.name
> -            recipe_ref.spdxDocument =3D doc.documentNamespace
> -            recipe_ref.checksum.algorithm =3D "SHA1"
> -            recipe_ref.checksum.checksumValue =3D doc_sha1
> -
>              package_doc.externalDocumentRefs.append(recipe_ref)
>=20
>              package_license =3D d.getVar("LICENSE:%s" % package) or
> d.getVar("LICENSE")
> @@ -498,7 +501,7 @@ python do_create_spdx() {
>              spdx_package.SPDXID =3D oe.sbom.get_package_spdxid(pkg_name)
>              spdx_package.name =3D pkg_name
>              spdx_package.versionInfo =3D d.getVar("PV")
> -            spdx_package.licenseDeclared =3D
> convert_license_to_spdx(package_license, package_doc, d)
> +            spdx_package.licenseDeclared =3D
> convert_license_to_spdx(package_license, package_doc, d, found_licenses)
>=20
>              package_doc.packages.append(spdx_package)
>=20
> --
> 2.25.1

