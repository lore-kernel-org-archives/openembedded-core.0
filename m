Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57BFB607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 16:44:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Jul 2016 09:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,440,1464678000"; 
	d="asc'?scan'208";a="1031601798"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2016 09:44:05 -0700
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
References: <1469518399-22052-1-git-send-email-mingli.yu@windriver.com>
	<1469518399-22052-2-git-send-email-mingli.yu@windriver.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <579B87FF.4050704@linux.intel.com>
Date: Fri, 29 Jul 2016 11:44:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1469518399-22052-2-git-send-email-mingli.yu@windriver.com>
Subject: Re: [PATCH 1/2] busybox: fix for syslog service in systemd
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
X-List-Received-Date: Fri, 29 Jul 2016 16:44:08 -0000
X-Groupsio-MsgNum: 85132
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="JGImnEjhiWGfsO8NdhUxBtAcQlUSPkwbJ"

--JGImnEjhiWGfsO8NdhUxBtAcQlUSPkwbJ
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/26/2016 02:33 AM, mingli.yu@windriver.com wrote:
> This patch includes the following changes:
> 1. Explicitly set StandardOutput of the log daemon to null.
>    This would avoid creating a feedback loop of the syslog service.
>    See link below for more information.
>    http://www.freedesktop.org/wiki/Software/systemd/syslog/
>=20
> 2. Use ALTERNATIVE machanism to manage the syslog service file.
>    This is because that other package may also provide a syslog
>    implementation.
>=20
> 3. Make the syslog daemon socket activated only. Otherwise, things
>    would crash if we install busybox-syslog and other syslog packages
>    together in one image.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-core/busybox/busybox.inc                     | 9 +++++++-=
-
>  meta/recipes-core/busybox/files/busybox-klogd.service.in  | 4 +---
>  meta/recipes-core/busybox/files/busybox-syslog.service.in | 7 +++----
>  3 files changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/=
busybox/busybox.inc
> index 5e91a26..2865b36 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -295,13 +295,12 @@ do_install () {
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false'=
,d)}; then
>          if grep -q "CONFIG_SYSLOGD=3Dy" ${B}/.config; then
>              install -d ${D}${systemd_unitdir}/system
> -            sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/busy=
box-syslog.service.in \
> +            sed -e 's,@base_sbindir@,${base_sbindir},g' -e 's,@SYSCONF=
DIR@,${sysconfdir},g' < ${WORKDIR}/busybox-syslog.service.in \
>  		> ${D}${systemd_unitdir}/system/busybox-syslog.service
>              if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
>  		install -d ${D}${sysconfdir}/default
>  		install -m 0644 ${WORKDIR}/busybox-syslog.default ${D}${sysconfdir}/=
default/busybox-syslog
>              fi
> -            ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.serv=
ice
>          fi
>          if grep -q "CONFIG_KLOGD=3Dy" ${B}/.config; then
>              install -d ${D}${systemd_unitdir}/system
> @@ -338,6 +337,12 @@ python () {
>          d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-c=
onf')
>          d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '=
%s/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
>          d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/=
syslog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', =
True)))
> +
> +    if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d)=
:
> +        pn =3D d.getVar('PN', True)
> +        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-service')=

> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/sy=
stemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
> +        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/syste=
m/busybox-syslog.service' % (d.getVar('systemd_unitdir', True)))
>  }
> =20
>  python do_package_prepend () {
> diff --git a/meta/recipes-core/busybox/files/busybox-klogd.service.in b=
/meta/recipes-core/busybox/files/busybox-klogd.service.in
> index d7c7755..90cfc50 100644
> --- a/meta/recipes-core/busybox/files/busybox-klogd.service.in
> +++ b/meta/recipes-core/busybox/files/busybox-klogd.service.in
> @@ -3,6 +3,4 @@ Description=3DKernel Logging Service
> =20
>  [Service]
>  ExecStart=3D@base_sbindir@/klogd -n
> -
> -[Install]
> -WantedBy=3Dmulti-user.target

Hi Mingil,

This commit breaks the build when was tested in master-next [1],
i guess you are trying to use another syslog service in busybox images
but when you disable busybox-syslog for start by default (line below)
the sanity testing fails.

[1]
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/bui=
lds/868/steps/Running%20Sanity%20Tests/logs/stdio

> +StandardOutput=3Dnull
> diff --git a/meta/recipes-core/busybox/files/busybox-syslog.service.in =
b/meta/recipes-core/busybox/files/busybox-syslog.service.in
> index 2e04321..c84edaf 100644
> --- a/meta/recipes-core/busybox/files/busybox-syslog.service.in
> +++ b/meta/recipes-core/busybox/files/busybox-syslog.service.in
> @@ -1,13 +1,12 @@
>  [Unit]
>  Description=3DSystem Logging Service
>  Wants=3Dbusybox-klogd.service
> +Requires=3Dsyslog.socket
> =20
>  [Service]
> -EnvironmentFile=3D-/etc/default/busybox-syslog
> +EnvironmentFile=3D-@SYSCONFDIR@/default/busybox-syslog
>  ExecStart=3D@base_sbindir@/syslogd -n $OPTIONS
> -Sockets=3Dsyslog.socket
> +StandardOutput=3Dnull
> =20
>  [Install]
> -WantedBy=3Dmulti-user.target

The same here,

Kind regards,
	alimon
>  Also=3Dbusybox-klogd.service
> -Alias=3Dsyslog.service
>=20


--JGImnEjhiWGfsO8NdhUxBtAcQlUSPkwbJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJXm4gBAAoJEGJqcE9h3glgSRoP/3yVdyc2adiuaOePYCDM9D17
oeAiT4VeNryztmJjQBS90cHRXmB1tX7G/V7kKKuqRYgLFqbbtCHWUcsfUkkhg5Xx
RjssnH4LD1cBWOazdsVBB6qz7Zuvi1sGu9EwzimZqxWoq9aHQ8mzSLCV2oIEml8c
W2kcXpqfEDESD4lQ81Oa6sO2aOMQAOjy+hIzkqxldQg3sKfm4HOIaKKDQ0aDWxKY
smWo9QXz6hybTh+Tgch2+5rmg48qO76dcCPQSAD8N4glFT2IpC3Jl/Dn9AEojm52
tyVZgxFFiZXsO6I2VS50J/zgNlQCxu9+LQUXFc9wJzNPWWJp3dwf2sBiJT9Dsdfp
tuHXpYAFa7lTxJqV11i2Yzzxifeu35WU+TCVQ25Avu4dMZxXH1GUbvvRheV/8CoU
OAjNi7MqNW3ilsfB880xcvK5QlMXEEbdKGXRRGBdl5TC1Z4DwzfTwg+yKNL42vcX
9wPX5hb/UYhkmyD9Jfr+nrqlbWMxQyp2OShPxTdczlpQZHkJ4ShA+4XNnG/wHsP3
8YusjihTUbo5lQqxJu99pO8OlEg2LSmTlS+zz++aKRoWqHaX/AsZ12skBde8oxaf
VvdjsKwvssQF0Tz4HYgbiDR21xwj6Uz5ljkeMgIF1RflTPna+JXN3EPzsEjCjHhs
WJRcCycgaIp7zNKeLKuM
=9uch
-----END PGP SIGNATURE-----

--JGImnEjhiWGfsO8NdhUxBtAcQlUSPkwbJ--
