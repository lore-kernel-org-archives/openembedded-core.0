Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CFAC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 19:35:26 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.307.1748374518681654150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 12:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rf4aAb5v;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e733a6ff491so2946837276.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 12:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748374518; x=1748979318; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9df9wIScMkia6yc1RrbhUfaArjwT3jiQeaf6JufXt0=;
        b=Rf4aAb5vnqpcOH6TTACWD509beW4UqzLp4UY8XNcrXcCA40miXWaDlq73a5DnwUfr7
         HofPYZFOkG7wibwCLz8XMO5ZUby/9dvRLTIA8/+f00aRaJ6ah/IfqjNlB8qTi+kseRbd
         guvUlSdRqi3DO4HIXV3Kw1zSQrMWRhzt4h6JjNoJxxEL+bC2eBoJg+jPMMuKDKf9wwrZ
         KN8bap8YLRuZSlV6svVSE3LLzB4AfaOauwZ9M2oJUZEOIkJIaOzm4NnafK8F4URCcjXW
         SXjgTGBJbb7X8cc792bdiKjeJs0xGVQzaJ6Vwa6jhqLL1fnZdUmF2mNagKY/oFGbvzBj
         ZeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748374518; x=1748979318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9df9wIScMkia6yc1RrbhUfaArjwT3jiQeaf6JufXt0=;
        b=ZW2IlzcC0zLwCDt7xKhMINgdjAe2S5BZa98euYzbOZSpLF1aLxRjUl3JWO8uiOOrDY
         eIo6O//YGydjGjrtoepRFZwLU9OLN7tMyaHDwe/Yj1Sd4t7fZsyBcnOiiqb2vMhlwDaw
         uVDO7ope+5n87hhP0hQQ1Pmv8ymLrlDmEYbjzNqo5VB5x8UNke3EU++/qRpMVEptITko
         hgpJRNq30NcDgOwoMrhSNj3LpEB7D0louWwtZwSo7CP7nl3Jf7/c+06TSc9Rj5DZvGLL
         kl7EnbCwT7wrpS4+2qlnydk/ScOxj8Hf11AaAWXCgB4NkjcaaNkKMbpW/leBbHcRuCxH
         5D0A==
X-Gm-Message-State: AOJu0Yw8ZNn+hdECje4vcbVdjK/Nnw1aqQmNFR2gSZnYw/PThUHj7G9t
	/sPcYsTNHvXngCUet+E11su4O+pJ+UFro0Y6UZObsOJUcBRP2nuxy6Jyh01qC6l9yq4Nemlwc5i
	sOmdb77cR1kgIikjrgAX4rLtw2dhVHMzI5O/RKe8X8Q==
X-Gm-Gg: ASbGncukl+trzoRP+xFBvEsfro8dPyhQzDhefVpvDPqIgp/qTMIOPJGFd5MPztiY8AC
	wIvNVttE9SI4k1jZdq8yCWczShxkP4Lfxy6EQz+MpBbKVnJVQvPRPCYIEZMtyy69xGRmOZw4NeJ
	PEUHx35TFJrYapd+josNz+ZEqvHf0gxPt93EK6+OuZ4XxZwcj7eBdEw1pa9PBuMGauzDPJt1s4Z
	OA=
X-Google-Smtp-Source: AGHT+IG8bGkTePvr7sz8smhtjBeHQmbdmMCkR+zMHOJj+LGH5ia80YfF3d/Dmz2w1QVi3tguJneu3yxJ4SSTmIJNd4U=
X-Received: by 2002:a05:6902:72f:b0:e7d:c8eb:92f4 with SMTP id
 3f1490d57ef6-e7dc8eb9619mr4558689276.22.1748374517769; Tue, 27 May 2025
 12:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250526110524.3950351-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20250526110524.3950351-1-andrej.kozemcak@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 May 2025 12:35:06 -0700
