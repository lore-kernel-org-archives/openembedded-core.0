Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4EBC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 18:00:40 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.43638.1707069637042023875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 10:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SzqiCWSj;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-218f4589f0cso1692985fac.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707069636; x=1707674436; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqVrHdFCZwbxDcEtd68C2h/ABntFxb0bx0vxjtrWSNI=;
        b=SzqiCWSjRoL3y/pcBzMa8qbCiXTEuJHjQYt8yf9/H44bmD1yA6IFI5ZyTWySfXsSKq
         8lgAeBRjyOJIRzAHij0fQeyhQVZsmY4un6G4D/PC/5AT2DbmT5R2Bd3O40hB2vg/hpFR
         1wiElsisy16YIM8DGGiHBPAV/K6vJxVgnaQuPqyjzSY9xWrfjrp302usx1X5JUNv9Cz2
         Khvz249rPMpeHxBIkyi8FHw35e2A497ZKVwdplrJZb7ewt06YIGmMfR51VoI6JTRSPFZ
         slKFg3X+VsFXldB8KKsmBKq8zb5aisB23FSOnkc/dRcwdEHtWErOTw2jq1bY+M6bSze/
         DfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707069636; x=1707674436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqVrHdFCZwbxDcEtd68C2h/ABntFxb0bx0vxjtrWSNI=;
        b=Ie3ZYuY6N3K7RueysVKtVA7QMOrGzl3TDvw4cOKMCJDl95bV9CRnw7YHVpygpAUwR9
         S//AR0BbQMh/YXOi21EIQeSot+k0y9zGQlgBA5IqAtTWCwd1Qc7L3kogc4JxhRVXDn8F
         w3RWvcYkAAjADDC4RipssXiuzQblewfqSDpgX8wfi4TXFzPnaurRWcA9eZEmQd4BDQ3T
         vHEHoSIJL6u3rnIAnU6iDfjdkEFlinFut818l7kpmRFIfYlGEsLev6eWccgclmOBKO8N
         xw+wf3RxrvFMbIt51oKEpH+oNgXPMn2av7XQunis88tXIutjZJSGfaVv5vCoOxwm3Fzz
         0S8w==
X-Gm-Message-State: AOJu0YwkYwlpnlyNJyoWHpbAoVgKNsv01JufD5UHG7dZKtyP+Jel75UM
	ru8qBjjedS4lEunmq1kZcm9nARzbuLoMgptoY9BIlvsvQeI20JOlm0PMM+2P0qidtqj2p5r8P3y
	o4H+cqv5VMqYezgqtzU9douqdUeY=
X-Google-Smtp-Source: AGHT+IGtUSK8NDnkb1uxMkFuppl8KgL6ZPxns5dqNa2dydL0edbTtlNZUqr7M+McMRPq/XMyO2PdRI7V1lKyYbrgeLM=
X-Received: by 2002:a05:6870:a44a:b0:218:7597:2018 with SMTP id
 n10-20020a056870a44a00b0021875972018mr5381192oal.16.1707069636219; Sun, 04
 Feb 2024 10:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20240130162049.2019289-1-raj.khem@gmail.com> <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
 <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com>
 <8fbde10440b97a7d1fae483c192b9d17c450124d.camel@linuxfoundation.org>
 <CANx9H-DzH90X_tYppX4QP4NO-b0EcfnJYTCrR7zynB23nCTuzg@mail.gmail.com>
 <d6d59a9f1a93d9805f2b80b70f0558f6d8e133bb.camel@linuxfoundation.org> <CANx9H-D+97bocuCA-eO078CZUd-58VXyW=3D4hGooiNfUhE5Sw@mail.gmail.com>
In-Reply-To: <CANx9H-D+97bocuCA-eO078CZUd-58VXyW=3D4hGooiNfUhE5Sw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Feb 2024 10:00:09 -0800
Message-ID: <CAMKF1srq+5WJ379C0xLxJ3HSvaC9M-RbdgvpA_d6+UzbBg-FAg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Move gdb pretty printer file to
 auto-load location
To: Tim Orling <ticotimo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Trevor Gamblin <tgamblin@baylibre.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 18:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194904

