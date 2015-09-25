Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1991676E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 18:24:12 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so31994302wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=dXb0l222XjYDfxy05dAuf62ay4XrXt8X9/7DU3rOOB4=;
	b=vxtqekczW7QS6ZDayiVwAP1iY/kA/OfEICIe/1l88URCzxgQ0Otx5gwRUo8rGg4L3X
	f0v5XU1hOLABYfWUL0rHAbY9i100wyAu/UICCInAVxbxNdIB9+QWR2LiFq1jv8IjF1Or
	zg5/WegtVlR0acn3RFoMaGMLTgyn5BvNuGSuHJ/b4Ly4e0yaoF5b4129aaCclmosEaaO
	whLOV5rSM6e0F+UYyc0jcYHhEcKJgCUStymXs3XP2sJ9iCplX4SyO2GpIN7hW1+GmRf5
	G4wF2xFkGWsldSDvTDs2ivPUFP65mehGCj6OcjEZmeysA4xX/A2RwZ1yS7kVbBYrZxP1
	5vbw==
MIME-Version: 1.0
X-Received: by 10.194.5.35 with SMTP id p3mr9193827wjp.132.1443205452216; Fri,
	25 Sep 2015 11:24:12 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Fri, 25 Sep 2015 11:24:12 -0700 (PDT)
In-Reply-To: <1443157157-33969-3-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-3-git-send-email-raj.khem@gmail.com>
Date: Fri, 25 Sep 2015 11:24:12 -0700
Message-ID: <CAJ86T=Uvexcw7kOt6i8L4NwL8jJe9-VBStw2DOT9v9Hw-sd_Rg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pxz: Add recipe and use it for xz image type
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
X-List-Received-Date: Fri, 25 Sep 2015 18:24:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2015 at 9:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> pxz results in significant time saving when generating xz filetypes for
> images due to parallelization support

It looks like the version of xz utils already packaged in oe-core
supports multiple threads via the -T option. See XZ_THREADS in
image_types.bbclass.

> a simple test on ubuntu build host with 16 CPUs
>
> time xz -M 50% -f -k -c -e -9 --check=3Dcrc32 CX041AEI_PROD_default_20150=
610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg.r=
ootfs.cpio.xz
>
> real
> 23m42.299s
> user 23m36.947s
> sys 0m5.101s
>
> time pxz -M 50% -f -k -c -e -9 --check=3Dcrc32 CX041AEI_PROD_default_2015=
0610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg.=
rootfs.cpio.xz
>
> real2m59.666s
> user 24m38.529s
> sys 0m10.056s
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com
> ---
>  meta/classes/image_types.bbclass     |  4 ++--
>  meta/recipes-extended/pxz/pxz_git.bb | 31 ++++++++++++++++++++++++++++++=
+
>  2 files changed, 33 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/pxz/pxz_git.bb
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 306403e..d766cd2 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -233,13 +233,13 @@ COMPRESSIONTYPES =3D "gz bz2 lzma xz lz4 sum"
>  COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>  COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAG=
E_NAME}.rootfs.${type}.gz"
>  COMPRESS_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
> -COMPRESS_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} -=
-check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}=
.rootfs.${type}.xz"
> +COMPRESS_CMD_xz =3D "pxz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} =
--check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME=
}.rootfs.${type}.xz"
>  COMPRESS_CMD_lz4 =3D "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_=
NAME}.rootfs.${type}.lz4"
>  COMPRESS_CMD_sum =3D "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAGE=
_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  COMPRESS_DEPENDS_lzma =3D "xz-native"
>  COMPRESS_DEPENDS_gz =3D ""
>  COMPRESS_DEPENDS_bz2 =3D "pbzip2-native"
> -COMPRESS_DEPENDS_xz =3D "xz-native"
> +COMPRESS_DEPENDS_xz =3D "pxz-native"
>  COMPRESS_DEPENDS_lz4 =3D "lz4-native"
>  COMPRESS_DEPENDS_sum =3D "mtd-utils-native"
>
> diff --git a/meta/recipes-extended/pxz/pxz_git.bb b/meta/recipes-extended=
/pxz/pxz_git.bb
> new file mode 100644
> index 0000000..fe21be6
> --- /dev/null
> +++ b/meta/recipes-extended/pxz/pxz_git.bb
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY =3D "Parallel LZMA compressor compatible with XZ"
> +DESCRIPTION =3D "Parallel XZ is a compression utility that takes advanta=
ge of running LZMA compression of different parts of an input file on multi=
ple cores and processors simultaneously. Its primary goal is to utilize all=
 resources to speed up compression time with minimal possible influence on =
compression ratio"
> +HOMEPAGE =3D "https://jnovy.fedorapeople.org/pxz/"
> +LICENSE =3D "GPL-2.0+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +SECTION =3D "console/utils"
> +DEPENDS =3D "xz"
> +
> +SRCREV =3D "ae808463c2950edfdedb8fb49f95006db0a18667"
> +PV =3D "4.999.9beta+git${SRCPV}"
> +SRC_URI =3D "git://github.com/jnovy/pxz.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> +CFLAGS_append =3D " -fopenmp -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURC=
E"
> +LDFLAGS_append =3D " -llzma"
> +
> +do_compile ()  {
> +       oe_runmake
> +}
> +
> +do_install ()  {
> +       oe_runmake DESTDIR=3D${D} INSTALL=3D"install -p"
> +}
> +
> +deltask do_configure
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.5.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

