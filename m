Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2020FEE3F2E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 06:13:10 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.14971.1694758388604231125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 23:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDYHUwjV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso2133489e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694758387; x=1695363187; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+LbY8VU7t0bDRioj8TN2QxbFTt3WLZQ57vFzbmpu4Ww=;
        b=iDYHUwjVo6ECoc185CB3xoyld4mRex5SwP9AO1ot/RdvPP1TY5zNmyZGowUVjDTxSK
         Zi4bc/nkAsrrwLpGyhRCtE40T7pSfoFnfXRpodcPLn5nftnouxO09NVg31z8ZNpCYiP+
         3A46jANGytVsCQ2eRZkTFoSRlTYVmUB4mhoxuAgT3DobEF1RlqSYHI+u3NCW2NP7bQ/X
         3DYTmoJK6P6MV593VICx+GU3CBHwH6X2V1MSe9B6zyuSUWR4H+ovuSVykJMuszAbtpfg
         nC46yGGFkDNZxVb34gRdUD6qu/E9mRPGI19p8TTrgbxzEqXcGj4IhpnQBJC1Zj92ggLI
         DipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694758387; x=1695363187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LbY8VU7t0bDRioj8TN2QxbFTt3WLZQ57vFzbmpu4Ww=;
        b=YDA65vyU6ZpyXa3R3RROw/Hsf1/aSsSbHOuVvehsjvD8/Dj8gY88mxvifgXO7kIrx0
         3CbxIO8czjCWK4zQ9K5xIpNfk9gB/RmL9m8kcsJkzq8+3ZzmabwV94Cz+bCFzIHnI6Qf
         /nPLQKeTPhsPdQKYfWJUCBNY933I5H3U6dZHfwM9NHK2x919g0PGoFSSwwaUpR+8QIU2
         dwWQF/LIwm216JpREOX9hf5UTWvAHzojoiOoivSguN2ds41vWI5tYzrwck0JN6kOXI79
         E1LdvEDXokDF7oKrYEPs1cTfyXgZ6IVzPddMV4WbvbUhhxSKYgeqgOUSWrlrMgH0odyW
         QQng==
X-Gm-Message-State: AOJu0YyqwFHGAWmQhGF/LTMsSvhSAEobypfas5zEriTH7IZ7HLn8c3If
	G6M26+zbgmA8nvWzXQZs+DyYPWxjeyCJWDFDhPM=
X-Google-Smtp-Source: AGHT+IEZ5LfLUEUYq3Cg5Mhk5Mw/FDnYApi/ATQSVSZquUV3FFXnPvtlSiwxt7mPKlzRytaEHZYEbhLU9BIl6I/fvb8=
X-Received: by 2002:a05:6512:1599:b0:501:b872:8c6c with SMTP id
 bp25-20020a056512159900b00501b8728c6cmr1353242lfb.27.1694758386262; Thu, 14
 Sep 2023 23:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <1694744803-2934-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1694744803-2934-1-git-send-email-qiutt@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Sep 2023 08:12:54 +0200
Message-ID: <CANNYZj8T8_iW0mh4ct1OX33cxihSE0O2bZOzG3ra1GTy08w-fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V3] tar: add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, 
	Yan Xinkuan <yanxk.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 06:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187652

I think there's expectation that the test prints at least one PASS:
marker, otherwise 'bitbake -c testimage core-image-ptest-tar' is going
to fail, even if running ptest-runner on the command line does not.
Can you please check how this command behaves?

If it does fail, you can modify run-ptest to print FAIL: tar if
something failed and PASS: tar if nothing did. './testsuite && echo
"PASS: tar" || echo "FAIL" tar" is the simplest.

Alex

On Fri, 15 Sept 2023 at 04:26, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
>
> From: Qiu Tingting <qiutt@fujitsu.com>
>
> Add a ptest for tar.
> - It is taking around 3m to execute with kvm, so added it to PTEST_SLOW.
> - It contains 244 cases.
> - It needs more fs space for test than normal.
> - Below is parts of the run log:
>     START: ptest-runner
>     2023-09-14T08:02
>     BEGIN: /usr/lib/tar/ptest
>     ## ------------------------ ##
>     ## GNU tar 1.35 test suite. ##
>     ## ------------------------ ##
>       1: tar version                                     ok
>       2: decompressing from stdin                        ok
>     ...
>     ## ------------- ##
>     ## Test results. ##
>     ## ------------- ##
>
>     200 tests were successful.
>     44 tests were skipped.
>     DURATION: 188
>     END: /usr/lib/tar/ptest
>     2023-09-14T08:05
>     STOP: ptest-runner
>     TOTAL: 1 FAIL: 0
>
> Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/images/core-image-ptest.bb  |  3 +++
>  meta/recipes-extended/tar/tar/run-ptest       | 10 +++++++
>  meta/recipes-extended/tar/tar_1.35.bb         | 27 +++++++++++++++++++
>  4 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-extended/tar/tar/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 9160103cb0..3df7c9e405 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -109,6 +109,7 @@ PTESTS_SLOW = "\
>      python3-cryptography \
>      python3 \
>      strace \
> +    tar \
>      tcl \
>      util-linux \
>      valgrind \
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> index b81ab7b7c8..b6f5c2fd60 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -24,6 +24,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm = "1524288"
>  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace = "1024288"
>  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>
> +# tar-ptest in particular needs more space
> +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
> +
>  # ptests need more memory than standard to avoid the OOM killer
>  QB_MEM = "-m 1024"
>  QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
> diff --git a/meta/recipes-extended/tar/tar/run-ptest b/meta/recipes-extended/tar/tar/run-ptest
> new file mode 100644
> index 0000000000..ad4dd334f7
> --- /dev/null
> +++ b/meta/recipes-extended/tar/tar/run-ptest
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +
> +# Define tar test work dir
> +WORKDIR=/usr/lib/tar/ptest/tests/
> +
> +# Run test
> +cd ${WORKDIR}
> +./atconfig ./atlocal ./testsuite
> +
> +./testsuite
> diff --git a/meta/recipes-extended/tar/tar_1.35.bb b/meta/recipes-extended/tar/tar_1.35.bb
> index 4dbd418b60..b3d22c3db9 100644
> --- a/meta/recipes-extended/tar/tar_1.35.bb
> +++ b/meta/recipes-extended/tar/tar_1.35.bb
> @@ -42,6 +42,33 @@ do_install:append:class-target() {
>      fi
>  }
>
> +# add for ptest support
> +SRC_URI += " \
> +    file://run-ptest \
> +"
> +
> +inherit ptest
> +
> +do_compile_ptest() {
> +    oe_runmake -C ${B}/gnu/ check
> +    oe_runmake -C ${B}/lib/ check
> +    oe_runmake -C ${B}/rmt/ check
> +    oe_runmake -C ${B}/src/ check
> +    oe_runmake -C ${B}/tests/ genfile checkseekhole ckmtime
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests/
> +    sed -i "/abs_/d" ${B}/tests/atconfig
> +    install --mode=755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
> +    sed -i "s%${B}/../tar-1.34.build-aux:%%g" ${B}/tests/atlocal
> +    install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${B}/tests/checkseekhole ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${B}/tests/ckmtime ${D}${PTEST_PATH}/tests/
> +    install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
> +}
> +
>  PACKAGES =+ "${PN}-rmt"
>
>  FILES:${PN}-rmt = "${sbindir}/rmt*"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187651): https://lists.openembedded.org/g/openembedded-core/message/187651
> Mute This Topic: https://lists.openembedded.org/mt/101372466/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

