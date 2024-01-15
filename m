Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17962C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 20:53:24 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.95554.1705351997985730327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 12:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KSB+CJZ1;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bba0ac2e88so4516492b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 12:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705351997; x=1705956797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joHMT5/6egP1b90Lajczl82g5YBgNb657Uoyz8Rul+w=;
        b=KSB+CJZ1p4QoxLpbre+SP2y418wCpcwoz9Ahi+PoXmaLMfSyJcP1ytLOnsPy6RuzMx
         M6f8STGS7/4eSyEatngwaaIOc6HDGHbMSdWc1d/8vYsRtidRYxYD5Tww8kfe1ERXXNBa
         9WJh3cbnnqLEfGCf6GyAyy6U3N3USRdmIG2aGL/Ol7UMNceffcVTQESkzp3pyW5SjATR
         kv2lKJ5TYZJ65QapzhhmFMj2Brt9GQH5StIUzUZl2TrSUK2vDfdp7UlP4F302ujbqF7y
         Rcl20be+nQfKqLLZVYbvJ8jNyxpc/aZu/egBnbxgec3yRTRXoCXxWqsZU+6QyBr7Oe2h
         AWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705351997; x=1705956797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joHMT5/6egP1b90Lajczl82g5YBgNb657Uoyz8Rul+w=;
        b=eN6C1e2WtZiaUhkbYHlY5VdLwqQLXL3pjLemMZ7mJb+zgA59js1OBiVWpCZfArIM0J
         LPxhIuNtCF+MjwzxuNMs985BSK9qCCHz+u5emf6mQrE+W7QRegF3dNMyJ365aWMWYCKq
         Sy0uiBgUZJ3TABDJUWwaEG8gsRTqGS9uHi2if3eyLZ+zIrPwyYKckJOv4bnCukMvqgcp
         w30RvPq8pGwhTDW+jlIf3lRnm9/zW34BRlIBHaE591LELawIsMwd/4wm97VLeHn7SSZi
         QeLqQT8/5HOe4eByYTZWS6rQhcs/9NHGnZkdU7hLovbdcDNAc+lR4tO9RUK/dWO17ape
         Mo2A==
X-Gm-Message-State: AOJu0Yzg0AGYcJIqGA+Y8rHNcfZVFtVUtq4kvy3k/9zreuEdqb2jIf0A
	+UOTnRXlzYVgTNJoyS71MKiqKbwUcForM+9Jkao=
X-Google-Smtp-Source: AGHT+IHb+11pMpniQ+/f+CiAnLMSMWUKtubKfUGtwsifFSCCJPafR2nI1hLbu6X3Zp4PvPE/r86y8iSaTkVnru5BE0k=
X-Received: by 2002:aca:1c12:0:b0:3bd:3526:d467 with SMTP id
 c18-20020aca1c12000000b003bd3526d467mr2342631oic.45.1705351997064; Mon, 15
 Jan 2024 12:53:17 -0800 (PST)
MIME-Version: 1.0
References: <20240114055844.2301337-1-raj.khem@gmail.com> <cd7e909003596bb4db2b3a946e2b846aad5e9de9.camel@linuxfoundation.org>
 <CAMKF1sph2E72GXvpy43X9Ow+=PDk01F+465HRJ-Xa1ZxpFaQtw@mail.gmail.com> <00252e76cee7b3dfe4ed1abbb200b22e85608df4.camel@linuxfoundation.org>
In-Reply-To: <00252e76cee7b3dfe4ed1abbb200b22e85608df4.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 12:52:51 -0800
Message-ID: <CAMKF1sou0=TOzj7s2wnGG5R3pS6eEZiLSfYZkN_G9tnPFGB+Og@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Use llvm-config from native llvm-rust on
 rust target builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 20:53:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193800

