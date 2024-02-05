Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC261C48291
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 06:39:43 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.57448.1707115179999606317
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 22:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=mLCBhK6f;
 spf=pass (domain: smile.fr, ip: 209.85.167.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5111c7d40deso6642259e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 22:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707115177; x=1707719977; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gcjRgRxoe/HHO8eV7ikC17NXI8lmSzDkZIKoJaWITH4=;
        b=mLCBhK6fJ+VjthKyOCzLXYuzcmXQIkoGwdWCOcMkY14NNfGBrGDgHM7Tsw5hgbd2MH
         qoLhHM8j9tGmwbEXpMPGwQOGMBriFVSTFlnwUaJ6qZ6oZHLywP1EMzhJECSftBOXdsQN
         F9eY/IOz132My7+pca9GdQMKTj7LfAVV+qAvH/LzyVvpwQxesUE4m3DqkuoOSAGujsOM
         5D3PiDqQF7ZYJPBqv1L5ijkKADh3+N7mscW3B1BuQg2z9Y/21q0lFCWydYDgXM4TSVo8
         tyHDefd710YhmqsH4MS4QmG/nw6tii7Ra8fWJXAygAPM7RJPdFO7Q9dP4UJgyXmMuDpp
         uiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707115177; x=1707719977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcjRgRxoe/HHO8eV7ikC17NXI8lmSzDkZIKoJaWITH4=;
        b=PM+oqFRUnfTrPls3N/MsNiVUFajxVJ5dlyMg/vcXeeu9K8RXthLoOdhkZilyapcHGy
         /MjdeU1r234+qw5TrV1fLxbAhaA5awYI+dpLSBAdxfW77sbKFlMvWUScCa8+FBQB2Vdp
         bRjcuZTOjRl5eaujcRJzFVsF21Ta7m72nx0pT70V6MBFogGEPAl+OQ70nvX75MQnVTjf
         nF1MUTH3fuj2fUZdL++1YZNXLKm94axHQ0eq3JZGJhT2WiDsFB9ciMpCJvz+6Pbg2qXm
         4MqjA4/i+zxMF+SeMeDUC4kLgRpKYAPicEV6rT2+qIhp0GnbgWoXGXx5bsCtkTi/udz3
         0w8g==
X-Gm-Message-State: AOJu0Yzxt9h83KIsY93AEduNSrZlarbWvfECQdd8PtOGBSTyBKAIYZgG
	3ve9L2IxENTgSpykO9ywloRWcVR/Mj1Aku2ofmloyLZzDzr+hETwdUrQC0zqGgvKAZCsTbR5Kvm
	gYmhTBZiviIlAFqZmgWDh9F000FHMs0fBURiYBw==
X-Google-Smtp-Source: AGHT+IGu/RYqD1zIXQps9BS2FFtqAprmndmyN4LUky1mJ9TNH+d8m7LpPc8AWKcTEPZ6mSHeciDXJs+wNghqcpkwIk4=
X-Received: by 2002:ac2:55b7:0:b0:511:4b7d:bea5 with SMTP id
 y23-20020ac255b7000000b005114b7dbea5mr1789065lfg.6.1707115177179; Sun, 04 Feb
 2024 22:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20240126054820.1656852-1-chi.xu@windriver.com>
 <202402032123190b2cce93@mail.local> <DM4PR11MB5390667A281AA8148CD5A56A9A472@DM4PR11MB5390.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5390667A281AA8148CD5A56A9A472@DM4PR11MB5390.namprd11.prod.outlook.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Mon, 5 Feb 2024 07:39:11 +0100
Message-ID: <CAMSfU+6Yyj2B3X33Uo9VUrLhGziZNsaHCkeGBtDqbCZj1m5+rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support
To: Chi Xu <chi.xu@eng.windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ba144206109cb90a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 06:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194917

--000000000000ba144206109cb90a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

FYI, since the reproducibility problem only impact the RPM package, it
might be related to the problem noticed by Richard last night on IRC:
[11:35:32 pm] <RP> kanavin: It looks like it runs file on the files within
the archive but for some reason it isn't sorting that in the header, so
probably an unsorted directory listing somewhere
[11:58:34 pm] <RP> kanavin: looking at package_rpm and it's os.walk, there
is no sorting in there at all. I suspect that leads to non-determinstic
ordering of the files sections in the spec files and I suspect that in turn
leads rpm to reorder headers
(https://libera.irclog.whitequark.org/yocto/2024-02-04#35724802;)

Le lun. 5 f=C3=A9vr. 2024 =C3=A0 07:10, Chi Xu <chi.xu@eng.windriver.com> a=
 =C3=A9crit :

> Hello,
>
> I'm checking this issue, but can not reproduce it on my host now.
> I tried to build and rebuild xz-ptest on ubuntu 20.04 and ubuntu 22.04,
> xz-ptest-5.4.5-r0.core2_64.rpm are same.
> Do you have any suggestions?
>
> Ubuntu 20.04
> root@localhost:/root$ git clone git://git.yoctoproject.org/poky
> root@localhost:/root/poky$ cd poky
> root@localhost:/root/poky$ source oe-init-build-env
> root@localhost:/root/poky/build$ bitbake xz
> root@localhost:/root/poky/build$ ls -l
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> -rw-r--r-- 2 root root 162489 Feb  5 13:27
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> root@localhost:/root/poky/build$ md5sum
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> b26fd0014d1c23f6e3d9bf8704137b82
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> root@localhost:/root/poky/build$ bitbake -c cleansstate xz
> root@localhost:/root/poky/build$ ls -l
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> -rw-r--r-- 2 root root 162489 Feb  5 13:32
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> root@localhost:/root/poky/build$ md5sum
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> b26fd0014d1c23f6e3d9bf8704137b82
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
>
> Ubuntu 22.04
> root@localhost:/root/poky/build$ ls -l
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> -rw-r--r-- 2 root root 162489 Feb  5 13:56
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> root@localhost:/root/poky/build$ md5sum
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> b26fd0014d1c23f6e3d9bf8704137b82
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> root@localhost:/root/poky/build$ bitbake -c cleansstate xz
> root@localhost:/root/poky/build$ ls -l
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> -rw-r--r-- 2 root root 162489 Feb  5 13:59
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> root@localhost:/root/poky/build$ md5sum
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
> b26fd0014d1c23f6e3d9bf8704137b82
> tmp/work/core2-64-poky-linux/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5=
-r0.core2_64.rpm
>
> Thanks,
> Chi
>
> > -----Original Message-----
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Sent: Sunday, February 4, 2024 5:23 AM
> > To: Xu, Chi <Chi.Xu@windriver.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and
> > know the content is safe.
> >
> > Hello,
> >
> > I've had a reproducibility failure:
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240203-
> > fdpg888c/packages/diff-html/
> >
> > On 26/01/2024 13:48:20+0800, Chi Xu wrote:
> > > There are two types of cases: executables and POSIX shell scripts.
> > > All test cases PASS.
> > > Add xz-ptest to PTESTS_FAST because test duration less than 30s on
> > > qemux86-64.
> > >
> > > root@qemux86-64:~# ptest-runner xz
> > > START: ptest-runner
> > > 2024-01-26T03:32
> > > BEGIN: /usr/lib/xz/ptest
> > > =3D=3D=3D test_bcj_exact_size.c =3D=3D=3D
> > > PASS: test_exact_size
> > > PASS: test_empty_block
> > > ---
> > > =3D=3D=3D END =3D=3D=3D
> > > ...
> > > =3D=3D=3D test_vli.c =3D=3D=3D
> > > PASS: test_lzma_vli_size
> > > PASS: test_lzma_vli_encode
> > > PASS: test_lzma_vli_decode
> > > ---
> > > =3D=3D=3D END =3D=3D=3D
> > > PASS: test_files.sh
> > > PASS: test_scripts.sh
> > > PASS: test_compress.sh
> > > DURATION: 18
> > > END: /usr/lib/xz/ptest
> > > 2024-01-26T03:33
> > > STOP: ptest-runner
> > > TOTAL: 1 FAIL: 0
> > >
> > > Signed-off-by: Xu, Chi <chi.xu@windriver.com>
> > > ---
> > >  .../distro/include/ptest-packagelists.inc     |  1 +
> > >  meta/recipes-extended/xz/xz/run-ptest         | 26 +++++++++++++++++
> > >  meta/recipes-extended/xz/xz_5.4.5.bb          | 28
> +++++++++++++++++--
> > >  3 files changed, 53 insertions(+), 2 deletions(-)  create mode 10064=
4
> > > meta/recipes-extended/xz/xz/run-ptest
> > >
> > > diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> > > b/meta/conf/distro/include/ptest-packagelists.inc
> > > index a1643c5548..68a3f63a6a 100644
> > > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > > @@ -77,6 +77,7 @@ PTESTS_FAST =3D "\
> > >      sed \
> > >      slang \
> > >      wayland \
> > > +    xz \
> > >      zlib \
> > >      libexif \
> > >  "
> > > diff --git a/meta/recipes-extended/xz/xz/run-ptest
> > > b/meta/recipes-extended/xz/xz/run-ptest
> > > new file mode 100644
> > > index 0000000000..cc8ba92016
> > > --- /dev/null
> > > +++ b/meta/recipes-extended/xz/xz/run-ptest
> > > @@ -0,0 +1,26 @@
> > > +#!/bin/bash
> > > +
> > > +ptestdir=3D$(dirname "$(readlink -f "$0")") cd "$ptestdir"/tests ||
> > > +exit
> > > +
> > > +# executables test cases
> > > +tests_exec=3D$(file $(ls test_*) | grep "ELF" | awk -F: '{print $1}'=
)
> > > +for i in ${tests_exec}; do
> > > +    ./$i
> > > +done
> > > +
> > > +# POSIX shell script test cases
> > > +export srcdir=3D${ptestdir}/tests
> > > +test_shell=3D"test_files.sh test_scripts.sh test_compress.sh"
> > > +for j in ${test_shell}; do
> > > +    if [ $j =3D=3D "test_compress.sh" ]; then
> > > +        ./$j create_compress_files
> > > +    else
> > > +        ./$j
> > > +    fi
> > > +    if [ $? -eq 0 ]; then
> > > +        echo "PASS: $j"
> > > +    else
> > > +        echo "FAIL: $j"
> > > +    fi
> > > +done
> > > diff --git a/meta/recipes-extended/xz/xz_5.4.5.bb
> > > b/meta/recipes-extended/xz/xz_5.4.5.bb
> > > index 09eade8be0..0f0849c3e5 100644
> > > --- a/meta/recipes-extended/xz/xz_5.4.5.bb
> > > +++ b/meta/recipes-extended/xz/xz_5.4.5.bb
> > > @@ -24,13 +24,15 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dc8ea84ebe7b93cce676b54355dc6b2c0 \
> > >
> > file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84=
 \
> > >                      "
> > >
> > > -SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz"
> > > +SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz \
> > > +           ${@bb.utils.contains('PTEST_ENABLED', '1',
> 'file://run-ptest', '', d)} \
> > > +          "
> > >  SRC_URI[sha256sum] =3D
> > "135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d
> > 6"
> > >  UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
> > >
> > >  CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
> > >
> > > -inherit autotools gettext
> > > +inherit autotools gettext ptest
> > >
> > >  PACKAGES =3D+ "liblzma"
> > >
> > > @@ -42,3 +44,25 @@ ALTERNATIVE:${PN} =3D "xz xzcat unxz \
> > >                       lzma lzcat unlzma"
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > > +
> > > +RDEPENDS:${PN}-ptest +=3D "bash file"
> > > +
> > > +do_compile_ptest() {
> > > +        oe_runmake check TESTS=3D
> > > +}
> > > +
> > > +do_install_ptest () {
> > > +    install -d ${D}${PTEST_PATH}/tests
> > > +    find ${B}/tests/.libs -type f -executable -exec cp {}
> > ${D}${PTEST_PATH}/tests \;
> > > +    cp ${B}/config.h ${D}${PTEST_PATH}
> > > +    for i in files xzgrep_expected_output test_files.sh
> test_scripts.sh
> > test_compress.sh; do
> > > +        cp -r ${S}/tests/$i ${D}${PTEST_PATH}/tests
> > > +    done
> > > +    mkdir -p ${D}${PTEST_PATH}/src/xz
> > > +    ln -s ${bindir}/xz ${D}${PTEST_PATH}/src/xz/xz
> > > +    mkdir -p ${D}${PTEST_PATH}/src/xzdec
> > > +    ln -s ${bindir}/xzdec ${D}${PTEST_PATH}/src/xzdec/xzdec
> > > +    mkdir -p ${D}${PTEST_PATH}/src/scripts
> > > +    ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scripts/xzdiff
> > > +    ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scripts/xzgrep
> > > +}
> > > --
> > > 2.25.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel
> > engineering https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194916):
> https://lists.openembedded.org/g/openembedded-core/message/194916
> Mute This Topic: https://lists.openembedded.org/mt/103971280/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000ba144206109cb90a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>FYI, since the reproduci=
bility problem only impact the RPM package, it might be related to the prob=
lem noticed by Richard last night on IRC:<br></div><div>[11:35:32 pm] &lt;R=
P&gt; kanavin: It looks like it runs file on the files within the archive b=
ut for some reason it isn&#39;t sorting that in the header, so probably an =
unsorted directory listing somewhere<br>[11:58:34 pm] &lt;RP&gt; kanavin: l=
ooking at package_rpm and it&#39;s os.walk, there is no sorting in there at=
 all. I suspect that leads to non-determinstic ordering of the files sectio=
ns in the spec files and I suspect that in turn leads rpm to reorder header=
s</div><div>(<a href=3D"https://libera.irclog.whitequark.org/yocto/2024-02-=
04#35724802">https://libera.irclog.whitequark.org/yocto/2024-02-04#35724802=
</a>;)</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">Le=C2=A0lun. 5 f=C3=A9vr. 2024 =C3=A0=C2=A007:10, Chi Xu &lt;<a=
 href=3D"mailto:chi.xu@eng.windriver.com">chi.xu@eng.windriver.com</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Hello,<br>
<br>
I&#39;m checking this issue, but can not reproduce it on my host now.<br>
I tried to build and rebuild xz-ptest on ubuntu 20.04 and ubuntu 22.04, <br=
>
xz-ptest-5.4.5-r0.core2_64.rpm are same. <br>
Do you have any suggestions?<br>
<br>
Ubuntu 20.04<br>
root@localhost:/root$ git clone git://<a href=3D"http://git.yoctoproject.or=
g/poky" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky</a><=
br>
root@localhost:/root/poky$ cd poky<br>
root@localhost:/root/poky$ source oe-init-build-env<br>
root@localhost:/root/poky/build$ bitbake xz<br>
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
-rw-r--r-- 2 root root 162489 Feb=C2=A0 5 13:27 tmp/work/core2-64-poky-linu=
x/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
b26fd0014d1c23f6e3d9bf8704137b82=C2=A0 tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
root@localhost:/root/poky/build$ bitbake -c cleansstate xz<br>
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
-rw-r--r-- 2 root root 162489 Feb=C2=A0 5 13:32 tmp/work/core2-64-poky-linu=
x/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
b26fd0014d1c23f6e3d9bf8704137b82=C2=A0 tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
<br>
Ubuntu 22.04<br>
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
-rw-r--r-- 2 root root 162489 Feb=C2=A0 5 13:56 tmp/work/core2-64-poky-linu=
x/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
b26fd0014d1c23f6e3d9bf8704137b82=C2=A0 tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
root@localhost:/root/poky/build$ bitbake -c cleansstate xz<br>
root@localhost:/root/poky/build$ ls -l tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
-rw-r--r-- 2 root root 162489 Feb=C2=A0 5 13:59 tmp/work/core2-64-poky-linu=
x/xz/5.4.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
root@localhost:/root/poky/build$ md5sum tmp/work/core2-64-poky-linux/xz/5.4=
.5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
b26fd0014d1c23f6e3d9bf8704137b82=C2=A0 tmp/work/core2-64-poky-linux/xz/5.4.=
5/deploy-rpms/core2_64/xz-ptest-5.4.5-r0.core2_64.rpm<br>
<br>
Thanks,<br>
Chi<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootli=
n.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
&gt; Sent: Sunday, February 4, 2024 5:23 AM<br>
&gt; To: Xu, Chi &lt;<a href=3D"mailto:Chi.Xu@windriver.com" target=3D"_bla=
nk">Chi.Xu@windriver.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH v3] xz: Add ptest support<br>
&gt; <br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and<br>
&gt; know the content is safe.<br>
&gt; <br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;ve had a reproducibility failure:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible=
-20240203-" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.=
io/pub/repro-fail/oe-reproducible-20240203-</a><br>
&gt; fdpg888c/packages/diff-html/<br>
&gt; <br>
&gt; On 26/01/2024 13:48:20+0800, Chi Xu wrote:<br>
&gt; &gt; There are two types of cases: executables and POSIX shell scripts=
.<br>
&gt; &gt; All test cases PASS.<br>
&gt; &gt; Add xz-ptest to PTESTS_FAST because test duration less than 30s o=
n<br>
&gt; &gt; qemux86-64.<br>
&gt; &gt;<br>
&gt; &gt; root@qemux86-64:~# ptest-runner xz<br>
&gt; &gt; START: ptest-runner<br>
&gt; &gt; 2024-01-26T03:32<br>
&gt; &gt; BEGIN: /usr/lib/xz/ptest<br>
&gt; &gt; =3D=3D=3D test_bcj_exact_size.c =3D=3D=3D<br>
&gt; &gt; PASS: test_exact_size<br>
&gt; &gt; PASS: test_empty_block<br>
&gt; &gt; ---<br>
&gt; &gt; =3D=3D=3D END =3D=3D=3D<br>
&gt; &gt; ...<br>
&gt; &gt; =3D=3D=3D test_vli.c =3D=3D=3D<br>
&gt; &gt; PASS: test_lzma_vli_size<br>
&gt; &gt; PASS: test_lzma_vli_encode<br>
&gt; &gt; PASS: test_lzma_vli_decode<br>
&gt; &gt; ---<br>
&gt; &gt; =3D=3D=3D END =3D=3D=3D<br>
&gt; &gt; PASS: test_files.sh<br>
&gt; &gt; PASS: test_scripts.sh<br>
&gt; &gt; PASS: test_compress.sh<br>
&gt; &gt; DURATION: 18<br>
&gt; &gt; END: /usr/lib/xz/ptest<br>
&gt; &gt; 2024-01-26T03:33<br>
&gt; &gt; STOP: ptest-runner<br>
&gt; &gt; TOTAL: 1 FAIL: 0<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Xu, Chi &lt;<a href=3D"mailto:chi.xu@windriver.com=
" target=3D"_blank">chi.xu@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 meta/recipes-extended/xz/xz/run-ptest=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 26 +++++++++++++++++<br>
&gt; &gt;=C2=A0 meta/recipes-extended/xz/<a href=3D"http://xz_5.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">xz_5.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 28 +++++++++++++++++--<br>
&gt; &gt;=C2=A0 3 files changed, 53 insertions(+), 2 deletions(-)=C2=A0 cre=
ate mode 100644<br>
&gt; &gt; meta/recipes-extended/xz/xz/run-ptest<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; &gt; b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; &gt; index a1643c5548..68a3f63a6a 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
&gt; &gt; @@ -77,6 +77,7 @@ PTESTS_FAST =3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 sed \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 slang \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 wayland \<br>
&gt; &gt; +=C2=A0 =C2=A0 xz \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 zlib \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 libexif \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; diff --git a/meta/recipes-extended/xz/xz/run-ptest<br>
&gt; &gt; b/meta/recipes-extended/xz/xz/run-ptest<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..cc8ba92016<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-extended/xz/xz/run-ptest<br>
&gt; &gt; @@ -0,0 +1,26 @@<br>
&gt; &gt; +#!/bin/bash<br>
&gt; &gt; +<br>
&gt; &gt; +ptestdir=3D$(dirname &quot;$(readlink -f &quot;$0&quot;)&quot;) =
cd &quot;$ptestdir&quot;/tests ||<br>
&gt; &gt; +exit<br>
&gt; &gt; +<br>
&gt; &gt; +# executables test cases<br>
&gt; &gt; +tests_exec=3D$(file $(ls test_*) | grep &quot;ELF&quot; | awk -F=
: &#39;{print $1}&#39;)<br>
&gt; &gt; +for i in ${tests_exec}; do<br>
&gt; &gt; +=C2=A0 =C2=A0 ./$i<br>
&gt; &gt; +done<br>
&gt; &gt; +<br>
&gt; &gt; +# POSIX shell script test cases<br>
&gt; &gt; +export srcdir=3D${ptestdir}/tests<br>
&gt; &gt; +test_shell=3D&quot;test_files.sh test_scripts.sh test_compress.s=
h&quot;<br>
&gt; &gt; +for j in ${test_shell}; do<br>
&gt; &gt; +=C2=A0 =C2=A0 if [ $j =3D=3D &quot;test_compress.sh&quot; ]; the=
n<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./$j create_compress_files<br>
&gt; &gt; +=C2=A0 =C2=A0 else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./$j<br>
&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; +=C2=A0 =C2=A0 if [ $? -eq 0 ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $j&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $j&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 fi<br>
&gt; &gt; +done<br>
&gt; &gt; diff --git a/meta/recipes-extended/xz/<a href=3D"http://xz_5.4.5.=
bb" rel=3D"noreferrer" target=3D"_blank">xz_5.4.5.bb</a><br>
&gt; &gt; b/meta/recipes-extended/xz/<a href=3D"http://xz_5.4.5.bb" rel=3D"=
noreferrer" target=3D"_blank">xz_5.4.5.bb</a><br>
&gt; &gt; index 09eade8be0..0f0849c3e5 100644<br>
&gt; &gt; --- a/meta/recipes-extended/xz/<a href=3D"http://xz_5.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">xz_5.4.5.bb</a><br>
&gt; &gt; +++ b/meta/recipes-extended/xz/<a href=3D"http://xz_5.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">xz_5.4.5.bb</a><br>
&gt; &gt; @@ -24,13 +24,15 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3Dc8ea84ebe7b93cce676b54355dc6b2c0 \<br>
&gt; &gt;<br>
&gt; file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd8=
4 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI =3D &quot;<a href=3D"https://tukaani.org/xz/xz-$%7BPV%7D=
.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://tukaani.org/xz/xz-${P=
V}.tar.gz</a>&quot;<br>
&gt; &gt; +SRC_URI =3D &quot;<a href=3D"https://tukaani.org/xz/xz-$%7BPV%7D=
.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://tukaani.org/xz/xz-${P=
V}.tar.gz</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#=
39;PTEST_ENABLED&#39;, &#39;1&#39;, &#39;file://run-ptest&#39;, &#39;&#39;,=
 d)} \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &quot;135c90b934aee8fbc0d467de87a05cb70d627da36abe518c357a873709e5b7d<=
