Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F677C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:01:38 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.221.1683039694090406726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MjH9h8kX;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-54cae469c07so465403eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683039693; x=1685631693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOOnJEqK+Rw2RxoTVrDTPVUl22wLZ8IDNlA0Te173wI=;
        b=MjH9h8kXX/aaTCVJ0+LpMrzuiEN/bpOt1zoS5xAif0S0uFzf5IsP2RKkFyqD0cwSSq
         ZPReKAuBLw6FqMTN9Fy6twxkuPe9rz+g85B3VatoGrrRbjFUs/BB/b3EGWw34IiZplbr
         nVNinu1jk6SC8U3HtyaFoMZVtoXKR01ymuHZ83aJJQLqVscnA1tLh+yn7TYAQTvLH4u1
         ypk0nAJcGpBB0iYgYVH3l6JR1ICS9PYBL8LevARc9jc07TPrOhX2cncSPCNo/6qoZ/6V
         nCinSyFb3sWlVYo5JBAOzTL+qCorKFJF2tJ8JoQXVavjvdq99Js18johk7//2MY8umsT
         /PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683039693; x=1685631693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOOnJEqK+Rw2RxoTVrDTPVUl22wLZ8IDNlA0Te173wI=;
        b=eEhNAeZFZqc/d2tjpjvAQ3sx3E44BTDnazYnT+KvNmTwxpDoQiG/VujNK5gAkaceBp
         6ir6lJTYXmjgMKvYFYTHx+alJ4AkQDRLBHqkdJCMVySKt7Pkty+HcAP/CJyIE2t6iVC5
         aSvMsdQ6YlqlbWKDePu9VqTfVXZhPuekG/JfO1qJsKsLK8BRdZzugY/bTQa8HQbgERpB
         3D9M/jhIfCKjo6vdHNTnfZNiTlpsWDgrYjMtwhYGCFe1WVxgOELfYrEniJWoNXMgHVzS
         g1Xl0qcRRVcddgLMC/GMEsP3uLfZUJNgDnSeqXni1F1p8RMX39fS8doCDKO5ZrKPZaGE
         1hfA==
X-Gm-Message-State: AC+VfDzKmEjwurU4LcTOa0awYWl+qZN7dHnVZH/sbRLwkileRrFhOOAo
	fTmNnL2QdBr7wgUem4xF6fXKOgeA1dDQmsoBxqI=
X-Google-Smtp-Source: ACHHUZ550Rl6mctskjWPRlDojs1BvQCQutiwtCpNgTCV9QCF5GrzDYSowqpl0yFkt+tAHiePKJG10r3f9RRt4XVedCw=
X-Received: by 2002:a05:6820:556:b0:547:57c4:811f with SMTP id
 n22-20020a056820055600b0054757c4811fmr9126161ooj.1.1683039691712; Tue, 02 May
 2023 08:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
 <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
 <CAMKF1soV_hmE+f7ed0r=jo+rQcWyJ4SU1vG3T2YGAqZQsgReWw@mail.gmail.com>
 <CANNYZj9X+dTmBN=5WQdA9af5E7m+Ov9vO=bOjR0p=BeBADMEAg@mail.gmail.com>
 <CAMKF1sq=YOzoqyRzn1bhRwxqWSMV1SnzRKNDutBDiKqw+PjhXw@mail.gmail.com> <CANNYZj-Kt+JMU1BfhqDnFv_S28=-K8ozPFP=3NBPwOYL-PZQ_A@mail.gmail.com>
In-Reply-To: <CANNYZj-Kt+JMU1BfhqDnFv_S28=-K8ozPFP=3NBPwOYL-PZQ_A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 08:01:05 -0700
Message-ID: <CAMKF1spy_tx3T=HAAA0B8z4sc1vqkMtMSuLBhUCUObdew-drfg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180741

On Tue, May 2, 2023 at 1:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> On Sat, 29 Apr 2023 at 21:28, Khem Raj <raj.khem@gmail.com> wrote:
> > I am also seing some segfaults in qemu usermode runs
> >
> > | /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.=
1-r0/qemuwrapper:
> > line 2: 1592564 Segmentation fault      (core dumped) PSEUDO_UNLOAD=3D1
> > qemu-x86_64 -r 5.15 -cpu core2duo -L
> > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/libclc/16.0.1-=
r0/recipe-sysroot
> > -E LD_LIBRARY_PATH=3D/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linu=
x-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib:/mnt/b/yoe/master/build/tmp/=
work/core2-64-yoe-linux-musl/libclc/16.0.1-r0/recipe-sysroot/usr/lib
> > "$@"
> >
> > this happens when building libclc from meta-clang
>
> Does not reproduce here (qemux86-64/poky/musl/gcc/meta-clang master).
>
> > I also saw random build failures in qtbase which is perhaps unrelated
> > but could be this one too
>
> This needs to be investigated on your side.

I see that it is host dependent, it works on debian bullseye but fails
with latest archlinux
since archlinux is rolling and uptodate it just a matter of time when
it starts showing up
with one of time based distro releases like fedora or others.

>
> > Third issue is https://errors.yoctoproject.org/Errors/Details/701889/
>
> This is from a misconfigured CI on your side and the error is
>
> "clang-16: error: unable to execute command: Segmentation fault (core dum=
ped)
> clang-16: error: linker command failed due to signal (use -v to see invoc=
ation)"
>
> which may be unrelated. Is it still happening, and is it going away if
> this patchset is removed?

this have not been tried yet explicitly, I can give it a shot if its
not host specific

>
> Alex

