Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web11.5294.1613464629589006841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:37:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=rBVUY5eS;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=674f28355=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1613464629; x=1645000629;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WYO5mVgb3jQ6u3z2DWTlK4G2J3unsI7zfSeZjS/iMyc=;
  b=rBVUY5eS014ESwY7/zUFB865RW9hKOl2FtSd31al767LzBxyB11grXkl
   JlFHL9fHJWdgmxRUmNMkHNu/hMxz1BYK5QTJVfstzRTWrTWmkg6mKZw+8
   TZZvtkAJYR+fUGqZE/7rtK1Bo/FIlpZhc8t2CDOE+wEpkQK+Z4sNzhx8/
   w=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 16 Feb 2021 09:37:06 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw2.muc with ESMTP/TLS;
 16 Feb 2021 09:37:07 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb2.muc with ESMTP/TLS; 16 Feb 2021 09:37:07 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Tue, 16 Feb 2021 09:37:06 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Tue,
 16 Feb 2021 09:37:06 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <akuster808@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [V2][PATCH] cve-check.bbclass: allow skiping non pbn
Thread-Topic: [OE-core] [V2][PATCH] cve-check.bbclass: allow skiping non pbn
Thread-Index: AQHXA+v5r8UAC1EDZEm6sdYgvp0gyKpaZTGA
Date: Tue, 16 Feb 2021 08:37:06 +0000
Message-ID: <YCuEL+pIPQHSPMzj@korppu>
References: <20210215224254.2550264-1-akuster808@gmail.com>
In-Reply-To: <20210215224254.2550264-1-akuster808@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E6E0D76677D514484B7F77E97997E2D@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 15, 2021 at 10:42:54PM +0000, akuster wrote:
> I don't see the point in logging native, nativesdk etc.
> The bottom line is the BPN has the issue.

There have been several cases where different build targets
were applying different patches, e.g. CVE patched not applied
in -native or -nativesdk build of the recipe.

That aside, I think this patch is ok.

> Allow folks to filter out those other package name variations via
> CVE_CHECK_MANIFEST_FILTER
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>=20
> --
> [V2]
> rename varible to CVE_CHECK_FILTER_BUILD_TOOLS
> ---
>  meta/classes/cve-check.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbc=
lass
> index 112ee3379d3..1bed815d8e4 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -59,6 +59,7 @@ CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
>  # Layers to be included=20
>  CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>  
> +CVE_CHECK_FILTER_BUILD_TOOLS ??=3D"0"
>  
>  # set to "alphabetical" for version using single alphabetical character=
 as increament release
>  CVE_VERSION_SUFFIX ??=3D ""
> @@ -96,6 +97,13 @@ python do_cve_check () {
>      """
>  
>      if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
> +        if d.getVar("CVE_CHECK_FILTER_BUILD_TOOLS") =3D=3D "1":
> +            # drop native, nativesdk, cross, etc
> +            bpn =3D d.getVar("BPN")
> +            pn =3D d.getVar("PN")
> +            if bpn !=3D pn:
> +               return
> +
>          try:
>              patched_cves =3D get_patches_cves(d)
>          except FileNotFoundError:
> @@ -164,6 +172,7 @@ def get_patches_cves(d):
>      import re
>  
>      pn =3D d.getVar("PN")
> +

This hunk is not needed.

For the rest, Acked-by: Mikko Rapeli <mikko.rapeli@bmw.de>

Cheers,

-Mikko

>      cve_match =3D re.compile("CVE:( CVE\-\d{4}\-\d+)+")
>  
>      # Matches last CVE-1234-211432 in the file name, also if written
> --=20
> 2.25.1
>=20

>=20
>=20
>=20
