Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3021D771E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:31:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A2VF4m010235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 19:31:15 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.25]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0248.002;
	Tue, 9 Aug 2016 19:31:15 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][v3] watchdog: enable systemd support
Thread-Index: AQHR3l9ZZyS+5LMoFEyFU4MImj2/yqBBoYBQ
Date: Wed, 10 Aug 2016 02:31:14 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131030CE1@ALA-MBA.corp.ad.wrs.com>
References: <1468562855-7389-1-git-send-email-jackie.huang@windriver.com>
In-Reply-To: <1468562855-7389-1-git-send-email-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.143]
MIME-Version: 1.0
Subject: Re: [PATCH][v3] watchdog: enable systemd support
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
X-List-Received-Date: Wed, 10 Aug 2016 02:31:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Friday, July 15, 2016 2:08 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH][v3] watchdog: enable systemd support
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
> index ee1a893..ac2ee5c 100644
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
> +		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.s=
ervice

This should be ${ systemd_system_unitdir} as well, I will change and send v=
4.

Thanks,
Jackie

> +	fi
>  }
> +
> +FILES_${PN} +=3D "${systemd_system_unitdir}/*"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

