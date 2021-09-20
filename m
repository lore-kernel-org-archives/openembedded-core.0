Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.9877.1632134306114028537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 03:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WHf2vTTu;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1632134306;
  x=1663670306;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=cTa6WVLOpObjtGxYX/6WdKkHp08ahOZ2A9IX1HpjntE=;
  b=WHf2vTTuBmp+fXLAzeUBLQaoH4h1rP/C764gJua2fMO3J04Y1Lu/evbT
   jpsEQYc/nPZerTdToTQkgzOLlutcftCpiXaBdy+Rhf4zNP1wjL31QYxRB
   P5ZuC7NspEZz07TmQ7gIDKWQMVNdT4AHHxA+AMs4lb87TDNxHzhB+L+7V
   bBUVdk+eRcAxZCj9kZiyZpVcR3YyLQGa0Yl/DczfXmmEJ6zs2UezhGbJM
   bI8wvyJ8nwJHi50zIDo+QusSA8a7JondQVYSrjai1G4Iilp9li3ldUggQ
   EeWPytMKMnQU9MFAXW14Dg7Q38kcwy7/5FEyZq5zw1WRyxCTZzNgTiYTB
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: jan <jan.vermaete@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [[meta-webserver]] netdata: Fixed the recipe.
Thread-Topic: [OE-core] [[meta-webserver]] netdata: Fixed the recipe.
Thread-Index: AQHXrgW50rvh8zAFr0eQSmG6QT994qusuZ6A
Date: Mon, 20 Sep 2021 10:38:23 +0000
Message-ID: <3f3b36e9c5a046cc87fa66445e90acd7@axis.com>
References: <20210920095531.5426-1-jan.vermaete@gmail.com>
In-Reply-To: <20210920095531.5426-1-jan.vermaete@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of jan
> Sent: den 20 september 2021 11:56
> To: openembedded-core@lists.openembedded.org
> Cc: Jan Vermaete <jan.vermaete@gmail.com>
> Subject: [OE-core] [[meta-webserver]] netdata: Fixed the recipe.
>=20
> The netdata website was not accessable due to some (changed) permissions.
> The systemd service file will start netdata deamon with the netdata user.
> The netdata group as existing, but the netdata user was missing.
>=20
> I moved some directory creations from systemd to the bitbake recipe.
>=20
> The project website address changed too.
>=20
> Tested with meta-raspberrypi on rpi4-32.
>=20
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  .../netdata/netdata/netdata.service           | 13 +++++++-----
>  .../recipes-webadmin/netdata/netdata_git.bb   | 21 +++++++++++++------
>  2 files changed, 23 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta-webserver/recipes-
> webadmin/netdata/netdata/netdata.service b/meta-webserver/recipes-
> webadmin/netdata/netdata/netdata.service
> index b244d1866..7d50a7fdd 100644
> --- a/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata/netdata.service
> @@ -1,13 +1,16 @@
> +# SPDX-License-Identifier: GPL-3.0-or-later
>  [Unit]
> -Description=3DNetdata, Real-time performance monitoring
> +Description=3DReal time performance monitoring
>  RequiresMountsFor=3D/var
> +After=3Dnetwork.target
>=20
>  [Service]
> -User=3Droot
> +Type=3Dsimple
> +PIDFile=3D/var/run/netdata/netdata.pid

Doesn't systemd prefer the pid files in /run rather than /var/run nowadays?

>  ExecStartPre=3D/bin/mkdir -p /var/log/netdata
> -ExecStartPre=3D/bin/chown -R nobody.netdata @@datadir/netdata/web
> -ExecStartPre=3D/bin/chown -R nobody.netdata /var/cache/netdata
> -ExecStart=3D/usr/sbin/netdata -nd
> +ExecStartPre=3D/bin/chown -R netdata.netdata /var/log/netdata
> +ExecStart=3D/usr/sbin/netdata -D -u netdata
> +
>=20
>  [Install]
>  WantedBy=3Dmulti-user.target
> diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> index 7c48b8a37..9a2467202 100644
> --- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> +++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> @@ -1,17 +1,19 @@
> -HOMEPAGE =3D "https://github.com/firehol/netdata/"
> +HOMEPAGE =3D "https://github.com/netdata/netdata/"
>  SUMMARY =3D "Real-time performance monitoring"
> +DESCRIPTION =3D "Netdata is high-fidelity infrastructure monitoring and
> troubleshooting. \
> +               Open-source, free, preconfigured, opinionated, and always
> real-time."
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfc9b848046ef54b5eaee6071947ab=
d24"
>=20
> -SRC_URI =3D "git://github.com/firehol/netdata.git;protocol=3Dhttps"
> +SRC_URI:append =3D " git://github.com/firehol/netdata.git;protocol=3Dhtt=
ps"
>  SRCREV =3D "1be9200ba8e11dc81a2101d85a2725137d43f766"
>  PV =3D "1.22.1"
>=20
>  # default netdata.conf for netdata configuration
> -SRC_URI +=3D "file://netdata.conf"
> +SRC_URI:append =3D " file://netdata.conf"
>=20
>  # file for providing systemd service support
> -SRC_URI +=3D "file://netdata.service"
> +SRC_URI:append =3D " file://netdata.service"

There is no need to use SRC_URI:append for any of the files above.=20
The original version of the recipe used the preferred format.

>  S =3D "${WORKDIR}/git"
>=20
> @@ -31,7 +33,7 @@ SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
>=20
>  #User specific
>  USERADD_PACKAGES =3D "${PN}"
> -GROUPADD_PARAM:${PN} =3D "--system netdata"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --home-dir ${localsta=
tedir}/run/netdata --user-group netdata"
>=20
>  do_install:append() {
>      #set S UID for plugins
> @@ -50,6 +52,13 @@ do_install:append() {
>      sed -i -e 's,@@sysconfdir,${sysconfdir},g' ${D}${sysconfdir}/netdata=
/netdata.conf
>      sed -i -e 's,@@libdir,${libexecdir},g' ${D}${sysconfdir}/netdata/net=
data.conf
>      sed -i -e 's,@@datadir,${datadir},g' ${D}${sysconfdir}/netdata/netda=
ta.conf
> +
> +    install --group netdata --owner netdata --directory ${D}${localstate=
dir}/cache/netdata
> +    install --group netdata --owner netdata --directory ${D}${localstate=
dir}/lib/netdata
> +
> +    chown -R netdata:netdata ${D}${datadir}/netdata/web
>  }
>=20
> -RDEPENDS:${PN} =3D "bash zlib"
> +FILES_${PN} +=3D "${localstatedir}/cache/netdata/ ${localstatedir}/lib/n=
etdata/"
> +
> +RDEPENDS_${PN} =3D "bash zlib"

That should remain as RDEPENDS:${PN}.

//Peter

> --
> 2.25.1

