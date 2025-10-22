Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA1CCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 18:07:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.1555.1761156433113497561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 11:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEY0WqrF;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so40658455e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 11:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761156431; x=1761761231; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LiXR0kF1goLTNuHE3g1dKpB0cktvdcmQ+a67vmbfyPI=;
        b=CEY0WqrFP39aESoLRHqXPtl4dVmTI+T4DXqZc1Tha+3F56jox/791aldSa+n6VXxwa
         R0QbsOtBbG+Pf7MqpFXTuSvFOsENFVGoLk1pWPxMGpUWaX3wN0B1Fh+YV0NHSz53tG0H
         OdsM4Mrc/gA8sRTTxgf2WLM3Hp7PfVKmnxgSdtICcF+CFRpUExfk+yalCtjKHomNP+Q1
         +4TAITIY82RTGJEsnNWgwgPdDPvvkV4hx1fHYhQ8cQUcpStYJ6eoy0LZewBoFe1W1ylv
         tFHkRfIBN1J0PZb3LOVVA9GNn7o9UBlTyr80YlzFfr5FYLHOqgdy1v4a1/hbDjS4rMNN
         clSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156431; x=1761761231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LiXR0kF1goLTNuHE3g1dKpB0cktvdcmQ+a67vmbfyPI=;
        b=qwnO1lfrnFLerV2bU16At3Fu7Bw9hn6dm0cFuNGrsjSOe4xp7PD9i2gv0KHjfBUYXN
         2FZ6VuMahH5uvQvePxvq8u88v2m3UKHQc2EfOENJN1BpF6wKZ5+ycjGE/A9gbMuLNLxB
         cqknsbQqFFkhAzi05qJQtNDOH2yq1WiDGYZIQ937Z9Hy8eIbGISSWjcoXm8I/FBR97dI
         LGx+OoREua+OFNVj41SoCqlJAM4jZcFL11IG1ZKmc3Ekjt+hOW9S7Mi/7hwfrzSYc3v8
         695tczqrrZzAvafpTcwZGAlhRkipIBi6SJRQm9wRGP5wrc1KX9JwlERWXbfHrLngLw4x
         Pd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2zsv1Ztz0LoyL0FYIbvGN6+I4X1w5dB9d8TjaO36h7LK37v4IgReT7TR09qP9tkXbvfHWGYkbGQTBVb90keAaPA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZ6BVyj5GQTJOcOmrTRmoemqJX0mat+znz3Dfq4yXqTtDw1duT
	zW6zf1KANH5pve84dDv/sLfjLZ63cOV1czcZzwpDzili2/GWtYtAjLe30yG72A==
X-Gm-Gg: ASbGncvNf7+oehap3EcuCQFW++quJbgPT4isc09JST0K0ROFQM+ICUqoVlojFwZjAea
	VtskduzlzRBXP1rSO4i0bou3xgUK3lcUq5yFZPkO/nZX5f+vjcBwcHJRgEY1yPaFMWD3YpT8GS9
	Ai/xjVAHirelKxd075DFKgrdgjJVkyqS3LtzGawEv6ZeIZsUeA2UpwzaxoBorETdC6y7ot100XT
	zzTprPjfZApkOMfn7cr4fH+pSKJwDq+T2a2N9kRoIOzVE/rmd00ZBrtNYnWrX5KJcruh8/yN3Qh
	10wHnRix7Kpn8q9gviS5sEaEeAQPgwH6ejL97+Smya7FrI4W6inSRZnaoQhWXL1EZ3iihL+4lZc
	Mb/H0wsu42j0huGT473vD8+5M76IAHfxOnKrH1f9ZLnT4XKOx1PSYPE6AU1RSmd4uGZTPNQ+GEe
	D0ufEXTaE/pnBD8fAMZtA=
X-Google-Smtp-Source: AGHT+IFTyqKXwAylbiE7VsjVFIJWiwcE19PNg2Uq34SyxlNR9EiSAb/W3AVISF5I1I4AF8U2ZzMv3w==
X-Received: by 2002:a05:600c:5298:b0:46d:996b:826a with SMTP id 5b1f17b1804b1-4711791d69fmr147438745e9.36.1761156431242;
        Wed, 22 Oct 2025 11:07:11 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-474949dd479sm45566505e9.0.2025.10.22.11.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:07:10 -0700 (PDT)
Message-ID: <a3a88a2f-11f2-4158-b4a9-a7ba36520a95@gmail.com>
Date: Wed, 22 Oct 2025 20:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libxslt: add ptest support
To: pratik.farkase@est.tech, openembedded-core@lists.openembedded.org
References: <20251022151239.87981-1-pratik.farkase@est.tech>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251022151239.87981-1-pratik.farkase@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 18:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225206

