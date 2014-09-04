Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8050671347
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 14:33:11 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so13683940pdi.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Sep 2014 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=W5BrNzycC1XYdB2qSkXUvwAmf/HOGN7ISqNWH0lnTss=;
	b=f7UxkroBKC9Emu1L19E08qBxF6os76XibxabxAGzJJ3kKXWo/reJe3lDM+THht6suh
	kgdBAeoj5V4bOAc4QkIwcU4ghgz6xRXH5cBTvaLKVT89vpVZCsoKXj0afPW8vMtatnAR
	imTX99DYzP1A6g+kRTR3k/sYrYR3q05jocNbBmWpg/7GkuaIvJXQK8s/K51pYTI4G5M+
	WO16+gi3wOAu+J/qNsQfLuxtGeHhNvOmBAYqZhKl2F2wd9rhV/x6mW3BUxxU+hKLHSdF
	FQW+GybQIc2pFyYEn4ujJ1aBOqGiAMFIevN9XvyOhT46X3U4MZRc0yoG/RRNraxxkYdb
	b4aA==
X-Received: by 10.66.66.193 with SMTP id h1mr4975831pat.93.1409841189029;
	Thu, 04 Sep 2014 07:33:09 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id ig4sm1850826pbb.55.2014.09.04.07.33.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Sep 2014 07:33:08 -0700 (PDT)
Message-ID: <5408781E.3070708@gmail.com>
Date: Fri, 05 Sep 2014 00:33:02 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Dan McGregor <danismostlikely@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>
In-Reply-To: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] gcc-runtime: enable asan and tsan
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
X-List-Received-Date: Thu, 04 Sep 2014 14:33:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 30/08/2014 7:15 AM, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> ASan and TSan are useful debugging tools, enable them on the
> target and add the packages to packagegroup-core-sdk.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>   .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  4 +++-
>   meta/recipes-devtools/gcc/gcc-runtime.inc               | 17 +++++++++++++++++
>   2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index a544bbd..378336e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -28,7 +28,9 @@ RDEPENDS_packagegroup-core-sdk = "\
>
>   RRECOMMENDS_packagegroup-core-sdk = "\
>       libgomp \
> -    libgomp-dev"
> +    libgomp-dev \
> +    libsanitizer \
> +    libsanitizer-dev"
>
>   #python generate_sdk_pkgs () {
>   #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 7ce84f1..109f8dd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS = "\
>   EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
>   RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
> +RUNTIMETARGET_append_arm = " libsanitizer"
> +RUNTIMETARGET_append_x86 = " libsanitizer"
>   #  ?
>   # libiberty
>   # libmudflap
> @@ -88,6 +90,9 @@ PACKAGES = "\
>       libatomic \
>       libatomic-dev \
>       libatomic-staticdev \
> +    libsanitizer \
> +    libsanitizer-dev \
> +    libsanitizer-staticdev \
>   "
>   # The base package doesn't exist, so we clear the recommends.
>   RRECOMMENDS_${PN}-dbg = ""
> @@ -171,6 +176,18 @@ FILES_libatomic-dev = "\
>   "
>   FILES_libatomic-staticdev = "${libdir}/libatomic.a"
>
> +FILES_libsanitizer = "${libdir}/libasan.so.* ${libdir}/libubsan.so.*"
> +FILES_libsanitizer-dev = " \
> +  ${libdir}/libsanitizer.spec \
> +  ${libdir}/libasan_preinit.o \
> +  ${libdir}/libasan.so \
> +  ${libdir}/libubsan.so \
> +  ${libdir}/libasan.la \
> +  ${libdir}/libubsan.la"
> +FILES_libsanitizer-staticdev = " \
> +  ${libdir}/libasan.a \
> +  ${libdir}/libubsan.a"
> +
>   do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>   do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>   do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
I get the following error during do_install for gcc-runtime on Arch 
Linux x86_64 host when it is linking libasan:
/usr/lib/libpthread.a: error adding symbols: File format not recognized

Regards,
Jonathan

