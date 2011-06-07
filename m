Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTqUX-0004Cb-Ex
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:14:21 +0200
Received: by wye20 with SMTP id 20so3829843wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 00:11:04 -0700 (PDT)
Received: by 10.227.55.74 with SMTP id t10mr5901225wbg.91.1307430664301;
	Tue, 07 Jun 2011 00:11:04 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p21sm3336729wbh.23.2011.06.07.00.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 00:11:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307179269-28896-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 7 Jun 2011 09:11:01 +0200
Message-Id: <B699AD72-F61A-4ED5-ADAD-E4A107D9A05F@dominion.thruhere.net>
References: <1307179269-28896-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] sysvinitL split inittab into it's own recipe
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
X-List-Received-Date: Tue, 07 Jun 2011 07:14:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 4 jun 2011, om 11:21 heeft Koen Kooi het volgende geschreven:

> A proper fix for
>=20
> [YOCTO ##1131]
>=20
> Signed-off-by: <koen@dominion.thruhere.net>
> ---
> .../recipes-core/sysvinit/sysvinit-inittab/inittab |   30 +++++++++++
> .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   55 =
++++++++++++++++++++
> meta/recipes-core/sysvinit/sysvinit/inittab        |   30 -----------
> meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   41 =
+--------------
> 4 files changed, 86 insertions(+), 70 deletions(-)
> create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/inittab
> create mode 100644 =
meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> delete mode 100644 meta/recipes-core/sysvinit/sysvinit/inittab
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/inittab =
b/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
> new file mode 100644
> index 0000000..6abbdf4
> --- /dev/null
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab/inittab
> @@ -0,0 +1,30 @@
> +# /etc/inittab: init(8) configuration.
> +# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $
> +
> +# The default runlevel.
> +id:5:initdefault:
> +
> +# Boot-time system configuration/initialization script.
> +# This is run first except when booting in emergency (-b) mode.
> +si::sysinit:/etc/init.d/rcS
> +
> +# What to do in single-user mode.
> +~~:S:wait:/sbin/sulogin
> +
> +# /etc/init.d executes the S and K scripts upon change
> +# of runlevel.
> +#
> +# Runlevel 0 is halt.
> +# Runlevel 1 is single-user.
> +# Runlevels 2-5 are multi-user.
> +# Runlevel 6 is reboot.
> +
> +l0:0:wait:/etc/init.d/rc 0
> +l1:1:wait:/etc/init.d/rc 1
> +l2:2:wait:/etc/init.d/rc 2
> +l3:3:wait:/etc/init.d/rc 3
> +l4:4:wait:/etc/init.d/rc 4
> +l5:5:wait:/etc/init.d/rc 5
> +l6:6:wait:/etc/init.d/rc 6
> +# Normally not reached, but fallthrough in case of emergency.
> +z6:6:respawn:/sbin/sulogin
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb =
b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> new file mode 100644
> index 0000000..4e57b5a
> --- /dev/null
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -0,0 +1,55 @@
> +DESCRIPTION =3D "Inittab for sysvinit"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
> +                    =
file://COPYRIGHT;endline=3D15;md5=3D349c872e0066155e1818b786938876a4"
> +
> +PR =3D "r5"
> +
> +# Need the whole source for the license checks
> +SRC_URI =3D =
"http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${=
PV}.tar.bz2 \
> +           file://inittab"
> +
> +SRC_URI[md5sum] =3D "6eda8a97b86e0a6f59dabbf25202aa6f"
> +SRC_URI[sha256sum] =3D =
"60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
> +
> +S =3D "${WORKDIR}/sysvinit-${PV}"
> +
> +do_install() {
> +	install -d ${D}${sysconfdir}
> +    install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> +    if [ ! -z "${SERIAL_CONSOLE}" ]; then
> +        echo "S:2345:respawn:${base_sbindir}/getty ${SERIAL_CONSOLE}" =
>> ${D}${sysconfdir}/inittab
> +    fi
> +    if [ "${USE_VT}" =3D "1" ]; then
> +        cat <<EOF >>${D}${sysconfdir}/inittab
> +# ${base_sbindir}/getty invocations for the runlevels.
> +#
> +# The "id" field MUST be the same as the last
> +# characters of the device (after "tty").
> +#
> +# Format:
> +#  <id>:<runlevels>:<action>:<process>
> +#
> +
> +EOF
> +
> +        for n in ${SYSVINIT_ENABLED_GETTYS}
> +        do
> +            echo "$n:2345:respawn:${base_sbindir}/getty 38400 tty$n" =
>> ${D}${sysconfdir}/inittab
> +        done
> +        echo "" >> ${D}${sysconfdir}/inittab
> +    fi
> +}
> +
> +# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE =
.conf.
> +# Set PACKAGE_ARCH appropriately.
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +FILES_${PN} =3D "${sysconfdir}/inittab"
> +CONFFILES_${PN} =3D "${sysconfdir}/inittab"
> +
> +USE_VT ?=3D "1"
> +SYSVINIT_ENABLED_GETTYS ?=3D "1"
> +
> +
> +
> diff --git a/meta/recipes-core/sysvinit/sysvinit/inittab =
b/meta/recipes-core/sysvinit/sysvinit/inittab
> deleted file mode 100644
> index 6abbdf4..0000000
> --- a/meta/recipes-core/sysvinit/sysvinit/inittab
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -# /etc/inittab: init(8) configuration.
> -# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $
> -
> -# The default runlevel.
> -id:5:initdefault:
> -
> -# Boot-time system configuration/initialization script.
> -# This is run first except when booting in emergency (-b) mode.
> -si::sysinit:/etc/init.d/rcS
> -
> -# What to do in single-user mode.
> -~~:S:wait:/sbin/sulogin
> -
> -# /etc/init.d executes the S and K scripts upon change
> -# of runlevel.
> -#
> -# Runlevel 0 is halt.
> -# Runlevel 1 is single-user.
> -# Runlevels 2-5 are multi-user.
> -# Runlevel 6 is reboot.
> -
> -l0:0:wait:/etc/init.d/rc 0
> -l1:1:wait:/etc/init.d/rc 1
> -l2:2:wait:/etc/init.d/rc 2
> -l3:3:wait:/etc/init.d/rc 3
> -l4:4:wait:/etc/init.d/rc 4
> -l5:5:wait:/etc/init.d/rc 5
> -l6:6:wait:/etc/init.d/rc 6
> -# Normally not reached, but fallthrough in case of emergency.
> -z6:6:respawn:/sbin/sulogin
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb =
b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index e683cc7..bda8a51 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -5,31 +5,15 @@ SECTION =3D "base"
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
>                     =
file://COPYRIGHT;endline=3D15;md5=3D349c872e0066155e1818b786938876a4"
> -PR =3D "r3"
> -
> -# Need to set this since it has machine specific components
> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> -
> -# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE =
.conf.
> -# Set PACKAGE_ARCH appropriately.
> -PACKAGE_ARCH_${PN}-inittab =3D "${MACHINE_ARCH}"
> +PR =3D "r4"
>=20
> RDEPENDS_${PN} =3D "${PN}-inittab"
>=20
> -PACKAGES =3D+ "bootlogd ${PN}-inittab"
> -FILES_bootlogd =3D "/etc/init.d/bootlogd /etc/init.d/stop-bootlogd =
/etc/rc?.d/S*bootlogd /sbin/bootlogd"
> -FILES_${PN}-inittab =3D "${sysconfdir}/inittab"
> -CONFFILES_${PN}-inittab =3D "${sysconfdir}/inittab"
> -
> -USE_VT ?=3D "1"
> -SYSVINIT_ENABLED_GETTYS ?=3D "1"
> -
> SRC_URI =3D =
"http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvinit-${=
PV}.tar.bz2 \
> 	   file://install.patch \
> 	   file://crypt-lib.patch \
>            file://need \
>            file://provide \
> -           file://inittab \
>            file://rcS-default \
>            file://rc \
>            file://rcS \
> @@ -70,29 +54,6 @@ do_install () {
> 	install -d ${D}${sysconfdir} \
> 		   ${D}${sysconfdir}/default \
> 		   ${D}${sysconfdir}/init.d
> -	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
> -	if [ ! -z "${SERIAL_CONSOLE}" ]; then
> -		echo "S:2345:respawn:${base_sbindir}/getty =
${SERIAL_CONSOLE}" >> ${D}${sysconfdir}/inittab
> -	fi
> -	if [ "${USE_VT}" =3D "1" ]; then
> -		cat <<EOF >>${D}${sysconfdir}/inittab
> -# ${base_sbindir}/getty invocations for the runlevels.
> -#
> -# The "id" field MUST be the same as the last
> -# characters of the device (after "tty").
> -#
> -# Format:
> -#  <id>:<runlevels>:<action>:<process>
> -#
> -
> -EOF
> -
> -		for n in ${SYSVINIT_ENABLED_GETTYS}
> -		do
> -			echo "$n:2345:respawn:${base_sbindir}/getty =
38400 tty$n" >> ${D}${sysconfdir}/inittab
> -		done
> -		echo "" >> ${D}${sysconfdir}/inittab
> -	fi
> 	install -m 0644    ${WORKDIR}/rcS-default	=
${D}${sysconfdir}/default/rcS
> 	install -m 0755    ${WORKDIR}/rc		=
${D}${sysconfdir}/init.d
> 	install -m 0755    ${WORKDIR}/rcS		=
${D}${sysconfdir}/init.d
> --=20
> 1.6.6.1
>=20