X-Gm-Features: AX0GCFv5DU9PoNVrQ12KEOViak41dDf15qNhgHfA6k9DbFVed8yT2dLyqvswR94
Message-ID: <CAOSpxdY=1nEQsOXMAqzwQ30xHUmwdUkhNGQf0T_v8G1ZfJhadA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] curl: add ptests
To: andrej.kozemcak@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 19:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217321

This did not pass autobuilder testing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1671

While it looks like there were many warnings and failures, there is a
lot of repetition.

All the warnings seem to be of this type:

WARNING: curl-7.82.0-r0 do_package_qa: QA Issue: supports ptests but
is not included in oe-core's ptest-packagelists.inc [missing-ptest]

Below are a couple of examples of the errors encountered, you can
browse the above link to the build to see others):

Error:
 Problem: conflicting requests
  - nothing provides perl-module-b needed by curl-ptest-7.82.0-r0.x86_64_x3=
2
  - nothing provides perl-module-base needed by curl-ptest-7.82.0-r0.x86_64=
_x32
  - nothing provides perl-module-cwd needed by curl-ptest-7.82.0-r0.x86_64_=
x32
  - nothing provides perl-module-digest needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-digest-md5 needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-file-basename needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-file-spec needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-file-temp needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-io-socket needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-ipc-open2 needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-list-util needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-memoize needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-storable needed by
curl-ptest-7.82.0-r0.x86_64_x32
  - nothing provides perl-module-time-hires needed by
curl-ptest-7.82.0-r0.x86_64_x32


ERROR: Nothing RPROVIDES 'locale-base-en-us' (but
mc:musl:/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-s=
upport/curl/curl_7.82.0.bb
RDEPENDS on or otherwise requires it)

Can you address the issues in a V2?

Thanks!

Steve

On Mon, May 26, 2025 at 4:05=E2=80=AFAM Andrej Kozemcak via
lists.openembedded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
>
> Ptest was copy from scarthgap and then edit for kirkstone.
> For kirstone we disable this test (which is already failing in kirstone):
> - 418
> - 722
> and remove this tests (which not exist in kirstone):
> - 412
> - 413
> - 1478
> - 1477
> - 1222
> - 1279
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/curl/curl/disable-tests  | 37 ++++++++++++++++
>  meta/recipes-support/curl/curl/run-ptest      | 13 ++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      | 42 ++++++++++++++++++-
>  4 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/curl/curl/disable-tests
>  create mode 100644 meta/recipes-support/curl/curl/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 5c6a30635f..1471aba940 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -78,6 +78,7 @@ PTESTS_FAST:remove:riscv32 =3D "qemu-ptest"
>  PTESTS_PROBLEMS:append:riscv32 =3D " qemu-ptest"
>
>  PTESTS_SLOW =3D "\
> +    curl \
>      babeltrace-ptest \
>      babeltrace2-ptest \
>      busybox-ptest \
> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
> new file mode 100644
> index 0000000000..64d59d0d8e
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/disable-tests
> @@ -0,0 +1,37 @@
> +# Intermittently fails e.g. https://autobuilder.yocto.io/pub/non-release=
/20231220-28/testresults/qemux86-64-ptest/curl.log
> +# https://autobuilder.yocto.io/pub/non-release/20231220-27/testresults/q=
emux86-64-ptest/curl.log
> +337
> +# These CRL test (alt-avc) are failing
> +356
> +# These were failing kirkstone version when adding ptest
> +418
> +722
> +# These CRL tests are scanning docs
> +971
> +# Intermittently hangs e.g http://autobuilder.yocto.io/pub/non-release/2=
0231228-18/testresults/qemux86-64-ptest/curl.log
> +1091
> +# Intermittently hangs e.g https://autobuilder.yocto.io/pub/non-release/=
20231220-27/testresults/qemux86-64-ptest/curl.log
> +1096
> +# These CRL tests are scanning docs
> +1119
> +1132
> +1135
> +# These CRL tests are scanning headers
> +1167
> +# These CRL tests are scanning man pages
> +1139
> +1140
> +1173
> +1177
> +# This CRL test is looking for m4 files
> +1165
> +# This CRL test is looking for src files
> +1185
> +# These CRL tests need --libcurl option to be enabled
> +1400
> +1401
> +1402
> +1403
> +1404
> +1405
> +1465
> diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-supp=
ort/curl/curl/run-ptest
> new file mode 100644
> index 0000000000..5e8d90087a
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/run-ptest
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +# Run all tests, don't stop on first failure
> +# Don't use valgrind if it is found
> +# Use automake-style output
> +# Run four tests in parallel
> +# Print log output on failure
> +
> +# Don't run the flaky or timing dependent tests
> +# Until https://github.com/curl/curl/issues/13350 is resolved, don't run=
 FTP tests
