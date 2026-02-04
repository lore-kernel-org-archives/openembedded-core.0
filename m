Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29ADFE9D3FD
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 15:15:08 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22729.1770218105218966172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 07:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQJCkzjB;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8948273f5d0so8801906d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 07:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770218104; cv=none;
        d=google.com; s=arc-20240605;
        b=fW2fosb1QPi839sGyq7uHAVRSm4aiXijSd5/LIPcZO3Kry864LRSCofoUd7kC/bCrS
         L/RSWqOsrjkBlK3euIEHpFjXL4i7C5HQcDfw6LbjaumU+di4Qm8xChrpx3E3lhLCRRbO
         X2JzI4vSdxkDDJHM2lxCOrv5pxQ4T3Kf+ElbTeQNa8w0Gucrwn9+0KMZYbGY1lRHOnAv
         GRIUFLxt7jQsFvnRd/stx/I5Fr9KoFjPvdLmqNLLogCmdOavhYba3FbIX8RT4rKvFadw
         4n+FfnqNNa70T2lcDdL1QWYqkTj8onM8HJ2JnNPc8jLnvXKxs94oJXO65w7uYwd9KvK9
         nbog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2O/Ast4Dzs1QR4Yf7Dv9azdIAlH1IwiuiIBes2iwraU=;
        fh=rDK7+x91CHcIiX01V7wPeYLtffnC7RIxro7bTdKIeWg=;
        b=KrcAryBrDLSo08EtJnZROTWyZq9Rnn5iZTw0EYtxB40XGHuH+pK6YqurQY/asdPhas
         YJMATrCKFA7PKhfDXM3GdgAV3KOWV9HXi5X/ZaMotfUND4XExvz/qLqhpkbZBGfx2v8o
         YkihsKvoCFtZZEzJeKktFujzjs00dkNEy7L7RjZP68lQzwtgiTHB1T+86bVGPlLhGiu7
         u0yODLSVQteuTPXUqlL3f7aV7pWPhYwzZNkACn2G2luNJ8jafX7gbFH5253dre2oDa4s
         yD/vHQn2n5VSyqOze8VsmFGCi+xNsyh8pimuXgdz6Cor1aAjv6kh/YBHv1gHpObVNn5/
         sPCw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770218104; x=1770822904; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O/Ast4Dzs1QR4Yf7Dv9azdIAlH1IwiuiIBes2iwraU=;
        b=hQJCkzjBt4wkzdXOhhpKm/Dmp8LG3L4DCQfdtRETtO2qwK1qrXCglybQxQNLj+4lXT
         hzvn0kL0HyPimhdyKU86mGe76f7UMma0TUkVcYeH/qgA9ovTNrI1QufpmXt2Yq1irjjg
         re5oCdYt3xZUfy1tdiZcFCQ+1jGfHiJNCYVeDCZ5UtgWw7Gg0P/R6xIL3/f84vgWFVgF
         o1oxVvaumyNJveUmTnj7D/6cE5mYt3k3+hUvfflANl5NiCn+i87Yx0YtEI45Y1iJ5AVh
         K1UgP8ETGTGjv2YbsgfiPX3/hM3BCGAProNFa/LzrFVgsCxD2yHQptZGNjcXBqwnL9NZ
         AYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218104; x=1770822904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2O/Ast4Dzs1QR4Yf7Dv9azdIAlH1IwiuiIBes2iwraU=;
        b=awTgVAhSPCSJYiPDOhhaw/8yWHsLj1NVkyBvr7rOU5In/0l3+jRbBkMyEaMo8YDZGn
         6pL3FgGQfTKhnN5zP68VL2FFr8B9Unx/pVdB0i8lU7WfGs4z0mCqbSDc2xPHJ4oUsIOw
         +TzCjpwCJClsNRDTCrJLjYASPn2SEIpeNFZYjSjQW1tcfqGw+ZudF5RTNwztwgOqVwjf
         EgRYg4qafVv5d+mo8t1YbTCyRzUCTgCcYQken3PTicZUvc59p8pFTaorreAZFv0W/lyu
         Ne2zPf0SMBW5iwYqDLCRfGsh3rK0SGHWXAZUsPrF5VF14VOypOkbCLl7J98Cc1HmrZ/c
         3NUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmm3Cly0L3cb0yYmGAvnFDPAsvLHWaHBupp7demkSZJPmJKAoCvmUk+z9Tn3vA0PHwKU248Ou8p7QHUhIs8YeCHQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLbnyFNGVp+AqhPH4DyRmgOmKmAG4eyiuEz7AFgEqGgpcdeViW
	P83kyyRq/XS1Ranh1TssOKOcgioDj0i6y/19fMF9RLf46hVpOGNj+s3/s4Ebexvz/+VHlTb49Lp
	f4E7yYPAjnFOouj2JQEOJOQull9NlyoU=
