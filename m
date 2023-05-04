Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199C2C77B73
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 21:16:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.6768.1683235004311467833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 14:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bOPhIcHd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f4000ec74aso7544505e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683235002; x=1685827002;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEUhMH4AsgVz+CrNLroWJGWNqh8CpkW1pNX1AHojfCw=;
        b=bOPhIcHdRm1gvbK04cxAPm7FX1g1up8tqbvfMOhVDw7XvFGqrkM90RLEJCdz2jKyt/
         1uQdQI7ua2Wzhzj+dd+96qfPOJBrotbvq6Ls2fV4POPRI9je2YL1QYmgQNdRn42L9hdT
         1YHVv02q1/62jVJf7XkV+XrFjbSIRM8bkUtbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683235002; x=1685827002;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lEUhMH4AsgVz+CrNLroWJGWNqh8CpkW1pNX1AHojfCw=;
        b=KN4jylNAIHc8OF9ZQsG/Z2D3xFHe52wT1FDliToRivOD/MKgpBl8CIlvpxIxmL1IXc
         TTs/1bKsj5Ed9offfT9NSyu50Mqw3l6PSf8jMd43AuVWoYQl8io8Ng9Dmh1qZCdb17wc
         UiHQYIDrKq7+Zk45KkTlbQ/hO0ElCTiJyIsSFM9zGKej57D6LJKdG0yN/SC6SI1lwRxG
         8ODFwGZ5NWSDf8zHwUiL2ReDwAJgtIEZxT93m+63RdtJzIylcOXfmpwupW3ttcxlTyxn
         BpCOnoJ/ckOQyLCfFSpdGuT0+azgNTkZTvUAqRuokbxj88VHadE2rFGd9TztxzVgakNE
         Zq4g==
X-Gm-Message-State: AC+VfDzEutSvJOvzyi2If/JkmNpnZySPP22l9CdxMHtgpFp3R1quWiQk
	sl/USJ31aHf6lbwJ8Ca/JdOzNw==
X-Google-Smtp-Source: ACHHUZ7WM8uEbx9H12obNi7PT84sRefgowOhddYTimO2DXzTyFw8/ttps3Wyd8IQd1LuXVekGtAeEw==
X-Received: by 2002:a05:600c:ca:b0:3f1:7675:fb82 with SMTP id u10-20020a05600c00ca00b003f17675fb82mr611683wmm.10.1683235002528;
        Thu, 04 May 2023 14:16:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86? ([2001:8b0:aba:5f3c:aa1b:875d:4fc3:dd86])
        by smtp.gmail.com with ESMTPSA id e7-20020adfe387000000b003064088a94fsm257446wrm.16.2023.05.04.14.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 14:16:42 -0700 (PDT)
Message-ID: <6a5ca0bf10350375f568163e3be93dfeed266d6f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cpio: Run ptests under ptest user
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 04 May 2023 22:16:41 +0100
In-Reply-To: <20230429012900.872374-1-raj.khem@gmail.com>
References: <20230429012900.872374-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 21:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180887

On Fri, 2023-04-28 at 18:29 -0700, Khem Raj wrote:
> Running these tests under root user on musl works ok but it emits
> additional diagnostic
>=20
> cpio: dir: Cannot change ownership to uid 0, gid 0: Not supported
>=20
> Ideally its better to run this test suite under non-root user which
> is often how these are run. Moreover, tests work on musl as well.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-extended/cpio/cpio-2.13/run-ptest   |  9 +--------
>  .../cpio/cpio-2.13/{run-ptest =3D> test.sh}        |  0
>  meta/recipes-extended/cpio/cpio_2.13.bb          | 16 ++++++++++++++++
>  3 files changed, 17 insertions(+), 8 deletions(-)
>  mode change 100644 =3D> 100755 meta/recipes-extended/cpio/cpio-2.13/run-=
ptest
>  copy meta/recipes-extended/cpio/cpio-2.13/{run-ptest =3D> test.sh} (100%=
)
>=20
> diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipe=
s-extended/cpio/cpio-2.13/run-ptest
> old mode 100644
> new mode 100755
> index f027574e86..f35a756d6b
> --- a/meta/recipes-extended/cpio/cpio-2.13/run-ptest
> +++ b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
> @@ -1,10 +1,3 @@
>  #!/bin/sh
> =20
> -# Define cpio test work dir
> -WORKDIR=3D@PTEST_PATH@/tests/
> -
> -# Run test
> -cd ${WORKDIR}
> -./atconfig ./atlocal ./testsuite
> -
> -./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok=
]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected=
 failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAI=
LED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED=
 PASS.*//g'
> +su -c ./test.sh ptest
> diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipe=
s-extended/cpio/cpio-2.13/test.sh
> similarity index 100%
> copy from meta/recipes-extended/cpio/cpio-2.13/run-ptest
> copy to meta/recipes-extended/cpio/cpio-2.13/test.sh
> diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-exten=
ded/cpio/cpio_2.13.bb
> index df5e09cae8..943fa9b3ab 100644
> --- a/meta/recipes-extended/cpio/cpio_2.13.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.13.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>             file://0001-Use-__alignof__-with-clang.patch \
>             file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
>             file://run-ptest \
> +           file://test.sh \
>             "
> =20
>  SRC_URI[md5sum] =3D "389c5452d667c23b5eceb206f5000810"
> @@ -57,9 +58,24 @@ do_install_ptest() {
>      install --mode=3D755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
>      install --mode=3D755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
>      install --mode=3D755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
> +    install --mode=3D755 ${WORKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
>      sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
>  }
> =20
> +# ptest.bbclass currently chowns the ptest directory explicitly, so we n=
eed to
> +# change permission after that has happened so the ptest user can write =
a
> +# temporary directory.
> +do_install_ptest_base:append() {
> +    chgrp -R ptest ${D}${PTEST_PATH}/
> +    chmod -R g+w ${D}${PTEST_PATH}/
> +}
> +
> +# The tests need to run as a non-root user, so pull in the ptest user
> +DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED', '=
1', ' ptest-runner', '', d)}"
> +PACKAGE_WRITE_DEPS +=3D "ptest-runner"
> +
> +RDEPENDS:${PN}-ptest +=3D "ptest-runner"
> +
>  PACKAGES =3D+ "${PN}-rmt"
> =20
>  FILES:${PN}-rmt =3D "${sbindir}/rmt*"

This seems to break the ptests as it stops returning results:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5010

Cheers,

Richard


