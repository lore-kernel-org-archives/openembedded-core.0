Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50762C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 06:58:30 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.60559.1643785108979314514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 22:58:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=VX8K6zvD;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.8.233] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id F360B20B6C61;
	Tue,  1 Feb 2022 22:58:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F360B20B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1643785108;
	bh=q9OQ+cCAYmJF1jOdgxbpw+y/8K2gwvOTp6N2PzaFA3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VX8K6zvDanodVxvJOL9b+H+T+nsdrnCBw1lb4Qz6xgcz/sySsqVmVzWgGNg5jlxdN
	 BU2JjTJGtdjQuXOyAmzAVxEemiuytHaAO0Rq8WGrOgg/ibLlLdAauYLNKO9YjMz5Ho
	 UCA6KWLY5IoBMVQUxlvEjqzmLnArCKrlhg94J7C8=
Content-Type: multipart/alternative;
 boundary="------------dp0f2AqYVuGVpOt0JeJ5sQOO"
Message-ID: <ecaf8435-71db-8c51-e3c8-71172d0788f8@linux.microsoft.com>
Date: Wed, 2 Feb 2022 06:58:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2] initramfs-framework: Add overlayroot module
Content-Language: en-US
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
References: <20220129194839.3280002-1-alhe@linux.microsoft.com>
 <10c1ea08-3b69-aeef-6052-41ad98f37ce6@gmail.com>
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <10c1ea08-3b69-aeef-6052-41ad98f37ce6@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 06:58:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161179

This is a multi-part message in MIME format.
--------------dp0f2AqYVuGVpOt0JeJ5sQOO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Vyacheslav,

Yes, in this case it is different and its specifically required if we=20
want to overlay the entire rootfs, also like it says in the commit=20
message and in the comments giving credit to the overlay-etc class I=20
definitely tried extending the overlay-etc class but it simply does not=20
work for this, since the rootfs becomes inaccessible once the system has=20
booted, hence why this has to be done inside initramfs, this isn't meant=20
to replace the overlay-etc class in any way, just to provide an=20
alternative if it fits the user needs better.

Also, my apologies, your reply to my v1 somehow slipped through my=20
filter and I hadn't seen it.

I think they are simply two different scenarios, I can see the potential=20
the overlay-etc class has to be extended for other directories for=20
example, but it is a different use case and boot flow so I believe both=20
can co-exist for different workflows depending on the user needs.

Cheers,

Alejandro

On 1/31/22 20:36, Vyacheslav Yurkov wrote:
> Hi Alejandro,
> Thanks for the v2, but my questions from v1 are still left unanswered.
>
> 1. Do you really need the whole rootfs to be in overlay? Perhaps you=20
> have another use case in mind, but the more scope overlay has, the=20
> more migration effort you need in order to update upper layer on image=20
> upgrade.
> 2. I was thinking if perhaps that would be better to extend=20
> files/overlayfs-etc-preinit.sh.in to suit your needs and re-use common=20
> parts rather then having a good part of it copied to initramfs-framewor=
k?
>
> Cheers,
> Vyacheslav
>
> On 29.01.2022 20:48, Alejandro Hernandez Samaniego wrote:
>> When installed, this module mounts a read-write (RW) overlay on
>> top of a root filesystem, which is kept read-only (RO), free
>> from modifications by the user, this might prove to be useful
>> if we want to access or restore the original unmodified rootfs.
>>
>> The existing overlay-etc.bbclass does something similar, it
>> mounts an overlay on top of the /etc directory, however doing
>> the same for root causes the original root to be inaccessible
>> once the system is booted, hence why this module is added to
>> the initramfs boot flow, allowing us to mount the RW overlay,
>> while keeping the original rootfs mounted at /rofs once the
>> system finishes booting. This script is loosely based on that
>> class.
>>
>> This module requires rootrw=3D<foo> to be passed as a kernel
>> parameter to specify the device/partition to be used as RW by the
>> overlay and has a dependency on overlayfs support being present
>> in the running kernel.
>>
>> It does not require the read-only IMAGE_FEATURE to be enabled.
>>
>> The module needs to be executed after the initramfs-module-rootfs
>> since it relies on it to mount the filesystem at initramfs startup
>> but before the finish module which normally switches root.
>> After overlayroot is executed the usual boot flow continues from
>> the real init process.
>>
>> If something goes wrong while running this module, the rootfs
>> is still mounted RO (with no overlay) and the finish module is
>> executed to continue booting normally.
>>
>> Its worth noting that, on purpose, this isnt installed by default
>> on any images that use initramfs-framework to keep the boot flow
>> unmodified, only when a user manually requests to install it,
>> then it becomes functional.
>>
>> Signed-off-by: Alejandro Enedino Hernandez Samaniego=20
>> <alhe@linux.microsoft.com>
>> ---
>> =C2=A0 .../initramfs-framework/overlayroot=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 112 ++++++++++++++++++
>> =C2=A0 .../initrdscripts/initramfs-framework_1.0.bb=C2=A0 |=C2=A0=C2=A0=
 9 ++
