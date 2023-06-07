Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580A2C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 12:30:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7189.1686141039622901827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 05:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CEAJjdUU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686141037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZLgdOGnsJREK6EZhWxclUjphAfm3tUJIbRB3gkITNs=;
	b=CEAJjdUU+62tRUQTiMde6Y0dUi5DDqcTDnto4ZE9P4BM4IuVbRloXnPmRalaC6fh2Fv0mN
	FRxWZ0nGeJr1Ctobj7yiQm7WzZxsvW21nT5NRfIrr2MtQtZDoM+Ajplqcuysrj99a2+rS+
	Y2DSkbXJxrPpz9JFyZ7E1sklKP8pvd4+eaFS9JyGCvSXYrMV/RCA1SLd44fqJ0Q1JNwP7e
	zKoZOigwOuBmtvXzWK0Xq7ZLJzkO9vcFjhL2iWtUJwoeypwSzYjZuQLR33hN+r1b93aJwZ
	56BHahzsqb1eSJkcgvHOUW4BzuSwiAxl83bE2F/QLulcuX0sP+jdFSAZvJBABw==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AB0B120017;
	Wed,  7 Jun 2023 12:30:36 +0000 (UTC)
Date: Wed, 7 Jun 2023 14:30:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: charles-antoine.couret@mind.be
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] image_types: use IMAGE_FILE_MAXSIZE
 variable for ext2/3/4 image types
Message-ID: <2023060712303663116f56@mail.local>
References: <20230604123755.2541295-1-charles-antoine.couret@mind.be>
 <20230604123755.2541295-2-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230604123755.2541295-2-charles-antoine.couret@mind.be>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 12:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182474

This fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/7219/step=
s/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/2859/ste=
ps/14/logs/stdio

