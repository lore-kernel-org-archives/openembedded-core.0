Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 242576A8E4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:39:23 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1UwTSF-0003iI-Uy from Noor_Ahsan@mentor.com ;
	Tue, 09 Jul 2013 01:39:23 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 9 Jul 2013 01:39:24 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.02.0247.003; Tue, 9 Jul 2013 09:39:22 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] lighttpd: Add systemd support.
Thread-Index: AQHOfBCNG1j1zHWGREGlRqJ06uBDU5lcB2Mw
Date: Tue, 9 Jul 2013 08:39:21 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE4D3CE6@EU-MBX-01.mgc.mentorg.com>
References: <1373033018-20615-1-git-send-email-noor_ahsan@mentor.com>
	<51DB1173.3080804@linux.intel.com>
In-Reply-To: <51DB1173.3080804@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 09 Jul 2013 08:39:24.0203 (UTC)
	FILETIME=[D08EBFB0:01CE7C7F]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lighttpd: Add systemd support.
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
X-List-Received-Date: Tue, 09 Jul 2013 08:39:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have fixed it and sent another patch.

Noor

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, July 09, 2013 12:22 AM
To: Ahsan, Noor
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] lighttpd: Add systemd support.

On 07/05/2013 07:03 AM, Noor, Ahsan wrote:
> From: Noor <noor_ahsan@mentor.com>
>
> * Enable lighttpd with systemd support.
> * Replace the hardcoded paths with sbindir, sysconfdir and base_bindir
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
>   .../lighttpd/files/lighttpd.service                |   12 ++++++++++
>   meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb  |   24 +++++++++++++=
+++----
>   2 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/lighttpd/files/lighttpd.service=20
> b/meta/recipes-extended/lighttpd/files/lighttpd.service
> new file mode 100644
> index 0000000..a5333b6
> --- /dev/null
> +++ b/meta/recipes-extended/lighttpd/files/lighttpd.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=3DLightning Fast Webserver With Light System Requirements=20
> +After=3Dnetwork.target
> +
> +[Service]
> +ExecStartPre=3D/usr/sbin/lighttpd -t -f /etc/lighttpd.conf=20
> +ExecStart=3D/usr/sbin/lighttpd -D -f /etc/lighttpd.conf=20
> +ExecReload=3D/bin/kill -HUP $MAINPID
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb=20
> b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> index df6ce97..3c03938 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> @@ -22,6 +22,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/rele=
ases-1.4.x/lighttpd-${PV}.t
>           file://index.html.lighttpd \
>           file://lighttpd.conf \
>           file://lighttpd \
> +        file://lighttpd.service \
>           "
>
>   SRC_URI[md5sum] =3D "8e2d4ae8e918d4de1aeb9842584d170b"
> @@ -39,19 +40,34 @@ EXTRA_OECONF =3D " \
>                --disable-static \
>   "
>
> -inherit autotools pkgconfig update-rc.d gettext
> +inherit autotools pkgconfig update-rc.d gettext systemd
>
>   INITSCRIPT_NAME =3D "lighttpd"
>   INITSCRIPT_PARAMS =3D "defaults 70"
>
> +SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +
>   do_install_append() {
> -    install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav=
 ${D}/www/var
> -    install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
> +
> +    install -d ${D}${sysconfdir} ${D}/www/logs ${D}/www/pages/dav=20
> + ${D}/www/var
>       install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
>       install -m 0644 ${WORKDIR}/index.html.lighttpd=20
> ${D}/www/pages/index.html
> +    if=20
> + ${@base_contains('DISTRO_FEATURES','sysvinit','true','false',d)};=20
> + then
I am not sure this is the best way as it may be possible to have both sysvi=
nit and systemd in DISTRO_FEATURES.  I think it would be better to test for=
 each individually and install based on that.

Sau!

> +        install -d ${D}${sysconfdir}/init.d
> +        install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
> +    else
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdi=
r}/system
> +        sed -i 's!/usr/sbin!${sbindir}!g' ${D}${systemd_unitdir}/system/=
lighttpd.service
> +        sed -i 's!/etc!${sysconfdir}!g' ${D}${systemd_unitdir}/system/li=
ghttpd.service
> +        sed -i 's!/bin!${base_bindir}!g' ${D}${systemd_unitdir}/system/l=
ighttpd.service
> +    fi
> +
>   }
>
> -FILES_${PN} +=3D "${sysconfdir} /www"
> +FILES_${PN} +=3D "${sysconfdir} /www ${systemd_unitdir}"
>
>   CONFFILES_${PN} =3D "${sysconfdir}/lighttpd.conf"
>
>

