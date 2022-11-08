Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328F6C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 19:50:44 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1808.1667937042534981309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 11:50:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RMVEA4QU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C2ACE1C0006;
	Tue,  8 Nov 2022 19:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667937040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HnLqk++TRTz4ZxXeFVO/k1HBdLUDIMR4Q6x/mn2QlO0=;
	b=RMVEA4QUjVTCYkkjPIYRmf0s9y3fRo+0kFwigeGvX47U64SEQJM6d5Md7F1qmUYeKh3Mbc
	PwLnIJhp/4/ywIKn9c8snkCzy0B6Nelfp5LJx3HC4NVwmCDn/SSbyYAW4KuhYg4CY1qplR
	SsLqcjGeiH90T73f7kKPaW9TT3R02ODEr+mZnRhHZ2ET6+9WA74Ykp0RGa2/64hxYCPWUe
	v57PB+G7xB0bw8ERrkyvVN6hYD4nUOX8TJ6a9eLDxtqXwohfFmOXvTqPGBfCp0DATHUGNR
	MgQd9wR7hHWv9hlHylxBd5FmJw+bouNfLEKubDEKHLtlgIzYSuB4Bnuo0Lh+1A==
Date: Tue, 8 Nov 2022 20:50:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chase Qi <chase.qi@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] libc-test: add libc testsuite for musl
Message-ID: <Y2qzD8cb//AgUXco@mail.local>
References: <20221108034233.3452233-1-chase.qi@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108034233.3452233-1-chase.qi@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 19:50:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172996

Hello,

This fails with:
The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
libc-test (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/musl/libc-test_git.bb)

On 08/11/2022 03:42:33+0000, Chase Qi wrote:
> libc-test is a collection of unit test to measure the correctness and
> robustness of a C/POSIX standard library implementation. It is developed
> as part of the musl project.
> 
> Signed-off-by: Chase Qi <chase.qi@linaro.org>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/musl/libc-test/run-ptest    | 28 ++++++++++
>  meta/recipes-core/musl/libc-test_git.bb       | 51 +++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
>  create mode 100644 meta/recipes-core/musl/libc-test_git.bb
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 32b0e5297a..3c9ff43bd9 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -105,6 +105,7 @@ PTESTS_SLOW = "\
>  
>  PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
>  PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
> +PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
>  
>  #    ruby-ptest \ # Timeout
>  #    lz4-ptest \ # Needs a rewrite
> diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
> new file mode 100644
> index 0000000000..0b4b687dec
> --- /dev/null
> +++ b/meta/recipes-core/musl/libc-test/run-ptest
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +set -e
> +
> +cd /opt/libc-test
> +make cleanall
> +make run || true
> +
> +echo ""
> +echo "--- ptest result ---"
> +# libc-test runs tests by module(e.g. src/api) and generates sub-module test
> +# report(e.g. src/api/REPORT) first. After all tests finish, it generates the
> +# consolidated report file src/REPORT.
> +report="/opt/libc-test/src/REPORT"
> +if ! [ -f "${report}" ]; then
> +    echo "${report} not found!"
> +    echo "FAIL: libc-test"
> +    exit 1
> +# libc-test prints error on failure and prints nothing on success.
> +elif grep -q '^FAIL src.*\.exe.*' "${report}"; then
> +    # Print test failure in ptest format.
> +    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
> +    grep '^FAIL src.*\.exe.*' "${report}" \
> +        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
> +    exit 1
> +else
> +    echo "PASS: libc-test"
> +fi
> diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
> new file mode 100644
> index 0000000000..b5bfc6e34c
> --- /dev/null
> +++ b/meta/recipes-core/musl/libc-test_git.bb
> @@ -0,0 +1,51 @@
> +SUMMARY = "Musl libc unit tests"
> +HOMEPAGE = "https://wiki.musl-libc.org/libc-test.html"
> +DESCRIPTION = "libc-test is a collection of unit tests to measure the \
> +correctness and robustness of a C/POSIX standard library implementation. It is \
> +developed as part of the musl project."
> +SECTION = "tests"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=43ed1245085be90dc934288117d55a3b"
> +
> +inherit ptest
> +
> +SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
> +SRC_URI = " \
> +    git://repo.or.cz/libc-test;branch=master \
> +    file://run-ptest \
> +"
> +
> +PV = "0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +# libc-test 'make' or 'make run' command is designed to build and run tests. It
> +# reports both build and test failures. The commands should be run on target.
> +do_compile() {
> +    :
> +}
> +
> +RDEPENDS:${PN} = " \
> +    bash \
> +    grep \
> +    musl \
> +    packagegroup-core-buildessential \
> +"
> +
> +RDEPENDS:${PN}-ptest = " \
> +     ${PN} \
> +     sed \
> +"
> +
> +install_path = "/opt/${PN}"
> +FILES:${PN} += "${install_path}/*"
> +
> +do_install () {
> +    install -d ${D}${install_path}/
> +    cp ${S}/Makefile ${D}${install_path}
> +    cp ${S}/config.mak.def ${D}${install_path}/config.mak
> +    cp -r ${S}/src ${D}${install_path}
> +}
> +
> +COMPATIBLE_HOST = "null"
> +COMPATIBLE_HOST:libc-musl = "(.*)"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172948): https://lists.openembedded.org/g/openembedded-core/message/172948
> Mute This Topic: https://lists.openembedded.org/mt/94883839/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

