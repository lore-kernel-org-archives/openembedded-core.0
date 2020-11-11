Received: from esa4.hc324-48.eu.iphmx.com (esa4.hc324-48.eu.iphmx.com [207.54.71.48])
 by mx.groups.io with SMTP id smtpd.web11.4442.1605085581639787238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 01:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=CBJd5WeC;
 spf=pass (domain: bmw.de, ip: 207.54.71.48, mailfrom: prvs=577f07fd8=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1605085581; x=1636621581;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=z0YKUOIVma+BRnHo3XpMyf2XDDa51+nHQAvPSafwtbo=;
  b=CBJd5WeC1fdrmXwA86JVmzJP5qI9Ku6pETuhQl8Afi0vUP3WgCBdqIE2
   lJQviGOx44gx+HkxcDIEuz7PbAdHZOzXaHitAPjYLXJG/xdB+2yuaX+TF
   yl/YxH22cplItXovPOyE+r5+9jm4vSzCdH2yMc21e7nRzoWV4v3HEVDFp
   s=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa4.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Nov 2020 10:06:18 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw4.muc with ESMTP/TLS;
 11 Nov 2020 10:06:17 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp) ([160.48.96.46])
 by esabb2.muc with ESMTP/TLS; 11 Nov 2020 10:06:17 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10j.europe.bmw.corp
 (160.48.96.46) with Microsoft SMTP Server (TLS;
 Wed, 11 Nov 2020 10:06:16 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.007; Wed,
 11 Nov 2020 10:06:17 +0100
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <diego.santacruz@spinetix.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] FreeType CVE-2020-15999
Thread-Topic: [OE-core] FreeType CVE-2020-15999
Thread-Index: Ada3/yfZgI6So/CPS5+iqCvl+/ICCAAAl+IA
Date: Wed, 11 Nov 2020 09:06:17 +0000
Message-ID: <20201111090616.GS1246345@korppu>
References: <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DB6PR0102MB2630314CC44CCB6400F59C4E88E80@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F9BCB6F48EBD444EB41296D00D330A20@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 11, 2020 at 08:06:44AM +0000, Diego Santa Cruz via lists.openem=
bedded.org wrote:
> Hi all,
>=20
> It was brought to my attention that FreeType < 2.10.4 is affected by a bu=
ffer overflow with PNG bitmaps as per https://sourceforge.net/projects/free=
type/files/freetype2/2.10.4/, https://cve.mitre.org/cgi-bin/cvename.cgi?nam=
e=3DCVE-2020-15999
>=20
> This does not appear in the CVE metrics which have been posted recently, =
apparently because it is tagged as google:chrome in the NVD database.
>=20
> In master freetype is already at 2.10.4, but on gatesgarth it is 2.10.2 a=
nd dunfell 2.10.1. What is the strategy regarding FreeType updates in OE-Co=
re releases? Should I send a patch to update freetype to 2.10.4 in both bra=
nches or backport the fix for the buffer overrun?

Safe approach would be to pick the patch from Debian and with some luck
it would apply as is to gatesgarth and dunfell versions.

Patch from Debian is
https://security-tracker.debian.org/tracker/CVE-2020-15999
-> https://sources.debian.org/patches/freetype/2.10.2+dfsg-4/cve-2020-15999=
.patch/

2.10.4 from master could be ABI compatible according to
https://abi-laboratory.pro/index.php?view=3Dtimeline&l=3Dfreetype
but https://www.freetype.org/index.html#news does list
possible API break in 2.10.3:

"A warning for distribution maintainers: Version 2.10.3 and later may break=
 the build of ghostscript, due to ghostscript's use of a withdrawn macro th=
at wasn't intended for external usage. A fix is available here."
=20
> Also, how should one report problems in the NVD database?

https://nvd.nist.gov/vuln/detail/CVE-2020-15999#VulnChangeHistorySection
should have more generic freetype CPE with vendor "freetype" and product "f=
reetype"
and then the correct version range. CVE comes from chrome-cve-admin@google.=
com
so I don't know how to change that. Maybe chrome team could change this aft=
er email
notification?

Cheers,

-Mikko=
