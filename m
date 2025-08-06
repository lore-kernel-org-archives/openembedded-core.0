Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFABC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 14:32:32 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.26660.1754490747653932241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 07:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gOjJ4uNn;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8fce318224so4386896276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754490747; x=1755095547; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgQb7quvQnTcUpHuoSHEp/Injsx7CnxLrpaQI3YGMao=;
        b=gOjJ4uNnUo16oy4/wTTUzGd58QkfsXROQbE0IP87uZJD2O96TqCd7bIoNjKnPsQeTf
         V/aau83u8R6Kw2gFGfvgjhZm3djwZUZknWMiUbRIHlAMVwa5CKP+IfZ+2jH3uV4eXB89
         tg2ncaeew+XPjrR/wWTBkmJ+9vgP4x1QC1heFaKXaB5ahiG0PAascyMt/6WVzTMY0b4X
         M6Vjh9ixGmg3LSGpSNzSPSkbKugmcsTsEMiePi1HD63xgqs2EsF192mAPASig3LLst1d
         yKT1GGsQAtKhO7yZ53L0VpVwS+a+HZom6kUPWoxgAv2Iq1E15g9KciN1AdNkXwsHUkCK
         tb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754490747; x=1755095547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgQb7quvQnTcUpHuoSHEp/Injsx7CnxLrpaQI3YGMao=;
        b=vZjy/39AfELLYLE6jwKF7LGJVNF40yL8BUjm9aVE2kkzRiRM2P0x7xEGELP7ga5diI
         S7Db4l7vIBUkOqA5TL3VeNd+PAatjRTJI25azZSetTE6Tvt0WqwhG2nZtC3wOMyr+Cbf
         ZMdMrCL7KMYCS1FeltmyA7vz+6mY2aS3V05dcrd/oX4TfUXEfzjPY2XRHSAf+56SvXth
         ajVXMIN8sGR3YPBhb+u0nAGJ4loFxoQOx4Va9wCohXdro5reLMxnBNW421USr6bFK6EX
         gSV/30iUAq5Xmwo3upz0ZJCB9TNmjsSUcYJL/W6FWq4YOgrwSv7fEHl/Og3FomgGD1e1
         2Fkg==
X-Gm-Message-State: AOJu0Yz6dYzlvSr+hHkqMhfrRl1U7yJzmzcUPRdYlJH7Ko8no42LcUEB
	v07v8Md7zJUmItIA46NrpYp1aWVxitGOI9gsa0hvb1CyUNk8A/68K/GJh4M8OIdpo+tJe+Gg/ce
	SLr9x9gzHvdy+7P6oYC73sxk6DVNtou14xwcVjHU=
X-Gm-Gg: ASbGncu34svpP4p4hYNHv6LblsEYL6Hu8nwTfvET7Rsg0FzavBlo4Pq1PHYsnsRXqmD
	CU4ODV1VZyOFjPc4x4rXUV/ZlrlhC+moG5hA3nYTEdnMyJBIVXhvRhQ90ZeHC7tpdJCjbBcBjK8
	429zz+D0UaPHhp3s/rQRt/szZQ58RKKX/NeVfG5kH4oqP55spAgf57IAxHTa8yYLoXtTZlDVsdW
	Xxw6lGjpFvduZ5OwfaPHQxuS1geDE6D
X-Google-Smtp-Source: AGHT+IGE41dXvW+Vb/Zwv5CxCOCs59/Zi3snVDIoy3htqLW2ndcLiGGL1WsoRuloTpnofGqxPyxspzi3L+SdFm58MIg=
X-Received: by 2002:a05:6902:4a89:b0:e89:9aea:fdd8 with SMTP id
 3f1490d57ef6-e902ac797d5mr2747747276.31.1754490746559; Wed, 06 Aug 2025
 07:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250729012911.2402010-1-raj.khem@gmail.com> <DBVEXLB4MHYD.1JE6I46WJ5E4B@bootlin.com>
In-Reply-To: <DBVEXLB4MHYD.1JE6I46WJ5E4B@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Aug 2025 07:32:00 -0700
X-Gm-Features: Ac12FXzzowDoJXNtChM5x-R_wBx9mwy3OuYnqELLUS5oOQf4V1gL7j1Q2cHO5u0
Message-ID: <CAMKF1sr9CJ9Xy6QX+NvX3LQVjRm-2RaxCozZ_TwC48t3sWe44g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.42 release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 14:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221542

On Wed, Aug 6, 2025 at 7:26=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Tue Jul 29, 2025 at 3:29 AM CEST, Khem Raj via lists.openembedded.org =
wrote:
> > * GCC 12.1 or later is now required to build the GNU C Library.
> > * GNU Binutils 2.39 or later is now required to build the GNU C Library=
.
> > * Support for lightweight stack guard pages via madvise and the
> >   MADV_GUARD_INSTALL flag has been added to pthread_create.
> > * This is major release, changelog [1]
> >
> > [1] https://sourceware.org/pipermail/libc-announce/2025/000048.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> Sorry for the delay on this patch.
>
> It looks like buildtools cannot build after this update, because of
> ncurses-native:
>
> ERROR: ncurses-native-6.5-r0 do_install: oe_runmake failed
> ...
> | ** Building terminfo database, please wait...
> ...
> | tic: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64=
-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitb=
ake-build-sj26dmh3/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6: versi=
on `GLIBC_2.42' not found (required by /srv/pokybuild/yocto-worker/buildtoo=
ls/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-=
tarball/1.0/testimage-sdk/bitbake-build-sj26dmh3/tmp/work/x86_64-linux/ncur=
ses-native/6.5/build/narrowc/lib/libtinfo.so.5)
> | ? tic could not build /srv/pokybuild/yocto-worker/buildtools/build/buil=
d/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/t=
estimage-sdk/bitbake-build-sj26dmh3/tmp/work/x86_64-linux/ncurses-native/6.=
5/image/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-n=
ativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbak=
e-build-sj26dmh3/tmp/work/x86_64-linux/ncurses-native/6.5/recipe-sysroot-na=
tive/usr/share/terminfo
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2179
>
> Can you have a look at these, please?

Its reporting about glibc 2.42 versioned symbols, so I wonder if we
need to have uninative with glibc-2.42 as well before this can build.

>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

