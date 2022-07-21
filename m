Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9039C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 08:23:03 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.3928.1658391778842231981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 01:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=kjS3Xm5s;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.43,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f43.google.com with SMTP id t3so1257614edd.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xo13jE7QcsULV9VkgIwoaANOBmQHveC35qK+hH9Xf48=;
        b=kjS3Xm5srV0zsnHKWEZN42sN8DFIPti8z8VF/myaSdHRyfH23NHcZtiW1TQtaOQJlh
         egMSlxkZ/Bc/MgNFaB/2QLzV4KA/O+VyKi3iidZROnISF0zW2Pi4dTzBp9Wyxah7kHbL
         frz1pEZ0yia2/8HKUnKvJEC3aieb4BZN1fVF4GKqRSqiOktntSy8Ujt2HVzec9doQF9q
         akEsgyAL9HjjcMtEAzy+BrN3URMI1r5CREpq1D2JPhTRTzur0ZeoLza/zBz/I3Oujagn
         q2kE9qHwYMGbZw5sTVLf1dqJjitrXakBCgUwvdqdTL+WgPUtZaQlWfO8jAvGKmhXsW//
         Jw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xo13jE7QcsULV9VkgIwoaANOBmQHveC35qK+hH9Xf48=;
        b=38/XKDHaeH62UVIyUlE46Vq0B2GokFXqbu+uIC/wMLDEhD26jpr7+naAh063PaiDOA
         5GMfXb8K2e8viAgZQEMkaE+2d2habVzM0Q0rurEbBPwlrx1jgi+Zcd9rbOwtKJC72Zxv
         daWCzUfXk498TlzQTSegiG7Mhz2VlpTL1D6kPF/tTKuaP0RmkOM3GuHiJMkH8SPvYFPY
         MKPemEdmslYzW9Y7799AYU9I5R0qM/UppW2DgTqyHaJSrf0T8IS6FEcfFFMjbp0yDLTF
         1LVSaYlttVXfR6ztINUGe+HTb3ZtbgjUm/D8ogXns8m6ZpP1gEaPweQqnAYDo1Kku1qi
         AsuQ==
X-Gm-Message-State: AJIora9TyrrrT/Sew470fqIib9YRob/jBFCCwUb3wvK6hHcRKtVg/1CX
	4zpXYmSZ4u45ffUu9o7WjDuRTQ4Cxmk8RYW35Fs1pQ==
X-Google-Smtp-Source: 
 AGRyM1uQ2zs2zpLVAhKqXLQK+VO1HAITgJqLEED8rBYTLdZqjfVfUnAqIlwiFD9LhVKoT1ryfk0CE+QAzw+HumcE0u8=
X-Received: by 2002:a05:6402:430f:b0:43a:d521:bda with SMTP id
 m15-20020a056402430f00b0043ad5210bdamr56839961edc.69.1658391776856; Thu, 21
 Jul 2022 01:22:56 -0700 (PDT)
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
In-Reply-To: 
 <CAMKF1sr3C=MYuX4NXigMT+NdTxdMB65VhMvSK3gqBSbGi+7YXw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Jul 2022 10:22:46 +0200
Message-ID: 
 <CAMRc=Mdz9VMMKamV+TGkABX9v1k4i5051xQvyfTVVd_FEMSEuA@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Khem Raj <raj.khem@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 08:23:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168381

On Wed, Jul 20, 2022 at 5:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Wed, Jul 20, 2022 at 11:35 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Tue, Jul 19, 2022 at 4:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> > >
>> > > On Tue, Jul 19, 2022 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > >
>> > > >
>> > > >
>> > > > On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> > > >>
>> > > >> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us> wrote:
>> > > >> >
>> > > >> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > >> > >
>> > > >> > > Can you try something like this
>> > > >> > >
>> > > >> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > >> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > >> > > index 5d74e4494d..61d5bf6058 100644
>> > > >> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > >> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > >> > > @@ -68,8 +68,7 @@ do_configure () {
>> > > >> > >     # libstdc++ isn't built yet so CXX would error not able to find it
>> > > >> > > which breaks stdc++'s configure
>> > > >> > >     # tests. Create a dummy empty lib for the purposes of configure.
>> > > >> > >     mkdir -p ${WORKDIR}/dummylib
>> > > >> > > -   touch ${WORKDIR}/dummylib/dummylib.c
>> > > >> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
>> > > >> > > ${WORKDIR}/dummylib/libstdc++.so
>> > > >> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
>> > > >> > > ${WORKDIR}/dummylib/libstdc++.so
>> > > >> > >     for d in libgcc ${RUNTIMETARGET}; do
>> > > >> > >         echo "Configuring $d"
>> > > >> > >         rm -rf ${B}/${TARGET_SYS}/$d/
>> > > >> > >
>> > > >> > >
>> > > >> > > and see if it helps ?
>> > > >> >
>> > > >> > That appears to work for the 2 zephyr machines in meta-arm
>> > > >> >
>> > > >>
>> > > >> This still fails for arduino nano 33 ble:
>> > > >>
>> > > >> | checking for dirent.h... no
>> > > >> | checking sys/statvfs.h usability... no
>> > > >> | checking sys/statvfs.h presence... no
>> > > >> | checking for sys/statvfs.h... no
>> > > >> | checking utime.h usability... yes
>> > > >> | checking utime.h presence... yes
>> > > >> | checking for utime.h... yes
>> > > >> | checking whether to build Filesystem TS support... no
>> > > >> | checking for struct dirent.d_type... no
>> > > >> | checking for realpath... no
>> > > >> | checking for utimensat... no
>> > > >> | checking for utime... no
>> > > >> | checking for lstat... no
>> > > >> | checking for struct stat.st_mtim.tv_nsec... yes
>> > > >> | checking for fchmod... yes
>> > > >> | checking for fchmodat... yes
>> > > >> | checking for sendfile that can copy files... no
>> > > >> | checking for link... yes
>> > > >> | checking for readlink... yes
>> > > >> | checking for symlink... yes
>> > > >> | checking for truncate... yes
>> > > >> | checking for fdopendir... no
>> > > >> | checking for dirfd... no
>> > > >> | checking for unlinkat... yes
>> > > >> | checking __sync extensions... yes
>> > > >> | checking link.h usability... no
>> > > >> | checking link.h presence... no
>> > > >> | checking for link.h... no
>> > > >> | checking for fcntl... configure: error: Link tests are not allowed
>> > > >> after GCC_NO_EXECUTABLES.
>> > > >
>> > > >
>> > > >
>> > > > Can you post config.log from this component
>> > > >
>> > >
>> > > Here you go: https://pastebin.com/6KMD9PhX
>> >
>> > this one has succeeded. I guess there are multiple config.log files in
>> > your build tree. Perhaps the one which shows exit 1 at the end is one
>> > I am interested in.
>> >
>> > >
>> > > Bart
>>
>> I don't see any config.h that would fail and I just ran a clean build.
>
>
> Not config.h but config.log
>

Sorry, the heatwave is getting to me.

Still with config.log:

When I run this from the gcc-runtime's workdir:

$ find | grep config.log$ | xargs tail -n1
==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/intl/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/arm-yocto-eabi/libgcc/config.log
<==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcody/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/fixincludes/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/lto-plugin/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/gcc/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libbacktrace/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcpp/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-linux/fixincludes/config.log
<==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-linux/libcpp/config.log
<==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/build-x86_64-linux/libiberty/config.log
<==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libcc1/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/c++tools/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libdecnumber/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/config.log <==
configure: exit 0

==> ./gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/libiberty/config.log <==
configure: exit 0

There's no log indicating a failure.

Bart

