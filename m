Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA512C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 13:52:55 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.6552.1658411571426388031
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 06:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IL1244Gp;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id g1so1298629qki.7;
        Thu, 21 Jul 2022 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsnXKCVbE8GBlrGUrur7uHDMDYsB35LHWWdxsDXjIKY=;
        b=IL1244GpnfAPzx3ide4zYcpzpfih7fJL21/F/ngtTlBi8FN+pYuyEiEjedZcOLorJO
         3duff4m5NKrGrfLn4V0375e2Iv3r2+IS4/T2mQLW9P8VKcmbf+BFNmbDExbhS0i0MksV
         Fu3smWcPb+RkJiqMVcc3TSKCpjyJEhft837IUdU4Jz/vAtezIEd+OaHxwTIbkL+mmxJN
         lRrHLcaD55IE1zYaFbTwkW+PZkGEDSuN0RbCIM3rZkjLftbfb0cWR3lVnjvPQwmtA/DZ
         oqm1wJWNlp/ovU9C9dJk4xdfAR5Weo4AWph8q8HnIsNtAJ0S1ik95uEQFhrmTFBZunWR
         x8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsnXKCVbE8GBlrGUrur7uHDMDYsB35LHWWdxsDXjIKY=;
        b=ighvzVKfaNF4Kf8RDbO022nnJfDSKk0+GWPzDcCvVydC9d/zNe4Pxcwp8XpzLMz0dH
         lJ8TmJLMBixJcZxC+dmABxcZ5WP3a2a67YuLARrmVL/0zFzkaWfSdewG5TYPkukcuC59
         gmhdc+HRdDzaNiBYppeFDy8Wc9jd3J1WdvKLWljaDXI1OBl/cWkech6cn6njSvWlnFY2
         Wjgi60s2+6kLz9wQUNCUUQIs2T+kPUe7gPvG6hml7rAGOwmeP90gxsKI2qI1l4t3kWup
         UCWPrfHv59fbtNp2AUnz0hhLr71aDj9Nt7I5N0Vjgx5/ED8UkwxjiIolsP9w07wtxbY2
         mAOw==
X-Gm-Message-State: AJIora/yw7FUt4YNJBIVn7XlQ98AhCafukO5twJzTwDF3hkv6EjXgctz
	6s4mp4suWOznEMtfSCPa+AvRSK9r8InJmUChTZA=
X-Google-Smtp-Source: 
 AGRyM1sDaUo5lplg58cP9BxT6jcqzTHD89JNluFrvJgIrOISTl9vRlVSz/rubpYlaMPrCYOy/Sbe122SQe35fLIUyaI=
X-Received: by 2002:a05:620a:f85:b0:6b5:e2be:1d04 with SMTP id
 b5-20020a05620a0f8500b006b5e2be1d04mr16058703qkn.72.1658411570259; Thu, 21
 Jul 2022 06:52:50 -0700 (PDT)
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
 <CAMKF1sr3C=MYuX4NXigMT+NdTxdMB65VhMvSK3gqBSbGi+7YXw@mail.gmail.com>
 <CAMRc=Mdz9VMMKamV+TGkABX9v1k4i5051xQvyfTVVd_FEMSEuA@mail.gmail.com>
In-Reply-To: 
 <CAMRc=Mdz9VMMKamV+TGkABX9v1k4i5051xQvyfTVVd_FEMSEuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Jul 2022 09:52:39 -0400
Message-ID: 
 <CAMKF1sq4ZT91i881_tVXddV1axi+-NCJBkKizxpBUPLMuEVt8w@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?=
 <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <jon.mason@arm.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000896a6605e4510854"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 13:52:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168386

--000000000000896a6605e4510854
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don=E2=80=99t see config.log for Libstdc++ folder in there
Can you see why that=E2=80=99s missing ?

