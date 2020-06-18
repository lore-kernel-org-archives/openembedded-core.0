Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com [68.232.139.62])
 by mx.groups.io with SMTP id smtpd.web12.2784.1592467455543373164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 01:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=Sop7aUbD;
 spf=pass (domain: bmw.de, ip: 68.232.139.62, mailfrom: prvs=431bfba97=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1592467455; x=1624003455;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=81zyAlA4H9xCHgpPpRnwgYQQg6cmpEA+RRL6SEYxlJI=;
  b=Sop7aUbDR1UShVhJALRX6+csgUjZO+T+qIgWv3MqlwKK6XmnhWXopTWY
   sgWneZjRNgurQwb8ayBQbbiVkRvSqf2TtDXHLn9Wj1Qm9nVrdEqKNkMB2
   +8q2SUU8dZtfd6lBasHxYjPiJYom5h2yrNngSoysA0pzOVj8wR6cBnk0j
   0=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 18 Jun 2020 10:04:11 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
 18 Jun 2020 10:04:08 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp) ([160.48.96.48])
 by esabb3.muc with ESMTP/TLS; 18 Jun 2020 10:04:02 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10l.europe.bmw.corp
 (160.48.96.48) with Microsoft SMTP Server (TLS;
 Thu, 18 Jun 2020 10:04:02 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Thu,
 18 Jun 2020 10:04:02 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <pbarker@konsulko.com>
CC: <Awais_Belal@mentor.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for environment-setup beforehand
Thread-Topic: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for
 environment-setup beforehand
Thread-Index: AQHWROifRftvJyOgsEGsvY4gFx2ae6jd3uOAgAAD0YA=
Date: Thu, 18 Jun 2020 08:04:01 +0000
Message-ID: <20200618080401.GS108868@korppu>
References: <20200617204739.22441-1-awais_belal@mentor.com>
 <CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>
In-Reply-To: <CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EEA267F8860FCA4D943E6CA0C18C4092@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 08:50:21AM +0100, Paul Barker wrote:
> On Wed, 17 Jun 2020 at 21:48, Awais Belal <Awais_Belal@mentor.com> wrote=
:
> >
> > The script runs a 'cat' on the script and if it isn't present in the
> > sdk the cat command waits on the std input and hence the installation
> > process simply sits there.
>=20
> That sort of error would typically be caused by the variable being
> unset rather than the variable being set to the path of a nonexistent
> file. I don't know much about the context this script runs in though
> so I may be missing something obvious.

I'd change the script to run with bash and "set -euo pipefail" to capture
errors like this early.

-Mikko

> >
> > Signed-off-by: Awais Belal <awais_belal@mentor.com>
> > ---
> >  meta/files/toolchain-shar-relocate.sh | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolch=
ain-shar-relocate.sh
> > index e3c10018ef..02a05664c6 100644
> > --- a/meta/files/toolchain-shar-relocate.sh
> > +++ b/meta/files/toolchain-shar-relocate.sh
> > @@ -3,6 +3,12 @@ if ! xargs --version > /dev/null 2>&1; then
> >         exit 1
> >  fi
> >
> > +# check if we have a valid env-setup script
> > +if [ ! -f "$env_setup_script" ]; then
> > +       echo "Main environment-setup file not found. Abort!"
> > +       exit 1
> > +fi
> > +
> >  # fix dynamic loader paths in all ELF SDK binaries
> >  native_sysroot=3D$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NAT=
IVE_SYSROOT=3D'|cut -d'=3D' -f2|tr -d '"')
> >  dl_path=3D$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
> > --
> > 2.17.1
>=20
>=20
>=20
> --=20
> Paul Barker
> Konsulko Group

>=20