On Sun, Feb 4, 2024 at 8:37=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wrot=
e:
>
>
>
> On Sun, Feb 4, 2024 at 2:28=E2=80=AFAM Richard Purdie <richard.purdie@lin=
uxfoundation.org> wrote:
>>
>> On Sat, 2024-02-03 at 19:55 -0800, Tim Orling wrote:
>> >
>> >
>> > On Fri, Feb 2, 2024 at 11:53=E2=80=AFPM Richard Purdie <richard.purdie=
@linuxfoundation.org> wrote:
>> > > On Fri, 2024-02-02 at 16:23 -0800, Khem Raj wrote:
>> > > > On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie
>> > > > <richard.purdie@linuxfoundation.org> wrote:
>> > > > >
>> > > > > On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:
>> > > > > > When debugging a C++ program on target using libcstdc++, gdb d=
oes not
>> > > > > > find the pretty printer python support, this is because the in=
it file is
>> > > > > > installed into /usr/lib which is excluded from gdb's default l=
ist of
>> > > > > > directories to load config's from, where as defaults to load f=
rom
>> > > > > > datadir is still on, it therefore does not load this file
>> > > > > >
>> > > > > > warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loadi=
ng has been declined by your `auto-load safe-path' set to "$debugdir:$datad=
ir/auto-load".
>> > > > > >
>> > > > > > This leaves the libstdc++ pretty-printers disabled even though=
 added via
>> > > > > > IMAGE_INSTALL +=3D "gcc-runtime-dbg"
>> > > > > >
>> > > > > > Add missing runtime dependency on datetime python module for t=
he pretty
>> > > > > > printer to work/load successfully.
>> > > > > >
>> > > > > > Once the pretty-printer gdb file is moved out of libdir, it ma=
y become
>> > > > > > empty therefore delete it if its empty.
>> > > > > >
>> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > > > > ---
>> > > > > > v2: Fix build on mingw
>> > > > > >
>> > > > > >   meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
>> > > > > >   1 file changed, 8 insertions(+), 1 deletion(-)
>> > > > > >
>> > > > > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/=
recipes-devtools/gcc/gcc-runtime.inc
>> > > > > > index 64b6168ba76..004deb6e41f 100644
>> > > > > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > > > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > > > > @@ -85,6 +85,8 @@ do_install () {
>> > > > > >                cd ${B}/${TARGET_SYS}/$d/
>> > > > > >                oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B=
}/${TARGET_SYS}/$d/ install
>> > > > > >        done
>> > > > > > +     install -d ${D}${datadir}/gdb/auto-load/${libdir}
>> > > > > > +     mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/au=
to-load/${libdir}
>> > > > > >        if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include=
 ]; then
>> > > > > >                install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/=
include
>> > > > > >                mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/incl=
ude/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
>> > > > > > @@ -99,6 +101,9 @@ do_install () {
>> > > > > >        if [ -d ${D}${infodir} ]; then
>> > > > > >                rmdir --ignore-fail-on-non-empty -p ${D}${infod=
ir}
>> > > > > >        fi
>> > > > > > +     if [ -d ${D}${libdir} ]; then
>> > > > > > +             rmdir --ignore-fail-on-non-empty -p ${D}${libdir=
}
>> > > > > > +     fi
>> > > > > >   }
>> > > > > >
>> > > > > >   do_install:append:class-target () {
>> > > > > > @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D ""
>> > > > > >
>> > > > > >   # include python debugging scripts
>> > > > > >   FILES:${PN}-dbg +=3D "\
>> > > > > > -    ${libdir}/libstdc++.*-gdb.py \
>> > > > > >       ${datadir}/gcc-${BINV}/python/libstdcxx \
>> > > > > > +    ${datadir}/gdb/auto-load \
>> > > > > >   "
>> > > > > > +# Needed by libstdcxx pretty printer
>> > > > > > +RDEPENDS:${PN}-dbg +=3D "python3-datetime"
>> > > > > >
>> > > > > >   FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
>> > > > > >   SUMMARY:libg2c =3D "Companion runtime library for g77"
>> > > > >
>> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/6381/steps/14/logs/stdio
>> > > > >
>> > > > > Missing or unbuildable dependency chain was: ['selftest-ed',
>> > > > > 'virtual/x86_64-poky-linux-compilerlibs', 'python3-datetime', 'b=
ash']
>> > > > >
>> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/build=
s/8533
>> > > >
>> > > > Hmm, so I wonder if using RRECOMMEND is better here. Where is bash
>> > > > being pulled from ?
>> > >
>> > > bash appears to be a dependency of python3-datetime. I don't think a
>> > > RRECOMMEND will help unfortunately.
>> > >
>> >
>> >
>> > It seems to be required for tests/ (test_venv.py, test_subprocess.py a=
nd test_zipfile/test_core.py are the obvious ones)
>> > https://github.com/search?q=3Drepo%3Apython%2Fcpython+%28%22bash%22+OR=
+%22bash+required%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&type=3Dcode
>> >
>> > I didn=E2=80=99t see any hard requirement in Lib/datetime.py nor its t=
est cases. But searching on a phone can lead to missing things=E2=80=A6
>>
>> The dependency is definitely coming from the python3 tests.
>>
>> It looks like whilst the python3-ptest is conditional on enabling
>> ptests, the python3-tests package is not, and it is that which contains
>> the bash dependency.
>>
> So perhaps we should rework python3 recipe to package tests/ into -ptest?

if test package is pulling in bash and imposing it on non ptest builds
then it would be good to
fix that.

>
>>
>> Cheers,
>>
>> Richard
>>

