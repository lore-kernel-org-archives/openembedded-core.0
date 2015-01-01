Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 31F99601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 02:49:31 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so21690875pdb.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 18:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=4QZYyfLFdy91F0ONN+PFJEslmnOWh/Y0F3pVu2dTVSk=;
	b=UqLVhoVbMeVCvAknuFHUB12/HgRwOyAsGv9OYMKxXFHdghdBOJXXOjC07+bdhLsC1E
	xQcqe1LZLSUKcf1QGLkBvxxPsoN1CBf8BHmjQ6DJXnyWPEx69atmRKwiVTfw4paLIYBb
	aCa8ajlwyjn4pk2k9AAMsX47FQPKQAfrVOD+sBAWa71a0x5jbiAebXivFLRKSW0NoMjk
	R115f7KcNTeYUTmzwvj9niafvG4S2WrCZrPtFmJYVnOihzYW9SasUuzqyCiwqYtaNojT
	0W0dViZhGUzt9x94nZSWjhba7qOUZzDvaWLc8q0IwtQPVC5+3cAM1OVin6GK5k2mSAez
	4RAw==
X-Received: by 10.70.123.166 with SMTP id mb6mr44794740pdb.95.1420080572616;
	Wed, 31 Dec 2014 18:49:32 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:57d:8d0:eedc:6d7a?
	([2601:9:3580:84c:57d:8d0:eedc:6d7a])
	by mx.google.com with ESMTPSA id j1sm42347784pbq.85.2014.12.31.18.49.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 18:49:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1418912251-3313-5-git-send-email-mike.looijmans@topic.nl>
Date: Wed, 31 Dec 2014 18:49:30 -0800
Message-Id: <AD47BDE1-4736-43B8-B901-ACDCFAD1665B@gmail.com>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1418912251-3313-1-git-send-email-mike.looijmans@topic.nl>
	<1418912251-3313-5-git-send-email-mike.looijmans@topic.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 4/4] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Thu, 01 Jan 2015 02:49:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 18, 2014, at 6:17 AM, Mike Looijmans <mike.looijmans@topic.nl> =
wrote:
>=20
> Upon inserting a USB stick or similar device, mdev will run
> an automounter script that mounts valid partitions on
> /media/<device>. The script first checks /etc/fstab entries
> so that mounting on UUID or LABEL or using custom mount options
> is still possible. If /etc/fstab does not contain particular
> mount options, the script will create (and remove) the mountpoint
> automatically.
> The script also supports full disk partitions (devices without
> partition table).
>=20
> The following environments can be set in /etc/default/mdev:
> MDEV_AUTOMOUNT=3Dn (Disables automounting completely)
> MDEV_AUTOMOUNT_ROOT=3D/media (Change the mount root location)
>=20
> Automatic mounting for a particular device can be disabled by
> creating a file "/dev/<device>.nomount". This is helpful in
> scripts that create partitions for example, and want to perform
> specific actions which require the device to remain unmounted.
>=20
> A more complex variation (using LABEL based mounts) on this script
> has been in use in OpenPLi for many years now, and I've used this
> one on many projects already, so it's about time to push this to
> mainline.
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> meta/recipes-core/busybox/busybox.inc         |    1 +
> meta/recipes-core/busybox/busybox_1.22.1.bb   |    1 +
> meta/recipes-core/busybox/busybox_git.bb      |    1 +
> meta/recipes-core/busybox/files/mdev-mount.sh |   63 =
+++++++++++++++++++++++++
> meta/recipes-core/busybox/files/mdev.conf     |    3 ++
> 5 files changed, 69 insertions(+)
> create mode 100644 meta/recipes-core/busybox/files/mdev-mount.sh
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc =
b/meta/recipes-core/busybox/busybox.inc
> index deb2ee4..0769d92 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -270,6 +270,7 @@ do_install () {
>                        install -m 644 ${WORKDIR}/mdev.conf =
${D}${sysconfdir}/mdev.conf
>                        install -d ${D}${sysconfdir}/mdev
>                        install -m 0755 ${WORKDIR}/find-touchscreen.sh =
${D}${sysconfdir}/mdev
> +                       install -m 0755 ${WORKDIR}/mdev-mount.sh =
${D}${sysconfdir}/mdev
>                fi
> 	fi
>=20
> diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb =
b/meta/recipes-core/busybox/busybox_1.22.1.bb
> index 82f7f68..f379bb6 100644
> --- a/meta/recipes-core/busybox/busybox_1.22.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>            file://busybox-syslog.default \
>            file://mdev \
>            file://mdev.conf \
> +           file://mdev-mount.sh \
>            file://umount.busybox \
>            file://defconfig \
>            file://busybox-syslog.service.in \
> diff --git a/meta/recipes-core/busybox/busybox_git.bb =
b/meta/recipes-core/busybox/busybox_git.bb
> index f2cc119..f91b552 100644
> --- a/meta/recipes-core/busybox/busybox_git.bb
> +++ b/meta/recipes-core/busybox/busybox_git.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "git://busybox.net/busybox.git \
>            file://busybox-syslog.default \
>            file://mdev \
>            file://mdev.conf \
> +           file://mdev-mount.sh \
>            file://umount.busybox \
>            file://defconfig \
>            file://busybox-syslog.service.in \
> diff --git a/meta/recipes-core/busybox/files/mdev-mount.sh =
b/meta/recipes-core/busybox/files/mdev-mount.sh
> new file mode 100644
> index 0000000..d5d66d6
> --- /dev/null
> +++ b/meta/recipes-core/busybox/files/mdev-mount.sh
> @@ -0,0 +1,63 @@
> +#!/bin/sh
> +MDEV_AUTOMOUNT=3Dy
> +MDEV_AUTOMOUNT_ROOT=3D/run/media
> +[ -f /etc/default/mdev ] && . /etc/default/mdev
> +if [ "${MDEV_AUTOMOUNT}" =3D "n" ] ; then
> +	exit 0
> +fi
> +
> +case "$ACTION" in
> +	add|"")
> +		ACTION=3D"add"
> +		# check if already mounted
> +		if grep -q "^/dev/${MDEV} " /proc/mounts ; then
> +			# Already mounted
> +			exit 0
> +		fi
> +		DEVBASE=3D`expr substr $MDEV 1 3`
> +		if [ "${DEVBASE}" =3D=3D "mmc" ] ; then
> +			DEVBASE=3D`expr substr $MDEV 1 7`
> +		fi
> +		# check for "please don't mount it" file
> +		if [ -f "/dev/nomount.${DEVBASE}" ] ; then
> +			# blocked
> +			exit 0
> +		fi
> +		# check for full-disk partition
> +		if [ "${DEVBASE}" =3D=3D "${MDEV}" ] ; then