>> =C2=A0 2 files changed, 121 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>>
>> diff --git=20
>> a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot=20
>> b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>> new file mode 100644
>> index 0000000000..d40342dc59
>> --- /dev/null
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
>> @@ -0,0 +1,112 @@
>> +#!/bin/sh
>> +
>> +# SPDX-License-Identifier: MIT
>> +#
>> +# Copyright 2022 (C), Microsoft Corporation
>> +
>> +# Simple initramfs module intended to mount a read-write (RW)
>> +# overlayfs on top of /, keeping the original root filesystem
>> +# as read-only (RO), free from modifications by the user.
>> +#
>> +# NOTE: The read-only IMAGE_FEATURE is not required for this to work
>> +#
>> +# This script is based on the overlay-etc.bbclass, which sets up
>> +# an overlay on top of the /etc directory, but in this case allows
>> +# accessing the original, unmodified rootfs at /rofs after boot.
>> +#
>> +# It relies on the initramfs-module-rootfs to mount the original
>> +# root filesystem, and requires 'rootrw=3D<foo>' to be passed as a
>> +# kernel parameter, specifying the device/partition intended to
>> +# use as RW.
>> +#
>> +# This module needs to be executed after the initramfs-module-rootfs
>> +# since it relies on it to mount the filesystem at initramfs startup
>> +# but before the finish module which normally switches root.
>> +# After overlayroot is executed the usual boot flow continues from
>> +# the real init process.
>> +#
>> +# If something goes wrong while running this module, the rootfs
>> +# is still mounted RO (with no overlay) and the finish module is
>> +# executed to continue booting normally.
>> +#
>> +# It also has a dependency on overlayfs being enabled in the
>> +# running kernel via KERNEL_FEATURES (kmeta) or any other means.
>> +
>> +
>> +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
>> +
>> +# We get OLDROOT from the rootfs module
>> +OLDROOT=3D"/rootfs"
>> +
>> +NEWROOT=3D"${RWMOUNT}/root"
>> +RWMOUNT=3D"/overlay"
>> +ROMOUNT=3D"${RWMOUNT}/rofs"
>> +UPPER_DIR=3D"${RWMOUNT}/upper"
>> +WORK_DIR=3D"${RWMOUNT}/work"
>> +
>> +MODULES_DIR=3D/init.d
>> +
>> +# Something went wrong, make sure / is mounted as read only anyway.
>> +exit_gracefully() {
>> +=C2=A0=C2=A0=C2=A0 echo $1 >/dev/console
>> +=C2=A0=C2=A0=C2=A0 echo >/dev/console
>> +=C2=A0=C2=A0=C2=A0 echo "OverlayRoot mounting failed, starting system=
 as read-only"=20
>> >/dev/console
>> +=C2=A0=C2=A0=C2=A0 echo >/dev/console
>> +
>> +=C2=A0=C2=A0=C2=A0 # The following is borrowed from rootfs-postcomman=
ds.bbclass
>> +=C2=A0=C2=A0=C2=A0 # This basically looks at the real rootfs mounting=
 options and
>> +=C2=A0=C2=A0=C2=A0 # replaces them with "ro"
>> +
>> +=C2=A0=C2=A0=C2=A0 # Tweak the mount option and fs_passno for rootfs =
in fstab
>> +=C2=A0=C2=A0=C2=A0 if [ -f ${OLDROOT}/etc/fstab ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e=20
>> '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]=
]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}'=20
>> ${OLDROOT}/etc/fstab
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Tweak the "mount -o remount,rw /" command in bus=
ybox-inittab=20
>> inittab
>> +=C2=A0=C2=A0=C2=A0 if [ -f ${OLDROOT}/etc/inittab ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's|/bin/mount -o re=
mount,rw /|/bin/mount -o=20
>> remount,ro /|' ${OLDROOT}/etc/inittab
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Continue as if the overlayroot module didn't exi=
st to continue=20
>> booting
>> +=C2=A0=C2=A0=C2=A0 . $MODULES_DIR/99-finish
>> +=C2=A0=C2=A0=C2=A0 eval "finish_run"
>> +}
>> +
>> +
>> +if [ -z "$bootparam_rootrw" ]; then
>> +=C2=A0=C2=A0=C2=A0 exit_gracefully "rootrw=3D kernel parameter doesn'=
t exist and its=20
>> required to mount the overlayfs"
>> +fi
>> +
>> +mkdir -p ${RWMOUNT}
>> +
>> +# Mount RW device
>> +if mount -n -t ${bootparam_rootfstype:-ext4} -o=20
>> ${bootparam_rootflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
>> +then
>> +=C2=A0=C2=A0=C2=A0 # Set up overlay directories
>> +=C2=A0=C2=A0=C2=A0 mkdir -p ${UPPER_DIR}
>> +=C2=A0=C2=A0=C2=A0 mkdir -p ${WORK_DIR}
>> +=C2=A0=C2=A0=C2=A0 mkdir -p ${NEWROOT}
>> +=C2=A0=C2=A0=C2=A0 mkdir -p ${ROMOUNT}
>> +
>> +=C2=A0=C2=A0=C2=A0 # Remount OLDROOT as read-only
>> +=C2=A0=C2=A0=C2=A0 mount -o bind ${OLDROOT} ${ROMOUNT}
>> +=C2=A0=C2=A0=C2=A0 mount -o remount,ro ${ROMOUNT}
>> +
>> +=C2=A0=C2=A0=C2=A0 # Mount RW overlay
>> +=C2=A0=C2=A0=C2=A0 mount -t overlay overlay -o=20
>> lowerdir=3D${ROMOUNT},upperdir=3D${UPPER_DIR},workdir=3D${WORK_DIR}=20
>> ${NEWROOT} || exit_gracefully "initramfs-overlayroot: Mounting=20
>> overlay failed"
>> +else
>> +=C2=A0=C2=A0=C2=A0 exit_gracefully "initramfs-overlayroot: Mounting R=
W device failed"
>> +fi
>> +
>> +# Set up filesystems on overlay
>> +mkdir -p ${NEWROOT}/proc
>> +mkdir -p ${NEWROOT}/dev
>> +mkdir -p ${NEWROOT}/sys
>> +mkdir -p ${NEWROOT}/rofs
>> +
>> +mount -n --move ${ROMOUNT} ${NEWROOT}/rofs
>> +mount -n --move /proc ${NEWROOT}/proc
>> +mount -n --move /sys ${NEWROOT}/sys
>> +mount -n --move /dev ${NEWROOT}/dev
>> +
>> +exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} ||=20
>> exit_gracefully "Couldn't chroot into overlay"
>> diff --git=20
>> a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb=20
>> b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> index 9e8c1dc3ab..4e76e20026 100644
>> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
>> @@ -18,6 +18,7 @@ SRC_URI =3D "file://init \
>> file://e2fs \
>> file://debug \
>> file://lvm \
>> + file://overlayroot \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 =C2=A0 S =3D "${WORKDIR}"
>> @@ -49,6 +50,9 @@ do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # lvm
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/lvm ${D}/ini=
t.d/09-lvm
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 # overlayroot needs to run after rootfs mod=
ule but before finish
>> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d=
/91-overlayroot
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Create device nodes expected by some =
kernels in initramfs
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # before even executing /init.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/dev
>> @@ -64,6 +68,7 @@ PACKAGES =3D "${PN}-base \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 initramfs-module-rootfs \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 initramfs-module-debug \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 initramfs-module-lvm \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
itramfs-module-overlayroot \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>> =C2=A0 =C2=A0 FILES:${PN}-base =3D "/init /init.d/99-finish /dev"
>> @@ -107,3 +112,7 @@ FILES:initramfs-module-debug =3D "/init.d/00-debug=
"
>> =C2=A0 SUMMARY:initramfs-module-lvm =3D "initramfs lvm rootfs support"
>> =C2=A0 RDEPENDS:initramfs-module-lvm =3D "${PN}-base"
>> =C2=A0 FILES:initramfs-module-lvm =3D "/init.d/09-lvm"
>> +
>> +SUMMARY:initramfs-module-overlayroot =3D "initramfs support for=20
>> mounting a RW overlay on top of a RO root filesystem"
>> +RDEPENDS:initramfs-module-overlayroot =3D "${PN}-base=20
>> initramfs-module-rootfs"
>> +FILES:initramfs-module-overlayroot =3D "/init.d/91-overlayroot"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161137):https://lists.openembedded.org/g/openembedd=
ed-core/message/161137
> Mute This Topic:https://lists.openembedded.org/mt/88773634/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
alhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------dp0f2AqYVuGVpOt0JeJ5sQOO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Courier New, Courier, monospace">Hey Vyacheslav,</fo=
nt></p>
    <p><font face=3D"Courier New, Courier, monospace">Yes, in this case i=
