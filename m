Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594E3C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 16:51:29 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.286.1748623886261044743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 09:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B2lg+Vcf;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e7da099de49so2163259276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 09:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748623885; x=1749228685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PivwCWmZkIoDLPExSMaN39SG4g0bI0w4FIV4w46nugs=;
        b=B2lg+Vcfar8VeaSs46h0C6Csi7q6EsI/C+nqFtM3shuyaA+MwAH6PTLerz+FNHL3CY
         /4z19lgyvqlOWxBDdz+4nJ2HFdn5eOU26OVDzozlAP7AcJlv9L4rnIaeE0re0fqfuZz6
         k22yR0hxFiQ/TrK/vPNhg6cfFB6xM/RHSUPuiB2Pq4ZLiYRE16uEICqYmVhVxeeKhsDY
         V2iN+JqguTLqWilEMzFGKnfmjPEjXhYByWu85zLjuD6SYCzT+Tg3ghWKE/I0I6rUNhor
         WWlp8eMX/vInX4rh52SGlYjhO6ixiv6LNf3sfk1VxWJ97PrCBsWQU1h7+K42HqCn3H3f
         bsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748623885; x=1749228685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PivwCWmZkIoDLPExSMaN39SG4g0bI0w4FIV4w46nugs=;
        b=eadj2al14lAJ7gbv/cuH7TDrq0lZ7CjMt2eInLaHKksoemoN251C9R2MAEO5kwa5Le
         Kqqb59yDJPYQAonROa5W858VLrrdIYNejoQXECoMXjjN3p+LLjKGA8ETE1u4NxPnr9jI
         g3po79/EOkEV2soJNsl+gDxDFXdjDdi7jRrHptB+jZpoTuKClSxkhc7B/69m6sgbhJY+
         51MT3RBwd9+BVUCWFeLmz3E1lo7ym0Nzrt0EZej8/ARSR78b6GqpoDQWHIFyNC+mbjWe
         fYKzxR3n5c/IOyBS6XoFQX08ASBs/czxOT6i2lXDLZ2prZxJBZHz99HRADVfZJGyyzqy
         rguA==
X-Gm-Message-State: AOJu0YyVWX+qgKFizXJ6lI0yyscOCb94YbYFg+jmdJq4cZRTtO3hSNxc
	q1yR4O+fNttF2aPRZQ10LfIGXIrl520HWnbxvIleWjSU6YKRocDjZGmp1hVJiaAPA4v8iGN3vgg
	kSZPKXgsIOY9N1MoHKyuuxjWgMt5Bc3+utoQv1tQw8tRLqL/WKOIYenU=
X-Gm-Gg: ASbGncueGxUfGeLTCnvFqnzlnwQ/EI+laNyBhll/n4vdfUu19ijheP5gVwKhOMj0VUF
	O7zxkMiWM8GNxdHggAdNOn30tLxy+vCKcgSHl3m3Dgz+6tQOSVI7sS1FoLNchtggd6ZUJYv+bsP
	Ti4l5bnnsk2nijyf6jkROa/TVya3TRnSjn4KeokEN8UZyf+680Bhl1gq78khij6kfmRn2TSzOxV
	MY=
X-Google-Smtp-Source: AGHT+IHn2s1RfUUGs6rlZAbMeHBUYFy2CYUAMDirZIU9Fq2tZeKKZ+1QLYUJHVUTbyhA1mUYHxMWhvQJUglxw95hmOk=
X-Received: by 2002:a05:6902:c0e:b0:e7d:9007:8685 with SMTP id
 3f1490d57ef6-e7f81f2db67mr5856309276.41.1748623885381; Fri, 30 May 2025
 09:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdY=1nEQsOXMAqzwQ30xHUmwdUkhNGQf0T_v8G1ZfJhadA@mail.gmail.com>
 <20250530071035.2805304-1-andrej.kozemcak@siemens.com>
In-Reply-To: <20250530071035.2805304-1-andrej.kozemcak@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 30 May 2025 09:51:12 -0700
X-Gm-Features: AX0GCFuPJFDjJ4HYxWtKu6RQRc-4mXU2lX6-o2j5dVh7ChSa83D7NwxkMJ3fIKs
Message-ID: <CAOSpxdYF4GyU9E55tCYe5jYY=sNLe6p5uEijt+57NXcg-d9OzQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] curl: add ptests
To: andrej.kozemcak@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 16:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217521

Unfortunately this is still failing autobuilder testing.

Here's a sample error log:

https://errors.yoctoproject.org/Errors/Details/856233/

Steve

On Fri, May 30, 2025 at 12:11=E2=80=AFAM Andrej Kozemcak via
lists.openembedded.org
<andrej.kozemcak=3Dsiemens.com@lists.openembedded.org> wrote:
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
>
> ---
> PATCH v2, list of changes:
> - fix warning: ptest-packagelists.inc [missing-ptest]
> - fix error: Nothing RPROVIDES 'locale-base-en-us'
> - can't reproduce errors: nothing provides perl-module*
>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-support/curl/curl/disable-tests  | 37 +++++++++++++++
>  meta/recipes-support/curl/curl/run-ptest      | 13 ++++++
>  meta/recipes-support/curl/curl_7.82.0.bb      | 45 ++++++++++++++++++-
>  4 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/curl/curl/disable-tests
>  create mode 100644 meta/recipes-support/curl/curl/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 5c6a30635f..21b42fba91 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -78,6 +78,7 @@ PTESTS_FAST:remove:riscv32 =3D "qemu-ptest"
>  PTESTS_PROBLEMS:append:riscv32 =3D " qemu-ptest"
>
>  PTESTS_SLOW =3D "\
> +    curl-ptest \
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
> index cda42da4d3..e10193140c 100644
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
> @@ -139,6 +141,47 @@ do_install:append:class-target() {
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
> +RDEPENDS:${PN}-ptest:append:libc-glibc =3D " \
> +    locale-base-en-us \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +       bash \
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
> View/Reply Online (#217468): https://lists.openembedded.org/g/openembedde=
d-core/message/217468
> Mute This Topic: https://lists.openembedded.org/mt/113375693/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

