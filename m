Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id B10F676DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 13:25:19 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so106094603pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=XkYemo843TT/7sU7QzXWCjoHDnIGNy/610GRDiAHSpg=;
	b=QpTdD9bJrWVNNqXe9NXwQC7gnp5N7LQVLUx7sgsifFBcJWzZUKjyJp8pzbthEQseJz
	3niFb7ZrTAxjtugugwznY4wyHFd10988GHJHKXZlrMnFTROMDPqt3/1+cRIGVbxo+kNl
	pfy7U20qKT9Vcmd0SeTwbLW99DRvuw9ppa1ehtxSGU7hAGl+aUPAeYdxpqlp7QCXPaSf
	Zt3GFkt2vY/OOuDI5tlwI0BIumrfSBa9WX7sIoe5YwKn2q0SDBtB0RmoE2GAZFUNK2Xh
	IF8WXjbWcuGzzlOciAmtOTm2T4OdmxU8VuGveL7RCMPo+rGeWCUjV5hBTUGET5OduykI
	AAmg==
X-Received: by 10.68.111.165 with SMTP id ij5mr7134447pbb.59.1443187519784;
	Fri, 25 Sep 2015 06:25:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f528:4cd4:4cc7:b7b2?
	([2601:646:8601:4580:f528:4cd4:4cc7:b7b2])
	by smtp.gmail.com with ESMTPSA id u3sm4046816pbs.33.2015.09.25.06.25.18
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Sep 2015 06:25:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56052E6D.30305@mlbassoc.com>
Date: Fri, 25 Sep 2015 06:25:17 -0700
Message-Id: <3BE8BEDD-0107-4FCF-B9E4-75EFEF37504E@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-3-git-send-email-raj.khem@gmail.com>
	<56052E6D.30305@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 25 Sep 2015 13:25:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 25, 2015, at 4:22 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>=20
> On 2015-09-24 22:59, Khem Raj wrote:
>> pxz results in significant time saving when generating xz filetypes =
for
>> images due to parallelization support
>=20
> This adds another host tool dependency - on my Ubuntu (14.04) system, =
even
> if 'xz' is installed, 'pxz' is not and I'd have to add it.  Since *.xz =
seems
> to be the new fashion/trend, perhaps this choice might be =
optional/configurable?

I provided pxz recipe as well.. so I don=E2=80=99t get it where is host =
tool dep.

>=20
>>=20
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
>>  meta/classes/image_types.bbclass     |  4 ++--
>>  meta/recipes-extended/pxz/pxz_git.bb | 31 =
+++++++++++++++++++++++++++++++
>>  2 files changed, 33 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-extended/pxz/pxz_git.bb
>>=20
>> diff --git a/meta/classes/image_types.bbclass =
b/meta/classes/image_types.bbclass
>> index 306403e..d766cd2 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -233,13 +233,13 @@ COMPRESSIONTYPES =3D "gz bz2 lzma xz lz4 sum"
>>  COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>>  COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > =
${IMAGE_NAME}.rootfs.${type}.gz"
>>  COMPRESS_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
>> -COMPRESS_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} =
${XZ_THREADS} --check=3D${XZ_INTEGRITY_CHECK} =
${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
>> +COMPRESS_CMD_xz =3D "pxz -f -k -c ${XZ_COMPRESSION_LEVEL} =
${XZ_THREADS} --check=3D${XZ_INTEGRITY_CHECK} =
${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
>>  COMPRESS_CMD_lz4 =3D "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > =
${IMAGE_NAME}.rootfs.${type}.lz4"
>>  COMPRESS_CMD_sum =3D "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o =
${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>>  COMPRESS_DEPENDS_lzma =3D "xz-native"
>>  COMPRESS_DEPENDS_gz =3D ""
>>  COMPRESS_DEPENDS_bz2 =3D "pbzip2-native"
>> -COMPRESS_DEPENDS_xz =3D "xz-native"
>> +COMPRESS_DEPENDS_xz =3D "pxz-native"
>>  COMPRESS_DEPENDS_lz4 =3D "lz4-native"
>>  COMPRESS_DEPENDS_sum =3D "mtd-utils-native"
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
>> +	oe_runmake
>> +}
>> +
>> +do_install ()  {
>> +	oe_runmake DESTDIR=3D${D} INSTALL=3D"install -p"
>> +}
>> +
>> +deltask do_configure
>> +
>> +BBCLASSEXTEND =3D "native"
>>=20
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


