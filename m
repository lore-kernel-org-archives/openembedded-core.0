Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6561CC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:48:09 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.3263.1748551687633523982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ODNMF/G8;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6060a70ba80so710956eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748551687; x=1749156487; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yV6bmKzpwujbGtf7Nu0qD7Gr5SJRgK5YnQhv4I57FY=;
        b=ODNMF/G8SKsvNIj9fDLSStQYMICfecrmwKkEKqcEH7EoYe1n4zVPS3WIVqZdz9XdUs
         7eIf4G57WIvu+YPHitFth02SuNl6ofrW5TkvX0VIwNcUfuRMtA1E/89Psc2AFRQba6fy
         qMYIP047sQMA9Wf0NUqZQaZiIs0NjCtJDXMTorgbGk562YSwfMbp5WkRw/4Mkjb+xlbL
         Elj1NfHLsoXNcRbvTdT+8ZvAbYZz4xZrq+PvGzukVRIyriLi/l9L3IZLIK0JekgwdciG
         U6D6Nor56B78ugpecBziyHznqV5587Oi/tTZOfr6ulxZ/ac7mVWVqDdIUvccm6qbGEng
         gkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551687; x=1749156487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yV6bmKzpwujbGtf7Nu0qD7Gr5SJRgK5YnQhv4I57FY=;
        b=F1q9ObrRiXBORRJjIjBzqbZk4e/ecQ1lMd/m7Y+Na/55MIcq56jmWY6mfPV2xr9j9Q
         W+SLV56WfHoKevqfItOCVXLocVdejT7x7Nj470jdM2d4NpN8ztzLp9p9QJ/mSZaLGoPX
         OTMJg9n0ZoJzQMRWni+kIT1jM9jbzBo1o/gTO12wWRvElt4YjLB6ngUgY73B2pCFGA9S
         uGwnsZUmdKZclPLmS8ox09fhbx6kqyFwmLev03FiPQy1VmjY+5IkSJ5fnOvkfIF30M3+
         ghoosfNGbazProGgMLSEvawhgjpLUu0b3mz6BolvDBs8unQZyggiRpSU3H3HcYqsgipJ
         gOPg==
X-Gm-Message-State: AOJu0Ywf0pXreK2ZhTlcVxqeJlmNx402u8A593L/i9xXBAbBVkSOYDZM
	ziQ7940z16iZORqVIojyD9lOUKcfk0rwpuGv7vgP3zWdU2IFcH3UvEJtdQSEOvAyngXEbYe4819
	1x1wkzlIEwJ7vzSfPWOcnfr0jgI7QQR/1evSJKdw=
X-Gm-Gg: ASbGncvoaH1+blX+oyqrfJqE0QOEntyTqrRsooxZwbhXHDzJ/wAXoucbMh5zlHf0Tw0
	NzvK3O4woFuPDyAD+cDHil4se8bzz258A4PwU6jCtktCXr5KIkSc8OFIUgG4T5asd9WKESXndzf
	d+SLO/6HzsJkOLZKhhKWn5rbWcGR0hIy6zM7jSu35MWeM=
X-Google-Smtp-Source: AGHT+IE2aJ4C02lxFfJC8xPyHtUKMnZjHWf6GXnU83MVI8NpfKaiZRqWNz6HldFaIIty90g2d5qIqyGLY+2mYiYPO60=
X-Received: by 2002:a05:6870:f693:b0:2bc:918c:ee04 with SMTP id
 586e51a60fabf-2e921259d22mr448659fac.14.1748551686729; Thu, 29 May 2025
 13:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-5-16cfc6d9891b@gmail.com> <a5225b45761850e1a99e7f3c069768f2449fa472.camel@linuxfoundation.org>
 <d8f36286-97a2-4189-82bd-79b66afa9c9e@gmail.com> <b175dfb344278086015735e6f8a0e7a66dfd3e32.camel@linuxfoundation.org>
In-Reply-To: <b175dfb344278086015735e6f8a0e7a66dfd3e32.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2025 13:47:39 -0700
X-Gm-Features: AX0GCFsqfTifdhASqdatbcOfys-QauEzK298qOPDrUEAJraHkUKKxfX-hoBigjg
Message-ID: <CAMKF1sowW6AjXWzkZk5vmvV54hjFAo=+P9gFTcx4y0P+rVJq_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 05/13] tcf-agent: Fix ranlib call when using llvm-ranlib
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217449

