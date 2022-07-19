Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1291C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 14:48:59 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.41553.1658242135904438824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=5MKN0rcC;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.52,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f52.google.com with SMTP id va17so27704128ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hWFfDiMm50mlMypn99X0EZ0lGs4yigb4pSIvZ7nVALE=;
        b=5MKN0rcCKeIOz356DTGbdRRCPbT8R7h8jnDZkNMv5wAZqCRp8sNQTfY+0ip2b2N2FD
         pugK2ZEtOMBc1oOp6r0o6fQKICgQTLh0ipBKmD58+UD9NADfS/u1atdFQfJptGSDYBtl
         cLMZyb0UfiYCCLGfBngzln2HF1mSvDk0t2B96mhjDZbN7Fn5HEM3+o39DI1snHFxVkYb
         KJMoO70cCZdvBRz/Rt74d+//wTS/aCyND0mZqEOOaXDltUQcPywS/dre9T4DfluXWcQJ
         pTMn/dsjrsj69hfI/18+alQB2LT6uVMFDZ3v4wILAz5WE4kN3+laRwb3i+VJKiPWGOPt
         yT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hWFfDiMm50mlMypn99X0EZ0lGs4yigb4pSIvZ7nVALE=;
        b=jNYX9fe+yTIMt92wc3C69eokcKS46DpNcdnU5uZH5r5mnrpXpVsLBsGJgTMBGjuoEf
         UX8kSppZzqrwcLZLWF39XidXRi1IR99YAA3FoOkx9hr7Ax1jM+yWnWPITFkg1bl9K7Rv
         RLHTYvlp6mP0l/aPCpUAJ+fz+RYRA27IXnP21rjpFZViELTUw5aila9QVYWXPkkpX1WZ
         OrzMw6w1U8HuVr3LcFm157fFawwM3S2vyxFk5qGBkNWSpjdUmHYFfrZ+taDmR+75FMMV
         VfKNaeYlUB2+StDCrH4W0hgmGjXtrU/8aNJMRvlD3zE99cfPsKp+oMkO3/cr2Aqp/gdi
         Py+A==
X-Gm-Message-State: AJIora/+utWksGkFbKllI2EFyqBumvgnGzWzk+vQvC32JV5zpGhqniJQ
	R+UtIOyNeZ9gf47Z7S0bc4F7lGBSXLrrsxk84i5EIA==
X-Google-Smtp-Source: 
 AGRyM1soXvjurTSb+7BdjC/twnFpnXaRvcxDaw/sIbpuHwQSWK9BORJFfAfXk69+wjz4xc9x6/HYUcV4ulPjqxZRqoM=
X-Received: by 2002:a17:907:87b0:b0:72b:9f0d:3f89 with SMTP id
 qv48-20020a17090787b000b0072b9f0d3f89mr29571017ejc.734.1658242134018; Tue, 19
 Jul 2022 07:48:54 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
 <CAMRc=MecfyMPB2B5ukhYzMdQDWL4fY=8nbfUe0LR_8hUPhNP9w@mail.gmail.com>
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srBz3xL0VTZedyyf4oFgiXxn7ai4afH37yBrT63djTr3Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 19 Jul 2022 16:48:43 +0200
Message-ID: 
 <CAMRc=MdFDGv=a04jn23r2v0ZoYYTACW2-KNNi2dVboU2knoDoQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 14:48:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168281

On Tue, Jul 19, 2022 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us> wrote:
>> >
>> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > > Can you try something like this
>> > >
>> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > index 5d74e4494d..61d5bf6058 100644
>> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> > > @@ -68,8 +68,7 @@ do_configure () {
>> > >     # libstdc++ isn't built yet so CXX would error not able to find it
>> > > which breaks stdc++'s configure
>> > >     # tests. Create a dummy empty lib for the purposes of configure.
>> > >     mkdir -p ${WORKDIR}/dummylib
>> > > -   touch ${WORKDIR}/dummylib/dummylib.c
>> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
>> > > ${WORKDIR}/dummylib/libstdc++.so
>> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
>> > > ${WORKDIR}/dummylib/libstdc++.so
>> > >     for d in libgcc ${RUNTIMETARGET}; do
>> > >         echo "Configuring $d"
>> > >         rm -rf ${B}/${TARGET_SYS}/$d/
>> > >
>> > >
>> > > and see if it helps ?
>> >
>> > That appears to work for the 2 zephyr machines in meta-arm
>> >
>>
>> This still fails for arduino nano 33 ble:
>>
>> | checking for dirent.h... no
>> | checking sys/statvfs.h usability... no
>> | checking sys/statvfs.h presence... no
>> | checking for sys/statvfs.h... no
>> | checking utime.h usability... yes
>> | checking utime.h presence... yes
>> | checking for utime.h... yes
>> | checking whether to build Filesystem TS support... no
>> | checking for struct dirent.d_type... no
>> | checking for realpath... no
>> | checking for utimensat... no
>> | checking for utime... no
>> | checking for lstat... no
>> | checking for struct stat.st_mtim.tv_nsec... yes
>> | checking for fchmod... yes
>> | checking for fchmodat... yes
>> | checking for sendfile that can copy files... no
>> | checking for link... yes
>> | checking for readlink... yes
>> | checking for symlink... yes
>> | checking for truncate... yes
>> | checking for fdopendir... no
>> | checking for dirfd... no
>> | checking for unlinkat... yes
>> | checking __sync extensions... yes
>> | checking link.h usability... no
>> | checking link.h presence... no
>> | checking for link.h... no
>> | checking for fcntl... configure: error: Link tests are not allowed
>> after GCC_NO_EXECUTABLES.
>
>
>
> Can you post config.log from this component
>

Here you go: https://pastebin.com/6KMD9PhX

Bart

