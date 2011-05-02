Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QH1XG-0000IH-QR
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 00:24:11 +0200
Received: by ewy5 with SMTP id 5so1887976ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 15:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ef1PbetCgURfzdKJvjrr3BNKe5OdBmU16PG8ywtrmFQ=;
	b=qN7D6bk9SySRnyTjdwNGcBcEQDIdxvVPyTe3u1EJqHPv1YAKkEMB/iCEjiRLRo0RyQ
	PDW9mnK1/gQOrMUn1Smext2t7I6PpdD9qcY9p+rym3SXgGYpgUF6iE9SgGCvBUlhwTno
	8UO1F8HPdWKRVO2tr9samtsMNc/D4lIW5AWJk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ND2q/U1Morw1tgykV167602P/LzsfOMBYF4i4LpjqzfPCKa7JvaLYid61VOqm/BWMz
	v4vAqxrfRG/JvpRBL3cAedL73VD5xorTM2JP02nD+AM84RDAP7Rwg/tY1TSu5jXVZLdq
	UnaYAMUx+i9KEwf9RYM9wPA1/G1b3rdV1SJpY=
Received: by 10.14.52.132 with SMTP id e4mr3673412eec.173.1304374894216; Mon,
	02 May 2011 15:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 2 May 2011 15:21:04 -0700 (PDT)
In-Reply-To: <1304363356-27535-4-git-send-email-otavio@ossystems.com.br>
References: <1304363356-27535-1-git-send-email-otavio@ossystems.com.br>
	<1304363356-27535-4-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2011 15:21:04 -0700
Message-ID: <BANLkTi=13pPhOA5EP3+GpfWsoSqsrRpniw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] busybox: add support to mdev
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
X-List-Received-Date: Mon, 02 May 2011 22:24:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2011 at 12:09 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This changes the packaging only if the configuration used has mdev
> support enabled.


Did you test this patch on a config where mdev support is disabled ?
that will be interesting to know

