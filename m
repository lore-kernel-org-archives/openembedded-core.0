Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC37C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 15:59:07 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.55945.1658332746825847965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 08:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ASufwlpm;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id kh20so13774552qvb.5;
        Wed, 20 Jul 2022 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xjgBxc9/OvU7WcgqrexED2fY7gN/O0dAuijB8ZAdFj8=;
        b=ASufwlpm3FT+ZnAt89PtillBiX2lwD0bT3BJFW2O/jp+VpcNIk7a64djNv2Y2+JBra
         16RGH7HCp3BHYPbxSJb3HtKlOpgsiQNhFwo69HO1qLAl6bIzVkDvk8AyRLyaDZSqI68E
         DxegcROqQujXOI5tqbkVrfp/cWXl3p07iTf9d90UpcgcRv62JymmX+BqwzJTxKcyciRs
         PSvRD6Eta12MQXbpejiLgjEgLZr/E+k4o3roMnjmW4cVMrUZJTh+3UIMEexebsBDEsZG
         4buKdtTcYrfUJYe7TQYx+6KI0aXKLR+1UHRu4W49e0uSTi5gnGfMAhFGzaMuMCqIJmFW
         mvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xjgBxc9/OvU7WcgqrexED2fY7gN/O0dAuijB8ZAdFj8=;
        b=PwJbpBhkeKe0Rdv3kJLmWxGG0y/K4AWMelApdudEaThtTTVbOhICKBqSSzKcv5gAso
         wCR1pJWg0BaVkJq6EEXfVaFZYYaNJ2KWdFXTPav8y9Q5PmHYmeAO326pz9A5Jhz3cewg
         zgJ/cucR9E5lshS8qzsbDdXBMaCoeNxD5iuSVy5wTE3ofvpTIhq0wpRplQCJzMo24dmv
         icAhjeYChhLLQkSHVPAJKuMWWFgLeaJQUGlvNkGzcn6WEKmf114BIBgX5WrpByiHwok0
         4BtkDeCp6jSjKTSmEvwF3SlNmBdNqIzkZtyMUdS5HbSD52wOixDx1tai3NII9FEcTG1x
         LdWA==
X-Gm-Message-State: AJIora8uhOgvy8teFIwKuCHdYNCUTW9w30ckzMK2uRwCHAglQL+FcRCg
	h6iDj2jG6Y2e4VJRktVDnj7cy7n9tA1Xzdu6O18=
X-Google-Smtp-Source: 
 AGRyM1sY1Id31iKeVvD3M0dvYGZldTXmGfhP2MOjsjcwPGr9yjQuMC4HhI+9h8Q5ilaXG/mDVWUMNFfFGgN8+Htn+BY=
X-Received: by 2002:a0c:f9ce:0:b0:474:14a:3c9 with SMTP id
 j14-20020a0cf9ce000000b00474014a03c9mr5479462qvo.24.1658332745691;
 Wed, 20 Jul 2022 08:59:05 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
 <CAMKF1sr5cQeqoQum3HAdHVrv-3EbrCkMfmMzoppQUCiisLiEYA@mail.gmail.com>
 <CAMRc=Mcaaufj-2+WnUZAgwznbkxroOVDEMmX_o4aZXFxmqwF0Q@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Mcaaufj-2+WnUZAgwznbkxroOVDEMmX_o4aZXFxmqwF0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jul 2022 11:58:54 -0400
Message-ID: 
 <CAMKF1sr3C=MYuX4NXigMT+NdTxdMB65VhMvSK3gqBSbGi+7YXw@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?=
 <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <jon.mason@arm.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000039f61e05e43eaefd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 15:59:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168368

