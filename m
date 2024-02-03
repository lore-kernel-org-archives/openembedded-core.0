Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A50C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 21:23:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.26163.1706995402917271838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 13:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NJ4Qc96N;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E672360002;
	Sat,  3 Feb 2024 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706995401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDmf5ph51iMFqz0511b/IwtLRKJ1ijUAvdaLTuhl9HQ=;
	b=NJ4Qc96NgcPP6I16qYqwLH7wpI8Q6bKSjl8/0shL3letQ7GREmlxwoQAnzFdrJyUj1AfQ5
	C3bsgooloShjPfuJ1G1d1mHux4lpN4AwZtd6wR5LhM3EZcdLsK8687zSd4qwHLPRiWxA50
	/5TRLRMtDA0GWMy0Ms6Rj0DaJmqiOQ0Dhyf/xrYSyNodFy0pDFQgmhI7RWXjp2LzWUT5c5
	vx8J8Ne+UzVH/P8/3YJ4QwF7GoyY8QnNmMsm836RqqAwsH7Cd/yxlI8mwTkPMp4LlusMsR
	I/GTAYcEbtdyAfGLPdi12E7msLa6atWnHw0fY7SwShZlP9rcW1vovqZrir77Og==
Date: Sat, 3 Feb 2024 22:23:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support
Message-ID: <202402032123190b2cce93@mail.local>
References: <20240126054820.1656852-1-chi.xu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126054820.1656852-1-chi.xu@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 21:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194861

Hello,

I've had a reproducibility failure:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240203-fdpg888c/packages/diff-html/

On 26/01/2024 13:48:20+0800, Chi Xu wrote:
> There are two types of cases: executables and POSIX shell scripts.
> All test cases PASS.
> Add xz-ptest to PTESTS_FAST because test duration less than 30s
> on qemux86-64.
> 
> root@qemux86-64:~# ptest-runner xz
> START: ptest-runner
> 2024-01-26T03:32
> BEGIN: /usr/lib/xz/ptest
> === test_bcj_exact_size.c ===
> PASS: test_exact_size
> PASS: test_empty_block
> ---
> === END ===
> ...
> === test_vli.c ===
> PASS: test_lzma_vli_size
> PASS: test_lzma_vli_encode
> PASS: test_lzma_vli_decode
> ---
> === END ===
> PASS: test_files.sh
> PASS: test_scripts.sh
> PASS: test_compress.sh
> DURATION: 18
> END: /usr/lib/xz/ptest
> 2024-01-26T03:33
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
> 
> Signed-off-by: Xu, Chi <chi.xu@windriver.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-extended/xz/xz/run-ptest         | 26 +++++++++++++++++
>  meta/recipes-extended/xz/xz_5.4.5.bb          | 28 +++++++++++++++++--
>  3 files changed, 53 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/xz/xz/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index a1643c5548..68a3f63a6a 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -77,6 +77,7 @@ PTESTS_FAST = "\
>      sed \
>      slang \
>      wayland \
> +    xz \
>      zlib \
>      libexif \
>  "
> diff --git a/meta/recipes-extended/xz/xz/run-ptest b/meta/recipes-extended/xz/xz/run-ptest
> new file mode 100644
> index 0000000000..cc8ba92016
> --- /dev/null
> +++ b/meta/recipes-extended/xz/xz/run-ptest
> @@ -0,0 +1,26 @@
> +#!/bin/bash
> +
> +ptestdir=$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +# executables test cases
> +tests_exec=$(file $(ls test_*) | grep "ELF" | awk -F: '{print $1}')
> +for i in ${tests_exec}; do
> +    ./$i
> +done
> +
> +# POSIX shell script test cases
> +export srcdir=${ptestdir}/tests
> +test_shell="test_files.sh test_scripts.sh test_compress.sh"
> +for j in ${test_shell}; do
> +    if [ $j == "test_compress.sh" ]; then
> +        ./$j create_compress_files
> +    else
> +        ./$j
> +    fi
> +    if [ $? -eq 0 ]; then
> +        echo "PASS: $j"
> +    else
> +        echo "FAIL: $j"
> +    fi
> +done
> diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb b/meta/recipes-extended/xz/xz_5.4.5.bb
> index 09eade8be0..0f0849c3e5 100644
> --- a/meta/recipes-extended/xz/xz_5.4.5.bb
> +++ b/meta/recipes-extended/xz/xz_5.4.5.bb
> @@ -24,13 +24,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
>                      file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
>                      "
>  
> -SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
> +SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
> +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
> +          "
>  SRC_URI[sha256sum] = "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d6"
>  UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
>  
>  CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
>  
> -inherit autotools gettext
> +inherit autotools gettext ptest
>  
>  PACKAGES =+ "liblzma"
>  
> @@ -42,3 +44,25 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
>                       lzma lzcat unlzma"
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS:${PN}-ptest += "bash file"
> +
> +do_compile_ptest() {
> +        oe_runmake check TESTS=
> +}
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    find ${B}/tests/.libs -type f -executable -exec cp {} ${D}${PTEST_PATH}/tests \;
> +    cp ${B}/config.h ${D}${PTEST_PATH}
> +    for i in files xzgrep_expected_output test_files.sh test_scripts.sh test_compress.sh; do
> +        cp -r ${S}/tests/$i ${D}${PTEST_PATH}/tests
> +    done
> +    mkdir -p ${D}${PTEST_PATH}/src/xz
> +    ln -s ${bindir}/xz ${D}${PTEST_PATH}/src/xz/xz
> +    mkdir -p ${D}${PTEST_PATH}/src/xzdec
> +    ln -s ${bindir}/xzdec ${D}${PTEST_PATH}/src/xzdec/xzdec
> +    mkdir -p ${D}${PTEST_PATH}/src/scripts
> +    ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scripts/xzdiff
> +    ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scripts/xzgrep
> +}
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194345): https://lists.openembedded.org/g/openembedded-core/message/194345
> Mute This Topic: https://lists.openembedded.org/mt/103971280/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

