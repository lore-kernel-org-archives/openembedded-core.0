Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.2237.1586132814123039958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 17:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=skammXcS;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id f20so11597709qtq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 17:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6LSWe+RLoOM+BUeLhBYdSPf95UKk81fH8YiGw4UWETM=;
        b=skammXcS2uN1Fpw9lROauo71RCo28d1CqPz9K5o2IC/O3/Kn9+6mSSSNFOMXRdMqU8
         1COusbsZt1GVebKBiH8PloFCtPCjKo8ykpYFJkgBRw4hSk+d8VNM//jrJVZs43+9AJTf
         rlCctWHpxtjPlkWwZ0xVFNFegClU3L6Isf4JTxvzETqZqrHWOg4boexP0KOrV616CIov
         6VQLQve0/DMzns6xHoaYG2/rVhJ+HEPMdQ1lI1AvPnbHv7UbPbYkZy680nPbsUpNIppf
         x1onK64NcucRX5Zz5hP5jpbplQN7gDyiDDqIwdl3mZPGRzV9wmPzi09z1PGx63JqAy7p
         n7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6LSWe+RLoOM+BUeLhBYdSPf95UKk81fH8YiGw4UWETM=;
        b=N/TRYDpS70MLSJ9ryShCiGI0xXFyxQxgsaOPqx6uP/tQwFcAlTN+bnV4qLc6jNx1i3
         X/Dp9D/t6wCYZAdvtvklW2R8h9E8AmFSbLe51WRJCzYhqQhZ4rLrofdADn/hSk/70DCX
         tyEkEyX7j50GdRg+RoiFFcJ1hujAYHgGIVXINGhKHpxxw94/GI2LqmJ+SjE+FgLCaoaI
         QFV/x+X6UCVEdV3diX93vAgTN+XWK3EY2XbuNS4SwdT4fxlQjpG8EOhdrbvxDUe992eg
         HInzKIfc4Apigtn0qEouuXjLvImzWC38T8ncRqk2BfvFW8tMuGgRd2GNYpws3TsDDN/1
         ZYlw==
X-Gm-Message-State: AGi0PubJuw2A8dAe/ratt4SHAI0zphMDwvIRrUIodx8MgvF4IMGAg2Lm
	KrR3wqzRTAgzxg0AJHY4IXFJ4C8jG/gU6MZMDVCAJqVxUpY=
X-Google-Smtp-Source: APiQypLavzDXUAEtQl88jhiiFamlzQNBeIn399ygLBFc/wQsjgBHLZHaur97rhpKDnJw2yVAGiyfPnjF5AUbJXu/E5c=
X-Received: by 2002:ac8:a09:: with SMTP id b9mr18528006qti.190.1586132812862;
 Sun, 05 Apr 2020 17:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200311113235.61655-1-trevor.gamblin@windriver.com> <20200311113235.61655-2-trevor.gamblin@windriver.com>
