Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3491DC61DE5
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 12:15:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18758.1771676146651627513
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 04:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1sy5YSEA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7C75E4E40AC8;
	Sat, 21 Feb 2026 12:15:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 529465FB54;
	Sat, 21 Feb 2026 12:15:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E554410368D4B;
	Sat, 21 Feb 2026 13:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771676143; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lsM/l7rQT/Xz/yfVESVOuS5hR11QJaWNz8yYnCyIgco=;
	b=1sy5YSEAgD0Oz1nVNhUKekIjuGx9Qfp6VcTmH7nRDPgHReXOQmoc/OIU3Goixp1xTjHCpE
	aXguwE6O0riHvW0QTEjzs4Obw9OyqF3KWt2tE51dV5Ynyiehzztbl7EYzP7Wy7tFOpgcvE
	LJmQF1M3MKVfZvuahSwk7VyWL4w2syBwcse1GtjwTR5+ufvuKfGb75yvKtkWMAaQKhKRMa
	NHAkdHgkjz2fO6gR5rmTTqSaWDJK87LKOckSpMzXu1o/rzJ9e51QM0bqWegFdapcXHVKDx
	R7eC6xcGkl3xE2KqxgGtoEocF6irj91HKOlbWODaqDMoHSws4Yfixjsel+01rQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 13:15:40 +0100
Message-Id: <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
 <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
In-Reply-To: <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 12:15:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231616

