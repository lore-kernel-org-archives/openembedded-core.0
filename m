Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2B6C3F2D4
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 15:35:57 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.55599.1658331351738032146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 08:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=w+88prpl;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f41.google.com with SMTP id sz17so33713101ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3groLaC79TVUP7e3NsJvm7PCe6PUTMJUc9PBYHNJZ8I=;
        b=w+88prplbQSABs4BhwKpfinMd6e5IeJd3hNa5jeaj+9R9vwLCnRv80LD8jaHHEr2Y5
         kz3Dei+vVhmmANrU9QhOvUIE+Vr+uCB8xolTFGM3OXGgd5xmWzZ1U6Hwq9AKCB/NwWAD
         ue9kEkZDeWMHGC2DShkqEcF0fGL8j3dJzTVSZMK7JuvmEfiVqihLVXnokUQMpXUJAaFG
         oJWwh3zb+6R/TGHvdJo1MsMtAWgkjzUXT6WniQr+Bq8QIxCyutrtNaqNP1tH0b4ytnao
         9VRbCTqBSeXsrgcjlNS8RfxVAoQUe16tjcdVnudBtL9axIwr4uxb9D/ZtGYDveDHjorz
         GmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3groLaC79TVUP7e3NsJvm7PCe6PUTMJUc9PBYHNJZ8I=;
        b=05d2wp8fkbJEk1+btMxv8q7ozeA67+9haVh6SXFHkfwFP0RfVYeshdXoP8s+SvFhxv
         wHHh/hG80VT5ZnQkmK70A05kdLuPjq+4fOjILkZSe4sUr8ol9M825nUi/59B0VKNk1MU
         Pn25WLadFcM0t5qJEN2i9JrunTFPoJYfhWuxQo4WnZdQx9r+r+hs8Io2qqOwzXaIqDCV
         jVaww92Uz8rQrOIjzFZ/BqZvUJCgb9KXe76w6LXuV2HAC6yOtEty82PrNVifBfCPcswh
         vYS2yd6z3PbhL2SONH7BWu/SKLUFWev5SZ4TlPg4foi++oa/5T6mkSMjmpkhwT3IImx7
         GdLg==
X-Gm-Message-State: AJIora+eEXemZz56dNPtOgkNRMGxP89R9hoPSI5QDylZX/pSdm074RH+
	vdv/KEm9vNT0D+0MQnYZIpj+ki7sWArZw62yw1xOWA==
X-Google-Smtp-Source: 
 AGRyM1sZ5abKTuhaqHi8sGmDMTX98nQodKiTMk+kW/Kf09Gyk4GCkn97HbAOb/+sLsD70JPt0vKXvUp6bI8/Is8+6Vs=
X-Received: by 2002:a17:906:98c8:b0:72b:408f:f499 with SMTP id
 zd8-20020a17090698c800b0072b408ff499mr35970369ejb.736.1658331349882; Wed, 20
 Jul 2022 08:35:49 -0700 (PDT)
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
In-Reply-To: 
 <CAMKF1sr5cQeqoQum3HAdHVrv-3EbrCkMfmMzoppQUCiisLiEYA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Jul 2022 17:35:39 +0200
Message-ID: 
 <CAMRc=Mcaaufj-2+WnUZAgwznbkxroOVDEMmX_o4aZXFxmqwF0Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 15:35:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168365

On Tue, Jul 19, 2022 at 4:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jul 19, 2022 at 10:48 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Tue, Jul 19, 2022 at 2:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > >
> > >
> > > On Tue, Jul 19, 2022 at 3:40 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >>
> > >> On Tue, Jul 19, 2022 at 12:10 AM Jon Mason <jdmason@kudzu.us> wrote:
> > >> >
> > >> > On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >> > >
> > >> > > Can you try something like this
> > >> > >
> > >> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > >> > > b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > >> > > index 5d74e4494d..61d5bf6058 100644
> > >> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > >> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > >> > > @@ -68,8 +68,7 @@ do_configure () {
> > >> > >     # libstdc++ isn't built yet so CXX would error not able to find it
> > >> > > which breaks stdc++'s configure
> > >> > >     # tests. Create a dummy empty lib for the purposes of configure.
> > >> > >     mkdir -p ${WORKDIR}/dummylib
> > >> > > -   touch ${WORKDIR}/dummylib/dummylib.c
> > >> > > -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> > >> > > ${WORKDIR}/dummylib/libstdc++.so
> > >> > > +   ${CC} -nostartfiles -shared -x c /dev/null -o
> > >> > > ${WORKDIR}/dummylib/libstdc++.so
> > >> > >     for d in libgcc ${RUNTIMETARGET}; do
> > >> > >         echo "Configuring $d"
> > >> > >         rm -rf ${B}/${TARGET_SYS}/$d/
> > >> > >
> > >> > >
> > >> > > and see if it helps ?
> > >> >
> > >> > That appears to work for the 2 zephyr machines in meta-arm
> > >> >
> > >>
> > >> This still fails for arduino nano 33 ble:
> > >>
> > >> | checking for dirent.h... no
> > >> | checking sys/statvfs.h usability... no
> > >> | checking sys/statvfs.h presence... no
> > >> | checking for sys/statvfs.h... no
> > >> | checking utime.h usability... yes
> > >> | checking utime.h presence... yes
> > >> | checking for utime.h... yes
> > >> | checking whether to build Filesystem TS support... no
> > >> | checking for struct dirent.d_type... no
> > >> | checking for realpath... no
> > >> | checking for utimensat... no
> > >> | checking for utime... no
> > >> | checking for lstat... no
> > >> | checking for struct stat.st_mtim.tv_nsec... yes
> > >> | checking for fchmod... yes
> > >> | checking for fchmodat... yes
> > >> | checking for sendfile that can copy files... no
> > >> | checking for link... yes
> > >> | checking for readlink... yes
> > >> | checking for symlink... yes
> > >> | checking for truncate... yes
> > >> | checking for fdopendir... no
> > >> | checking for dirfd... no
> > >> | checking for unlinkat... yes
> > >> | checking __sync extensions... yes
> > >> | checking link.h usability... no
> > >> | checking link.h presence... no
> > >> | checking for link.h... no
> > >> | checking for fcntl... configure: error: Link tests are not allowed
> > >> after GCC_NO_EXECUTABLES.
> > >
> > >
> > >
> > > Can you post config.log from this component
> > >
> >
> > Here you go: https://pastebin.com/6KMD9PhX
>
> this one has succeeded. I guess there are multiple config.log files in
> your build tree. Perhaps the one which shows exit 1 at the end is one
> I am interested in.
>
> >
> > Bart

I don't see any config.h that would fail and I just ran a clean build.

| DEBUG: Executing python function extract_stashed_builddir
| DEBUG: sed -e
's:^[^/]*/:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/:g'
/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/gcc-stashed-builddir-arm-yocto-eabi/fixmepath
| xargs sed -i -e
's:FIXMESTAGINGDIRTARGET:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot:g;
s:FIXMESTAGINGDIRHOST:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native:g'
-e 's:FIXME_PSEUDO_SYSROOT:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/pseudo-native:g'
-e 's:FIXME_HOSTTOOLS_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/hosttools:g'
-e 's:FIXME_PKGDATA_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/pkgdata/arduino-nano-33-ble:g'
-e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/pseudo/:g'
-e 's:FIXME_LOGFIFO:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/fifo.385595:g'

This makes me think that it fails after configure?

Bart

