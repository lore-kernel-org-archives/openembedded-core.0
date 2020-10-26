Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web11.9277.1603694584886986539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 23:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=hEOfYuAT;
 spf=pass (domain: bmw.de, ip: 207.54.68.121, mailfrom: prvs=561a1cdfb=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1603694584; x=1635230584;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZWrUPTX8bPxYABFtXQoCjCn2kSr7S7QOgo13MMsCFgo=;
  b=hEOfYuATgsHmiseQk35OOPTIMTeanQVoCZBr1iKrL1vp/v0vZb/+KWy3
   dA7NubasdOgoZkLpqSdyel6gNzoyQJAb8OEQCEjJy4e6SpK/YFtpzRgOK
   kIum77TDYORbnqLALrFvqodfA7iF9LyjdD/K8ycU8Y5QPDC1y5ha+emZJ
   U=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 26 Oct 2020 07:43:01 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
 26 Oct 2020 07:43:01 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp) ([160.48.96.48])
 by esabb2.muc with ESMTP/TLS; 26 Oct 2020 07:43:01 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10l.europe.bmw.corp
 (160.48.96.48) with Microsoft SMTP Server (TLS;
 Mon, 26 Oct 2020 07:43:01 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 26 Oct 2020 07:43:01 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <paul.eggleton@linux.microsoft.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
Thread-Topic: [OE-core] [RFC PATCH 1/2] classes/buildhistory: record SRC_URI
Thread-Index: AQHWpc0GZ1VeehB1PkSsWRA8i3caAampah+A
Date: Mon, 26 Oct 2020 06:43:01 +0000
Message-ID: <20201026064259.GT2040@korppu>
References: <cover.1603080016.git.paul.eggleton@linux.microsoft.com>
 <e83e7133cc7affdc013455744f1bc31d83503757.1603080016.git.paul.eggleton@linux.microsoft.com>
In-Reply-To: <e83e7133cc7affdc013455744f1bc31d83503757.1603080016.git.paul.eggleton@linux.microsoft.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <307E7D2F7D65924E88CD1BC24E66F5BA@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2020 at 09:03:56PM -0700, Paul Eggleton wrote:
> From: Paul Eggleton <paul.eggleton@microsoft.com>
>=20
> It can be useful to record SRC_URI into buildhistory for the purposes of
> tracking exactly which sources got built (we already have SRCREV) as
> well as getting an indication when changes to the SRC_URI relate to
> changes in the output.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>

I have similar patch in our poky trees. Also have patches
to export LICENSE and CVE_PRODUCT to buildhistory. These are used
by some post-build QA check scripts.

Acked-by: Mikko Rapeli <mikko.rapeli@bmw.de>

Cheers,

-Mikko

> ---
>  meta/classes/buildhistory.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhisto=
ry.bbclass
> index 0f26c3c..7d5e3eb 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -116,6 +116,7 @@ python buildhistory_emit_pkghistory() {
>              self.srcrev =3D ""
>              self.layer =3D ""
>              self.config =3D ""
> +            self.src_uri =3D ""
>  
>  
>      class PackageInfo:
> @@ -258,6 +259,7 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.packages =3D packages
>      rcpinfo.layer =3D layer
>      rcpinfo.config =3D sortlist(oe.utils.squashspaces(d.getVar('PACKAGE=
CONFIG') or ""))
> +    rcpinfo.src_uri =3D oe.utils.squashspaces(d.getVar('SRC_URI') or ""=
)
>      write_recipehistory(rcpinfo, d)
>  
>      bb.build.exec_func("read_subpackage_metadata", d)
> @@ -368,6 +370,7 @@ def write_recipehistory(rcpinfo, d):
>          f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)
>          f.write(u"LAYER =3D %s\n" %  rcpinfo.layer)
>          f.write(u"CONFIG =3D %s\n" %  rcpinfo.config)
> +        f.write(u"SRC_URI =3D %s\n" %  rcpinfo.src_uri)
>  
>      write_latest_srcrev(d, pkghistdir)
>  
> --=20
> 1.8.3.1
>=20

>=20
>=20
>=20
