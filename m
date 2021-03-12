Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.961.1615568276579767756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:57:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PYyNMgm8;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615568277;
  x=1647104277;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=R538TONxcmpz9L+u86E6qD96ACq7z78Wn8G6wIm90MU=;
  b=PYyNMgm8BGcXbso3MtiWzU8pe626KwTj0FFTwkjEpuAKSJjaPfK0O+Kt
   IJi1HU3RNNFXxeu7rzUTf+ymrRtiHdKPhvZ/vhQAkmBb7RYET0P0MEVl9
   BJaHV30WYF2ndNeSQNp0Jr1YuZXDDdIqaslJiVRkSfrCFwhnf/giRwgwl
   r8L4v4Hy0Bti49ZtVrnmdPFA1FFcCMxHNHRkOnK9iqF0vlQ92OfnoKFL+
   VC/duGoOzqRFDneK1pbH8jjymDQHhtkUuIFG6PdPjwnf/vmucoN2/6tRV
   RHZaKPNEPO1jS7JrhLvm4PhNsAm2jSaX2EcRriWteFEfwJmkwv9dlBeS/
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky-contrib][PATCH 2/4] package.bbclass: Displays warnings for just licences in recipes.
Thread-Topic: [OE-core] [poky-contrib][PATCH 2/4] package.bbclass: Displays
 warnings for just licences in recipes.
Thread-Index: AQHXFTxouXxvxDKmuU6jYjXDYtlXIqqAk9Eg
Date: Fri, 12 Mar 2021 16:57:54 +0000
Message-ID: <ce71f7e3ef024d27989c5b8c1a0dc1b0@XBOX03.axis.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
 <20210309233130.104839-2-idadelm@gmail.com>
In-Reply-To: <20210309233130.104839-2-idadelm@gmail.com>
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
> Sent: den 10 mars 2021 00:31
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [poky-contrib][PATCH 2/4] package.bbclass: Displays
> warnings for just licences in recipes.
>=20
> After the comparism between computedpkglics and recipe lics, the warnings
> are displayed if and only if there are licenses in the recipes not found
> in the sources.
>=20
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/package.bbclass | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index c127178f95..4e1be661b3 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1551,6 +1551,7 @@ PKGDESTWORK =3D "${WORKDIR}/pkgdata"
>  PKGDATA_VARS =3D "PN PE PV PR PKGE PKGV PKGR LICENSE DESCRIPTION SUMMARY=
 RDEPENDS RPROVIDES RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS SECTION PKG =
ALLOW_EMPTY FILES CONFFILES FILES_INFO PACKAGE_ADD_METADATA pkg_postinst pk=
g_postrm pkg_preinst pkg_prerm"
>=20
>  python emit_pkgdata() {
> +    import oe.license
>      from glob import glob
>      import json
>      import subprocess
> @@ -1748,8 +1749,8 @@ fi
>                      if r[0] not in computedlics:
>                          computedlics[r[0]] =3D set()
>                      computedlics[r[0]].add(filelics[subf])
> -        #if computedlics:
> -        #    bb.warn(str(computedlics))
> +
> +

One empty line is enough.

>          dvar =3D d.getVar('PKGD')
>          for f in computedlics:
>              shortf =3D f.replace(dvar, "")
> @@ -1762,13 +1763,19 @@ fi
>                      computedpkglics[pkg].update(computedlics[f])
>              if not found:
>                  bb.warn("%s not in %s" % (f, str(filemap)))
> -        #if computedpkglics:
> -        #    bb.warn(str(computedpkglics))
> +
>          for pkg in computedpkglics:
>              lic =3D d.getVar('LICENSE_%s' % (pkg))
>              if not lic:
>                  lic =3D d.getVar('LICENSE')
> -            bb.warn("License for package %s is %s vs %s" % (pkg, compute=
dpkglics[pkg], lic))
> +
> +            # Splits the LICENSE values and canonicalise each license
> +            # in the set of split license(s)
> +            spdx_lic =3D oe.license.split_spdx_lic(lic, d)
> +
> +            # Displays warnings for licenses found in the recipes and no=
t sources
> +            if spdx_lic - computedpkglics[pkg]:
> +                bb.warn("License for package %s is %s vs %s" % (pkg, com=
putedpkglics[pkg], spdx_lic))
>  }
>  emit_pkgdata[dirs] =3D "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-re=
verse ${PKGDESTWORK}/runtime-rprovides"

Since you are now using a function from oe.license that references=20
Bitbake variables, I believe you should add emit_pkgdata[vardeps]=20
for those variables as bitbake will not pick them up automatically.

>=20
> --
> 2.25.1

//Peter