X-Gm-Gg: AZuq6aIfEU3TgStT+eZjQwb948pBjYqxkdr1nLJYDA57ohQNuHDK619wgIzLPkOD2xr
	i2MUWkfG6q8ifhj9lMhzlAZ4fb1ombkkLtd9qDXT7uLF4L1yl0ZYCZN9PkThzVsWydJb631Xg2n
	bP+fxqJCJC3/skTCGPYtjyBPX7GsHmFOVKKSFzrMQx8gMZQfe0DndtY0JQGIqtWlpGSdK0lH20F
	C/gWLLNe7j/OwvgDm8zvOjfge+SrtxaSVPa/2G4mPkUogCEPMcerzji30Ft1RcaWGfEPPx465tz
	bXPQYlRh4LTexqHryKKukHdc3HEHUw==
X-Received: by 2002:ad4:5bc9:0:b0:892:6763:3819 with SMTP id
 6a1803df08f44-89518381d2cmr95061506d6.24.1770218103970; Wed, 04 Feb 2026
 07:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20260128140635.43214-1-pratik.farkase@est.tech>
 <5f426a3e-4220-4274-b38b-e2bae5188cee@windriver.com> <DU2PPFB77F8FB197407E3ABBE614C6C569DFE9EA@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
 <CANNYZj8YBnBb1dnU0jVUB1VGhSZxRWsLjq6qnwB1apHsVtL7_w@mail.gmail.com> <GV2P189MB3005D914A2CCB8FA282C3B44FE98A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <GV2P189MB3005D914A2CCB8FA282C3B44FE98A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Feb 2026 16:14:52 +0100
X-Gm-Features: AZwV_QhBvFMfZ3n_cGqiy5NNhvtm9vwKYgj56j_AvgmXjUSaW9FPjtwkKkE61ng
Message-ID: <CANNYZj8E3-sucj4aqHh-OqzV0Z668aZ+YKUpLWccQboCEgNWHg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
To: Pratik Farkase <pratik.farkase@est.tech>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 15:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230543

I am struggling to see if there are any differences in v3 compared to
v2 though. Can you point them out please?

Alex

