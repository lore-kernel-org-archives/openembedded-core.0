Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B07B67705C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 02:26:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8C2Qf9i022787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 19:26:41 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.175]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Sun, 11 Sep 2016 19:26:40 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][v4] watchdog: enable systemd support
Thread-Index: AQHR8q+RvErm69Fm9k2RyhaxVaWFcaB1UgMw
Date: Mon, 12 Sep 2016 02:26:39 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2BDE09@ALA-MBA.corp.ad.wrs.com>
References: <20160810021834.5641-1-jackie.huang@windriver.com>
In-Reply-To: <20160810021834.5641-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH][v4] watchdog: enable systemd support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Sep 2016 02:26:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

I don't see any rejection or comments on this but it's not merged yet, is i=
t ignored?

Anyway, some later changes have been merged so I have to re-base this patch=
, v5 will be sent soon.

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Wednesday, August 10, 2016 10:19 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH][v4] watchdog: enable systemd support
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. inherit systemd, and add two unit files which are from Fedora 23
> 2. auto load soft dog kernel module
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../watchdog/watchdog/watchdog-ping.service              | 11 ++++++++++=
+
>  meta/recipes-extended/watchdog/watchdog/watchdog.service | 11 ++++++++++=
+
>  meta/recipes-extended/watchdog/watchdog_5.15.bb          | 16 ++++++++++=
+++++-
>  3 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog-ping=
.service
>  create mode 100644 meta/recipes-extended/watchdog/watchdog/watchdog.serv=
ice
>=20
> diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog-ping.servic=
e b/meta/recipes-
> extended/watchdog/watchdog/watchdog-ping.service
> new file mode 100644
> index 0000000..44bac9d
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog/watchdog-ping.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3Dwatchdog daemon for use with ping test / network dependenc=
y
> +After=3Dnetwork.target
> +Conflicts=3Dwatchdog.service
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@SBINDIR@/watchdog
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-extended/watchdog/watchdog/watchdog.service b/m=
eta/recipes-
> extended/watchdog/watchdog/watchdog.service
> new file mode 100644
> index 0000000..c5faa4e
> --- /dev/null
> +++ b/meta/recipes-extended/watchdog/watchdog/watchdog.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3Dwatchdog daemon
> +# man systemd.special
> +# auto added After=3Dbasic.target
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@SBINDIR@/watchdog
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recip=
es-
> extended/watchdog/watchdog_5.15.bb
> index ee1a893..7ff151c 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${=
PV}.tar.gz \
>             file://0001-Include-linux-param.h-for-EXEC_PAGESIZE-definitio=
n.patch \
>             file://watchdog-init.patch \
>             file://watchdog-conf.patch \
> +           file://watchdog-ping.service \
> +           file://watchdog.service \
>  "
>=20
>  SRC_URI[md5sum] =3D "678c32f6f35a0492c9c1b76b4aa88828"
> @@ -21,7 +23,7 @@ UPSTREAM_CHECK_URI =3D
> "http://sourceforge.net/projects/watchdog/files/watchdog/"
>  UPSTREAM_CHECK_REGEX =3D "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>=20
>  inherit autotools
> -inherit update-rc.d
> +inherit update-rc.d systemd
>=20
>  DEPENDS_append_libc-musl =3D " libtirpc "
>  CFLAGS_append_libc-musl =3D " -I${STAGING_INCDIR}/tirpc "
> @@ -33,6 +35,18 @@ INITSCRIPT_PARAMS =3D "start 15 1 2 3 4 5 . stop 85 0 =
6 ."
>=20
>  RRECOMMENDS_${PN} =3D "kernel-module-softdog"
>=20
> +SYSTEMD_SERVICE_${PN} =3D "watchdog.service"
> +
>  do_install_append() {
>  	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog=
.sh
> +	install -d ${D}${systemd_system_unitdir}
> +	install -m 0644 ${WORKDIR}/watchdog*.service ${D}${systemd_system_unitd=
ir}
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};=
 then
> +		install -d ${D}${sysconfdir}/modules-load.d
> +		echo "softdog" > ${D}${sysconfdir}/modules-load.d/softdog.conf
> +		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/*.s=
ervice
> +	fi
>  }
> +
> +FILES_${PN} +=3D "${systemd_system_unitdir}/*"
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