> +./runtests.pl -a -n -am -p !flaky !timing-dependent !FTP
> diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-supp=
ort/curl/curl_7.82.0.bb
> index cda42da4d3..ecf6334fb1 100644
> --- a/meta/recipes-support/curl/curl_7.82.0.bb
> +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> @@ -10,6 +10,8 @@ LICENSE =3D "curl"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D190c514872597083303371684954f=
238"
>
>  SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
> +           file://run-ptest \
> +           file://disable-tests \
>             file://CVE-2022-22576.patch \
>             file://CVE-2022-27775.patch \
>             file://CVE-2022-27776.patch \
> @@ -74,7 +76,7 @@ CVE_CHECK_IGNORE +=3D "CVE-2023-42915"
>  # ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services =
causing a potential man in the middle attack
>  CVE_CHECK_IGNORE +=3D "CVE-2024-32928"
>
> -inherit autotools pkgconfig binconfig multilib_header
> +inherit autotools pkgconfig binconfig multilib_header ptest
>
>  # Entropy source for random PACKAGECONFIG option
>  RANDOM ?=3D "/dev/urandom"
> @@ -139,6 +141,44 @@ do_install:append:class-target() {
>             ${D}${bindir}/curl-config
>  }
>
> +do_compile_ptest() {
> +       oe_runmake -C ${B}/tests
> +}
> +
> +do_install_ptest() {
> +       cat  ${WORKDIR}/disable-tests >> ${S}/tests/data/DISABLED
> +       rm -f ${B}/tests/configurehelp.pm
> +       cp -rf ${B}/tests ${D}${PTEST_PATH}
> +        rm -f ${D}${PTEST_PATH}/tests/libtest/.libs/libhostname.la
> +        rm -f ${D}${PTEST_PATH}/tests/libtest/libhostname.la
> +        mv ${D}${PTEST_PATH}/tests/libtest/.libs/* ${D}${PTEST_PATH}/tes=
ts/libtest/
> +        mv ${D}${PTEST_PATH}/tests/libtest/libhostname.so ${D}${PTEST_PA=
TH}/tests/libtest/.libs/
> +       cp -rf ${S}/tests ${D}${PTEST_PATH}
> +       find ${D}${PTEST_PATH}/ -type f -name Makefile.am -o -name Makefi=
le.in -o -name Makefile -delete
> +       install -d ${D}${PTEST_PATH}/src
> +       ln -sf ${bindir}/curl   ${D}${PTEST_PATH}/src/curl
> +       cp -rf ${D}${bindir}/curl-config ${D}${PTEST_PATH}
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       bash \
> +       locale-base-en-us \
> +       perl-module-b \
> +       perl-module-base \
> +       perl-module-cwd \
> +       perl-module-digest \
> +       perl-module-digest-md5 \
> +       perl-module-file-basename \
> +       perl-module-file-spec \
> +       perl-module-file-temp \
> +       perl-module-io-socket \
> +       perl-module-ipc-open2 \
> +       perl-module-list-util \
> +       perl-module-memoize \
> +       perl-module-storable \
> +       perl-module-time-hires \
> +"
> +
>  PACKAGES =3D+ "lib${BPN}"
>
>  FILES:lib${BPN} =3D "${libdir}/lib*.so.*"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217266): https://lists.openembedded.org/g/openembedde=
d-core/message/217266
> Mute This Topic: https://lists.openembedded.org/mt/113307017/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