br>
&gt; 6&quot;<br>
&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;xz-(?P&lt;pver&gt;\d+(\.\d+)=
+)\.tar&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CACHED_CONFIGUREVARS +=3D &quot;gl_cv_posix_shell=3D/bin/sh=
&quot;<br>
&gt; &gt;<br>
&gt; &gt; -inherit autotools gettext<br>
&gt; &gt; +inherit autotools gettext ptest<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PACKAGES =3D+ &quot;liblzma&quot;<br>
&gt; &gt;<br>
&gt; &gt; @@ -42,3 +44,25 @@ ALTERNATIVE:${PN} =3D &quot;xz xzcat unxz \<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0lzma lzcat unlzma&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS:${PN}-ptest +=3D &quot;bash file&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_compile_ptest() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake check TESTS=3D<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +do_install_ptest () {<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
&gt; &gt; +=C2=A0 =C2=A0 find ${B}/tests/.libs -type f -executable -exec cp=
 {}<br>
&gt; ${D}${PTEST_PATH}/tests \;<br>
&gt; &gt; +=C2=A0 =C2=A0 cp ${B}/config.h ${D}${PTEST_PATH}<br>
&gt; &gt; +=C2=A0 =C2=A0 for i in files xzgrep_expected_output test_files.s=
h test_scripts.sh<br>
&gt; test_compress.sh; do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r ${S}/tests/$i ${D}${PTEST_PATH=
}/tests<br>
&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt; &gt; +=C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/src/xz<br>
&gt; &gt; +=C2=A0 =C2=A0 ln -s ${bindir}/xz ${D}${PTEST_PATH}/src/xz/xz<br>
&gt; &gt; +=C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/src/xzdec<br>
&gt; &gt; +=C2=A0 =C2=A0 ln -s ${bindir}/xzdec ${D}${PTEST_PATH}/src/xzdec/=
xzdec<br>
&gt; &gt; +=C2=A0 =C2=A0 mkdir -p ${D}${PTEST_PATH}/src/scripts<br>
&gt; &gt; +=C2=A0 =C2=A0 ln -s ${bindir}/xzdiff ${D}${PTEST_PATH}/src/scrip=
ts/xzdiff<br>
&gt; &gt; +=C2=A0 =C2=A0 ln -s ${bindir}/xzgrep ${D}${PTEST_PATH}/src/scrip=
ts/xzgrep<br>
&gt; &gt; +}<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; --<br>
&gt; Alexandre Belloni, co-owner and COO, Bootlin Embedded Linux and Kernel=
<br>
&gt; engineering <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=
=3D"_blank">https://bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194916): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194916" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194916</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103971280/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103971280/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div>

--000000000000ba144206109cb90a--

