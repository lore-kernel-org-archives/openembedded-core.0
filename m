Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0B5C77B75
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 01:15:23 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.39090.1683162918004436759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 18:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ix91C5Uh;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-38e2740958aso2190988b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 18:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683162917; x=1685754917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN9IXimGLKr4at8Z2KW/hruwdDyoWamgzWEg17y0VM8=;
        b=Ix91C5Uh/naxclvVwYABBgmdLmY5dbTF0L2blxQ5wcpk6SF2MHoERLepUnjQMBZWEr
         TSfxOmnE6ZrglO6m0to/q3PaHVj9V8+l+r2DCCr6RlElnVI2P9dPtbBQtkN1Pwzsx08y
         7i5lZYFt9k2xdplL4gZ+LfLFIH5DxkLYskt92dk2PcR6HY74WiMNG1Tg10GUSwrca/ks
         AkO/RB3KkrBVjYspGr4/Ajt3uW/94eAldPm1AjNtD7APCELRYwiQWnBR3r1wT0IUk6GY
         cvjuNhEYsACmKZCjCUDNhmsJNuXVXTM0Wv3PSxbja0k3ud/5yDAsRdN0raVYSuqdQK6+
         DKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683162917; x=1685754917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN9IXimGLKr4at8Z2KW/hruwdDyoWamgzWEg17y0VM8=;
        b=YK6jgID3T01lYW4ugZxJU/99DXXeSASdTl9Dl5tqcFURemynEa2CK2CMrQIdelYnPq
         VxWZ2iPERAicYLw9BepFYB3VTeOJL6WDrDJFNNu1dv1OKPtuq1kMN3Bx9LKXpgqR6wU0
         7oND6FUfev0TBmRlGcz38lPOypuK2QGr5GaLrFTElaWRnGgp6FPrtTFhCmRNVT5815Ap
         sV1lHAcj9Zgg6QZ/J2qQ+AUUrF1SEEL2isw8zm+66WKfeoiVqaqKcbSVllBKoq3/mbzl
         R3Y/YjM7+c1QGx9YJOUlr4hm0OXKX7cQlXYsReRJPZF0I814Bh2ozDy6WZvo86g5Jv9O
         srFg==
X-Gm-Message-State: AC+VfDwFWjm1tm8EQl0/67MocCywaAdwr8fynFZXzwsnazqloqoQ472T
	CdKYJ3r530xH2yR7JLyOrSdpjBrUdVq1G/sQbxU=
X-Google-Smtp-Source: ACHHUZ6YrjpI1kUKoqlpRO/Ikeo0qTMlZF8HY2Rw8smXMmH2TlyhVfmnVQpnBMOSh52J0XRWmRpSVoOIxM94YEcyKQc=
X-Received: by 2002:a05:6808:b07:b0:387:14b7:f8e7 with SMTP id
 s7-20020a0568080b0700b0038714b7f8e7mr712432oij.38.1683162917177; Wed, 03 May
 2023 18:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
 <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
 <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
 <CANNYZj-Kt+JMU1BfhqDnFv_S28=-K8ozPFP=3NBPwOYL-PZQ_A@mail.gmail.com>
 <CAMKF1spy_tx3T=HAAA0B8z4sc1vqkMtMSuLBhUCUObdew-drfg@mail.gmail.com> <CAMKF1sov+84T88Gkjfxs8b7Tp28CCgw2HLoCsmFimb9yw6NXZQ@mail.gmail.com>
In-Reply-To: <CAMKF1sov+84T88Gkjfxs8b7Tp28CCgw2HLoCsmFimb9yw6NXZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 18:14:50 -0700
Message-ID: <CAMKF1so6qfwD5=Pisrgwub-fRYR4yM0iDkNSNCtAkQmZj_s21g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 01:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180842

On Wed, May 3, 2023 at 5:36=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, May 2, 2023 at 8:01=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > On Tue, May 2, 2023 at 1:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@=
gmail.com> wrote:
> > >
> > > On Sat, 29 Apr 2023 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:
> > > > I am also seing some segfaults in qemu usermode runs
> > > >
> > > > | /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/1=
6.0.1-r0/qemuwrapper:
> > > > line 2: 1592564 Segmentation fault      (core dumped) PSEUDO_UNLOAD=
=3D1
> > > > qemu-x86_64 -r 5.15 -cpu core2duo -L
> > > > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.=
0.1-r0/recipe-sysroot
> > > > -E LD_LIBRARY_PATH=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-=
linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib:/mnt/b/yoe/master/build/=
tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib
> > > > "$@"
> > > >
> > > > this happens when building libclc from meta-clang
> > >
> > > Does not reproduce here (qemux86-64/poky/musl/gcc/meta-clang master).
> > >
>
> On to this one next. I think it will be good to understand this.

I built it on debian container and it does not segfault, Then I tried
to build it on archlinux ( just recompiling libclc ) and it does not
segfault either which means its some dependency ( maybe a library )
which gets compiled differently when compiled on archlinux and causes
qemu to segfault. I will do a full scratch build on archlinux and see
if it can be reproduced again.

>
> > > > I also saw random build failures in qtbase which is perhaps unrelat=
ed
> > > > but could be this one too
> > >
> > > This needs to be investigated on your side.
> >
> > I see that it is host dependent, it works on debian bullseye but fails
> > with latest archlinux
> > since archlinux is rolling and uptodate it just a matter of time when
> > it starts showing up
> > with one of time based distro releases like fedora or others.
> >
> > >
> > > > Third issue is https://errors.yoctoproject.org/Errors/Details/70188=
9/
> > >
> > > This is from a misconfigured CI on your side and the error is
> > >
> > > "clang-16: error: unable to execute command: Segmentation fault (core=
 dumped)
> > > clang-16: error: linker command failed due to signal (use -v to see i=
nvocation)"
> > >
>
> This seems to be not related to this. which is good news.
>
> > > which may be unrelated. Is it still happening, and is it going away i=
f
> > > this patchset is removed?
> >
> > this have not been tried yet explicitly, I can give it a shot if its
> > not host specific
> >
> > >
> > > Alex

