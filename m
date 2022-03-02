Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FD6C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 15:17:12 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.8345.1646234228667827880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 07:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=H0KraM0g;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1646234229;
  x=1677770229;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=YrjhK7Qc6xa0hf3Ea6sCY6H5KvLw9Y5QMTcJ3u7I/mE=;
  b=H0KraM0gbATlRho0deVcr7RzTuVrS6f3rfIF1P5GN7BXKCG6UeI9faHT
   a638MzCffeXNTvOBlz3W/0z+MlRTUrd97sg8KJzOgJer2tmNDtvOfVJCl
   CHfXDFOrD0670kWU3i6khsoC57ZPBCBietT/s5Y2CxKJDytZDSrsmv5iX
   Lnzyc4idAeaKtpIXsZfJjnkudD/CI3GHA+aEYWy4YuaECaIm7ZbyPCn81
   V0+/FThhUEy9mFwEr9ZhL6NgwTMFlAGDeqNdofbXT/EBpyD2C1scyeMFZ
   LX2jj9i0uWYL+VN+5Y4cUegD4v6T87Ujo+7zxpBlyLMEsXkoKQKFVBeBh
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/4] license/insane: Show warning for obsolete
 license usage
Thread-Topic: [OE-core] [PATCH 3/4] license/insane: Show warning for obsolete
 license usage
Thread-Index: AQHYLcYQqJg0XLM0dUytDxi9MlUsuqysNERw
Date: Wed, 2 Mar 2022 15:17:05 +0000
Message-ID: <fd6a428f453c4675ae5fa17bb71615b7@axis.com>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
 <20220301234214.247172-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220301234214.247172-3-richard.purdie@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 15:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162615

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 2 mars 2022 00:42
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/4] license/insane: Show warning for obsolete =
license usage
>=20
> We want to use SPDX identifiers in LICENSE variables. There is now a
> conversion script to make most of the translations. Add a list of
> strings which have been replaced so we can show warnings to users
> if they're still used anywhere.
>=20
> Add checks to the package as insane check. This is currently a warning
> by default but can be turned off or made an error as per the other standa=
rd
> checks.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass   |  6 ++++++
>  meta/classes/insane.bbclass | 31 ++++++++++++++++++++++---------
>  meta/lib/oe/license.py      | 10 ++++++++++
>  3 files changed, 38 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index bfc7087a189..b7869da3b38 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -597,6 +597,12 @@ python () {
>=20
>              exceptions =3D (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") =
or "").split()
>=20
> +            for lic_exception in exceptions:
> +                if ":" in lic_exception:
> +                    lic_exception.split(":")[0]
> +                if lic_exception in oe.license.obsolete_license_list():
> +                    bb.fatal("Invalid license %s used in INCOMPATIBLE_LI=
CENSE_EXCEPTIONS" % lic_exception)
> +
>              pkgs =3D d.getVar('PACKAGES').split()
>              skipped_pkgs =3D {}
>              unskipped_pkgs =3D []
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 29b9b3d466a..3c8d49f13bd 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -27,7 +27,7 @@ WARN_QA ?=3D " libdir xorg-driver-abi \
>              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
>              missing-update-alternatives native-last missing-ptest \
>              license-exists license-no-generic license-syntax license-for=
mat \
> -            license-incompatible license-file-missing \
> +            license-incompatible license-file-missing obsolete-license \
>              "
>  ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-files arch pkgconfig la =
\
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -909,14 +909,19 @@ def package_qa_check_unlisted_pkg_lics(package, d, =
messages):
>          return True
>=20
>      recipe_lics_set =3D oe.license.list_licenses(d.getVar('LICENSE'))
> -    unlisted =3D oe.license.list_licenses(pkg_lics) - recipe_lics_set
> -    if not unlisted:
> -        return True
> -
> -    oe.qa.add_message(messages, "unlisted-pkg-lics",
> -                           "LICENSE:%s includes licenses (%s) that are n=
ot "
> -                           "listed in LICENSE" % (package, ' '.join(unli=
sted)))
> -    return False
> +    package_lics =3D oe.license.list_licenses(pkg_lics)
> +    unlisted =3D package_lics - recipe_lics_set
> +    if unlisted:
> +        oe.qa.add_message(messages, "unlisted-pkg-lics",
> +                               "LICENSE:%s includes licenses (%s) that a=
re not "
> +                               "listed in LICENSE" % (package, ' '.join(=
unlisted)))
> +        return False
> +    obsolete =3D set(oe.license.obsolete_license_list()) & package_lics =
- recipe_lics_set
> +    if obsolete:
> +        oe.qa.add_message(messages, "obsolete-license",
> +                               "LICENSE:%s includes obsolete licenses %s=
" % (package, ' '.join(obsolete)))
> +        return False
> +    return True
>=20
>  QAPKGTEST[empty-dirs] =3D "package_qa_check_empty_dirs"
>  def package_qa_check_empty_dirs(pkg, d, messages):
> @@ -1012,6 +1017,14 @@ python do_package_qa () {
>=20
>      bb.note("DO PACKAGE QA")
>=20
> +    main_lic =3D d.getVar('LICENSE')
> +
> +    # Check for obsolete license references in main LICENSE (packages ar=
e checked below for any changes)
> +    main_licenses =3D oe.license.list_licenses(d.getVar('LICENSE'))

The documentation for oe.license.list_licenses() says that it returns=20
a list, but I assume that is not true or the code below would not work...

> +    obsolete =3D set(oe.license.obsolete_license_list()) & main_licenses
> +    if obsolete:
> +        oe.qa.handle_error("obsolete-license", "Recipe LICENSE includes =
obsolete licenses %s" % ' '.join(obsolete), d)
> +
>      bb.build.exec_func("read_subpackage_metadata", d)
>=20
>      # Check non UTF-8 characters on recipe's metadata

//Peter


