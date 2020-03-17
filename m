Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 89D9760234
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=4107; q=dns/txt; s=axis-central1;
	t=1584467232; x=1616003232;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=Lo+Iv0Kq9SR5tmS/e1AS8slm0+7Iw4WpyeFPIfHkSV4=;
	b=mLIRPi8oeHu+nupIliu8ukLsz8QdejRYRdrB+YxJlhJ4OmvJrgODWS9W
	aVmy/K4+1ipEbrbk3m1Jexsof1CVNteyDqfQ4YqaEAPS+b9RrgyqaAd2A
	+Q3591L/7zlp6SCupYYMfp+16IhRYZzX6QSF0doCNPicoe5kQx+YhPMeW
	J4TJ59XUDzPIAHqQZ7NKjMOtNMKe2X4idBrqXoTPZqjMseWnq7FBjn0o7
	nYpihAEXSiS9j0SogSwS7BuxJ6oxYDV8xyNLMLpi4tyTEfEcm73FxQ/7p
	Fs3rP96o76DoMHKPfivx0I3mlxG6iZrafdfAOoHcNX2gotD0zoocEsZFb A==;
IronPort-SDR: 66RZesgWbQxs1xvSVyJRegVoh4yUiNW/bxaqcShCgsE6JMEcrcwhMKbS0rihGFH65z41ZTDXFG
	al53mS8niLQ36+rFK+Y03RzfqGzqKq3KUmz+GrkXz4mjbOdk6mTTqW5uWQrWM+PJFUBiqGAt7m
	2C5+UXVy0QLWZ3VV5gyP/pejqZa//zmKCfdfqgAxJchSC7yhUO07322zNTrU/rtaA7dQjibRyI
	BROPlS5N0/a3JtrHt26+l363AH4SP3Ef2yy1jf8/Jgnsfk5dgW3vYoC0IHHHJDjEYD+cuWCSiR
	PHQ=
X-IronPort-AV: E=Sophos;i="5.70,565,1574118000"; 
   d="scan'208";a="6427158"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alex Kiernan <alex.kiernan@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [OE-Core][RFC PATCH 04/11] systemd: Add PACKAGECONFIG
	for	sysvinit
Thread-Index: AQHV/HDauPPk90VBz0y/hZ9wdhbUsahNDeHQ
Date: Tue, 17 Mar 2020 17:47:10 +0000
Message-ID: <4ba6a14e42f541488dd004804f13be73@XBOX03.axis.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-5-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-5-alex.kiernan@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: [RFC PATCH 04/11] systemd: Add PACKAGECONFIG for	sysvinit
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
X-List-Received-Date: Tue, 17 Mar 2020 17:47:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Alex Kiernan
> Sent: den 17 mars 2020 16:23
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [OE-Core][RFC PATCH 04/11] systemd: Add PACKAGECONFIG
> for sysvinit
>=20
> Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
> then disables all sysvinit handling in systemd if it isn't present.
>=20
> Consolidate sysvinit handling so that when it's disabled we exclude all
> sysvinit features.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/recipes-core/systemd/systemd_244.3.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-co=
re/systemd/systemd_244.3.bb
> index b26f3cb72d2b..7c33bde21a39 100644
> --- a/meta/recipes-core/systemd/systemd_244.3.bb
> +++ b/meta/recipes-core/systemd/systemd_244.3.bb
> @@ -56,7 +56,7 @@ PAM_PLUGINS =3D " \
>  "
>=20
>  PACKAGECONFIG ??=3D " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrm=
erge polkit', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux sysv=
init usrmerge polkit', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} =
\
>      acl \
> @@ -165,6 +165,7 @@ PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dseccom=
p=3Dfalse,libseccomp"
>  PACKAGECONFIG[selinux] =3D "-Dselinux=3Dtrue,-Dselinux=3Dfalse,libselinu=
x,initscripts-sushell"
>  PACKAGECONFIG[smack] =3D "-Dsmack=3Dtrue,-Dsmack=3Dfalse"
>  PACKAGECONFIG[sysusers] =3D "-Dsysusers=3Dtrue,-Dsysusers=3Dfalse"
> +PACKAGECONFIG[sysvinit] =3D "-Dsysvinit-path=3D${sysconfdir}/init.d -Dsy=
svrcnd-path=3D${sysconfdir},-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
>  # When enabled use reproducble build timestamp if set as time epoch,
>  # or build time if not. When disabled, time epoch is unset.
>  def build_epoch(d):
> @@ -198,7 +199,6 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dnobody-group=3Dnobody \
>                    -Drootlibdir=3D${rootlibdir} \
>                    -Drootprefix=3D${rootprefix} \
> -                  -Dsysvrcnd-path=3D${sysconfdir} \
>                    -Ddefault-locale=3DC \
>                    "
>=20
> @@ -234,6 +234,7 @@ do_install() {
>  		install -d ${D}${sysconfdir}/init.d
>  		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
>  		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${syscon=
fdir}/init.d/systemd-udevd
> +		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}=
${systemd_unitdir}/systemd-sysv-install
>  	fi
>=20
>  	chown root:systemd-journal ${D}/${localstatedir}/log/journal
> @@ -273,7 +274,6 @@ do_install() {
>  		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../ru=
n/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>  		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf=
.systemd
>  	fi
> -	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}$=
{systemd_unitdir}/systemd-sysv-install
>=20
>  	# If polkit is setup fixup permissions and ownership
>  	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}=
; then
> @@ -560,7 +560,8 @@ FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${=
datadir}/dbus-1/interfaces/ $
>=20
>  RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev (=
=3D ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
>  RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty=
-generator', '', 'systemd-serialgetty', d)}"
> -RDEPENDS_${PN} +=3D "volatile-binds update-rc.d"
> +RDEPENDS_${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',=
 'update-rc.d', '', d)}"

Move the dependency on update-rc.d up to the sysvinit PACKAGECONFIG.

> +RDEPENDS_${PN} +=3D "volatile-binds"
>=20
>  RRECOMMENDS_${PN} +=3D "systemd-extra-utils \
>                        systemd-compat-units udev-hwdb \
> --
> 2.17.1

//Peter


