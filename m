Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFB8C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 14:52:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.9838.1742482326431748170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 07:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BVc+2Drl;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5495c1e1b63so1173806e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742482324; x=1743087124; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaWClPj3HJMNRVKY7pTV0RAJfALKhntcjHHaMgjjH2Y=;
        b=BVc+2Drl+1E5uRNHrkjKHAiQ8kQHsm9ZSsBv6tiaPMdbJZRPqCRkm5mA2E5vPIN+rC
         PmJzp3nP9AipGlN3AlDF9FIj88VMpoHHcxLIIHslyydyLqrA+HK7K8OTRU4EwuAPOuvz
         RLHNO9a8Pm0DCQZiJ70D+O3jOL/z6HKA9raSeDW+7XsqDhlvnwuIuPkIzS1Ph3HCq8Vp
         m3czWGqneUQl4AXD51iLJpWcKYaVW0hjkp7juAmprHSpnEEIyKLUhXrlY4/NhrfPPb28
         K3xlhJhXOS4XfDa881OMpDYrgT2b+YGFGlmN9+upzUly9UvWQG+YBHIMItMDC07udygw
         zwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742482324; x=1743087124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaWClPj3HJMNRVKY7pTV0RAJfALKhntcjHHaMgjjH2Y=;
        b=JG6rv/OhXLI5mDLuVB7CBuehjgAIbSY6JZcWBPiNdP/6yJ9hn5o69k8Bk4NU/H8rSa
         LnWlc9xtdroGjqm49n93oidpVkIF7zjc3LqSPQyrQGSMiNwhuYjB2bb4aFrSjVgquW99
         OVPtDR0Iu7AhZBkfABxN5HBNMwBH36zxi04yy8K2qbl4mNHeFICiagX98ko1W83rn+6E
         FdOQV3Gdov2QI9mOsV9iElzEIc14iQo4JLtL5PMjzmfVKeCkaB1MTTILJT9ZxHHAd9wR
         d9kLgHKKui0CC4h+d5kcmtqeCufhwd5QL0rbooON37VbnI566JVmZO2X7BXXsevsC/7T
         DNlw==
X-Forwarded-Encrypted: i=1; AJvYcCU8ONFnEgEgM5VJ2hAIT8Xx3Vgcf7VjWkgIGNTLJb6VApboNm1xVEonPOpQ1udSAUbNiL0MlvrhCw5pNFUXmuoD2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEIm9t4m6YWOP6AD/7rLrJn6So7UxbqqG4QSnMa3kUSvLWYS8q
	TprEw01Sg6VsFWK2L5BTBn4Q7bN3/KVXQnWIjyulirQ0lpjqUfr6d98rpSdOy41lb/7z13wV+j0
	+fWaLSwBGBHaZgEZdnDAqDAhPFaI=
X-Gm-Gg: ASbGnctMbbHZrXkPlyuUWXogKGWof8rok2QTypWu5/HHs+H9mW1Q78dthPR+V5676R6
	ZkPZKInusPe1ptynvK9QSCNaydwYNQ7izmHsR4n6lF8zB98waDHORncXoAh6EYtwGynsERjzhby
	4AYvkkXwxu0yXLHn+MMTtjHSrEhOKV
X-Google-Smtp-Source: AGHT+IH4aOlX2RPUWG9vmZ6nDLGuLCCEU6Xh11bQod4c0pC+Q5U72pqEbwa0+pxTY7CSv2mZFV9QJ9IGKHJVqzSy1eA=
X-Received: by 2002:a05:6512:1288:b0:549:b28b:17bd with SMTP id
 2adb3069b0e04-54acb205501mr3201948e87.35.1742482324193; Thu, 20 Mar 2025
 07:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741980835.git.steve@sakoman.com> <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
 <b3d803cb-dbf0-4b05-b7af-a0fa3a8f7a69@ti.com> <CAOSpxdaPLDeHadupRrH=OxhsZ5KKVzn4x40i_Lgod=qME5dmNQ@mail.gmail.com>
