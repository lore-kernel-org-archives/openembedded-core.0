Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734D5C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 13:22:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.19107.1667481765207203215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 06:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=E2ZuVVol;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0BB09C000B;
	Thu,  3 Nov 2022 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667481763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BSrkkHUBsNjO9p1d7RYQ6CHCAnc2t440JUdNBvLHDEE=;
	b=E2ZuVVoltaHoYZBB9iBiID+FO4nzo5vXxDiT/kcvrdeafQ3Y6UpDy0Y4ywSakBZoiKi0QG
	Z3zxqCJ72cvH8yI6XPmwGkv8BESYxGHnsfARLv4OYcQtUxFuFKQDUQlf9XjQ2S9dV3vLUs
	z/VQcAr6m0ecBE+pIFqR48e9d8uyHGQFYggwpD5E6gDI3kpRv4gSObVexKeochqDylgaje
	gNZW0+AYkeDE6CsQWwjc/drhKD5G9lP/5KHce/FKU3SGsdgAg4+GT6BovT73TAMWBjs/nf
	PcMouFpZ0/u1yADNPXEMBgR4RKcretV40DoDcpstE1GllYKTy5azqP/OgV+sQg==
Date: Thu, 3 Nov 2022 14:22:42 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chase Qi <chase.qi@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libc-test: add libc testsuite for musl
Message-ID: <Y2PAohCVLPDLSl5x@mail.local>
References: <20221103053926.719998-1-chase.qi@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103053926.719998-1-chase.qi@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 13:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172628

Hello,

On 03/11/2022 05:39:26+0000, Chase Qi wrote:
> libc-test is a collection of unit test to measure the correctness and
> robustness of a C/POSIX standard library implementation. It is developed
> as part of the musl project.
> 

You also need to add it to the ptest list:

WARNING: libc-test-git-r0 do_package_qa: QA Issue: supports ptests but is not included in oe-core's ptest-packagelists.inc [missing-ptest]

> Signed-off-by: Chase Qi <chase.qi@linaro.org>
> ---
>  meta/recipes-core/musl/libc-test/run-ptest | 17 ++++++++
>  meta/recipes-core/musl/libc-test_git.bb    | 45 ++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
>  create mode 100644 meta/recipes-core/musl/libc-test_git.bb
> 
> diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
> new file mode 100644
> index 0000000000..30abcdfba5
> --- /dev/null
> +++ b/meta/recipes-core/musl/libc-test/run-ptest
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +
> +make cleanall
> +make run | tee libc-test.log
> +
> +echo ""
> +echo "--- ptest result ---"
> +if grep -q '^FAIL src.*\.exe.*' libc-test.log; then
> +    # Consolidate output format.
> +    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
> +    grep '^FAIL src.*\.exe.*' libc-test.log \
> +        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
> +    exit 1
> +else
> +    echo "PASS: libc-test"
> +    exit 0
> +fi
> diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
> new file mode 100644
> index 0000000000..d5d8845727
> --- /dev/null
> +++ b/meta/recipes-core/musl/libc-test_git.bb
> @@ -0,0 +1,45 @@
> +SUMMARY = "Musl libc test to be run with ptest"
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
> +    git://nsz.repo.hu:49100/repo/libc-test;branch=master \
> +    file://run-ptest \
> +"
> +MIRRORS += "git://nsz.repo.hu:49100/repo/libc-test git://repo.or.cz/libc-test"
> +
> +S = "${WORKDIR}/git"
> +
> +# libc-test 'make' or 'make run' command is designed to build and run tests. It
> +# reports both build and test failures. The commands should be run on target.
> +do_compile() {
> +    :
> +}
> +
> +RDEPENDS:${PN}-ptest = " \
> +    bash \
> +    grep \
> +    musl \
> +    packagegroup-core-buildessential \
> +    sed \
> +"
> +
> +do_install_ptest () {
> +    cp ${S}/Makefile ${D}${PTEST_PATH}
> +    cp ${S}/config.mak.def ${D}${PTEST_PATH}/config.mak
> +    cp -r ${S}/src ${D}${PTEST_PATH}/
> +}
> +
> +# libc-test-ptest depends on empty libc-test.
> +ALLOW_EMPTY:${PN} = "1"
> +
> +COMPATIBLE_HOST = "null"
> +COMPATIBLE_HOST:libc-musl = "(.*)"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172610): https://lists.openembedded.org/g/openembedded-core/message/172610
> Mute This Topic: https://lists.openembedded.org/mt/94751275/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

