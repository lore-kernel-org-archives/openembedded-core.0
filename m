Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qjp6u-0003CP-FU
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:00:00 +0200
Received: by wyg30 with SMTP id 30so773876wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 01:55:53 -0700 (PDT)
Received: by 10.216.175.65 with SMTP id y43mr8350579wel.47.1311238552625;
	Thu, 21 Jul 2011 01:55:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id v11sm696517weq.9.2011.07.21.01.55.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 01:55:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c97e204dcce4690cd83feddaf007f2a625dd4b6f.1311234759.git.kai.kang@windriver.com>
Date: Thu, 21 Jul 2011 10:55:51 +0200
Message-Id: <0957E8E6-D3AD-4886-8397-905C9F85E964@dominion.thruhere.net>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<c97e204dcce4690cd83feddaf007f2a625dd4b6f.1311234759.git.kai.kang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 03/10] openssh: Support PAM
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 09:00:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jul. 2011, om 10:00 heeft Kang Kai het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Adding configuration file "sshd" in /etc/pam.d/ for supporting pam.

Where did this file come from and why isn't openssh providing it on its =
own?

>=20
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> .../openssh/openssh-5.8p2/sshd                     |   10 ++++++++++
> meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    7 +++++--
> 2 files changed, 15 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd =
b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
> new file mode 100644
> index 0000000..4882e58
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
> @@ -0,0 +1,10 @@
> +#%PAM-1.0
> +
> +auth       include      common-auth
> +account    required     pam_nologin.so
> +account    include      common-account
> +password   include      common-password
> +session    optional     pam_keyinit.so force revoke
> +session    include      common-session
> +session    required     pam_loginuid.so
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb =
b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> index e23069c..e0da936 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> @@ -7,7 +7,7 @@ SECTION =3D "console/network"
> LICENSE =3D "BSD"
> LIC_FILES_CHKSUM =3D =
"file://LICENCE;md5=3Dbae9a689be41581503bcf95d8fb42c4e"
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> DEPENDS =3D "zlib openssl"
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', =
d)}"
> @@ -23,6 +23,7 @@ SRC_URI =3D =
"ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
>            file://sshd_config \
>            file://ssh_config \
>            file://init \
> +           file://sshd \
>           "
> SRC_URI[md5sum] =3D "0541579adf9d55abb15ef927048d372e"
> SRC_URI[sha256sum] =3D =
"5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
> @@ -59,7 +60,9 @@ do_compile_append () {
>=20
> do_install_append () {
> 	install -d ${D}${sysconfdir}/init.d
> +	install -d ${D}${sysconfdir}/pam.d
> 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
> +	install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
> 	mv ${D}${bindir}/scp ${D}${bindir}/scp.${PN}
> 	mv ${D}${bindir}/ssh ${D}${bindir}/ssh.${PN}
> 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
> @@ -71,7 +74,7 @@ ALLOW_EMPTY_${PN} =3D "1"
> PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp =
${PN}-misc ${PN}-sftp-server"
> FILES_${PN}-scp =3D "${bindir}/scp.${PN}"
> FILES_${PN}-ssh =3D "${bindir}/ssh.${PN} ${sysconfdir}/ssh/ssh_config"
> -FILES_${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
> +FILES_${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd =
${sysconfdir}/pam.d/sshd"
> FILES_${PN}-sshd +=3D "${sysconfdir}/ssh/moduli =
${sysconfdir}/ssh/sshd_config"
> FILES_${PN}-sftp =3D "${bindir}/sftp"
> FILES_${PN}-sftp-server =3D "${libexecdir}/sftp-server"
> --=20
> 1.7.5.1.300.gc565c
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



