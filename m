Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975C3CD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 10:07:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35588.1777975614614708380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 03:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JyY9NX4p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so966514f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 03:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777975613; x=1778580413; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LEIt4MQhuhuGhkYEkI2wCGXdEGfkIAtxfvMfR4CEWiw=;
        b=JyY9NX4pQaNGlXL2qY80hY21+AcilczLTBlFHRyUvxacb0ci/k0A39V2x6qfTem5hk
         QRaJOvP1MTJIsplIZ2gfpL1UFbEST7Dm/AbdmO9kSnnWJ+MTAGZ1JPdqZdvr3f0wixPY
         lTVuuunM4L2r4iK9dbzdVVT5fpaenhwljdR4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975613; x=1778580413;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEIt4MQhuhuGhkYEkI2wCGXdEGfkIAtxfvMfR4CEWiw=;
        b=A42AecyRBUfxk1Wn/ES5uVFir2LyKpeBZr6XK/e6gUwbVVzxjdaVEp/36QM5N4mGzV
         N6mby10dl6fyLi8m4YsdjzzGonA9uSt8wSV3CE2eCnk5tNy3sRfHuSS8PDDbyo2H6Xjf
         DpCnIZqQjBDgO3QxUeHFD3KfRgpy9xGOrQlSQ9I9qNHd5Pnt9ypCVuYGfLAkcR83zt++
         uwjWmy3/WBzxr7yYSNYY0ZC3mLk3XhKrG5rq+ICGHOUtfg0XM46t5sZCF60KD7wSjuy+
         Ju45kIdGiWRGQ9uCZWyJSu3DMF5hbEFjAxWalZxCJ4ubqynLGTn93rAMlKxcsmOMdstx
         KDNw==
X-Forwarded-Encrypted: i=1; AFNElJ9UWFvfnNn1X8vOHsNH9FcuNez0W8q74b0Em9Jglj5rivzyEi8kCueSKfJj1hOmU30UD+48PVhYg53Yo8jwFlDvNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzeMxQ3xpt67KAwh+fxES+DIczvQKx4ZAAqIgQFLHlEfheof1Lr
	Neux00BnJrxVXAjVa9uLjXmcBhUs6zgL+xvPCvtlSUu+4cm2n+q582HMyjwwoBb2n9g=
X-Gm-Gg: AeBDieuCRhS8NS9wnp8H0Fj+8nNcWBcQhluSJtdw73zTdnUuMWMrOnU3rTKPCnBxI17
	cc9pledBp1p+aswSn1GId1IPSGir+hbvUzYQgGECeJOoJdsXGOq/2zLBzLTOsdyr2SmKh6XXdOk
	4pLBDl93g4X4QDipFIBhrXTjB0J0TXkBvnubtjJAPh3wybuq2uY46mV5ncUTwLatvAQdelVb7LM
	K4DFJxcUSu7IQQtApc0Muz53r1Mv2sX+fF339eyYU/di4zMMFdGDR3dfuuPoxYvUDCCL5TxhzPv
	U3yqoK+wvKGu195WEvUCX4LH/TkwfcWH6T4UIUG98XuSnk8lRa/jLWrkYZZIuqWep7htum75H3k
	zBeGyjS/GEIIE8Uy/s9DOErWCgZmL/1iYEnBpxBGxs+5CamWte/HE8R8Khrx+q9Hxdbx7Fgmh/Y
	ciK3AjzGaa8IcioNxZ1MA3NVCykBsVQg6IFGDR28Q/aLbx0kfSwCXguqpgBFto5cP0QOGgZ/kjx
	Na4ElZaTHHYnE92c46T2AJ7rMs=
X-Received: by 2002:a5d:64c5:0:b0:44a:b3c4:a044 with SMTP id ffacd0b85a97d-4500623fe80mr3829302f8f.30.1777975612826;
        Tue, 05 May 2026 03:06:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8349:ba09:9e5a:e125? ([2001:8b0:aba:5f3c:8349:ba09:9e5a:e125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-450524834eesm3226336f8f.4.2026.05.05.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:06:52 -0700 (PDT)
Message-ID: <535902c12a1567ab2d551fa72713685e537566e3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5 v5] rust: Fix rust build failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: deepesh.varatharajan@windriver.com, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, mathieu.dubois-briand@bootlin.com
Date: Tue, 05 May 2026 11:06:51 +0100
In-Reply-To: <16853c1f-d823-4b87-b81a-ed9607e9aa5c@windriver.com>
References: <20260505081625.849368-1-Deepesh.Varatharajan@windriver.com>
	 <20260505081625.849368-6-Deepesh.Varatharajan@windriver.com>
	 <fdd844616b3283408f9190ca26ccfe13390358ad.camel@linuxfoundation.org>
	 <16853c1f-d823-4b87-b81a-ed9607e9aa5c@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236479

On Tue, 2026-05-05 at 15:26 +0530, Varatharajan, Deepesh via lists.openembe=
dded.org wrote:
>=20
> On 05-05-2026 15:06, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Tue, 2026-05-05 at 01:16 -0700, Varatharajan, Deepesh via lists.open=
embedded.org wrote:
> > > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> > >=20
> > > Target LLVM tools are installed in the sysroot because they are neede=
d
> > > for llvm-lit to run tests. However, this leads Rust to pick up a targ=
et
> > > llvm-config that cannot run on the host. Overwrite it with the native
> > > llvm-config so Rust can execute it correctly.
> > >=20
> > > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.c=
om>
> > > ---
> > > =C2=A0 meta/recipes-devtools/rust/rust_1.94.1.bb | 5 +++--
> > > =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/rust/rust_1.94.1.bb b/meta/recipes=
-devtools/rust/rust_1.94.1.bb
> > > index 3eb2a36406..e4a9f20e27 100644
> > > --- a/meta/recipes-devtools/rust/rust_1.94.1.bb
> > > +++ b/meta/recipes-devtools/rust/rust_1.94.1.bb
> > > @@ -238,9 +238,10 @@ rust_runx () {
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Copy the natively built llvm-config =
into the target so we can run it. Horrible,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # but works!
> > > -=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUS=
T_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
> > > +=C2=A0=C2=A0=C2=A0 if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} !=3D ${RUS=
T_ALTERNATE_EXE_PATH} ]; then
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p `dirn=
ame ${RUST_ALTERNATE_EXE_PATH}`
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp ${RUST_ALTERNATE_EXE_P=
ATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${RUST_ALTERNATE_EX=
E_PATH}
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -f ${RUST_ALTERNATE_EX=
E_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patchelf --rem=
ove-rpath ${RUST_ALTERNATE_EXE_PATH}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > This appears to be a consequence of the new install in "clang: Enable
> > cmake flags for llvm, clang, lld tests". Perhaps we should just not
> > install llvm-config there if it is going to cause problems and need to
> > be overwritten?
> Yes, this is due to the new installations. We now need the target=20
> llvm-config to run the Clang
> family test suite inside QEMU for the target. Previously, we didn=E2=80=
=99t=20
> install LLVM target tools,
> but running the Clang test suite for the target requires these tools to=
=20
> be present in bin so
> that llvm-lit can use them.
>=20
> Also, the existing check is somewhat odd. Even if llvm-config exists in=
=20
> ${RUST_ALTERNATE_EXE_PATH},
> it can=E2=80=99t be used for building Rust because that version is built =
for the=20
> target. Therefore,
> overriding it with the native llvm-config makes sense.

We simply can't mix target and native binaries like this.=C2=A0

Think about what happens if you take target sstate built on x86-64 and
reuse it on an aarch64 host system.

Cheers,

Richard



