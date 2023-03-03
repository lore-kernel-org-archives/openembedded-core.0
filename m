Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2823C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 21:29:46 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.973.1677878977410579847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 13:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PtJfHS7S;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1A1FD100007;
	Fri,  3 Mar 2023 21:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677878975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b4DpdM990092AYjPn6JexWraN7hMwHpITRDmgD3HBao=;
	b=PtJfHS7SO+dBCGUyG0J4e+aT/0nbGP332y/+BG2+RJ35jLCWPsxXtFzPRjj68Rwl03o4gt
	IP0fsblF8L+lVHDty8XQWVEHDfOkXdDSTBGw8usa9cY4WUpcyBmA4O42q5QPvjV2RlGz7L
	84MVknGlp6LLiFYgPDHfahrg8rhBJJFudcHKe7XwCrPrAj3OwObOiJ4yx+P6+GLEI39lkQ
	5OSRCnpCeFcgftigvfcJwJXuRY/1hWpmmWEWyII2935cs3CmKsXuolEvvRR7Sr8czQjfPa
	yRch3zh1IxTKFq0jyJuL8DYeBiEkn3df7kTzL95FNftKDqPiG7RJHn7ylB9/ig==
Date: Fri, 3 Mar 2023 22:29:34 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: romuald.jeanne@st.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] image_types: fix vname var init in
 multiubi_mkfs() function
Message-ID: <ZAJmvpzbRAwkR8xD@mail.local>
References: <20230303105410.2413-1-romuald.jeanne@st.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zhU6dLn+/9mhoiZg"
Content-Disposition: inline
In-Reply-To: <20230303105410.2413-1-romuald.jeanne@st.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 21:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178026


--zhU6dLn+/9mhoiZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

This still fails on the autobuilders:

2023-03-03 19:19:37,778 - oe-selftest - INFO - imagefeatures.ImageFeatures.test_image_fstypes (subunit.RemotedTestCase)
2023-03-03 19:19:37,779 - oe-selftest - INFO -  ... FAIL