On Fri Feb 20, 2026 at 6:27 AM CET, Robert Yang via lists.openembedded.org =
wrote:
> Hi Mathieu,
>
>
> On 2/19/26 01:50, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>> On Wed Feb 18, 2026 at 1:22 PM CET, Robert Yang via lists.openembedded.o=
rg wrote:
>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> * V6
>>>    - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>>>
>>> * V5
>>>    - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>>>    - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependen=
cies
>>>      between /bin/sh and libc.so.
>>>
>>> * V4
>>>    - Fix loop dependencies issues for libc6 and busybox
>>>    - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>>>
>>> * V3
>>>    - Fix Alexender's comments
>>>      a) Suppot rpm 6
>>>      b) Move rpm-setup-autosign to rpm-build
>>>      c) Remove -DLIBELF_FOUND=3DFalse
>>>
>>>    - Fix build for nativesdk-rpm
>>>
>>>    - Drop patch for createrepo-c since it has been upgraded (rev:
>>>      804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>>>
>>> * V1 & V2
>>>    - Initial version
>>>
>>> // Robert
>>>
>>> The following changes since commit 2c20c05b324e5d6564c85543810191708395=
09bb:
>>>
>>>    pseudo: Update to include an openat2 fix (2026-02-13 12:25:37 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/robertlinux/yocto rbt/rpm
>>>    https://github.com/robertlinux/yocto/tree/rbt/rpm
>>>
>>> for you to fetch changes up to 907fd664240474a2183fc4bf7bfa35f98c53c3d4=
:
>>>
>>>    rpm: 4.20.1 -> 6.0.1 (2026-02-18 10:02:04 +0000)
>>>
>>> ----------------------------------------------------------------
>>>
>>> Robert Yang (7):
>>=20
>> Hi Robert,
>>=20
>> Thanks for the new version.
>>=20
>> I believe we still have some issue:
>>=20
>> ERROR: core-image-sato-1.0-r0 do_populate_sdk: Could not invoke dnf. Com=
mand '/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx8=
6-poky-linux/core-image-sato/1.0/recipe-sysroot-native/usr/bin/dnf -v --rpm=
verbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/genericx86/build/build/t=
mp/work/genericx86-poky-linux/core-image-sato/1.0/sdk/image/usr/local/oe-sd=
k-hardcoded-buildpath/sysroots/core2-32-poky-linux/etc/dnf/dnf.conf --setop=
t=3Dreposdir=3D/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/=
genericx86-poky-linux/core-image-sato/1.0/sdk/image/usr/local/oe-sdk-hardco=
ded-buildpath/sysroots/core2-32-poky-linux/etc/yum.repos.d --installroot=3D=
/srv/pokybuild/yocto-worker/genericx86/build/build/tmp/work/genericx86-poky=
-linux/core-image-sato/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/s=
ysroots/core2-32-poky-linux --setopt=3Dlogdir=3D/srv/pokybuild/yocto-worker=
/genericx86/build/build/tmp/work/genericx86-poky-linux/core-image-sato/1.0/=
temp --repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/genericx86/build/=
build/tmp/work/genericx86-poky-linux/core-image-sato/1.0/oe-sdk-repo --seto=
pt=3Dinstall_weak_deps=3DFalse --nogpgcheck install acl-dbg acl-dev acl-src=
 acpid-dbg acpid-dev acpid-src adwaita-icon-theme-dbg adwaita-icon-theme-de=
v alsa-plugins-dbg alsa-plugins-dev alsa-plugins-src alsa-state-dbg alsa-st=
ate-dev alsa-utils-dbg alsa-utils-dev alsa-utils-src at-spi2-core-dbg at-sp=
i2-core-dev at-spi2-core-src attr-dbg attr-dev attr-src avahi-dbg avahi-dev=
 avahi-libnss-mdns-dbg avahi-libnss-mdns-dev avahi-libnss-mdns-src avahi-sr=
c base-files-dbg base-files-dev base-passwd-dbg base-passwd-dev base-passwd=
-src bluez5-dbg bluez5-dev bluez5-src busybox-dbg busybox-dev busybox-src b=
zip2-dbg bzip2-dev bzip2-src ca-certificates-dbg ca-certificates-dev connma=
n-dbg connman-dev connman-gnome-dbg connman-gnome-dev connman-gnome-src con=
nman-src consolekit-dbg consolekit-dev consolekit-src curl-dbg curl-dev cur=
l-src dbus-dbg dbus-dev dbus-src dbus-wait-dbg dbus-wait-dev dbus-wait-src =
debugedit-dbg debugedit-dev debugedit-src desktop-file-utils-dbg desktop-fi=
le-utils-dev desktop-file-utils-src dnf-dbg dnf-dev dropbear-dbg dropbear-d=
ev dropbear-src e2fsprogs-dbg e2fsprogs-dev e2fsprogs-src elfutils-dbg elfu=
tils-dev elfutils-src eudev-dbg eudev-dev eudev-src file-dbg file-dev file-=
src flac-dbg flac-dev flac-src formfactor-dbg formfactor-dev gcc-runtime-db=
g gcc-runtime-src gconf-dbg gconf-dev gconf-src glib-networking-dbg glib-ne=
tworking-dev glib-networking-src glibc-locale-dbg gnupg-dbg gnupg-dev gnupg=
-src go-dev go-runtime-dbg gpgme-dbg gpgme-dev gpgme-src grub-bootconf-dbg =
grub-bootconf-dev grub-dbg grub-dev grub-efi-dbg grub-efi-dev grub-efi-src =
grub-src gst-examples-dbg gst-examples-dev gst-examples-src gstreamer1.0-db=
g gstreamer1.0-dev gstreamer1.0-plugins-bad-dbg gstreamer1.0-plugins-bad-de=
v gstreamer1.0-plugins-bad-src gstreamer1.0-plugins-base-dbg gstreamer1.0-p=
lugins-base-dev gstreamer1.0-plugins-base-src gstreamer1.0-plugins-good-dbg=
 gstreamer1.0-plugins-good-dev gstreamer1.0-plugins-good-src gstreamer1.0-s=
rc gtk+3-dbg gtk+3-dev gtk+3-src hdparm-dbg hdparm-dev hdparm-src hicolor-i=
con-theme-dbg hicolor-icon-theme-dev icu-dbg icu-dev icu-src init-ifupdown-=
dbg init-ifupdown-dev init-system-helpers-dbg init-system-helpers-dev inits=
cripts-dbg initscripts-dev iptables-dbg iptables-dev iptables-src iw-dbg iw=
-dev iw-src kbd-dbg kbd-dev kbd-src kernel-dbg kernel-dev keymaps-dbg keyma=
ps-dev kmod-dbg kmod-dev kmod-src l3afpad-dbg l3afpad-dev l3afpad-src lame-=
dbg lame-src libacpi-dbg libacpi-dev libacpi-src libarchive-dbg libarchive-=
dev libarchive-src libasound-dbg libasound-dev libasound-src libassuan-dbg =
libassuan-dev libassuan-src libc6-src libcairo-dbg libcairo-dev libcairo-sr=
c libcap-dbg libcap-dev libcap-src libcomps-dbg libcomps-dev libcomps-src l=
ibcrypt-dbg libcrypt-dev libcrypt-src libdaemon-dbg libdaemon-dev libdaemon=
-src libdbus-glib-1-dbg libdbus-glib-1-dev libdbus-glib-1-src libdnf-dbg li=
bdnf-dev libdnf-src libdrm-dbg libdrm-dev libdrm-src libedit-dbg libedit-de=
v libedit-src libegl-mesa-dev libell-dbg libell-dev libell-src lib
>> ...
>> Error:
>>   Problem 1: conflicting requests
>>    - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.core2_3=
2 from oe-repo
>>   Problem 2: conflicting requests
>>    - nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev-0.1.2=
3-r0.core2_32 from oe-repo
>>   Problem 3: conflicting requests
>>    - nothing provides pkgconfig(ncurses) needed by libreadline-dev-8.3-r=
0.core2_32 from oe-repo
>>   Problem 4: package libsndfile-dev-1.2.2-r0.core2_32 from oe-repo requi=
res flac-dev, but none of the providers can be installed
>>    - conflicting requests
>>    - nothing provides pkgconfig(ogg) needed by flac-dev-1.5.0-r0.core2_3=
2 from oe-repo
>> (try to add '--skip-broken' to skip uninstallable packages)
>
> I'm sorry about that, but I can't reproduce the error, here are my settin=
gs:
>
> PACKAGE_CLASSES =3D "package_rpm"
> MACHINE =3D "genericx86"
> DISTRO =3D "poky"
>
> $ bitbake core-image-sato -cpopulate_sdk
>
> I checked=20
> tmp/deploy/sdk/poky-glibc-x86_64-core-image-sato-core2-32-genericx86-tool=
chain-5.3.99+snapshot.target.manifest,
> All the required packages are installed correctly:
>
> flac-dev core2_32 1.5.0
> libcomps-dev core2_32 0.1.23
> libreadline-dev core2_32 8.3
> libogg-dev core2_32 1.3.6
> libxml2-dev core2_32 2.15.1
> ncurses-dev core2_32 6.5
>
> I also tested with IMAGE_CLASSES +=3D "testimage", it also works well.
>
> Do you have more info on how I can reproduce the issue, please?
>
>

Hi Robert,

I tried to reproduce it locally yesterday, and I had the same issue: the
failure did not reproduce. Yet I tried again to apply your patches and
got a similar error on the autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3218

I will try to investigate this next week.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


