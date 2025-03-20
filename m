Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A90DC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:18:40 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.12098.1742487517595808749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vriGcmol;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f6ca9a3425so11028807b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742487517; x=1743092317; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgWeQYTEvdpTdjAHHtMTmbT01+xgFUa/oPvGkxvUtho=;
        b=vriGcmolbpvQhSOj9ph0WwTOGl05vIMXoz4Xn+BgbItDQUdTork7bZK4VpX01Sdvnq
         OwmU40xqt9x7WMpMVb2Pz0/lfPBMmtYzh1vh/rvt87fx6Xwcz/8gTE6Kauem9tTwwsY/
         P7+c0NnGLZ4RLnmKd3gfGslrbQaRi9r1qLUOT5YkrErZrcnwwblF3uRH8lFeYnrzyv8T
         rd9c1DmCrK00bLVdPRcfJOyHELV5kCVrkL85oKgbIzsxQF1VWdYm6cWch3Z8v2FyKTH3
         MtNnkrheMQH7/Q9Je9ByQdbqnWing+pZJdk5hG+5gfAWmR5QLHEloRcrbyqy5IaeZCXA
         cZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742487517; x=1743092317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgWeQYTEvdpTdjAHHtMTmbT01+xgFUa/oPvGkxvUtho=;
        b=Pj+yrRumR3Rnn9/WVR47L+/SDmk5Dww986lX/NpvWsxgCYovqE3Y/k3JIXdmEx2lUH
         LQZGk93zfywXmULw2lMgnNyF+GaVyxejfeg/Ocjsr3RK76BiC4HPvLsaSbyRx9cZ2K8U
         ZhiGcfa5i1lSjYyz2IzZt49vUfX7jzLUYbpewTDsnZLxj/PBgtymI2PpaiJ/fq7f4Lvn
         fyha1u7dYXr7HXshwy49xx43pCmVFd+PrRiFPjvnrI4F+jdBaCI0ZQaB3VkkHbnoxkWS
         qmK+Xfw8SzZ4YkQsHqgpTXQAzC1QsK2yMna2R/wZk7/nwMgnr9xFv22ZLYQTLm5WhHOX
         8d7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwwXIMhl7xNtrJ4KhhnUXgQlW7JeyRuWCNSfHWbs8OZWS+Uj1kseBXWLE5ctcsNEOvZFbSEvRRPUXLLKVNggkZrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWNJJY5fqLRuX11vTBaQXUIy8eXM/TVEgaI6l9xG9Ml1BDr291
	mxun0xK1GVNg2zdVNKeqa7DEdQ2WaXNaW3kzlpcAkvhBjJqwsbbH967JVB5etv0ZxMgAZXdbSfv
	ERglpDBSt4YDS8xfXG5eFBmVMJjlG3j5zuUybjQ==
X-Gm-Gg: ASbGncuCkJc+zzQXCVIJ1UBOiEQ5O62756bO+Su3ZAp4sPxw0CVmJ2zIeZS1yFBJbGT
	AmXkdbZmdv6cte6DArIzw+MADsIflmvCMyiC6lfugtZHMRmKp3Uy+zxtJwOuUuD0HpbNIcU8jpM
	f3YcMoFVZ5gM8PIFy0VcKN2QANUWP0z4uh9L4Rlry0xidtLsIDsOa5k5o28TJ8qeVtKbAd
X-Google-Smtp-Source: AGHT+IGcKhM7KJp2Avl8OQqsd4CSie/z/a9NxK2EgLyJjqarm06iI/k5dcVQvA8RiqCfS0GBPi3t3r6vjGAdiM0ApFg=
X-Received: by 2002:a05:690c:7487:b0:6fd:47aa:c6ba with SMTP id
 00721157ae682-7009bf9945cmr108021787b3.19.1742487516542; Thu, 20 Mar 2025
 09:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741980835.git.steve@sakoman.com> <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
 <b3d803cb-dbf0-4b05-b7af-a0fa3a8f7a69@ti.com> <CAOSpxdaPLDeHadupRrH=OxhsZ5KKVzn4x40i_Lgod=qME5dmNQ@mail.gmail.com>
 <CA+chaQe26ese9KdXR6X8tdstyMB_RQRWZLHSzd9u8HqV5BUi3A@mail.gmail.com>
