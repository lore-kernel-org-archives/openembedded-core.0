Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12B8C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 21:12:35 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.22014.1681852349455427018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 14:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=kDYelUFb;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-329627dabfbso39023825ab.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681852348; x=1684444348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rV4/KTptNcfsbNfj9hXokFb7w4O41buAGa3WtQcUCJE=;
        b=kDYelUFby4HaO2tJXWLayalY910mzGLEBL/BVO6a/TcAuBQ+DFQc3RcONiNPQEd3rH
         WXRJO8z7cKngbsm+OTEBNHRRo1/TJynPpvhU7D59Vk6+dyWiHiBU9tV5I3yaEsXS5byE
         PrGP9xwewe8HDs9cdr9HMI0WsB3nplWAqo6CiigB4joP3bYpm9iMWfQfmXZlmbX53akl
         6+Y6ovYaJma3LIB6uAPvXHB3QJDobXeVKCCfJWoRr10nGN13m2K8etvdSQkXyvGv3/MX
         l3SRMBYBkST5KcWEjjKp9OvA3GaK7g/o+GzDFjupjRGTpUe5xocmVCtco6IRlHdhKe73
         0ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681852348; x=1684444348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rV4/KTptNcfsbNfj9hXokFb7w4O41buAGa3WtQcUCJE=;
        b=fUgniMvl4S3K55jgbaor50E3PqNNXzMMcR0Zi/Ani38cwKlS73I6NNz/Rhp010TZx8
         Ba8MRP63ZjZ6rzBi0rI3RgEhe6iRj/biZpwyqrzsoXaLLR+OZWRqSOTZ2Btn5KFHbmhR
         UdXHwumcoB2ZwSd8Cj+X18ncOiBWYpqvQvChOLi9A3cCXCfNEpzPLeZVG0E5BhKjQsb7
         WkFIqY7BvHLvjUIy5I+FaXXmkYVpmBUEQB0rpMc1tlo3e++SWbSk5VIsQTrC/3kVheFY
         lWJ4dSZJ7TtKj2f0zPfgpl+lQ4xn2w241QsxPPLmgwAojpyBkkF7CvjKF65NhMBsVxuR
         e/Fg==
X-Gm-Message-State: AAQBX9fIJT4h5vTXwV3tMgmS74ulzmVZN8l5QT7UWDGPgYf256yX992m
	+bi3CwWkXBtClfUyRzgBm6IjiDqxoarIpceSFOs=
X-Google-Smtp-Source: AKy350YPAq6ITOhvLXAls+G/k3qQaooNrIfNJwTv4oA/C5hnNQUT8TbnY6OrYPqcVEERFPeHETvtUmjkRMKDYrIBJno=
X-Received: by 2002:a05:6602:2c94:b0:760:f293:12d8 with SMTP id
 i20-20020a0566022c9400b00760f29312d8mr194325iow.7.1681852348664; Tue, 18 Apr
 2023 14:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com> <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
In-Reply-To: <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Apr 2023 17:12:20 -0400
Message-ID: <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Christoph Lauer <christoph.lauer@email.de>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 21:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180203

On Tue, Apr 18, 2023 at 5:04=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:
> > On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose@gm=
ail.com> wrote:
> > >
> > >
> > >
> > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia s=
egunda, 17/04/2023 =C3=A0(s) 20:51:
> > > >
> > > > On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> > > > > From: Christoph Lauer <christoph.lauer@xtronic.de>
> > > > >
> > > > > With rm_work active, external module signing throws an error:
> > > > > scripts/sign-file: error while loading shared libraries: libcrypt=
o.so.3: cannot open shared object file: No such file or directory
> > > > > Preserve libraries that sign-file script needs during runtime.
> > > > >
> > > > > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> > > > > ---
> > > > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3=
 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-script=
s_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > > > > index 28e0807d1d..0e24efc597 100644
> > > > > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> > > > > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> > > > > @@ -32,3 +32,6 @@ do_configure() {
> > > > >               -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILD=
DIR} $t
> > > > >       done
> > > > >  }
> > > > > +
> > > > > +# keep native libraries required for module signing
> > > > > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> > > >
> > > > I'm really reluctant to take this change as it isn't the way
> > > > dependencies are meant to work.
> > > >
> > > > It sounds like something in a shared workdir is depending on someth=
ing
> > > > in a recipe workdir and we simply don't support that. Everything ne=
eded
> > > > should be in the shared workdir. At best this is a bandaid and ther=
e
> > > > will be other ways to make this fail such as cleaning make-mod-scri=
pts.
> > >
> > >
> > > The problem is because for signing the kernel modules the sign-file.c=
 [1] is linked dynamically with openssl-native.
> > > This works when building the in tree kernel modules but will fail whe=
n we try to sing any out of tree kernel module.
> > > To sign the out of tree kernel we will use the binaries from the shar=
ed workdir but the native libcrypto.so.3 is removed by
> > > the rm_work bbclass. We need to link the sign-file statically otherwi=
se it will not work with the rm_work bbclass.
> > >
> > > [1] https://github.com/torvalds/linux/blob/master/scripts/sign-file.c
> > >
> > > Another solution for this problem can be changing the make-mod-script=
s to be a native tool and in this way
> > > they will be installed and the dependencies will be handled correctly=
.
> >
> > There would very likely be different issues if the scripts were
> > generated and then packaged as a native tool / package. Since they are
> > so tightly coupled to the kernel. We'd just trade one set of issues
> > for another (out of sync artifacts, etc).
> >
> > I'm going to hack on this a bit.
> >
> > That being said, I've never done any module signing .. since I don't
> > need it in my development workflow.
> >
> > Is there a canonical guide to getting it setup so I can test my static
> > link and relocated artifacts fixes ? is it with meta-integrity and the
> > kernel-modsign bbclass ?
>
> I did think about this a bit more. It does likely depend on the version
> of libcrypto from the host system as to whether it reproduces or not.
> The possible solution ideas I came up with are:
>
> a) statically link sign-file so we don't need libcrypto
> b) copy the libcrypto.so into a known location in the shared workdir
> (probably some new path) and then adding an RPATH/RUNPATH using chrpath
> to the binary.

Agreed. I have sign-file statically building here, and it works, but
objtool is blowing up under static linking.

If I can't break the tools into separate bits, or fix that static link
.. My other idea is the same as yours, if we copy out the .so and make
sure it is in a recognized location in the artifacts dir, we are good
to go.

Bruce

>
> Cheers,
>
> Richard
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

