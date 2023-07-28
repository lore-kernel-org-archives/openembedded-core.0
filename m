Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC553C0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:48:07 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.33875.1690555677549605298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LuxZrFCT;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so1036720e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690555675; x=1691160475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmUF7ZZLlcu0g+vK9laY1QCVxFBhhTaOt0QeCACO1BA=;
        b=LuxZrFCT/wfuYKeKtVm4/SgEn3BJW24IgIYRiT0g669K2v3o0lEVHB2tvonsh3T5I9
         4w2msuztGtRxtjjrzwrl2bwgBnZHor4PbgsvuF01kVrdEGal8Pe+D1WmX+x3r4haLZ5J
         CWhBvBt9Brdkc+0sE3n/Gd61RnrTBt413MMYV4GkyJEuQY2DjZgL71CQtaYsxTplzKv2
         7+GvA5G2M6F7LlCg6jvppfOQc0uywrIVFId7eKoiZzWqV1LQoN9TAq9HJigjVOnSZytr
         QoQ7CWi//z5qrHVui7cKlGNGrIsdoimqMt94QP5elYsg9E+DDHTr9aT8ZI0D26e4Wzyu
         fHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690555675; x=1691160475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmUF7ZZLlcu0g+vK9laY1QCVxFBhhTaOt0QeCACO1BA=;
        b=gdxIXZAIS2gyW2ZGNx56LfGY0mYUuzcUDaBYrlwO+QBUUURtoFrZTomfWrAY1pgvmy
         07/TfiSSuNfJzbE0sRhHkLif4M/g+PS556KR4aKI595XHiM0WIvnSb7vhc2O6jxwCp7P
         kTPyAmiHPpvGLkLr32R65uQYVYkOMHHO3koxfJh3wpPD44o/9scGkSIWtOIJUPtcqhux
         TAtwSfTd/sHqU4nb0WzG6O9Y/dOnmaV4zp3LMB9oUKY9/+2BV7X3UjAD/wIhdxd+HZR8
         TRlnm5OEjRiOoautyiiB7sPcOsmewwAL52ozgNOo7V3PDFruPxLnEruFvXQy1zXVbI7I
         QJCw==
X-Gm-Message-State: ABy/qLa7mOZlfm8UlKyIcRcJpcNX6SUJQagqSJjbC5G5Wd7DMPaQ59vT
	B8Vjscd5dgkPg+/lyZdlA30qMdIRhX2C75NJsYw=
X-Google-Smtp-Source: APBJJlH9KQBKioE6Goxsr/juxYKWwflSbq+ZK5UzmephTQyTEiOhOabgd7ftbmbRqwK4DSoVXYiiJ55imLRnBc/6tXo=
X-Received: by 2002:a05:651c:120c:b0:2b5:9d78:213e with SMTP id
 i12-20020a05651c120c00b002b59d78213emr2058640lja.22.1690555675315; Fri, 28
 Jul 2023 07:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-8-alex@linutronix.de>
 <3365158d-96a0-3d0d-1129-337efb34f50b@gmail.com> <CANNYZj8pdcvQebawV2q4gnH09VRs=hgM9WNoJYQaa+4y-dUhRA@mail.gmail.com>
 <CAMKF1soCnz4zD=AvryDAfZ8a8i_5NOr-tZ7ROS-NcWf2aC13=g@mail.gmail.com>
In-Reply-To: <CAMKF1soCnz4zD=AvryDAfZ8a8i_5NOr-tZ7ROS-NcWf2aC13=g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 28 Jul 2023 16:47:44 +0200
Message-ID: <CANNYZj-BPvhxcJn1K7-kkpZmWm_9Qhr2usFToj1cWTfMVs2FGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/21] gnu-efi: upgrade 3.0.15 -> 3.0.17
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 14:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185035

Maybe. My goal is only to update the version; if you can experiment
with CCLD vs LD and send a followup I'd appreaciate. (I don't even
know what the difference is). The update passed a-full, so it doesn't
cause obvious problems at least.

Alex

On Fri, 28 Jul 2023 at 16:44, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jul 28, 2023 at 3:57=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Thu, 27 Jul 2023 at 18:09, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On 7/27/23 7:36 AM, Alexander Kanavin wrote:
> > > > Unset LDFLAGS as the standard ones do not work when linking EFI bin=
aries
> > > > (the new version of gnu-efi adds various apps).
> > > >
> > >
> > > curious about which ldflags are problematic from OE env.
> >
> > | x86_64-poky-linux-ld
> > --sysroot=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky=
-linux/gnu-efi/3.0.17-r0/recipe-sysroot
> >   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fcanon-prefix-map
> > -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/core=
2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/3=
.0.17-r0
> >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/cor=
e2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/=
3.0.17-r0
> >  -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/cor=
e2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/=
3.0.17-r0
> >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/cor=
e2-64-poky-linux/gnu-efi/3.0.17-r0/gnu-efi-3.0.17=3D/usr/src/debug/gnu-efi/=
3.0.17-r0
> >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/cor=
e2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=3D
> >  -fmacro-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/cor=
e2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot=3D
> >  -fdebug-prefix-map=3D/srv/storage/alex/yocto/build-64-alt/tmp/work/cor=
e2-64-poky-linux/gnu-efi/3.0.17-r0/recipe-sysroot-native=3D
> >  -Wl,-z,relro,-z,now -nostdlib --warn-common --no-undefined
> > --fatal-warnings --build-id=3Dsha1 -nostdlib --warn-common
> > --no-undefined --fatal-warnings --build-id=3Dsha1 -shared -Bsymbolic
> > -L../lib -L../gnuefi ../gnuefi/crt0-efi-x86_64.o ctors_test.o
> > ctors_fns.o -o ctors_test.so -lefi -lgnuefi
> > /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gnu-e=
fi/3.0.17-r0/recipe-sysroot/usr/lib/../lib/x86_64-poky-linux/13.1.1/libgcc.=
a
> > -T /srv/storage/alex/yocto/build-64-alt/tmp/work/core2-64-poky-linux/gn=
u-efi/3.0.17-r0/gnu-efi-3.0.17//apps/../gnuefi/elf_x86_64_efi.lds
> > | x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'
> > | x86_64-poky-linux-ld: use the --help option for usage information
> >
>
> I see, OE LDFLAGS assume compiler driver to call linker and thats why
> bunch of -Wl, options are used but here, bare ld is called. Does it
> make sense to use CCLD
> as linker instead of bare LD in these makefiles. Some options like
> prefix map etc might be useful for removing build time paths and
> hash-style is also important one.
>
> >
> > > > -FILES:${PN} +=3D "${libdir}/*.lds"
> > > > +FILES:${PN} +=3D "${libdir}/*.lds ${libdir}/gnuefi/apps"
> > >
> > > Do you think if there is any positives of these be packaged separatel=
y?
> >
> > Not really. gnu-efi is a static library that consumers (e.g.
> > systemd-boot) link with at build time, so the main package has nothing
> > other than these apps, and one small .lds file. If there's a better
> > way, it should be done by someone who's an expert in it.
> >
> > Alex