On Wed, 4 Feb 2026 at 16:12, Pratik Farkase <pratik.farkase@est.tech> wrote=
:
>
> Hi,
>
> Thanks for catching this error. I have sent a v3 separately.
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Wednesday, February 4, 2026 12:09 PM
> To: Pratik Farkase
> Cc: Randy MacLeod; openembedded-core@lists.openembedded.org; pratik.farka=
se@ericsson.com; Richard Purdie
> Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
>
> Unfortunately this was merged to master prematurely, and I just had to
> sent a revert:
>
> https://lists.openembedded.org/g/openembedded-core/message/230509
>
> Please address the issues and resend.
>
> Alex
>
>
> On Thu, 29 Jan 2026 at 09:33, Pratik Farkase via
> lists.openembedded.org
> <pratik.farkase=3Dest.tech@lists.openembedded.org> wrote:
> >
> > Hi Randy,
> >
> > Good catch! You're absolutely right - the bash dependency was unnecessa=
ry.
> >
> > I've removed the RDEPENDS on bash. Patch v2 is sent separately.
> >
> > Thanks for the review!
> >
> > Best Regards,
> > Pratik
> >
> > ________________________________________
> > From: Randy MacLeod <randy.macleod@windriver.com>
> > Sent: Thursday, January 29, 2026 1:26 AM
> > To: Pratik Farkase; openembedded-core@lists.openembedded.org
> > Cc: pratik.farkase@ericsson.com
> > Subject: Re: [OE-core][PATCH v1] libconfig: add ptest support
> >
> > Hi Pratik,
> >
> > On 2026-01-28 9:06 a.m., Pratik Farkase via lists.openembedded.org wrot=
e:
> >
> > Add ptest support to enable automated testing of libconfig
> > using ptest-runner.
> >
> > Nice, thanks.
> >
> >
> >
> > The implementation uses libtool --mode=3Dinstall to properly
> > install test binaries, avoiding issues with libtool wrapper
> > scripts. Tests are built via 'make check TESTS=3D' to compile
> > without running during the build phase.
> >
> > The test suite includes 16 tests covering parsing, formatting,
> > binary/hex values, escaped strings, and various edge cases.
> > All tests pass successfully on qemux86-64 :
> > START: ptest-runner
> > BEGIN: /usr/lib/libconfig/ptest
> > [TEST] ParsingAndFormatting
> > parsing testdata/input_0.cfg
> > parsing testdata/input_1.cfg
> > parsing testdata/input_2.cfg
> > parsing testdata/input_3.cfg
> > parsing testdata/input_4.cfg
> > parsing testdata/input_5.cfg
> > parsing testdata/input_6.cfg
> > parsing testdata/input_7.cfg
> > [ OK ] ParsingAndFormatting
> >
> > [TEST] ParseInvalidFiles
> > [ OK ] ParseInvalidFiles
> >
> > [TEST] ParseInvalidStrings
> > [ OK ] ParseInvalidStrings
> >
> > [TEST] BigInt1
> > [ OK ] BigInt1
> >
> > [TEST] BigInt2
> > [ OK ] BigInt2
> >
> > [TEST] BigInt3
> > [ OK ] BigInt3
> >
> > [TEST] BigInt4
> > [ OK ] BigInt4
> >
> > [TEST] BigInt5
> > [ OK ] BigInt5
> >
> > [TEST] BigInt6
> > [ OK ] BigInt6
> >
> > [TEST] BigInt7
> > [ OK ] BigInt7
> >
> > [TEST] RemoveSetting
> > [ OK ] RemoveSetting
> >
> > [TEST] EscapedStrings
> > [ OK ] EscapedStrings
> >
> > [TEST] OverrideSetting
> > [ OK ] OverrideSetting
> >
> > [TEST] SettingLookups
> > [ OK ] SettingLookups
> >
> > [TEST] ReadStream
> > [ OK ] ReadStream
> >
> > [TEST] BinaryAndHex
> > some auto big hex: 4294967296
> > some auto big bin: 8589934591
> > negativehex: -1430532899
> > [ OK ] BinaryAndHex
> >
> > 16 tests; 16 passed, 0 failed
> > PASS: libconfig_tests
> > DURATION: 0
> > END: /usr/lib/libconfig/ptest
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Change-Id: Ibd69ccd63ce0168571d46a199c08be59ea748d69
> > Signed-off-by: Pratik Farkase <pratik.farkase@est.tech><mailto:pratik.f=
arkase@est.tech>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  .../libconfig/libconfig/run-ptest             | 16 ++++++++++++++
> >  .../libconfig/libconfig_1.8.2.bb              | 21 ++++++++++++++++++-
> >  3 files changed, 37 insertions(+), 1 deletion(-)
> >  create mode 100755 meta/recipes-extended/libconfig/libconfig/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
> > index 739995bcfe..7c5810f252 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -29,6 +29,7 @@ PTESTS_FAST =3D "\
> >      json-c \
> >      json-glib \
> >      libcheck \
> > +    libconfig \
> >      libconvert-asn1-perl \
> >      libexif \
> >      libgpg-error\
> > diff --git a/meta/recipes-extended/libconfig/libconfig/run-ptest b/meta=
/recipes-extended/libconfig/libconfig/run-ptest
> > new file mode 100755
> > index 0000000000..d81fcf4def
> > --- /dev/null
> > +++ b/meta/recipes-extended/libconfig/libconfig/run-ptest
> > @@ -0,0 +1,16 @@
> > +#!/bin/sh
> > +
> > +cd tests
> > +
> > +for t in libconfig_tests; do
> > +    if [ -x ./$t ]; then
> > +        ./$t
> > +        if [ $? -eq 0 ]; then
> > +            echo "PASS: $t"
> > +        else
> > +            echo "FAIL: $t"
> > +        fi
> > +    else
> > +        echo "SKIP: $t"
> > +    fi
> > +done
> > diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb b/meta/=
recipes-extended/libconfig/libconfig_1.8.2.bb
> > index 6e08a7b04b..9ae0ce2e6e 100644
> > --- a/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> > +++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
> > @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D17c8e32f=
0f72580cc2906b409d46b5ac"<file://COPYING.LIB;md5=3D17c8e32f0f72580cc2906b40=
9d46b5ac>
> >
> >  SRC_URI =3D " \
> >      git://github.com/hyperrealm/libconfig.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV} \
> > +    file://run-ptest \
> >  "
> >  SRCREV =3D "a42cb47c1526a4f2ed025fcbb2289863375bc898"
> >
> > @@ -17,7 +18,7 @@ DEPENDS +=3D "bison-native flex-native"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "^v(?P<pver>\d+(\.\d+)+)$"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig ptest
> >
> >  PACKAGE_BEFORE_PN =3D "${PN}++"
> >  FILES:${PN}++ =3D "${libdir}/${BPN}++*${SOLIBS}"
> > @@ -27,3 +28,21 @@ do_compile:prepend() {
> >      rm -f ${S}/lib/grammar.[ch]
> >      rm -f ${S}/lib/scanner.[ch]
> >  }
> > +
> > +do_compile_ptest() {
> > +    oe_runmake -C tests check TESTS=3D
> > +}
> > +
> > +do_install_ptest() {
> > +    install -d ${D}${PTEST_PATH}/tests
> > +
> > +    if [ -f ${B}/tests/libconfig_tests ]; then
> > +        libtool --mode=3Dinstall install -m 0755 ${B}/tests/libconfig_=
tests ${D}${PTEST_PATH}/tests/libconfig_tests
> > +    fi
> > +
> > +    if [ -d ${S}/tests/testdata ]; then
> > +        cp -r ${S}/tests/testdata ${D}${PTEST_PATH}/tests/
> > +    fi
> > +}
> > +
> > +RDEPENDS:${PN}-ptest +=3D "<mailto:@@-27,3+28,21@@do_compile:prepend()=
{rm-f${S}/lib/grammar.[ch]rm-f${S}/lib/scanner.[ch]}++do_compile_ptest(){+o=
e_runmake-CtestscheckTESTS=3D+}++do_install_ptest(){+install-d${D}${PTEST_P=
ATH}/tests++if[-f${B}/tests/libconfig_tests];then+libtool--mode=3Dinstallin=
stall-m0755${B}/tests/libconfig_tests${D}${PTEST_PATH}/tests/libconfig_test=
s+fi++if[-d${S}/tests/testdata];then+cp-r${S}/tests/testdata${D}${PTEST_PAT=
H}/tests/+fi+}++RDEPENDS:${PN}-ptest+=3D>bash"
> >
> > Why do you need bash rather than any posix shell?
> > We run the ptests in a minimal environment so if busybox shell works, p=
lease drop this.
> >
> > If not, please either remove the bash dependency or explain it in the c=
ommit log.
> >
> > Thanks,
> >
> > ../Randy
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#230125): https://lists.openembedded.org/g/openembed=
ded-core/message/230125
> > Mute This Topic: https://lists.openembedded.org/mt/117507676/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