t
        is different and its specifically required if we want to overlay
        the entire rootfs, also like it says in the commit message and
        in the comments giving credit to the overlay-etc class I
        definitely tried extending the overlay-etc class but it simply
        does not work for this, since the rootfs becomes inaccessible
        once the system has booted, hence why this has to be done inside
        initramfs, this isn't meant to replace the overlay-etc class in
        any way, just to provide an alternative if it fits the user
        needs better.<br>
      </font></p>
    <p><font face=3D"Courier New, Courier, monospace">Also, my apologies,
        your reply to my v1 somehow slipped through my filter and I
        hadn't seen it.<br>
      </font></p>
    <p><font face=3D"Courier New, Courier, monospace">I think they are
        simply two different scenarios, I can see the potential the
        overlay-etc class has to be extended for other directories for
        example, but it is a different use case and boot flow so I
        believe both can co-exist for different workflows depending on
        the user needs.<br>
      </font></p>
    <p><font face=3D"Courier New, Courier, monospace">Cheers,<br>
      </font></p>
    <p><font face=3D"Courier New, Courier, monospace">Alejandro</font><br=
>
    </p>
    <div class=3D"moz-cite-prefix">On 1/31/22 20:36, Vyacheslav Yurkov
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:10c1ea08-3b69-aeef-6052-41ad98f37ce6@gmail.com">Hi
      Alejandro,
      <br>
      Thanks for the v2, but my questions from v1 are still left
      unanswered.
      <br>
      <br>
      1. Do you really need the whole rootfs to be in overlay? Perhaps
      you have another use case in mind, but the more scope overlay has,
      the more migration effort you need in order to update upper layer
      on image upgrade.
      <br>
      2. I was thinking if perhaps that would be better to extend
      files/overlayfs-etc-preinit.sh.in to suit your needs and re-use
      common parts rather then having a good part of it copied to
      initramfs-framework?
      <br>
      <br>
      Cheers,
      <br>
      Vyacheslav
      <br>
      <br>
      On 29.01.2022 20:48, Alejandro Hernandez Samaniego wrote:
      <br>
      <blockquote type=3D"cite">When installed, this module mounts a
        read-write (RW) overlay on
        <br>
        top of a root filesystem, which is kept read-only (RO), free
        <br>
        from modifications by the user, this might prove to be useful
        <br>
        if we want to access or restore the original unmodified rootfs.
        <br>
        <br>
        The existing overlay-etc.bbclass does something similar, it
        <br>
        mounts an overlay on top of the /etc directory, however doing
        <br>
        the same for root causes the original root to be inaccessible
        <br>
        once the system is booted, hence why this module is added to
        <br>
        the initramfs boot flow, allowing us to mount the RW overlay,
        <br>
        while keeping the original rootfs mounted at /rofs once the
        <br>
        system finishes booting. This script is loosely based on that
        <br>
        class.
        <br>
        <br>
        This module requires rootrw=3D&lt;foo&gt; to be passed as a kerne=
