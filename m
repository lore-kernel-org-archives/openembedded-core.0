Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 011A3713DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:52:12 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id rp18so10104867iec.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=83kyV3SxSNEkflpvr3YpckPJ9PaTlbzbWOnCN9jJ2zQ=;
	b=b2p3aAQzum6rGtkuOX2dorREm2HAQg10UEhZEp624t21keuu8H6bDt67J3OCBWtESR
	st86HxS4MlBSXsWxVjTlSygZPEnxnDSndUHGQslZSKPtaeORzdsOt4FbNx9G8MkX4qUF
	vrQe86O0OUQtwu6PXEPoTDiPYK78rPw3EVMHj8nwmFijJEBkLXiPFkMIeIJ65fZ9m7Im
	QxrqNyBHLuSQsZdWgCeFOYM/5xldc54ZQZA2dTuSWQQ8Qe6qF903pKlJyF5m23Jkf5Sp
	k9y8W6+AAcSLJkAu+x8qRUimbG9VMUVVPyt9rpzKGTxTvKR6jY9XEwjv3YK+AVKfDrKj
	Sg3Q==
X-Received: by 10.50.21.3 with SMTP id r3mr39957412ige.13.1409766733401; Wed,
	03 Sep 2014 10:52:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Wed, 3 Sep 2014 10:51:43 -0700 (PDT)
In-Reply-To: <CACS+7ZRpSoftQT=G+bP=1j_iaHx_G=sSw3m3WfEj2Lkf3xreVQ@mail.gmail.com>
References: <CACS+7ZQPApooy-T6E9rTXRhSRFs6PZGP0YJTou7f+ckxPN-CjA@mail.gmail.com>
	<CACS+7ZRpSoftQT=G+bP=1j_iaHx_G=sSw3m3WfEj2Lkf3xreVQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Sep 2014 10:51:43 -0700
Message-ID: <CAMKF1sp1q_vE7X11H-EEPoh+_6B8pozzzHaW2YWD9x1-VM_sNA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-runtime: enable sanitizers
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
X-List-Received-Date: Wed, 03 Sep 2014 17:52:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 3, 2014 at 9:26 AM, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> AddressSanitizer is a fast memory error detector.
> ThreadSanitizer detects data races.
> UBSanitizer detectes undefined behaviour.
>
> All consist of compiler instrumentation and a run-time library.
> The compiler instrumentation was already enabled, this enables
> the run-time library component.

looks good.

>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 32 ++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 7ce84f1..f1928b4 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -10,7 +10,9 @@ EXTRA_OECONF_PATHS = "\
>
>  EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>
> -RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic"
> +SANITIZER_ARCHS = "arm i586 i686 x86-64"
> +SANITIZER_TARGET = '${@bb.utils.contains("SANITIZER_ARCHS",
> "${TRANSLATED_TARGET_ARCH}", "libsanitizer", "",d)}'
> +RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${SANITIZER_TARGET}"
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
> @@ -171,6 +176,31 @@ FILES_libatomic-dev = "\
>  "
>  FILES_libatomic-staticdev = "${libdir}/libatomic.a"
>
> +FILES_libsanitizer = "\
> +  ${libdir}/libasan.so.* \
> +  ${libdir}/liblsan.so.* \
> +  ${libdir}/libtsan.so.* \
> +  ${libdir}/libubsan.so.* \
> +"
> +FILES_libsanitizer-dev = "\
> +  ${libdir}/libsanitizer.spec \
> +  ${libdir}/libasan_preinit.o \
> +  ${libdir}/libasan.so \
> +  ${libdir}/liblsan.so \
> +  ${libdir}/libtsan.so \
> +  ${libdir}/libubsan.so \
> +  ${libdir}/libasan.la \
> +  ${libdir}/liblsan.la \
> +  ${libdir}/libtsan.la \
> +  ${libdir}/libubsan.la \
> +"
> +FILES_libsanitizer-staticdev = "\
> +  ${libdir}/libasan.a \
> +  ${libdir}/liblsan.a \
> +  ${libdir}/libtsan.a \
> +  ${libdir}/libubsan.a \
> +"
> +
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 1.9.3
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