On Thu, May 29, 2025 at 1:15=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2025-05-29 at 10:59 -0700, Khem Raj wrote:
> >
> >
> > On 5/29/25 2:20 AM, Richard Purdie wrote:
> > > On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.or=
g wrote:
> > > > This ensures that binutils-ranlib or llvm-ranlib
> > > > behaves same as gcc-ranlib
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/met=
a/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > > > index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233f=
f91c8f112b8122a5c6c30 100644
> > > > --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > > > +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > > > @@ -51,6 +51,11 @@ CFLAGS:append:riscv64 =3D " ${LCL_STOP_SERVICES}=
"
> > > >   CFLAGS:append:riscv32 =3D " ${LCL_STOP_SERVICES}"
> > > >   CFLAGS:append:loongarch64 =3D " ${LCL_STOP_SERVICES}"
> > > >
> > > > +# This works with gcc-ranlib wrapper only which expands $@ shell a=
rray,
> > > > +# but it will fail if RANLIB was set to <cross>-ranlib or
> > > > +# <cross>-llvm-ranlib has same behaviour
> > > > +RANLIB:append:toolchain-clang =3D " $@"
> > > > +
> > > >   do_install() {
> > > >           oe_runmake install INSTALLROOT=3D${D}
> > > >           install -d ${D}${sysconfdir}/init.d/
> > > >
> > >
> > > The people on the patch review calls are struggling to understand the
> > > issue here. Could you explain this a bit more in the comment so we ca=
n
> > > understand it?
> > >
> > > Does this imply there is a missing piece on the commandline in the
> > > makefiles (or whatever) of tcf-agent which should really be fixed
> > > instead?
> >
> > I can explain it a bit more. tcf-agent calls RANLIB after calling AR to
> > create the archive [1], when RANLIB is set to gcc-ranlib this goes
> > unnoticed, since calling gcc-ranlib without any arguments it silenlty
> > does nothing and exits with return code 0, however, calling ranlib or
> > llvm-ranlib does demand library name as commandline option and since it
> > is not there it exits with code 1
> >
> > aarch64-poky-linux-musl-llvm-ranlib
> > OVERVIEW: LLVM ranlib
> >
> > Generate an index for archives
> >
> > USAGE: aarch64-poky-linux-musl-llvm-ranlib archive...
> >
> > OPTIONS:
> >    -h --help             - Display available options
> >    -V --version          - Display the version of this program
> >    -D                    - Use zero for timestamps and uids/gids (defau=
lt)
> >    -U                    - Use actual timestamps and uids/gids
> >    -X{32|64|32_64|any}   - Specify which archive symbol tables should b=
e
> > generated if they do not already exist (AIX OS only)
> > aarch64-poky-linux-musl-llvm-ranlib: error: an archive name must be
> > specified
> > make: *** [Makefile:53: obj/GNU/Linux/a64/Debug/libtcf.a] Error 1
> >
> >
> > When we add $@, to RANLIB then it becomes the make variable,
> > $@ - An automatic Makefile variable that expands to the target name (th=
e
> > file being built)
> >
> >
> > so the makefile target now rightly adds the .a filename to RANLIB call.
> >
> > tcf-agent seems to add $@ for solaris and osx, I guess someone saw the
> > problem on default ranlib on these platforms but not on linux where
> > gcc-ar is used commonly.
> >
> > [1]
> > https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/blob/master/agent/Ma=
kefile?ref_type=3Dheads#L53
>
> Can we open something with tcf agent to add this on linux then? I'm
> just worried this workaround is fairly fragile and likely to cause us
> problems in future. In some ways I'd rather patch tcf agent for this
> issue as that would at least be clearer.
>
> If we have an open upstream ticket or patch, then we can probably just
> append the variable for now.

I think upstream expects the environment to set it with the parameter
option added, or not set it
at all which then makes it an empty string.  In any case I have send a
PR for it already

https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/7

>
> Cheers,
>
> Richard
>

