Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFAECCD193
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 07:16:30 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.14545.1761203780000767402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 00:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MLn62ovZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so2562865e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 00:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761203778; x=1761808578; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fI60rEeFyAKyq5PKYoWpH6Dfn+kYTTGmkdFttkcwhZY=;
        b=MLn62ovZ+O6pO0LcOrFa77qGIGl85UTSu7q1FFMqoeznPkx0rdoBZOYnozhlTi71OR
         vFk48Oo6da4sQLdgzeM9tSzmq1ouDErBzto12KwOkNFSTVBtKVV5PKUwt6zEYwtGVc9g
         K5o2sCwQeuORBwgTJ4c9HKylOIXNIwPpdnhs22nORIGmR6VTKq8KY0Z9rS1XnUiZj0T+
         c4KrDKNAZqwrpQq+KSJLgucBNYlUziVMR1mg/qid7F1o0X1n9FtVSfiNKe7smgAOFTH5
         H5NYe8sE/3qwvRRPYLmJC/kUSfRxAYk8fcgqygecJPcGcRVOZfZP1sOuaaYAdQ5bHmtV
         MYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761203778; x=1761808578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fI60rEeFyAKyq5PKYoWpH6Dfn+kYTTGmkdFttkcwhZY=;
        b=SfNmVH9kRr9t+b2hiUtYUIfdbZiy1zLcTgoqHvpfWqAztcRRcQnlbzm6+ILDsFlTzr
         4W1p3Tz4V7v2php12oiMjqE536ZAA7sGYo4umEurYumTQzwlVtNk9eMpY8+pIGfaSh3a
         SZ1KbOOZZVoprM3pcepwukkn+j34bUXYx/bmlgzfWm4tU6YiLcqXdsNrrcJcgxrWfAh1
         PJTIyaG6JYSyiBTwgO/h2cNery7I4bQ96/TUC23GgfhEnK9lem+H6aNXkvz1BAlhxU8E
         t2XHeL3dCcHzj/b96685m8EItA26g9/HQp6a0pAiwuHcSXtd4MEN+bDzBFlCstgvOgGH
         M9fw==
X-Forwarded-Encrypted: i=1; AJvYcCXprH5qgoFvTEc+kKiHJ5HVq7HWTbL649G1zw9CyQ6xRHwbI1JcMXvhn80q+ddMNQ7w3URdCo56m5yv44dg3klqOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHD2YY9GSN16moplh0qpzME/ZumD7t0W3AONAXocaA6T1oB25/
	E0E9uR1qfby3bUr727+PFtZ0T+0L06NxJM2ymYzIolrKpIk1LNmWMfOE
X-Gm-Gg: ASbGncviP7Qkn0FFwsJYhr343syn87jKo+HRugL8VfmYxhMTkb4dfqjHDY9IyvE0/mM
	D1yrHDEt30s85qm6oGtl69jjTJSMFk3tzc4ZzrFMhXw2Q8Ddkb7FyW4SigJeJMSAFnCqgrArElM
	F4mV772403e75AwtU4OScL6n2Rm/92PEqcqnEXqXrxFqVkSSmd00ahupXb3ndJftGmHwql7hrXy
	caZGOHMlSo6w5R1VzprCZ/zWrLk069RG4Zm8XaO+WhLKb9ke0w6Q/ieb5JdIJLiDf3+1UX87Xwp
	goQCxLO4uyGzewOC5xFJqv6RzP3vOLmR3qbAjiKsnl4YDIfsrttEHmJQReQWB4i87KR9nFezPp6
	r0tHxxH7257eyjoWMOY2uq/J16Pb5JAjOiqT2iK+IScyM4VIcxZWbowYT7FigmWNwKkn9p3R+3Q
	klxvEuPV3GxC4bWV7KlZtpzK1FJp4J4A==
X-Google-Smtp-Source: AGHT+IEYMJ3TCSwkdiseB5xWMKnkA1Z5vdWtgUHZjwbf6I8bAQd9g/819M5toQE14Z7p4ZaGLbJdDg==
X-Received: by 2002:a05:600c:3147:b0:471:1716:11c4 with SMTP id 5b1f17b1804b1-475cb0466a9mr10247705e9.34.1761203778027;
        Thu, 23 Oct 2025 00:16:18 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428dafesm79625335e9.6.2025.10.23.00.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:16:17 -0700 (PDT)
Message-ID: <1d258375-6779-4854-a02f-7e8df122a6c7@gmail.com>
Date: Thu, 23 Oct 2025 09:16:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3] libxslt: add ptest support
To: pratik.farkase@est.tech, openembedded-core@lists.openembedded.org
References: <20251022203158.7806-1-pratik.farkase@est.tech>
 <20251022204136.8276-1-pratik.farkase@est.tech>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251022204136.8276-1-pratik.farkase@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 07:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225219

On 10/22/25 22:41, Pratik Farkase via lists.openembedded.org wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Enable --with-plugins only when ptest is enabled, per review feedback.
>
> v3:
> - Remove unconditional --with-plugins (leftover from v2)
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libxslt/files/run-ptest  | 25 ++++++++++++
>  .../recipes-support/libxslt/libxslt_1.1.43.bb | 40 +++++++++++++++++--
>  3 files changed, 63 insertions(+), 3 deletions(-)
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
> index e08e92085d..c1793710e5 100644
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
> @@ -26,7 +27,39 @@ S = "${WORKDIR}/libxslt-${PV}"
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
>  
>  do_configure:prepend () {
>  	# We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header.
> @@ -39,6 +72,7 @@ do_configure:prepend () {
>  }
>  
>  EXTRA_OECONF = "--without-python --without-debug --without-crypto"
> +EXTRA_OECONF:append:ptest = " --with-plugins"

Hmmmm... does this work as intended? Just trying to confirm. It might
work, override logic have surprised me before, but I'm not familiar with
this syntax... I was thinking for more along the lines of
EXTRA_OECCONF += "${@bb.utils.contains('PTEST_ENABLED, '1',
'--with-plugins', '')}"

But if this works too, then there is no need to change.

>  # older versions of this recipe had ${PN}-utils
>  RPROVIDES:${PN}-bin += "${PN}-utils"
>  RCONFLICTS:${PN}-bin += "${PN}-utils"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225212): https://lists.openembedded.org/g/openembedded-core/message/225212
> Mute This Topic: https://lists.openembedded.org/mt/115899975/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


