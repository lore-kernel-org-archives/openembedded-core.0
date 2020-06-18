Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 by mx.groups.io with SMTP id smtpd.web12.4352.1592475220322223750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 03:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.180, mailfrom: awais_belal@mentor.com)
IronPort-SDR: 8n1Nqk/BZCJLDqlXRjYh0ZDkLOV8cu/LqRw6+/6jUesC/wYskn1GH77ts6ipAmmFkUdXZWjoJX
 baA2Izey4Ub+mZjm+2cixnm2dHePeRmLCjyMtxIu8RhrUmF3yD8LvJ4X20gGCuwNPyNDkqeRl9
 h4A1ddt+6dCoZCjT5JI2RL3+JNzj5jGoGwlLVtAbWICChciRmhgw/B56NqhaURuduSCizlHZxt
 8fjqhxB88IGczH6ndi9FrhR+PuDgpnGQ8FBvbVz+yO2tqXlYPj69+DFGZ+6mHA1MAzpDzkP32C
 Y4E=
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="49961340"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 18 Jun 2020 02:13:39 -0800
IronPort-SDR: MWIup/CbGcf0QDiLxD6J2rGdJWtp/mqw/EMNj3D2xcxYbYaXKG3GppXqA2Ek4KqXwENf3UXU95
 +udkFfCAXO9FORW573XDLx6p+vr/lXozq8Gw0LLAi0U774pTVYR6K0gyzYsp3ZnLEvIz2hTBu/
 yfnZOW06PQemsXhFPb8crueWKTNhayv8Umdl+rCeO8ctg/0/Pxl7TsHer0jxXiuxxhRq2GriqN
 4KKVzX2Q1PudQ32nRN4rizyZM5KYB0g6KB5XgxADJl8XZF6lftaXnk6aT7EVWbPJYkRxsimt/+
 Pq0=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>, "pbarker@konsulko.com"
	<pbarker@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for environment-setup beforehand
Thread-Topic: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for
 environment-setup beforehand
Thread-Index: AQHWRUUddxOCLY7HF0GrveLW59pfn6jd8r+AgAAz0rQ=
Date: Thu, 18 Jun 2020 10:13:34 +0000
Message-ID: <1592475214481.69521@mentor.com>
References: <20200617204739.22441-1-awais_belal@mentor.com>
 <CAM9ZRVvciD5BRLYnimK1AN9_BGZ8J8oK=keywSv2EGbOkwjK+Q@mail.gmail.com>,<20200618080401.GS108868@korppu>
In-Reply-To: <20200618080401.GS108868@korppu>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I'd change the script to run with bash and "set -euo pipefail" to capture
> errors like this early.

The toolchain-shar-relocate script comes in through the replacement of SDK=
_PRE_INSTALL_COMMAND in toolchain-shar-extract so it cannot decide to use b=
ash itself. Also, I don't think it would be a good idea to introduce a spec=
ific shell binding for such scripts.

BR,
Awais

________________________________________
From: Mikko.Rapeli@bmw.de <Mikko.Rapeli@bmw.de>
Sent: Thursday, June 18, 2020 1:04 PM
To: pbarker@konsulko.com
Cc: Belal, Awais; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] toolchain-shar-relocate.sh: check for envir=
onment-setup beforehand

On Thu, Jun 18, 2020 at 08:50:21AM +0100, Paul Barker wrote:
> On Wed, 17 Jun 2020 at 21:48, Awais Belal <Awais_Belal@mentor.com> wrote=
:
> >
> > The script runs a 'cat' on the script and if it isn't present in the
> > sdk the cat command waits on the std input and hence the installation
> > process simply sits there.
>
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
>
>
>
> --
> Paul Barker
> Konsulko Group

>=20
