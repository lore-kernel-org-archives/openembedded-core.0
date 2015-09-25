Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6ADE376E04
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 20:18:28 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so36315403wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=TwjPfHoxkg13I+5HYfQkaJX4dXm4MPQ0JhgMOdWWVWc=;
	b=Ye8Cg7L+GOHZh45rGhICqbAX2AHSgX39BIb9+bErtcaK6ePdLNS3xzY1CaETi35EWk
	WnKLETAbW8DOQTbHxlASWSxmZczarb7/5Pm1O9icZ3+HP5t8oQIIVs30AKwF3V4UenoL
	CXWT8pa3qZtobJJu5qMs5SleTWSmeCh2UE03y6beAFBgtgMZAArcfKETFVLr71uh8Ib3
	K2fjk3Rndftev0tyh4qUmGXGHkl6KFX0XLi4Yrsla7nCHgQ6tF5Myga0pagZn9/lE37o
	yp31RwkVOP1zL2pavJw/W1Ia2xhA5Iu0Opecy/xK+e1x2EI0mt99XEv+LsFHpYRxQ2Pb
	0XLA==
MIME-Version: 1.0
X-Received: by 10.194.47.161 with SMTP id e1mr9315023wjn.1.1443212308725; Fri,
	25 Sep 2015 13:18:28 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Fri, 25 Sep 2015 13:18:28 -0700 (PDT)
In-Reply-To: <92941EA2-AE2B-4F00-8984-8A9982DFEDAB@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-3-git-send-email-raj.khem@gmail.com>
	<CAJ86T=Uvexcw7kOt6i8L4NwL8jJe9-VBStw2DOT9v9Hw-sd_Rg@mail.gmail.com>
	<92941EA2-AE2B-4F00-8984-8A9982DFEDAB@gmail.com>
Date: Fri, 25 Sep 2015 13:18:28 -0700
Message-ID: <CAJ86T=Xc60w6U1WH5DQVog-rFQTj44O3=1LowTTQgRf+t-Gk9g@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 Sep 2015 20:18:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2015 at 11:34 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 25, 2015, at 11:24 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Sep 24, 2015 at 9:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> pxz results in significant time saving when generating xz filetypes for
>>> images due to parallelization support
>>
>> It looks like the version of xz utils already packaged in oe-core
>> supports multiple threads via the -T option. See XZ_THREADS in
>> image_types.bbclass.
>
> the option -T is there for long time but does it work ?

I don't know. The -T option isn't supported by the version of xz
packaged in Ubuntu 14.04, so maybe it has issues (oe-core commit
cfd201ec suggests that xz -T 0 can use a lot of memory).

pxz just looks like a simple wrapper on top of liblzma though, so I'd
be surprised if it worked fundamentally better than xz.

How much memory did your pxz test use? From the pxz source it looks
like the -M option to limit memory usage is accepted but ignored...


>>> a simple test on ubuntu build host with 16 CPUs
>>>
>>> time xz -M 50% -f -k -c -e -9 --check=3Dcrc32 CX041AEI_PROD_default_201=
50610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg=
.rootfs.cpio.xz
>>>
>>> real
>>> 23m42.299s
>>> user 23m36.947s
>>> sys 0m5.101s
>>>
>>> time pxz -M 50% -f -k -c -e -9 --check=3Dcrc32 CX041AEI_PROD_default_20=
150610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-db=
g.rootfs.cpio.xz
>>>
>>> real2m59.666s
>>> user 24m38.529s
>>> sys 0m10.056s
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com
>>> ---
>>> meta/classes/image_types.bbclass     |  4 ++--
>>> meta/recipes-extended/pxz/pxz_git.bb | 31 +++++++++++++++++++++++++++++=
++
>>> 2 files changed, 33 insertions(+), 2 deletions(-)
>>> create mode 100644 meta/recipes-extended/pxz/pxz_git.bb
>>>
>>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_type=
s.bbclass
>>> index 306403e..d766cd2 100644
>>> --- a/meta/classes/image_types.bbclass
>>> +++ b/meta/classes/image_types.bbclass
>>> @@ -233,13 +233,13 @@ COMPRESSIONTYPES =3D "gz bz2 lzma xz lz4 sum"
>>> COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>>> COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMA=
GE_NAME}.rootfs.${type}.gz"
>>> COMPRESS_CMD_bz2 =3D "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
>>> -COMPRESS_CMD_xz =3D "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS}=
 --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAM=
E}.rootfs.${type}.xz"
>>> +COMPRESS_CMD_xz =3D "pxz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS=
} --check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NA=
ME}.rootfs.${type}.xz"
>>> COMPRESS_CMD_lz4 =3D "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE=
_NAME}.rootfs.${type}.lz4"
>>> COMPRESS_CMD_sum =3D "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAG=
E_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>>> COMPRESS_DEPENDS_lzma =3D "xz-native"
>>> COMPRESS_DEPENDS_gz =3D ""
>>> COMPRESS_DEPENDS_bz2 =3D "pbzip2-native"
>>> -COMPRESS_DEPENDS_xz =3D "xz-native"
>>> +COMPRESS_DEPENDS_xz =3D "pxz-native"
>>> COMPRESS_DEPENDS_lz4 =3D "lz4-native"
>>> COMPRESS_DEPENDS_sum =3D "mtd-utils-native"
>>>
>>> diff --git a/meta/recipes-extended/pxz/pxz_git.bb b/meta/recipes-extend=
ed/pxz/pxz_git.bb
>>> new file mode 100644
>>> index 0000000..fe21be6
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/pxz/pxz_git.bb
>>> @@ -0,0 +1,31 @@
>>> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
>>> +# Released under the MIT license (see COPYING.MIT for the terms)
>>> +
>>> +SUMMARY =3D "Parallel LZMA compressor compatible with XZ"
>>> +DESCRIPTION =3D "Parallel XZ is a compression utility that takes advan=
tage of running LZMA compression of different parts of an input file on mul=
tiple cores and processors simultaneously. Its primary goal is to utilize a=
ll resources to speed up compression time with minimal possible influence o=
n compression ratio"
>>> +HOMEPAGE =3D "https://jnovy.fedorapeople.org/pxz/"
>>> +LICENSE =3D "GPL-2.0+"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
>>> +SECTION =3D "console/utils"
>>> +DEPENDS =3D "xz"
>>> +
>>> +SRCREV =3D "ae808463c2950edfdedb8fb49f95006db0a18667"
>>> +PV =3D "4.999.9beta+git${SRCPV}"
>>> +SRC_URI =3D "git://github.com/jnovy/pxz.git"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +CFLAGS_append =3D " -fopenmp -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOU=
RCE"
>>> +LDFLAGS_append =3D " -llzma"
>>> +
>>> +do_compile ()  {
>>> +       oe_runmake
>>> +}
>>> +
>>> +do_install ()  {
>>> +       oe_runmake DESTDIR=3D${D} INSTALL=3D"install -p"
>>> +}
>>> +
>>> +deltask do_configure
>>> +
>>> +BBCLASSEXTEND =3D "native"
>>> --
>>> 2.5.3
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

