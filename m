Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F905C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:13:27 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.65271.1707145997530068966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lo714/Bz;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5100cb238bcso8138226e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 07:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707145996; x=1707750796; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtsUmdIuyXd5kihlydlX+wkUuIvuNK4HkkLzM5MhLeg=;
        b=Lo714/BzV15EpdM27X2MTdKBvZh6XONHqDI3/l49dwkj+f3D+cnvgJkxpb96HRV9y9
         ujtx2jzSs4c/VIhr00zUFqrnmMT65a0UD2+k5NvR+YKboI0gl1Q0GnBpt7myoKUofBzG
         uiB/8TGsMq1mGSshi4JZCk/oiDTRk6TNo68/6FqobgBfgg2wkCopfib5Ah/kPVPfVMoM
         LYiRId3O9OHXf+n+ZFK8fjfvPKMwKgszvN/1CWj3iHcpMFS/4Lh2PzD4QhAFfKuBx1Oe
         vZEMyeV6TtssEfOgbZNo86bfDsVxwftKzwkXa2i6s9q3DHt7FTnJhOZmOfJ1f6v37phU
         TUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707145996; x=1707750796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtsUmdIuyXd5kihlydlX+wkUuIvuNK4HkkLzM5MhLeg=;
        b=ha4hojluv0PK5jC53lC2Pf4C1TyDJ2tOeYhDQYZSNszmkrj7wGPrp35QeDvk5aYZh/
         kUXkRbCmu+C3lkRmz7YK/3cv1/BfeL+sXgkd1kvvCGwBtXZ/E1o62BC0/tQw4A3/9OKp
         mNlDvsu0ZykhG0slHofTiEQA1+pCZ6ktD9t3Vokx4+cB0aR2ymfFkb9HhdP4Fdc6I0eu
         qkbWJIjexbRNiesek4GNo4mlaXQ7TZ+9T6c9J03ElQmcCFX7kZEXmGs6sqJHfB1R4XKc
         CCapWzwYAglrm7K3OnpTS/rlC190FyNPCXTt14GowsJdvorQDoPcRQImW7y0fpH3c96l
         kReA==
X-Gm-Message-State: AOJu0YwTA/9xv260tkqKQ6G6CfGa2ZIQXr3kOSzhqAcihNn7y5FR1JDq
	V6NjJ5MbLC0W8TkpA64aqYK++oXIRxuEtPF+54aDDtawAhj4/x8szBxsDiTuJlsvT67CCf7w1vZ
	+MgUyBllg9vJzSd9hmjZWiIOFG4E=
X-Google-Smtp-Source: AGHT+IF0uCbbmZ3PVC+Qr6PaXiQYTIBAvQ3UgpKkFvYgHKkmM0941t9zGHeON+84elK6Nj9/LtnkKz9/+W4UEZtdLe0=
X-Received: by 2002:a05:6512:3b08:b0:510:293e:83b with SMTP id
 f8-20020a0565123b0800b00510293e083bmr7646784lfv.18.1707145995687; Mon, 05 Feb
 2024 07:13:15 -0800 (PST)
MIME-Version: 1.0
References: <20240126054820.1656852-1-chi.xu@windriver.com>
 <202402032123190b2cce93@mail.local> <DM4PR11MB5390667A281AA8148CD5A56A9A472@DM4PR11MB5390.namprd11.prod.outlook.com>
 <CAMSfU+6Yyj2B3X33Uo9VUrLhGziZNsaHCkeGBtDqbCZj1m5+rA@mail.gmail.com>
In-Reply-To: <CAMSfU+6Yyj2B3X33Uo9VUrLhGziZNsaHCkeGBtDqbCZj1m5+rA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Feb 2024 16:13:04 +0100
Message-ID: <CANNYZj852xpW+REJS_zaAxAgkiHAurHeXDsqvE6ijP2Va-FQdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Chi Xu <chi.xu@eng.windriver.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194949

I just sent two patches for this.

Alex

