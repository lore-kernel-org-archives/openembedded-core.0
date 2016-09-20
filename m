Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2B9160248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 00:51:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K0q0sJ018573
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 17:52:00 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.129]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 19 Sep 2016 17:52:00 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][v5] watchdog: enable systemd support
Thread-Index: AQHSDLURZiO7915HukyJQwo41aJtQKCBmOFQ
Date: Tue, 20 Sep 2016 00:51:57 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2D241A@ALA-MBA.corp.ad.wrs.com>
References: <20160912050038.1077-1-jackie.huang@windriver.com>
In-Reply-To: <20160912050038.1077-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Subject: Re: [PATCH][v5] watchdog: enable systemd support
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
X-List-Received-Date: Tue, 20 Sep 2016 00:52:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
> Sent: Monday, September 12, 2016 1:01 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH][v5] watchdog: enable systemd support
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. inherit systemd, and add two unit files which are from Fedora 23
> 2. auto load soft dog kernel module
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../watchdog/watchdog/watchdog-ping.service           | 11 +++++++++++
>  .../watchdog/watchdog/watchdog.service                | 11 +++++++++++
>  meta/recipes-extended/watchdog/watchdog_5.15.bb       | 19 +++++++++++++=
++++--
>  3 files changed, 39 insertions(+), 2 deletions(-)
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
> index cedfc04..826e31f 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> @@ -13,6 +13,8 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${=
PV}.tar.gz \
>             file://watchdog-init.patch \
>             file://watchdog-conf.patch \
>             file://wd_keepalive.init \
> +           file://watchdog-ping.service \
> +           file://watchdog.service \
>  "
>=20
>  SRC_URI[md5sum] =3D "678c32f6f35a0492c9c1b76b4aa88828"
> @@ -22,7 +24,7 @@ UPSTREAM_CHECK_URI =3D
> "http://sourceforge.net/projects/watchdog/files/watchdog/"
>  UPSTREAM_CHECK_REGEX =3D "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>=20
>  inherit autotools
> -inherit update-rc.d
> +inherit update-rc.d systemd
>=20
>  DEPENDS_append_libc-musl =3D " libtirpc "
>  CFLAGS_append_libc-musl =3D " -I${STAGING_INCDIR}/tirpc "
> @@ -37,16 +39,29 @@ INITSCRIPT_PARAMS_${PN} =3D "start 15 1 2 3 4 5 . sto=
p 85 0 6 ."
>  INITSCRIPT_NAME_${PN}-keepalive =3D "wd_keepalive"
>  INITSCRIPT_PARAMS_${PN}-keepalive =3D "start 15 1 2 3 4 5 . stop 85 0 6 =
."
>=20
> +SYSTEMD_SERVICE_${PN} =3D "watchdog.service"
> +
>  do_install_append() {
> -	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog=
.sh
> +    install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watch=
dog.sh
>      install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init=
.d/wd_keepalive
>=20
>      # watchdog.conf is provided by the watchdog-config recipe
>      rm ${D}${sysconfdir}/watchdog.conf
> +
> +    install -d ${D}${systemd_system_unitdir}
> +    install -m 0644 ${WORKDIR}/watchdog*.service ${D}${systemd_system_un=
itdir}
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
> +        install -d ${D}${sysconfdir}/modules-load.d
> +        echo "softdog" > ${D}${sysconfdir}/modules-load.d/softdog.conf
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdi=
r}/*.service
> +    fi
>  }
>=20
>  PACKAGES =3D+ "${PN}-keepalive"
>=20
> +FILES_${PN} +=3D "${systemd_system_unitdir}/*"
> +
>  FILES_${PN}-keepalive =3D " \
>      ${sysconfdir}/init.d/wd_keepalive \
>      ${sbindir}/wd_keepalive \
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

