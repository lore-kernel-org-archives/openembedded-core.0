Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39013CA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 21:40:56 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.2025.1758577249383751404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 14:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ljuu4rCR;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e96c48e7101so4040950276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758577248; x=1759182048; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzMa8sjqIuGP74kOTPnU1/edyOa7lgEY6U6KJSW3Snw=;
        b=Ljuu4rCRggw9Kv85dheT9f5C70Ey0fiwYb4aipSlHjgNzGsjV4X1eDaijLycrXYnGJ
         DF+16PU2q6sZ/py9tx4KciEZaQN+ak4vf/Hez3Q/4W6l36ETLKu4husqaduQBRERgXA6
         YHRBm3RUMmzTC310CkBSXnNgc3FBC7yAZvVjPWO962c7hR//Ps+SMJ+D22GEgz3c187O
         Ls+vrAPSydEBMgA31LpJgK6m4ov8be25+gXqp3fvWoYSl2O4bB7trQju94ynNfe4rKjH
         AlaMGH28rkRdNd5ttNJFykbkbBw+Irx+GSbxdEpMATZ2/RQ1o1vyJ+cLFnBt5npGMfkY
         jjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758577248; x=1759182048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzMa8sjqIuGP74kOTPnU1/edyOa7lgEY6U6KJSW3Snw=;
        b=A6fe7hmRWM9GbUxq2Q8BS/uX6MMrY4hPcp1mEbyA+oi7+q6eP4m888OCPs0/fHWtEa
         Wc0ANrBiTKbhsaGVdY7Mrjnxtf75C9ac65axJ0kMF7xkyCzCdHiC3twJc2hqPWBzhj5X
         fzj2ca08BNhTQDc5HqQefDyTlr0VUPnY0etmxeQmRpBZaMSWaj07zNztm3NiCRjcFUkC
         4MRMIVgsMUA1G2mNpKt6dz8pp20MfwwJTuQjCbK2VhtRAlTyExn+e2aav7pHd3LM5U+z
         w9c5suzxS0pGlvgf8GK/dDRns4BUIMjfF0IXBCddcIbFSln9K8VpAF1/fcrW11DTpd5I
         goLQ==
X-Gm-Message-State: AOJu0YwHPaoXgMkEieN2Te/kGSx9Ds9RRI+zhT8FZwFMsG4deW7rouMW
	AHfOd0bbQsMgC3hPt+oqGyB61Iq17QGSKRWA63aak+V/u9pEBK2yysDogtr3TKANU7T60yqxMVW
	mRnZdqQ712i3X07jioLoGuJbWSiVfZ1IubOH209YaXA==
X-Gm-Gg: ASbGncvb/qxusYLzzyiTuq0PSPc9qMmzHrKLtM+xTSZHg2H4JKR40jyfhFJIiJp/qXD
	EtK0Jg8WnPC8zPvNDhhYZC4F740bebC9XZHpuZvV9gM0q+wp+XDcwBqDXmtSsnwuvQboOlHEL3t
	+u8/qhjg64vbAXKC8reP4RZo1JnFlEtTuuRetjF5Q3nRuwXE+d/aRCexGcFnQlKWunxtgU0JP+a
	7i6NV+cKUcr0nqvvOTJgDfSLtwJxvk1MW+mcFE=
X-Google-Smtp-Source: AGHT+IG0aeaWmJjeED41iaAZpW1AOZhp0oyYYQEazb3ckPsi+Wuo7+vhcbg0i1q9Un8qHZCUEtk0sT3sATZFZ3QNWik=
X-Received: by 2002:a05:6902:20c7:b0:ea4:229:594f with SMTP id
 3f1490d57ef6-eb32de5e763mr315762276.6.1758577248415; Mon, 22 Sep 2025
 14:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250919114332.1505081-1-namanj1@kpit.com>
In-Reply-To: <20250919114332.1505081-1-namanj1@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 22 Sep 2025 14:40:36 -0700
X-Gm-Features: AS18NWBzm894M0Rr9BPvT-WUmpzZ6vA6IgVv9Jd3cj0NEpU2GO_dRsKQWSUWEAQ
Message-ID: <CAOSpxdayi3cn=BrVtKwfO_FXBZga59R4ZEtvStvnMOdyLhC4kg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libmd: add ptest for 'libmd'
To: nmjain23@gmail.com
Cc: openembedded-core@lists.openembedded.org, Virendra.Thakur@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 21:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223857

