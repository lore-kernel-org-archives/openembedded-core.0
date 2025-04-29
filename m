Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C8DC369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 09:27:36 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.14618.1745918847877102711
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 02:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=meAb79fP;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c0e135e953so661392085a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745918847; x=1746523647; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1tN+aYTqkzd90B38tUvrKZNsll2q+whOxt3iWINf7wY=;
        b=meAb79fPJlBHqklHhK0OT1/ETYALVyDeLIlO3iCvuwWf+OrUYMETTqe1iDcPNU5A5d
         A32cHVMmf0bBi8YmnO3Sdcs60qFqUwxiBL7DMMS6lZeZntdhYtQBz36uiMEkA5zz9TMX
         0Yy8ienbmOjNWAmiidBHyJhOr4rH/xRQu/Btwc0ZXheOly+rdgVXdOTZvQ/CHCUpl/mo
         xOm+cCmALq53c4QO9B4EV+n5cVrIuZxdgeH+LNUldUJmO23vor+g00St2ctQx8bA54aA
         yNiSYtrL2jcU/rqcDc9gx78PxuaiP7fWrDoxabIM1RfKwD+RRzaDQ//vLIgvNu0QFzqv
         OSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918847; x=1746523647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tN+aYTqkzd90B38tUvrKZNsll2q+whOxt3iWINf7wY=;
        b=F8b32UY/ogj3wRknLhemal1vmHYbdUrocQawVYhmhNL3pzXf8AhhbPb/btkwWKL71u
         4nfvjbC8svdgCZb5dfgK5EeF7Up7foAeJkMyddmRk+NI5AXNk5zUp7HG9C9WYrnWXAZf
         mnhbyOcSllbtBjfiu6gKXy6nfG1oQUfm8RXiLj7sZTDAfrKVzUsJyneJQpCSHL9agngL
         TwC3GH63jEnTV7NyLYGgLO7jghxj0ZmhcMwN89DzBvFKeZXMHryMUmZgYeMZ/R7URGVU
         24rVz6ULYtk0/skEZVh68o17H9izUQO+naj+UuAt4+Xh9WtlD73Wi60wz93Dcm8Yy33h
         /A+w==
X-Gm-Message-State: AOJu0YzSNJIoTfDAIUC8z3wYksmIV8cCA+TGVcdkjmFAKs8FO6hcPNqY
	MlTPfm4LhWKT4TNOWo+5pM+SBvADAeximitwsWMtM2Fopb2+JP0oaMoS908aNIW8mVXQO6uusa6
	Lzth5ynAYRXhI2oRkGOdi47Y0nfA=
X-Gm-Gg: ASbGncui7P5n7AbwjgwEE8mxMNgCXHUNsVPXZPDck1aK1vsie1XVVyddRYjFrrioNs3
	iXKt9Xc9EmDO87Yuik0XGMlopgX6EckseaTb68DbGGKxu1msmFcz65oMcnQGtsgIoUlI67Sen4V
	di+2UtYFBgu+AZQk8q/CeO4VO0TLz6/rQMSYF3smguhAeBF6/a4kIZraag
X-Google-Smtp-Source: AGHT+IEE222zVBCBL4QJV4+wbfWrRmIPeGl89Fx9WnI/zk05WKM6FEGbBXrxZ9uyO1WyVXs4TI7SepJUoqeRDLn+ud4=
X-Received: by 2002:ad4:5ccf:0:b0:6e8:97d2:99a2 with SMTP id
 6a1803df08f44-6f4f27d8729mr25919076d6.39.1745918846809; Tue, 29 Apr 2025
 02:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250429073212.812860-1-semc.2042@gmail.com>
In-Reply-To: <20250429073212.812860-1-semc.2042@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Apr 2025 11:27:15 +0200
X-Gm-Features: ATxdqUEhX2L7dNmS5n1-hOUvL8eYk90ZDiPNCPS0sDgUIH6a_pp8jkNmtYwc74w
Message-ID: <CANNYZj-+Ug1=qCG-J_5-gNE1kFyskxF6L7iSYZKuSZ8u2Ty45w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] glibc-y2038-tests: remove
 glibc-y2038-tests_2.41.bb recipe
To: semc.2042@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 09:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215655

Looks good, thanks.

Alex

