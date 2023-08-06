Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B752C001DE
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 12:38:26 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10300.1691325501455883177
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 05:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gd0P3eeK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 420BF40003;
	Sun,  6 Aug 2023 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691325498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKXkoOo8/IiJUYhwN1O091kAGgqJBmVScF79pUElCEE=;
	b=Gd0P3eeKeo5tXsqJJjxd6vUuwhV7cQlsYQSEjqBzYtzJXup4qHlXPjcOvRRj7uFRSDVi7w
	Lw4Et2GH5qKUA0K2qXTHVO1NtNxfcxZ/uUHzYpVtlSEt8mLwCQEEKUehuR7i6hBg7ZbVvM
	zNlNwbcdUyIqvzXAaIQe6KEcEkoL1XPb/p+DTI7xGaIy+E7ziJw0hRWckVZ5Mt6uUqJyLE
	kOUT9K2uRXfUiuZS02RWkY8nqO810atkkwJb/tFVL2Tuva+g5ZuYZ1c+Coec02SDx/vekF
	G8CsB5C5f4G7eITZ4IJRFXt+Eu0fkeWk79EtxfRnHZJS2SOfoS7s0TjOexQ4rw==
Date: Sun, 6 Aug 2023 14:38:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
Message-ID: <202308061238184bdb334c@mail.local>
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230802231615.2106089-1-luca.boccassi@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 12:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185564

Hello,

I have high suspicions that the upgrade causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5559/step=
s/14/logs/stdio