On Mon, 5 Feb 2024 at 07:39, Yoann Congal <yoann.congal@smile.fr> wrote:
>
> Hi,
>
> FYI, since the reproducibility problem only impact the RPM package, it mi=
ght be related to the problem noticed by Richard last night on IRC:
> [11:35:32 pm] <RP> kanavin: It looks like it runs file on the files withi=
n the archive but for some reason it isn't sorting that in the header, so p=
robably an unsorted directory listing somewhere
> [11:58:34 pm] <RP> kanavin: looking at package_rpm and it's os.walk, ther=
e is no sorting in there at all. I suspect that leads to non-determinstic o=
rdering of the files sections in the spec files and I suspect that in turn =
leads rpm to reorder headers
> (https://libera.irclog.whitequark.org/yocto/2024-02-04#35724802;)
>
> Le lun. 5 f=C3=A9vr. 2024 =C3=A0 07:10, Chi Xu <chi.xu@eng.windriver.com>=
 a =C3=A9crit :
>>
>> Hello,
>>
>> I'm checking this issue, but can not reproduce it on my host now.
>> I tried to build and rebuild xz-ptest on ubuntu 20.04 and ubuntu 22.04,
>> xz-ptest-5.4.5-r0.core2_64.rpm are same.
>> Do you have any suggestions?
>>
>> Ubuntu 20.04
>> root@localhost:/root$ git clone git://git.yoctoproject.org/poky
>> root@localhost:/root/poky$ cd poky
>> root@localhost:/root/poky$ source oe-init-build-env
>> root@localhost:/root/poky/build$ bitbake xz
>> root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5=
.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> -rw-r--r-- 2 root root 162489 Feb  5 13:27 tmp/work/core2-64-poky-linux/=
xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/=
deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> root@localhost:/root/poky/build$ bitbake -c cleansstate xz
>> root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5=
.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> -rw-r--r-- 2 root root 162489 Feb  5 13:32 tmp/work/core2-64-poky-linux/=
xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/=
deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>>
>> Ubuntu 22.04
>> root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5=
.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> -rw-r--r-- 2 root root 162489 Feb  5 13:56 tmp/work/core2-64-poky-linux/=
xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/=
deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> root@localhost:/root/poky/build$ bitbake -c cleansstate xz
>> root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5=
.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> -rw-r--r-- 2 root root 162489 Feb  5 13:59 tmp/work/core2-64-poky-linux/=
xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/=
5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>> b26fd0014d1c23f6e3d9bf8704137b82  tmp/work/core2-64-poky-linux/xz/5.4.5/=
deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm
>>
>> Thanks,
>> Chi
>>
>> > -----Original Message-----
>> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> > Sent: Sunday, February 4, 2024 5:23 AM
>> > To: Xu, Chi <Chi.Xu@windriver.com>
>> > Cc: openembedded-core@lists.openembedded.org
>> > Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support
>> >
>> > CAUTION: This email comes from a non Wind River email account!
>> > Do not click links or open attachments unless you recognize the sender=
 and
>> > know the content is safe.
>> >
>> > Hello,
>> >
>> > I've had a reproducibility failure:
>> >
>> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240203-
>> > fdpg888c/packages/diff-html/
>> >
>> > On 26/01/2024 13:48:20+0800, Chi Xu wrote:
>> > > There are two types of cases: executables and POSIX shell scripts.
>> > > All test cases PASS.
>> > > Add xz-ptest to PTESTS_FAST because test duration less than 30s on
>> > > qemux86-64.
>> > >
>> > > root@qemux86-64:~# ptest-runner xz
>> > > START: ptest-runner
>> > > 2024-01-26T03:32
>> > > BEGIN: /usr/lib/xz/ptest
>> > > =3D=3D=3D test_bcj_exact_size.c =3D=3D=3D
>> > > PASS: test_exact_size
>> > > PASS: test_empty_block
>> > > ---
>> > > =3D=3D=3D END =3D=3D=3D
>> > > ...
>> > > =3D=3D=3D test_vli.c =3D=3D=3D
>> > > PASS: test_lzma_vli_size
>> > > PASS: test_lzma_vli_encode
>> > > PASS: test_lzma_vli_decode
>> > > ---
>> > > =3D=3D=3D END =3D=3D=3D
>> > > PASS: test_files.sh
>> > > PASS: test_scripts.sh
>> > > PASS: test_compress.sh
>> > > DURATION: 18
>> > > END: /usr/lib/xz/ptest
>> > > 2024-01-26T03:33
>> > > STOP: ptest-runner
>> > > TOTAL: 1 FAIL: 0
>> > >
>> > > Signed-off-by: Xu, Chi <chi.xu@windriver.com>
>> > > ---
>> > >  .../distro/include/ptest-packagelists.inc     |  1 +
>> > >  meta/recipes-extended/xz/xz/run-ptest         | 26 ++++++++++++++++=
+
>> > >  meta/recipes-extended/xz/xz_5.4.5.bb          | 28 ++++++++++++++++=
+--
>> > >  3 files changed, 53 insertions(+), 2 deletions(-)  create mode 1006=
44
>> > > meta/recipes-extended/xz/xz/run-ptest
>> > >
>> > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
>> > > b/meta/conf/distro/include/ptest-packagelists.inc
>> > > index a1643c5548..68a3f63a6a 100644
>> > > --- a/meta/conf/distro/include/ptest-packagelists.inc
>> > > +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> > > @@ -77,6 +77,7 @@ PTESTS_FAST =3D "\
>> > >      sed \
>> > >      slang \
>> > >      wayland \
>> > > +    xz \
>> > >      zlib \
>> > >      libexif \
>> > >  "
>> > > diff --git a/meta/recipes-extended/xz/xz/run-ptest
>> > > b/meta/recipes-extended/xz/xz/run-ptest
>> > > new file mode 100644
>> > > index 0000000000..cc8ba92016
>> > > --- /dev/null
>> > > +++ b/meta/recipes-extended/xz/xz/run-ptest
>> > > @@ -0,0 +1,26 @@
>> > > +#!/bin/bash
>> > > +
>> > > +ptestdir=3D$(dirname "$(readlink -f "$0")") cd "$ptestdir"/tests ||
>> > > +exit
>> > > +
>> > > +# executables test cases
>> > > +tests_exec=3D$(file $(ls test_*) | grep "ELF" | awk -F: '{print $1}=
')
>> > > +for i in ${tests_exec}; do
>> > > +    ./$i
>> > > +done
>> > > +
>> > > +# POSIX shell script test cases
>> > > +export srcdir=3D${ptestdir}/tests
>> > > +test_shell=3D"test_files.sh test_scripts.sh test_compress.sh"
>> > > +for j in ${test_shell}; do
>> > > +    if [ $j =3D=3D "test_compress.sh" ]; then
>> > > +        ./$j create_compress_files
>> > > +    else
>> > > +        ./$j
>> > > +    fi
>> > > +    if [ $? -eq 0 ]; then
>> > > +        echo "PASS: $j"
>> > > +    else
>> > > +        echo "FAIL: $j"
>> > > +    fi
>> > > +done
>> > > diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb
>> > > b/meta/recipes-extended/xz/xz_5.4.5.bb
>> > > index 09eade8be0..0f0849c3e5 100644
>> > > --- a/meta/recipes-extended/xz/xz_5.4.5.bb
>> > > +++ b/meta/recipes-extended/xz/xz_5.4.5.bb
>> > > @@ -24,13 +24,15 @@ LIC_FILES_CHKSUM =3D
>> > "file://COPYING;md5=3Dc8ea84ebe7b93cce676b54355dc6b2c0 \
>> > >
>> > file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd8=
4 \
>> > >                      "
>> > >
>> > > -SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz"
>> > > +SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz \
>> > > +           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-p=
test', '', d)} \
>> > > +          "
>> > >  SRC_URI[sha256sum] =3D
>> > "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d
>> > 6"
>> > >  UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
>> > >
>> > >  CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
>> > >
>> > > -inherit autotools gettext
>> > > +inherit autotools gettext ptest
>> > >
>> > >  PACKAGES =3D+ "liblzma"
>> > >
>> > > @@ -42,3 +44,25 @@ ALTERNATIVE:${PN} =3D "xz xzcat unxz \
>> > >                       lzma lzcat unlzma"
>> > >
>> > >  BBCLASSEXTEND =3D "native nativesdk"
>> > > +
>> > > +RDEPENDS:${PN}-ptest +=3D "bash file"
>> > > +
>> > > +do_compile_ptest() {
>> > > +        oe_runmake check TESTS=3D
>> > > +}
>> > > +
>> > > +do_install_ptest () {
>> > > +    install -d ${D}${PTEST_PATH}/tests
>> > > +    find ${B}/tests/.libs -type f -executable -exec cp {}
>> > ${D}${PTEST_PATH}/tests \;
>> > > +    cp ${B}/config.h ${D}${PTEST_PATH}
>> > > +    for i in files xzgrep_expected_output test_files.sh test_script=
s.sh
>> > test_compress.sh; do
>> > > +        cp -r ${S}/tests/$i ${D}${PTEST_PATH}/tests
>> > > +    done
>> > > +    mkdir -p ${D}${PTEST_PATH}/src/xz
>> > > +    ln -s ${bindir}/xz ${D}${PTEST_PATH}/src/xz/xz
>> > > +    mkdir -p ${D}${PTEST_PATH}/src/xzdec
>> > > +    ln -s ${bindir}/xzdec ${D}${PTEST_PATH}/src/xzdec/xzdec
>> > > +    mkdir -p ${D}${PTEST_PATH}/src/scripts
>> > > +    ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scripts/xzdiff
>> > > +    ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scripts/xzgrep
>> > > +}
>> > > --
>> > > 2.25.1
>> > >
>> >
>> > >
>> > >
>> > >
>> >
>> >
>> > --
>> > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
>> > engineering https://bootlin.com
>>
>>
>>
>
>
> --
> Yoann Congal
> Smile ECS - Tech expert
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194917): https://lists.openembedded.org/g/openembedde=
d-core/message/194917
> Mute This Topic: https://lists.openembedded.org/mt/103971280/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

