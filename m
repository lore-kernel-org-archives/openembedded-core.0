Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D831C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 09:07:33 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web12.41166.1655802448563742451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 02:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,209,1650960000";
   d="scan'208";a="77594254"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 21 Jun 2022 01:07:27 -0800
IronPort-SDR: 
 DKfA805kQws2Ux3fMuxu6XrqeqUElE69UQJck9SrK387DDfc0feSRyxjhOPYr7wjPtlpVKGJ0Y
 /2eDrtC7CzVtZDMdkPwG+R05Z5W4WXOJMC75YK+lhbV006UCpuWPxXTEwki80B5DhSos7uwN+V
 PY2Fb+uOTXTOIX2oJw7dFUfl9zFoExDF48w9H6wvzo1l6jj3PMuRuTuIE6cg80u2yErSFSRlA/
 SBtWlaH3DtUaqP+lHpYirlQ+vwnHPi/EreFAyXHDkisJqkdjqaaUNQhLmXd5Bj5UiS4SF7cngg
 xbM=
From: "Hamza, Muhammad" <Muhammad_Hamza@mentor.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Awan, Arsalan"
	<Arsalan_Awan@mentor.com>
Subject: RE: [OE-core] [PATCH] udev-extraconf/mount.sh: add LABELs to
 mountpoints
Thread-Topic: [OE-core] [PATCH] udev-extraconf/mount.sh: add LABELs to
 mountpoints
Thread-Index: AQHYhKEKtl0l/6eUI06nUeQS8qAvTa1ZdY0AgAAdVoA=
Date: Tue, 21 Jun 2022 09:07:24 +0000
Message-ID: <84647e3aeb62401581f6a207577a02ae@mentor.com>
References: <20220620122640.239381-1-muhammad_hamza@mentor.com>
 <20220621102038.00b08ff3@booty>
In-Reply-To: <20220621102038.00b08ff3@booty>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 09:07:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167142

Hi Luca,
I have sent updated patch v2 at mailing list.

Regards,
Hamza

-----Original Message-----
From: Luca Ceresoli <luca.ceresoli@bootlin.com>=20
Sent: Tuesday, June 21, 2022 1:21 PM
To: Hamza, Muhammad <Muhammad_Hamza@mentor.com>
Cc: openembedded-core@lists.openembedded.org; Awan, Arsalan <Arsalan_Awan@m=
entor.com>
Subject: Re: [OE-core] [PATCH] udev-extraconf/mount.sh: add LABELs to mount=
points

Hi Muhammad,

On Mon, 20 Jun 2022 17:26:40 +0500
"Muhammad Hamza" <Muhammad_Hamza@mentor.com> wrote:

> This alters the mountpoints such that if a device has a LABEL or a=20
> PARTLABEL, it will be mounted at e.g.:
>=20
>   /run/media/$LABEL-<device-node>
>   /run/media/$PARTLABEL-<device-node>
>   /run/media/rootfs-sda2
>=20
> otherwise the device will be mounted at e.g.:
>=20
>   /run/media/<device-node>
>   /run/media/sda1
>=20
> The <device-node> appended with LABEL or PARTLABEL makes sure that the=20
> mountpoint is unique, therefore, avoids overlapping mounts.
>=20
> Signed-off-by: Arsalan H. Awan <Arsalan_Awan@mentor.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  .../recipes-core/udev/udev-extraconf/mount.sh | 20=20
> +++++++++++++++++++  meta/recipes-core/udev/udev-extraconf_1.1.bb  | =20
> 2 +-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh=20
> b/meta/recipes-core/udev/udev-extraconf/mount.sh
> index c8b773bc07..12c6a5af22 100644
> --- a/meta/recipes-core/udev/udev-extraconf/mount.sh
> +++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
> @@ -54,6 +54,16 @@ automount_systemd() {
>          grep "^[[:space:]]*$tmp" /etc/fstab && return
>      done
> =20
> +    # Get the LABEL or PARTLABEL
> +    LABEL=3D`/sbin/blkid | grep "${DEVNAME}:" | grep -o 'LABEL=3D".*"' |=
 cut -d '"' -f2`
> +    # If the $DEVNAME has a LABEL or a PARTLABEL
> +    if [ -n "$LABEL" ]; then
> +            # Set the mount location dir name to LABEL appended
> +            # with $name e.g. label-sda. That would avoid overlapping
> +            # mounts in case two devices have same LABEL
> +            name=3D"${LABEL}-${name}"
> +    fi
> +
>      [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
> =20
>      MOUNT=3D"$MOUNT -o silent"
> @@ -94,6 +104,16 @@ automount() {
>  	# configured in fstab
>  	grep -q "^$DEVNAME " /proc/mounts && return
> =20
> +        # Get the LABEL or PARTLABEL
> +        LABEL=3D`/sbin/blkid | grep "${DEVNAME}:" | grep -o 'LABEL=3D".*=
"' | cut -d '"' -f2`
> +        # If the $DEVNAME has a LABEL or a PARTLABEL
> +        if [ -n "$LABEL" ]; then
> +                # Set the mount location dir name to LABEL appended
> +                # with $name e.g. label-sda. That would avoid overlappin=
g
> +                # mounts in case two devices have same LABEL
> +                name=3D"${LABEL}-${name}"
> +        fi

This is exactly as above. Can you move the common code to a function?


--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

