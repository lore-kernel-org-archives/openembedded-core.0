Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E485578288
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6977A184A1;
	Fri,  9 Jun 2017 11:41:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id sPSC4YruItwp; Fri,  9 Jun 2017 11:41:25 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id B95911832C;
	Fri,  9 Jun 2017 11:41:25 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A609A1E07C;
	Fri,  9 Jun 2017 11:41:25 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FD701E077;
	Fri,  9 Jun 2017 11:41:25 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  9 Jun 2017 11:41:25 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 8390B2BDE;
	Fri,  9 Jun 2017 11:41:25 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 9 Jun 2017 11:41:25 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Fri, 9 Jun 2017 11:41:25 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: David Vincent <freesilicon@gmail.com>
Thread-Topic: [OE-core] [PATCH RESEND 1/3] openssh: Package server
	configuration
Thread-Index: AQHS4O7JDBFx3R46YUixARiHei+t4aIcPeMA
Date: Fri, 9 Jun 2017 09:41:25 +0000
Message-ID: <45a1aae1e696405fa99267c23ba63fcf@XBOX02.axis.com>
References: <20170609070429.17376-1-freesilicon@gmail.com>
	<20170609070429.17376-2-freesilicon@gmail.com>
In-Reply-To: <20170609070429.17376-2-freesilicon@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND 1/3] openssh: Package server configuration
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
X-List-Received-Date: Fri, 09 Jun 2017 09:41:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> David Vincent
> Sent: den 9 juni 2017 09:04
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH RESEND 1/3] openssh: Package server
> configuration
>=20
> Split sshd configuration for read-write/read-only rootfs in two
> distinct
> packages. Also, add a package dependency between openssh-sshd package
> and a provider of sshd-config.
>=20
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 51
> ++++++++++++++++++----
>  1 file changed, 42 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> index 5b96745aae..e22e6c672d 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> @@ -91,13 +91,17 @@ do_compile_ptest() {
>  }
>=20
>  do_install_append () {
> -	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> +	# Create default config files
> +	install -m 0644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh=
/sshd_config_default
> +	rm -f ${D}${sysconfdir}/ssh/sshd_config
> +
> +	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" =
=3D "pam" ]; then
>  		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
> -		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
> +		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config=
_default
>  	fi
>=20
> -	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
> -		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/s=
sh/sshd_config
> +	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" =
=3D "x11" ]; then
> +		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/s=
sh/sshd_config_default
>  	fi

Instead of all the changes above you could just do this here instead:

	mv ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/sshd_config_def=
ault