l
        <br>
        parameter to specify the device/partition to be used as RW by
        the
        <br>
        overlay and has a dependency on overlayfs support being present
        <br>
        in the running kernel.
        <br>
        <br>
        It does not require the read-only IMAGE_FEATURE to be enabled.
        <br>
        <br>
        The module needs to be executed after the
        initramfs-module-rootfs
        <br>
        since it relies on it to mount the filesystem at initramfs
        startup
        <br>
        but before the finish module which normally switches root.
        <br>
        After overlayroot is executed the usual boot flow continues from
        <br>
        the real init process.
        <br>
        <br>
        If something goes wrong while running this module, the rootfs
        <br>
        is still mounted RO (with no overlay) and the finish module is
        <br>
        executed to continue booting normally.
        <br>
        <br>
        Its worth noting that, on purpose, this isnt installed by
        default
        <br>
        on any images that use initramfs-framework to keep the boot flow
        <br>
        unmodified, only when a user manually requests to install it,
        <br>
        then it becomes functional.
        <br>
        <br>
        Signed-off-by: Alejandro Enedino Hernandez Samaniego
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alhe@linux.micr=
osoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
        <br>
        ---
        <br>
        =C2=A0 .../initramfs-framework/overlayroot=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 112
        ++++++++++++++++++
        <br>
        =C2=A0 .../initrdscripts/initramfs-framework_1.0.bb=C2=A0 |=C2=A0=
