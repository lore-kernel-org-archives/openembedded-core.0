Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EACC77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 12:27:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.29864.1685622435480932319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 05:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=B+zp+xYf;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so888956e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685622434; x=1688214434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ym46yysNePOeGr8RjiqtrioQjgX4bCH/OucHpZpeoo=;
        b=B+zp+xYfYziIeQ2DPQUb8o2DKFF/jN5wJkFJbIbKPa+eqHOAq8gvkGS1W7sYjgcYGC
         RBcI2nx+4M0DghamSVPpJSnuir5axfFLBBgFrC32+ShllIh+9lIV54DskOWqYyEMJAVW
         Wg2yOOu1zZSqj7TEiSXay470Zdo7ulLzirZb1pSYifnXVsiqNdweT/7xzkO77lGQKJ1T
         O8JiN1TLxSasI6EWHTgOT8wsyv7GKiApCXfGASxRVte3CVOxuYVOKTiPUm80SGLs/QT8
         Xj1GbQtxim7lNsqJC87sueO6KZeVNmUIlAwqYhu/V5OhhDDmiV2w9ww3wnJ+Ctr3eDL+
         ijDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685622434; x=1688214434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ym46yysNePOeGr8RjiqtrioQjgX4bCH/OucHpZpeoo=;
        b=iZjAqQh5/womysFczDWwyTEldkw0Z+M1Bn8ip3LUIzlGpJjCJYrOcnd/hGQpGmWTZn
         RhTfmLamWHfBidK7PZTBBOy8DaDDs8OYE/rkQN6hEdsRzL6qb3rmF58fOWf/cEfIFngx
         2vJ1cgw4TYro2pYdLLRpTZuXD/TfDPqxOqLpZ2m4q5FmDC60JVImrQgb5jz6Qo1z5gk/
         Vyxe/4kemGo1EZBVbCizB8pjpVBM++PFZmIHoUxfWjFewy19aMzGTEZzQN5xXzJYSbh2
         LALu1Q9viqSBT4ygj2+csdxulm+bShcErop6KAqTubbyiqhHbzJ3BEXOQiY5/B3lNMmS
         OVMw==
X-Gm-Message-State: AC+VfDxPa4a6PlcqoDvnkdZZquQpfH08aU5Aeqxawsq5+FueQEQnrCl5
	tmwwxBCn57qUhr9IYHR7jkbBCAzflTtZ/RaMQS0=
X-Google-Smtp-Source: ACHHUZ6gdIh2+nXevonTsQG4yjnUSpa8FXyMgXyOJ1eP1hVyue4hVVTfgHpMsB2lhjaVfX3ho6JkToAuD2lEoiS/z5A=
X-Received: by 2002:a05:6512:64:b0:4f4:eeb4:ba70 with SMTP id
 i4-20020a056512006400b004f4eeb4ba70mr1227174lfo.32.1685622433326; Thu, 01 Jun
 2023 05:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <1685608473-23856-1-git-send-email-duep.fnst@fujitsu.com>
In-Reply-To: <1685608473-23856-1-git-send-email-duep.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Jun 2023 14:27:01 +0200
Message-ID: <CANNYZj94YtwNShEtaBQU==pOobdGvU7ohH10GOz_Sis5f6hzDA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] xz: add ptest support
To: "duep.fnst@fujitsu.com" <duep.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, fnstml-fujitsuten@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 12:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182104

This is exactly the same as the first submission and does not resolve
my request to submit the patch to xz upstream.

Alex