bashism, get rid of it.

> +			if [ -d /sys/block/${DEVBASE}/${DEVBASE}*1 ] ; =
then
> +				# Partition detected, just quit
> +				exit 0
> +			fi
> +			if [ ! -f /sys/block/${DEVBASE}/size ] ; then
> +				# No size at all
> +				exit 0
> +			fi
> +			if [ `cat /sys/block/${DEVBASE}/size` =3D=3D 0 ] =
; then
> +				# empty device, bail out
> +				exit 0
> +			fi
> +		fi
> +		# first allow fstab to determine the mountpoint
> +		if ! mount /dev/$MDEV > /dev/null 2>&1
> +		then
> +			MOUNTPOINT=3D"${MDEV_AUTOMOUNT_ROOT}/$MDEV"
> +			mkdir "$MOUNTPOINT"
> +			mount -t auto /dev/$MDEV "$MOUNTPOINT"
> +		fi
> +		;;
> +	remove)
> +		MOUNTPOINT=3D`grep "^/dev/$MDEV\s" /proc/mounts | cut =
-d' ' -f 2`
> +		if [ ! -z "$MOUNTPOINT" ]
> +		then
> +			umount "$MOUNTPOINT"
> +			rmdir "$MOUNTPOINT"
> +		else
> +			umount /dev/$MDEV
> +		fi
> +		;;
> +	*)
> +		# Unexpected keyword
> +		exit 1
> +		;;
> +esac
> diff --git a/meta/recipes-core/busybox/files/mdev.conf =
b/meta/recipes-core/busybox/files/mdev.conf
> index 6dfd161..17e93da 100644
> --- a/meta/recipes-core/busybox/files/mdev.conf
> +++ b/meta/recipes-core/busybox/files/mdev.conf
> @@ -37,3 +37,6 @@ input/mice 0:0 0660
> input/mouse.* 0:0 0660
>=20
> tun[0-9]* 0:0 0660 =3Dnet/
> +
> +[hs]d[a-z][0-9]? 0:0 660 */etc/mdev/mdev-mount.sh
> +mmcblk[0-9].* 0:0 660 */etc/mdev/mdev-mount.sh
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


