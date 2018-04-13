Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0ED8574634
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 15:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 524BC18105;
	Fri, 13 Apr 2018 17:32:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id SEPt1bEViu26; Fri, 13 Apr 2018 17:32:58 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C59B318547;
	Fri, 13 Apr 2018 17:32:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62A101E074;
	Fri, 13 Apr 2018 17:32:57 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CDC11E072;
	Fri, 13 Apr 2018 17:32:57 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 13 Apr 2018 17:32:57 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 409391B9;
	Fri, 13 Apr 2018 17:32:57 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 13 Apr 2018 17:32:57 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 13 Apr 2018 17:32:57 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongzhi.Song <hongzhi.song@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] udev-extraconf: Add systemd-mount to
	udev-extraconf/mount.sh
Thread-Index: AQHT0g/ZlSEfwOa6K0+edUhrt0OQoqP+0LEg
Date: Fri, 13 Apr 2018 15:32:56 +0000
Message-ID: <84dfe177e8c34ccd90a6c03c1d66bcf8@XBOX02.axis.com>
References: <20180412033819.40298-1-hongzhi.song@windriver.com>
In-Reply-To: <20180412033819.40298-1-hongzhi.song@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v2] udev-extraconf: Add systemd-mount to	udev-extraconf/mount.sh
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
X-List-Received-Date: Fri, 13 Apr 2018 15:32:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Hongzhi.Song
> Sent: den 12 april 2018 05:38
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] udev-extraconf: Add systemd-mount to
> udev-extraconf/mount.sh
>=20
> This patch fixs the problem that block devices unable to be formatted
> when
> systemd and udev-extraconf recipes added to rootfs.
>=20
> If we add systemd and udev-extraconf recipes to rootfs:
>     VIRTUAL-RUNTIME_init_manager =3D "systemd"
>     DISTRO_FEATURES_append =3D " systemd"
>     DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "sysvinit"
>     KERNEL_FEATURES_append =3D " cfg/systemd.scc"
>     IMAGE_INSTALL_append =3D " udev-extraconf"
>     IMAGE_FSTYPES +=3D "tar.bz2 ext4"
>     IMAGE_INSTALL_append =3D " e2fsprogs-mke2fs"
> then systemd-udevd.service will invoke udev rules to automount block
> devices
> any probed under udevd's private namespace, this behavior results in
> host space
> can't format those devices. And host space can't find where the device
> is used.
>=20
> Such as:
>     root@qemux86:~# mkfs.ext4 /dev/sda1
>     mke2fs 1.43.8 (1-Jan-2018)
>     /dev/sda1 contains a ext4 file system
>     last mounted on Tue Apr  3 06:22:41 2018
>     Proceed anyway? (y,N) y
>     /dev/sda1 is apparently in use by the system; will not make a
> filesystem here!
>=20
> Command 'systemd-mount' recommended by systemd maintainer instead of
> command
> 'mount' will fix the problem brought with private namespace. Systemd-
> mount
> request the mount operation to be executed by PID 1, and hence host
> space can
> access the block devices.
>=20
> [YOCTO #12644]
>=20
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  meta/recipes-core/udev/udev-extraconf/mount.sh | 71
> ++++++++++++++++++++++----
>  1 file changed, 60 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh
> b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index d760328a09..4ba9f1dd99 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -4,10 +4,28 @@
>  #
>  # Attempt to mount any added block devices and umount any removed
> devices
>=20
> +BASE_INIT=3D"`readlink "/sbin/init"`"
> +INIT_SYSTEMD=3D"/lib/systemd/systemd"

In a system where ${base_libdir} !=3D "lib", e.g, if usrmerge is in=20
DISTRO_FEATURES, this may not match reality. You should replace=20
all hardcoded paths with something like @base_libdir@ and then=20
use sed to apply all the relevant bitbake path variables.

> +
> +if [ "x$BASE_INIT" =3D "x$INIT_SYSTEMD" ];then
> +	# systemd as init uses systemd-mount to mount block devices

You should use tabs to indent this function to match the rest of=20
this file.

> +    MOUNT=3D"/usr/bin/systemd-mount"
> +    UMOUNT=3D"/usr/bin/systemd-umount"
> +
> +    if [ -x $MOUNT ] && [ -x $UMOUNT ];
> +    then
> +        logger "Using systemd-mount to finish mount"
> +    else
> +        logger "Linux init is using systemd, so please install systemd-m=
ount to finish mount"
> +        exit 1
> +    fi
> +else
> +    MOUNT=3D"/bin/mount"
> +    UMOUNT=3D"/bin/umount"
> +fi
>=20
> -MOUNT=3D"/bin/mount"
>  PMOUNT=3D"/usr/bin/pmount"
> -UMOUNT=3D"/bin/umount"
> +
>  for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.bla=
cklist.d/*`
>  do
>  	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
> @@ -17,7 +35,35 @@ do
>  	fi
>  done
>=20
> -automount() {
> +automount_systemd() {
> +    name=3D"`basename "$DEVNAME"`"
> +
> +    ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"

The above is better written as:

    [ -d "/run/media/$name" ] || mkdir -p "/run/media/$name"

> +
> +    MOUNT=3D"$MOUNT -o silent"
> +
> +    # If filesystemtype is vfat, change the ownership group to 'disk', a=
nd
> +    # grant it with  w/r/x permissions.
> +    case $ID_FS_TYPE in
> +    vfat|fat)
> +        MOUNT=3D"$MOUNT -o umask=3D007,gid=3D`awk -F':' '/^disk/{print $=
3}' /etc/group`"
> +        ;;
> +    # TODO
> +    *)
> +        ;;
> +    esac
> +
> +    if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
> +    then
> +        #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/med=
ia/$name\" failed!"
> +        rm_dir "/run/media/$name"
> +    else
> +        logger "mount.sh/automount" "Auto-mount of [/run/media/$name] su=
ccessful"
> +        touch "/tmp/.automount-$name"
> +    fi
> +}
> +
> +automount() {
>  	name=3D"`basename "$DEVNAME"`"
>=20
>  	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
> @@ -26,7 +72,7 @@ automount() {
>  	then
>  		MOUNT=3D"$MOUNT -o silent"
>  	fi
> -
> +
>  	# If filesystem type is vfat, change the ownership group to 'disk', and
>  	# grant it with  w/r/x permissions.
>  	case $ID_FS_TYPE in
> @@ -46,7 +92,7 @@ automount() {
>  		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successf=
ul"
>  		touch "/tmp/.automount-$name"
>  	fi
> -}
> +

You should not remove that "}" or the script will become invalid...

>=20
>  rm_dir() {
>  	# We do not want to rm -r populated directories
> @@ -68,22 +114,25 @@ if [ "$ACTION" =3D "add" ] && [ -n "$DEVNAME" ] && [=
 -n "$ID_FS_TYPE" -o "$media_t
>  	elif [ -x $MOUNT ]; then
>      		$MOUNT $DEVNAME 2> /dev/null
>  	fi
> -
> +
>  	# If the device isn't mounted at this point, it isn't
>  	# configured in fstab (note the root filesystem can show up as
>  	# /dev/root in /proc/mounts, so check the device number too)
> -	if expr $MAJOR "*" 256 + $MINOR !=3D `stat -c %d /`; then
> -		grep -q "^$DEVNAME " /proc/mounts || automount
> -	fi

Use tabs to indent the code below.

> +    if expr $MAJOR "*" 256 + $MINOR !=3D `stat -c %d /`; then
> +        if [ "`basename $MOUNT`" =3D "systemd-mount" ];then
> +            grep -q "^$DEVNAME " /proc/mounts || automount_systemd
> +        else
> +            grep -q "^$DEVNAME " /proc/mounts || automount
> +        fi
> +    fi
>  fi
>=20
> -
>  if [ "$ACTION" =3D "remove" ] || [ "$ACTION" =3D "change" ] && [ -x "$UM=
OUNT" ] && [ -n "$DEVNAME" ]; then
>  	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
>  	do
>  		$UMOUNT $mnt
>  	done
> -
> +
>  	# Remove empty directories from auto-mounter
>  	name=3D"`basename "$DEVNAME"`"
>  	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
> --
> 2.13.3

//Peter