I'm seeing errors in autobuilder testing:

stdio: ERROR: libmd-1.1.0-r0 do_package_qa: QA Issue:
/usr/lib/libmd/ptest/test/sha2 contained in package libmd-ptest
requires /bin/bash, but no providers found in RDEPENDS:libmd-ptest?
[file-rdeps]
stdio: ERROR: libmd-1.1.0-r0 do_package_qa: Fatal QA errors were
found, failing task.
stdio: ERROR: Logfile of failure stored in:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/w=
ork/core2-64-poky-linux/libmd/1.1.0/temp/log.do_package_qa.2268695
stdio: ERROR: Task
(/srv/pokybuild/yocto-worker/reproducible/build/meta/recipes-support/libmd/=
libmd_1.1.0.bb:do_package_qa)
failed with exit code '1'
stdio: ERROR: libmd-1.1.0-r0 do_package_qa: QA Issue:
/usr/lib/libmd/ptest/test/sha2 contained in package libmd-ptest
requires /bin/bash, but no providers found in RDEPENDS:libmd-ptest?
[file-rdeps]
stdio: ERROR: libmd-1.1.0-r0 do_package_qa: Fatal QA errors were
found, failing task.
stdio: ERROR: Logfile of failure stored in:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/w=
ork/core2-64-poky-linux/libmd/1.1.0/temp/log.do_package_qa.2268695
stdio: ERROR: Task
(/srv/pokybuild/yocto-worker/reproducible/build/meta/recipes-support/libmd/=
libmd_1.1.0.bb:do_package_qa)
failed with exit code '1'
stdio: ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc;
OEQA_DEBUGGING_SAVED_OUTPUT=3D/srv/autobuilder/valkyrie.yocto.io/pub/repro-=
fail/
DISPLAY=3D:1 oe-selftest -r reproducible failed with exit code 1, see
errors above. (1758576888.2: 938.7)

Steve

On Fri, Sep 19, 2025 at 11:58=E2=80=AFAM Naman Jain via lists.openembedded.=
org
<nmjain23=3Dgmail.com@lists.openembedded.org> wrote:
>
> Adapt the compile 'test' phony target from Makefile and deploy as
> ptest for libmd.
> It takes less than 30seconds for ptest completion
>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
>  meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
>  3 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libmd/files/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 9950e46776..784176f579 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>      json-glib \
>      libconvert-asn1-perl \
>      libgpg-error\
> +    libmd\
>      libnl \
>      libpcre \
>      libssh2 \
> diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-su=
pport/libmd/files/run-ptest
> new file mode 100644
> index 0000000000..0c4a5f64ec
> --- /dev/null
> +++ b/meta/recipes-support/libmd/files/run-ptest
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +
> +cd test
> +status =3D 0
> +
> +for testbin in *; do
> +    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
> +        if "./$testbin"; then
> +            echo "PASS: $testbin"
> +        else
> +            echo "FAIL: $testbin"
> +            status=3D1
> +        fi
> +    fi
> +done
> +
> +return $status
> +
> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-sup=
port/libmd/libmd_1.1.0.bb
> index dc588a0f95..68a2ec7a16 100644
> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
> @@ -8,9 +8,26 @@ HOMEPAGE =3D "https://www.hadrons.org/software/libmd/"
>  LICENSE =3D "BSD-3-Clause & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a71f661d6e8b7812f9e=
1df"
>
> -SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz"
> +SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz \
> +          file://run-ptest \
> +"
>  SRC_URI[sha256sum] =3D "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f=
971f43b00776b332"
>
> -inherit autotools
> +inherit autotools ptest
> +
> +do_compile_ptest() {
> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
> +    oe_runmake check
> +}
> +
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    for bin in ${B}/test/*; do
> +        if [ -x "$bin" ]; then
> +            libtool --mode=3Dinstall install "$bin" ${D}${PTEST_PATH}/te=
st/$(basename "$bin")
> +        fi
> +    done
> +}
>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223770): https://lists.openembedded.org/g/openembedde=
d-core/message/223770
> Mute This Topic: https://lists.openembedded.org/mt/115333712/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