=C2=A0 9 ++
        <br>
        =C2=A0 2 files changed, 121 insertions(+)
        <br>
        =C2=A0 create mode 100644
        meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
        <br>
        <br>
        diff --git
        a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
        <br>
        new file mode 100644
        <br>
        index 0000000000..d40342dc59
        <br>
        --- /dev/null
        <br>
        +++
        b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
        <br>
        @@ -0,0 +1,112 @@
        <br>
        +#!/bin/sh
        <br>
        +
        <br>
        +# SPDX-License-Identifier: MIT
        <br>
        +#
        <br>
        +# Copyright 2022 (C), Microsoft Corporation
        <br>
        +
        <br>
        +# Simple initramfs module intended to mount a read-write (RW)
        <br>
        +# overlayfs on top of /, keeping the original root filesystem
        <br>
        +# as read-only (RO), free from modifications by the user.
        <br>
        +#
        <br>
        +# NOTE: The read-only IMAGE_FEATURE is not required for this to
        work
        <br>
        +#
        <br>
        +# This script is based on the overlay-etc.bbclass, which sets
        up
        <br>
        +# an overlay on top of the /etc directory, but in this case
        allows
        <br>
        +# accessing the original, unmodified rootfs at /rofs after
        boot.
        <br>
        +#
        <br>
        +# It relies on the initramfs-module-rootfs to mount the
        original
        <br>
        +# root filesystem, and requires 'rootrw=3D&lt;foo&gt;' to be
        passed as a
        <br>
        +# kernel parameter, specifying the device/partition intended to
        <br>
        +# use as RW.
        <br>
        +#
        <br>
        +# This module needs to be executed after the
        initramfs-module-rootfs
        <br>
        +# since it relies on it to mount the filesystem at initramfs
        startup
        <br>
        +# but before the finish module which normally switches root.
        <br>
        +# After overlayroot is executed the usual boot flow continues
        from
        <br>
        +# the real init process.
        <br>
        +#
        <br>
        +# If something goes wrong while running this module, the rootfs
        <br>
        +# is still mounted RO (with no overlay) and the finish module
        is
        <br>
        +# executed to continue booting normally.
        <br>
        +#
        <br>
        +# It also has a dependency on overlayfs being enabled in the
        <br>
        +# running kernel via KERNEL_FEATURES (kmeta) or any other
        means.
        <br>
        +
        <br>
        +
        <br>
        +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
        <br>
        +
        <br>
        +# We get OLDROOT from the rootfs module
        <br>
        +OLDROOT=3D"/rootfs"
        <br>
        +
        <br>
        +NEWROOT=3D"${RWMOUNT}/root"
        <br>
        +RWMOUNT=3D"/overlay"
        <br>
        +ROMOUNT=3D"${RWMOUNT}/rofs"
        <br>
        +UPPER_DIR=3D"${RWMOUNT}/upper"
        <br>
        +WORK_DIR=3D"${RWMOUNT}/work"
        <br>
        +
        <br>
        +MODULES_DIR=3D/init.d
        <br>
        +
        <br>
        +# Something went wrong, make sure / is mounted as read only
        anyway.
        <br>
        +exit_gracefully() {
        <br>
        +=C2=A0=C2=A0=C2=A0 echo $1 &gt;/dev/console
        <br>
        +=C2=A0=C2=A0=C2=A0 echo &gt;/dev/console
        <br>
        +=C2=A0=C2=A0=C2=A0 echo "OverlayRoot mounting failed, starting s=
ystem as
        read-only" &gt;/dev/console
        <br>
        +=C2=A0=C2=A0=C2=A0 echo &gt;/dev/console
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 # The following is borrowed from
        rootfs-postcommands.bbclass
        <br>
        +=C2=A0=C2=A0=C2=A0 # This basically looks at the real rootfs mou=
nting options
        and
        <br>
        +=C2=A0=C2=A0=C2=A0 # replaces them with "ro"
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 # Tweak the mount option and fs_passno for ro=
otfs in fstab
        <br>
        +=C2=A0=C2=A0=C2=A0 if [ -f ${OLDROOT}/etc/fstab ]; then
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e
'/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)=
\([[:space:]]*\)[[:digit:]]$/\1\20/}'
        ${OLDROOT}/etc/fstab
        <br>
        +=C2=A0=C2=A0=C2=A0 fi
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 # Tweak the "mount -o remount,rw /" command i=
n
        busybox-inittab inittab
        <br>
        +=C2=A0=C2=A0=C2=A0 if [ -f ${OLDROOT}/etc/inittab ]; then
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i 's|/bin/mount =
-o remount,rw /|/bin/mount -o
        remount,ro /|' ${OLDROOT}/etc/inittab
        <br>
        +=C2=A0=C2=A0=C2=A0 fi
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 # Continue as if the overlayroot module didn'=
t exist to
        continue booting
        <br>
        +=C2=A0=C2=A0=C2=A0 . $MODULES_DIR/99-finish
        <br>
        +=C2=A0=C2=A0=C2=A0 eval "finish_run"
        <br>
        +}
        <br>
        +
        <br>
        +
        <br>
        +if [ -z "$bootparam_rootrw" ]; then
        <br>
        +=C2=A0=C2=A0=C2=A0 exit_gracefully "rootrw=3D kernel parameter d=