On Thu, 1 Jun 2023 at 14:23, duep.fnst@fujitsu.com
<duep.fnst@fujitsu.com> wrote:
>
> From: duep <duep.fnst@fujitsu.com>
>
> Add a ptest for xz
>  - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
>  - It contains 11 test files:
>     test_bcj_exact_size test_block_header test_check test_filter_flags
>     test_hardware test_index test_index_hash test_lzip_decoder
>     test_memlimit test_stream_flags test_vli
>  - Below is part of the run log:
>     START: ptest-runner
>     2023-06-01T01:57
>     BEGIN:
>     /usr/lib/xz/ptest
>     === test_bcj_exact_size.c ===
>     PASS: test_exact_size
>     PASS: test_empty_block
>     ---
>     # TOTAL: 2
>     # PASS:  2
>     # SKIP:  0
>     # FAIL:  0
>     # ERROR: 0
>     === END ===
>     ...
>     === test_vli.c ===
>     PASS: test_lzma_vli_size
>     PASS: test_lzma_vli_encode
>     PASS: test_lzma_vli_decode
>     ---
>     # TOTAL: 3
>     # PASS:  3
>     # SKIP:  0
>     # FAIL:  0
>     # ERROR: 0
>     === END ===
>     DURATION: 0
>     END: /usr/lib/xz/ptest
>     2023-06-01T01:57
>     STOP: ptest-runner
>     TOTAL: 1 FAIL: 0
>  - The tests under xz requires /bin/bash
>
> Signed-off-by: duep <duep.fnst@fujitsu.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../xz/xz/0001-build-PROGRAMS.patch           | 20 ++++++++++++++++
>  meta/recipes-extended/xz/xz/run-ptest         |  5 ++++
>  meta/recipes-extended/xz/xz_5.4.1.bb          | 24 +++++++++++++++++--
>  4 files changed, 48 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch
>  create mode 100644 meta/recipes-extended/xz/xz/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index d60ebb38fc..9aa68c75ea 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -70,6 +70,7 @@ PTESTS_FAST = "\
>      sed \
>      slang \
>      wayland \
> +    xz \
>      zlib \
>  "
>  PTESTS_FAST:append:libc-glibc = " glibc-tests"
> diff --git a/meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch b/meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch
> new file mode 100644
> index 0000000000..f97a75030a
> --- /dev/null
> +++ b/meta/recipes-extended/xz/xz/0001-build-PROGRAMS.patch
> @@ -0,0 +1,20 @@
> +From: Du Erpei <duep.fnst@fujitsu.com>
> +Subject: [PATCH] tests/Makefile.am: add target of 'build-PROGRAMS'
> +
> +Add target 'build-PROGRAMS' to only compile the test set under
> +'/tests' and not run locally.
> +
> +Upstream-Status: Pending
> +
> +--- a/tests/Makefile.am        2023-01-12 00:51:42.000000000 +0800
> ++++ b/tests/Makefile.am        2023-05-30 14:49:34.507313644 +0800
> +@@ -74,6 +74,9 @@ if COND_SCRIPTS
> + TESTS += test_scripts.sh
> + endif
> +
> ++build-PROGRAMS: all-am
> ++      $(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
> ++
> + clean-local:
> +       -rm -f compress_generated_* \
> +               xzgrep_test_output xzgrep_test_1.xz xzgrep_test_2.xz
> diff --git a/meta/recipes-extended/xz/xz/run-ptest b/meta/recipes-extended/xz/xz/run-ptest
> new file mode 100644
> index 0000000000..ebde965d5c
> --- /dev/null
> +++ b/meta/recipes-extended/xz/xz/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +cd ./tests
> +for i in `ls test*`; do
> +       ./$i
> +done
> diff --git a/meta/recipes-extended/xz/xz_5.4.1.bb b/meta/recipes-extended/xz/xz_5.4.1.bb
> index 71bf4b540a..14808b1714 100644
> --- a/meta/recipes-extended/xz/xz_5.4.1.bb
> +++ b/meta/recipes-extended/xz/xz_5.4.1.bb
> @@ -24,13 +24,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
>                      file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
>                      "
>
> -SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz"
> +SRC_URI = "https://tukaani.org/xz/xz-${PV}.tar.gz \
> +           file://0001-build-PROGRAMS.patch \
> +           file://run-ptest"
>  SRC_URI[sha256sum] = "e4b0f81582efa155ccf27bb88275254a429d44968e488fc94b806f2a61cd3e22"
>  UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
>
>  CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
>
> -inherit autotools gettext
> +inherit autotools gettext ptest
>
>  PACKAGES =+ "liblzma"
>
> @@ -42,3 +44,21 @@ ALTERNATIVE:${PN} = "xz xzcat unxz \
>                       lzma lzcat unlzma"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_compile_ptest(){
> +       oe_runmake -C ${B}/tests/ build-PROGRAMS
> +}
> +
> +do_install_ptest(){
> +       install -d ${D}${PTEST_PATH}/tests/
> +       find ${B}/tests/ -type f -not -name "*.o" -not -name "Makefile" \
> +         -exec install --mode=755 {} ${D}${PTEST_PATH}/tests/ \;
> +
> +       install -d ${D}${PTEST_PATH}/tests/.libs/
> +       install --mode=755 ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/.libs/
> +
> +       install -d ${D}${PTEST_PATH}/tests/files/
> +       install --mode=755 ${S}/tests/files/* ${D}${PTEST_PATH}/tests/files/
> +}
> +
> +RDEPENDS:${PN}-ptest += "bash"
> --
> 2.25.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182103): https://lists.openembedded.org/g/openembedded-core/message/182103
> Mute This Topic: https://lists.openembedded.org/mt/99259960/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

