Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB997C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 09:21:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web08.5467.1665652856143874490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 02:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dXaSRtsE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C8B9540007;
	Thu, 13 Oct 2022 09:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665652854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AGrPZj8AKPPTBydteYQQANUhW27YsnCjlr8hTip19pI=;
	b=dXaSRtsETq1DCcscaAn7wHqsZnCKKKT1uRtL1VIfIBV0xxMQJNcw/RbLtDCayAKTcG7gmH
	S42ptQo9EytFWOWTDIQ2sleTZlzLIedRniTLk98xZkM+IE4fBmWb6ms/JwfwLms7RVO/RE
	a4au8PfyP+ktINAV1PiJV3tgomuxAn9e1R+W08DgvO++kkA0y2wsU+X4blQGPmyV7GOfGz
	fuEMGKNzF5FHQZ0YCX4fM8g+CGG5+1duFtlyQPUfDF1xyrL3IaagAysee38IcFWHhd4K8C
	nI9R9znl3AvJ7ZgOZycukYpZHHoHY/rHIeHK0FSs4LXvJsIoyXP5SjSLAWj85Q==
Date: Thu, 13 Oct 2022 11:20:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wic: honor the SOURCE_DATE_EPOCH in case of
 updated fstab
Message-ID: <Y0fYdfplwcPbjzLv@mail.local>
References: <20221012085309.9041-1-s.zhmylev@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221012085309.9041-1-s.zhmylev@yadro.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171695

Hello,

This seems to have caused the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/6301/step=
s/13/logs/stdio

| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/build-applia=
nce/build/meta/recipes-bsp/grub/grub-efi_2.06.bb:do_populate_sysroot', '/ho=
me/pokybuild/yocto-worker/build-appliance/build/meta/recipes-core/glibc/cro=
ss-localedef-native_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo=
rker/build-appliance/build/meta/recipes-core/glibc/ldconfig-native_2.12.1.b=
b:do_populate_sysroot', '/home/pokybuild/yocto-worker/build-appliance/build=
/meta/recipes-core/os-release/os-release.bb:do_populate_sysroot', '/home/po=
kybuild/yocto-worker/build-appliance/build/meta/recipes-core/systemd/system=
d-boot_251.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/build-a=
ppliance/build/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_pop=
ulate_sysroot', '/home/pokybuild/yocto-worker/build-appliance/build/meta/re=
cipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_populate_sysroot', '/hom=
e/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/python=
/python3_3.10.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/buil=
d-appliance/build/meta/recipes-devtools/qemu/qemu-system-native_7.1.0.bb:do=
_populate_sysroot', '/home/pokybuild/yocto-worker/build-appliance/build/met=
a/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/ho=
me/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/sysli=
nux/syslinux_6.04-pre2.bb:do_populate_sysroot', '/home/pokybuild/yocto-work=
er/build-appliance/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.b=
b:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-=
appliance/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_populat=
e_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance/bu=
ild/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.19.1.bb:do_populate_sys=
root', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance/build/m=
eta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb:do_populate_sysroo=
t', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance/build/meta=
/recipes-devtools/dnf/dnf_4.14.0.bb:do_populate_sysroot', 'virtual:native:/=
home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/dos=
fstools/dosfstools_4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokyb=
uild/yocto-worker/build-appliance/build/meta/recipes-devtools/e2fsprogs/e2f=
sprogs_1.46.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoct=
o-worker/build-appliance/build/meta/recipes-devtools/erofs-utils/erofs-util=
s_1.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker=
/build-appliance/build/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb:do_pop=
ulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-applianc=
e/build/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb:do_populate_sysroo=
t', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance/build/meta=
/recipes-devtools/mtools/mtools_4.0.41.bb:do_populate_sysroot', 'virtual:na=
tive:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtoo=
ls/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot', 'virtual:native:/ho=
me/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/opkg/=
opkg_0.6.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-w=
orker/build-appliance/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_p=
opulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-applia=
nce/build/meta/recipes-devtools/python/python3-installer_0.5.1.bb:do_popula=
te_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance/b=
uild/meta/recipes-devtools/python/python3-picobuild_0.2.bb:do_populate_sysr=
oot', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance/build/me=
ta/recipes-devtools/python/python3-pip_22.2.2.bb:do_populate_sysroot', 'vir=
tual:native:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes=
-devtools/python/python3-setuptools_65.0.2.bb:do_populate_sysroot', 'virtua=
l:native:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-de=
vtools/python/python3-wheel_0.37.1.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/p=
ython/python3_3.10.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybui=
ld/yocto-worker/build-appliance/build/meta/recipes-devtools/rpm/rpm_4.18.0.=
bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build=
-appliance/build/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb=
:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-a=
ppliance/build/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb:do_popu=
late_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/build-appliance=
/build/meta/recipes-extended/parted/parted_3.5.bb:do_populate_sysroot', 'vi=
rtual:native:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipe=
s-extended/pigz/pigz_2.7.bb:do_populate_sysroot', 'virtual:native:/home/pok=
ybuild/yocto-worker/build-appliance/build/meta/recipes-extended/zip/zip_3.0=
=2Ebb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/bu=
ild-appliance/build/meta/recipes-support/bmap-tools/bmap-tools_git.bb:do_po=
pulate_sysroot']
| NOTE: Installed into sysroot: ['dosfstools-native', 'gptfdisk-native', 'p=
arted-native']
| NOTE: Skipping as already exists in sysroot: ['grub-efi', 'cross-localede=
f-native', 'ldconfig-native', 'os-release', 'systemd-boot', 'binutils-cross=
-x86_64', 'cdrtools-native', 'python3', 'qemu-system-native', 'qemuwrapper-=
cross', 'syslinux', 'depmodwrapper-cross', 'update-rc.d-native', 'btrfs-too=
ls-native', 'createrepo-c-native', 'dnf-native', 'e2fsprogs-native', 'erofs=
-utils-native', 'makedevs-native', 'mtools-native', 'opkg-utils-native', 'o=
pkg-native', 'pseudo-native', 'python3-installer-native', 'python3-picobuil=
d-native', 'python3-pip-native', 'python3-setuptools-native', 'python3-whee=
l-native', 'python3-native', 'rpm-native', 'squashfs-tools-native', 'syslin=
ux-native', 'pigz-native', 'zip-native', 'bmap-tools-native', 'shadow-nativ=
e', 'mkfontscale-native', 'python3-flit-core-native', 'texinfo-dummy-native=
', 'libtool-native', 'gtk+3-native', 'gdk-pixbuf-native', 'util-linux-libuu=
id-native', 'lz4-native', 'python3-six-native', 'coreutils-native', 'libarc=
hive-native', 'libsolv-native', 'e2fsprogs', 'glibc', 'util-linux', 'gcc-ru=
ntime', 'gdbm-native', 'openssl-native', 'zlib-native', 'sqlite3-native', '=
libtirpc-native', 'libnsl2-native', 'bzip2-native', 'readline-native', 'xz-=
native', 'ncurses-native', 'libffi-native', 'desktop-file-utils-native', 's=
hared-mime-info-native', 'debianutils-native', 'qemu-native', 'perl-native'=
, 'gettext-minimal-native', 'file-native', 'libgcrypt-native', 'elfutils-na=
tive', 'zstd-native', 'popt-native', 'lua-native', 'util-linux-native', 'ba=
se-passwd', 'glib-2.0-native', 'virglrenderer-native', 'dtc-native', 'libep=
oxy-native', 'alsa-lib-native', 'libsdl2-native', 'pixman-native', 'curl-na=
tive', 'cmake-native', 'expat-native', 'libxml2-native', 'lzo-native', 'att=
r-native', 'gnu-efi', 'libcap', 'kmod-native', 'nasm-native', 'gconf-native=
', 'openssl', 'readline', 'sqlite3', 'ncurses', 'zlib', 'gdbm', 'util-linux=
-libuuid', 'bzip2', 'libtirpc', 'libffi', 'libnsl2', 'libxcrypt', 'opkg-uti=
ls', 'xz', 'gnu-config-native', 'flex-native', 'librepo-native', 'python3-i=
niparse-native', 'libdnf-native', 'libcomps-native', 'libfontenc-native', '=
freetype-native', 'util-macros-native', 'xorgproto-native', 'unzip-native',=
 'libxdamage-native', 'libxi-native', 'atk-native', 'pango-native', 'libxex=
t-native', 'at-spi2-atk-native', 'libjpeg-turbo-native', 'libxfixes-native'=
, 'fontconfig-native', 'libxcursor-native', 'gobject-introspection-native',=
 'libxcomposite-native', 'libxrender-native', 'libpng-native', 'libx11-nati=
ve', 'libxrandr-native', 'cairo-native', 'attr', 'autoconf-archive', 'linux=
-libc-headers', 'bash-completion', 'libcap-ng', 'libgcc', 'itstool-native',=
 'make-native', 'libcap-native', 'libgpg-error-native', 'libmicrohttpd-nati=
ve', 'libpcre2-native', 'libcap-ng-native', 'gettext-native', 'libpcre-nati=
ve', 'libdrm-native', 'mesa-native', 'groff-native', 'dbus-native', 'intlto=
ol-native', 'dbus-glib-native', 'm4-native', 'gpgme-native', 'libcheck-nati=
ve', 'libmodulemd-native', 'swig-native', 'json-c-native', 'font-util-nativ=
e', 'fribidi-native', 'harfbuzz-native', 'libxft-native', 'at-spi2-core-nat=
ive', 'xtrans-native', 'libxcb-native', 'libsm-native', 'gnutls-native', 'l=
ibpciaccess-native', 'libpthread-stubs-native', 'xrandr-native', 'wayland-n=
ative', 'wayland-protocols-native', 'python3-mako-native', 'chrpath-native'=
, 'libxshmfence-native', 'makedepend-native', 'libxxf86vm-native', 'libxml-=
parser-perl-native', 'libassuan-native', 'libyaml-native', 'icu-native', 'l=
ibxtst-native', 'libxau-native', 'libxdmcp-native', 'xcb-proto-native', 'li=
bice-native', 'libunistring-native', 'nettle-native', 'libidn2-native', 'gm=
p-native', 'python3-pygments-native', 'python3-markupsafe-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 1308850.400000 =3D 1006808 * 1.300000
| DEBUG: 43354290.400000 =3D max(1308850.400000, 65536)[1308850.400000] + 4=
2045440
| DEBUG: 43354291.000000 =3D int(43354290.400000)
| DEBUG: 43354291 =3D aligned(43354291)
| DEBUG: returning 43354291
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
|=20
| ERROR: _exec_cmd: export PATH=3D/home/pokybuild/yocto-worker/build-applia=
nce/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0=
-r0/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/build-appliance=
/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0=
/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/build-applianc=
e/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r=
0/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/build-applianc=
e/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r=
0/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-wor=
ker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-applia=
nce-image/15.0.0-r0/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
build-appliance/build/build/tmp/hosttools:$PATH;export PSEUDO_PREFIX=3D/hom=
e/pokybuild/yocto-worker/build-appliance/build/build/tmp/sysroots-component=
s/x86_64/pseudo-native/usr;export PSEUDO_LOCALSTATEDIR=3D/home/pokybuild/yo=
cto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build=
-appliance-image/15.0.0-r0/rootfs/../pseudo;export PSEUDO_PASSWD=3D/home/po=
kybuild/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-l=
inux/build-appliance-image/15.0.0-r0/rootfs;export PSEUDO_NOSYMLINKEXP=3D1;=
export PSEUDO_IGNORE_PATHS=3D/home/pokybuild/yocto-worker/build-appliance/b=
uild/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/t=
mp-wic/rootfs_platform.2.ext4,/usr/,/etc/,/usr/lib,/dev/,/run/,/home/pokybu=
ild/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux=
/build-appliance-image/15.0.0-r0/temp,/home/pokybuild/yocto-worker/build-ap=
pliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15=
=2E0.0-r0/recipe-sysroot,/srv/autobuilder/autobuilder.yocto.io/pub/sstate,/=
home/pokybuild/yocto-worker/build-appliance/build/build/tmp/stamps,/home/po=
kybuild/yocto-worker/build-appliance/build/build/tmp/sstate-control,/home/p=
okybuild/yocto-worker/build-appliance/build/build/tmp/buildstats,/home/poky=
build/yocto-worker/build-appliance/build/build/tmp/sysroots-components,/hom=
e/pokybuild/yocto-worker/build-appliance/build/build/tmp/pkgdata,/home/poky=
build/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-lin=
ux/build-appliance-image/15.0.0-r0/deploy-,/home/pokybuild/yocto-worker/bui=
ld-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-ima=
ge/15.0.0-r0/sstate-build-package_,/home/pokybuild/yocto-worker/build-appli=
ance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.=
0-r0/sstate-install-package_,/home/pokybuild/yocto-worker/build-appliance/b=
uild/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/p=
kgdata-sysroot,/home/pokybuild/yocto-worker/build-appliance/build/build/tmp=
/deploy,/home/pokybuild/yocto-worker/build-appliance/build/build/cache,/hom=
e/pokybuild/yocto-worker/build-appliance/build/scripts,/home/pokybuild/yoct=
o-worker/build-appliance/build/meta/files/common-licenses,/home/pokybuild/y=
octo-worker/build-appliance/build/meta/COPYING,/home/pokybuild/yocto-worker=
/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance=
-image/15.0.0-r0/i686-deploy-build-appliance-image-populate-sdk,/home/pokyb=
uild/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linu=
x/build-appliance-image/15.0.0-r0/oe-sdk-repo,/home/pokybuild/yocto-worker/=
build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-=
image/15.0.0-r0/sstate-build-populate_sdk,/home/pokybuild/yocto-worker/buil=
d-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-imag=
e/15.0.0-r0/build-wic,/home/pokybuild/yocto-worker/build-appliance/build/bu=
ild/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/intercep=
t_scripts,/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work=
/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/oe-rootfs-repo,/home=
/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-pok=
y-linux/build-appliance-image/15.0.0-r0/sstate-build-image_complete,/home/p=
okybuild/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-=
linux/build-appliance-image/15.0.0-r0/build-appliance-image-15.0.0,/home/po=
kybuild/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-l=
inux/build-appliance-image/15.0.0-r0/build-appliance-image-15.0.0;/home/pok=
ybuild/yocto-worker/build-appliance/build/build/tmp/sysroots-components/x86=
_64/pseudo-native/usr/bin/pseudo fsck.ext4 -pvfD /home/pokybuild/yocto-work=
er/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-applian=
ce-image/15.0.0-r0/tmp-wic/rootfs_platform.2.ext4 returned '1' instead of 0
| output: platform: Superblock last write time (Sun Sep 18 23:05:48 2072,
| 	now =3D Thu Oct 13 08:33:43 2022) is in the future.
| FIXED.
|=20
|        57969 inodes used (0.82%, out of 7045120)
|            9 non-contiguous files (0.0%)
|           33 non-contiguous directories (0.1%)
|              # of inodes with ind/dind/tind blocks: 0/0/0
|              Extent depth histogram: 56728/10
|       770336 blocks used (5.47%, out of 14090144)
|            0 bad blocks
|            1 large file
|=20
|        47374 regular files
|         9238 directories
|            0 character device files
|            0 block device files
|            1 fifo
|         1203 links
|         1347 symbolic links (1222 fast symbolic links)
|            0 sockets
| ------------
|        59163 files
|=20
| WARNING: exit code 1 from a shell command.
NOTE: recipe build-appliance-image-15.0.0-r0: task do_image_wic: Failed

On 12/10/2022 11:53:09+0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> In case user requested to build a binary repeatable package,
> it's required to honor the SOURCE_DATE_EPOCH environment
> variable. So forcefully set mtime inside all the routines
> which modify fstab in case it is updated.
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  scripts/lib/wic/partition.py             | 5 ++++-
>  scripts/lib/wic/plugins/imager/direct.py | 3 +++
>  scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>  3 files changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index e50871b8d7..cac1bab4dd 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -291,6 +291,9 @@ class Partition():
>          if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
>              debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
>              with open(debugfs_script_path, "w") as f:
> +                if os.getenv('SOURCE_DATE_EPOCH'):
> +                    fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
> +                    f.write("set_current_time %s\n" % (fstab_time))
>                  f.write("cd etc\n")
>                  f.write("rm fstab\n")
>                  f.write("write %s fstab\n" % (self.updated_fstab_path))
> @@ -353,7 +356,7 @@ class Partition():
>          exec_native_cmd(mcopy_cmd, native_sysroot)
> =20
>          if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
> -            mcopy_cmd =3D "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.=
updated_fstab_path)
> +            mcopy_cmd =3D "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, se=
lf.updated_fstab_path)
>              exec_native_cmd(mcopy_cmd, native_sysroot)
> =20
>          chmod_cmd =3D "chmod 644 %s" % rootfs
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/p=
lugins/imager/direct.py
> index da483daed5..3e766972b4 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -149,6 +149,9 @@ class DirectPlugin(ImagerPlugin):
>              self.updated_fstab_path =3D os.path.join(self.workdir, "fsta=
b")
>              with open(self.updated_fstab_path, "w") as f:
>                  f.writelines(fstab_lines)
> +            if os.getenv('SOURCE_DATE_EPOCH'):
> +                fstab_time =3D int(os.getenv('SOURCE_DATE_EPOCH'))
> +                os.utime(self.updated_fstab_path, (fstab_time, fstab_tim=
e))
> =20
>      def _full_path(self, path, name, extention):
>          """ Construct full file path to a file we generate. """
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/p=
lugins/source/rootfs.py
> index fc06312ee4..e29f3a4c2f 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -224,7 +224,7 @@ class RootfsPlugin(SourcePlugin):
>              if part.update_fstab_in_rootfs and part.has_fstab and not pa=
rt.no_fstab_update:
>                  fstab_path =3D os.path.join(new_rootfs, "etc/fstab")
>                  # Assume that fstab should always be owned by root with =
fixed permissions
> -                install_cmd =3D "install -m 0644 %s %s" % (part.updated_=
fstab_path, fstab_path)
> +                install_cmd =3D "install -m 0644 -p %s %s" % (part.updat=
ed_fstab_path, fstab_path)
>                  if new_pseudo:
>                      pseudo =3D cls.__get_pseudo(native_sysroot, new_root=
fs, new_pseudo)
>                  else:
> --=20
> 2.37.2
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171660): https://lists.openembedded.org/g/openembedde=
d-core/message/171660
> Mute This Topic: https://lists.openembedded.org/mt/94276997/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