On Thu, Jul 21, 2022 at 4:22 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Wed, Jul 20, 2022 at 5:59 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Wed, Jul 20, 2022 at 11:35 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> >>
> >> On Tue, Jul 19, 2022 at 4:58 PM Khem Raj <raj.khem@gmail.com> wrote:
> >> >
> >> > On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl>
> wrote:
> >> > >
> >> > > On Tue, Jul 19, 2022 at 2:54 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> >> > > >
> >> > > >
> >> > > >
> >> > > > On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <
> brgl@bgdev.pl> wrote:
> >> > > >>
> >> > > >> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us>
> wrote:
> >> > > >> >
> >> > > >> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> >> > > >> > >
> >> > > >> > > Can you try something like this
> >> > > >> > >
> >> > > >> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > >> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > >> > > index 5d74e4494d..61d5bf6058 100644
> >> > > >> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > >> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > >> > > @@ -68,8 +68,7 @@ do_configure () {
> >> > > >> > >     # libstdc++ isn't built yet so CXX would error not able
> to find it
> >> > > >> > > which breaks stdc++'s configure
> >> > > >> > >     # tests. Create a dummy empty lib for the purposes of
> configure.
> >> > > >> > >     mkdir -p ${WORKDIR}/dummylib
> >> > > >> > > -   touch ${WORKDIR}/dummylib/dummylib.c
> >> > > >> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> >> > > >> > > ${WORKDIR}/dummylib/libstdc++.so
> >> > > >> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
> >> > > >> > > ${WORKDIR}/dummylib/libstdc++.so
> >> > > >> > >     for d in libgcc ${RUNTIMETARGET}; do
> >> > > >> > >         echo "Configuring $d"
> >> > > >> > >         rm -rf ${B}/${TARGET_SYS}/$d/
> >> > > >> > >
> >> > > >> > >
> >> > > >> > > and see if it helps ?
> >> > > >> >
> >> > > >> > That appears to work for the 2 zephyr machines in meta-arm
> >> > > >> >
> >> > > >>
> >> > > >> This still fails for arduino nano 33 ble:
> >> > > >>
> >> > > >> | checking for dirent.h... no
> >> > > >> | checking sys/statvfs.h usability... no
> >> > > >> | checking sys/statvfs.h presence... no
> >> > > >> | checking for sys/statvfs.h... no
> >> > > >> | checking utime.h usability... yes
> >> > > >> | checking utime.h presence... yes
> >> > > >> | checking for utime.h... yes
> >> > > >> | checking whether to build Filesystem TS support... no
> >> > > >> | checking for struct dirent.d_type... no
> >> > > >> | checking for realpath... no
> >> > > >> | checking for utimensat... no
> >> > > >> | checking for utime... no
> >> > > >> | checking for lstat... no
> >> > > >> | checking for struct stat.st_mtim.tv_nsec... yes
> >> > > >> | checking for fchmod... yes
> >> > > >> | checking for fchmodat... yes
> >> > > >> | checking for sendfile that can copy files... no
> >> > > >> | checking for link... yes
> >> > > >> | checking for readlink... yes
> >> > > >> | checking for symlink... yes
> >> > > >> | checking for truncate... yes
> >> > > >> | checking for fdopendir... no
> >> > > >> | checking for dirfd... no
> >> > > >> | checking for unlinkat... yes
> >> > > >> | checking __sync extensions... yes
> >> > > >> | checking link.h usability... no
> >> > > >> | checking link.h presence... no
> >> > > >> | checking for link.h... no
> >> > > >> | checking for fcntl... configure: error: Link tests are not
> allowed
> >> > > >> after GCC_NO_EXECUTABLES.
> >> > > >
> >> > > >
> >> > > >
> >> > > > Can you post config.log from this component
> >> > > >
> >> > >
> >> > > Here you go: https://pastebin.com/6KMD9PhX
> >> >
> >> > this one has succeeded. I guess there are multiple config.log files =
in
> >> > your build tree. Perhaps the one which shows exit 1 at the end is on=
e
> >> > I am interested in.
> >> >
> >> > >
> >> > > Bart
> >>
> >> I don't see any config.h that would fail and I just ran a clean build.
> >
> >
> > Not config.h but config.log
> >
>
> Sorry, the heatwave is getting to me.
>
> Still with config.log:
>
> When I run this from the gcc-runtime's workdir:
>
> $ find | grep config.log$ | xargs tail -n1
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/intl/config.log =
<=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/arm-yocto-eabi/libgcc/co=
nfig.log
> <=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcody/config.l=
og <=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/fixincludes/config.log <=
=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/lto-plugin/confi=
g.log
> <=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/gcc/config.log <=
=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libbacktrace/config.log =
<=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcpp/config.lo=
g <=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-linux/fixin=
cludes/config.log
> <=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-linux/libcp=
p/config.log
> <=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-linux/libib=
erty/config.log
> <=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcc1/config.lo=
g <=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/c++tools/config.=
log
> <=3D=3D
> configure: exit 0
>
> =3D=3D>
> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libdecnumber/config.log =
<=3D=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/config.log <=3D=
=3D
> configure: exit 0
>
> =3D=3D> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libiberty/config=
.log
> <=3D=3D
> configure: exit 0
>
> There's no log indicating a failure.
>
> Bart
>

--000000000000896a6605e4510854
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I don=E2=80=99t see config.log for Libstdc++ folder in th=
ere</div><div dir=3D"auto">Can you see why that=E2=80=99s missing ?=C2=A0</=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Thu, Jul 21, 2022 at 4:22 AM Bartosz Golaszewski &lt;<a href=3D"mailt=
o:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">On Wed, Jul 20, 2022 at 5:59 PM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Jul 20, 2022 at 11:35 AM Bartosz Golaszewski &lt;<a href=3D"ma=
ilto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jul 19, 2022 at 4:58 PM Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski &lt;<a h=
ref=3D"mailto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&gt; wrote:=
<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; On Tue, Jul 19, 2022 at 2:54 PM Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wro=
te:<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski=
 &lt;<a href=3D"mailto:brgl@bgdev.pl" target=3D"_blank">brgl@bgdev.pl</a>&g=
t; wrote:<br>
&gt;&gt; &gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; On Tue, Jul 19, 2022 at 12:10 AM Jon Mason &lt;=
<a href=3D"mailto:jdmason@kudzu.us" target=3D"_blank">jdmason@kudzu.us</a>&=
gt; wrote:<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; On Mon, Jul 18, 2022 at 4:06 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; Can you try something like this<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; diff --git a/meta/recipes-devtools/gc=
c/gcc-runtime.inc<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; b/meta/recipes-devtools/gcc/gcc-runti=
me.inc<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; index 5d74e4494d..61d5bf6058 100644<b=
r>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-r=
untime.inc<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-r=
untime.inc<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; @@ -68,8 +68,7 @@ do_configure () {<b=
r>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0# libstdc++ isn&#3=
9;t built yet so CXX would error not able to find it<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; which breaks stdc++&#39;s configure<b=
r>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0# tests. Create a =
dummy empty lib for the purposes of configure.<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0mkdir -p ${WORKDIR=
}/dummylib<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0touch ${WORKDIR}/dummyl=
ib/dummylib.c<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0${CC} ${WORKDIR}/dummyl=
ib/dummylib.c -shared -o<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; ${WORKDIR}/dummylib/libstdc++.so<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0${CC} -nostartfiles -sh=
ared -x c /dev/null -o<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; ${WORKDIR}/dummylib/libstdc++.so<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0for d in libgcc ${=
RUNTIMETARGET}; do<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo=
 &quot;Configuring $d&quot;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -=
rf ${B}/${TARGET_SYS}/$d/<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; &gt; and see if it helps ?<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt; That appears to work for the 2 zephyr mach=
ines in meta-arm<br>
&gt;&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; This still fails for arduino nano 33 ble:<br>
&gt;&gt; &gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for dirent.h... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking sys/statvfs.h usability... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking sys/statvfs.h presence... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for sys/statvfs.h... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking utime.h usability... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking utime.h presence... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for utime.h... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking whether to build Filesystem TS suppo=
rt... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for struct dirent.d_type... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for realpath... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for utimensat... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for utime... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for lstat... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for struct stat.st_mtim.tv_nsec... y=
es<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for fchmod... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for fchmodat... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for sendfile that can copy files... =
no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for link... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for readlink... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for symlink... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for truncate... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for fdopendir... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for dirfd... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for unlinkat... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking __sync extensions... yes<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking link.h usability... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking link.h presence... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for link.h... no<br>
&gt;&gt; &gt; &gt; &gt;&gt; | checking for fcntl... configure: error: Link =
tests are not allowed<br>
&gt;&gt; &gt; &gt; &gt;&gt; after GCC_NO_EXECUTABLES.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Can you post config.log from this component<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Here you go: <a href=3D"https://pastebin.com/6KMD9PhX" r=
el=3D"noreferrer" target=3D"_blank">https://pastebin.com/6KMD9PhX</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; this one has succeeded. I guess there are multiple config.log=
 files in<br>
&gt;&gt; &gt; your build tree. Perhaps the one which shows exit 1 at the en=
d is one<br>
&gt;&gt; &gt; I am interested in.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Bart<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t see any config.h that would fail and I just ran a clea=
n build.<br>
&gt;<br>
&gt;<br>
&gt; Not config.h but config.log<br>
&gt;<br>
<br>
Sorry, the heatwave is getting to me.<br>
<br>
Still with config.log:<br>
<br>
When I run this from the gcc-runtime&#39;s workdir:<br>
<br>
$ find | grep config.log$ | xargs tail -n1<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/intl/config.log=
 &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/arm-yocto-eabi/=
libgcc/config.log<br>
&lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcody/config.=
log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/fixincludes/con=
fig.log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/lto-plugin/conf=
ig.log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/gcc/config.log =
&lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libbacktrace/co=
nfig.log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcpp/config.l=
og &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-li=
nux/fixincludes/config.log<br>
&lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-li=
nux/libcpp/config.log<br>
&lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-li=
nux/libiberty/config.log<br>
&lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcc1/config.l=
og &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/c++tools/config=
.log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libdecnumber/co=
nfig.log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/config.log &lt;=
=3D=3D<br>
configure: exit 0<br>
<br>
=3D=3D&gt; ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libiberty/confi=
g.log &lt;=3D=3D<br>
configure: exit 0<br>
<br>
There&#39;s no log indicating a failure.<br>
<br>
Bart<br>
</blockquote></div></div>

--000000000000896a6605e4510854--

