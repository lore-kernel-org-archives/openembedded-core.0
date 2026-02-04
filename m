Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F929E9537E
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 11:09:47 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18111.1770203383254088699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 03:09:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dabq6k0n;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a367a1dbbso103057186d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 03:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770203382; cv=none;
        d=google.com; s=arc-20240605;
        b=cg4r+UVDDW7Kr5Rip3x3e5lewWuhtKQo14N6Bj9idSNHRHJgiULHVUNXJHEspWy/iC
         znTaZyQ9gySjAc0pwMQZIoBBk+jnbWzYFb6/FUZgTv2uvTX8sLAL9XQXdXwtx75KBPXF
         h652/DmWf3Zg1s9glVfLhmXIAbXf0dzLlHQxA/X1NcuNvYO2vUKO/ty0sCObn9UEQEi9
         eeTyMC3P57SsFRMeZtYcEL6INYH0w56mxZGdsjzJQT9hT+9hSJxR4cO+ZloOfVNvGM53
         amSvE8XAcVuGdbEURJrSsZXRG3Z92tGN1XIfAg/l3VPFSOj73gX939EhUctyzQ6QKdOk
         F9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKPG3kU6FXeIinZ9IVtSzllTaa9aIxd7SBU1al1FiaQ=;
        fh=ugXoY1YvOBKmxJ8VXHF/VGO5dYXmaHFE13PRGAb+ZdY=;
        b=geF06irZD8N2An48CaEN6FsGENWqNd2HCgErKtbT4Stzg8Z9Uqvme1h1o2IJa304W5
         X2wM09uNRICi7ieXK0e4PI2N5C1fumzo59RbBLS85DSkzmKyepZq8g9L1Q8R9rJFmPaf
         3+rTXnQ8onZZswwkGyjH9LxQm7wjJ/UgBbYCfEsYkfLnnSdRaFdfbfm1gd3J/8FyryNS
         BqEsFXrnmFJjNvErPqVPs1gV2Yem7iX2uIGw0hHxjlTRD+XlcftSEF0I5XpOtP4Dbz1V
         PMB+GRi8s9m9oe9ENYpqzlaz0RgDnrzd6J1i0bYtzUS3aoC0XthzHIG7bzZBmGV8IC2t
         46Yw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770203382; x=1770808182; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKPG3kU6FXeIinZ9IVtSzllTaa9aIxd7SBU1al1FiaQ=;
        b=Dabq6k0nxWJ6RDAuksSu6zO9wQVORAbHga/L7BvMlHOsvAcaPNL5wLtPyxfWLKrjLE
         Umr/QUjQRFZzEKu2NO2VVRbp12Amacl9nlEcTXheBlkb+3Eym2ZA0hcFHhbjadhutfgk
         ibNpvJGmFR3u5AnOsiNRVBymRj9ZYMfTi6xCXWgnsoX3POLEyZ6MQQMF1Fzv+STNNRPs
         hwCwG/VPQ2y3gZav55MiDbs0PNOadyQGB1EXMs4k+Y2Acvqoa4l1vrFiq3etQ3nfnBd3
         iofZ4GOoz8G6Kty5kN1uQ+0Yu7TRqwqaEVobXoL4IDgpjtj5RUx5ho4CDzGPCT/BXGku
         7lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770203382; x=1770808182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YKPG3kU6FXeIinZ9IVtSzllTaa9aIxd7SBU1al1FiaQ=;
        b=Rr3C/DQWISKCmX64ydaPvIXvw452fCV8sUV5iLS5QBS0UgKRRh4jm9aT6Tnic43Qvf
         MYr2Iuptd85QjNQ4AN4kt3VHy/yuv3dRDOPj9ztPBeGasfgwvub51A0LR6dpO5wOmKAl
         kvsoYIrovFEztXYXZrBpDZW+DaJjMiAv23uuKD7nPRPEsge4GGGhT0+BY5mroP6axeR4
         EUJgmSp2nUE/tLkCj0YLGWKdoZHacbyk8Rzz58psa6NAbDYvMARmN4RaY3QBxIe7lBcG
         jPX4jIzzzD+yYLhcEPaTuX9oz03Va/OX+Vnwsu7pbkZLbmugOv8i9tP0UGCWUNDsLcN1
         TgaA==