In-Reply-To: <20200311113235.61655-2-trevor.gamblin@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 5 Apr 2020 17:26:26 -0700
Message-ID: <CAMKF1spd-onZWc9j+Jx58zYtRUpAPC6X0wm+t0YSmgctmWD6Vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v5] coreutils: add ptest
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 11, 2020 at 4:33 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> coreutils has a large number of tests, including some added by the
> Makefile flags RUN_EXPENSIVE_TESTS and RUN_VERY_EXPENSIVE_TESTS that
> significantly increase runtime (and that have been disabled). Note
> that the coreutils ptest directory is given blanket permissions at
> runtime with chmod -R 777 to ensure that the user created for the
> tests will be able to run the test scripts and create the necessary
> files in the process.
>
> There is still room to improve the results of this ptest without
> the aforementioned additions. Of the tests marked SKIP, there are
> 30 tests that are currently counted as SKIP because they require
> sudo permissions, and another 21 that require membership in
> multiple user groups. It is important to know that coreutils has
> tests for both root and non-root users. Testing showed that 42
> tests are skipped when running as root versus 30 when running as a
> non-root user, so the decision was made to run the suite as the
> latter. Additionally, gdb, valgrind, and strace could be included
> in the RDEPENDS list to increase pass rate, but their total
> contribution is 13 tests, so they were omitted to reduce image size.
>
> Finally, note that at least one ptest (misc/head-write-error.sh) is
> prone to ERROR on builds of core-image-minimal if extra space is
> not provided with IMAGE_ROOTFS_EXTRA_SPACE.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../coreutils/coreutils/run-ptest             | 17 ++++++++
>  meta/recipes-core/coreutils/coreutils_8.31.bb | 40 +++++++++++++++++++
>  2 files changed, 57 insertions(+)
>  create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest
>
> diff --git a/meta/recipes-core/coreutils/coreutils/run-ptest b/meta/recipes-core/coreutils/coreutils/run-ptest
> new file mode 100755
> index 0000000000..6d4a7b365d
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/run-ptest
> @@ -0,0 +1,17 @@
> +#!/bin/sh
> +
> +# remove any stale lock files so that the calls to groupadd/useradd don't stop
> +# the ptest if re-using the same image
> +rm -rf /etc/passwd.lock /etc/group.lock /etc/gshadow.lock
> +
> +COREUTILSLIB=@libdir@/coreutils
> +LOG="${COREUTILSLIB}/ptest/coreutils_ptest_$(date +%Y%m%d-%H%M%S).log"
> +USERNAME="tester"
> +groupadd ugroup1
> +groupadd ugroup2
> +useradd -G ugroup1,ugroup2 $USERNAME || echo "user $USERNAME already exists"
> +
> +su tester -c "cd ${COREUTILSLIB}/ptest && make check-TESTS top_srcdir=. srcdir=." 2>&1 | tee -a ${LOG}
> +userdel $USERNAME
> +groupdel ugroup1
> +groupdel ugroup2
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
> index 57b2c1bdba..cba0bfe15c 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://0001-uname-report-processor-and-hardware-correctly.patch \
>             file://disable-ls-output-quoting.patch \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
> +           file://run-ptest \
>            "
>
>  SRC_URI_append_libc-musl = "file://strtod_fix_clash_with_strtold.patch"
> @@ -143,3 +144,42 @@ python __anonymous() {
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +inherit ptest
> +
> +RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
> +

Adding libmodule-build-perl to rdeps here is pulling in whole target
toolchain components now while building core-image-minimal
the dependency chain looks like, total task building for this image are 3000+

"coreutils.do_package_qa" -> "libmodule-build-perl.do_packagedata" ->
"packagegroup-core-buildessential.do_packagedata" ->
"gcc.do_packagedata"

IMO, it's a bad experience for the user when building a simple minimal
image and it ends up building whole toolchain for target that
eventually won't even
be part of the image. perhaps make it dependent on ptest or some such
knob thats not commonly used.

Please revert this patch series until we can find a way to not insert
these build-time dependencies in normal flow.

> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
> +    sed -i 's/ginstall/install/g'  `grep -R ginstall ${D}${PTEST_PATH}/tests | awk -F: '{print $1}' | uniq`
> +    install -d ${D}${PTEST_PATH}/build-aux
> +    install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
> +    cp ${B}/Makefile ${D}${PTEST_PATH}/
> +    cp ${S}/init.cfg ${D}${PTEST_PATH}/
> +    cp -r ${B}/src ${D}${PTEST_PATH}/
> +    cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
> +    sed -i '/^VPATH/s/= .*$/= ./g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^PROGRAMS/s/^/#/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^Makefile: /s/^.*$/Makefile:/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^abs_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^abs_top_builddir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^abs_top_srcdir/s/= .*$/= \$\{PWD\}/g' ${D}${PTEST_PATH}/Makefile
> +    sed -i '/^built_programs/s/ginstall/install/g' ${D}${PTEST_PATH}/Makefile
> +    chmod -R 777 ${D}${PTEST_PATH}
> +
> +    # Disable subcase stty-pairs.sh, it will cause test framework hang
> +    sed -i '/stty-pairs.sh/d' ${D}${PTEST_PATH}/Makefile
> +
> +    # Disable subcase tail-2/assert.sh as it has issues on 32-bit systems
> +    sed -i '/assert.sh/d' ${D}${PTEST_PATH}/Makefile
> +
> +    # Tweak test d_type-check to use python3 instead of python
> +    sed -i "1s@.*@#!/usr/bin/python3@" ${D}${PTEST_PATH}/tests/d_type-check
> +    install ${B}/src/getlimits ${D}/${bindir}
> +
> +    # handle multilib
> +    sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
> +}
> +
> +FILES_${PN}-ptest += "${bindir}/getlimits"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