>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =C2=A0meta/recipes-core/busybox/busybox.inc =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 15 ++++++++++-
> =C2=A0meta/recipes-core/busybox/busybox_1.17.3.bb | =C2=A0 =C2=A04 ++-
> =C2=A0meta/recipes-core/busybox/files/mdev =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A07 +++++
> =C2=A0meta/recipes-core/busybox/files/mdev.conf =C2=A0 | =C2=A0 35 ++++++=
+++++++++++++++++++++
> =C2=A04 files changed, 58 insertions(+), 3 deletions(-)
> =C2=A0create mode 100755 meta/recipes-core/busybox/files/mdev
> =C2=A0create mode 100644 meta/recipes-core/busybox/files/mdev.conf
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index 9f2d64c..164d089 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -12,23 +12,28 @@ SECTION =3D "base"
> =C2=A0PRIORITY =3D "required"
>
> =C2=A0export EXTRA_CFLAGS =3D "${CFLAGS}"
> -PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog"
> +PACKAGES =3D+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-=
mdev"
>
> =C2=A0FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
> =C2=A0FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog* ${sysconfdir}/=
syslog.conf*"
> +FILES_${PN}-mdev =3D "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
> =C2=A0FILES_${PN}-udhcpd =3D "${sysconfdir}/init.d/busybox-udhcpd"
> =C2=A0FILES_${PN}-udhcpc =3D "${sysconfdir}/udhcpc.d ${datadir}/udhcpc ${=
sysconfdir}/init.d/busybox-udhcpc"
>
> -INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udh=
cpc"
> +INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-udh=
cpc ${PN}-mdev"
>
> =C2=A0INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
> =C2=A0INITSCRIPT_NAME_${PN}-syslog =3D "syslog"
> +INITSCRIPT_NAME_${PN}-mdev =3D "mdev"
> =C2=A0INITSCRIPT_NAME_${PN}-udhcpd =3D "busybox-udhcpd"
> =C2=A0INITSCRIPT_NAME_${PN}-udhcpc =3D "busybox-udhcpc"
> =C2=A0CONFFILES_${PN}-syslog =3D "${sysconfdir}/syslog.conf.${PN}"
> +CONFFILES_${PN}-mdev =3D "${sysconfdir}/mdev.conf"
>
> =C2=A0RRECOMMENDS_${PN} =3D "${PN}-syslog ${PN}-udhcpc"
>
> +INITSCRIPT_PARAMS_${PN}-mdev =3D "start 06 S ."
> +
> =C2=A0# This disables the syslog startup links in slugos (see slugos-init=
)
> =C2=A0INITSCRIPT_PARAMS_${PN}-syslog_slugos =3D "start 20 ."
>
> @@ -103,6 +108,12 @@ do_install () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${=
WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${=
WORKDIR}/busybox-udhcpc ${D}${sysconfdir}/init.d/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> + =C2=A0 =C2=A0 =C2=A0 if grep "CONFIG_MDEV=3Dy" ${WORKDIR}/defconfig; th=
en
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORK=
DIR}/mdev ${D}${sysconfdir}/init.d/mdev
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep "CONFIG_FEATUR=
E_MDEV_CONF=3Dy" ${WORKDIR}/defconfig; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/busybox.links ${D}${sysco=
nfdir}
>
> diff --git a/meta/recipes-core/busybox/busybox_1.17.3.bb b/meta/recipes-c=
ore/busybox/busybox_1.17.3.bb
> index 28342fe..2d98ad3 100644
> --- a/meta/recipes-core/busybox/busybox_1.17.3.bb
> +++ b/meta/recipes-core/busybox/busybox_1.17.3.bb
> @@ -1,5 +1,5 @@
> =C2=A0require busybox.inc
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0SRC_URI =3D "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2=
;name=3Dtarball \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://udhcpscript.patch \
> @@ -21,6 +21,8 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-$=
{PV}.tar.bz2;name=3Dtarball \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mount.busybox \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://syslog \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://syslog.conf \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mdev \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mdev.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://umount.busybox \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
>
> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/bus=
ybox/files/mdev
> new file mode 100755
> index 0000000..4eba619
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/mdev
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +mount -t tmpfs tmpfs /dev =C2=A0-o size=3D64k,mode=3D0755
> +mkdir /dev/pts /dev/shm
> +mount -t devpts devpts /dev/pts
> +echo "/sbin/mdev" > /proc/sys/kernel/hotplug
> +mdev -s
> diff --git a/meta/recipes-core/busybox/files/mdev.conf b/meta/recipes-cor=
e/busybox/files/mdev.conf
> new file mode 100644
> index 0000000..0e1d6bc
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/mdev.conf
> @@ -0,0 +1,35 @@
> +console 0:0 0600
> +cpu_dma_latency 0:0 0660
> +fb0:0 44 0660
> +full 0:0 0666
> +initctl 0:0 0600
> +ircomm[0-9].* 0:20 0660
> +kmem 0:15 0640
> +kmsg 0:0 0660
> +log 0:0 0666
> +loop[0-9].* 0:6 0640
> +mem 0:15 0640
> +network_latency 0:0 0660
> +network_throughput 0:0 0660
> +null 0:0 0666
> +port 0:15 0640
> +ptmx 0:5 0666
> +ram[0-9].* 0:6 0640
> +random 0:0 0666
> +sda 0:6 0640
> +tty 0:5 0666
> +tty.* 0:0 0620
> +urandom 0:0 0666
> +usbdev.* 0:0 0660 */etc/mdev/usb.sh
> +vcs.* 0:5 0660
> +zero 0:0 0666
> +
> +pcm.* 0:0 0660 =3Dsnd/
> +control.* 0:0 0660 =3Dsnd/
> +timer 0:0 0660 =3Dsnd/
> +
> +event.* 0:0 0660 =3Dinput/ @/etc/mdev/find-touchscreen.sh
> +mice 0:0 0660 =3Dinput/
> +mouse.* 0:0 0660 =3Dinput/
> +
> +tun[0-9]* 0:0 0660 =3Dnet/
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


