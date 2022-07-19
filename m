Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE7ACCA47F
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 14:58:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.41675.1658242700270447105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VmG/5hFF;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id m13so9795014edc.5;
        Tue, 19 Jul 2022 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N48V5aQpadqNzrICaU6fDN1W5p3A7lMFhh8dYt0XRXw=;
        b=VmG/5hFFKFjn58RSlHnKzF3GAXKhzYM2axC9xyIGuSU82Mf6wnu549qxpmzEUgsZRE
         a1I3O/INqXdV7Gz53LJ+ExT2w31yyCUsW/f+N99CIpRNC/itry0e6Arpiw1iDGGWVaue
         Hx6I/iOU/Pt/ltOcgOdA5nFY5nOIYqHJKOX3VAQIYUlt4i2F4/Ro7wO4VxoGSMF46hMn
         66X28MVhnr00B8RR/MghS+jsso81I6vj3UE34Q8W39xCLtxyEkVT5hPq7Wtj7hu+H0yt
         qzG5givXKusg5XXoXKSq01CBZeMi8bTUfDdgeNg9yx9w4jc45VPWYuIk8a6YwRmvpEOc
         agvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N48V5aQpadqNzrICaU6fDN1W5p3A7lMFhh8dYt0XRXw=;
        b=FvH63knU0B5vRYdYk3FA+9YgtFdgVDG7KRUHnqsJ9+hlsdWp3mn6zqtUE6i30Zg8do
         z7WSPlDghM596popktPI6c/ps3Q2/hIHPfPvgzcdwtjzlfmxHpcnH10EMrXtT+rBeeTc
         e2ZEcD7UKXpAOgLIPRIcxZMhREVyZlq1I8LdOg7Diz/Bdde/aqu+Jf+CETa3qni7N7DM
         ZATtR0QFhdSDhPtO8z9tSdHGhtjDV2ArHuN0fgLwkkRAe4kZ5GJcdahDUIYRnYyygVJc
         nmeiTsiyuFoH7KM+ZlFkccFY4x2dI2f8yXl2oQlrpvJ5A4Qy3jKpTFuqBHxEnYmsat9k
         Vq5g==
X-Gm-Message-State: AJIora+pLORHqxssrQ3jkft0uCVGHJhFiZYKaUml9nKwBKshUia13Qyo
	16KkqxWQwe14gLagDskU5N6jSE2EWcbw3fcN81I=
X-Google-Smtp-Source: 
 AGRyM1vaxnq4Pkd9/3ELmflaA5xkjQnPDR+SVfWBk1OKHKFkMHdXENuXtEqRgM4v70CtaNXf8lD0k0zh4eyG4k/kl7k=
X-Received: by 2002:a50:fd08:0:b0:43a:7890:9c54 with SMTP id
 i8-20020a50fd08000000b0043a78909c54mr44515821eds.52.1658242698555; Tue, 19
 Jul 2022 07:58:18 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
In-Reply-To: 
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2022 10:57:52 -0400
Message-ID: 
 <CAMKF1sr5cQeqoQum3HAdHVrv-3EbrCkMfmMzoppQUCiisLiEYA@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?=
 <elizabeth.flanagan@huawei.com>,
	Jon Mason <jdmason@kudzu.us>, Jon Mason <jon.mason@arm.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 14:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168283

On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jul 19, 2022 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>
> >> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us> wrote:
> >> >
> >> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >> > >
> >> > > Can you try something like this
> >> > >
> >> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > index 5d74e4494d..61d5bf6058 100644
> >> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> > > @@ -68,8 +68,7 @@ do_configure () {
> >> > >     # libstdc++ isn't built yet so CXX would error not able to find it
> >> > > which breaks stdc++'s configure
> >> > >     # tests. Create a dummy empty lib for the purposes of configure.
> >> > >     mkdir -p ${WORKDIR}/dummylib
> >> > > -   touch ${WORKDIR}/dummylib/dummylib.c
> >> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> >> > > ${WORKDIR}/dummylib/libstdc++.so
> >> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
> >> > > ${WORKDIR}/dummylib/libstdc++.so
> >> > >     for d in libgcc ${RUNTIMETARGET}; do
> >> > >         echo "Configuring $d"
> >> > >         rm -rf ${B}/${TARGET_SYS}/$d/
> >> > >
> >> > >
> >> > > and see if it helps ?
> >> >
> >> > That appears to work for the 2 zephyr machines in meta-arm
> >> >
> >>
> >> This still fails for arduino nano 33 ble:
> >>
> >> | checking for dirent.h... no
> >> | checking sys/statvfs.h usability... no
> >> | checking sys/statvfs.h presence... no
> >> | checking for sys/statvfs.h... no
> >> | checking utime.h usability... yes
> >> | checking utime.h presence... yes
> >> | checking for utime.h... yes
> >> | checking whether to build Filesystem TS support... no
> >> | checking for struct dirent.d_type... no
> >> | checking for realpath... no
> >> | checking for utimensat... no
> >> | checking for utime... no
> >> | checking for lstat... no
> >> | checking for struct stat.st_mtim.tv_nsec... yes
> >> | checking for fchmod... yes
> >> | checking for fchmodat... yes
> >> | checking for sendfile that can copy files... no
> >> | checking for link... yes
> >> | checking for readlink... yes
> >> | checking for symlink... yes
> >> | checking for truncate... yes
> >> | checking for fdopendir... no
> >> | checking for dirfd... no
> >> | checking for unlinkat... yes
> >> | checking __sync extensions... yes
> >> | checking link.h usability... no
> >> | checking link.h presence... no
> >> | checking for link.h... no
> >> | checking for fcntl... configure: error: Link tests are not allowed
> >> after GCC_NO_EXECUTABLES.
> >
> >
> >
> > Can you post config.log from this component
> >
>
> Here you go: https://pastebin.com/6KMD9PhX

this one has succeeded. I guess there are multiple config.log files in
your build tree. Perhaps the one which shows exit 1 at the end is one
I am interested in.

>
> Bart

