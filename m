Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.331.1615565912968691224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:18:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fTNoar7N;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615565913;
  x=1647101913;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yeZmehaJWFLlys2G2ceIHMC9+yHSX65Aldc4sWlFkfQ=;
  b=fTNoar7N2vYyPDDO4nvCHZyLpCigCVRokoqInYRZUf58Iu3yDOe0E7JW
   i17kYndmHGjNqcgqZCiIT37dyaCTlRpDAPISjpMpQEoX30H7dmAFlEfSC
   5zuXtmoCtS0Zp7ymfyKiZQjYkMM97aFQWs/UQDIsWnN4Na0/5fJdlHZr8
   +GhBbhV0mU0jVZ6ZCVb+sEEzgQCOXinA+x5JRJlH51QdKqmN5DKtZ6Vpq
   m7YmY7XSlzDuYGQrKmr/SLBiUIh3M0iWyOr/OqqUwjwYw/93QFRCGVZ3G
   4nI64j5cxJHGc1u+GxSamrd4SU25XbU+TAKBHPdrf7HoBj6JfgSz/s2HV
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky-contrib][PATCH 4/4] Moved logic to get filelics from package.bbclass to license.py
Thread-Topic: [OE-core] [poky-contrib][PATCH 4/4] Moved logic to get filelics
 from package.bbclass to license.py
Thread-Index: AQHXFTxzPz/WS96HJ0anj5M95oINsqqAixmg
Date: Fri, 12 Mar 2021 16:18:30 +0000
Message-ID: <8bb63481eacc4f7cac51e5f88ab856dd@XBOX03.axis.com>
References: <20210309233130.104839-1-idadelm@gmail.com>
 <20210309233130.104839-4-idadelm@gmail.com>
In-Reply-To: <20210309233130.104839-4-idadelm@gmail.com>
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
> Sent: den 10 mars 2021 00:32
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [poky-contrib][PATCH 4/4] Moved logic to get filelics
> from package.bbclass to license.py
>=20
> The logic to obtain filelics is moved from package.bbclass to license.py
> as a standalone function.
> Also, the check in package.bbclass after obtaining filelics ensures
> licenses with * WITH Linux-syscall-note" are ignored, as long as they're
> only in header files.
>=20
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/package.bbclass | 24 ++++++------------------
>  meta/lib/oe/license.py       | 29 ++++++++++++++++++++++++++++-
>  2 files changed, 34 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 8c0a49ad76..a2e0eab848 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1721,25 +1721,13 @@ fi
>              with open(data_file + ".srclist", 'w') as f:
>                  f.write(json.dumps(sources, sort_keys=3DTrue))
>=20
> +            flics =3D oe.license.get_filelics([d.getVar('PKGD'),
> d.getVar('STAGING_DIR_TARGET')])
>              filelics =3D {}
> -            for dirent in [d.getVar('PKGD'),
> d.getVar('STAGING_DIR_TARGET')]:
> -                p =3D subprocess.Popen(["grep", 'SPDX-License-Identifier=
:',
> '-R', '-I'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=3Ddi=
rent)
> -                out, err =3D p.communicate()
> -                if p.returncode =3D=3D 0:
> -                    for l in out.decode("utf-8").split("\n"):
> -                        l =3D l.strip()
> -                        if not l:
> -                            continue
> -                        l =3D l.split(":")
> -                        if len(l) < 3:
> -                            bb.warn(str(l))
> -                            continue
> -                        fn =3D "/" + l[0]
> -                        lic =3D l[2].strip()
> -                        if lic.endswith("*/"):
> -                            lic =3D lic[:-2]
> -                        lic =3D lic.strip()
> -                        filelics[fn] =3D lic
> +            for k, v in flics.items():
> +                if k.endswith(".h") and v.endswith("WITH Linux-syscall-n=
ote"):

What about .hh files, or .hpp files, or header files from some=20
other language than C/C++? At the least, this if statement should=20
have a comment explaining what is going on.

> +                    continue
> +                else:
> +                    filelics[k] =3D v
>              with open(data_file + ".filelics", 'w') as f:
>                  f.write(json.dumps(filelics, sort_keys=3DTrue))
>=20
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index 9e9957be1d..3c40fa73eb 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -3,6 +3,8 @@
>  #
>  """Code for parsing OpenEmbedded license strings"""
>=20
> +import subprocess
> +import bb
>  import ast
>  import re
>  from fnmatch import fnmatchcase as fnmatch
> @@ -258,4 +260,29 @@ def split_spdx_lic(licensestr,d):
>      """
>      split_lic =3D list_licenses(licensestr)
>      spdx_lic =3D set([canonical_license(l, d) for l in split_lic])
> -    return spdx_lic
> \ No newline at end of file
> +    return spdx_lic
> +
> +def get_filelics(dirs):
> +    """"
> +    This function returns a dictionary of file paths (keys) and their
> corresponding SPDX header identifiers (values).
> +    """
> +    filelics =3D {}
> +    for dirent in dirs:
> +        p =3D subprocess.Popen(["grep", 'SPDX-License-Identifier:', '-R'=
,'-
> I'], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=3Ddirent)
> +        out, err =3D p.communicate()
> +        if p.returncode =3D=3D 0:
> +            for l in out.decode("utf-8").split("\n"):
> +                l =3D l.strip()
> +                if not l:
> +                    continue
> +                l =3D l.split(":")
> +                if len(l) < 3:
> +                    bb.warn(str(l))
> +                    continue
> +                fn =3D "/" + l[0]
> +                lic =3D l[2].strip()
> +                if lic.endswith("*/"):
> +                    lic =3D lic[:-2]
> +                lic =3D lic.strip()
> +                filelics[fn] =3D lic
> +    return filelics
> \ No newline at end of file
> --
> 2.25.1

//Peter