>  	install -d ${D}${sysconfdir}/init.d
> @@ -110,7 +114,7 @@ do_install_append () {
>=20
>  	# Create config files for read-only rootfs
>  	install -d ${D}${sysconfdir}/ssh

Creating the directory here again is unnecessary.

> -	install -m 644 ${D}${sysconfdir}/ssh/sshd_config ${D}${sysconfdir}/ssh/=
sshd_config_readonly
> +	install -m 644 ${D}${sysconfdir}/ssh/sshd_config_default ${D}${sysconfd=
ir}/ssh/sshd_config_readonly
>  	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
>  	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/s=
shd_config_readonly
>  	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/s=
shd_config_readonly
> @@ -134,30 +138,59 @@ do_install_ptest () {
>=20
>  ALLOW_EMPTY_${PN} =3D "1"
>=20
> -PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${=
PN}-misc ${PN}-sftp-server"
> +PACKAGES =3D+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd-config ${PN}-=
sshd-config-readonly ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
>  FILES_${PN}-scp =3D "${bindir}/scp.${BPN}"
>  FILES_${PN}-ssh =3D "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
> +FILES_${PN}-sshd-config =3D "${sysconfdir}/ssh/sshd_config_default"
> +FILES_${PN}-sshd-config-readonly =3D "${sysconfdir}/ssh/sshd_config_read=
only"
>  FILES_${PN}-sshd =3D "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${system=
d_unitdir}/system"
> -FILES_${PN}-sshd +=3D "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_c=
onfig ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatile=
s/99_sshd ${sysconfdir}/pam.d/sshd"
> +FILES_${PN}-sshd +=3D "${sysconfdir}/ssh/moduli ${sysconfdir}/default/vo=
latiles/99_sshd ${sysconfdir}/pam.d/sshd"
>  FILES_${PN}-sftp =3D "${bindir}/sftp"
>  FILES_${PN}-sftp-server =3D "${libexecdir}/sftp-server"
>  FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ssh*"
>  FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
>=20
>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> -RDEPENDS_${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.contains('DISTRO_FEAT=
URES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> +RDEPENDS_${PN}-sshd +=3D "${PN}-keygen sshd-config ${@bb.utils.contains(=
'DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}=
"
>  RDEPENDS_${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
>=20
>  RPROVIDES_${PN}-ssh =3D "ssh"
> +RPROVIDES_${PN}-sshd-config =3D "sshd-config"
> +RPROVIDES_${PN}-sshd-config-readonly =3D "sshd-config"
>  RPROVIDES_${PN}-sshd =3D "sshd"
>=20
>  RCONFLICTS_${PN} =3D "dropbear"
> +RCONFLICTS_${PN}-sshd-config =3D "${PN}-sshd-config-readonly"
> +RCONFLICTS_${PN}-sshd-config-readonly =3D "${PN}-sshd-config"
>  RCONFLICTS_${PN}-sshd =3D "dropbear"
>  RCONFLICTS_${PN}-keygen =3D "ssh-keygen"
>=20
> -CONFFILES_${PN}-sshd =3D "${sysconfdir}/ssh/sshd_config"
> +CONFFILES_${PN}-sshd-config =3D "${sysconfdir}/ssh/sshd_config_default"
> +CONFFILES_${PN}-sshd-config-readonly =3D "${sysconfdir}/ssh/sshd_config_=
readonly"
>  CONFFILES_${PN}-ssh =3D "${sysconfdir}/ssh/ssh_config"
>=20
> +pkg_postinst_${PN}-sshd-config () {
> +#!/bin/sh
> +if [ -e $D${sysconfdir}/ssh/sshd_config ]; then
> +    rm $D${sysconfdir}/ssh/sshd_config
> +fi
> +
> +# Make sure destination directory exists, before creating the symlink
> +mkdir -p $D${sysconfdir}/ssh
> +ln -s sshd_config_default $D${sysconfdir}/ssh/sshd_config
> +}
> +
> +pkg_postinst_${PN}-sshd-config-readonly () {
> +#!/bin/sh
> +if [ -e $D${sysconfdir}/ssh/sshd_config ]; then
> +    rm $D${sysconfdir}/ssh/sshd_config
> +fi
> +
> +# Make sure destination directory exists, before creating the symlink
> +mkdir -p $D${sysconfdir}/ssh
> +ln -s sshd_config_readonly $D${sysconfdir}/ssh/sshd_config
> +}
> +

I do not like changing /etc/ssh/sshd_config to be a link. I know at least=20
we have our own rootfs-postcommands that will be affected by such a change.

How about you use a PACKAGESPLITFUNCS function instead and move the files=20
back into place before they are packaged, so that both configuration=20
packages contain the /etc/ssh/sshd_config file.

Something like this should work (totally untested):

PACKAGESPLITFUNCS +=3D "restore_sshd_config"

restore_sshd_config() {
	for file in ${PKGDEST}/*${sysconfdir}/sshd/sshd_config_*; do
		mv $file ${file%_*}
	done
}

>  ALTERNATIVE_PRIORITY =3D "90"
>  ALTERNATIVE_${PN}-scp =3D "scp"
>  ALTERNATIVE_${PN}-ssh =3D "ssh"
> --
> 2.13.0

//Peter


