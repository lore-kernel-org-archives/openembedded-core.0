Received: from esa6.bmw.c3s2.iphmx.com (esa6.bmw.c3s2.iphmx.com [68.232.139.124])
 by mx.groups.io with SMTP id smtpd.web12.15548.1592220581702725384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 04:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=U4P1BG+y;
 spf=pass (domain: bmw.de, ip: 68.232.139.124, mailfrom: prvs=428658508=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1592220582; x=1623756582;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w7y+o6QkkU7NygSwZG7a25sVkUHiwl8XTairHR3wiMg=;
  b=U4P1BG+yHmezVF7zZveVbs3fPjbl+r9cCsqVCY1E2+g+rNbjd6Y29a1u
   WaM0NQXYzft7PnQau/skO//Z5AoIXZcn+hKP58AOd5oPH1N0a/BScouzs
   RPDaByplnvV0ZUqFcwdD+sw+Ti36NYA/2GlBEEOyDfrgKYZSmEU1gGe+H
   k=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa6.bmw.c3s2.iphmx.com with ESMTP/TLS; 15 Jun 2020 13:29:39 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
 15 Jun 2020 13:29:38 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp) ([160.48.96.47])
 by esabb6.muc with ESMTP/TLS; 15 Jun 2020 13:29:38 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10k.europe.bmw.corp
 (160.48.96.47) with Microsoft SMTP Server (TLS;
 Mon, 15 Jun 2020 13:29:38 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 15 Jun 2020 13:29:38 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <jlu@pengutronix.de>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] classes/buildhistory: capture package config
Thread-Topic: [OE-core][PATCH] classes/buildhistory: capture package config
Thread-Index: AQHWOX7XvTzy7i/qeUK+cOOLjswCgajZe/uA
Date: Mon, 15 Jun 2020 11:29:38 +0000
Message-ID: <20200615112937.GF108868@korppu>
References: <20200603081237.1959-1-jlu@pengutronix.de>
In-Reply-To: <20200603081237.1959-1-jlu@pengutronix.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2EB9027FD0E99443AC784AC5F329FE94@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable


On Wed, Jun 03, 2020 at 10:12:37AM +0200, Jan Luebbe wrote:
> As the PACKAGECONFIG variable has a large influence on the resulting
> package sizes and dependencies, it's useful to capture it in the
> recipe-level buildhistory. This makes it straightforward to analyze the
> impact of PACKAGECONFIG changes on the resulting image size.

Thanks, this is a good idea! I would print using full PACKAGECONFIG name
to avoid any confusion.

And this reminds me that DISTRO_FEATURES isn't logged into buildhistory ei=
ther
afaik...

A generic approach for adding more variables to buildhistory would be nice=
.

-Mikko

>=20
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta/classes/buildhistory.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhisto=
ry.bbclass
> index eb7295570dbd..a4288ef9e1f5 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -113,6 +113,7 @@ python buildhistory_emit_pkghistory() {
>              self.packages =3D ""
>              self.srcrev =3D ""
>              self.layer =3D ""
> +            self.config =3D ""
>  
>  
>      class PackageInfo:
> @@ -254,6 +255,7 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPEND=
S') or ""))
>      rcpinfo.packages =3D packages
>      rcpinfo.layer =3D layer
> +    rcpinfo.config =3D sortlist(oe.utils.squashspaces(d.getVar('PACKAGE=
CONFIG') or ""))
>      write_recipehistory(rcpinfo, d)
>  
>      pkgdest =3D d.getVar('PKGDEST')
> @@ -368,6 +370,7 @@ def write_recipehistory(rcpinfo, d):
>          f.write(u"DEPENDS =3D %s\n" %  rcpinfo.depends)
>          f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)
>          f.write(u"LAYER =3D %s\n" %  rcpinfo.layer)
> +        f.write(u"CONFIG =3D %s\n" %  rcpinfo.config)
>  
>      write_latest_srcrev(d, pkghistdir)
>  
> --=20
> 2.27.0
>=20

>=20