On Mon, Jan 15, 2024 at 9:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-01-15 at 08:56 -0800, Khem Raj wrote:
> > Hi
> >
> > On Mon, Jan 15, 2024 at 5:19=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2024-01-13 at 21:58 -0800, Khem Raj wrote:
> > > > target rust recipe builds ( cross compile ) calls llvm-config
> > > > from
> > > > target sysroot which works ok as long as C++ runtime it needs is
> > > > available on build host e.g. libstdc++ etc. which is commonly the
> > > > case, however when using clang and llvm runtime this falters
> > > > since
> > > > it should be using libc++ from native sysroot and if this does
> > > > not
> > > > exist on build machine this fails to find libc++ shared object
> > > > and
> > > > llvm-config fails to run. This ensures that llvm-config version
> > > > in
> > > > use is correctly relocated and can use shared libraries from
> > > > native
> > > > sysroot correctly. Adding ORIGIN to sysroot will look for the .so
> > > > in
> > > > same dir as the binary and there is the libc++.so.1 copied in
> > > > place
> > > >
> > > > Fixes rust build with clang compiler.
> > > >
> > > > > /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-
> > > > > linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-
> > > > > config: error while loading shared libraries: libc++.so.1:
> > > > > cannot open shared object file: No such file or director
> > > > y
> > > > > thread 'main' panicked at llvm.rs:551:19:
> > > > > command did not execute successfully:
> > > > > "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-
> > > > > linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-
> > > > > config" "--version"
> > > > > expected success, got: exit status: 127
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >   meta/recipes-devtools/rust/rust_1.74.1.bb | 8 ++++++--
> > > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > > b/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > > index 30543ada7db..2dffe009827 100644
> > > > --- a/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > > +++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > > @@ -198,9 +198,13 @@ rust_runx () {
> > > >       # Copy the natively built llvm-config into the target so we
> > > > can run it. Horrible,
> > > >       # but works!
> > > >       if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
> > > > ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ];
> > > > then
> > > > -        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
> > > > +        tgtdir=3D`dirname ${RUST_ALTERNATE_EXE_PATH}`
> > > > +        mkdir -p ${tgtdir}
> > > >           cp ${RUST_ALTERNATE_EXE_PATH_NATIVE}
> > > > ${RUST_ALTERNATE_EXE_PATH}
> > > > -        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> > > > +        if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ]; then
> > > > +            cp ${STAGING_LIBDIR_NATIVE}/libc++.so.1 ${tgtdir}/
> > > > +        fi
> > > > +        chrpath -r \$ORIGIN ${RUST_ALTERNATE_EXE_PATH}
> > > >       fi
> > > >
> > > >       oe_cargo_fix_env
> > >
> > > Copying a native library into the target sysroot goes beyond what
> > > I'm
> > > comfortable with even for this horrible hack with llvm-config.
> > >
> >
> >
> > It=E2=80=99s just supporting the original hack to work properly I don=
=E2=80=99t think
> > it=E2=80=99s any worse that the original hack
>
> Putting a non-target library into the target sysroot could cause all
> kinds of problems if the target and native are similar enough the
> libraries can be seen and confused by the linker. I do see that as a
> big and potentially very dangerous difference.

Agreed. although the conditions it must meet to fail make it quite unlikely
since it goes into specific directory llvm-rust/bin where llvm-rust
binaries are installed
under sysroot, and none of those target binaries use RPATH except
llvm-config but there is a chance.


>
> > >
> > >
> > > Since it seems to be finding it by RPATH, can you not just add an
> > > RPATH
> > > to the native sysroot in the binary?
> > >
> >
> >
> > It does not work and I don=E2=80=99t know why but seems rpath in llvm-c=
onfig
> > affects what paths it spits out
>
> I am reluctant to take this without a better understanding of what is
> going on here. We may need to fix the lvm-config issues properly.
>

I think if we use ORIGIN relative paths into RPATH, it works ok, previously
I tried to hardcode native sysroot paths. I will send a revised
version to replace
it with RPATH

> Cheers,
>
> Richard
>

