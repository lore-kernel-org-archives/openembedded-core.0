Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.3602.1615519291265174991
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 19:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=pveZIWRE;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615519291;
  x=1647055291;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wVdcCstGRqw/aSgiZ/IWGqAbPTnwgyP2uCpzDiYAAFc=;
  b=pveZIWRETpUaGN6QgrKQ8z6HbCDlvCgJOt1DHS7tEAtsmePh7OzmkaPn
   0pOxFL5M5bfapBb0HpjesX71obEC010Gsi9EWYGftQ48qoSSkrSO6kiLJ
   j4YPsBo0oW9C60O7wCaYnyZvFaKhGKGgIEelzc3+LULhE8JvEM23Z4DmL
   mr/Ou8klc6U/WowN+LcdYJR3R0bJQgNjHX5RRCtZMOZYqVv5xgAiG3Kqt
   YVTdCrqea0Bp+bw3hTDdvAgstfkTlM381vlm+ZOUP8g4T+0xWXvGdpSjC
   j3wAwrBL9PCE6ZH9hs+I97gdt5SRzphAkQW/86CsNqNY8iUdhZL1LfRzG
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] license.bbclass: Improve parsing time when INCOMPATIBLE_LICENSES is big
Thread-Topic: [OE-core] [PATCH 1/2] license.bbclass: Improve parsing time when
 INCOMPATIBLE_LICENSES is big
Thread-Index: AQHXFu5+q2Vtu0id3Emc/LI2t+Nceqp/r4hQ
Date: Fri, 12 Mar 2021 03:21:29 +0000
Message-ID: <ecc8caafdc6f4f2388824106b12a2edd@XBOX03.axis.com>
References: <166B7A1BE6E395FA.480@lists.openembedded.org>
In-Reply-To: <166B7A1BE6E395FA.480@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, wrong list.

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 12 mars 2021 04:19
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] license.bbclass: Improve parsing time when
> INCOMPATIBLE_LICENSES is big
>=20
> The commit 08cbf1748 (licenses: Update INCOMPATIBLE_LICENSE for
> 'or-later' handling) increased the parsing time considerably if there
> are many licenses in INCOMPATIBLE_LICENSE. Reorganize the code to get
> almost all the time back.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/license.bbclass | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index bcea0b3cb5..f7978e266b 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -282,16 +282,15 @@ def expand_wildcard_licenses(d, wildcard_licenses):
>      """
>      import fnmatch
>=20
> -    # Assume if we're passed "GPLv3" or "*GPLv3" it means -or-later as
> well
> -    for lic in wildcard_licenses[:]:
> -        if not lic.endswith(("-or-later", "-only", "*")):
> -            wildcard_licenses.append(lic + "+")
> -
>      licenses =3D wildcard_licenses[:]
>      spdxmapkeys =3D d.getVarFlags('SPDXLICENSEMAP').keys()
>      for wld_lic in wildcard_licenses:
>          spdxflags =3D fnmatch.filter(spdxmapkeys, wld_lic)
>          licenses +=3D [d.getVarFlag('SPDXLICENSEMAP', flag) for flag in
> spdxflags]
> +        # Assume if we're passed "GPLv3" or "*GPLv3" it means -or-later
> as well
> +        if not wld_lic.endswith(("-or-later", "-only", "*", "+")):
> +            spdxflags =3D fnmatch.filter(spdxmapkeys, wld_lic + "+")
> +            licenses +=3D [d.getVarFlag('SPDXLICENSEMAP', flag) for flag=
 in
> spdxflags]
>=20
>      spdx_lics =3D d.getVar('AVAILABLE_LICENSES').split()
>      for wld_lic in wildcard_licenses:
