Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web10.28369.1613375509978160590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 23:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=AZ7j16td;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=673db656c=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1613375510; x=1644911510;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k3+OxW85jN21YH2NCLwhySPnIMYiw2cp4+0hFLTGfWM=;
  b=AZ7j16tduw/OD88WoJVPsNvgLLNn6249Mb3vuitadDV1E4s3PmsxJMkt
   pc4pE4H76MLru2Mu3voKBogsW6vCRxqpiF9+9vEp7iYF6tZmSQfwEGg9V
   XB9pmLrKR+iTL1zrOyXBT7EXYAib/jy+S8HOFHdZ9ndFLpdxxy4KIoyKU
   Y=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Feb 2021 08:51:47 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw5.muc with ESMTP/TLS;
 15 Feb 2021 08:51:46 +0100
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp) ([160.46.167.69])
 by esabb6.muc with ESMTP/TLS; 15 Feb 2021 08:51:46 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Mon, 15 Feb 2021 08:51:45 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.010; Mon,
 15 Feb 2021 08:51:46 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <akuster808@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [[PATCH] cve-check.bbclass: allow skiping non pbn
Thread-Topic: [OE-core] [[PATCH] cve-check.bbclass: allow skiping non pbn
Thread-Index: AQHXAygN5IMYJKoepkyEpl1GoYY9JqpYx7oA
Date: Mon, 15 Feb 2021 07:51:45 +0000
Message-ID: <YCooECLAFp0akfsC@korppu>
References: <20210214232027.2354161-1-akuster808@gmail.com>
In-Reply-To: <20210214232027.2354161-1-akuster808@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <457D614EFE9A8A419CC419A95BC2E5C0@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 14, 2021 at 11:20:27PM +0000, akuster wrote:
> I don't see the point in logging native, nativesdk etc.
> The bottom line is the BPN has the issue.

While I agree to some part and do alot of:

$ cd build/tmp/deploy/cve
$ less $( grep -l Unpatched * | \
egrep -v -- '-native|-nativesdk|-cross-|-crosssdk' )

I do find that fixing build tooling CVEs is a good idea since
they downloads stuff from the Internet.

Hence I'm not sure I like this filter. Maybe at least
rename CVE_CHECK_MANIFEST_FILTER to CVE_CHECK_FILTER_BUILD_TOOLS
which makes this a bit more clear.

Cheers,

-Mikko

> Allow folks to filter out those other package name variations via
> CVE_CHECK_MANIFEST_FILTER
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/classes/cve-check.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbc=
lass
> index 112ee3379d3..0d33d5a530c 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -59,6 +59,7 @@ CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
>  # Layers to be included=20
>  CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
>  
> +CVE_CHECK_MANIFEST_FILTER ??=3D"0"
>  
>  # set to "alphabetical" for version using single alphabetical character=
 as increament release
>  CVE_VERSION_SUFFIX ??=3D ""
> @@ -96,6 +97,13 @@ python do_cve_check () {
>      """
>  
>      if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
> +        if d.getVar("CVE_CHECK_MANIFEST_FILTER") =3D=3D "1":
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
>      cve_match =3D re.compile("CVE:( CVE\-\d{4}\-\d+)+")
>  
>      # Matches last CVE-1234-211432 in the file name, also if written
> --=20
> 2.25.1
>=20

>=20
>=20
>=20