X-Forwarded-Encrypted: i=1; AJvYcCX+MVu+KJKMsXZAoBNHqsGXxTjCZgXpg3u2BJNhFz9CRnuFV0hEnu9O9IhXDfIsvTJyPzSbYu1N9zl8NK88C+LvSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyrapc7J0lViBwPh3xL4RfV95LAJxdN6mhX2nXbiQ9kpuD5DZUx
	o99zjMJ2wTe1fVtIdNWdRlIF5/GxHRU7vJXXkHEpiAbrmChFhZxb/g8SxuH5YmHeSLYN1EGd8Ji
	A7X2frIENhQbWbQwVDlgbYa6AA9h4Cjo=
X-Gm-Gg: AZuq6aI/DPRZ5WueWXdCbeL32afU8Phy0dH/5C0on1CGS3flC/n6he4h6bSabfeCOFB
	T1XlVgLz+AqI3iQkrVtz7kh6XmXbYn6Ims1E9YBFtbPjjPstXH6mTjchnGkF67qiDV78X+FBd87
	DCFu85TWvcP/0OtbYEIj0qrCpprRH8ao12Gz8JMUQCjYJBWOI9ahqORoyukahRvwCAMOFPfrME0
	i8VY3+QT20WIHQT/HxrWMf6Qo88D/K6S088yHxs56jpv7k/sSnRH8yPVF5F5kjvD+VIJHk4ZP6N
	DPEZdHG3LiW4xgSFIq5yaWCi0vGHmTcspubE04BW
X-Received: by 2002:a05:6214:27ce:b0:894:7795:a56d with SMTP id
 6a1803df08f44-89522164c0bmr32527316d6.29.1770203382072; Wed, 04 Feb 2026
 03:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com> <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Feb 2026 12:09:30 +0100
X-Gm-Features: AZwV_QjPej01LN6_G4ujgKmW1Nx-Kf9jT-9IJZpJnhlJosnxNOk8aIbA5K36Rf0
Message-ID: <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
To: pratik.farkase@est.tech
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 11:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230510

Unfortunately this was merged to master prematurely, and I just had to
sent a revert:

https://lists.openembedded.org/g/openembedded-core/message/230509

Please address the issues and resend.

Alex


