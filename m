Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web12.33697.1628840340521319118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 00:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=RAzLddAg;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=852aaa0d9=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1628840340; x=1660376340;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nxkSPuz1vUEwhqoLAEK4lyTsk+o7VkLlGkx3lfaYpqA=;
  b=RAzLddAgRGncXF/Ka0xjZ1x+Cz/kqOD1iomdPA5Kssff9IurLDfB8y95
   mHTPxVd2GSPYpAXF9mMdlfNHmq4ZzOfkPo7kE+ke2OkwePIw53RzbEHee
   8yP9mANjxAnf68Sdue6cuB6iyuaRFK+WGtUUBfW8HA7dMa0ghYTtdkKqQ
   Q=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 13 Aug 2021 09:38:49 +0200
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
 13 Aug 2021 09:38:48 +0200
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp) ([160.46.167.68])
 by esabb6.muc with ESMTP/TLS; 13 Aug 2021 09:38:39 +0200
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Fri, 13 Aug 2021 09:38:38 +0200
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.018; Fri,
 13 Aug 2021 09:38:38 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <abeltran@linux.microsoft.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] buildhistory: Add output file listing package information
Thread-Topic: [OE-core] [PATCH] buildhistory: Add output file listing package
 information
Thread-Index: AQHXj5trEsbHp/q2QUGZrNiaaE4xNKtw67aA
Date: Fri, 13 Aug 2021 07:38:38 +0000
Message-ID: <YRYhfdR5SNZpiYpN@korppu>
References: <20210812165856.6469-1-abeltran@linux.microsoft.com>
In-Reply-To: <20210812165856.6469-1-abeltran@linux.microsoft.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FFB6109F30CF34DA2E00AE1A3CAF023@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 12, 2021 at 04:58:56PM +0000, Andres Beltran wrote:
> Currently, buildhistory does not produce a single file combining relevant
> information of installed packages. Produce an output file
> "installed-package-info.txt" listing a package's runtime name, buildtime =
name,
> its recipe, version, and size to avoid having to look up each package ext=
ernally.
> Leave the existing package list files as-is for backwards compatibility.

Thanks for this patch, I find it useful!

I have had similar needs and have created scripts which parse the same info
from buildhistory. What I'd add here is the layer of the recipe.

In large projects I have the need to also map binary packages into
their maintainers and subprojects, and produce reports, e.g. rootfs usage
reports per maintainer/subproject to be checked against an agreed budget.
Thus I've used layer and MAINTAINER fields to map binary package to the
subprojects and maintainers inside the projects.

Would be nice to be able to extend the rootfs binary package reports with
this info but a bit of scripting on the buildhistory output is fine too.

Cheers,

-Mikko

> In order to support this efficiently, extend oe-pkgdata-util to accept mu=
ltiple keys
> for its read-value argument.
>=20
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
> ---
>  meta/classes/buildhistory.bbclass |  5 +++++
>  scripts/oe-pkgdata-util           | 37 +++++++++++++++++++------------
>  2 files changed, 28 insertions(+), 14 deletions(-)
>=20
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistor=
y.bbclass
> index 8a1359acbe..134b56ab71 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -491,6 +491,11 @@ buildhistory_get_installed() {
>  	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | so=
rt -n -r > $1/installed-package-sizes.txt
>  	rm $1/installed-package-sizes.tmp
> =20
> +	# Produce package info: runtime_name, buildtime_name, recipe, version, =
size
> +	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PACKAGE,PN,PV,PKGSIZE" -n=
 -f $pkgcache > $1/installed-package-info.tmp
> +	cat $1/installed-package-info.tmp | sort -n -r -k 5 > $1/installed-pack=
age-info.txt
> +	rm $1/installed-package-info.tmp
> +
>  	# We're now done with the cache, delete it
>  	rm $pkgcache
> =20
> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
> index 75dd23efa3..c30baaa580 100755
> --- a/scripts/oe-pkgdata-util
> +++ b/scripts/oe-pkgdata-util
> @@ -171,7 +171,7 @@ def read_value(args):
>                      val =3D line.split(': ', 1)[1].rstrip()
>          return val
> =20
> -    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args=
.valuename, packages))
> +    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args=
.valuenames, packages))
>      for package in packages:
>          pkg_split =3D package.split('_')
>          pkg_name =3D pkg_split[0]
> @@ -180,20 +180,29 @@ def read_value(args):
>          logger.debug(revlink)
>          if os.path.exists(revlink):
>              mappedpkg =3D os.path.basename(os.readlink(revlink))
> -            qvar =3D args.valuename
> -            value =3D readvar(revlink, qvar, mappedpkg)
> -            if qvar =3D=3D "PKGSIZE":
> -                # PKGSIZE is now in bytes, but we we want it in KB
> -                pkgsize =3D (int(value) + 1024 // 2) // 1024
> -                value =3D "%d" % pkgsize
> -            if args.unescape:
> -                import codecs
> -                # escape_decode() unescapes backslash encodings in byte =
streams
> -                value =3D codecs.escape_decode(bytes(value, "utf-8"))[0]=
.decode("utf-8")
> +            qvars =3D args.valuenames
> +            val_names =3D qvars.split(',')
> +            values =3D []
> +            for qvar in val_names:
> +                if qvar =3D=3D "PACKAGE":
> +                    value =3D mappedpkg
> +                else:
> +                    value =3D readvar(revlink, qvar, mappedpkg)
> +                if qvar =3D=3D "PKGSIZE":
> +                    # PKGSIZE is now in bytes, but we we want it in KB
> +                    pkgsize =3D (int(value) + 1024 // 2) // 1024
> +                    value =3D "%d" % pkgsize
> +                if args.unescape:
> +                    import codecs
> +                    # escape_decode() unescapes backslash encodings in b=
yte streams
> +                    value =3D codecs.escape_decode(bytes(value, "utf-8")=
)[0].decode("utf-8")
> +                values.append(value)
> +
> +            values_str =3D ' '.join(values)
>              if args.prefix_name:
> -                print('%s %s' % (pkg_name, value))
> +                print('%s %s' % (pkg_name, values_str))
>              else:
> -                print(value)
> +                print(values_str)
>          else:
>              logger.debug("revlink %s does not exist", revlink)
> =20
> @@ -570,7 +579,7 @@ def main():
>      parser_read_value =3D subparsers.add_parser('read-value',
>                                            help=3D'Read any pkgdata value=
 for one or more packages',
>                                            description=3D'Reads the named=
 value from the pkgdata files for the specified packages')
> -    parser_read_value.add_argument('valuename', help=3D'Name of the valu=
e to look up')
> +    parser_read_value.add_argument('valuenames', help=3D'Name of the val=
ue/s to look up (separated by commas, no spaces)')
>      parser_read_value.add_argument('pkg', nargs=3D'*', help=3D'Runtime p=
ackage name to look up')
>      parser_read_value.add_argument('-f', '--file', help=3D'Read package =
names from the specified file (one per line, first field only)')
>      parser_read_value.add_argument('-n', '--prefix-name', help=3D'Prefix=
 output with package name', action=3D'store_true')
> --=20
> 2.17.1
>=20

>=20
>=20
>=20
