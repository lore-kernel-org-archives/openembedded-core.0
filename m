Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8F58277022
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 11:22:18 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C6BF2F811DE; Fri, 25 Sep 2015 05:22:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A9F69F811DE;
	Fri, 25 Sep 2015 05:22:17 -0600 (MDT)
To: openembedded-core@lists.openembedded.org
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<1443157157-33969-3-git-send-email-raj.khem@gmail.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <56052E6D.30305@mlbassoc.com>
Date: Fri, 25 Sep 2015 05:22:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443157157-33969-3-git-send-email-raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 25 Sep 2015 11:22:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-09-24 22:59, Khem Raj wrote:
> pxz results in significant time saving when generating xz filetypes for
> images due to parallelization support

This adds another host tool dependency - on my Ubuntu (14.04) system, even
if 'xz' is installed, 'pxz' is not and I'd have to add it.  Since *.xz seems
to be the new fashion/trend, perhaps this choice might be optional/configurable?

>
> a simple test on ubuntu build host with 16 CPUs
>
> time xz -M 50% -f -k -c -e -9 --check=crc32 CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio.xz
>
> real
> 23m42.299s
> user 23m36.947s
> sys 0m5.101s
>
> time pxz -M 50% -f -k -c -e -9 --check=crc32 CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio.xz
>
> real2m59.666s
> user 24m38.529s
> sys 0m10.056s
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com
> ---
>   meta/classes/image_types.bbclass     |  4 ++--
>   meta/recipes-extended/pxz/pxz_git.bb | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/pxz/pxz_git.bb
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 306403e..d766cd2 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -233,13 +233,13 @@ COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
>   COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
>   COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
>   COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
> -COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
> +COMPRESS_CMD_xz = "pxz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
>   COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.lz4"
>   COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>   COMPRESS_DEPENDS_lzma = "xz-native"
>   COMPRESS_DEPENDS_gz = ""
>   COMPRESS_DEPENDS_bz2 = "pbzip2-native"
> -COMPRESS_DEPENDS_xz = "xz-native"
> +COMPRESS_DEPENDS_xz = "pxz-native"
>   COMPRESS_DEPENDS_lz4 = "lz4-native"
>   COMPRESS_DEPENDS_sum = "mtd-utils-native"
>
> diff --git a/meta/recipes-extended/pxz/pxz_git.bb b/meta/recipes-extended/pxz/pxz_git.bb
> new file mode 100644
> index 0000000..fe21be6
> --- /dev/null
> +++ b/meta/recipes-extended/pxz/pxz_git.bb
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "Parallel LZMA compressor compatible with XZ"
> +DESCRIPTION = "Parallel XZ is a compression utility that takes advantage of running LZMA compression of different parts of an input file on multiple cores and processors simultaneously. Its primary goal is to utilize all resources to speed up compression time with minimal possible influence on compression ratio"
> +HOMEPAGE = "https://jnovy.fedorapeople.org/pxz/"
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +SECTION = "console/utils"
> +DEPENDS = "xz"
> +
> +SRCREV = "ae808463c2950edfdedb8fb49f95006db0a18667"
> +PV = "4.999.9beta+git${SRCPV}"
> +SRC_URI = "git://github.com/jnovy/pxz.git"
> +
> +S = "${WORKDIR}/git"
> +
> +CFLAGS_append = " -fopenmp -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
> +LDFLAGS_append = " -llzma"
> +
> +do_compile ()  {
> +	oe_runmake
> +}
> +
> +do_install ()  {
> +	oe_runmake DESTDIR=${D} INSTALL="install -p"
> +}
> +
> +deltask do_configure
> +
> +BBCLASSEXTEND = "native"
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