oesn't exist and
        its required to mount the overlayfs"
        <br>
        +fi
        <br>
        +
        <br>
        +mkdir -p ${RWMOUNT}
        <br>
        +
        <br>
        +# Mount RW device
        <br>
        +if mount -n -t ${bootparam_rootfstype:-ext4} -o
        ${bootparam_rootflags:-defaults} ${bootparam_rootrw} ${RWMOUNT}
        <br>
        +then
        <br>
        +=C2=A0=C2=A0=C2=A0 # Set up overlay directories
        <br>
        +=C2=A0=C2=A0=C2=A0 mkdir -p ${UPPER_DIR}
        <br>
        +=C2=A0=C2=A0=C2=A0 mkdir -p ${WORK_DIR}
        <br>
        +=C2=A0=C2=A0=C2=A0 mkdir -p ${NEWROOT}
        <br>
        +=C2=A0=C2=A0=C2=A0 mkdir -p ${ROMOUNT}
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 # Remount OLDROOT as read-only
        <br>
        +=C2=A0=C2=A0=C2=A0 mount -o bind ${OLDROOT} ${ROMOUNT}
        <br>
        +=C2=A0=C2=A0=C2=A0 mount -o remount,ro ${ROMOUNT}
        <br>
        +
        <br>
        +=C2=A0=C2=A0=C2=A0 # Mount RW overlay
        <br>
        +=C2=A0=C2=A0=C2=A0 mount -t overlay overlay -o
        lowerdir=3D${ROMOUNT},upperdir=3D${UPPER_DIR},workdir=3D${WORK_DI=
R}
        ${NEWROOT} || exit_gracefully "initramfs-overlayroot: Mounting
        overlay failed"
        <br>
        +else
        <br>
        +=C2=A0=C2=A0=C2=A0 exit_gracefully "initramfs-overlayroot: Mount=