On Tue, 29 Apr 2025 at 09:32, rajmohan r via lists.openembedded.org
<semc.2042=gmail.com@lists.openembedded.org> wrote:
>
> This recipe takes longer time >20min when bitbake for package
> write stage. When cross-verified for longer time duration, found
> that do_check() stage taking 20min while other stages completes
> before 6min.
>
> This recipe gives only below two test binaries in the packages to
> test (ptest: glibc-y2038-tests):
>      io/ftwtest
>      io/ftwtest-time64
>
> The above test binaries are already included for testing in recipe
> glibc-testsuite_2.41.bb.
>
> It is by now well established that glibc itself works as it should,
> that all affected 32 bit targets are configured to use 64 bit time_t,
> and that any lingering y2038 issues are in components other than the c
> library, and usually come from C programming mistakes (e.g. storing
> timestamps in long). Maybe we can simply remove the recipe?
>
> Review comments for fixing above longer time duration ended up in
> removing this recipe as a proposal is below
> https://lists.openembedded.org/g/openembedded-core/topic/112188476#msg214636
>
> Removed lines having reference to glibc-y2038-tests in the files.
>
> Signed-off-by: rajmohan r <semc.2042@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |   1 -
>  .../distro/include/ptest-packagelists.inc     |   2 -
>  meta/conf/distro/include/time64.inc           |   2 -
>  .../glibc/glibc-y2038-tests_2.41.bb           | 107 ------------------
>  meta/recipes-core/glibc/glibc/run-ptest       |  37 ------
>  5 files changed, 149 deletions(-)
>  delete mode 100644 meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
>  delete mode 100755 meta/recipes-core/glibc/glibc/run-ptest
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 8065287c17..038203e1cf 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -216,7 +216,6 @@ RECIPE_MAINTAINER:pn-glibc = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-glibc-y2038-tests = "Lukasz Majewski <lukma@denx.de>"
>  RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index f3fdededf6..9fb3332384 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -86,8 +86,6 @@ PTESTS_FAST = "\
>      xz \
>      zlib \
>  "
> -PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
> -PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
>  PTESTS_FAST:remove:mips64 = "qemu"
>  PTESTS_PROBLEMS:append:mips64 = " qemu"
>  PTESTS_FAST:remove:riscv32 = "qemu"
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
> index 5122e2a122..24a81c83f1 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -20,7 +20,6 @@ TARGET_CC_ARCH:append:powerpc = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '$
>  TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
>
>  GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
> -GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests = ""
>  GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
>  # pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
>  # both 32 and 64 bit file APIs.  But it does not handle the time side?
> @@ -33,7 +32,6 @@ GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
>  # Caused by the flags exceptions above
>  INSANE_SKIP:append:pn-gcc-sanitizers = " 32bit-time"
>  INSANE_SKIP:append:pn-glibc = " 32bit-time"
> -INSANE_SKIP:append:pn-glibc-y2038-tests = " 32bit-time"
>
>  # Strace has tests that call 32 bit API directly, which is fair enough, e.g.
>  # /usr/lib/strace/ptest/tests/ioctl_termios uses 32-bit api 'ioctl'
> diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
> deleted file mode 100644
> index 9ea09a4e12..0000000000
> --- a/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -require glibc_${PV}.bb
> -require glibc-tests.inc
> -
> -inherit ptest features_check
> -REQUIRED_DISTRO_FEATURES = "ptest"
> -
> -SRC_URI += "\
> -       file://run-ptest \
> -"
> -
> -SUMMARY = "glibc tests using time32/time64 interfaces to be run with ptest for the purpose of checking y2038 compatiblity"
> -
> -# Erase some variables already set by glibc_${PV}
> -python __anonymous() {
> -       # Remove packages provided by glibc build, we only need a subset of them
> -       d.setVar("PACKAGES", "${PN} ${PN}-dbg ${PN}-ptest")
> -
> -       d.setVar("PROVIDES", "${PN} ${PN}-ptest")
> -
> -       bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
> -       d.setVar("BBCLASSEXTEND", bbclassextend)
> -       d.setVar("RRECOMMENDS", "")
> -       d.setVar("SYSTEMD_SERVICE:nscd", "")
> -       d.setVar("SYSTEMD_PACKAGES", "")
> -}
> -
> -# Remove any leftovers from original glibc recipe
> -RPROVIDES:${PN} = "${PN}"
> -RRECOMMENDS:${PN} = ""
> -RDEPENDS:${PN} = "glibc libgcc sed bash"
> -RDEPENDS:${PN}-ptest = "${PN}"
> -DEPENDS += "sed"
> -
> -export oe_srcdir = "${exec_prefix}/src/debug/glibc/${PV}/"
> -
> -# Just build tests for target - do not run them
> -do_check:append () {
> -       oe_runmake -i check run-built-tests=no
> -}
> -addtask do_check after do_compile before do_install_ptest_base
> -
> -glibc_strip_build_directory () {
> -       # Delete all non executable files from build directory
> -       find ${B} ! -executable -type f -delete
> -
> -       # Remove build dynamic libraries and links to them as
> -       # those are already installed in the target device
> -       find ${B} -type f -name "*.so" -delete
> -       find ${B} -type l -name "*.so*" -delete
> -
> -       # Remove headers (installed with glibc)
> -       find ${B} -type f -name "*.h" -delete
> -
> -       find ${B} -type f -name "isomac" -delete
> -       find ${B} -type f -name "annexc" -delete
> -}
> -
> -do_install_ptest_base () {
> -       glibc_strip_build_directory
> -
> -       ls -r ${B}/*/*-time64 > ${B}/tst_time64
> -
> -       # Remove '-time64' suffix - those tests are also time related
> -       sed -e "s/-time64$//" ${B}/tst_time64 > ${B}/tst_time_tmp
> -       tst_time=$(cat ${B}/tst_time_tmp ${B}/tst_time64)
> -
> -       rm ${B}/tst_time_tmp ${B}/tst_time64
> -       echo "${tst_time}"
> -
> -       # Install build test programs to the image
> -       install -d ${D}${PTEST_PATH}/tests/glibc-ptest/
> -
> -       for f in "${tst_time}"
> -       do
> -           cp -r ${f} ${D}${PTEST_PATH}/tests/glibc-ptest/
> -       done
> -
> -       install -d ${D}${PTEST_PATH}
> -       cp ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
> -
> -}
> -
> -# The datadir directory is required to allow core (and reused)
> -# glibc cleanup function to finish correctly, as this directory
> -# is not created for ptests
> -stash_locale_package_cleanup:prepend () {
> -       mkdir -p ${PKGD}${datadir}
> -}
> -
> -stash_locale_sysroot_cleanup:prepend () {
> -       mkdir -p ${SYSROOT_DESTDIR}${datadir}
> -}
> -
> -# Prevent the do_package() task to set 'libc6' prefix
> -# for glibc tests related packages
> -python populate_packages:prepend () {
> -    if d.getVar('DEBIAN_NAMES'):
> -        d.setVar('DEBIAN_NAMES', '')
> -}
> -
> -FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
> -
> -EXCLUDE_FROM_SHLIBS = "1"
> -
> -deltask do_stash_locale
> -do_install[noexec] = "1"
> -do_populate_sysroot[noexec] = "1"
> diff --git a/meta/recipes-core/glibc/glibc/run-ptest b/meta/recipes-core/glibc/glibc/run-ptest
> deleted file mode 100755
> index cb71c75682..0000000000
> --- a/meta/recipes-core/glibc/glibc/run-ptest
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -#!/bin/bash
> -# ptest script for glibc - to run time related tests to
> -# facilitate Y2038 validation
> -# Run with 'ptest-runner glibc-tests'
> -
> -output() {
> -  retcode=$?
> -  if [ $retcode -eq 0 ]
> -    then echo "PASS: $i"
> -  elif [ $retcode -eq 77 ]
> -    then echo "SKIP: $i"
> -  else echo "FAIL: $i"
> -  fi
> -}
> -
> -# Allow altering time on the target
> -export GLIBC_TEST_ALLOW_TIME_SETTING="1"
> -
> -tst_time64=$(ls -r ${PWD}/tests/glibc-ptest/*-time64)
> -
> -# Remove '-time64' suffix - those tests are also time
> -# related
> -tst_time_tmp=$(sed -e "s/-time64$//" <<< ${tst_time64})
> -
> -# Do not run tests supporting only 32 bit time
> -#for i in ${tst_time_tmp}
> -#do
> -#      $i >/dev/null 2>&1
> -#      output
> -#done
> -
> -# Run tests supporting only 64 bit time
> -for i in ${tst_time64}
> -do
> -       $i >/dev/null 2>&1
> -       output
> -done
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215651): https://lists.openembedded.org/g/openembedded-core/message/215651
> Mute This Topic: https://lists.openembedded.org/mt/112516177/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