On Thu, 29 Jan 2026 at 09:33, Pratik Farkase via
lists.openembedded.org
<pratik.farkase=3Dest.tech@lists.openembedded.org> wrote:
>
> Hi Randy,
>
> Good catch! You're absolutely right - the bash dependency was unnecessary=
.
>
> I've removed the RDEPENDS on bash. Patch v2 is sent separately.
>
> Thanks for the review!
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Randy MacLeod <randy.macleod@windriver.com>
> Sent: Thursday, January 29, 2026 1:26 AM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org
> Cc: pratik.farkase@ericsson.com
> Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
>
> Hi Pratik,
>
> On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org wrote:
>
> Add ptest support to enable automated testing of libconfig
> using ptest-runner.
>
> Nice, thanks.
>
>
>
> The implementation uses libtool --mode=3Dinstall to properly
> install test binaries, avoiding issues with libtool wrapper
> scripts. Tests are built via 'make check TESTS=3D' to compile
> without running during the build phase.
>
> The test suite includes 16 tests covering parsing, formatting,
> binary/hex values, escaped strings, and various edge cases.
> All tests pass successfully on qemux86-64 :
> START: ptest-runner
> BEGIN: /usr/lib/libconfig/ptest
> [TEST] ParsingAndFormatting
> parsing testdata/input_0.cfg
> parsing testdata/input_1.cfg
> parsing testdata/input_2.cfg
> parsing testdata/input_3.cfg
> parsing testdata/input_4.cfg
> parsing testdata/input_5.cfg
> parsing testdata/input_6.cfg
> parsing testdata/input_7.cfg
> [ OK ] ParsingAndFormatting
>
> [TEST] ParseInvalidFiles
> [ OK ] ParseInvalidFiles
>
> [TEST] ParseInvalidStrings
> [ OK ] ParseInvalidStrings
>
> [TEST] BigInt1
> [ OK ] BigInt1
>
> [TEST] BigInt2
> [ OK ] BigInt2
>
> [TEST] BigInt3
> [ OK ] BigInt3
>
> [TEST] BigInt4
> [ OK ] BigInt4
>
> [TEST] BigInt5
> [ OK ] BigInt5
>
> [TEST] BigInt6
> [ OK ] BigInt6
>
> [TEST] BigInt7
> [ OK ] BigInt7
>
> [TEST] RemoveSetting
> [ OK ] RemoveSetting
>
> [TEST] EscapedStrings
> [ OK ] EscapedStrings
>
> [TEST] OverrideSetting
> [ OK ] OverrideSetting
>
> [TEST] SettingLookups
> [ OK ] SettingLookups
>
> [TEST] ReadStream
> [ OK ] ReadStream
>
> [TEST] BinaryAndHex
> some auto big hex: 4294967296
> some auto big bin: 8589934591
> negativehex: -1430532899
> [ OK ] BinaryAndHex
>
> 16 tests; 16 passed, 0 failed
> PASS: libconfig_tests
> DURATION: 0
> END: /usr/lib/libconfig/ptest
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech><mailto:pratik.far=
kase@est.tech>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
>  .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
>  3 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 739995bcfe..7c5810f252 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
>      json-c \
>      json-glib \
>      libcheck \
> +    libconfig \
>      libconvert-asn1-perl \
>      libexif \
>      libgpg-error\
> diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta/r=
ecipes-extended/libconfig/libconfig/run-ptest
> new file mode 100755
> index 0000000000..d81fcf4def
> --- /dev/null
> +++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +cd tests
> +
> +for t in libconfig_tests; do
> +    if [ -x ./$t ]; then
> +        ./$t
> +        if [ $? -eq 0 ]; then
> +            echo "PASS: $t"
> +        else
> +            echo "FAIL: $t"
> +        fi
> +    else
> +        echo "SKIP: $t"
> +    fi
> +done
> diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/re=
cipes-extended/libconfig/libconfig_1.8.2.bb
> index 6e08a7b04b..9ae0ce2e6e 100644
> --- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> +++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f0f=
72580cc2906b409d46b5ac"<file://COPYING.LIB;md5=3D17c8e32f0f72580cc2906b409d=
46b5ac>
>
>  SRC_URI =3D " \
>      git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=3D=
master;tag=3Dv${PV} \
> +    file://run-ptest \
>  "
>  SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
>
> @@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  PACKAGE_BEFORE_PN =3D "${PN}++"
>  FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
> @@ -27,3 +28,21 @@ do_compile:prepend() {
>      rm -f ${S}/lib/grammar.[ch]
>      rm -f ${S}/lib/scanner.[ch]
>  }
> +
> +do_compile_ptest() {
> +    oe_runmake -C tests check TESTS=3D
> +}
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/tests
> +
> +    if [ -f ${B}/tests/libconfig_tests ]; then
> +        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_te=
sts ${D}${PTEST_PATH}/tests/libconfig_tests
> +    fi
> +
> +    if [ -d ${S}/tests/testdata ]; then
> +        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
> +    fi
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "<mailto:@@-27,3+28,21@@do_compile:prepend(){r=
m-f${S}/lib/grammar.[ch]rm-f${S}/lib/scanner.[ch]}++do_compile_ptest(){+oe_=
runmake-CtestscheckTESTS=3D+}++do_install_ptest(){+install-d${D}${PTEST_PAT=
H}/tests++if[-f${B}/tests/libconfig_tests];then+libtool--mode=3Dinstallinst=
all-m0755${B}/tests/libconfig_tests${D}${PTEST_PATH}/tests/libconfig_tests+=
fi++if[-d${S}/tests/testdata];then+cp-r${S}/tests/testdata${D}${PTEST_PATH}=
/tests/+fi+}++RDEPENDS:${PN}-ptest+=3D>bash"
>
> Why do you need bash rather than any posix shell?
> We run the ptests in a minimal environment so if busybox shell works, ple=
ase drop this.
>
> If not, please either remove the bash dependency or explain it in the com=
mit log.
>
> Thanks,
>
> ../Randy
>
>
>
>
>
>
>
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230125): https://lists.openembedded.org/g/openembedde=
d-core/message/230125
> Mute This Topic: https://lists.openembedded.org/mt/117507676/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

