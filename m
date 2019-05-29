Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D88167E26A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 10:13:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s17so1330873wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 03:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rC2zx7ak6V5pinMnwb6uiEA7kOqazvANmHh8US5pHTU=;
	b=McHQ3NwwocjRblalpzOfdYTnadCxu+oMO9L/tWRZrMwWp4g6C3Dg1H9QiBxxkaL279
	KeIG/1sRqMY95tDeFgmVF3k0SAL5uAbBR6RRTwbUea64SK2/2O/wBBtJkQgmhTriuGjb
	s/aaeixOo84YSVySsRPhUX9Tp4cXAigT3TyAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rC2zx7ak6V5pinMnwb6uiEA7kOqazvANmHh8US5pHTU=;
	b=G5F1a5hE1NZ/9Fs0tlDjDM3NwR0DmwSQ/mrarxXy61BptkkeMYXTOQLXEYoPQYtTj7
	IeBvF4smaHxPv9ro89Ttq6hFZXW9/H8L4XXXWz0l/3idvU3QlTvHOMKuRwWNpFoCSM+D
	oXKcgLlOiKsjxf9QqjPQGwx7DYSZSssrXh7xM9VZUoZsp3ClUojoxH3V+7VKZEe8vtNm
	o7cbWW6WOM2Q+VTs/RBkQnNxM7xR5HUvzatHtMORUpjCxbT5hyNU5O3S7oFWNaZ9Po+Y
	LBxoAfW5JxwTCXiQeaDzcPE3U+Sm35GU4NpirQWqBwfF9ARku5Usd/dysxxvAc4hUqg5
	qXww==
X-Gm-Message-State: APjAAAVDmS22v35qq0acPVFfCxS7PrYcH1kGErJrU9qkyZKIY+GFbfqz
	5FPAH/vipIw8FWrMQ0sjjwEHAA==
X-Google-Smtp-Source: APXvYqy8iyQHB2dpD49DT55AxEGFvRH1IY9ConKudjh75LXnFKYu79TceizGsY7NODtkoS1cJRmbTw==
X-Received: by 2002:a5d:634a:: with SMTP id b10mr10241611wrw.282.1559124799008;
	Wed, 29 May 2019 03:13:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p14sm11705936wrt.53.2019.05.29.03.13.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 03:13:18 -0700 (PDT)
Message-ID: <ba81c9ea11db351bde7fec1c40c2f57495c3fdec.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 11:13:16 +0100
In-Reply-To: <1559120138-3450-1-git-send-email-mingli.yu@windriver.com>
References: <5a62beea5ad46e24bc1e59c5cf9938799c0e3d12.camel@linuxfoundation.org>
	<1559120138-3450-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH v3] elfutils: fix ptest failures
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
X-List-Received-Date: Wed, 29 May 2019 10:13:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-29 at 16:55 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> * Add missing -ptest package dependency (needs
>   ${PN}-dev)
> 
> * Add missing files which needed by ptest test
>   to fix the ptest failures such as:
>   | sh: ../src/elflint: No such file or directory
>   | FAIL: asm-tst4
> 
> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>   to skip the tests which depend on gcc
> 
> * Define INHIBIT_PACKAGE_STRIP_FILES for elfutils to
>   avoid stripping some generated binaries otherwise
>   some of the tests such as test-nlist, run-strip-reloc.sh,
>   run-strip-strmerge.sh and so on will fail
> 
> Before:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 176       | 23       | 4
> --------------------------------------------
> 
> After:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 199       | 0       | 4
> --------------------------------------------
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.176.bb   | 34 ++++++++++++++++++-
>  .../0001-skip-the-test-when-gcc-not-deployed.patch | 38 +++++++++++++++++++---
>  2 files changed, 66 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> index 157551e..93d0c78 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> @@ -44,7 +44,7 @@ inherit autotools gettext ptest
>  
>  EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
>  EXTRA_OECONF_append_class-native = " --without-bzlib"
> -RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
> +RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN} ${PN}-dev"
>  
>  EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
>  
> @@ -61,6 +61,16 @@ do_compile_ptest() {
>  
>  do_install_ptest() {
>  	if [ ${PTEST_ENABLED} = "1" ]; then
> +		# copy the files which needed by the cases
> +		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint"
> +		install -d -m 755                       ${D}${PTEST_PATH}/src
> +		install -d -m 755                       ${D}${PTEST_PATH}/libelf
> +		install -d -m 755                       ${D}${PTEST_PATH}/libdw
> +		for test_file in ${TEST_FILES}; do
> +			cp -r ${B}/src/${test_file} ${D}${PTEST_PATH}/src
> +		done
> +		ln -s ${libdir}/libelf.so ${D}${PTEST_PATH}/libelf/libelf.so
> +		ln -s ${libdir}/libdw.so ${D}${PTEST_PATH}/libdw/libdw.so
>  		cp -r ${S}/tests/                       ${D}${PTEST_PATH}
>  		cp -r ${B}/tests/*                      ${D}${PTEST_PATH}/tests
>  		cp -r ${B}/config.h                     ${D}${PTEST_PATH}
> @@ -109,3 +119,25 @@ FILES_libdw  = "${libdir}/libdw-${PV}.so ${libdir}/libdw.so.* ${libdir}/elfutils
>  
>  # The package contains symlinks that trip up insane
>  INSANE_SKIP_${MLPREFIX}libdw = "dev-so"
> +INSANE_SKIP_${PN}-ptest += "dev-deps"
> +
> +# avoid stripping some generated binaries otherwise some of the tests such as test-nlist,
> +# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
> +INHIBIT_PACKAGE_STRIP_FILES = "\
> +    ${PKGD}${PTEST_PATH}/tests/test-nlist \
> +    ${PKGD}${PTEST_PATH}/tests/elfstrmerge \
> +    ${PKGD}${PTEST_PATH}/tests/backtrace-child \
> +    ${PKGD}${PTEST_PATH}/tests/backtrace-data \
> +    ${PKGD}${PTEST_PATH}/tests/deleted \
> +    ${PKGD}${PTEST_PATH}/src/strip \
> +    ${PKGD}${PTEST_PATH}/src/addr2line \
> +    ${PKGD}${PTEST_PATH}/src/elfcmp \
> +    ${PKGD}${PTEST_PATH}/src/objdump \
> +    ${PKGD}${PTEST_PATH}/src/readelf \
> +    ${PKGD}${PTEST_PATH}/src/nm \
> +    ${PKGD}${PTEST_PATH}/src/elflint \
> +    ${PKGD}${libdir}/libelf-${PV}.so \
> +    ${PKGD}${libdir}/libdw-${PV}.so \

This looks better, except for the two libdir lines above. This will
inflate main image sizes just to make tests work :(.

We're going to need to fine another way to handle this as I'd imagine
the size increase is substancial.

It may be worth asking upstream whether they'd accept the tests using
the debug link mechanism we use to find extra symbol information?

Cheers,

Richard


