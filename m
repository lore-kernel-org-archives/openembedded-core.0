Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TtdXi-0003Ts-S9
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 13:17:08 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2013 04:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,451,1355126400"; d="scan'208";a="275791585"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2013 04:01:46 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 11 Jan 2013 12:01:45 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.95]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.213]) with mapi id
	14.01.0355.002; Fri, 11 Jan 2013 12:01:44 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH V3 2/2] connman-conf: configures connman in
	qemu machines
Thread-Index: AQHN7+ny6bFCTbo960KZCJ+LFt75FZhD/XQAgAAJZFA=
Date: Fri, 11 Jan 2013 12:01:44 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161DCD9B@IRSMSX102.ger.corp.intel.com>
References: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
	<1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
	<20130111112730.GM3722@jama.palm1.palmone.com>
In-Reply-To: <20130111112730.GM3722@jama.palm1.palmone.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 2/2] connman-conf: configures connman in qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 12:17:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I think I missed that. Should I resend the patches?

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Friday, January 11, 2013 1:28 PM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 2/2] connman-conf: configures connman in q=
emu machines

On Fri, Jan 11, 2013 at 12:53:38PM +0200, Cristian Iorga wrote:
> For qemu machines, connman should not configure virtual wired=20
> interfaces. Wired interfaces (eth0) are assigned static IP addresses=20
> by the virtual machine manager (qemu). This packages places the eth0=20
> interface in a list of blacklisted interfaces, forbiding connman=20
> administering wired interfaces for qemu machines.

This should be applied before 1/2 which is RRECOMMENDING this.

Cheers,

> Fixes [YOCTO #3227].
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/conf/layer.conf                                 |    1 +
>  meta/conf/machine/include/qemu.inc                   |    2 ++
>  meta/recipes-connectivity/connman/connman-conf.bb    |   18 ++++++++++++=
++++++
>  .../connman/connman-conf/qemuall/main.conf           |    3 +++
>  4 files changed, 24 insertions(+)
>  create mode 100644 meta/recipes-connectivity/connman/connman-conf.bb
>  create mode 100644=20
> meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf index=20
> 78ceae9..3259e5c 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    shadow-securetty \
>    opkg-config-base \
>    netbase \
> +  connman-conf \
>    formfactor \
>    xserver-xf86-config \
>    pointercal \
> diff --git a/meta/conf/machine/include/qemu.inc=20
> b/meta/conf/machine/include/qemu.inc
> index 5d59a7f..c1012ab 100644
> --- a/meta/conf/machine/include/qemu.inc
> +++ b/meta/conf/machine/include/qemu.inc
> @@ -10,6 +10,8 @@ XSERVER ?=3D "xserver-xorg \
> =20
>  MACHINE_FEATURES =3D "apm alsa pcmcia bluetooth irda usbgadget screen"
> =20
> +MACHINEOVERRIDES .=3D ":qemuall"
> +
>  IMAGE_FSTYPES +=3D "tar.bz2 ext3"
> =20
>  ROOT_FLASH_SIZE =3D "280"
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb=20
> b/meta/recipes-connectivity/connman/connman-conf.bb
> new file mode 100644
> index 0000000..7c7ef26
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> @@ -0,0 +1,18 @@
> +#connman config to ignore wired interfaces on qemu machines
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> +
> +SRC_URI_append_qemuall =3D " file://main.conf"
> +
> +PR =3D "r0"
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +do_install() {
> +    #Blacklist ethn network interface in case of qemu* machines
> +    if test -e ${WORKDIR}/main.conf; then
> +        install -d ${D}${sysconfdir}/connman
> +        install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/connman
> +    fi
> +}
> diff --git=20
> a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf=20
> b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
> new file mode 100644
> index 0000000..01973e7
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
> @@ -0,0 +1,3 @@
> +[General]
> +
> +NetworkInterfaceBlacklist =3D eth
> --
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


