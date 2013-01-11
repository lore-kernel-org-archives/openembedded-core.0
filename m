Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ttd0T-0002Ys-9f
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 12:42:41 +0100
Received: by mail-pa0-f49.google.com with SMTP id bi1so971960pad.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 03:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=H1ttIBDVKOHrCQLBHPHZPg7Y2wz+6xrRZ7sj7fR+hjc=;
	b=OxO/yzecUc7bz5vG9IKB2haUl5N53+3ovymuiIHmsrs6Xm0NGRZdPJ+gBxuXx7A2Bh
	hw/rU0nJqQp12J7O/K6kHam9LRdzuLQ+xsLIIw847QdpOCm+VQQOk+qEp9sV+MUan04b
	3lmO/QHzKV53M9rXg2IgroCoJMG00M5jPSk8CcS/wAo1/kNtS0SvZmt40gRf2q2qyt1v
	ACfSvxsmpjpg9shErU/RBXEsGn+/4K9+CCgLyKlZ6F/5c68s+vuyx5TR5QXReEcdkWjx
	vQbilGnwdvn+HaD5+I+NeYUOQuCA2YAa9I2qbgxudmgXgmKpAzfzH0+OwDibJwZwGDI4
	4bDg==
X-Received: by 10.68.117.145 with SMTP id ke17mr31012989pbb.52.1357903645706; 
	Fri, 11 Jan 2013 03:27:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id m3sm2958493pav.4.2013.01.11.03.27.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 03:27:24 -0800 (PST)
Date: Fri, 11 Jan 2013 12:27:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20130111112730.GM3722@jama.palm1.palmone.com>
References: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
	<1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 11 Jan 2013 11:42:51 -0000
X-Groupsio-MsgNum: 33706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aXXwKK8cHQSbFLNd"
Content-Disposition: inline

--aXXwKK8cHQSbFLNd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2013 at 12:53:38PM +0200, Cristian Iorga wrote:
> For qemu machines, connman should not configure
> virtual wired interfaces. Wired interfaces (eth0)
> are assigned static IP addresses by the virtual machine
> manager (qemu). This packages places the eth0 interface in
> a list of blacklisted interfaces, forbiding connman
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
>  create mode 100644 meta/recipes-connectivity/connman/connman-conf/qemual=
l/main.conf
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 78ceae9..3259e5c 100644
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
> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/inclu=
de/qemu.inc
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
> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/rec=
ipes-connectivity/connman/connman-conf.bb
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
> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/main.=
conf b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
> new file mode 100644
> index 0000000..01973e7
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/main.conf
> @@ -0,0 +1,3 @@
> +[General]
> +
> +NetworkInterfaceBlacklist =3D eth
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aXXwKK8cHQSbFLNd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDv9yIACgkQN1Ujt2V2gBys+wCfchs+8CHoHQyeQZEbptlWE3D4
gmYAoIzgaqqb5jmNyrM0yuB4akyNdYKX
=3cak
-----END PGP SIGNATURE-----

--aXXwKK8cHQSbFLNd--