2023-03-03 19:19:37,779 - oe-selftest - INFO - 2: 21/40 359/523 (131.33s) (0 failed) (imagefeatures.ImageFeatures.test_image_fstypes)
2023-03-03 19:19:37,779 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 224, in test_image_fstypes
    self.assertTrue(os.path.exists(image_path),
  File "/usr/lib64/python3.11/unittest/case.py", line 715, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : ubi image /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-3612031/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ubi doesn't exist

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4878/steps/14/logs/stdio

I'm attaching the relevant logs.


On 03/03/2023 11:54:10+0100, Romuald Jeanne via lists.openembedded.org wrote:
> From: Romuald JEANNE <romuald.jeanne@st.com>
> 
> As vname var is needed in multiubi_mkfs() function, we need to keep it
> defined and use it as parameter to the new write_ubi_config() function.
> 
> See [YOCTO #15027]
> 
> Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
> ---
>  meta/classes-recipe/image_types.bbclass | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
> index 764e6a5574..77cb22cf9c 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -157,11 +157,7 @@ UBI_VOLTYPE ?= "dynamic"
>  UBI_IMGTYPE ?= "ubifs"
>  
>  write_ubi_config() {
> -	if [ -z "$1" ]; then
> -		local vname=""
> -	else
> -		local vname="_$1"
> -	fi
> +	local vname="$1"
>  
>  	cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
>  [ubifs]
> @@ -183,7 +179,12 @@ multiubi_mkfs() {
>              bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
>          fi
>  
> -	write_ubi_config "$3"
> +	if [ -z "$1" ]; then
> +		local vname=""
> +	else
> +		local vname="_$3"
> +	fi
> +	write_ubi_config "${vname}"
>  
>  	if [ -n "$vname" ]; then
>  		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177985): https://lists.openembedded.org/g/openembedded-core/message/177985
> Mute This Topic: https://lists.openembedded.org/mt/97359377/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zhU6dLn+/9mhoiZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.do_image_ubi.1353785"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/oe-selftest-fe=
dora/build/meta/recipes-bsp/grub/grub-efi_2.06.bb:do_populate_sysroot', '/h=
ome/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core/glibc=
/cross-localedef-native_2.37.bb:do_populate_sysroot', '/home/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/meta/recipes-core/glibc/ldconfig-native_2=
=2E12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/meta/recipes-core/os-release/os-release.bb:do_populate_sysroot=
', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core=
/systemd/systemd-boot_252.5.bb:do_populate_sysroot', '/home/pokybuild/yocto=
-worker/oe-selftest-fedora/build/meta/recipes-devtools/binutils/binutils-cr=
oss_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest=
-fedora/build/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_pop=
ulate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta=
/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/hom=
e/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/sys=
linux/syslinux_6.04-pre2.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo=
rker/oe-selftest-fedora/build/meta/recipes-kernel/kmod/depmodwrapper-cross_=
1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/o=
e-selftest-fedora/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do=
_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/dnf/dnf_4.14.0.bb:do_populate_sysroot', '=
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot', 'virtua=
l:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes=
-devtools/erofs-utils/erofs-utils_1.5.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devt=
ools/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home=
/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/mtd/=
mtd-utils_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/meta/recipes-devtools/opkg-utils/opkg-uti=
ls_0.5.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wor=
ker/oe-selftest-fedora/build/meta/recipes-devtools/opkg/opkg_0.6.1.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot'=
, 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/met=
a/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot', 'virtual:native:=
/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools=
/squashfs-tools/squashfs-tools_git.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtool=
s/syslinux/syslinux_6.04-pre2.bb:do_populate_sysroot', 'virtual:native:/hom=
e/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/pbz=
ip2/pbzip2_1.1.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/=
yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/pigz/pigz_2.7.b=
b:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-sel=
ftest-fedora/build/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot=
', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/me=
ta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-suppor=
t/bmap-tools/bmap-tools_git.bb:do_populate_sysroot', 'virtual:native:/home/=
pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-support/lz4/lz=
4_1.9.4.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['grub-efi', 'cross-localedef-=
native', 'ldconfig-native', 'os-release', 'systemd-boot', 'binutils-cross-x=
86_64', 'cdrtools-native', 'qemuwrapper-cross', 'syslinux', 'depmodwrapper-=
cross', 'update-rc.d-native', 'btrfs-tools-native', 'createrepo-c-native', =
'dnf-native', 'e2fsprogs-native', 'erofs-utils-native', 'makedevs-native', =
'mtd-utils-native', 'opkg-utils-native', 'opkg-native', 'pseudo-native', 'r=
pm-native', 'squashfs-tools-native', 'syslinux-native', 'pbzip2-native', 'p=
igz-native', 'xz-native', 'zstd-native', 'bmap-tools-native', 'lz4-native',=
 'shadow-native', 'coreutils-native', 'python3-six-native', 'python3-native=
', 'python3-wheel-native', 'python3-build-native', 'python3-installer-nativ=
e', 'python3-setuptools-native', 'qemu-native', 'texinfo-dummy-native', 'gn=
u-config-native', 'zlib-native', 'flex-native', 'util-linux-native', 'nasm-=
native', 'mtools-native', 'librepo-native', 'gettext-minimal-native', 'cmak=
e-native', 'libdnf-native', 'libcomps-native', 'python3-iniparse-native', '=
bzip2-native', 'sqlite3-native', 'popt-native', 'elfutils-native', 'libtool=
-native', 'lua-native', 'libgcrypt-native', 'file-native', 'gcc-runtime', '=
e2fsprogs', 'glibc', 'util-linux', 'openssl-native', 'debianutils-native', =
'perl-native', 'lzo-native', 'attr-native', 'acl-native', 'libarchive-nativ=
e', 'libsolv-native', 'util-linux-libuuid-native', 'kmod-native', 'libxml2-=
native', 'expat-native', 'curl-native', 'glib-2.0-native', 'gnu-efi', 'libc=
ap', 'ncurses-native', 'gdbm-native', 'libffi-native', 'readline-native', '=
libtirpc-native', 'libnsl2-native', 'python3-flit-core-native', 'python3-py=
project-hooks-native', 'python3-packaging-native', 'm4-native', 'libpcre2-n=
ative', 'libcap-ng-native', 'groff-native', 'gpgme-native', 'gobject-intros=
pection-native', 'swig-native', 'libmodulemd-native', 'json-c-native', 'lib=
check-native', 'libmicrohttpd-native', 'libgpg-error-native', 'libcap-nativ=
e', 'linux-libc-headers', 'libgcc', 'opkg-utils', 'attr', 'autoconf-archive=
', 'util-linux-libuuid', 'bash-completion', 'ncurses', 'zlib', 'libcap-ng',=
 'libxcrypt', 'make-native', 'gettext-native', 'unzip-native', 'libassuan-n=
ative', 'libyaml-native', 'gnutls-native', 'libidn2-native', 'nettle-native=
', 'gmp-native', 'libunistring-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function set_image_size
DEBUG: 33883.200000 =3D 26064 * 1.300000
DEBUG: 33883.200000 =3D max(33883.200000, 8192)[33883.200000] + 0
DEBUG: 33884.000000 =3D int(33883.200000)
DEBUG: 33884 =3D aligned(33884)
DEBUG: returning 33884
DEBUG: Python function set_image_size finished
DEBUG: Executing shell function do_image_ubi
ubinize: volume size was not specified in section "ubifs", assume minimum t=
o fit image "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st=
-3612031/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/deploy-co=
re-image-minimal-image-complete/core-image-minimal-qemux86-64-2023030319174=
7_.rootfs.ubifs"20385792 bytes (19.4 MiB)
/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-3612031
DEBUG: Shell function do_image_ubi finished
DEBUG: Executing python function create_symlinks
NOTE: Skipping symlink, source does not exist: /home/pokybuild/yocto-worker=
/oe-selftest-fedora/build/build-st-3612031/tmp/work/qemux86_64-poky-linux/c=
ore-image-minimal/1.0-r0/deploy-core-image-minimal-image-complete/core-imag=
e-minimal-qemux86-64.ubi -> core-image-minimal-qemux86-64-20230303191747.ro=
otfs.ubi
DEBUG: Python function create_symlinks finished

--zhU6dLn+/9mhoiZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="log.do_image_ubifs.1336032"
Content-Transfer-Encoding: quoted-printable

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/oe-selftest-fe=
dora/build/meta/recipes-bsp/grub/grub-efi_2.06.bb:do_populate_sysroot', '/h=
ome/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core/glibc=
/cross-localedef-native_2.37.bb:do_populate_sysroot', '/home/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/meta/recipes-core/glibc/ldconfig-native_2=
=2E12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-=
fedora/build/meta/recipes-core/os-release/os-release.bb:do_populate_sysroot=
', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-core=
/systemd/systemd-boot_252.5.bb:do_populate_sysroot', '/home/pokybuild/yocto=
-worker/oe-selftest-fedora/build/meta/recipes-devtools/binutils/binutils-cr=
oss_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest=
-fedora/build/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb:do_pop=
ulate_sysroot', '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta=
/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot', '/hom=
e/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/sys=
linux/syslinux_6.04-pre2.bb:do_populate_sysroot', '/home/pokybuild/yocto-wo=
rker/oe-selftest-fedora/build/meta/recipes-kernel/kmod/depmodwrapper-cross_=
1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/o=
e-selftest-fedora/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do=
_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/dnf/dnf_4.14.0.bb:do_populate_sysroot', '=
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot', 'virtua=
l:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes=
-devtools/erofs-utils/erofs-utils_1.5.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devt=
ools/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home=
/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools/mtd/=
mtd-utils_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yoct=
o-worker/oe-selftest-fedora/build/meta/recipes-devtools/opkg-utils/opkg-uti=
ls_0.5.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-wor=
ker/oe-selftest-fedora/build/meta/recipes-devtools/opkg/opkg_0.6.1.bb:do_po=
pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-f=
edora/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot'=
, 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/met=
a/recipes-devtools/rpm/rpm_4.18.0.bb:do_populate_sysroot', 'virtual:native:=
/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtools=
/squashfs-tools/squashfs-tools_git.bb:do_populate_sysroot', 'virtual:native=
:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-devtool=
s/syslinux/syslinux_6.04-pre2.bb:do_populate_sysroot', 'virtual:native:/hom=
e/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/pbz=
ip2/pbzip2_1.1.13.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/=
yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/pigz/pigz_2.7.b=
b:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/oe-sel=
ftest-fedora/build/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot=
', 'virtual:native:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/me=
ta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot', 'virtual:nativ=
e:/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-suppor=
t/bmap-tools/bmap-tools_git.bb:do_populate_sysroot', 'virtual:native:/home/=
pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-support/lz4/lz=
4_1.9.4.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['grub-efi', 'cross-localedef-=
native', 'ldconfig-native', 'os-release', 'systemd-boot', 'binutils-cross-x=
86_64', 'cdrtools-native', 'qemuwrapper-cross', 'syslinux', 'depmodwrapper-=
cross', 'update-rc.d-native', 'btrfs-tools-native', 'createrepo-c-native', =
'dnf-native', 'e2fsprogs-native', 'erofs-utils-native', 'makedevs-native', =
'mtd-utils-native', 'opkg-utils-native', 'opkg-native', 'pseudo-native', 'r=
pm-native', 'squashfs-tools-native', 'syslinux-native', 'pbzip2-native', 'p=
igz-native', 'xz-native', 'zstd-native', 'bmap-tools-native', 'lz4-native',=
 'shadow-native', 'coreutils-native', 'python3-six-native', 'python3-native=
', 'python3-wheel-native', 'python3-build-native', 'python3-installer-nativ=
e', 'python3-setuptools-native', 'qemu-native', 'texinfo-dummy-native', 'gn=
u-config-native', 'zlib-native', 'flex-native', 'util-linux-native', 'nasm-=
native', 'mtools-native', 'librepo-native', 'gettext-minimal-native', 'cmak=
e-native', 'libdnf-native', 'libcomps-native', 'python3-iniparse-native', '=
bzip2-native', 'sqlite3-native', 'popt-native', 'elfutils-native', 'libtool=
-native', 'lua-native', 'libgcrypt-native', 'file-native', 'gcc-runtime', '=
e2fsprogs', 'glibc', 'util-linux', 'openssl-native', 'debianutils-native', =
'perl-native', 'lzo-native', 'attr-native', 'acl-native', 'libarchive-nativ=
e', 'libsolv-native', 'util-linux-libuuid-native', 'kmod-native', 'libxml2-=
native', 'expat-native', 'curl-native', 'glib-2.0-native', 'gnu-efi', 'libc=
ap', 'ncurses-native', 'gdbm-native', 'libffi-native', 'readline-native', '=
libtirpc-native', 'libnsl2-native', 'python3-flit-core-native', 'python3-py=
project-hooks-native', 'python3-packaging-native', 'm4-native', 'libpcre2-n=
ative', 'libcap-ng-native', 'groff-native', 'gpgme-native', 'gobject-intros=
pection-native', 'swig-native', 'libmodulemd-native', 'json-c-native', 'lib=
check-native', 'libmicrohttpd-native', 'libgpg-error-native', 'libcap-nativ=
e', 'linux-libc-headers', 'libgcc', 'opkg-utils', 'attr', 'autoconf-archive=
', 'util-linux-libuuid', 'bash-completion', 'ncurses', 'zlib', 'libcap-ng',=
 'libxcrypt', 'make-native', 'gettext-native', 'unzip-native', 'libassuan-n=
ative', 'libyaml-native', 'gnutls-native', 'libidn2-native', 'nettle-native=
', 'gmp-native', 'libunistring-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function set_image_size
DEBUG: 33883.200000 =3D 26064 * 1.300000
DEBUG: 33883.200000 =3D max(33883.200000, 8192)[33883.200000] + 0
DEBUG: 33884.000000 =3D int(33883.200000)
DEBUG: 33884 =3D aligned(33884)
DEBUG: returning 33884
DEBUG: Python function set_image_size finished
DEBUG: Executing shell function do_image_ubifs
DEBUG: Shell function do_image_ubifs finished
DEBUG: Executing python function create_symlinks
NOTE: Creating symlink: /home/pokybuild/yocto-worker/oe-selftest-fedora/bui=
ld/build-st-3612031/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r=
0/deploy-core-image-minimal-image-complete/core-image-minimal-qemux86-64.ub=
ifs -> core-image-minimal-qemux86-64-20230303191747.rootfs.ubifs
DEBUG: Python function create_symlinks finished

--zhU6dLn+/9mhoiZg--