--00000000000039f61e05e43eaefd
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 11:35 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Jul 19, 2022 at 4:58 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> > >
> > > On Tue, Jul 19, 2022 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> > > >>
> > > >> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us>
> wrote:
> > > >> >
> > > >> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> > > >> > >
> > > >> > > Can you try something like this
> > > >> > >
> > > >> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > >> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > >> > > index 5d74e4494d..61d5bf6058 100644
> > > >> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > >> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > >> > > @@ -68,8 +68,7 @@ do_configure () {
> > > >> > >     # libstdc++ isn't built yet so CXX would error not able to
> find it
> > > >> > > which breaks stdc++'s configure
> > > >> > >     # tests. Create a dummy empty lib for the purposes of
> configure.
> > > >> > >     mkdir -p ${WORKDIR}/dummylib
> > > >> > > -   touch ${WORKDIR}/dummylib/dummylib.c
> > > >> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> > > >> > > ${WORKDIR}/dummylib/libstdc++.so
> > > >> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
> > > >> > > ${WORKDIR}/dummylib/libstdc++.so
> > > >> > >     for d in libgcc ${RUNTIMETARGET}; do
> > > >> > >         echo "Configuring $d"
> > > >> > >         rm -rf ${B}/${TARGET_SYS}/$d/
> > > >> > >
> > > >> > >
> > > >> > > and see if it helps ?
> > > >> >
> > > >> > That appears to work for the 2 zephyr machines in meta-arm
> > > >> >
> > > >>
> > > >> This still fails for arduino nano 33 ble:
> > > >>
> > > >> | checking for dirent.h... no
> > > >> | checking sys/statvfs.h usability... no
> > > >> | checking sys/statvfs.h presence... no
> > > >> | checking for sys/statvfs.h... no
> > > >> | checking utime.h usability... yes
> > > >> | checking utime.h presence... yes
> > > >> | checking for utime.h... yes
> > > >> | checking whether to build Filesystem TS support... no
> > > >> | checking for struct dirent.d_type... no
> > > >> | checking for realpath... no
> > > >> | checking for utimensat... no
> > > >> | checking for utime... no
> > > >> | checking for lstat... no
> > > >> | checking for struct stat.st_mtim.tv_nsec... yes
> > > >> | checking for fchmod... yes
> > > >> | checking for fchmodat... yes
> > > >> | checking for sendfile that can copy files... no
> > > >> | checking for link... yes
> > > >> | checking for readlink... yes
> > > >> | checking for symlink... yes
> > > >> | checking for truncate... yes
> > > >> | checking for fdopendir... no
> > > >> | checking for dirfd... no
> > > >> | checking for unlinkat... yes
> > > >> | checking __sync extensions... yes
> > > >> | checking link.h usability... no
> > > >> | checking link.h presence... no
> > > >> | checking for link.h... no
> > > >> | checking for fcntl... configure: error: Link tests are not allowed
> > > >> after GCC_NO_EXECUTABLES.
> > > >
> > > >
> > > >
> > > > Can you post config.log from this component
> > > >
> > >
> > > Here you go: https://pastebin.com/6KMD9PhX
> >
> > this one has succeeded. I guess there are multiple config.log files in
> > your build tree. Perhaps the one which shows exit 1 at the end is one
> > I am interested in.
> >
> > >
> > > Bart
>
> I don't see any config.h that would fail and I just ran a clean build.


Not config.h but config.log


>
> | DEBUG: Executing python function extract_stashed_builddir
> | DEBUG: sed -e
>
> 's:^[^/]*/:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/:g'
>
> /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/gcc-stashed-builddir-arm-yocto-eabi/fixmepath
> | xargs sed -i -e
>
> 's:FIXMESTAGINGDIRTARGET:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot:g;
>
> s:FIXMESTAGINGDIRHOST:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native:g'
> -e
> 's:FIXME_PSEUDO_SYSROOT:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/pseudo-native:g'
> -e
> 's:FIXME_HOSTTOOLS_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/hosttools:g'
> -e
> 's:FIXME_PKGDATA_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/pkgdata/arduino-nano-33-ble:g'
> -e
> 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/pseudo/:g'
> -e
> 's:FIXME_LOGFIFO:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/fifo.385595:g'
>
> This makes me think that it fails after configure?
>
> Bart
>

--00000000000039f61e05e43eaefd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 20, 2022 at 11:35 AM Bartosz Golaszewski &lt;<a=
 href=3D"mailto:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Tue, Jul 19, 2022 at 4:58 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski &lt;<a href=3D"ma=
ilto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Jul 19, 2022 at 2:54 PM Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski &lt;<a h=
ref=3D"mailto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:=
<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On Tue, Jul 19, 2022 at 12:10 AM Jon Mason &lt;<a href=
=3D"mailto:jdmason@kudzu.us" target=3D"_blank">jdmason@kudzu.us</a>&gt; wro=
te:<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; On Mon, Jul 18, 2022 at 4:06 PM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; wrote:<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; Can you try something like this<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-run=
time.inc<br>
&gt; &gt; &gt;&gt; &gt; &gt; b/meta/recipes-devtools/gcc/gcc-runtime.inc<br=
>
&gt; &gt; &gt;&gt; &gt; &gt; index 5d74e4494d..61d5bf6058 100644<br>
&gt; &gt; &gt;&gt; &gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.in=
c<br>
&gt; &gt; &gt;&gt; &gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.in=
c<br>
&gt; &gt; &gt;&gt; &gt; &gt; @@ -68,8 +68,7 @@ do_configure () {<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0# libstdc++ isn&#39;t built=
 yet so CXX would error not able to find it<br>
&gt; &gt; &gt;&gt; &gt; &gt; which breaks stdc++&#39;s configure<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0# tests. Create a dummy emp=
ty lib for the purposes of configure.<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR}/dummyli=
b<br>
&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0touch ${WORKDIR}/dummylib/dummyl=
ib.c<br>
&gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0${CC} ${WORKDIR}/dummylib/dummyl=
ib.c -shared -o<br>
&gt; &gt; &gt;&gt; &gt; &gt; ${WORKDIR}/dummylib/libstdc++.so<br>
&gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0${CC} -nostartfiles -shared -x c=
 /dev/null -o<br>
&gt; &gt; &gt;&gt; &gt; &gt; ${WORKDIR}/dummylib/libstdc++.so<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0for d in libgcc ${RUNTIMETA=
RGET}; do<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Co=
nfiguring $d&quot;<br>
&gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${B}/$=
{TARGET_SYS}/$d/<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; &gt; and see if it helps ?<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; That appears to work for the 2 zephyr machines in m=
eta-arm<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; This still fails for arduino nano 33 ble:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; | checking for dirent.h... no<br>
&gt; &gt; &gt;&gt; | checking sys/statvfs.h usability... no<br>
&gt; &gt; &gt;&gt; | checking sys/statvfs.h presence... no<br>
&gt; &gt; &gt;&gt; | checking for sys/statvfs.h... no<br>
&gt; &gt; &gt;&gt; | checking utime.h usability... yes<br>
&gt; &gt; &gt;&gt; | checking utime.h presence... yes<br>
&gt; &gt; &gt;&gt; | checking for utime.h... yes<br>
&gt; &gt; &gt;&gt; | checking whether to build Filesystem TS support... no<=
br>
&gt; &gt; &gt;&gt; | checking for struct dirent.d_type... no<br>
&gt; &gt; &gt;&gt; | checking for realpath... no<br>
&gt; &gt; &gt;&gt; | checking for utimensat... no<br>
&gt; &gt; &gt;&gt; | checking for utime... no<br>
&gt; &gt; &gt;&gt; | checking for lstat... no<br>
&gt; &gt; &gt;&gt; | checking for struct stat.st_mtim.tv_nsec... yes<br>
&gt; &gt; &gt;&gt; | checking for fchmod... yes<br>
&gt; &gt; &gt;&gt; | checking for fchmodat... yes<br>
&gt; &gt; &gt;&gt; | checking for sendfile that can copy files... no<br>
&gt; &gt; &gt;&gt; | checking for link... yes<br>
&gt; &gt; &gt;&gt; | checking for readlink... yes<br>
&gt; &gt; &gt;&gt; | checking for symlink... yes<br>
&gt; &gt; &gt;&gt; | checking for truncate... yes<br>
&gt; &gt; &gt;&gt; | checking for fdopendir... no<br>
&gt; &gt; &gt;&gt; | checking for dirfd... no<br>
&gt; &gt; &gt;&gt; | checking for unlinkat... yes<br>
&gt; &gt; &gt;&gt; | checking __sync extensions... yes<br>
&gt; &gt; &gt;&gt; | checking link.h usability... no<br>
&gt; &gt; &gt;&gt; | checking link.h presence... no<br>
&gt; &gt; &gt;&gt; | checking for link.h... no<br>
&gt; &gt; &gt;&gt; | checking for fcntl... configure: error: Link tests are=
 not allowed<br>
&gt; &gt; &gt;&gt; after GCC_NO_EXECUTABLES.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can you post config.log from this component<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Here you go: <a href=3D"https://pastebin.com/6KMD9PhX" rel=3D"nor=
eferrer" target=3D"_blank">https://pastebin.com/6KMD9PhX</a><br>
&gt;<br>
&gt; this one has succeeded. I guess there are multiple config.log files in=
<br>
&gt; your build tree. Perhaps the one which shows exit 1 at the end is one<=
br>
&gt; I am interested in.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Bart<br>
<br>
I don&#39;t see any config.h that would fail and I just ran a clean build.<=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Not config.h but =
config.log=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex" dir=3D"auto"><br>
<br>
| DEBUG: Executing python function extract_stashed_builddir<br>
| DEBUG: sed -e<br>
&#39;s:^[^/]*/:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv=
7m-yocto-eabi/gcc-runtime/12.1.0-r0/gcc-12.1.0/build.arm-yocto-eabi.arm-yoc=
to-eabi/:g&#39;<br>
/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_=
64/gcc-stashed-builddir-arm-yocto-eabi/fixmepath<br>
| xargs sed -i -e<br>
&#39;s:FIXMESTAGINGDIRTARGET:/home/brgl/workspace/zephyr-yocto/build/tmp-ne=
wlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot:g;<br>
s:FIXMESTAGINGDIRHOST:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/wo=
rk/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native:g&#39;<br>
-e &#39;s:FIXME_PSEUDO_SYSROOT:/home/brgl/workspace/zephyr-yocto/build/tmp-=
newlib/sysroots-components/x86_64/pseudo-native:g&#39;<br>
-e &#39;s:FIXME_HOSTTOOLS_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-n=
ewlib/hosttools:g&#39;<br>
-e &#39;s:FIXME_PKGDATA_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-new=
lib/pkgdata/arduino-nano-33-ble:g&#39;<br>
-e &#39;s:FIXME_PSEUDO_LOCALSTATEDIR:/home/brgl/workspace/zephyr-yocto/buil=
d/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/pseudo/:g&#39;<br=
>
-e &#39;s:FIXME_LOGFIFO:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/=
work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/fifo.385595:g&#39;<br>
<br>
This makes me think that it fails after configure?<br>
<br>
Bart<br>
</blockquote></div></div>

--00000000000039f61e05e43eaefd--

