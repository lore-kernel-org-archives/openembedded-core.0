Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8626770703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 21:20:56 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so3102910qcx.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=M7l7Y7OPTYprfECDJZyELQ3AT1ax3/yklePXBKWxsN0=;
	b=SGDzEWWdaJ8qZaShg8QvgjJO5VGZWzIVAZk7/dYIoAuhH5WfYz31szr3CkFMANIB0B
	wjitr2M8MOHtK67myY3Vyr2C2Ky9Zc2jTw2LnJgCmSx9LhjFE+Wa7+/RmsQeUuvzRXjs
	x1+gcpRs0OUvyNma0bIcHxWEachVEGGxjNi15+eLo0MI7T2Tjusso8U5enV/PKjfWEoX
	SWi//CHB5xl2KzEyclVPPVU6jv7OJRV6Ec0wHNWodjmLz/jSdHHxHvEoExAnwrKiA5iq
	70pUFSc4gMuaiS17HxZ572jp36L+a1Kfqpp987Y95HtZrvCohiIUDOpfKNOK7+63bNra
	E9jQ==
MIME-Version: 1.0
X-Received: by 10.224.134.202 with SMTP id k10mr22281476qat.19.1409347258172; 
	Fri, 29 Aug 2014 14:20:58 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Fri, 29 Aug 2014 14:20:58 -0700 (PDT)
In-Reply-To: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>
References: <CACS+7ZS3J37=hLKBTfs7GvEEcXmVU1RPr_Ryvty2BawoBw+BVQ@mail.gmail.com>
Date: Fri, 29 Aug 2014 15:20:58 -0600
Message-ID: <CACS+7ZQeu-6MPE9fuKAGnzAJeo+qAET-R2eFw5yD7_ooZca6Rg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 29 Aug 2014 21:20:59 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2014 15:15, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> ASan and TSan are useful debugging tools, enable them on the
> target and add the packages to packagegroup-core-sdk.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  4 +++-
>  meta/recipes-devtools/gcc/gcc-runtime.inc               | 17 +++++++++++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index a544bbd..378336e 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -28,7 +28,9 @@ RDEPENDS_packagegroup-core-sdk = "\
>
>  RRECOMMENDS_packagegroup-core-sdk = "\
>      libgomp \
> -    libgomp-dev"
> +    libgomp-dev \
> +    libsanitizer \
> +    libsanitizer-dev"
>
>  #python generate_sdk_pkgs () {
>  #    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 7ce84f1..109f8dd 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -11,6 +11,8 @@ EXTRA_OECONF_PATHS = "\
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
>  RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
> +RUNTIMETARGET_append_arm = " libsanitizer"
> +RUNTIMETARGET_append_x86 = " libsanitizer"
>  #  ?
>  # libiberty
>  # libmudflap
> @@ -88,6 +90,9 @@ PACKAGES = "\
>      libatomic \
>      libatomic-dev \
>      libatomic-staticdev \
> +    libsanitizer \
> +    libsanitizer-dev \
> +    libsanitizer-staticdev \
>  "
>  # The base package doesn't exist, so we clear the recommends.
>  RRECOMMENDS_${PN}-dbg = ""
> @@ -171,6 +176,18 @@ FILES_libatomic-dev = "\
>  "
>  FILES_libatomic-staticdev = "${libdir}/libatomic.a"
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
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 1.9.3


Gah. It works for x86_64 too, so RUNTTIMETARGET there should also have
libsanitizer

