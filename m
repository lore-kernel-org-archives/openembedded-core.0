Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21CB176E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 18:34:53 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so114737438pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=cUJoIrT1nxYpu/3IuGASsXvPgUoUH5ghmVYxKNzokO4=;
	b=LVzj9ZTr26vkpjFeyvOR6nQQlvFkHmEKeENv7qC1ENpcJKTb7gMdfF1PSLjTvYa3Rj
	FzGbFnTLvcgWIGcfCM/r6g/siMUldB4ZXpN1rai5DUjGa1CAnQpoJsKlI5mPk2HaSBYV
	QFmbbMOD73HEg3rd40VzwIPDZryhhW1/pELE7L3AZUbz/g2vAQ+LQXAXXbv3nhDUJL4x
	PnwpOB439Xnp8rVM1j7CYsp4vkG5huhsEeoqqO5F7HU30y6E+65gi14vRnOOsqWtjcna
	7ggLS7IplaVbt1+Qjm4gmekcf7ZCTYn14LKBi3vF8uNHxY75mhNlQJO0tqLi23w8cJms
	lcDg==
X-Received: by 10.66.147.38 with SMTP id th6mr9069074pab.94.1443206093910;
	Fri, 25 Sep 2015 11:34:53 -0700 (PDT)
Received: from [172.20.3.197] ([70.35.39.2]) by smtp.gmail.com with ESMTPSA id
	zc4sm5155443pbb.24.2015.09.25.11.34.53
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Sep 2015 11:34:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=Uvexcw7kOt6i8L4NwL8jJe9-VBStw2DOT9v9Hw-sd_Rg@mail.gmail.com>
Date: Fri, 25 Sep 2015 11:34:47 -0700
Message-Id: <92941EA2-AE2B-4F00-8984-8A9982DFEDAB@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-3-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Uvexcw7kOt6i8L4NwL8jJe9-VBStw2DOT9v9Hw-sd_Rg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3094)
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
X-List-Received-Date: Fri, 25 Sep 2015 18:34:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 25, 2015, at 11:24 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Thu, Sep 24, 2015 at 9:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> pxz results in significant time saving when generating xz filetypes =
for
>> images due to parallelization support
>=20
> It looks like the version of xz utils already packaged in oe-core
> supports multiple threads via the -T option. See XZ_THREADS in
> image_types.bbclass.

the option -T is there for long time but does it work ?


>=20
>> a simple test on ubuntu build host with 16 CPUs
>>=20
>> time xz -M 50% -f -k -c -e -9 --check=3Dcrc32 =
CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio =
>CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio.xz
>>=20
>> real
>> 23m42.299s
>> user 23m36.947s
>> sys 0m5.101s
>>=20
>> time pxz -M 50% -f -k -c -e -9 --check=3Dcrc32 =
CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio =
>CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio.xz
>>=20
>> real2m59.666s
>> user 24m38.529s
>> sys 0m10.056s
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com
>> ---
>> meta/classes/image_types.bbclass     |  4 ++--
>> meta/recipes-extended/pxz/pxz_git.bb | 31 =
+++++++++++++++++++++++++++++++
>> 2 files changed, 33 insertions(+), 2 deletions(-)
>> create mode 100644 meta/recipes-extended/pxz/pxz_git.bb
>>=20
>> diff --git a/meta/classes/image_types.bbclass =
b/meta/classes/image_types.bbclass
>> index 306403e..d766cd2 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -233,13 +233,13 @@ COMPRESSIONTYPES =3D "gz bz2 lzma xz lz4 sum"
>> COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>> COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > =
${IMAGE_NAME}.rootfs.${type}.gz"
>> COMPRESS_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
>> -COMPRESS_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} =
${XZ_THREADS} --check=3D${XZ_INTEGRITY_CHECK} =
${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
>> +COMPRESS_CMD_xz =3D "pxz -f -k -c ${XZ_COMPRESSION_LEVEL} =
${XZ_THREADS} --check=3D${XZ_INTEGRITY_CHECK} =
${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
>> COMPRESS_CMD_lz4 =3D "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > =
${IMAGE_NAME}.rootfs.${type}.lz4"
>> COMPRESS_CMD_sum =3D "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o =
${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>> COMPRESS_DEPENDS_lzma =3D "xz-native"
>> COMPRESS_DEPENDS_gz =3D ""
>> COMPRESS_DEPENDS_bz2 =3D "pbzip2-native"
>> -COMPRESS_DEPENDS_xz =3D "xz-native"
>> +COMPRESS_DEPENDS_xz =3D "pxz-native"
>> COMPRESS_DEPENDS_lz4 =3D "lz4-native"
>> COMPRESS_DEPENDS_sum =3D "mtd-utils-native"
>>=20
>> diff --git a/meta/recipes-extended/pxz/pxz_git.bb =
b/meta/recipes-extended/pxz/pxz_git.bb
>> new file mode 100644
>> index 0000000..fe21be6
>> --- /dev/null
>> +++ b/meta/recipes-extended/pxz/pxz_git.bb
>> @@ -0,0 +1,31 @@
>> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +SUMMARY =3D "Parallel LZMA compressor compatible with XZ"
>> +DESCRIPTION =3D "Parallel XZ is a compression utility that takes =
advantage of running LZMA compression of different parts of an input =
file on multiple cores and processors simultaneously. Its primary goal =
is to utilize all resources to speed up compression time with minimal =
possible influence on compression ratio"
>> +HOMEPAGE =3D "https://jnovy.fedorapeople.org/pxz/"
>> +LICENSE =3D "GPL-2.0+"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>> +SECTION =3D "console/utils"
>> +DEPENDS =3D "xz"
>> +
>> +SRCREV =3D "ae808463c2950edfdedb8fb49f95006db0a18667"
>> +PV =3D "4.999.9beta+git${SRCPV}"
>> +SRC_URI =3D "git://github.com/jnovy/pxz.git"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +CFLAGS_append =3D " -fopenmp -D_FILE_OFFSET_BITS=3D64 =
-D_LARGEFILE_SOURCE"
>> +LDFLAGS_append =3D " -llzma"
>> +
>> +do_compile ()  {
>> +       oe_runmake
>> +}
>> +
>> +do_install ()  {
>> +       oe_runmake DESTDIR=3D${D} INSTALL=3D"install -p"
>> +}
>> +
>> +deltask do_configure
>> +
>> +BBCLASSEXTEND =3D "native"
>> --
>> 2.5.3
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


