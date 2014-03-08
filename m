Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id BAF7F6EF9F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Mar 2014 00:13:57 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id uq10so3789429igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 16:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=232W+8K6dNii/RzujSsopjTnq4d6MP5noZHPMgejJ9s=;
	b=gmTGCrjbeucl4bHu1yHwQ3mcHOHmV3caMpi8rkfq/+KaEjhJZYO8jGar6T9HIRENCT
	qJutZse5fk4Il+6BDit392B3qFm7PoCUFSsdR0BhuZQ7gH5tpl8Mqu8DL1y897aAeVf1
	wgVrV/Emeeo+I0nfanwzCleEu+eLAG/+rfcTBR+XkWWqr4KeIm7YIarBfdQ2E1zQTjz6
	4ZhVqLKmZqzIxAF8fj7oTQpQH6Z2gTASyOugaaBl8Av5kBazxS41lxNxCAqJLjy7C//x
	nXB0bCQ+G6o6rkCRWuGsWS7ZKjXUXntcrVAqnrGmOxn7mPFdpAyXUQE4J+W37fHs97ru
	M1tg==
X-Received: by 10.50.60.103 with SMTP id g7mr6173699igr.20.1394237638708; Fri,
	07 Mar 2014 16:13:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 7 Mar 2014 16:13:28 -0800 (PST)
In-Reply-To: <1394199544-19668-1-git-send-email-cosmin.paraschiv@freescale.com>
References: <1394199544-19668-1-git-send-email-cosmin.paraschiv@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Mar 2014 16:13:28 -0800
Message-ID: <CAMKF1sq_hMS_eeF=aV4YkY6EFZP7gVgjfyabVE4p35uT8uYGRA@mail.gmail.com>
To: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Build libatomic
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
X-List-Received-Date: Sat, 08 Mar 2014 00:14:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 7, 2014 at 5:39 AM, Cosmin Paraschiv
<cosmin.paraschiv@freescale.com> wrote:
> GCC 4.8 includes a new runtime library, libatomic, which supports
> atomic operations not supported by hardware or the OS. Build it,
> so other packages can link against it, if needed.

what all architectures did you test

>
> Signed-off-by: Cosmin Paraschiv <cosmin.paraschiv@freescale.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc |   12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index d3b11a7..f8c1109 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -12,7 +12,7 @@ ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
>  EXTRA_OECONF += "--disable-libunwind-exceptions"
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
> +RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
>  #  ?
>  # libiberty
>  # libmudflap
> @@ -87,6 +87,9 @@ PACKAGES = "\
>    libgomp \
>    libgomp-dev \
>    libgomp-staticdev \
> +  libatomic \
> +  libatomic-dev \
> +  libatomic-staticdev \
>  "
>  # The base package doesn't exist, so we clear the recommends.
>  RRECOMMENDS_${PN}-dbg = ""
> @@ -161,6 +164,13 @@ FILES_libgomp-staticdev = "\
>    ${libdir}/libgomp*.a \
>    "
>
> +FILES_libatomic = "${libdir}/libatomic.so.*"
> +FILES_libatomic-dev = " \
> +  ${libdir}/libatomic.so \
> +  ${libdir}/libatomic.la"
> +FILES_libatomic-staticdev = " \
> +  ${libdir}/libatomic.a"
> +
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