In-Reply-To: <CAOSpxdaPLDeHadupRrH=OxhsZ5KKVzn4x40i_Lgod=qME5dmNQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Mar 2025 15:51:50 +0100
X-Gm-Features: AQ5f1JpBS7WGS1CXAdriizTlM_gFfJIYG0QJZob0vXmOsvIvoemANwZtQMHMc2U
Message-ID: <CA+chaQe26ese9KdXR6X8tdstyMB_RQRWZLHSzd9u8HqV5BUi3A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 4/4] gcc-cross-canadian.inc: Fix buildpaths
 error for pthread.h
To: steve@sakoman.com
Cc: Ryan Eatmon <reatmon@ti.com>, Sana Kazi <sanakazi720@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 14:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213406

I think we should backport:

https://git.openembedded.org/openembedded-core/commit/?h=3Dstyhead&id=3D350=
ff7d53f7506de2bc01f0efc569b8294b9afea
https://git.openembedded.org/openembedded-core/commit/?h=3Dstyhead&id=3D922=
1e4ab8cca4c06dc3d5c1de2fd4ce46477578a

to fix this issue in scarthgap, that's what I did locally in
gcc-cross-canadian bbappend.

Steve: should I send the backports?

On Thu, Mar 20, 2025 at 3:28=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Thu, Mar 20, 2025 at 7:22=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrot=
e:
> >
> >
> > I'm seeing build errors in our nightly builds due to this patch.  The
> > pthread.h file does not exist and the command is erroring out causing
> > do_install to fail.
> >
> >
> > sed: can't read
> > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defau=
lt-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian=
-arm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-arag=
o-linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.h:
> > No such file or directory
> > WARNING:
> > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defau=
lt-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian=
-arm/13.3.0/temp/run.do_install.958706:182
> > exit 2 from 'sed -i -e
> > "s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-de=
fault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canad=
ian-arm/13.3.0/recipe-sysroot-native|/not/exist|g"
> > -e
> > "s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-de=
fault-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canad=
ian-arm/13.3.0/recipe-sysroot|/not/exist|g"
> > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defau=
lt-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian=
-arm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-arag=
o-linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.h'
> > WARNING: Backtrace (BB generated script):
> >         #1: do_install,
> > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defau=
lt-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian=
-arm/13.3.0/temp/run.do_install.958706,
> > line 182
> >         #2: main,
> > /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defau=
lt-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian=
-arm/13.3.0/temp/run.do_install.958706,
> > line 301
> >
> >
> > And line 182 is the sed line.
> >
> > Should the sed call be wrapped in an if file exists check?
>
> I'll revert this patch since it is causing  build failures.
>
> Steve
>
>
> > On 3/14/2025 2:35 PM, Steve Sakoman wrote:
> > > From: Sana Kazi <sanakazi720@gmail.com>
> > >
> > > Replace the hardcoded path with /not/exist as used for other
> > > options[--with-sysroot] to ensure pthread.h does not contain
> > > hardocded references to TMPDIR:
> > >
> > > ERROR: gcc-cross-canadian-x86-64-13.3.0-r0 do_package_qa: QA Issue:
> > > File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-li=
nux/
> > > usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.3.0/include-fixed/
> > > pthread.h in package gcc-cross-canadian-x86-64 contains reference to
> > > TMPDIR [buildpaths]
> > >
> > > Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >   meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/=
recipes-devtools/gcc/gcc-cross-canadian.inc
> > > index adcaef2b0f..06f0cef864 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > > @@ -118,6 +118,11 @@ do_install () {
> > >       # We don't care about the gcc-<version> copies
> > >       rm -f ${D}${bindir}/*gcc-${BINV}*
> > >
> > > +        # Remove buildpaths from pthread.h
> > > +        sed -i -e "s|${RECIPE_SYSROOT_NATIVE}|/not/exist|g" \
> > > +        -e "s|${RECIPE_SYSROOT}|/not/exist|g" \
> > > +        ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed/pthrea=
d.h
> > > +
> > >       # Cleanup empty directories which are not shipped
> > >       # we use rmdir instead of 'rm -f' to ensure the non empty direc=
tories are not deleted
> > >       # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=3Di=
686
> > >
> > >
> > >
> > >
> > >
> >
> > --
> > Ryan Eatmon                reatmon@ti.com
> > -----------------------------------------
> > Texas Instruments, Inc.  -  LCPD  -  MGTS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213404): https://lists.openembedded.org/g/openembedde=
d-core/message/213404
> Mute This Topic: https://lists.openembedded.org/mt/111706016/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