ERROR: core-image-minimal-1.0-r0 do_image_wic: ExecutionError('/home/pokybu=
ild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86=
_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do_image_wic.1308950', 1,=
 None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/oe-selfte=
st-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-image-=
minimal/1.0-r0/temp/log.do_image_wic.1308950
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/meta/recipes-bsp/grub/grub-efi_2.06.bb:do_populate_sysroot', '=
/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core/gli=
bc/cross-localedef-native_2.37.bb:do_populate_sysroot', '/home/pokybuild/yo=
cto-worker/oe-selftest-fedora/build/meta/recipes-core/glibc/ldconfig-native=
_2.12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/meta/recipes-core/os-release/os-release.bb:do_populate_sysroot=
', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core=
/systemd/systemd-boot_254.bb:do_populate_sysroot', '/home/pokybuild/yocto-w=
orker/oe-selftest-fedora/build/meta/recipes-devtools/binutils/binutils-cros=
s_2.41.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_popul=
ate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/r=
ecipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/home/=
pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/sysli=
nux/syslinux_6.04-pre2.bb:do_populate_sysroot', '/home/pokybuild/yocto-work=
er/oe-selftest-fedora/build/meta/recipes-kernel/kmod/depmodwrapper-cross_1.=
0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-=
selftest-fedora/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_p=
opulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.1.bb:do_popu=
late_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fed=
ora/build/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb:do_popu=
late_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fed=
ora/build/meta/recipes-devtools/dnf/dnf_4.16.1.bb:do_populate_sysroot', 'vi=
rtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/rec=
ipes-devtools/dosfstools/dosfstools_4.2.bb:do_populate_sysroot', 'virtual:n=
ative:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-de=
vtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot', 'virtual:native:=
/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools=
/erofs-utils/erofs-utils_1.6.bb:do_populate_sysroot', 'virtual:native:/home=
/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/fdis=
k/gptfdisk_1.0.9.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y=
octo-worker/oe-selftest-fedora/build/meta/recipes-devtools/makedevs/makedev=
s_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-work=
er/oe-selftest-fedora/build/meta/recipes-devtools/mtools/mtools_4.0.43.bb:d=
o_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selfte=
st-fedora/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_pop=
ulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fe=
dora/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',=
 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta=
/recipes-devtools/rpm/rpm_4.18.1.bb:do_populate_sysroot', 'virtual:native:/=
home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/=
squashfs-tools/squashfs-tools_git.bb:do_populate_sysroot', 'virtual:native:=
/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools=
/syslinux/syslinux_6.04-pre2.bb:do_populate_sysroot', 'virtual:native:/home=
/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/part=
ed/parted_3.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/meta/recipes-extended/pbzip2/pbzip2_1.1.1=
3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-=
selftest-fedora/build/meta/recipes-extended/pigz/pigz_2.7.bb:do_populate_sy=
sroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/bui=
ld/meta/recipes-support/bmap-tools/bmap-tools_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: ['cpio-native']
| NOTE: Skipping as already exists in sysroot: ['grub-efi', 'cross-localede=
f-native', 'ldconfig-native', 'os-release', 'systemd-boot', 'binutils-cross=
-x86_64', 'cdrtools-native', 'qemuwrapper-cross', 'syslinux', 'depmodwrappe=
r-cross', 'update-rc.d-native', 'btrfs-tools-native', 'createrepo-c-native'=
, 'dnf-native', 'dosfstools-native', 'e2fsprogs-native', 'erofs-utils-nativ=
e', 'gptfdisk-native', 'makedevs-native', 'mtools-native', 'opkg-utils-nati=
ve', 'pseudo-native', 'rpm-native', 'squashfs-tools-native', 'syslinux-nati=
ve', 'parted-native', 'pbzip2-native', 'pigz-native', 'bmap-tools-native', =
'libtool-native', 'texinfo-dummy-native', 'util-linux-native', 'attr-native=
', 'gettext-minimal-native', 'file-native', 'xz-native', 'elfutils-native',=
 'lua-native', 'zstd-native', 'sqlite3-native', 'libgcrypt-native', 'python=
3-native', 'bzip2-native', 'popt-native', 'openssl-native', 'zlib-native', =
'expat-native', 'glib-2.0-native', 'cmake-native', 'curl-native', 'libxml2-=
native', 'python3-setuptools-native', 'kmod-native', 'python3-build-native'=
, 'python3-installer-native', 'python3-wheel-native', 'python3-six-native',=
 'coreutils-native', 'shared-mime-info-native', 'nasm-native', 'ncurses-nat=
ive', 'util-linux-libuuid-native', 'lz4-native', 'qemu-native', 'libcomps-n=
ative', 'libdnf-native', 'librepo-native', 'python3-iniparse-native', 'shad=
ow-native', 'glibc', 'gcc-runtime', 'flex-native', 'gnu-config-native', 'e2=
fsprogs', 'util-linux', 'readline-native', 'perl-native', 'lzo-native', 'de=
bianutils-native', 'libcap', 'libpcre2-native', 'libcap-ng-native', 'libmic=
rohttpd-native', 'libarchive-native', 'libcap-native', 'libgpg-error-native=
', 'gdbm-native', 'libnsl2-native', 'libedit-native', 'libffi-native', 'lib=
tirpc-native', 'gettext-native', 'qemu-system-native', 'qemu-helper-native'=
, 'unfs3-native', 'python3-pyproject-hooks-native', 'python3-flit-core-nati=
ve', 'python3-packaging-native', 'itstool-native', 'groff-native', 'gobject=
-introspection-native', 'libmodulemd-native', 'swig-native', 'json-c-native=
', 'libsolv-native', 'libcheck-native', 'gpgme-native', 'linux-libc-headers=
', 'libgcc', 'm4-native', 'opkg-utils', 'attr', 'bash-completion', 'libcap-=
ng', 'util-linux-libuuid', 'zlib', 'libxcrypt', 'ncurses', 'make-native', '=
gnutls-native', 'acl-native', 'alsa-lib-native', 'libepoxy-native', 'dtc-na=
tive', 'libslirp-native', 'virglrenderer-native', 'pixman-native', 'libsdl2=
-native', 'unzip-native', 'libyaml-native', 'libassuan-native', 'libidn2-na=
tive', 'libunistring-native', 'nettle-native', 'libtasn1-native', 'gmp-nati=
ve', 'libx11-native', 'mesa-native', 'libdrm-native', 'libxext-native', 'li=
bxrandr-native', 'libxrender-native', 'libxcb-native', 'util-macros-native'=
, 'xorgproto-native', 'xtrans-native', 'llvm-native', 'wayland-native', 'li=
bxdamage-native', 'wayland-protocols-native', 'python3-mako-native', 'libxx=
f86vm-native', 'xrandr-native', 'libxshmfence-native', 'chrpath-native', 'm=
akedepend-native', 'libxfixes-native', 'libpciaccess-native', 'libpthread-s=
tubs-native', 'xcb-proto-native', 'libxau-native', 'libxdmcp-native', 'pyth=
on3-pygments-native', 'python3-markupsafe-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 62249.200000 =3D 47884 * 1.300000
| DEBUG: 62249.200000 =3D max(62249.200000, 8192)[62249.200000] + 0
| DEBUG: 62250.000000 =3D int(62249.200000)
| DEBUG: 62250 =3D aligned(62250)
| DEBUG: returning 62250
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
|=20
| ERROR: _exec_cmd: export PATH=3D/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-image-min=
imal/1.0-r0/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/oe-self=
test-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/core-imag=
e-minimal/1.0-r0/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worke=
r/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/=
core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin:/home/pokybuild/yoc=
to-worker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-pok=
y-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky=
-linux:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-11632=
24/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-=
native/bin:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1=
163224/tmp/hosttools:$PATH;x86_64-poky-linux-objcopy --enable-deterministic=
-archives --preserve-dates --add-section .osrel=3D/home/pokybuild/yocto-wor=
ker/oe-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linu=
x/core-image-minimal/1.0-r0/recipe-sysroot/usr/lib/os-release --change-sect=
ion-vma .osrel=3D0x20000 --add-section .cmdline=3D/tmp/tmpqugy4n6d/cmdline =
--change-section-vma .cmdline=3D0x30000 --add-section .linux=3D/home/pokybu=
ild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tmp/deploy/image=
s/qemux86-64/bzImage --change-section-vma .linux=3D0x2000000 --add-section =
=2Einitrd=3D/tmp/tmpqugy4n6d/initrd --change-section-vma .initrd=3D0x300000=
0 /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tm=
p/deploy/images/qemux86-64/linuxx64.efi.stub /home/pokybuild/yocto-worker/o=
e-selftest-fedora/build/build-st-1163224/tmp/work/qemux86_64-poky-linux/cor=
e-image-minimal/1.0-r0/tmp-wic/hdd/boot/EFI/Linux/linux.efi returned '1' in=
stead of 0
| output: x86_64-poky-linux-objcopy: /home/pokybuild/yocto-worker/oe-selfte=
st-fedora/build/build-st-1163224/tmp/deploy/images/qemux86-64/linuxx64.efi.=
stub (.reloc): section flag STYP_GROUP (0x4) ignored
| /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tm=
p/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_CO=
PY (0x10) ignored
| /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tm=
p/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section fla=
g IMAGE_SCN_MEM_NOT_PAGED in section .reloc
| x86_64-poky-linux-objcopy: /home/pokybuild/yocto-worker/oe-selftest-fedor=
a/build/build-st-1163224/tmp/deploy/images/qemux86-64/linuxx64.efi.stub (.r=
eloc): section flag STYP_GROUP (0x4) ignored
| /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tm=
p/deploy/images/qemux86-64/linuxx64.efi.stub (.reloc): section flag STYP_CO=
PY (0x10) ignored
| /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1163224/tm=
p/deploy/images/qemux86-64/linuxx64.efi.stub: warning: ignoring section fla=
g IMAGE_SCN_MEM_NOT_PAGED in section .reloc
| x86_64-poky-linux-objcopy: /home/pokybuild/yocto-worker/oe-selftest-fedor=
a/build/build-st-1163224/tmp/deploy/images/qemux86-64/linuxx64.efi.stub: fi=
le format not recognized
| x86_64-poky-linux-objcopy: --change-section-vma .initrd=3D0x3000000 never=
 used
| x86_64-poky-linux-objcopy: --change-section-vma .linux=3D0x2000000 never =
used
| x86_64-poky-linux-objcopy: --change-section-vma .cmdline=3D0x30000 never =
used
| x86_64-poky-linux-objcopy: --change-section-vma .osrel=3D0x20000 never us=
ed
|=20
| WARNING: /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1=
163224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.do=
_image_wic.1308950:163 exit 1 from 'BUILDDIR=3D"/home/pokybuild/yocto-worke=
r/oe-selftest-fedora/build/build-st-1163224" PSEUDO_UNLOAD=3D1 wic create "=
$wks" --vars "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-s=
t-1163224/tmp/sysroots/qemux86-64/imgdata/" -e "core-image-minimal" -o "$bu=
ild_wic/" -w "$tmp_wic"'
| WARNING: Backtrace (BB generated script):
| 	#1: do_image_wic, /home/pokybuild/yocto-worker/oe-selftest-fedora/build/=
build-st-1163224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/t=
emp/run.do_image_wic.1308950, line 163
| 	#2: main, /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st=
-1163224/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/run.=
do_image_wic.1308950, line 179
NOTE: recipe core-image-minimal-1.0-r0: task do_image_wic: Failed
ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/rec=
ipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code =
'1'

I'm currently building with reverts to ensure this is the case.

On 03/08/2023 00:16:15+0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
> - Drop dependency on gnu-efi, add dependency on pyelftools for EFI builds
> - Refresh patches
> - Ship new files and directories
> - Use meson target to build sd-boot instead of filenames
> - Change libpam recipe to set ANY_OF_DISTRO_FEATURES =3D "pam systemd" to=
 let
>   logind pull in pam-plugin-umask
>=20
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> Note that the musl patches have been rebased to solve merge conflicts,
> but not tested in any way.
> v2: changed mount.ddi from sbindir to base_sbindir, unified efi and
>     bootloader packageconfigs as it's not useful to use one witout the
>     other
> v3: add rrecommends on pam-plugin-umask on systemd if logind is enabled
>     as the default configuration optionally loads this plugin
> v4: fix typo in sd-boot meson cross (cc -> c) and restore EFI_LD variable
>     to allow overrides
> v5: remove rrecommends on pam-plugin-umask, since it's optional and not
>     built by default it causes a build failure in some test
> v6: add back rrecommends on pam-plugin-umask, and instead change libpam's
>     recipe to use ANY_OF_DISTRO_FEATURES =3D "pam systemd"
> v7: backported musl-specific patch from Khem
> v8: backported two more musl-specific patches from Khem
>=20
>  ...temd-boot_253.7.bb =3D> systemd-boot_254.bb} |  21 +-
>  meta/recipes-core/systemd/systemd.inc         |   5 +-
>  ...tall-dependency-links-at-install-tim.patch |  42 +--
>  ...util-Make-STRERROR-portable-for-musl.patch |   7 +-
>  ...sysctl.d-binfmt.d-modules-load.d-to-.patch |   2 +-
>  ...k-parse_printf_format-implementation.patch |   6 +-
>  ...missing.h-check-for-missing-strndupa.patch |  69 ++--
>  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |   4 +-
>  ...14-Use-uintmax_t-for-handling-rlim_t.patch |   2 +-
>  ...sable-tests-for-missing-typedefs-in-.patch |  41 ---
>  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  12 +-
>  ...uffering-when-writing-to-oom_score_a.patch |   2 +-
>  ...compliant-strerror_r-from-GNU-specif.patch |   2 +-
>  ...-not-disable-buffer-in-writing-files.patch | 142 ++++---
>  .../0022-Handle-__cpu_mask-usage.patch        |   4 +-
>  .../systemd/0023-Handle-missing-gshadow.patch |  28 +-
>  ...l.h-Define-MIPS-ABI-defines-for-musl.patch |   2 +-
>  .../0025-include-sys-file.h-for-LOCK_EX.patch |  29 ++
>  ...-string.c-define-wchar_t-from-__WCHA.patch |  44 ---
>  ...-Include-sys-timex.h-for-struct-time.patch |  28 ++
>  ...clude-missing-sys-file.h-for-LOCK_EX.patch |  98 +++++
>  meta/recipes-core/systemd/systemd/27253.patch | 313 ----------------
>  meta/recipes-core/systemd/systemd/27254.patch | 345 ------------------
>  .../{systemd_253.7.bb =3D> systemd_254.bb}      |  17 +-
>  meta/recipes-extended/pam/libpam_1.5.3.bb     |   2 +-
>  25 files changed, 335 insertions(+), 932 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_253.7.bb =3D> systemd-boo=
t_254.bb} (77%)
>  delete mode 100644 meta/recipes-core/systemd/systemd/0015-test-sizeof.c-=
Disable-tests-for-missing-typedefs-in-.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0025-include-sys-fi=
le.h-for-LOCK_EX.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/0026-src-boot-efi-e=
fi-string.c-define-wchar_t-from-__WCHA.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0026-test-test-size=
of-Include-sys-timex.h-for-struct-time.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0027-include-missin=
g-sys-file.h-for-LOCK_EX.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/27253.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/27254.patch
>  rename meta/recipes-core/systemd/{systemd_253.7.bb =3D> systemd_254.bb} =
(98%)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-boot_253.7.bb b/meta/recip=
es-core/systemd/systemd-boot_254.bb
> similarity index 77%
> rename from meta/recipes-core/systemd/systemd-boot_253.7.bb
> rename to meta/recipes-core/systemd/systemd-boot_254.bb
> index b67706b7316..e887e636e86 100644
> --- a/meta/recipes-core/systemd/systemd-boot_253.7.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> @@ -3,29 +3,27 @@ FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/systemd:"
> =20
>  require conf/image-uefi.conf
> =20
> -DEPENDS =3D "intltool-native libcap util-linux gnu-efi gperf-native pyth=
on3-jinja2-native"
> +DEPENDS =3D "intltool-native libcap util-linux gperf-native python3-jinj=
a2-native python3-pyelftools-native"
> =20
>  inherit meson pkgconfig gettext
>  inherit deploy
> =20
>  LDFLAGS:prepend =3D "${@ " ".join(d.getVar('LD').split()[1:])} "
> =20
> -do_write_config[vardeps] +=3D "CC OBJCOPY"
> +EFI_LD =3D "bfd"
> +
> +do_write_config[vardeps] +=3D "CC OBJCOPY EFI_LD"
>  do_write_config:append() {
>      cat >${WORKDIR}/meson-${PN}.cross <<EOF
>  [binaries]
> -efi_cc =3D ${@meson_array('CC', d)}
> +c =3D ${@meson_array('CC', d)}
>  objcopy =3D ${@meson_array('OBJCOPY', d)}
> +c_ld =3D ${@meson_array('EFI_LD', d)}
>  EOF
>  }
> =20
> -EFI_LD =3D "bfd"
> -
>  EXTRA_OEMESON +=3D "-Defi=3Dtrue \
> -                  -Dgnu-efi=3Dtrue \
> -                  -Defi-includedir=3D${STAGING_INCDIR}/efi \
> -                  -Defi-libdir=3D${STAGING_LIBDIR} \
> -                  -Defi-ld=3D${EFI_LD} \
> +                  -Dbootloader=3Dtrue \
>                    -Dman=3Dfalse \
>                    --cross-file ${WORKDIR}/meson-${PN}.cross \
>                    "
> @@ -54,9 +52,7 @@ COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-=
linux"
>  COMPATIBLE_HOST:x86-x32 =3D "null"
> =20
>  do_compile() {
> -	ninja \
> -		src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE} \
> -		src/boot/efi/linux${EFI_ARCH}.efi.stub
> +	ninja systemd-boot
>  }
> =20
>  do_install() {
> @@ -67,6 +63,7 @@ do_install() {
>  do_deploy () {
>  	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
>  	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOYDIR}
> +	install ${B}/src/boot/efi/addon*.efi.stub ${DEPLOYDIR}
>  }
> =20
>  addtask deploy before do_build after do_compile
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index c2f2899044f..b00a49884be 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,10 +14,9 @@ LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
> =20
> -SRCREV =3D "f1c4da0414640cf201147144f558e1af31a3ae80"
> -SRCBRANCH =3D "v253-stable"
> +SRCREV =3D "994c7978608a0bd9b317f4f74ff266dd50a3e74e"
> +SRCBRANCH =3D "v254-stable"
>  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH} \
> -           file://0026-src-boot-efi-efi-string.c-define-wchar_t-from-__W=
CHA.patch \
>             "
> =20
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-=
dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0=
002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index 43611e65fbc..085f1e9052f 100644
> --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depende=
ncy-links-at-install-tim.patch
> @@ -19,40 +19,36 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>  ---
> - units/meson.build                       | 6 ++----
> + units/meson.build                       | 2 --
>   units/proc-sys-fs-binfmt_misc.automount | 3 +++
>   units/systemd-binfmt.service.in         | 4 ++++
> - 3 files changed, 9 insertions(+), 4 deletions(-)
> + 3 files changed, 7 insertions(+), 2 deletions(-)
> =20
>  diff --git a/units/meson.build b/units/meson.build
>  index c7939a10f8..219570ab19 100644
>  --- a/units/meson.build
>  +++ b/units/meson.build
> -@@ -62,8 +62,7 @@ units =3D [
> -         ['poweroff.target',                     '',
> -          (with_runlevels ? 'runlevel0.target' : '')],
> -         ['printer.target',                      ''],
> --        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT',
> --         'sysinit.target.wants/'],
> -+        ['proc-sys-fs-binfmt_misc.automount',   'ENABLE_BINFMT'],
> -         ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
> -         ['reboot.target',                       '',
> -          'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' =
: '')],
> -@@ -185,8 +184,7 @@ in_units =3D [
> -         ['rescue.service',                       ''],
> -         ['serial-getty@.service',                ''],
> -         ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
> --        ['systemd-binfmt.service',               'ENABLE_BINFMT',
> --         'sysinit.target.wants/'],
> -+        ['systemd-binfmt.service',               'ENABLE_BINFMT'],
> -         ['systemd-bless-boot.service',           'HAVE_GNU_EFI HAVE_BLK=
ID'],
> -         ['systemd-boot-check-no-failures.service', ''],
> -         ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
> +@@ -149,7 +149,6 @@ units =3D [
> +         {
> +           'file' : 'proc-sys-fs-binfmt_misc.automount',
> +           'conditions' : ['ENABLE_BINFMT'],
> +-          'symlinks' : ['sysinit.target.wants/'],
> +         },
> +         {
> +           'file' : 'proc-sys-fs-binfmt_misc.mount',
> +@@ -246,7 +245,6 @@ units =3D [
> +         {
> +           'file' : 'systemd-binfmt.service.in',
> +           'conditions' : ['ENABLE_BINFMT'],
> +-          'symlinks' : ['sysinit.target.wants/'],
> +         },
> +         {
> +           'file' : 'systemd-bless-boot.service.in',
>  diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs=
-binfmt_misc.automount
>  index 6b1bbdc91e..5ec5b8670a 100644
>  --- a/units/proc-sys-fs-binfmt_misc.automount
>  +++ b/units/proc-sys-fs-binfmt_misc.automount
> -@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=3D/proc/sys/
> +@@ -22,3 +22,6 @@ Before=3Dshutdown.target
>  =20
>   [Automount]
>   Where=3D/proc/sys/fs/binfmt_misc
> diff --git a/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRER=
ROR-portable-for-musl.patch b/meta/recipes-core/systemd/systemd/0003-errno-=
util-Make-STRERROR-portable-for-musl.patch
> index e9e69cb6489..fcc56a2e656 100644
> --- a/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-por=
table-for-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0003-errno-util-Make-STRERROR-por=
table-for-musl.patch
> @@ -11,8 +11,8 @@ Upstream-Status: Inappropriate [musl specific]
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - src/basic/errno-util.h | 12 ++++++++++--
> - 1 file changed, 10 insertions(+), 2 deletions(-)
> + src/basic/errno-util.h | 10 +++++++++-
> + 1 file changed, 9 insertions(+), 1 deletion(-)
> =20
>  diff --git a/src/basic/errno-util.h b/src/basic/errno-util.h
>  index 091f99c590..eb5c1f9961 100644
> @@ -23,9 +23,8 @@ index 091f99c590..eb5c1f9961 100644
>    *
>    * Note that we use the GNU variant of strerror_r() here. */
>  -#define STRERROR(errnum) strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){=
}, ERRNO_BUF_LEN)
> --
>  +static inline const char * STRERROR(int errnum);
> -+
> +=20
>  +static inline const char * STRERROR(int errnum) {
>  +#ifdef __GLIBC__
>  +        return strerror_r(abs(errnum), (char[ERRNO_BUF_LEN]){}, ERRNO_B=
UF_LEN);
> diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysct=
l.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0=
004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> index aa1f3c2e820..98914ae1544 100644
> --- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-bin=
fmt.d-modules-load.d-to-.patch
> +++ b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-bin=
fmt.d-modules-load.d-to-.patch
> @@ -44,7 +44,7 @@ diff --git a/src/libsystemd/sd-path/sd-path.c b/src/lib=
systemd/sd-path/sd-path.c
>  index 1af3a36d1d..def502b717 100644
>  --- a/src/libsystemd/sd-path/sd-path.c
>  +++ b/src/libsystemd/sd-path/sd-path.c
> -@@ -362,19 +362,19 @@ static int get_path(uint64_t type, char **buffer, =
const char **ret) {
> +@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, =
const char **ret) {
>                   return 0;
>  =20
>           case SD_PATH_SYSUSERS:
> diff --git a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_pr=
intf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0010-a=
dd-fallback-parse_printf_format-implementation.patch
> index 2090d81dc39..4143ab4d709 100644
> --- a/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_fo=
rmat-implementation.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-add-fallback-parse_printf_fo=
rmat-implementation.patch
> @@ -23,7 +23,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> =20
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -755,6 +755,7 @@ endif
> +@@ -781,6 +781,7 @@ endif
>   foreach header : ['crypt.h',
>                     'linux/memfd.h',
>                     'linux/vm_sockets.h',
> @@ -33,7 +33,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>                     'valgrind/memcheck.h',
>  --- a/src/basic/meson.build
>  +++ b/src/basic/meson.build
> -@@ -173,6 +173,11 @@ endforeach
> +@@ -179,6 +179,11 @@ endforeach
>  =20
>   basic_sources +=3D generated_gperf_headers
>  =20
> @@ -407,7 +407,7 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.co=
m>
>   #include <stddef.h>
>   #include <sys/un.h>
>   #include <unistd.h>
> -@@ -25,6 +24,7 @@
> +@@ -27,6 +26,7 @@
>   #include "stdio-util.h"
>   #include "string-util.h"
>   #include "tmpfile-util.h"
> diff --git a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-c=
heck-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0011-sr=
c-basic-missing.h-check-for-missing-strndupa.patch
> index bd5f6a6190c..ec451cddb71 100644
> --- a/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
> +++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-fo=
r-missing-strndupa.patch
> @@ -17,6 +17,7 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>  [rebased for systemd 244]
>  [Rebased for v247]
>  Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> +[Rebased for v254]
>  ---
>   meson.build                                |  1 +
>   src/backlight/backlight.c                  |  1 +
> @@ -74,7 +75,7 @@ diff --git a/meson.build b/meson.build
>  index fb96143c37..739b2f7f72 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -574,6 +574,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
> +@@ -595,6 +595,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
>   endforeach
>  =20
>   foreach ident : [
> @@ -98,7 +99,7 @@ diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup=
-util.c
>  index feda596939..11b4375ed5 100644
>  --- a/src/basic/cgroup-util.c
>  +++ b/src/basic/cgroup-util.c
> -@@ -37,6 +37,7 @@
> +@@ -38,6 +38,7 @@
>   #include "unit-name.h"
>   #include "user-util.h"
>   #include "xattr-util.h"
> @@ -122,14 +123,14 @@ diff --git a/src/basic/log.c b/src/basic/log.c
>  index fc5793139e..515218fca8 100644
>  --- a/src/basic/log.c
>  +++ b/src/basic/log.c
> -@@ -39,6 +39,7 @@
> +@@ -40,6 +40,7 @@
>   #include "terminal-util.h"
>   #include "time-util.h"
>   #include "utf8.h"
>  +#include "missing_stdlib.h"
>  =20
>   #define SNDBUF_SIZE (8*1024*1024)
> - #define IOVEC_MAX 128U
> + #define IOVEC_MAX 256U
>  diff --git a/src/basic/missing_stdlib.h b/src/basic/missing_stdlib.h
>  index 8c76f93eb2..9068bfb4f0 100644
>  --- a/src/basic/missing_stdlib.h
> @@ -166,7 +167,7 @@ diff --git a/src/basic/mountpoint-util.c b/src/basic/=
mountpoint-util.c
>  index bc74fbef8f..cdb609bb84 100644
>  --- a/src/basic/mountpoint-util.c
>  +++ b/src/basic/mountpoint-util.c
> -@@ -13,6 +13,7 @@
> +@@ -18,6 +18,7 @@
>   #include "missing_stat.h"
>   #include "missing_syscall.h"
>   #include "mkdir.h"
> @@ -214,14 +215,14 @@ diff --git a/src/basic/proc-cmdline.c b/src/basic/p=
roc-cmdline.c
>  index eea70d8606..ae3abd8402 100644
>  --- a/src/basic/proc-cmdline.c
>  +++ b/src/basic/proc-cmdline.c
> -@@ -15,6 +15,7 @@
> - #include "special.h"
> +@@ -16,6 +16,7 @@
>   #include "string-util.h"
> + #include "strv.h"
>   #include "virt.h"
>  +#include "missing_stdlib.h"
>  =20
> - int proc_cmdline(char **ret) {
> -         const char *e;
> + int proc_cmdline_filter_pid1_args(char **argv, char ***ret) {
> +         enum {
>  diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
>  index bcba5a5208..64a95dd866 100644
>  --- a/src/basic/procfs-util.c
> @@ -238,7 +239,7 @@ diff --git a/src/basic/time-util.c b/src/basic/time-u=
til.c
>  index b700f364ef..48a26bcec9 100644
>  --- a/src/basic/time-util.c
>  +++ b/src/basic/time-util.c
> -@@ -26,6 +26,7 @@
> +@@ -27,6 +27,7 @@
>   #include "string-util.h"
>   #include "strv.h"
>   #include "time-util.h"
> @@ -262,7 +263,7 @@ diff --git a/src/core/dbus-cgroup.c b/src/core/dbus-c=
group.c
>  index b5484eda78..54ed62c790 100644
>  --- a/src/core/dbus-cgroup.c
>  +++ b/src/core/dbus-cgroup.c
> -@@ -21,6 +21,7 @@
> +@@ -23,6 +23,7 @@
>   #include "parse-util.h"
>   #include "path-util.h"
>   #include "percent-util.h"
> @@ -274,7 +275,7 @@ diff --git a/src/core/dbus-execute.c b/src/core/dbus-=
execute.c
>  index f514b8fd12..4febd0d496 100644
>  --- a/src/core/dbus-execute.c
>  +++ b/src/core/dbus-execute.c
> -@@ -45,6 +45,7 @@
> +@@ -48,6 +48,7 @@
>   #include "unit-printf.h"
>   #include "user-util.h"
>   #include "utf8.h"
> @@ -298,7 +299,7 @@ diff --git a/src/core/execute.c b/src/core/execute.c
>  index 853e87450f..8ef76de9ab 100644
>  --- a/src/core/execute.c
>  +++ b/src/core/execute.c
> -@@ -105,6 +105,7 @@
> +@@ -113,6 +113,7 @@
>   #include "unit-serialize.h"
>   #include "user-util.h"
>   #include "utmp-wtmp.h"
> @@ -310,9 +311,9 @@ diff --git a/src/core/kmod-setup.c b/src/core/kmod-se=
tup.c
>  index e843743777..e149807492 100644
>  --- a/src/core/kmod-setup.c
>  +++ b/src/core/kmod-setup.c
> -@@ -12,6 +12,7 @@
> - #include "recurse-dir.h"
> +@@ -13,6 +13,7 @@
>   #include "string-util.h"
> + #include "strv.h"
>   #include "virt.h"
>  +#include "missing_stdlib.h"
>  =20
> @@ -322,7 +323,7 @@ diff --git a/src/core/service.c b/src/core/service.c
>  index 9ad3c3d995..b112d64919 100644
>  --- a/src/core/service.c
>  +++ b/src/core/service.c
> -@@ -42,6 +42,7 @@
> +@@ -45,6 +45,7 @@
>   #include "unit-name.h"
>   #include "unit.h"
>   #include "utf8.h"
> @@ -346,7 +347,7 @@ diff --git a/src/fstab-generator/fstab-generator.c b/=
src/fstab-generator/fstab-g
>  index efc553b698..acea922311 100644
>  --- a/src/fstab-generator/fstab-generator.c
>  +++ b/src/fstab-generator/fstab-generator.c
> -@@ -33,6 +33,7 @@
> +@@ -37,6 +37,7 @@
>   #include "unit-name.h"
>   #include "virt.h"
>   #include "volatile-util.h"
> @@ -358,7 +359,7 @@ diff --git a/src/journal-remote/journal-remote-main.c=
 b/src/journal-remote/journ
>  index 7df264fb53..9463a0e9fb 100644
>  --- a/src/journal-remote/journal-remote-main.c
>  +++ b/src/journal-remote/journal-remote-main.c
> -@@ -25,6 +25,7 @@
> +@@ -26,6 +26,7 @@
>   #include "stat-util.h"
>   #include "string-table.h"
>   #include "strv.h"
> @@ -370,7 +371,7 @@ diff --git a/src/journal/journalctl.c b/src/journal/j=
ournalctl.c
>  index da0fac548e..c1c043e0e0 100644
>  --- a/src/journal/journalctl.c
>  +++ b/src/journal/journalctl.c
> -@@ -72,6 +72,7 @@
> +@@ -77,6 +77,7 @@
>   #include "unit-name.h"
>   #include "user-util.h"
>   #include "varlink.h"
> @@ -406,7 +407,7 @@ diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src=
/libsystemd/sd-bus/bus-sock
>  index 64037e4fe0..9b9ce0aaa9 100644
>  --- a/src/libsystemd/sd-bus/bus-socket.c
>  +++ b/src/libsystemd/sd-bus/bus-socket.c
> -@@ -27,6 +27,7 @@
> +@@ -28,6 +28,7 @@
>   #include "string-util.h"
>   #include "user-util.h"
>   #include "utf8.h"
> @@ -418,7 +419,7 @@ diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/lib=
systemd/sd-bus/sd-bus.c
>  index f6a5e4aa06..b36faa79a3 100644
>  --- a/src/libsystemd/sd-bus/sd-bus.c
>  +++ b/src/libsystemd/sd-bus/sd-bus.c
> -@@ -44,6 +44,7 @@
> +@@ -46,6 +46,7 @@
>   #include "string-util.h"
>   #include "strv.h"
>   #include "user-util.h"
> @@ -442,10 +443,10 @@ diff --git a/src/libsystemd/sd-journal/sd-journal.c=
 b/src/libsystemd/sd-journal/
>  index 9947947ef2..8dc6f93159 100644
>  --- a/src/libsystemd/sd-journal/sd-journal.c
>  +++ b/src/libsystemd/sd-journal/sd-journal.c
> -@@ -41,6 +41,7 @@
> - #include "string-util.h"
> +@@ -44,6 +44,7 @@
>   #include "strv.h"
>   #include "syslog-util.h"
> + #include "uid-alloc-range.h"
>  +#include "missing_stdlib.h"
>  =20
>   #define JOURNAL_FILES_RECHECK_USEC (2 * USEC_PER_SEC)
> @@ -454,7 +455,7 @@ diff --git a/src/login/pam_systemd.c b/src/login/pam_=
systemd.c
>  index ba2fca32c6..e1f9caa13b 100644
>  --- a/src/login/pam_systemd.c
>  +++ b/src/login/pam_systemd.c
> -@@ -32,6 +32,7 @@
> +@@ -34,6 +34,7 @@
>   #include "locale-util.h"
>   #include "login-util.h"
>   #include "macro.h"
> @@ -466,7 +467,7 @@ diff --git a/src/network/generator/network-generator.=
c b/src/network/generator/n
>  index 1090934bfc..69a77f66e2 100644
>  --- a/src/network/generator/network-generator.c
>  +++ b/src/network/generator/network-generator.c
> -@@ -13,6 +13,7 @@
> +@@ -14,6 +14,7 @@
>   #include "string-table.h"
>   #include "string-util.h"
>   #include "strv.h"
> @@ -502,7 +503,7 @@ diff --git a/src/portable/portable.c b/src/portable/p=
ortable.c
>  index 7811833fac..c6414da91c 100644
>  --- a/src/portable/portable.c
>  +++ b/src/portable/portable.c
> -@@ -39,6 +39,7 @@
> +@@ -40,6 +40,7 @@
>   #include "strv.h"
>   #include "tmpfile-util.h"
>   #include "user-util.h"
> @@ -550,7 +551,7 @@ diff --git a/src/shared/bus-unit-util.c b/src/shared/=
bus-unit-util.c
>  index 1e95e36678..640ee031d5 100644
>  --- a/src/shared/bus-unit-util.c
>  +++ b/src/shared/bus-unit-util.c
> -@@ -50,6 +50,7 @@
> +@@ -51,6 +51,7 @@
>   #include "unit-def.h"
>   #include "user-util.h"
>   #include "utf8.h"
> @@ -562,7 +563,7 @@ diff --git a/src/shared/bus-util.c b/src/shared/bus-u=
til.c
>  index d09ec5148d..f38a8f7cc1 100644
>  --- a/src/shared/bus-util.c
>  +++ b/src/shared/bus-util.c
> -@@ -21,6 +21,7 @@
> +@@ -24,6 +24,7 @@
>   #include "path-util.h"
>   #include "socket-util.h"
>   #include "stdio-util.h"
> @@ -586,9 +587,9 @@ diff --git a/src/shared/journal-importer.c b/src/shar=
ed/journal-importer.c
>  index d9eabec886..534c6cf7e3 100644
>  --- a/src/shared/journal-importer.c
>  +++ b/src/shared/journal-importer.c
> -@@ -15,6 +15,7 @@
> - #include "parse-util.h"
> +@@ -16,6 +16,7 @@
>   #include "string-util.h"
> + #include "strv.h"
>   #include "unaligned.h"
>  +#include "missing_stdlib.h"
>  =20
> @@ -622,7 +623,7 @@ diff --git a/src/socket-proxy/socket-proxyd.c b/src/s=
ocket-proxy/socket-proxyd.c
>  index 821049e667..08a5bdae3d 100644
>  --- a/src/socket-proxy/socket-proxyd.c
>  +++ b/src/socket-proxy/socket-proxyd.c
> -@@ -26,6 +26,7 @@
> +@@ -27,6 +27,7 @@
>   #include "set.h"
>   #include "socket-util.h"
>   #include "string-util.h"
> @@ -646,7 +647,7 @@ diff --git a/src/udev/udev-builtin-path_id.c b/src/ud=
ev/udev-builtin-path_id.c
>  index 8e4d57ee72..6b4555b4d5 100644
>  --- a/src/udev/udev-builtin-path_id.c
>  +++ b/src/udev/udev-builtin-path_id.c
> -@@ -22,6 +22,7 @@
> +@@ -24,6 +24,7 @@
>   #include "sysexits.h"
>   #include "udev-builtin.h"
>   #include "udev-util.h"
> @@ -670,13 +671,13 @@ diff --git a/src/udev/udev-rules.c b/src/udev/udev-=
rules.c
>  index 5bd09a64d1..0ce79f815c 100644
>  --- a/src/udev/udev-rules.c
>  +++ b/src/udev/udev-rules.c
> -@@ -34,6 +34,7 @@
> +@@ -35,6 +35,7 @@
>   #include "udev-util.h"
>   #include "user-util.h"
>   #include "virt.h"
>  +#include "missing_stdlib.h"
>  =20
> - #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
> + #define RULES_DIRS ((const char* const*) CONF_PATHS_STRV("udev/rules.d"=
))
>  =20
>  --=20
>  2.39.2
> diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BR=
ACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0=
012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
> index b86cc42589d..0d69e8e9cdb 100644
> --- a/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
> +++ b/meta/recipes-core/systemd/systemd/0012-don-t-fail-if-GLOB_BRACE-and=
-GLOB_ALTDIRFUNC-is-not-.patch
> @@ -130,7 +130,7 @@ index 458aed7054..2cf24b38c0 100644
>   /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
>    * them in the file system. This is intended to be used to create
>    * properly owned directories beneath /tmp, /var/tmp, /run, which are
> -@@ -2194,7 +2200,9 @@ finish:
> +@@ -2355,7 +2361,9 @@ finish:
>  =20
>   static int glob_item(Item *i, action_t action) {
>           _cleanup_globfree_ glob_t g =3D {
> @@ -140,7 +140,7 @@ index 458aed7054..2cf24b38c0 100644
>           };
>           int r =3D 0, k;
>  =20
> -@@ -2214,7 +2222,9 @@ static int glob_item(Item *i, action_t action) {
> +@@ -2375,7 +2383,9 @@ static int glob_item(Item *i, action_t action) {
>  =20
>   static int glob_item_recursively(Item *i, fdaction_t action) {
>           _cleanup_globfree_ glob_t g =3D {
> diff --git a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-han=
dling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-f=
or-handling-rlim_t.patch
> index f586d3ff527..1d50faa363f 100644
> --- a/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-r=
lim_t.patch
> +++ b/meta/recipes-core/systemd/systemd/0014-Use-uintmax_t-for-handling-r=
lim_t.patch
> @@ -89,7 +89,7 @@ diff --git a/src/core/execute.c b/src/core/execute.c
>  index 8ef76de9ab..ea1c203e43 100644
>  --- a/src/core/execute.c
>  +++ b/src/core/execute.c
> -@@ -6034,9 +6034,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
> +@@ -6667,9 +6667,9 @@ void exec_context_dump(const ExecContext *c, FILE*=
 f, const char *prefix) {
>           for (unsigned i =3D 0; i < RLIM_NLIMITS; i++)
>                   if (c->rlimit[i]) {
>                           fprintf(f, "%sLimit%s: " RLIM_FMT "\n",
> diff --git a/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable=
-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0=
015-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
> deleted file mode 100644
> index afc80b9511a..00000000000
> --- a/meta/recipes-core/systemd/systemd/0015-test-sizeof.c-Disable-tests-=
for-missing-typedefs-in-.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From 96088895149746dd2ee8e8c2e4b97972ccf44696 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 28 Feb 2018 21:25:22 -0800
> -Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in mu=
sl
> -
> -Upstream-Status: Inappropriate [musl specific]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - src/test/test-sizeof.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> -index 55bd81e22f..6cf92bffde 100644
> ---- a/src/test/test-sizeof.c
> -+++ b/src/test/test-sizeof.c
> -@@ -55,8 +55,10 @@ int main(void) {
> -         info(unsigned);
> -         info(unsigned long);
> -         info(unsigned long long);
> -+#ifdef __GLIBC__
> -         info(__syscall_ulong_t);
> -         info(__syscall_slong_t);
> -+#endif
> -         info(intmax_t);
> -         info(uintmax_t);
> -=20
> -@@ -76,7 +78,9 @@ int main(void) {
> -         info(ssize_t);
> -         info(time_t);
> -         info(usec_t);
> -+#ifdef __GLIBC__
> -         info(__time_t);
> -+#endif
> -         info(pid_t);
> -         info(uid_t);
> -         info(gid_t);
> ---=20
> -2.39.2
> -
> diff --git a/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK=
_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0016-=
don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
> index 2f84d3d6c25..543fba7cdbc 100644
> --- a/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
> +++ b/meta/recipes-core/systemd/systemd/0016-don-t-pass-AT_SYMLINK_NOFOLL=
OW-flag-to-faccessat.patch
> @@ -34,7 +34,7 @@ diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
>  index 932d003f19..33215dbf5f 100644
>  --- a/src/basic/fs-util.h
>  +++ b/src/basic/fs-util.h
> -@@ -50,8 +50,27 @@ int futimens_opath(int fd, const struct timespec ts[2=
]);
> +@@ -49,8 +49,27 @@ int futimens_opath(int fd, const struct timespec ts[2=
]);
>   int fd_warn_permissions(const char *path, int fd);
>   int stat_warn_permissions(const char *path, const struct stat *st);
>  =20
> @@ -67,16 +67,16 @@ diff --git a/src/shared/base-filesystem.c b/src/share=
d/base-filesystem.c
>  index be6dd1654a..2726dc946a 100644
>  --- a/src/shared/base-filesystem.c
>  +++ b/src/shared/base-filesystem.c
> -@@ -131,7 +131,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
> -                 return log_error_errno(errno, "Failed to open root file=
 system: %m");
> +@@ -145,7 +145,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
> +         /* The "root" parameter is decoration only =E2=80=93 it's only =
used as part of log messages */
>  =20
>           for (size_t i =3D 0; i < ELEMENTSOF(table); i++) {
>  -                if (faccessat(fd, table[i].dir, F_OK, AT_SYMLINK_NOFOLL=
OW) >=3D 0)
>  +                if (faccessat(fd, table[i].dir, F_OK, 0) >=3D 0)
>                           continue;
>  =20
> -                 if (table[i].target) {
> -@@ -139,7 +139,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
> +                 if (table[i].target) { /* Create as symlink? */
> +@@ -153,7 +153,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
>  =20
>                           /* check if one of the targets exists */
>                           NULSTR_FOREACH(s, table[i].target) {
> @@ -85,7 +85,7 @@ index be6dd1654a..2726dc946a 100644
>                                           continue;
>  =20
>                                   /* check if a specific file exists at t=
he target path */
> -@@ -150,7 +150,7 @@ int base_filesystem_create(const char *root, uid_t u=
id, gid_t gid) {
> +@@ -164,7 +164,7 @@ int base_filesystem_create_fd(int fd, const char *ro=
ot, uid_t uid, gid_t gid) {
>                                           if (!p)
>                                                   return log_oom();
>  =20
> diff --git a/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffer=
ing-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0=
018-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
> index 401a9a9546c..8162bc2c57f 100644
> --- a/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
> +++ b/meta/recipes-core/systemd/systemd/0018-Do-not-disable-buffering-whe=
n-writing-to-oom_score_a.patch
> @@ -27,7 +27,7 @@ diff --git a/src/basic/process-util.c b/src/basic/proce=
ss-util.c
>  index 0747c14c1c..8d0c5aae92 100644
>  --- a/src/basic/process-util.c
>  +++ b/src/basic/process-util.c
> -@@ -1405,7 +1405,7 @@ int set_oom_score_adjust(int value) {
> +@@ -1516,7 +1516,7 @@ int set_oom_score_adjust(int value) {
>           xsprintf(t, "%i", value);
>  =20
>           return write_string_file("/proc/self/oom_score_adj", t,
> diff --git a/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compl=
iant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0=
019-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
> index 48b8eda0a5e..f6d908f9476 100644
> --- a/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
> +++ b/meta/recipes-core/systemd/systemd/0019-distinguish-XSI-compliant-st=
rerror_r-from-GNU-specif.patch
> @@ -58,7 +58,7 @@ diff --git a/src/libsystemd/sd-journal/journal-send.c b=
/src/libsystemd/sd-journa
>  index 136ebcb153..8a75ba4ecd 100644
>  --- a/src/libsystemd/sd-journal/journal-send.c
>  +++ b/src/libsystemd/sd-journal/journal-send.c
> -@@ -381,7 +381,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
> +@@ -360,7 +360,12 @@ static int fill_iovec_perror_and_send(const char *m=
essage, int skip, struct iove
>                   char* j;
>  =20
>                   errno =3D 0;
> diff --git a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer=
-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0021-do-not-dis=
able-buffer-in-writing-files.patch
> index 46267a5ada9..ef6b5342ca1 100644
> --- a/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-wri=
ting-files.patch
> +++ b/meta/recipes-core/systemd/systemd/0021-do-not-disable-buffer-in-wri=
ting-files.patch
> @@ -18,34 +18,35 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>  [rebased for systemd 243]
>  Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> +[rebased for systemd 254]
>  ---
> - src/basic/cgroup-util.c                 | 12 ++++++------
> - src/basic/namespace-util.c              |  4 ++--
> - src/basic/procfs-util.c                 |  4 ++--
> - src/basic/sysctl-util.c                 |  2 +-
> - src/binfmt/binfmt.c                     |  6 +++---
> - src/core/cgroup.c                       |  2 +-
> - src/core/main.c                         |  2 +-
> - src/core/smack-setup.c                  |  8 ++++----
> - src/hibernate-resume/hibernate-resume.c |  2 +-
> - src/home/homework.c                     |  2 +-
> - src/libsystemd/sd-device/sd-device.c    |  2 +-
> - src/nspawn/nspawn-cgroup.c              |  2 +-
> - src/nspawn/nspawn.c                     |  6 +++---
> - src/shared/binfmt-util.c                |  2 +-
> - src/shared/cgroup-setup.c               |  4 ++--
> - src/shared/coredump-util.c              |  2 +-
> - src/shared/smack-util.c                 |  2 +-
> - src/sleep/sleep.c                       |  8 ++++----
> - src/udev/udev-rules.c                   |  1 -
> - src/vconsole/vconsole-setup.c           |  2 +-
> - 20 files changed, 37 insertions(+), 38 deletions(-)
> + src/basic/cgroup-util.c              | 12 ++++++------
> + src/basic/namespace-util.c           |  4 ++--
> + src/basic/procfs-util.c              |  4 ++--
> + src/basic/sysctl-util.c              |  2 +-
> + src/binfmt/binfmt.c                  |  6 +++---
> + src/core/cgroup.c                    |  2 +-
> + src/core/main.c                      |  2 +-
> + src/core/smack-setup.c               |  8 ++++----
> + src/home/homework.c                  |  2 +-
> + src/libsystemd/sd-device/sd-device.c |  2 +-
> + src/nspawn/nspawn-cgroup.c           |  2 +-
> + src/nspawn/nspawn.c                  |  6 +++---
> + src/shared/binfmt-util.c             |  2 +-
> + src/shared/cgroup-setup.c            |  4 ++--
> + src/shared/coredump-util.c           |  2 +-
> + src/shared/sleep-util.c              |  4 ++--
> + src/shared/smack-util.c              |  2 +-
> + src/sleep/sleep.c                    |  4 ++--
> + src/udev/udev-rules.c                |  1 -
> + src/vconsole/vconsole-setup.c        |  2 +-
> + 20 files changed, 36 insertions(+), 37 deletions(-)
> =20
>  diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
>  index 11b4375ed5..7d81a6007f 100644
>  --- a/src/basic/cgroup-util.c
>  +++ b/src/basic/cgroup-util.c
> -@@ -399,7 +399,7 @@ int cg_kill_kernel_sigkill(const char *controller, c=
onst char *path) {
> +@@ -400,7 +400,7 @@ int cg_kill_kernel_sigkill(const char *controller, c=
onst char *path) {
>           if (r < 0)
>                   return r;
>  =20
> @@ -54,7 +55,7 @@ index 11b4375ed5..7d81a6007f 100644
>           if (r < 0)
>                   return r;
>  =20
> -@@ -805,7 +805,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
> +@@ -806,7 +806,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
>  =20
>           sc =3D strstrip(contents);
>           if (isempty(sc)) {
> @@ -63,7 +64,7 @@ index 11b4375ed5..7d81a6007f 100644
>                   if (r < 0)
>                           return r;
>           } else if (!path_equal(sc, agent))
> -@@ -823,7 +823,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
> +@@ -824,7 +824,7 @@ int cg_install_release_agent(const char *controller,=
 const char *agent) {
>  =20
>           sc =3D strstrip(contents);
>           if (streq(sc, "0")) {
> @@ -72,7 +73,7 @@ index 11b4375ed5..7d81a6007f 100644
>                   if (r < 0)
>                           return r;
>  =20
> -@@ -850,7 +850,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
> +@@ -851,7 +851,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
>           if (r < 0)
>                   return r;
>  =20
> @@ -81,7 +82,7 @@ index 11b4375ed5..7d81a6007f 100644
>           if (r < 0)
>                   return r;
>  =20
> -@@ -860,7 +860,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
> +@@ -861,7 +861,7 @@ int cg_uninstall_release_agent(const char *controlle=
r) {
>           if (r < 0)
>                   return r;
>  =20
> @@ -90,7 +91,7 @@ index 11b4375ed5..7d81a6007f 100644
>           if (r < 0)
>                   return r;
>  =20
> -@@ -1752,7 +1752,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
> +@@ -1764,7 +1764,7 @@ int cg_set_attribute(const char *controller, const=
 char *path, const char *attri
>           if (r < 0)
>                   return r;
>  =20
> @@ -103,7 +104,7 @@ diff --git a/src/basic/namespace-util.c b/src/basic/n=
amespace-util.c
>  index f5c0e04cec..272b920022 100644
>  --- a/src/basic/namespace-util.c
>  +++ b/src/basic/namespace-util.c
> -@@ -220,12 +220,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
> +@@ -227,12 +227,12 @@ int userns_acquire(const char *uid_map, const char=
 *gid_map) {
>                   freeze();
>  =20
>           xsprintf(path, "/proc/" PID_FMT "/uid_map", pid);
> @@ -186,7 +187,7 @@ diff --git a/src/core/cgroup.c b/src/core/cgroup.c
>  index 4cac3f6a89..bebe2cd120 100644
>  --- a/src/core/cgroup.c
>  +++ b/src/core/cgroup.c
> -@@ -4267,7 +4267,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
> +@@ -4349,7 +4349,7 @@ int unit_cgroup_freezer_action(Unit *u, FreezerAct=
ion action) {
>                           u->freezer_state =3D FREEZER_THAWING;
>           }
>  =20
> @@ -199,7 +200,7 @@ diff --git a/src/core/main.c b/src/core/main.c
>  index c0b8126d96..fe676320ba 100644
>  --- a/src/core/main.c
>  +++ b/src/core/main.c
> -@@ -1716,7 +1716,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
> +@@ -1737,7 +1737,7 @@ static void initialize_core_pattern(bool skip_setu=
p) {
>           if (getpid_cached() !=3D 1)
>                   return;
>  =20
> @@ -234,19 +235,6 @@ index bcaa237c8d..4032bde19e 100644
>           if (r < 0)
>                   log_warning_errno(r, "Failed to set SMACK netlabel rule=
 \"127.0.0.1 -CIPSO\": %m");
>   #endif
> -diff --git a/src/hibernate-resume/hibernate-resume.c b/src/hibernate-res=
ume/hibernate-resume.c
> -index 9a9df5d22f..75ddec881a 100644
> ---- a/src/hibernate-resume/hibernate-resume.c
> -+++ b/src/hibernate-resume/hibernate-resume.c
> -@@ -40,7 +40,7 @@ int main(int argc, char *argv[]) {
> -                 return EXIT_FAILURE;
> -         }
> -=20
> --        r =3D write_string_file("/sys/power/resume", FORMAT_DEVNUM(st.s=
t_rdev), WRITE_STRING_FILE_DISABLE_BUFFER);
> -+        r =3D write_string_file("/sys/power/resume", FORMAT_DEVNUM(st.s=
t_rdev), 0);
> -         if (r < 0) {
> -                 log_error_errno(r, "Failed to write '" DEVNUM_FORMAT_ST=
R "' to /sys/power/resume: %m", DEVNUM_FORMAT_VAL(st.st_rdev));
> -                 return EXIT_FAILURE;
>  diff --git a/src/home/homework.c b/src/home/homework.c
>  index 28907386a4..f9e45349a7 100644
>  --- a/src/home/homework.c
> @@ -264,7 +252,7 @@ diff --git a/src/libsystemd/sd-device/sd-device.c b/s=
rc/libsystemd/sd-device/sd-
>  index 8c65ee3469..153edab081 100644
>  --- a/src/libsystemd/sd-device/sd-device.c
>  +++ b/src/libsystemd/sd-device/sd-device.c
> -@@ -2481,7 +2481,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
> +@@ -2515,7 +2515,7 @@ _public_ int sd_device_set_sysattr_value(sd_device=
 *device, const char *sysattr,
>           if (!value)
>                   return -ENOMEM;
>  =20
> @@ -290,7 +278,7 @@ diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
>  index 36d336dfc8..8c5c69596b 100644
>  --- a/src/nspawn/nspawn.c
>  +++ b/src/nspawn/nspawn.c
> -@@ -2771,7 +2771,7 @@ static int reset_audit_loginuid(void) {
> +@@ -2774,7 +2774,7 @@ static int reset_audit_loginuid(void) {
>           if (streq(p, "4294967295"))
>                   return 0;
>  =20
> @@ -299,7 +287,7 @@ index 36d336dfc8..8c5c69596b 100644
>           if (r < 0) {
>                   log_error_errno(r,
>                                   "Failed to reset audit login UID. This =
probably means that your kernel is too\n"
> -@@ -4211,7 +4211,7 @@ static int setup_uid_map(
> +@@ -4214,7 +4214,7 @@ static int setup_uid_map(
>                   return log_oom();
>  =20
>           xsprintf(uid_map, "/proc/" PID_FMT "/uid_map", pid);
> @@ -308,7 +296,7 @@ index 36d336dfc8..8c5c69596b 100644
>           if (r < 0)
>                   return log_error_errno(r, "Failed to write UID map: %m"=
);
>  =20
> -@@ -4221,7 +4221,7 @@ static int setup_uid_map(
> +@@ -4224,7 +4224,7 @@ static int setup_uid_map(
>                   return log_oom();
>  =20
>           xsprintf(uid_map, "/proc/" PID_FMT "/gid_map", pid);
> @@ -334,7 +322,7 @@ diff --git a/src/shared/cgroup-setup.c b/src/shared/c=
group-setup.c
>  index 2ea83f05d3..8626bb184c 100644
>  --- a/src/shared/cgroup-setup.c
>  +++ b/src/shared/cgroup-setup.c
> -@@ -350,7 +350,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
> +@@ -351,7 +351,7 @@ int cg_attach(const char *controller, const char *pa=
th, pid_t pid) {
>  =20
>           xsprintf(c, PID_FMT "\n", pid);
>  =20
> @@ -343,7 +331,7 @@ index 2ea83f05d3..8626bb184c 100644
>           if (r =3D=3D -EOPNOTSUPP && cg_is_threaded(controller, path) > =
0)
>                   /* When the threaded mode is used, we cannot read/write=
 the file. Let's return recognizable error. */
>                   return -EUCLEAN;
> -@@ -887,7 +887,7 @@ int cg_enable_everywhere(
> +@@ -964,7 +964,7 @@ int cg_enable_everywhere(
>                                           return log_debug_errno(errno, "=
Failed to open cgroup.subtree_control file of %s: %m", p);
>                           }
>  =20
> @@ -356,8 +344,8 @@ diff --git a/src/shared/coredump-util.c b/src/shared/=
coredump-util.c
>  index 3d2f179049..c1b6c170ac 100644
>  --- a/src/shared/coredump-util.c
>  +++ b/src/shared/coredump-util.c
> -@@ -71,7 +71,7 @@ int set_coredump_filter(uint64_t value) {
> -         sprintf(t, "0x%"PRIx64, value);
> +@@ -163,7 +163,7 @@ int set_coredump_filter(uint64_t value) {
> +         xsprintf(t, "0x%"PRIx64, value);
>  =20
>           return write_string_file("/proc/self/coredump_filter", t,
>  -                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WR=
ITE_STRING_FILE_DISABLE_BUFFER);
> @@ -365,11 +353,33 @@ index 3d2f179049..c1b6c170ac 100644
>   }
>  =20
>   /* Turn off core dumps but only if we're running outside of a container=
=2E */
> +diff --git a/src/shared/sleep-util.c b/src/shared/sleep-util.c
> +index d7277399fb..d06d636fcc 100644
> +--- a/src/shared/sleep-util.c
> ++++ b/src/shared/sleep-util.c
> +@@ -1044,7 +1044,7 @@ int write_resume_config(dev_t devno, uint64_t offs=
et, const char *device) {
> +=20
> +         /* We write the offset first since it's safer. Note that this f=
ile is only available in 4.17+, so
> +          * fail gracefully if it doesn't exist and we're only overwriti=
ng it with 0. */
> +-        r =3D write_string_file("/sys/power/resume_offset", offset_str,=
 WRITE_STRING_FILE_DISABLE_BUFFER);
> ++        r =3D write_string_file("/sys/power/resume_offset", offset_str,=
 0);
> +         if (r =3D=3D -ENOENT) {
> +                 if (offset !=3D 0)
> +                         return log_error_errno(SYNTHETIC_ERRNO(EOPNOTSU=
PP),
> +@@ -1060,7 +1060,7 @@ int write_resume_config(dev_t devno, uint64_t offs=
et, const char *device) {
> +                 log_debug("Wrote resume_offset=3D%s for device '%s' to =
/sys/power/resume_offset.",
> +                           offset_str, device);
> +=20
> +-        r =3D write_string_file("/sys/power/resume", devno_str, WRITE_S=
TRING_FILE_DISABLE_BUFFER);
> ++        r =3D write_string_file("/sys/power/resume", devno_str, 0);
> +         if (r < 0)
> +                 return log_error_errno(r,
> +                                        "Failed to write device '%s' (%s=
) to /sys/power/resume: %m",
>  diff --git a/src/shared/smack-util.c b/src/shared/smack-util.c
>  index b3b5c905ad..bbfa1973fd 100644
>  --- a/src/shared/smack-util.c
>  +++ b/src/shared/smack-util.c
> -@@ -115,7 +115,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label=
) {
> +@@ -113,7 +113,7 @@ int mac_smack_apply_pid(pid_t pid, const char *label=
) {
>                   return 0;
>  =20
>           p =3D procfs_file_alloca(pid, "attr/current");
> @@ -382,25 +392,7 @@ diff --git a/src/sleep/sleep.c b/src/sleep/sleep.c
>  index 765dd4974f..cd6afb001b 100644
>  --- a/src/sleep/sleep.c
>  +++ b/src/sleep/sleep.c
> -@@ -50,7 +50,7 @@ static int write_hibernate_location_info(const Hiberna=
teLocation *hibernate_loca
> -         assert(hibernate_location->swap);
> -=20
> -         xsprintf(resume_str, "%u:%u", major(hibernate_location->devno),=
 minor(hibernate_location->devno));
> --        r =3D write_string_file("/sys/power/resume", resume_str, WRITE_=
STRING_FILE_DISABLE_BUFFER);
> -+        r =3D write_string_file("/sys/power/resume", resume_str, 0);
> -         if (r < 0)
> -                 return log_debug_errno(r, "Failed to write partition de=
vice to /sys/power/resume for '%s': '%s': %m",
> -                                        hibernate_location->swap->device=
, resume_str);
> -@@ -77,7 +77,7 @@ static int write_hibernate_location_info(const Hiberna=
teLocation *hibernate_loca
> -         }
> -=20
> -         xsprintf(offset_str, "%" PRIu64, hibernate_location->offset);
> --        r =3D write_string_file("/sys/power/resume_offset", offset_str,=
 WRITE_STRING_FILE_DISABLE_BUFFER);
> -+        r =3D write_string_file("/sys/power/resume_offset", offset_str,=
 0);
> -         if (r < 0)
> -                 return log_debug_errno(r, "Failed to write swap file of=
fset to /sys/power/resume_offset for '%s': '%s': %m",
> -                                        hibernate_location->swap->device=
, offset_str);
> -@@ -93,7 +93,7 @@ static int write_mode(char **modes) {
> +@@ -139,7 +139,7 @@ static int write_mode(char **modes) {
>           STRV_FOREACH(mode, modes) {
>                   int k;
>  =20
> @@ -409,7 +401,7 @@ index 765dd4974f..cd6afb001b 100644
>                   if (k >=3D 0)
>                           return 0;
>  =20
> -@@ -114,7 +114,7 @@ static int write_state(FILE **f, char **states) {
> +@@ -160,7 +160,7 @@ static int write_state(FILE **f, char **states) {
>           STRV_FOREACH(state, states) {
>                   int k;
>  =20
> @@ -422,8 +414,8 @@ diff --git a/src/udev/udev-rules.c b/src/udev/udev-ru=
les.c
>  index 0ce79f815c..28aab475d0 100644
>  --- a/src/udev/udev-rules.c
>  +++ b/src/udev/udev-rules.c
> -@@ -2357,7 +2357,6 @@ static int udev_rule_apply_token_to_event(
> -                 log_rule_debug(dev, rules, "ATTR '%s' writing '%s'", bu=
f, value);
> +@@ -2634,7 +2634,6 @@ static int udev_rule_apply_token_to_event(
> +                 log_event_debug(dev, token, "ATTR '%s' writing '%s'", b=
uf, value);
>                   r =3D write_string_file(buf, value,
>                                         WRITE_STRING_FILE_VERIFY_ON_FAILU=
RE |
>  -                                      WRITE_STRING_FILE_DISABLE_BUFFER |
> @@ -434,7 +426,7 @@ diff --git a/src/vconsole/vconsole-setup.c b/src/vcon=
sole/vconsole-setup.c
>  index 7d3e9db73f..2d4a0c4c9d 100644
>  --- a/src/vconsole/vconsole-setup.c
>  +++ b/src/vconsole/vconsole-setup.c
> -@@ -108,7 +108,7 @@ static int toggle_utf8_vc(const char *name, int fd, =
bool utf8) {
> +@@ -259,7 +259,7 @@ static int toggle_utf8_vc(const char *name, int fd, =
bool utf8) {
>   static int toggle_utf8_sysfs(bool utf8) {
>           int r;
>  =20
> diff --git a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usa=
ge.patch b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.p=
atch
> index 61545f57786..341543afdcf 100644
> --- a/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> +++ b/meta/recipes-core/systemd/systemd/0022-Handle-__cpu_mask-usage.patch
> @@ -46,8 +46,8 @@ index 6cf92bffde..937d26ca55 100644
>  -#include <sched.h>
>   #include <stdio.h>
>   #include <string.h>
> - #include <sys/types.h>
> -@@ -10,6 +9,7 @@
> + #include <sys/resource.h>
> +@@ -11,6 +10,7 @@
>   #include <float.h>
>  =20
>   #include "time-util.h"
> diff --git a/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshado=
w.patch b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.pat=
ch
> index 7da8798ebc3..19ee3ff311e 100644
> --- a/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> +++ b/meta/recipes-core/systemd/systemd/0023-Handle-missing-gshadow.patch
> @@ -20,7 +20,7 @@ diff --git a/src/shared/user-record-nss.c b/src/shared/=
user-record-nss.c
>  index 88b8fc2f8f..a819d41bac 100644
>  --- a/src/shared/user-record-nss.c
>  +++ b/src/shared/user-record-nss.c
> -@@ -331,8 +331,10 @@ int nss_group_to_group_record(
> +@@ -329,8 +329,10 @@ int nss_group_to_group_record(
>           if (isempty(grp->gr_name))
>                   return -EINVAL;
>  =20
> @@ -31,7 +31,7 @@ index 88b8fc2f8f..a819d41bac 100644
>  =20
>           g =3D group_record_new();
>           if (!g)
> -@@ -348,6 +350,7 @@ int nss_group_to_group_record(
> +@@ -346,6 +348,7 @@ int nss_group_to_group_record(
>  =20
>           g->gid =3D grp->gr_gid;
>  =20
> @@ -39,7 +39,7 @@ index 88b8fc2f8f..a819d41bac 100644
>           if (sgrp) {
>                   if (looks_like_hashed_password(utf8_only(sgrp->sg_passw=
d))) {
>                           g->hashed_password =3D strv_new(sgrp->sg_passwd=
);
> -@@ -363,6 +366,7 @@ int nss_group_to_group_record(
> +@@ -361,6 +364,7 @@ int nss_group_to_group_record(
>                   if (r < 0)
>                           return r;
>           }
> @@ -47,7 +47,7 @@ index 88b8fc2f8f..a819d41bac 100644
>  =20
>           r =3D json_build(&g->json, JSON_BUILD_OBJECT(
>                                          JSON_BUILD_PAIR("groupName", JSO=
N_BUILD_STRING(g->group_name)),
> -@@ -388,6 +392,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
> +@@ -387,6 +391,7 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
>           assert(ret_sgrp);
>           assert(ret_buffer);
>  =20
> @@ -55,7 +55,7 @@ index 88b8fc2f8f..a819d41bac 100644
>           for (;;) {
>                   _cleanup_free_ char *buf =3D NULL;
>                   struct sgrp sgrp, *result;
> -@@ -416,6 +421,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
> +@@ -415,6 +420,9 @@ int nss_sgrp_for_group(const struct group *grp, stru=
ct sgrp *ret_sgrp, char **re
>                   buflen *=3D 2;
>                   buf =3D mfree(buf);
>           }
> @@ -65,7 +65,7 @@ index 88b8fc2f8f..a819d41bac 100644
>   }
>  =20
>   int nss_group_record_by_name(
> -@@ -427,7 +435,9 @@ int nss_group_record_by_name(
> +@@ -426,7 +434,9 @@ int nss_group_record_by_name(
>           struct group grp, *result;
>           bool incomplete =3D false;
>           size_t buflen =3D 4096;
> @@ -75,7 +75,7 @@ index 88b8fc2f8f..a819d41bac 100644
>           int r;
>  =20
>           assert(name);
> -@@ -457,6 +467,7 @@ int nss_group_record_by_name(
> +@@ -455,6 +465,7 @@ int nss_group_record_by_name(
>                   buf =3D mfree(buf);
>           }
>  =20
> @@ -83,7 +83,7 @@ index 88b8fc2f8f..a819d41bac 100644
>           if (with_shadow) {
>                   r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
>                   if (r < 0) {
> -@@ -468,6 +479,9 @@ int nss_group_record_by_name(
> +@@ -466,6 +477,9 @@ int nss_group_record_by_name(
>                   incomplete =3D true;
>  =20
>           r =3D nss_group_to_group_record(result, sresult, ret);
> @@ -93,7 +93,7 @@ index 88b8fc2f8f..a819d41bac 100644
>           if (r < 0)
>                   return r;
>  =20
> -@@ -484,7 +498,9 @@ int nss_group_record_by_gid(
> +@@ -483,7 +497,9 @@ int nss_group_record_by_gid(
>           struct group grp, *result;
>           bool incomplete =3D false;
>           size_t buflen =3D 4096;
> @@ -102,8 +102,8 @@ index 88b8fc2f8f..a819d41bac 100644
>  +#endif
>           int r;
>  =20
> -         assert(ret);
> -@@ -512,6 +528,7 @@ int nss_group_record_by_gid(
> +         for (;;) {
> +@@ -509,6 +525,7 @@ int nss_group_record_by_gid(
>                   buf =3D mfree(buf);
>           }
>  =20
> @@ -111,7 +111,7 @@ index 88b8fc2f8f..a819d41bac 100644
>           if (with_shadow) {
>                   r =3D nss_sgrp_for_group(result, &sgrp, &sbuf);
>                   if (r < 0) {
> -@@ -523,6 +540,9 @@ int nss_group_record_by_gid(
> +@@ -520,6 +537,9 @@ int nss_group_record_by_gid(
>                   incomplete =3D true;
>  =20
>           r =3D nss_group_to_group_record(result, sresult, ret);
> @@ -141,7 +141,7 @@ diff --git a/src/shared/userdb.c b/src/shared/userdb.c
>  index a77eff4407..955e361d3a 100644
>  --- a/src/shared/userdb.c
>  +++ b/src/shared/userdb.c
> -@@ -1044,13 +1044,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
> +@@ -1038,13 +1038,15 @@ int groupdb_iterator_get(UserDBIterator *iterato=
r, GroupRecord **ret) {
>                   if (gr) {
>                           _cleanup_free_ char *buffer =3D NULL;
>                           bool incomplete =3D false;
> @@ -158,7 +158,7 @@ index a77eff4407..955e361d3a 100644
>                           if (!FLAGS_SET(iterator->flags, USERDB_SUPPRESS=
_SHADOW)) {
>                                   r =3D nss_sgrp_for_group(gr, &sgrp, &bu=
ffer);
>                                   if (r < 0) {
> -@@ -1063,6 +1065,9 @@ int groupdb_iterator_get(UserDBIterator *iterator,=
 GroupRecord **ret) {
> +@@ -1057,6 +1059,9 @@ int groupdb_iterator_get(UserDBIterator *iterator,=
 GroupRecord **ret) {
>                           }
>  =20
>                           r =3D nss_group_to_group_record(gr, r >=3D 0 ? =
&sgrp : NULL, ret);
> diff --git a/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Def=
ine-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/002=
4-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
> index 15ff6eb4f8a..d64cec1585b 100644
> --- a/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
> +++ b/meta/recipes-core/systemd/systemd/0024-missing_syscall.h-Define-MIP=
S-ABI-defines-for-musl.patch
> @@ -36,7 +36,7 @@ diff --git a/src/shared/base-filesystem.c b/src/shared/=
base-filesystem.c
>  index 2726dc946a..484f63e0b4 100644
>  --- a/src/shared/base-filesystem.c
>  +++ b/src/shared/base-filesystem.c
> -@@ -19,6 +19,7 @@
> +@@ -20,6 +20,7 @@
>   #include "string-util.h"
>   #include "umask-util.h"
>   #include "user-util.h"
> diff --git a/meta/recipes-core/systemd/systemd/0025-include-sys-file.h-fo=
r-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0025-include-sys-file.h=
-for-LOCK_EX.patch
> new file mode 100644
> index 00000000000..7827cc1403c
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0025-include-sys-file.h-for-LOCK_=
EX.patch
> @@ -0,0 +1,29 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 2 Aug 2023 10:33:48 -0700
> +Subject: [PATCH] include sys/file.h for LOCK_EX
> +
> +Fixes
> +| ../git/src/basic/user-util.c:708:30: error: use of undeclared identifi=
er 'LOCK_EX'; did you mean 'LOCK_BSD'?
> +|   708 |         r =3D unposix_lock(fd, LOCK_EX);
> +|       |                              ^~~~~~~
> +|       |                              LOCK_BSD
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28647]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/basic/user-util.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/basic/user-util.c b/src/basic/user-util.c
> +index fe61a09005..5c39847733 100644
> +--- a/src/basic/user-util.c
> ++++ b/src/basic/user-util.c
> +@@ -6,6 +6,7 @@
> + #include <stdint.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <sys/file.h>
> + #include <sys/stat.h>
> + #include <unistd.h>
> + #include <utmp.h>
> diff --git a/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-stri=
ng.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/systemd/0=
026-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> deleted file mode 100644
> index c7e2280c3b2..00000000000
> --- a/meta/recipes-core/systemd/systemd/0026-src-boot-efi-efi-string.c-de=
fine-wchar_t-from-__WCHA.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 34072f456b4fe880fbb2f18760b64a1a6c1eebb8 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 6 Mar 2023 15:24:49 +0100
> -Subject: [PATCH] src/boot/efi/efi-string.c: define wchar_t from __WCHAR_=
TYPE__
> -
> -systemd-boot relies on wchar_t being 16 bit, and breaks at build time ot=
herwise.
> -
> -To set wchar_t to 16 bit it is passing -fshort-wchar to gcc; this has the
> -desired effect on glibc (which sets wchar_t from __WCHAR_TYPE__) but not=
 on
> -musl (which hardcodes it to 32 bit).
> -
> -This patch ensures wchar_t is set from the compiler flags on all systems=
; note
> -that systemd-boot is not actually using functions from musl or other lib=
c, just their headers.
> -
> -Meanwhile upstream has refactored the code to not rely on libc headers a=
t all;
> -however this will not be backported to v253 and we need a different fix.
> -
> -Upstream-Status: Inappropriate [fixed differently in trunk according to =
https://github.com/systemd/systemd/pull/26689]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/boot/efi/efi-string.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> -index 22923d60f6..5d09d4281f 100644
> ---- a/src/boot/efi/efi-string.c
> -+++ b/src/boot/efi/efi-string.c
> -@@ -2,7 +2,13 @@
> -=20
> - #include <stdbool.h>
> - #include <stdint.h>
> -+
> -+#if SD_BOOT
> -+typedef __WCHAR_TYPE__ wchar_t;
> -+#define __DEFINED_wchar_t
> -+#else
> - #include <wchar.h>
> -+#endif
> -=20
> - #include "efi-string.h"
> -=20
> ---=20
> -2.39.2
> -
> diff --git a/meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Incl=
ude-sys-timex.h-for-struct-time.patch b/meta/recipes-core/systemd/systemd/0=
026-test-test-sizeof-Include-sys-timex.h-for-struct-time.patch
> new file mode 100644
> index 00000000000..f2130c856f9
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0026-test-test-sizeof-Include-sys=
-timex.h-for-struct-time.patch
> @@ -0,0 +1,28 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 2 Aug 2023 12:14:56 -0700
> +Subject: [PATCH] test/test-sizeof: Include sys/timex.h for struct timex
> +
> +Fixes
> +
> +../git/src/test/test-sizeof.c:64:41: error: incomplete definition of typ=
e 'struct timex'
> +   64 |         check(typeof(((struct timex *)0)->freq), SIZEOF_TIMEX_ME=
MBER);
> +      |                      ~~~~~~~~~~~~~~~~~~~^
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
> +---
> + src/test/test-sizeof.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
> +index 9d969cf8f1..b65c0bd370 100644
> +--- a/src/test/test-sizeof.c
> ++++ b/src/test/test-sizeof.c
> +@@ -4,6 +4,7 @@
> + #include <string.h>
> + #include <sys/resource.h>
> + #include <sys/socket.h>
> ++#include <sys/timex.h>
> + #include <sys/types.h>
> +=20
> + #define __STDC_WANT_IEC_60559_TYPES_EXT__
> diff --git a/meta/recipes-core/systemd/systemd/0027-include-missing-sys-f=
ile.h-for-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0027-include-mi=
ssing-sys-file.h-for-LOCK_EX.patch
> new file mode 100644
> index 00000000000..19014802e47
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0027-include-missing-sys-file.h-f=
or-LOCK_EX.patch
> @@ -0,0 +1,98 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 2 Aug 2023 12:18:24 -0700
> +Subject: [PATCH] include missing sys/file.h for LOCK_EX
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/28651]
> +---
> + src/core/execute.c            | 1 +
> + src/shared/btrfs-util.c       | 1 +
> + src/shared/copy.c             | 1 +
> + src/test/test-btrfs.c         | 1 +
> + src/test/test-fs-util.c       | 1 +
> + src/test/test-lock-util.c     | 1 +
> + src/vconsole/vconsole-setup.c | 1 +
> + 7 files changed, 7 insertions(+)
> +
> +diff --git a/src/core/execute.c b/src/core/execute.c
> +index 5b2ae861ff..2ebf19ffaa 100644
> +--- a/src/core/execute.c
> ++++ b/src/core/execute.c
> +@@ -4,6 +4,7 @@
> + #include <fcntl.h>
> + #include <poll.h>
> + #include <sys/eventfd.h>
> ++#include <sys/file.h>
> + #include <sys/ioctl.h>
> + #include <sys/mman.h>
> + #include <sys/mount.h>
> +diff --git a/src/shared/btrfs-util.c b/src/shared/btrfs-util.c
> +index 5128b308ab..3ded95ea82 100644
> +--- a/src/shared/btrfs-util.c
> ++++ b/src/shared/btrfs-util.c
> +@@ -10,6 +10,7 @@
> + #include <stddef.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <sys/file.h>
> + #include <sys/ioctl.h>
> + #include <sys/sysmacros.h>
> + #include <unistd.h>
> +diff --git a/src/shared/copy.c b/src/shared/copy.c
> +index 241a2d112b..7e47dc002c 100644
> +--- a/src/shared/copy.c
> ++++ b/src/shared/copy.c
> +@@ -6,6 +6,7 @@
> + #include <stddef.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> ++#include <sys/file.h>
> + #include <sys/ioctl.h>
> + #include <sys/sendfile.h>
> + #include <sys/xattr.h>
> +diff --git a/src/test/test-btrfs.c b/src/test/test-btrfs.c
> +index 95b7ef25d8..ba09563058 100644
> +--- a/src/test/test-btrfs.c
> ++++ b/src/test/test-btrfs.c
> +@@ -1,6 +1,7 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +=20
> + #include <fcntl.h>
> ++#include <sys/file.h>
> +=20
> + #include "btrfs-util.h"
> + #include "fd-util.h"
> +diff --git a/src/test/test-fs-util.c b/src/test/test-fs-util.c
> +index 1beba916a4..5de1eea0d4 100644
> +--- a/src/test/test-fs-util.c
> ++++ b/src/test/test-fs-util.c
> +@@ -1,5 +1,6 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +=20
> ++#include <sys/file.h>
> + #include <unistd.h>
> +=20
> + #include "alloc-util.h"
> +diff --git a/src/test/test-lock-util.c b/src/test/test-lock-util.c
> +index a9a1b438ff..28fc54a5d6 100644
> +--- a/src/test/test-lock-util.c
> ++++ b/src/test/test-lock-util.c
> +@@ -1,5 +1,6 @@
> + /* SPDX-License-Identifier: LGPL-2.1-or-later */
> +=20
> ++#include <sys/file.h>
> + #include <unistd.h>
> +=20
> + #include "fd-util.h"
> +diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup=
=2Ec
> +index d57d8b4001..86348d08c1 100644
> +--- a/src/vconsole/vconsole-setup.c
> ++++ b/src/vconsole/vconsole-setup.c
> +@@ -11,6 +11,7 @@
> + #include <linux/vt.h>
> + #include <stdbool.h>
> + #include <stdlib.h>
> ++#include <sys/file.h>
> + #include <sys/ioctl.h>
> + #include <sysexits.h>
> + #include <termios.h>
> diff --git a/meta/recipes-core/systemd/systemd/27253.patch b/meta/recipes=
-core/systemd/systemd/27253.patch
> deleted file mode 100644
> index 6c556fe80fd..00000000000
> --- a/meta/recipes-core/systemd/systemd/27253.patch
> +++ /dev/null
> @@ -1,313 +0,0 @@
> -From 924937cbc0bf692bc6e5b3a0bd3c18347d9521e9 Mon Sep 17 00:00:00 2001
> -From: Yu Watanabe <watanabe.yu+github@gmail.com>
> -Date: Thu, 13 Apr 2023 16:40:36 +0900
> -Subject: [PATCH 1/7] timesync: drop unnecessary initialization
> -
> -Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/2725=
3]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/timesync/timesyncd-manager.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- a/src/timesync/timesyncd-manager.c
> -+++ b/src/timesync/timesyncd-manager.c
> -@@ -410,7 +410,7 @@ static int manager_receive_response(sd_e
> -                 .msg_name =3D &server_addr,
> -                 .msg_namelen =3D sizeof(server_addr),
> -         };
> --        struct timespec *recv_time =3D NULL;
> -+        struct timespec *recv_time;
> -         triple_timestamp dts;
> -         ssize_t len;
> -         double origin, receive, trans, dest, delay, offset, root_distan=
ce;
> -@@ -445,7 +445,7 @@ static int manager_receive_response(sd_e
> -                 return 0;
> -         }
> -=20
> --        recv_time =3D CMSG_FIND_DATA(&msghdr, SOL_SOCKET, SCM_TIMESTAMP=
NS, struct timespec);
> -+        recv_time =3D CMSG_FIND_AND_COPY_DATA(&msghdr, SOL_SOCKET, SCM_=
TIMESTAMPNS, struct timespec);
> -         if (!recv_time)
> -                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL), "Packet=
 timestamp missing.");
> -=20
> ---- a/src/basic/socket-util.h
> -+++ b/src/basic/socket-util.h
> -@@ -183,17 +183,22 @@ int flush_accept(int fd);
> -  * riscv32. */
> - #define CMSG_TYPED_DATA(cmsg, type)                                    =
 \
> -         ({                                                             =
 \
> --                struct cmsghdr *_cmsg =3D cmsg;                        =
   \
> --                assert_cc(__alignof__(type) <=3D __alignof__(struct cms=
ghdr)); \
> -+                struct cmsghdr *_cmsg =3D (cmsg);                      =
   \
> -+                assert_cc(alignof(type) <=3D alignof(struct cmsghdr)); =
   \
> -                 _cmsg ? CAST_ALIGN_PTR(type, CMSG_DATA(_cmsg)) : (type*=
) NULL; \
> -         })
> -=20
> - struct cmsghdr* cmsg_find(struct msghdr *mh, int level, int type, sockl=
en_t length);
> -+void* cmsg_find_and_copy_data(struct msghdr *mh, int level, int type, v=
oid *buf, size_t buf_len);
> -=20
> - /* Type-safe, dereferencing version of cmsg_find() */
> - #define CMSG_FIND_DATA(mh, level, type, ctype)                         =
 \
> -         CMSG_TYPED_DATA(cmsg_find(mh, level, type, CMSG_LEN(sizeof(ctyp=
e))), ctype)
> -=20
> -+/* Type-safe version of cmsg_find_and_copy_data() */
> -+#define CMSG_FIND_AND_COPY_DATA(mh, level, type, ctype)             \
> -+        (ctype*) cmsg_find_and_copy_data(mh, level, type, &(ctype){}, s=
izeof(ctype))
> -+
> - /* Resolves to a type that can carry cmsghdr structures. Make sure thin=
gs are properly aligned, i.e. the type
> -  * itself is placed properly in memory and the size is also aligned to =
what's appropriate for "cmsghdr"
> -  * structures. */
> ---- a/src/boot/efi/pe.c
> -+++ b/src/boot/efi/pe.c
> -@@ -197,7 +197,7 @@ static uint32_t get_compatibility_entry_
> -                 uint32_t entry_point;
> -         } _packed_ LinuxPeCompat1;
> -=20
> --        while (size >=3D sizeof(LinuxPeCompat1) && addr % __alignof__(L=
inuxPeCompat1) =3D=3D 0) {
> -+        while (size >=3D sizeof(LinuxPeCompat1) && addr % alignof(Linux=
PeCompat1) =3D=3D 0) {
> -                 LinuxPeCompat1 *compat =3D (LinuxPeCompat1 *) ((uint8_t=
 *) dos + addr);
> -=20
> -                 if (compat->type =3D=3D 0 || compat->size =3D=3D 0 || c=
ompat->size > size)
> ---- a/src/fundamental/macro-fundamental.h
> -+++ b/src/fundamental/macro-fundamental.h
> -@@ -6,12 +6,13 @@
> - #endif
> -=20
> - #include <limits.h>
> -+#include <stdalign.h>
> - #include <stdbool.h>
> - #include <stddef.h>
> - #include <stdint.h>
> -=20
> - #define _align_(x) __attribute__((__aligned__(x)))
> --#define _alignas_(x) __attribute__((__aligned__(__alignof__(x))))
> -+#define _alignas_(x) __attribute__((__aligned__(alignof(x))))
> - #define _alignptr_ __attribute__((__aligned__(sizeof(void *))))
> - #define _cleanup_(x) __attribute__((__cleanup__(x)))
> - #define _const_ __attribute__((__const__))
> -@@ -346,9 +347,9 @@ static inline size_t ALIGN_TO(size_t l,
> - #endif
> -=20
> - /* Checks if the specified pointer is aligned as appropriate for the sp=
ecific type */
> --#define IS_ALIGNED16(p) (((uintptr_t) p) % __alignof__(uint16_t) =3D=3D=
 0)
> --#define IS_ALIGNED32(p) (((uintptr_t) p) % __alignof__(uint32_t) =3D=3D=
 0)
> --#define IS_ALIGNED64(p) (((uintptr_t) p) % __alignof__(uint64_t) =3D=3D=
 0)
> -+#define IS_ALIGNED16(p) (((uintptr_t) p) % alignof(uint16_t) =3D=3D 0)
> -+#define IS_ALIGNED32(p) (((uintptr_t) p) % alignof(uint32_t) =3D=3D 0)
> -+#define IS_ALIGNED64(p) (((uintptr_t) p) % alignof(uint64_t) =3D=3D 0)
> -=20
> - /* Same as ALIGN_TO but callable in constant contexts. */
> - #define CONST_ALIGN_TO(l, ali)                                         \
> -@@ -366,7 +367,7 @@ static inline size_t ALIGN_TO(size_t l,
> - #define CAST_ALIGN_PTR(t, p)                                    \
> -         ({                                                      \
> -                 const void *_p =3D (p);                           \
> --                assert(((uintptr_t) _p) % __alignof__(t) =3D=3D 0); \
> -+                assert(((uintptr_t) _p) % alignof(t) =3D=3D 0); \
> -                 (t *) _p;                                       \
> -         })
> -=20
> ---- a/src/network/networkd-nexthop.c
> -+++ b/src/network/networkd-nexthop.c
> -@@ -894,7 +894,7 @@ int manager_rtnl_process_nexthop(sd_netl
> -                         return 0;
> -                 }
> -=20
> --                assert((uintptr_t) group % __alignof__(struct nexthop_g=
rp) =3D=3D 0);
> -+                assert((uintptr_t) group % alignof(struct nexthop_grp) =
=3D=3D 0);
> -=20
> -                 n_group =3D raw_group_size / sizeof(struct nexthop_grp);
> -                 for (size_t i =3D 0; i < n_group; i++) {
> ---- a/src/test/test-sizeof.c
> -+++ b/src/test/test-sizeof.c
> -@@ -17,16 +17,16 @@
> - DISABLE_WARNING_TYPE_LIMITS;
> -=20
> - #define info_no_sign(t)                                                =
 \
> --        printf("%s =E2=86=92 %zu bits, %zu byte alignment\n", STRINGIFY=
(t),     \
> -+        printf("%s =E2=86=92 %zu bits, %zu byte alignment\n", STRINGIFY=
(t),    \
> -                sizeof(t)*CHAR_BIT,                                     =
 \
> --               __alignof__(t))
> -+               alignof(t))
> -=20
> - #define info(t)                                                        =
 \
> --        printf("%s =E2=86=92 %zu bits%s, %zu byte alignment\n", STRINGI=
FY(t),   \
> -+        printf("%s =E2=86=92 %zu bits%s, %zu byte alignment\n", STRINGI=
FY(t),  \
> -                sizeof(t)*CHAR_BIT,                                     =
 \
> -                strstr(STRINGIFY(t), "signed") ? "" :                   =
 \
> -                (t)-1 < (t)0 ? ", signed" : ", unsigned",               =
 \
> --               __alignof__(t))
> -+               alignof(t))
> -=20
> - enum Enum {
> -         enum_value,
> -@@ -44,7 +44,7 @@ enum BigEnum2 {
> - int main(void) {
> -         int (*function_pointer)(void);
> -=20
> --        info_no_sign(function_pointer);
> -+        info_no_sign(typeof(function_pointer));
> -         info_no_sign(void*);
> -         info(char*);
> -=20
> ---- a/src/basic/socket-util.c
> -+++ b/src/basic/socket-util.c
> -@@ -1171,6 +1171,18 @@ struct cmsghdr* cmsg_find(struct msghdr
> -         return NULL;
> - }
> -=20
> -+void* cmsg_find_and_copy_data(struct msghdr *mh, int level, int type, v=
oid *buf, size_t buf_len) {
> -+        struct cmsghdr *cmsg;
> -+
> -+        assert(mh);
> -+
> -+        cmsg =3D cmsg_find(mh, level, type, buf_len =3D=3D SIZE_MAX ? (=
socklen_t) -1 : CMSG_LEN(buf_len));
> -+        if (!cmsg)
> -+                return NULL;
> -+
> -+        return memcpy_safe(buf, CMSG_DATA(cmsg), buf_len =3D=3D SIZE_MA=
X ? cmsg->cmsg_len : buf_len);
> -+}
> -+
> - int socket_ioctl_fd(void) {
> -         int fd;
> -=20
> ---- a/src/journal/journald-server.c
> -+++ b/src/journal/journald-server.c
> -@@ -1385,7 +1385,7 @@ int server_process_datagram(
> -         size_t label_len =3D 0, m;
> -         Server *s =3D ASSERT_PTR(userdata);
> -         struct ucred *ucred =3D NULL;
> --        struct timeval *tv =3D NULL;
> -+        struct timeval tv_buf, *tv =3D NULL;
> -         struct cmsghdr *cmsg;
> -         char *label =3D NULL;
> -         struct iovec iovec;
> -@@ -1461,10 +1461,10 @@ int server_process_datagram(
> -                         label =3D CMSG_TYPED_DATA(cmsg, char);
> -                         label_len =3D cmsg->cmsg_len - CMSG_LEN(0);
> -                 } else if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> --                           cmsg->cmsg_type =3D=3D SO_TIMESTAMP &&
> -+                           cmsg->cmsg_type =3D=3D SCM_TIMESTAMP &&
> -                            cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct=
 timeval))) {
> -                         assert(!tv);
> --                        tv =3D CMSG_TYPED_DATA(cmsg, struct timeval);
> -+                        tv =3D memcpy(&tv_buf, CMSG_DATA(cmsg), sizeof(=
struct timeval));
> -                 } else if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -                          cmsg->cmsg_type =3D=3D SCM_RIGHTS) {
> -                         assert(!fds);
> ---- a/src/libsystemd-network/icmp6-util.c
> -+++ b/src/libsystemd-network/icmp6-util.c
> -@@ -199,9 +199,11 @@ int icmp6_receive(int fd, void *buffer,
> -                 }
> -=20
> -                 if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> --                    cmsg->cmsg_type =3D=3D SO_TIMESTAMP &&
> --                    cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct timeva=
l)))
> --                        triple_timestamp_from_realtime(&t, timeval_load=
(CMSG_TYPED_DATA(cmsg, struct timeval)));
> -+                    cmsg->cmsg_type =3D=3D SCM_TIMESTAMP &&
> -+                    cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct timeva=
l))) {
> -+                        struct timeval *tv =3D memcpy(&(struct timeval)=
 {}, CMSG_DATA(cmsg), sizeof(struct timeval));
> -+                        triple_timestamp_from_realtime(&t, timeval_load=
(tv));
> -+                }
> -         }
> -=20
> -         if (!triple_timestamp_is_set(&t))
> ---- a/src/libsystemd-network/sd-dhcp6-client.c
> -+++ b/src/libsystemd-network/sd-dhcp6-client.c
> -@@ -1276,7 +1276,6 @@ static int client_receive_message(
> -                 .msg_control =3D &control,
> -                 .msg_controllen =3D sizeof(control),
> -         };
> --        struct cmsghdr *cmsg;
> -         triple_timestamp t =3D {};
> -         _cleanup_free_ DHCP6Message *message =3D NULL;
> -         struct in6_addr *server_address =3D NULL;
> -@@ -1320,12 +1319,9 @@ static int client_receive_message(
> -                 server_address =3D &sa.in6.sin6_addr;
> -         }
> -=20
> --        CMSG_FOREACH(cmsg, &msg) {
> --                if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> --                    cmsg->cmsg_type =3D=3D SO_TIMESTAMP &&
> --                    cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct timeva=
l)))
> --                        triple_timestamp_from_realtime(&t, timeval_load=
(CMSG_TYPED_DATA(cmsg, struct timeval)));
> --        }
> -+        struct timeval *tv =3D CMSG_FIND_AND_COPY_DATA(&msg, SOL_SOCKET=
, SCM_TIMESTAMP, struct timeval);
> -+        if (tv)
> -+                triple_timestamp_from_realtime(&t, timeval_load(tv));
> -=20
> -         if (client->transaction_id !=3D (message->transaction_id & htob=
e32(0x00ffffff)))
> -                 return 0;
> ---- a/src/libsystemd-network/sd-dhcp-server.c
> -+++ b/src/libsystemd-network/sd-dhcp-server.c
> -@@ -407,7 +407,7 @@ static int dhcp_server_send_udp(sd_dhcp_
> -                    rather than binding the socket. This will be mostly =
useful
> -                    when we gain support for arbitrary number of server =
addresses
> -                  */
> --                pktinfo =3D (struct in_pktinfo*) CMSG_DATA(cmsg);
> -+                pktinfo =3D CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> -                 assert(pktinfo);
> -=20
> -                 pktinfo->ipi_ifindex =3D server->ifindex;
> -@@ -1270,7 +1270,6 @@ static int server_receive_message(sd_eve
> -                 .msg_control =3D &control,
> -                 .msg_controllen =3D sizeof(control),
> -         };
> --        struct cmsghdr *cmsg;
> -         ssize_t datagram_size, len;
> -         int r;
> -=20
> -@@ -1306,19 +1305,10 @@ static int server_receive_message(sd_eve
> -         if ((size_t) len < sizeof(DHCPMessage))
> -                 return 0;
> -=20
> --        CMSG_FOREACH(cmsg, &msg)
> --                if (cmsg->cmsg_level =3D=3D IPPROTO_IP &&
> --                    cmsg->cmsg_type =3D=3D IP_PKTINFO &&
> --                    cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct in_pkt=
info))) {
> --                        struct in_pktinfo *info =3D CMSG_TYPED_DATA(cms=
g, struct in_pktinfo);
> --
> --                        /* TODO figure out if this can be done as a fil=
ter on
> --                         * the socket, like for IPv6 */
> --                        if (server->ifindex !=3D info->ipi_ifindex)
> --                                return 0;
> --
> --                        break;
> --                }
> -+        /* TODO figure out if this can be done as a filter on the socke=
t, like for IPv6 */
> -+        struct in_pktinfo *info =3D CMSG_FIND_DATA(&msg, IPPROTO_IP, IP=
_PKTINFO, struct in_pktinfo);
> -+        if (info && info->ipi_ifindex !=3D server->ifindex)
> -+                return 0;
> -=20
> -         if (sd_dhcp_server_is_in_relay_mode(server)) {
> -                 r =3D dhcp_server_relay_message(server, message, len - =
sizeof(DHCPMessage), buflen);
> ---- a/src/libsystemd/sd-daemon/sd-daemon.c
> -+++ b/src/libsystemd/sd-daemon/sd-daemon.c
> -@@ -567,7 +567,7 @@ _public_ int sd_pid_notify_with_fds(
> -                         cmsg->cmsg_type =3D SCM_CREDENTIALS;
> -                         cmsg->cmsg_len =3D CMSG_LEN(sizeof(struct ucred=
));
> -=20
> --                        ucred =3D (struct ucred*) CMSG_DATA(cmsg);
> -+                        ucred =3D CMSG_TYPED_DATA(cmsg, struct ucred);
> -                         ucred->pid =3D pid !=3D 0 ? pid : getpid_cached=
();
> -                         ucred->uid =3D getuid();
> -                         ucred->gid =3D getgid();
> ---- a/src/resolve/resolved-manager.c
> -+++ b/src/resolve/resolved-manager.c
> -@@ -984,7 +984,7 @@ static int manager_ipv4_send(
> -                 cmsg->cmsg_level =3D IPPROTO_IP;
> -                 cmsg->cmsg_type =3D IP_PKTINFO;
> -=20
> --                pi =3D (struct in_pktinfo*) CMSG_DATA(cmsg);
> -+                pi =3D CMSG_TYPED_DATA(cmsg, struct in_pktinfo);
> -                 pi->ipi_ifindex =3D ifindex;
> -=20
> -                 if (source)
> -@@ -1040,7 +1040,7 @@ static int manager_ipv6_send(
> -                 cmsg->cmsg_level =3D IPPROTO_IPV6;
> -                 cmsg->cmsg_type =3D IPV6_PKTINFO;
> -=20
> --                pi =3D (struct in6_pktinfo*) CMSG_DATA(cmsg);
> -+                pi =3D CMSG_TYPED_DATA(cmsg, struct in6_pktinfo);
> -                 pi->ipi6_ifindex =3D ifindex;
> -=20
> -                 if (source)
> diff --git a/meta/recipes-core/systemd/systemd/27254.patch b/meta/recipes=
-core/systemd/systemd/27254.patch
> deleted file mode 100644
> index 3928088dc6a..00000000000
> --- a/meta/recipes-core/systemd/systemd/27254.patch
> +++ /dev/null
> @@ -1,345 +0,0 @@
> -From 79dec6f5cc0b72d43dfb0469fa68b5cd023fbaf9 Mon Sep 17 00:00:00 2001
> -From: Lennart Poettering <lennart@poettering.net>
> -Date: Thu, 13 Apr 2023 10:21:31 +0200
> -Subject: [PATCH 1/3] socket-util: tighten aignment check for CMSG_TYPED_=
DATA()
> -
> -Apparently CMSG_DATA() alignment is very much undefined. Which is quite
> -an ABI fuck-up, but we need to deal with this. CMSG_TYPED_DATA() already
> -checks alignment of the specified pointer. Let's also check matching
> -alignment of the underlying structures, which we already can do at
> -compile-time.
> -
> -See: #27241
> -
> -(This does not fix #27241, but should catch such errors already at
> -compile-time instead of runtime)
> -
> -Upstream-Status: Backport [https://github.com/systemd/systemd/pull/27254]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/basic/socket-util.h | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> ---- a/src/basic/socket-util.h
> -+++ b/src/basic/socket-util.h
> -@@ -175,9 +175,16 @@ int flush_accept(int fd);
> - #define CMSG_FOREACH(cmsg, mh)                                         =
 \
> -         for ((cmsg) =3D CMSG_FIRSTHDR(mh); (cmsg); (cmsg) =3D CMSG_NXTH=
DR((mh), (cmsg)))
> -=20
> -+/* Returns the cmsghdr's data pointer, but safely cast to the specified=
 type. Does two alignment checks: one
> -+ * at compile time, that the requested type has a smaller or same align=
ment as 'struct cmsghdr', and one
> -+ * during runtime, that the actual pointer matches the alignment too. T=
his is supposed to catch cases such as
> -+ * 'struct timeval' is embedded into 'struct cmsghdr' on architectures =
where the alignment of the former is 8
> -+ * bytes (because of a 64bit time_t), but of the latter is 4 bytes (bec=
ause size_t is 32bit), such as
> -+ * riscv32. */
> - #define CMSG_TYPED_DATA(cmsg, type)                                    =
 \
> -         ({                                                             =
 \
> -                 struct cmsghdr *_cmsg =3D cmsg;                        =
   \
> -+                assert_cc(__alignof__(type) <=3D __alignof__(struct cms=
ghdr)); \
> -                 _cmsg ? CAST_ALIGN_PTR(type, CMSG_DATA(_cmsg)) : (type*=
) NULL; \
> -         })
> -=20
> ---- a/src/basic/socket-util.c
> -+++ b/src/basic/socket-util.c
> -@@ -1047,7 +1047,7 @@ ssize_t receive_one_fd_iov(
> -         }
> -=20
> -         if (found)
> --                *ret_fd =3D *(int*) CMSG_DATA(found);
> -+                *ret_fd =3D *CMSG_TYPED_DATA(found, int);
> -         else
> -                 *ret_fd =3D -EBADF;
> -=20
> ---- a/src/core/manager.c
> -+++ b/src/core/manager.c
> -@@ -2503,7 +2503,7 @@ static int manager_dispatch_notify_fd(sd
> -                 if (cmsg->cmsg_level =3D=3D SOL_SOCKET && cmsg->cmsg_ty=
pe =3D=3D SCM_RIGHTS) {
> -=20
> -                         assert(!fd_array);
> --                        fd_array =3D (int*) CMSG_DATA(cmsg);
> -+                        fd_array =3D CMSG_TYPED_DATA(cmsg, int);
> -                         n_fds =3D (cmsg->cmsg_len - CMSG_LEN(0)) / size=
of(int);
> -=20
> -                 } else if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -@@ -2511,7 +2511,7 @@ static int manager_dispatch_notify_fd(sd
> -                            cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct=
 ucred))) {
> -=20
> -                         assert(!ucred);
> --                        ucred =3D (struct ucred*) CMSG_DATA(cmsg);
> -+                        ucred =3D CMSG_TYPED_DATA(cmsg, struct ucred);
> -                 }
> -         }
> -=20
> ---- a/src/coredump/coredump.c
> -+++ b/src/coredump/coredump.c
> -@@ -1163,7 +1163,7 @@ static int process_socket(int fd) {
> -                         }
> -=20
> -                         assert(input_fd < 0);
> --                        input_fd =3D *(int*) CMSG_DATA(found);
> -+                        input_fd =3D *CMSG_TYPED_DATA(found, int);
> -                         break;
> -                 } else
> -                         cmsg_close_all(&mh);
> ---- a/src/home/homed-manager.c
> -+++ b/src/home/homed-manager.c
> -@@ -1086,7 +1086,7 @@ static ssize_t read_datagram(
> -                     cmsg->cmsg_type =3D=3D SCM_CREDENTIALS &&
> -                     cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct ucred)=
)) {
> -                         assert(!sender);
> --                        sender =3D (struct ucred*) CMSG_DATA(cmsg);
> -+                        sender =3D CMSG_TYPED_DATA(cmsg, struct ucred);
> -                 }
> -=20
> -                 if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -@@ -1098,7 +1098,7 @@ static ssize_t read_datagram(
> -                         }
> -=20
> -                         assert(passed_fd < 0);
> --                        passed_fd =3D *(int*) CMSG_DATA(cmsg);
> -+                        passed_fd =3D *CMSG_TYPED_DATA(cmsg, int);
> -                 }
> -         }
> -=20
> ---- a/src/journal/journald-server.c
> -+++ b/src/journal/journald-server.c
> -@@ -1454,21 +1454,21 @@ int server_process_datagram(
> -                     cmsg->cmsg_type =3D=3D SCM_CREDENTIALS &&
> -                     cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct ucred)=
)) {
> -                         assert(!ucred);
> --                        ucred =3D (struct ucred*) CMSG_DATA(cmsg);
> -+                        ucred =3D CMSG_TYPED_DATA(cmsg, struct ucred);
> -                 } else if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -                          cmsg->cmsg_type =3D=3D SCM_SECURITY) {
> -                         assert(!label);
> --                        label =3D (char*) CMSG_DATA(cmsg);
> -+                        label =3D CMSG_TYPED_DATA(cmsg, char);
> -                         label_len =3D cmsg->cmsg_len - CMSG_LEN(0);
> -                 } else if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -                            cmsg->cmsg_type =3D=3D SO_TIMESTAMP &&
> -                            cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct=
 timeval))) {
> -                         assert(!tv);
> --                        tv =3D (struct timeval*) CMSG_DATA(cmsg);
> -+                        tv =3D CMSG_TYPED_DATA(cmsg, struct timeval);
> -                 } else if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -                          cmsg->cmsg_type =3D=3D SCM_RIGHTS) {
> -                         assert(!fds);
> --                        fds =3D (int*) CMSG_DATA(cmsg);
> -+                        fds =3D CMSG_TYPED_DATA(cmsg, int);
> -                         n_fds =3D (cmsg->cmsg_len - CMSG_LEN(0)) / size=
of(int);
> -                 }
> -=20
> ---- a/src/libsystemd-network/icmp6-util.c
> -+++ b/src/libsystemd-network/icmp6-util.c
> -@@ -192,7 +192,7 @@ int icmp6_receive(int fd, void *buffer,
> -                 if (cmsg->cmsg_level =3D=3D SOL_IPV6 &&
> -                     cmsg->cmsg_type =3D=3D IPV6_HOPLIMIT &&
> -                     cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(int))) {
> --                        int hops =3D *(int*) CMSG_DATA(cmsg);
> -+                        int hops =3D *CMSG_TYPED_DATA(cmsg, int);
> -=20
> -                         if (hops !=3D 255)
> -                                 return -EMULTIHOP;
> -@@ -201,7 +201,7 @@ int icmp6_receive(int fd, void *buffer,
> -                 if (cmsg->cmsg_level =3D=3D SOL_SOCKET &&
> -                     cmsg->cmsg_type =3D=3D SO_TIMESTAMP &&
> -                     cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct timeva=
l)))
> --                        triple_timestamp_from_realtime(&t, timeval_load=
((struct timeval*) CMSG_DATA(cmsg)));
> -+                        triple_timestamp_from_realtime(&t, timeval_load=
(CMSG_TYPED_DATA(cmsg, struct timeval)));
> -         }
> -=20
> -         if (!triple_timestamp_is_set(&t))
> ---- a/src/libsystemd-network/sd-dhcp-client.c
> -+++ b/src/libsystemd-network/sd-dhcp-client.c
> -@@ -1981,7 +1981,7 @@ static int client_receive_message_raw(
> -=20
> -         cmsg =3D cmsg_find(&msg, SOL_PACKET, PACKET_AUXDATA, CMSG_LEN(s=
izeof(struct tpacket_auxdata)));
> -         if (cmsg) {
> --                struct tpacket_auxdata *aux =3D (struct tpacket_auxdata=
*) CMSG_DATA(cmsg);
> -+                struct tpacket_auxdata *aux =3D CMSG_TYPED_DATA(cmsg, s=
truct tpacket_auxdata);
> -                 checksum =3D !(aux->tp_status & TP_STATUS_CSUMNOTREADY);
> -         }
> -=20
> ---- a/src/libsystemd-network/sd-dhcp-server.c
> -+++ b/src/libsystemd-network/sd-dhcp-server.c
> -@@ -1310,7 +1310,7 @@ static int server_receive_message(sd_eve
> -                 if (cmsg->cmsg_level =3D=3D IPPROTO_IP &&
> -                     cmsg->cmsg_type =3D=3D IP_PKTINFO &&
> -                     cmsg->cmsg_len =3D=3D CMSG_LEN(sizeof(struct in_pkt=
info))) {
> --                        struct in_pktinfo *info =3D (struct in_pktinfo*=
)CMSG_DATA(cmsg);
> -+                        struct in_pktinfo *info =3D CMSG_TYPED_DATA(cms=
g, struct in_pktinfo);
> -=20
> -                         /* TODO figure out if this can be done as a fil=
ter on
> -                          * the socket, like for IPv6 */
> ---- a/src/libsystemd/sd-bus/bus-socket.c
> -+++ b/src/libsystemd/sd-bus/bus-socket.c
> -@@ -604,7 +604,7 @@ static int bus_socket_read_auth(sd_bus *
> -                                  * protocol? Somebody is playing games =
with
> -                                  * us. Close them all, and fail */
> -                                 j =3D (cmsg->cmsg_len - CMSG_LEN(0)) / =
sizeof(int);
> --                                close_many((int*) CMSG_DATA(cmsg), j);
> -+                                close_many(CMSG_TYPED_DATA(cmsg, int), =
j);
> -                                 return -EIO;
> -                         } else
> -                                 log_debug("Got unexpected auxiliary dat=
a with level=3D%d and type=3D%d",
> -@@ -1270,18 +1270,18 @@ int bus_socket_read_message(sd_bus *bus)
> -                                          * isn't actually enabled? Clos=
e them,
> -                                          * and fail */
> -=20
> --                                        close_many((int*) CMSG_DATA(cms=
g), n);
> -+                                        close_many(CMSG_TYPED_DATA(cmsg=
, int), n);
> -                                         return -EIO;
> -                                 }
> -=20
> -                                 f =3D reallocarray(bus->fds, bus->n_fds=
 + n, sizeof(int));
> -                                 if (!f) {
> --                                        close_many((int*) CMSG_DATA(cms=
g), n);
> -+                                        close_many(CMSG_TYPED_DATA(cmsg=
, int), n);
> -                                         return -ENOMEM;
> -                                 }
> -=20
> -                                 for (i =3D 0; i < n; i++)
> --                                        f[bus->n_fds++] =3D fd_move_abo=
ve_stdio(((int*) CMSG_DATA(cmsg))[i]);
> -+                                        f[bus->n_fds++] =3D fd_move_abo=
ve_stdio(CMSG_TYPED_DATA(cmsg, int)[i]);
> -                                 bus->fds =3D f;
> -                         } else
> -                                 log_debug("Got unexpected auxiliary dat=
a with level=3D%d and type=3D%d",
> ---- a/src/resolve/resolved-dns-stream.c
> -+++ b/src/resolve/resolved-dns-stream.c
> -@@ -147,7 +147,7 @@ static int dns_stream_identify(DnsStream
> -                         switch (cmsg->cmsg_type) {
> -=20
> -                         case IPV6_PKTINFO: {
> --                                struct in6_pktinfo *i =3D (struct in6_p=
ktinfo*) CMSG_DATA(cmsg);
> -+                                struct in6_pktinfo *i =3D CMSG_TYPED_DA=
TA(cmsg, struct in6_pktinfo);
> -=20
> -                                 if (s->ifindex <=3D 0)
> -                                         s->ifindex =3D i->ipi6_ifindex;
> -@@ -155,7 +155,7 @@ static int dns_stream_identify(DnsStream
> -                         }
> -=20
> -                         case IPV6_HOPLIMIT:
> --                                s->ttl =3D *(int *) CMSG_DATA(cmsg);
> -+                                s->ttl =3D *CMSG_TYPED_DATA(cmsg, int);
> -                                 break;
> -                         }
> -=20
> -@@ -165,7 +165,7 @@ static int dns_stream_identify(DnsStream
> -                         switch (cmsg->cmsg_type) {
> -=20
> -                         case IP_PKTINFO: {
> --                                struct in_pktinfo *i =3D (struct in_pkt=
info*) CMSG_DATA(cmsg);
> -+                                struct in_pktinfo *i =3D CMSG_TYPED_DAT=
A(cmsg, struct in_pktinfo);
> -=20
> -                                 if (s->ifindex <=3D 0)
> -                                         s->ifindex =3D i->ipi_ifindex;
> -@@ -173,7 +173,7 @@ static int dns_stream_identify(DnsStream
> -                         }
> -=20
> -                         case IP_TTL:
> --                                s->ttl =3D *(int *) CMSG_DATA(cmsg);
> -+                                s->ttl =3D *CMSG_TYPED_DATA(cmsg, int);
> -                                 break;
> -                         }
> -                 }
> ---- a/src/resolve/resolved-manager.c
> -+++ b/src/resolve/resolved-manager.c
> -@@ -801,7 +801,7 @@ int manager_recv(Manager *m, int fd, Dns
> -                         switch (cmsg->cmsg_type) {
> -=20
> -                         case IPV6_PKTINFO: {
> --                                struct in6_pktinfo *i =3D (struct in6_p=
ktinfo*) CMSG_DATA(cmsg);
> -+                                struct in6_pktinfo *i =3D CMSG_TYPED_DA=
TA(cmsg, struct in6_pktinfo);
> -=20
> -                                 if (p->ifindex <=3D 0)
> -                                         p->ifindex =3D i->ipi6_ifindex;
> -@@ -811,11 +811,11 @@ int manager_recv(Manager *m, int fd, Dns
> -                         }
> -=20
> -                         case IPV6_HOPLIMIT:
> --                                p->ttl =3D *(int *) CMSG_DATA(cmsg);
> -+                                p->ttl =3D *CMSG_TYPED_DATA(cmsg, int);
> -                                 break;
> -=20
> -                         case IPV6_RECVFRAGSIZE:
> --                                p->fragsize =3D *(int *) CMSG_DATA(cmsg=
);
> -+                                p->fragsize =3D *CMSG_TYPED_DATA(cmsg, =
int);
> -                                 break;
> -                         }
> -                 } else if (cmsg->cmsg_level =3D=3D IPPROTO_IP) {
> -@@ -824,7 +824,7 @@ int manager_recv(Manager *m, int fd, Dns
> -                         switch (cmsg->cmsg_type) {
> -=20
> -                         case IP_PKTINFO: {
> --                                struct in_pktinfo *i =3D (struct in_pkt=
info*) CMSG_DATA(cmsg);
> -+                                struct in_pktinfo *i =3D CMSG_TYPED_DAT=
A(cmsg, struct in_pktinfo);
> -=20
> -                                 if (p->ifindex <=3D 0)
> -                                         p->ifindex =3D i->ipi_ifindex;
> -@@ -834,11 +834,11 @@ int manager_recv(Manager *m, int fd, Dns
> -                         }
> -=20
> -                         case IP_TTL:
> --                                p->ttl =3D *(int *) CMSG_DATA(cmsg);
> -+                                p->ttl =3D *CMSG_TYPED_DATA(cmsg, int);
> -                                 break;
> -=20
> -                         case IP_RECVFRAGSIZE:
> --                                p->fragsize =3D *(int *) CMSG_DATA(cmsg=
);
> -+                                p->fragsize =3D *CMSG_TYPED_DATA(cmsg, =
int);
> -                                 break;
> -                         }
> -                 }
> ---- a/src/libsystemd/sd-device/device-monitor.c
> -+++ b/src/libsystemd/sd-device/device-monitor.c
> -@@ -503,7 +503,6 @@ int device_monitor_receive_device(sd_dev
> -                 .msg_name =3D &snl,
> -                 .msg_namelen =3D sizeof(snl),
> -         };
> --        struct cmsghdr *cmsg;
> -         struct ucred *cred;
> -         size_t offset;
> -         ssize_t n;
> -@@ -559,12 +558,11 @@ int device_monitor_receive_device(sd_dev
> -                                                  snl.nl.nl_pid);
> -         }
> -=20
> --        cmsg =3D CMSG_FIRSTHDR(&smsg);
> --        if (!cmsg || cmsg->cmsg_type !=3D SCM_CREDENTIALS)
> -+        cred =3D CMSG_FIND_DATA(&smsg, SOL_SOCKET, SCM_CREDENTIALS, str=
uct ucred);
> -+        if (!cred)
> -                 return log_monitor_errno(m, SYNTHETIC_ERRNO(EAGAIN),
> -                                          "No sender credentials receive=
d, ignoring message.");
> -=20
> --        cred =3D (struct ucred*) CMSG_DATA(cmsg);
> -         if (!check_sender_uid(m, cred->uid))
> -                 return log_monitor_errno(m, SYNTHETIC_ERRNO(EAGAIN),
> -                                          "Sender uid=3D"UID_FMT", messa=
ge ignored.", cred->uid);
> ---- a/src/udev/udev-ctrl.c
> -+++ b/src/udev/udev-ctrl.c
> -@@ -161,7 +161,6 @@ static int udev_ctrl_connection_event_ha
> -                 .msg_control =3D &control,
> -                 .msg_controllen =3D sizeof(control),
> -         };
> --        struct cmsghdr *cmsg;
> -         struct ucred *cred;
> -         ssize_t size;
> -=20
> -@@ -185,15 +184,12 @@ static int udev_ctrl_connection_event_ha
> -=20
> -         cmsg_close_all(&smsg);
> -=20
> --        cmsg =3D CMSG_FIRSTHDR(&smsg);
> --
> --        if (!cmsg || cmsg->cmsg_type !=3D SCM_CREDENTIALS) {
> -+        cred =3D CMSG_FIND_DATA(&smsg, SOL_SOCKET, SCM_CREDENTIALS, str=
uct ucred);
> -+        if (!cred) {
> -                 log_error("No sender credentials received, ignoring mes=
sage");
> -                 return 0;
> -         }
> -=20
> --        cred =3D (struct ucred *) CMSG_DATA(cmsg);
> --
> -         if (cred->uid !=3D 0) {
> -                 log_error("Invalid sender uid "UID_FMT", ignoring messa=
ge", cred->uid);
> -                 return 0;
> diff --git a/meta/recipes-core/systemd/systemd_253.7.bb b/meta/recipes-co=
re/systemd/systemd_254.bb
> similarity index 98%
> rename from meta/recipes-core/systemd/systemd_253.7.bb
> rename to meta/recipes-core/systemd/systemd_254.bb
> index 1fd4556afd0..6ef148ac361 100644
> --- a/meta/recipes-core/systemd/systemd_253.7.bb
> +++ b/meta/recipes-core/systemd/systemd_254.bb
> @@ -26,8 +26,6 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
>             file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-=
to-.patch \
> -           file://27254.patch \
> -           file://27253.patch \
>             "
> =20
>  # patches needed by musl
> @@ -39,7 +37,6 @@ SRC_URI_MUSL =3D "\
>                 file://0012-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-=
is-not-.patch \
>                 file://0013-add-missing-FTW_-macros-for-musl.patch \
>                 file://0014-Use-uintmax_t-for-handling-rlim_t.patch \
> -               file://0015-test-sizeof.c-Disable-tests-for-missing-typed=
efs-in-.patch \
>                 file://0016-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-facces=
sat.patch \
>                 file://0017-Define-glibc-compatible-basename-for-non-glib=
c-syste.patch \
>                 file://0018-Do-not-disable-buffering-when-writing-to-oom_=
score_a.patch \
> @@ -53,6 +50,9 @@ SRC_URI_MUSL =3D "\
>                 file://0001-Adjust-for-musl-headers.patch \
>                 file://0006-test-bus-error-strerror-is-assumed-to-be-GNU-=
specifi.patch \
>                 file://0003-errno-util-Make-STRERROR-portable-for-musl.pa=
tch \
> +               file://0025-include-sys-file.h-for-LOCK_EX.patch \
> +               file://0026-test-test-sizeof-Include-sys-timex.h-for-stru=
ct-time.patch \
> +               file://0027-include-missing-sys-file.h-for-LOCK_EX.patch \
>                 "
> =20
>  PAM_PLUGINS =3D " \
> @@ -140,8 +140,7 @@ PACKAGECONFIG[default-compression-lz4] =3D "-Dlz4=3Dt=
rue -Ddefault-compression=3Dlz4,,
>  PACKAGECONFIG[default-compression-xz] =3D "-Dxz=3Dtrue -Ddefault-compres=
sion=3Dxz,,xz"
>  PACKAGECONFIG[default-compression-zstd] =3D "-Dzstd=3Dtrue -Ddefault-com=
pression=3Dzstd,,zstd"
>  PACKAGECONFIG[dbus] =3D "-Ddbus=3Dtrue,-Ddbus=3Dfalse,dbus"
> -PACKAGECONFIG[efi] =3D "-Defi=3Dtrue,-Defi=3Dfalse"
> -PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-libdir=3D${STAGING_LI=
BDIR} -Defi-includedir=3D${STAGING_INCDIR}/efi,-Dgnu-efi=3Dfalse,gnu-efi"
> +PACKAGECONFIG[efi] =3D "-Defi=3Dtrue -Dbootloader=3Dtrue,-Defi=3Dfalse -=
Dbootloader=3Dfalse,python3-pyelftools"
>  PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls"
>  PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
>  PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
> @@ -552,6 +551,7 @@ FILES:${PN}-extra-utils =3D "\
>                          ${bindir}/systemd-stdio-bridge \
>                          ${base_bindir}/systemd-ask-password \
>                          ${base_bindir}/systemd-tty-ask-password-agent \
> +                        ${base_sbindir}/mount.ddi \
>                          ${systemd_system_unitdir}/initrd.target.wants/sy=
stemd-pcrphase-initrd.path \
>                          ${systemd_system_unitdir}/systemd-ask-password-c=
onsole.path \
>                          ${systemd_system_unitdir}/systemd-ask-password-c=
onsole.service \
> @@ -622,6 +622,8 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${datadir}/polkit-1 \
>                  ${datadir}/${BPN} \
>                  ${datadir}/factory \
> +                ${sysconfdir}/credstore/ \
> +                ${sysconfdir}/credstore.encrypted/ \
>                  ${sysconfdir}/dbus-1/ \
>                  ${sysconfdir}/modules-load.d/ \
>                  ${sysconfdir}/pam.d/ \
> @@ -650,6 +652,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
>                  ${bindir}/bootctl \
>                  ${bindir}/oomctl \
>                  ${bindir}/userdbctl \
> +                ${exec_prefix}/lib/credstore \
>                  ${exec_prefix}/lib/tmpfiles.d/*.conf \
>                  ${exec_prefix}/lib/systemd \
>                  ${exec_prefix}/lib/modules-load.d \
> @@ -685,6 +688,7 @@ RRECOMMENDS:${PN} +=3D "systemd-extra-utils \
>                        kernel-module-autofs4 kernel-module-unix kernel-mo=
dule-ipv6 kernel-module-sch-fq-codel \
>                        os-release \
>                        systemd-conf \
> +                      ${@bb.utils.contains('PACKAGECONFIG', 'logind', 'p=
am-plugin-umask', '', d)} \
>  "
> =20
>  INSANE_SKIP:${PN} +=3D "dev-so libdir"
> @@ -708,6 +712,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/dmi_memory_id \
>                 ${rootlibexecdir}/udev/fido_id \
>                 ${rootlibexecdir}/udev/findkeyboards \
> +               ${rootlibexecdir}/udev/iocost \
>                 ${rootlibexecdir}/udev/keyboard-force-release.sh \
>                 ${rootlibexecdir}/udev/keymap \
>                 ${rootlibexecdir}/udev/mtd_probe \
> @@ -719,6 +724,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/rules.d/60-autosuspend-chromiumos.=
rules \
>                 ${rootlibexecdir}/udev/rules.d/60-block.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-cdrom_id.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-dmi-id.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-drm.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-evdev.rules \
>                 ${rootlibexecdir}/udev/rules.d/60-fido-id.rules \
> @@ -746,6 +752,7 @@ FILES:udev +=3D "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
>                 ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
>                 ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
> +               ${rootlibexecdir}/udev/rules.d/90-iocost.rules \
>                 ${rootlibexecdir}/udev/rules.d/README \
>                 ${sysconfdir}/udev \
>                 ${sysconfdir}/init.d/systemd-udevd \
> diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.3.bb
> index eafb5aae43e..1aa307af4d0 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.3.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
> @@ -169,7 +169,7 @@ pkg_postinst:${PN}() {
>  }
> =20
>  inherit features_check
> -REQUIRED_DISTRO_FEATURES =3D "pam"
> +ANY_OF_DISTRO_FEATURES =3D "pam systemd"
> =20
>  BBCLASSEXTEND =3D "nativesdk native"
> =20
> --=20
> 2.39.2
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185442): https://lists.openembedded.org/g/openembedde=
d-core/message/185442
> Mute This Topic: https://lists.openembedded.org/mt/100516497/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

