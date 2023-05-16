Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 823CBC77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 08:35:11 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.17106.1684226106416985952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 01:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RJsH1Cu4;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so12459702e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684226104; x=1686818104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lDHVdkNItJgAv4LFNTmDRnfyZ0Eq+H+PeliAvlMfaAk=;
        b=RJsH1Cu4V59EjAMuuPwRy6Bm7vxePRFEz1IfWjVGgaWZM5tnKeONh723wgXz3OHPvf
         IdaXU0mD6ZgDFlPa7s5GrZuYS8e3NUSQd32ExvRx+s4RK0qwv7tJ1QOd/v+MInwPHAVB
         Q+NCij8Dgudg2z+0SLx6aAHbt96GP+nt1uOREiRcUQVwzKCFGNhDFu58dRUaXbgpZ/HO
         1auA4mnSSAUVGYtKFGojZy3iDjOxOSrlyDyD/3sw9hamuuRdJaAObcq9tIw5+NsA+LmN
         LfGBxeZp+CR6MunVwkKNA1azsoUACxbqX+xSV5CUZ321YFbASX0HBKHbGk+FyjWqw4Mx
         UKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684226104; x=1686818104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDHVdkNItJgAv4LFNTmDRnfyZ0Eq+H+PeliAvlMfaAk=;
        b=QmzBBfQne5Q/wNM6A+zZraDs8Ty1vOA96dxPn8I2uNHU7npOgfWcHZ8t39dDdvvZyf
         tSaN7ePz88iXqIRnask8h/IqtYl0c88lg8zzlxyL3rLSZzGvb1sxXU+tiSbxHernwoS4
         G1WEhPSUkiYYY7459AIeRTdcqk0wm9xUZ/P+vIm654sLu3cYoE+FMl4g1XJYfSEP1iGh
         /pjncwQ0V0RsQmdoe5n75du/7ekYpNPNm8aVrdlI1me0pqFkqhsM4NfvfNzw/zPXc2bB
         A2WU8AyGuJPOINKa3jwIoYlBbuPmszUfSVNkGF3EmtayLSQg3bAYazSuDS3zB8rPNt35
         eZsA==
X-Gm-Message-State: AC+VfDzuAuykXX6JO9aeiVt+i8vVpNGy+o+1X3SZcp6eNqjCGIvQBneS
	EyZTJmVcIB1Abe/mIFifACJHJPe06xle2xckRNP4kTxn
X-Google-Smtp-Source: ACHHUZ4hMJUsf0BRaC0gqBEv0gPPOrUvT4RWwPBBDoK8iM+i5JTRZTtas45kE5+OWaby/fWXbgcxfDbugha9aIB9N44=
X-Received: by 2002:ac2:597a:0:b0:4f0:441:71a4 with SMTP id
 h26-20020ac2597a000000b004f0044171a4mr6688172lfp.35.1684226104152; Tue, 16
 May 2023 01:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230516072737.2906265-1-chi.xu@windriver.com>
In-Reply-To: <20230516072737.2906265-1-chi.xu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 May 2023 10:34:52 +0200
Message-ID: <CANNYZj9ypPeM2CowaeZ-4-wNrTbnzqoO-+=KENiVZBzcsaQyWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] expect: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 08:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181402

The test will not be executed until added to PTESTS_FASTS or
PTESTS_SLOW, can you do that please?

Alex

On Tue, 16 May 2023 at 09:27, Chi Xu <chi.xu@eng.windriver.com> wrote:
>
> Test results:
> root@intel-x86-64:~# ptest-runner expect
> START: ptest-runner
> 2023-05-16T03:21
> BEGIN: /usr/lib64/expect/ptest
> via send_stdout
> PASS: cat-1.1
> PASS: expect-1.1
> PASS: expect-1.2
> PASS: expect-1.3
> PASS: expect-1.4
> PASS: expect-1.5
> PASS: expect-1.6
> PASS: expect-1.7
> PASS: expect-1.10
> PASS: expect-1.11
> PASS: expect-1.12
> PASS: expect-1.13
> PASS: expect-1.8
> PASS: expect-1.8b
> PASS: expect-1.9
> PASS: logfile-1.1
> PASS: pid-1.2
> PASS: pid-1.3
> PASS: pid-1.4
> PASS: pid-1.5
> PASS: send-1.1
> PASS: send-1.2
> PASS: spawn-1.1
> PASS: spawn-1.2
> PASS: spawn-1.3
> PASS: spawn-1.4
> PASS: spawn-1.5
> PASS: stty-1.1
> PASS: stty-1.2
> DURATION: 14
> END: /usr/lib64/expect/ptest
> 2023-05-16T03:21
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Chi Xu <chi.xu@windriver.com>
> ---
>  meta/recipes-devtools/expect/expect/run-ptest | 6 ++++++
>  meta/recipes-devtools/expect/expect_5.45.4.bb | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-devtools/expect/expect/run-ptest
>
> diff --git a/meta/recipes-devtools/expect/expect/run-ptest b/meta/recipes-devtools/expect/expect/run-ptest
> new file mode 100755
> index 0000000000..856c314eaf
> --- /dev/null
> +++ b/meta/recipes-devtools/expect/expect/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +
> +out_put=`tclsh tests/all.tcl -verbose bpse`
> +echo
> +echo "${out_put}" | awk '/PASSED|FAILED|SKIPPED/{gsub(/PASSED/,"PASS"); gsub(/FAILED/,"FAIL"); gsub(/SKIPPED/,"SKIP"); if ($NF=="PASS"){print $NF": "$(NF-1)}else{print $NF": "$2}}' | uniq
> +
> diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
> index 6cb46f334c..7b610b1ff2 100644
> --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=fbf2de7e9102505b1439db06fc36ce5c"
>  DEPENDS += "tcl"
>  RDEPENDS:${PN} = "tcl"
>
> -inherit autotools update-alternatives
> +inherit autotools update-alternatives ptest
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>             file://0001-configure.in.patch \
> @@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
>             file://0001-exp_main_sub.c-Use-PATH_MAX-for-path.patch \
>             file://0001-fixline1-fix-line-1.patch \
>             file://0001-Add-prototype-to-function-definitions.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[md5sum] = "00fce8de158422f5ccd2666512329bd2"
>  SRC_URI[sha256sum] = "49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34"
> @@ -44,6 +45,11 @@ do_install:append() {
>          sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
>  }
>
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}
> +    cp -r ${S}/tests ${D}${PTEST_PATH}
> +}
> +
>  # Apparently the public Tcl headers are only in /usr/include/tcl8.6
>  # when building for the target and nativesdk.
>  TCL_INCLUDE_PATH = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
> --
> 2.35.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181400): https://lists.openembedded.org/g/openembedded-core/message/181400
> Mute This Topic: https://lists.openembedded.org/mt/98921800/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

