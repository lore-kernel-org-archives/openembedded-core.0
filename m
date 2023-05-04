Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EBDC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 03:37:34 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.41850.1683171451324643824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 20:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DN4Wa9Xm;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-192cd5579faso31623fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 20:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683171450; x=1685763450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGt9XEyX1dtZJOmrGU9S6nLOSrfNhSDuO4Y/C/Ff05Y=;
        b=DN4Wa9XmXQlRyUxZwelw746Uah9QKUxo7eiqeTcqR1abde5jI90dF1/jqB+vNP1vRN
         AGeJdoWIA5cyzpDc4w/bQ3UjE656nUtwerBpLeWCaR/N+m9GphjlCqAyxnjSmChc1fMj
         +e9AZbgwsrytdUv1XtGeWKIFYI3ugw5NbiU5GdZuU5tDukqUF1BS2loZ30PYQWfL4XOJ
         DAx0BOrhcQuwmv+MeS2fx3b8N9FTDIdGvTZY9E2z1vdpVNzLBmNUgtARk459JuaWdO5Q
         ilKxBMp+Uckz0Qqn/MuPSuLVML5yOoeIm672bYmT71DvqGMzpdT+IlzWzWrknWEiBJfz
         l1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683171450; x=1685763450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGt9XEyX1dtZJOmrGU9S6nLOSrfNhSDuO4Y/C/Ff05Y=;
        b=bBrbT22J/7cFGkeXVKFDMsBQjKCXXeDmu4kKw93WRKRwA6gTlAnEXfjuTykBzOixKw
         dwhtktdMNLRJulvHkNtkMN7Tp8MlNqZMC5bHCrKwrOM/VeOgOyxXLMOR9q+zL0Emep3B
         gwq3MxtRFWZtYQGomX482Y8u91MiI7rd2z+gpwgsUFKzm6ZnjJhqH1ma8OW8D6OhiNsJ
         mMOIvj0G2H2vX7Gj8txZQNGzne8vYukJoramHpzMpBNf2NtsfNX0YrHA++0Ck6DMAO/l
         Hkb3CNyZZY4QI5if3BshVXXE/wG+KVzMKt9O9w5h5QBipDwKI5UP27vA3gpvmiKs3zTt
         3Z3w==
X-Gm-Message-State: AC+VfDybZ1mrNX959kXXmhQ5Io9dCSqIYI2+3BNS+Jv7Y20LZvpWaaPk
	1pFwMrB+zYHo+gybX9vqyASLO5egqR0rq5sgOKA=
X-Google-Smtp-Source: ACHHUZ7mx4ft7E1k8IXFf/cYBFf2znDlAaKBBxAGS0EaONe7ub5k10M1Sa9bNnjobsW0nquO3aI+fXgwECraW0dzffw=
X-Received: by 2002:a05:6808:1312:b0:38d:e13b:9af with SMTP id
 y18-20020a056808131200b0038de13b09afmr870838oiv.28.1683171450417; Wed, 03 May
 2023 20:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
 <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
 <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com>
 <CANNYZj-Kt+JMU1BfhqDnFv_S28=-K8ozPFP=3NBPwOYL-PZQ_A@mail.gmail.com>
 <CAMKF1spy_tx3T=HAAA0B8z4sc1vqkMtMSuLBhUCUObdew-drfg@mail.gmail.com>
 <CAMKF1sov+84T88Gkjfxs8b7Tp28CCgw2HLoCsmFimb9yw6NXZQ@mail.gmail.com> <CAMKF1so6qfwD5=Pisrgwub-fRYR4yM0iDkNSNCtAkQmZj_s21g@mail.gmail.com>
In-Reply-To: <CAMKF1so6qfwD5=Pisrgwub-fRYR4yM0iDkNSNCtAkQmZj_s21g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 May 2023 20:37:04 -0700
Message-ID: <CAMKF1sqs97-7fLVWzZzWhUn3svr6FZW=zZb5Na8+uT8k5f9sCg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 03:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180845

On Wed, May 3, 2023 at 6:14=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 3, 2023 at 5:36=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > On Tue, May 2, 2023 at 8:01=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> > >
> > > On Tue, May 2, 2023 at 1:42=E2=80=AFAM Alexander Kanavin <alex.kanavi=
n@gmail.com> wrote:
> > > >
> > > > On Sat, 29 Apr 2023 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > I am also seing some segfaults in qemu usermode runs
> > > > >
> > > > > | /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc=
/16.0.1-r0/qemuwrapper:
> > > > > line 2: 1592564 Segmentation fault      (core dumped) PSEUDO_UNLO=
AD=3D1
> > > > > qemu-x86_64 -r 5.15 -cpu core2duo -L
> > > > > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/1=
6.0.1-r0/recipe-sysroot
> > > > > -E LD_LIBRARY_PATH=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yo=
e-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib:/mnt/b/yoe/master/buil=
d/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib
> > > > > "$@"
> > > > >
> > > > > this happens when building libclc from meta-clang
> > > >
> > > > Does not reproduce here (qemux86-64/poky/musl/gcc/meta-clang master=
).
> > > >
> >
> > On to this one next. I think it will be good to understand this.
>
> I built it on debian container and it does not segfault, Then I tried
> to build it on archlinux ( just recompiling libclc ) and it does not
> segfault either which means its some dependency ( maybe a library )
> which gets compiled differently when compiled on archlinux and causes
> qemu to segfault. I will do a full scratch build on archlinux and see
> if it can be reproduced again.

It worked with scratch build, however its not same archlinux as last
week. GCC got
upgraded to 13.x and i had to disable uninative so it might still be
hidden there for now
lets ignore it

>
> >
> > > > > I also saw random build failures in qtbase which is perhaps unrel=
ated
> > > > > but could be this one too
> > > >
> > > > This needs to be investigated on your side.
> > >
> > > I see that it is host dependent, it works on debian bullseye but fail=
s
> > > with latest archlinux
> > > since archlinux is rolling and uptodate it just a matter of time when
> > > it starts showing up
> > > with one of time based distro releases like fedora or others.
> > >
> > > >
> > > > > Third issue is https://errors.yoctoproject.org/Errors/Details/701=
889/
> > > >
> > > > This is from a misconfigured CI on your side and the error is
> > > >
> > > > "clang-16: error: unable to execute command: Segmentation fault (co=
re dumped)
> > > > clang-16: error: linker command failed due to signal (use -v to see=
 invocation)"
> > > >
> >
> > This seems to be not related to this. which is good news.
> >
> > > > which may be unrelated. Is it still happening, and is it going away=
 if
> > > > this patchset is removed?
> > >
> > > this have not been tried yet explicitly, I can give it a shot if its
> > > not host specific
> > >
> > > >
> > > > Alex

