Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FC4C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 14:27:59 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.9054.1742480873680403306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 07:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jcAQb5OG;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6feaa0319d8so6676937b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742480873; x=1743085673; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNdKQaIYuVMMl6nnzZTBBaPsxzVAO0kwtosL8apEEUQ=;
        b=jcAQb5OGuot52KIQeNpSFWhtQ3v5ZgsQ4uaU+Cz7IDurqggsEAepovT7odU+ZIP42H
         f5IbZynpXObsXr0Tu5oobsHY2BoklKgYC1Mlbi6CXDXiECNASgKAw8TQnlUT7b58a1ge
         jL5fLuLM+4j675J6mw3SRXV+93Xuu1L9a4ODA3mKn+TMUAL7MYBGZHQBAP8U09kgUY/m
         HkcHNIaKd0lcI9JX7qPT5S7ky5zV6HGEQwfy8yQZeu56yxRWK2gewT88wmBA5JQBSA+v
         cxVHru9ZwbYcyBPivf6xnktgXBbJyhAEkd7twz8xgi+DHFAJQaaEymvQuAdSKbQ8c84i
         A+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480873; x=1743085673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNdKQaIYuVMMl6nnzZTBBaPsxzVAO0kwtosL8apEEUQ=;
        b=NSe9t78BVB/SS2tgibMSDcW/CdsZYE25PIq4/jtnZtIFrvQf4iFICN/KYTbngOqAx2
         CfQcOWmLhxW3rGSN23n+v+7hrBh0rR6GkdDWijF/t9CSzYMEFVkL198YQC9MQ92LMg5O
         ZGDO1yyeenUcSY2e5d/B8KtR+e/BQzGBEF6co3c6+UwRL3GIB4i8sijaASEGYYk+Xc3W
         Wr7OxyUmpjc8kbz8ciPT96++zAIdJFQzBBVRtNeMtRXe1nDx57wsETINMDY1jVLNO0QI
         EEB9ML06+oULoqUsgND6M/wyMe+PbUSiZAivise0mJqP9uJKEr0FcxtlmfpGGsG61ZVf
         8+Og==
X-Gm-Message-State: AOJu0Yyq9LDwhNiAhU858KZyY+YzSXqRBZ2TGRv/AbXtndQUH17jVCps
	npIr4DBnv2+LJoEDPydjbMkQkQDfmq7NfLzwYaLund5xBJ6zA27drjkDoAqHy8NV6FfyyNPFDI7
	OgghGNTTsJVSO/bxk7xgefHKrCuVUeiCXR03K+Q==
X-Gm-Gg: ASbGncsX5/CnVNNKUW4KrFisBB7VG8q/TgQfyeCio5txZOmRBhQku/sqo7/wpOPDxhK
	deew7qOZWlT/lMpZBLIy2YtzUE3oNNuiKdfJftT6TJRTVTg+6UukA0kp9Ukv/enQQhYV7K4QgRq
	gJHT0HaG2V7ZCvVCY2mnUzQ/VlVz+Syfec1HsEvBTzu7KnhNSQ4siS8rF3NQ==
X-Google-Smtp-Source: AGHT+IENiE3hU4Ms4353z11XQCP5PheRRDX+r6FAefJ89mESAwKrusZAiNbsuJPP8G7MlpLLWU6jwsdqkFwOONO4hxE=
X-Received: by 2002:a05:690c:2a88:b0:6ff:1d6f:38af with SMTP id
 00721157ae682-7009bf54ef4mr64915507b3.4.1742480872694; Thu, 20 Mar 2025
 07:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741980835.git.steve@sakoman.com> <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
 <b3d803cb-dbf0-4b05-b7af-a0fa3a8f7a69@ti.com>
In-Reply-To: <b3d803cb-dbf0-4b05-b7af-a0fa3a8f7a69@ti.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 20 Mar 2025 07:27:41 -0700
X-Gm-Features: AQ5f1Jp5_cJw7ZijQFCpnyZ9GCBAeMpdcEnfbnMj9Gz2yz2X_-AhUJ4_4pHkGzE
Message-ID: <CAOSpxdaPLDeHadupRrH=OxhsZ5KKVzn4x40i_Lgod=qME5dmNQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 4/4] gcc-cross-canadian.inc: Fix buildpaths
 error for pthread.h
To: Ryan Eatmon <reatmon@ti.com>, Sana Kazi <sanakazi720@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 14:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213404

On Thu, Mar 20, 2025 at 7:22=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
> I'm seeing build errors in our nightly builds due to this patch.  The
> pthread.h file does not exist and the command is erroring out causing
> do_install to fail.
>
>
> sed: can't read
> /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default=
-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-a=
rm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-arago-=
linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.h:
> No such file or directory
> WARNING:
> /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default=
-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-a=
rm/13.3.0/temp/run.do_install.958706:182
> exit 2 from 'sed -i -e
> "s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defa=
ult-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadia=
n-arm/13.3.0/recipe-sysroot-native|/not/exist|g"
> -e
> "s|/scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-defa=
ult-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadia=
n-arm/13.3.0/recipe-sysroot|/not/exist|g"
> /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default=
-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-a=
rm/13.3.0/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-arago-=
linux/usr/lib/arm-oe-eabi/gcc/arm-oe-eabi/13.3.0/include-fixed/pthread.h'
> WARNING: Backtrace (BB generated script):
>         #1: do_install,
> /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default=
-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-a=
rm/13.3.0/temp/run.do_install.958706,
> line 182
>         #2: main,
> /scratch/jenkins_builds/arago-scarthgap-wip/build/build/arago-tmp-default=
-baremetal-k3r5/work/x86_64-k3r5-nativesdk-arago-linux/gcc-cross-canadian-a=
rm/13.3.0/temp/run.do_install.958706,
> line 301
>
>
> And line 182 is the sed line.
>
> Should the sed call be wrapped in an if file exists check?

I'll revert this patch since it is causing  build failures.

Steve


> On 3/14/2025 2:35 PM, Steve Sakoman wrote:
> > From: Sana Kazi <sanakazi720@gmail.com>
> >
> > Replace the hardcoded path with /not/exist as used for other
> > options[--with-sysroot] to ensure pthread.h does not contain
> > hardocded references to TMPDIR:
> >
> > ERROR: gcc-cross-canadian-x86-64-13.3.0-r0 do_package_qa: QA Issue:
> > File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linu=
x/
> > usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.3.0/include-fixed/
> > pthread.h in package gcc-cross-canadian-x86-64 contains reference to
> > TMPDIR [buildpaths]
> >
> > Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >   meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/re=
cipes-devtools/gcc/gcc-cross-canadian.inc
> > index adcaef2b0f..06f0cef864 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> > @@ -118,6 +118,11 @@ do_install () {
> >       # We don't care about the gcc-<version> copies
> >       rm -f ${D}${bindir}/*gcc-${BINV}*
> >
> > +        # Remove buildpaths from pthread.h
> > +        sed -i -e "s|${RECIPE_SYSROOT_NATIVE}|/not/exist|g" \
> > +        -e "s|${RECIPE_SYSROOT}|/not/exist|g" \
> > +        ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed/pthread.=
h
> > +
> >       # Cleanup empty directories which are not shipped
> >       # we use rmdir instead of 'rm -f' to ensure the non empty directo=
ries are not deleted
> >       # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=3Di68=
6
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#212863): https://lists.openembedded.org/g/openembed=
ded-core/message/212863
> > Mute This Topic: https://lists.openembedded.org/mt/111706016/6551054
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS

