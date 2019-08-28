Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 651947EFD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 14:58:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t17so405347wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HE2V3gsfiKraO98haD4vSD5Bwes6GtJSoZveCYhr8Cs=;
	b=FoweoES/4jUDsLsq9OWYsbmR57sEVjI/0NuM1dAUeowVmYiy1eDSAY+u5mE+GldY2K
	GW5CiPx/GAyxYnjHwD+yOprqinm9JLAEknKTkNXITZQ9Qtr62jjnQOvB8RbUz+GCf/X5
	jsP8qcK81vgEjwdR8jPvoRA2UXX3oDXUH8+4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HE2V3gsfiKraO98haD4vSD5Bwes6GtJSoZveCYhr8Cs=;
	b=rsntytFiF3SwITMb3f7BRr7TQLWd28+ucjmdd+eBdo67JAnI0SE14FgmxuqDnqXTsR
	6r1qsumgSws9RjSB0upbtnEaFi72PI8/TIT3uXTxK1xzhgm6sPd80C8nSYJTmjLYBQFB
	e7qWvrxMeTqK3CoGBeIW9nx96ZBfFwANQAJfOpQA/wRKGyb2SdQ1VoOOKJdvGy5MYieg
	igYEXmIMwb1D/o76SKojQYmNDjckFIiKUwNzQIc6cmBP4Nijg2cKnG0CNd2bqYnHI8W0
	boH2OqhM/P1eFEO1hHW6d3WI5pcYrbyZNF/VdIOGKPcO5Rpu2X/4l4WFn4lAMs1GkBDd
	QONQ==
X-Gm-Message-State: APjAAAUhjepzdPlxN6MuwO5CZFHadSYDU22XRdXPUMRrJw5qmz3scQCZ
	4vM1VYOYMcRTJZx5LIph+ZakIg==
X-Google-Smtp-Source: APXvYqyhC5GpKRUp4cgxTP/4zXhc06dhzw38TaPoW0xjifSd00WgvvD8YUqwno4RsxjpAeDBweesSA==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr5660378wmh.116.1567004301865; 
	Wed, 28 Aug 2019 07:58:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w5sm3328567wrc.82.2019.08.28.07.58.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 07:58:21 -0700 (PDT)
Message-ID: <f7e4507b410a6e230a628cbb4c0164123b5c2a40.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Nathan Rossi <nathan@nathanrossi.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 15:58:16 +0100
In-Reply-To: <20190828050629.6392-1-nathan@nathanrossi.com>
References: <20190828050629.6392-0-nathan@nathanrossi.com>
	<20190828050629.6392-1-nathan@nathanrossi.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/11] binutils: Add do_check task for executing binutils test suite
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
X-List-Received-Date: Wed, 28 Aug 2019 14:58:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-28 at 05:06 +0000, Nathan Rossi wrote:
> Create the do_check task to the binutils-cross include. This task can be
> used to execute the binutils test suite for the cross target binutils.
> By default this executes all the check targets of the binutils Makefile,
> this can however be changed by setting MAKE_CHECK_TARGETS to the desired
> test suite target (e.g. check-gas).
> 
> The binutils test suites do not require any target execution, as such
> the check target can be run without QEMU or a target device. However
> since the binutils tests do rely on a C compiler there is dependence on
> both gcc and libc in order to run the tests.
> 
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-devtools/binutils/binutils-cross.inc | 28 +++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
> index 02ec891606..76eb453f0e 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross.inc
> @@ -36,3 +36,31 @@ do_install () {
>  	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${libdir}64 || :
>  	rmdir ${D}${STAGING_DIR_NATIVE}${prefix_native}/${prefix} || :
>  }
> +
> +EXTRA_OEMAKE_prepend_task-check = "${PARALLEL_MAKE} "
> +MAKE_CHECK_TARGETS ??= "check-binutils check-gas check-gold check-ld check-libiberty"
> +
> +python () {
> +    # crosssdk deps have different virtual targets
> +    if bb.data.inherits_class('crosssdk', d):
> +        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}gcc-crosssdk:do_populate_sysroot")
> +        d.appendVarFlag("do_check", "depends", " virtual/nativesdk-${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
> +    else:
> +        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}gcc:do_populate_sysroot")
> +        d.appendVarFlag("do_check", "depends", " virtual/${TARGET_PREFIX}compilerlibs:do_populate_sysroot")
> +}

I'm torn here on whether we should do:

do_check[depends] += "${BINUTILS_TARGETDEPS}"
BINUTILS_TARGETDEPS = "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot virtual/${TARGET_PREFIX}compilerlibs:do_populate_sysroot"
BINUTILS_TARGETDEPS_class-crosssdk = "virtual/${TARGET_PREFIX}gcc-crosssdk:do_populate_sysroot virtual/nativesdk-${TARGET_PREFIX}compilerlibs:do_populate_sysroot"

instead of the above.

Cheers,

Richard


> +do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
> +do_check[depends] += "virtual/libc:do_populate_sysroot"
> +do_check[dirs] = "${B}"
> +do_check[nostamp] = "1"
> +do_check() {
> +    # need to inject CC and CXX as the target CC and CXX with sysroot
> +    oe_runmake -i ${MAKE_CHECK_TARGETS} \
> +        RUNTESTFLAGS=" \
> +            CC='${TARGET_PREFIX}gcc --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}' \
> +            CXX='${TARGET_PREFIX}g++ --sysroot=${STAGING_DIR_TARGET} ${TUNE_CCARGS}' \
> +            "
> +}
> +addtask check after do_compile
> +
> ---
> 2.23.0.rc1
> 