ERROR: core-image-minimal-1.0-r0 do_image_ext4: ExecutionError('/home/pokyb=
uild/yocto-worker/qa-extras/build/build/tmp/work/qemux86_64-poky-linux/core=
-image-minimal/1.0-r0/temp/run.do_image_ext4.266360', 2, None, None)
NOTE: recipe core-image-minimal-1.0-r0: task do_image_tar: Succeeded
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/qa-extras=
/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/=
log.do_image_ext4.266360
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/qa-extras/bu=
ild/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_populate_sysr=
oot', '/home/pokybuild/yocto-worker/qa-extras/build/meta/recipes-core/glibc=
/ldconfig-native_2.12.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-wor=
ker/qa-extras/build/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_=
populate_sysroot', '/home/pokybuild/yocto-worker/qa-extras/build/meta/recip=
es-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot', 'virtual:na=
tive:/home/pokybuild/yocto-worker/qa-extras/build/meta/recipes-core/update-=
rc.d/update-rc.d_0.8.bb:do_populate_sysroot', 'virtual:native:/home/pokybui=
ld/yocto-worker/qa-extras/build/meta/recipes-devtools/createrepo-c/createre=
po-c_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-=
worker/qa-extras/build/meta/recipes-devtools/dnf/dnf_4.14.0.bb:do_populate_=
sysroot', 'virtual:native:/home/pokybuild/yocto-worker/qa-extras/build/meta=
/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot', 'virt=
ual:native:/home/pokybuild/yocto-worker/qa-extras/build/meta/recipes-devtoo=
ls/makedevs/makedevs_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/p=
okybuild/yocto-worker/qa-extras/build/meta/recipes-devtools/opkg-utils/opkg=
-utils_0.5.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto=
-worker/qa-extras/build/meta/recipes-devtools/opkg/opkg_0.6.1.bb:do_populat=
e_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/qa-extras/build/me=
ta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:nat=
ive:/home/pokybuild/yocto-worker/qa-extras/build/meta/recipes-devtools/rpm/=
rpm_4.18.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-w=
orker/qa-extras/build/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb:do_popu=
late_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/qa-extras/build=
/meta/recipes-extended/pigz/pigz_2.7.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: ['e2fsprogs-native']
| NOTE: Skipping as already exists in sysroot: ['cross-localedef-native', '=
ldconfig-native', 'qemuwrapper-cross', 'depmodwrapper-cross', 'update-rc.d-=
native', 'createrepo-c-native', 'dnf-native', 'makedevs-native', 'opkg-util=
s-native', 'opkg-native', 'pseudo-native', 'rpm-native', 'pbzip2-native', '=
pigz-native', 'librepo-native', 'libcomps-native', 'gettext-minimal-native'=
, 'python3-native', 'python3-iniparse-native', 'libdnf-native', 'cmake-nati=
ve', 'kmod-native', 'openssl-native', 'debianutils-native', 'libtool-native=
', 'attr-native', 'util-linux-native', 'texinfo-dummy-native', 'bzip2-nativ=
e', 'sqlite3-native', 'file-native', 'xz-native', 'zstd-native', 'popt-nati=
ve', 'lua-native', 'elfutils-native', 'libgcrypt-native', 'qemu-native', 'z=
lib-native', 'libxml2-native', 'expat-native', 'curl-native', 'glib-2.0-nat=
ive', 'perl-native', 'shadow-native', 'libarchive-native', 'libsolv-native'=
, 'gpgme-native', 'libffi-native', 'libtirpc-native', 'libedit-native', 'nc=
urses-native', 'util-linux-libuuid-native', 'libnsl2-native', 'gdbm-native'=
, 'python3-wheel-native', 'python3-six-native', 'python3-build-native', 'py=
thon3-installer-native', 'python3-setuptools-native', 'libcheck-native', 'g=
object-introspection-native', 'json-c-native', 'swig-native', 'libmodulemd-=
native', 'libpcre2-native', 'libcap-ng-native', 'readline-native', 'libmicr=
ohttpd-native', 'libgpg-error-native', 'libcap-native', 'gettext-native', '=
make-native', 'libassuan-native', 'python3-flit-core-native', 'python3-pypr=
oject-hooks-native', 'python3-packaging-native', 'flex-native', 'libyaml-na=
tive', 'gnutls-native', 'unzip-native', 'm4-native', 'libtasn1-native', 'gm=
p-native', 'libidn2-native', 'libunistring-native', 'nettle-native', 'gnu-c=
onfig-native']
| DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/qa-extras/build/bui=
ld/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-=
native/:g' /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/sysroots-=
components/x86_64/e2fsprogs-native/fixmepath | xargs sed -i -e 's:FIXMESTAG=
INGDIRTARGET:/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/qe=
mux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot:g; s:FIXMESTAG=
INGDIRHOST:/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/qemu=
x86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native:g' -e 's:=
FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/qa-extras/build/build/tmp=
/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOSTTOOLS_DIR:/hom=
e/pokybuild/yocto-worker/qa-extras/build/build/tmp/hosttools:g' -e 's:FIXME=
_PKGDATA_DIR:/home/pokybuild/yocto-worker/qa-extras/build/build/tmp/pkgdata=
/qemux86-64:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-worke=
r/qa-extras/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1=
=2E0-r0/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yocto-worker/qa-extr=
as/build/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/tem=
p/fifo.266360:g'
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 33737.600000 =3D 25952 * 1.300000
| DEBUG: 33737.600000 =3D max(33737.600000, 8192)[33737.600000] + 0
| DEBUG: 33738.000000 =3D int(33737.600000)
| DEBUG: 33738 =3D aligned(33738)
| DEBUG: returning 33738
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_ext4
| /home/pokybuild/yocto-worker/qa-extras/build/build/tmp/work/qemux86_64-po=
ky-linux/core-image-minimal/1.0-r0/temp/run.do_image_ext4.266360: 151: Bad =
substitution
| WARNING: exit code 2 from a shell command.
NOTE: recipe core-image-minimal-1.0-r0: task do_image_ext4: Failed

On 04/06/2023 14:37:53+0200, Charles-Antoine Couret via lists.openembedded.=
org wrote:
> If defined, this variable value overrides the size of ext* partition file=
 created by mkfs.
> Otherwise previous logic based on ROOTFS_SIZE variable is used.
>=20
> It should be set when the final file size would not be above a specific v=
alue due to fixed
> partitionning for example.
>=20
> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
> ---
>  meta/classes-recipe/image_types.bbclass | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index e4939af459..cebbb61545 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -68,24 +68,33 @@ IMAGE_CMD:cramfs =3D "mkfs.cramfs ${IMAGE_ROOTFS} ${I=
MGDEPLOYDIR}/${IMAGE_NAME}${I
> =20
>  oe_mkext234fs () {
>  	fstype=3D$1
> +	image_file_maxsize=3D$2
>  	extra_imagecmd=3D""
> +	rootfs_file_size=3D$ROOTFS_SIZE
> =20
> -	if [ $# -gt 1 ]; then
> -		shift
> +	if [ $# -gt 2 ]; then
> +		shift 2
>  		extra_imagecmd=3D$@
>  	fi
> =20
> +
> +	if [[ "${image_file_maxsize}" !=3D "\"\"" ]]; then
> +		# Remove quotes to get numbers only
> +		rootfs_file_size=3D$(echo "${image_file_maxsize}" | tr -d '"')
> +	fi
> +
>  	# If generating an empty image the size of the sparse block should be l=
arge
>  	# enough to allocate an ext4 filesystem using 4096 bytes per inode, thi=
s is
>  	# about 60K, so dd needs a minimum count of 60, with bs=3D1024 (bytes p=
er IO)
>  	eval local COUNT=3D\"0\"
>  	eval local MIN_COUNT=3D\"60\"
> -	if [ $ROOTFS_SIZE -lt $MIN_COUNT ]; then
> +	if [ $rootfs_file_size -lt $MIN_COUNT ]; then
>  		eval COUNT=3D\"$MIN_COUNT\"
>  	fi
> +
>  	# Create a sparse image block
> -	bbdebug 1 Executing "dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAM=
E}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024"
> -	dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024
> +	bbdebug 1 Executing "dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAM=
E}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$rootfs_file_size count=3D$COUNT bs=
=3D1024"
> +	dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX=
}.$fstype seek=3D$rootfs_file_size count=3D$COUNT bs=3D1024
>  	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
>  	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE=
_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
>  	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${=
IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
> @@ -94,9 +103,9 @@ oe_mkext234fs () {
>  	fsck.$fstype -pvfD ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$f=
stype || [ $? -le 3 ]
>  }
> =20
> -IMAGE_CMD:ext2 =3D "oe_mkext234fs ext2 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD:ext3 =3D "oe_mkext234fs ext3 ${EXTRA_IMAGECMD}"
> -IMAGE_CMD:ext4 =3D "oe_mkext234fs ext4 ${EXTRA_IMAGECMD}"
> +IMAGE_CMD:ext2 =3D "oe_mkext234fs ext2 \"${IMAGE_FILE_MAXSIZE:ext2}\" ${=
EXTRA_IMAGECMD}"
> +IMAGE_CMD:ext3 =3D "oe_mkext234fs ext3 \"${IMAGE_FILE_MAXSIZE:ext3}\" ${=
EXTRA_IMAGECMD}"
> +IMAGE_CMD:ext4 =3D "oe_mkext234fs ext4 \"${IMAGE_FILE_MAXSIZE:ext4}\" ${=
EXTRA_IMAGECMD}"
> =20
>  MIN_BTRFS_SIZE ?=3D "16384"
>  IMAGE_CMD:btrfs () {
> --=20
> 2.40.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182360): https://lists.openembedded.org/g/openembedde=
d-core/message/182360
> Mute This Topic: https://lists.openembedded.org/mt/99320004/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