In-Reply-To: <CA+chaQe26ese9KdXR6X8tdstyMB_RQRWZLHSzd9u8HqV5BUi3A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 20 Mar 2025 09:18:25 -0700
X-Gm-Features: AQ5f1JqNrMTH5_N8Af5wtW1BkidhF3Ru0BaJI6cOq8b12ECkD4ByQ94O5EP4vn0
Message-ID: <CAOSpxdao8QXCRr4yCbw-rAe+pykO8gZzSX4B=Kq2utZ2wukx9w@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 4/4] gcc-cross-canadian.inc: Fix buildpaths
 error for pthread.h
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Sana Kazi <sanakazi720@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213411

On Thu, Mar 20, 2025 at 7:52=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> I think we should backport:
>
> https://git.openembedded.org/openembedded-core/commit/?h=3Dstyhead&id=3D3=
50ff7d53f7506de2bc01f0efc569b8294b9afea
> https://git.openembedded.org/openembedded-core/commit/?h=3Dstyhead&id=3D9=
221e4ab8cca4c06dc3d5c1de2fd4ce46477578a
>
> to fix this issue in scarthgap, that's what I did locally in
> gcc-cross-canadian bbappend.
>
> Steve: should I send the backports?

Yes, please do!

Steve

>
> On Thu, Mar 20, 2025 at 3:28=E2=80=AFPM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Thu, Mar 20, 2025 at 7:22=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wr=
ote:
> > >
> > >
> > > I'm seeing build errors in our nightly builds due to this patch.  The
> > > pthread.h file does not exist and the command is erroring out causing
> > > do_install to fail.
> > >
> > >
> > > sed: can't read
> > > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-def=
ault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadi=
an-arm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-ar=
ago-linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.=
h:
> > > No such file or directory
> > > WARNING:
> > > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-def=
ault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadi=
an-arm/13.3.0/temp/run.do_install.958706:182
> > > exit 2 from 'sed -i -e
> > > "s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-=
default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-can=
adian-arm/13.3.0/recipe-sysroot-native|/not/exist|g"
> > > -e
> > > "s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-=
default-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-can=
adian-arm/13.3.0/recipe-sysroot|/not/exist|g"
> > > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-def=
ault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadi=
an-arm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-ar=
ago-linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.=
h'
> > > WARNING: Backtrace (BB generated script):
> > >         #1: do_install,
> > > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-def=
ault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadi=
an-arm/13.3.0/temp/run.do_install.958706,
> > > line 182
> > >         #2: main,
> > > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-def=
ault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadi=
an-arm/13.3.0/temp/run.do_install.958706,
> > > line 301
> > >
> > >
> > > And line 182 is the sed line.
> > >
> > > Should the sed call be wrapped in an if file exists check?
> >
> > I'll revert this patch since it is causing  build failures.
> >
> > Steve
> >
> >
> > > On 3/14/2025 2:35 PM, Steve Sakoman wrote:
> > > > From: Sana Kazi <sanakazi720@gmail.com>
> > > >
> > > > Replace the hardcoded path with /not/exist as used for other
> > > > options[--with-sysroot] to ensure pthread.h does not contain
> > > > hardocded references to TMPDIR:
> > > >
> > > > ERROR: gcc-cross-canadian-x86-64-13.3.0-r0 do_package_qa: QA Issue:
> > > > File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-=
linux/
> > > > usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.3.0/include-fixe=
d/
> > > > pthread.h in package gcc-cross-canadian-x86-64 contains reference t=
o
> > > > TMPDIR [buildpaths]
> > > >
> > > > Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > ---
> > > >   meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/met=
a/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > index adcaef2b0f..06f0cef864 100644
> > > > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > > @@ -118,6 +118,11 @@ do_install () {
> > > >       # We don't care about the gcc-<version> copies
> > > >       rm -f ${D}${bindir}/*gcc-${BINV}*
> > > >
> > > > +        # Remove buildpaths from pthread.h
> > > > +        sed -i -e "s|${RECIPE_SYSROOT_NATIVE}|/not/exist|g" \
> > > > +        -e "s|${RECIPE_SYSROOT}|/not/exist|g" \
> > > > +        ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed/pthr=
ead.h
> > > > +
> > > >       # Cleanup empty directories which are not shipped
> > > >       # we use rmdir instead of 'rm -f' to ensure the non empty dir=
ectories are not deleted
> > > >       # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=
=3Di686
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> > > --
> > > Ryan Eatmon                reatmon@ti.com
> > > -----------------------------------------
> > > Texas Instruments, Inc.  -  LCPD  -  MGTS
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#213404): https://lists.openembedded.org/g/openembed=
ded-core/message/213404
> > Mute This Topic: https://lists.openembedded.org/mt/111706016/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