On 10/22/25 17:12, Pratik Farkase via lists.openembedded.org wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libxslt/files/run-ptest  | 25 +++++++++++
>  .../recipes-support/libxslt/libxslt_1.1.43.bb | 45 +++++++++++++++++--
>  3 files changed, 67 insertions(+), 4 deletions(-)
>  create mode 100755 meta/recipes-support/libxslt/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 9950e46776..b295e0049f 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -47,6 +47,7 @@ PTESTS_FAST = "\
>      libxml-simple-perl \
>      libxml2 \
>      libxmlb \
> +    libxslt \
>      logrotate \
>      lua \
>      lzo \
> diff --git a/meta/recipes-support/libxslt/files/run-ptest b/meta/recipes-support/libxslt/files/run-ptest
> new file mode 100755
> index 0000000000..a2b28e6a75
> --- /dev/null
> +++ b/meta/recipes-support/libxslt/files/run-ptest
> @@ -0,0 +1,25 @@
> +#!/bin/sh
> +set -eu
> +PT_DIR="$(dirname "$0")"
> +cd "$PT_DIR/tests"
> +
> +echo "=== Running libxslt ptests (verbose) ==="
> +
> +if [ -x .libs/runtest ]; then
> +    echo "Running .libs/runtest --verbose --timing"
> +    ./.libs/runtest --verbose --timing 2>&1 | tee runtest.log
> +elif [ -x ./runtest ]; then
> +    echo "Running runtest --verbose --timing"
> +    ./runtest --verbose --timing 2>&1 | tee runtest.log
> +else
> +    echo "ERROR: runtest not found"
> +    exit 1
> +fi
> +
> +if [ -x .libs/run-threads ]; then
> +    echo "Running .libs/run-threads --verbose"
> +    ./.libs/run-threads --verbose 2>&1 | tee -a runtest.log
> +fi
> +
> +echo "=== Finished libxslt ptests ==="
> +
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.43.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
> index e08e92085d..0f6ec4ba02 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.43.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
> @@ -11,10 +11,11 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
>  
>  SECTION = "libs"
> -DEPENDS = "libxml2"
> +DEPENDS = "libxml2 libxslt-native"
>  
>  SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
> -           file://gnome-libxslt-bug-139-apple-fix.diff"
> +           file://gnome-libxslt-bug-139-apple-fix.diff \
> +	    file://run-ptest"
>  
>  SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
>  
> @@ -26,7 +27,43 @@ S = "${WORKDIR}/libxslt-${PV}"
>  
>  BINCONFIG = "${bindir}/xslt-config"
>  
> -inherit autotools pkgconfig binconfig-disabled lib_package multilib_header
> +inherit autotools pkgconfig binconfig-disabled lib_package multilib_header ptest
> +
> +RDEPENDS:${PN}-ptest += "${PN}-bin make libxslt-utils libxml2-utils xmlto coreutils sed grep diffutils bash libxml2-utils perl"
> +
> +do_compile_ptest() {
> +    cp -r ${S}/tests ${B}/
> +    oe_runmake -C ${B}/tests runtest || true
> +    if grep -q "run-threads" ${B}/tests/Makefile; then
> +        oe_runmake -C ${B}/tests run-threads || true
> +    fi
> +}
> +
> +addtask compile_ptest after do_compile before do_install

This addtask is not needed - do_compile_ptest() is implicitly executed
when ptest is enabled.

> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    if [ -d ${B}/tests/.libs ]; then
> +        cp -a ${B}/tests/.libs ${D}${PTEST_PATH}/tests/
> +    fi
> +
> +    for f in runtest run-threads; do
> +        if [ -f ${B}/tests/$f ]; then
> +            install -m 0755 ${B}/tests/$f ${D}${PTEST_PATH}/tests/
> +            sed -i -e "s#${TMPDIR}##g" \
> +                   -e "s#${B}##g" \
> +                   -e "s#${S}##g" \
> +                   ${D}${PTEST_PATH}/tests/$f || true
> +        fi
> +    done
> +
> +    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/ || true
> +    find ${D}${PTEST_PATH}/tests -name 'Makefile*' -delete || true
> +    find ${D}${PTEST_PATH}/tests -name '.deps' -type d -exec rm -rf {} + || true
> +}
> +
> +FILES:${PN}-ptest += "${PTEST_PATH}/*"

This line is also unnecessary, it is already included in the ptest.bbclass

>  
>  do_configure:prepend () {
>  	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header.
> @@ -38,7 +75,7 @@ do_configure:prepend () {
>  	touch ${S}/doc/xsltproc.1
>  }
>  
> -EXTRA_OECONF = "--without-python --without-debug --without-crypto"
> +EXTRA_OECONF = "--without-python --without-debug --without-crypto --with-plugins"

Is this --with-plugins only needed for the test? If yes, could it be
added conditionally, only in case ptest is enabled? (You can find
examples if you grep for "PTEST_ENABLED" in the meta folder)

>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES:${PN}-bin += "${PN}-utils"
>  RCONFLICTS:${PN}-bin += "${PN}-utils"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225200): https://lists.openembedded.org/g/openembedded-core/message/225200
> Mute This Topic: https://lists.openembedded.org/mt/115894161/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


