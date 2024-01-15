Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A58C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 17:49:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.89457.1705340991635316184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 09:49:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QYWaJS49;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e586a62f7so67064725e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705340990; x=1705945790; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yoBCFg73W0saIMiuibshkgWUXU93MI1Bl8mxbk2sJFw=;
        b=QYWaJS49pJQ9aDcOBsshc7ABj9+5ndPo73UKSPbfilcFJ/qwfT/4nMIZqwmk2xWFuV
         x9VZblTf9mzZswIP9q6QBQ5lYgRCz4D0mzkVEOBRMCzNCvlpD6vyuUMAFKo7GHE1sJHR
         L73PeniATDNNYlkx6h0ns6kEYyS4SEuRzRgv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705340990; x=1705945790;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoBCFg73W0saIMiuibshkgWUXU93MI1Bl8mxbk2sJFw=;
        b=Qcr7ttxhMg+nXygu/UEBw0/xMOgWBqQ3K7qCap/k7iUPt+iA7f/bcVmMQvvB2XazN3
         KFoi4U84kIA3JcH4qr1A/owLb2bqIfM+f2bARPdWfWsnZN4seHy8CsO4HGKkDpJg5sq4
         EMxsiFP/2LdP8k7NHOCs4g0vF0U+HKLzold3SKzjtEJkBrVIYEPyQEOrZDKe/ocruHrv
         swuQ1IdEdIf6S+zuhib3CzdPSYgBtuVMq9eqVOlkx9em2by8QkPmDQ0vORk53ck/AJIo
         8kOHzAOid3cQZvB7+x2Wwb6dq1vIxIKuW1gBfTNGIC3Orm0Xn6ttr0VAMOZ+Fvz7ufd4
         R6xw==
X-Gm-Message-State: AOJu0YzVMQMR4cw2qhkKZXEVpUsVNWTRe+1DgWODeMU4oFkrI2nRUtEa
	emTT/EI1tR/Hwk3kocPGtR5iaLEEY6dxNg==
X-Google-Smtp-Source: AGHT+IF1KLpRXs8N7jM28c2JVXV5YnQXQ9OrEs/zQiDwks4p4ZC69mSXl5eppHw3M/z0NYJ03VXJyg==
X-Received: by 2002:a05:600c:3b07:b0:40e:372e:a0f1 with SMTP id m7-20020a05600c3b0700b0040e372ea0f1mr3416177wms.112.1705340989840;
        Mon, 15 Jan 2024 09:49:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:72a4:a6e5:bd33:85bd? ([2001:8b0:aba:5f3c:72a4:a6e5:bd33:85bd])
        by smtp.gmail.com with ESMTPSA id jb13-20020a05600c54ed00b0040e418494absm16234266wmb.46.2024.01.15.09.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 09:49:49 -0800 (PST)
Message-ID: <00252e76cee7b3dfe4ed1abbb200b22e85608df4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Use llvm-config from native llvm-rust
 on rust target builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jan 2024 17:49:48 +0000
In-Reply-To: <CAMKF1sph2E72GXvpy43X9Ow+=PDk01F+465HRJ-Xa1ZxpFaQtw@mail.gmail.com>
References: <20240114055844.2301337-1-raj.khem@gmail.com>
	 <cd7e909003596bb4db2b3a946e2b846aad5e9de9.camel@linuxfoundation.org>
	 <CAMKF1sph2E72GXvpy43X9Ow+=PDk01F+465HRJ-Xa1ZxpFaQtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193796

On Mon, 2024-01-15 at 08:56 -0800, Khem Raj wrote:
> Hi
>=20
> On Mon, Jan 15, 2024 at 5:19=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2024-01-13 at 21:58 -0800, Khem Raj wrote:
> > > target rust recipe builds ( cross compile ) calls llvm-config
> > > from
> > > target sysroot which works ok as long as C++ runtime it needs is
> > > available on build host e.g. libstdc++ etc. which is commonly the
> > > case, however when using clang and llvm runtime this falters
> > > since
> > > it should be using libc++ from native sysroot and if this does
> > > not
> > > exist on build machine this fails to find libc++ shared object
> > > and
> > > llvm-config fails to run. This ensures that llvm-config version
> > > in
> > > use is correctly relocated and can use shared libraries from
> > > native
> > > sysroot correctly. Adding ORIGIN to sysroot will look for the .so
> > > in
> > > same dir as the binary and there is the libc++.so.1 copied in
> > > place
> > >=20
> > > Fixes rust build with clang compiler.
> > >=20
> > > > /mnt/b/yoe/master/build/tmp/work/riscv64-yoe-
> > > > linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-
> > > > config: error while loading shared libraries: libc++.so.1:
> > > > cannot open shared object file: No such file or director
> > > y
> > > > thread 'main' panicked at llvm.rs:551:19:
> > > > command did not execute successfully:
> > > > "/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-
> > > > linux/rust/1.74.1/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-
> > > > config" "--version"
> > > > expected success, got: exit status: 127
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > =C2=A0 meta/recipes-devtools/rust/rust_1.74.1.bb | 8 ++++++--
> > > =C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > b/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > index 30543ada7db..2dffe009827 100644
> > > --- a/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > +++ b/meta/recipes-devtools/rust/rust_1.74.1.bb
> > > @@ -198,9 +198,13 @@ rust_runx () {
> > > =C2=A0 =C2=A0 =C2=A0 # Copy the natively built llvm-config into the t=
arget so we
> > > can run it. Horrible,
> > > =C2=A0 =C2=A0 =C2=A0 # but works!
> > > =C2=A0 =C2=A0 =C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D
> > > ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ];
> > > then
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p `dirname ${RUST_ALTERNATE_EXE_P=
ATH}`
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgtdir=3D`dirname ${RUST_ALTERNATE_EXE_P=
ATH}`
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${tgtdir}
> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${RUST_ALTERNATE_EXE_PATH_NATIV=
E}
> > > ${RUST_ALTERNATE_EXE_PATH}
> > > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 chrpath -d ${RUST_ALTERNATE_EXE_PATH}
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${STAGING_LIBDIR_NATIVE}/libc++.=
so.1 ]; then
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${STAGING_LIBDIR_NATIVE=
}/libc++.so.1 ${tgtdir}/
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 chrpath -r \$ORIGIN ${RUST_ALTERNATE_EXE=
_PATH}
> > > =C2=A0 =C2=A0 =C2=A0 fi
> > > =C2=A0=20
> > > =C2=A0 =C2=A0 =C2=A0 oe_cargo_fix_env
> >=20
> > Copying a native library into the target sysroot goes beyond what
> > I'm
> > comfortable with even for this horrible hack with llvm-config.
> >=20
>=20
>=20
> It=E2=80=99s just supporting the original hack to work properly I don=E2=
=80=99t think
> it=E2=80=99s any worse that the original hack=C2=A0

Putting a non-target library into the target sysroot could cause all
kinds of problems if the target and native are similar enough the
libraries can be seen and confused by the linker. I do see that as a
big and potentially very dangerous difference.

> >=20
> >=20
> > Since it seems to be finding it by RPATH, can you not just add an
> > RPATH
> > to the native sysroot in the binary?
> >=20
>=20
>=20
> It does not work and I don=E2=80=99t know why but seems rpath in llvm-con=
fig
> affects what paths it spits out=C2=A0

I am reluctant to take this without a better understanding of what is
going on here. We may need to fix the lvm-config issues properly.

Cheers,

Richard