ing RW device
        failed"
        <br>
        +fi
        <br>
        +
        <br>
        +# Set up filesystems on overlay
        <br>
        +mkdir -p ${NEWROOT}/proc
        <br>
        +mkdir -p ${NEWROOT}/dev
        <br>
        +mkdir -p ${NEWROOT}/sys
        <br>
        +mkdir -p ${NEWROOT}/rofs
        <br>
        +
        <br>
        +mount -n --move ${ROMOUNT} ${NEWROOT}/rofs
        <br>
        +mount -n --move /proc ${NEWROOT}/proc
        <br>
        +mount -n --move /sys ${NEWROOT}/sys
        <br>
        +mount -n --move /dev ${NEWROOT}/dev
        <br>
        +
        <br>
        +exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} ||
        exit_gracefully "Couldn't chroot into overlay"
        <br>
        diff --git
        a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
        b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
        <br>
        index 9e8c1dc3ab..4e76e20026 100644
        <br>
        --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
        <br>
        +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
        <br>
        @@ -18,6 +18,7 @@ SRC_URI =3D "<a class=3D"moz-txt-link-freetext"=
 href=3D"file://init">file://init</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file://e2fs">file://e2f=
s</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file://debug">file://de=
bug</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a class=3D"moz-txt-link-freetext" href=3D"file://lvm">file://lvm<=
/a> \
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a =
class=3D"moz-txt-link-freetext" href=3D"file://overlayroot">file://overla=
yroot</a> \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
        <br>
        =C2=A0 =C2=A0 S =3D "${WORKDIR}"
        <br>
        @@ -49,6 +50,9 @@ do_install() {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # lvm
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/lvm ${D=
}/init.d/09-lvm
        <br>
        =C2=A0 +=C2=A0=C2=A0=C2=A0 # overlayroot needs to run after rootf=
s module but before
        finish
        <br>
        +=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/overlayroot
        ${D}/init.d/91-overlayroot
        <br>
        +
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Create device nodes expected by =
some kernels in
        initramfs
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # before even executing /init.
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/dev
        <br>
        @@ -64,6 +68,7 @@ PACKAGES =3D "${PN}-base \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 initramfs-module-rootfs \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 initramfs-module-debug \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 initramfs-module-lvm \
        <br>
        +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 initramfs-module-overlayroot \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "
        <br>
        =C2=A0 =C2=A0 FILES:${PN}-base =3D "/init /init.d/99-finish /dev"
        <br>
        @@ -107,3 +112,7 @@ FILES:initramfs-module-debug =3D
        "/init.d/00-debug"
        <br>
        =C2=A0 SUMMARY:initramfs-module-lvm =3D "initramfs lvm rootfs sup=
port"
        <br>
        =C2=A0 RDEPENDS:initramfs-module-lvm =3D "${PN}-base"
        <br>
        =C2=A0 FILES:initramfs-module-lvm =3D "/init.d/09-lvm"
        <br>
        +
        <br>
        +SUMMARY:initramfs-module-overlayroot =3D "initramfs support for
        mounting a RW overlay on top of a RO root filesystem"
        <br>
        +RDEPENDS:initramfs-module-overlayroot =3D "${PN}-base
        initramfs-module-rootfs"
        <br>
        +FILES:initramfs-module-overlayroot =3D "/init.d/91-overlayroot"
        <br>
      </blockquote>
      <br>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#161137): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/161137">https:/=
/lists.openembedded.org/g/openembedded-core/message/161137</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88773634/4354175">https://lists.openembedded.org/mt/=
88773634/4354175</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------dp0f2AqYVuGVpOt0JeJ5sQOO--

