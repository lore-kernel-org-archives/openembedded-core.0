Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED39C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 03:22:49 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.11612.1705029759316063219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 19:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KkB6+CDA;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7baa8da5692so267236239f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 19:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705029758; x=1705634558; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nReBAvraL3GRKe1wKuEgM+erJV8xCogiq+s+RzoPYk=;
        b=KkB6+CDAZsyvJ5G4q3VWGtXd4SZriqBlYOsMVmChQR5Non8Us0ouwdMvmhSB/YPUk4
         MObs30uCvGVrq2AuUFeV8gFxj3U7pi+hTc/0aldyFppEQ3YHOWf4I5cIMemam5mPu97v
         UBtHaj6LSiHSZGBuKpnpSwNulLBHMdk/FifgnQCwNTRWSknM/zBygwoEvmZH6EfT+js6
         CX9Ph+MhwZ+v6T2CkQFOp4b5SNHhzPlNx325d5Q1myJpjKYg3JDXGrP2GCKq6hX5ixxT
         RV8lt9jmUSUfXjTuMIwuONVaDoz4PKA7OP+i8vwSYQy/PZmUGdlYgk0D1iIOxKtbcJV9
         r7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705029758; x=1705634558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nReBAvraL3GRKe1wKuEgM+erJV8xCogiq+s+RzoPYk=;
        b=GFw0mn6LEKZQOp8ChWIoB+PDARDQMkl8izo11pUpXF9gpQgJcd3zdfWqz1earMQCiL
         8aumepVgj/oJHTYmI8C/ogJSKAC+3wXNteiVZ3FTdvIzUm0wiQcczyi5zSDXNum75zoz
         XfGzq9M3+1zkLfPjKpB/9SlGfUNAMDSxmnK5xR8PVALeQsjeS4B5UmDkouZJUUjqabkJ
         qpk1ElOMKVLAfMkiLHizvlLvZEcvTcscr2NCMXjLPhzJ8O+FBnsQJUJWDGLgy9h89OER
         ZDznqvSmKLplOBLN3MWFpp5gf2S6TKW5+5/VfUWwzESIAvyq4nrx0JshCfbwT8kfQHhE
         cxSw==
X-Gm-Message-State: AOJu0YzPfNucZGf6Rl9g9LWdC0720/4XER3USb+YTyt4W0CTRSd+Sut8
	T49D/sR29DoUCmfhxhru6myRvwnn8CA1o9J2kxTR7DPAjWHUUw==
X-Google-Smtp-Source: AGHT+IFkslo9y7zRHOlWh8PtVHS+7V6VSJWGgNGjPXvd+GOD8qim1+6Emp49R66AiU8GrEV2pGp+CfKmbPv5m8BNftk=
X-Received: by 2002:a05:6602:695:b0:7ba:99b7:2a72 with SMTP id
 dp21-20020a056602069500b007ba99b72a72mr785127iob.20.1705029758479; Thu, 11
 Jan 2024 19:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20240112024357.2656128-1-Qi.Chen@windriver.com>
 <CADkTA4P7NZGEpe4t=PdG3e0558xr9+QcuM8wsv9wQM6SN6rOzg@mail.gmail.com> <257b3e66-2cdd-b5cf-7a4b-532e32f9ff3a@windriver.com>
In-Reply-To: <257b3e66-2cdd-b5cf-7a4b-532e32f9ff3a@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Jan 2024 22:22:27 -0500
Message-ID: <CADkTA4Paiqgfh5D_=SmDEc8yRvrRErGaum2gXi5Qv-qw46EZrA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: copy source files under tools/
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 03:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193567

On Thu, Jan 11, 2024 at 10:12=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wro=
te:
>
> On 1/12/24 10:50, Bruce Ashfield wrote:
> > On Thu, Jan 11, 2024 at 9:44=E2=80=AFPM Chen Qi via lists.openembedded.=
org
> > <Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Chen Qi <Qi.Chen@windriver.com>
> >>
> >> The source files under tools/ also need to be copied because in
> >> some case, they'll be needed. For example, in case that the
> >> CONFIG_DEBUG_INFO_BTF is enabled, we'll get the following error
> >> without this patch when doing 'make prepare'.
> >>
> >>    No rule to make target '/.../tools/bpf/resolve_btfids/main.o',
> >>    needed by '/.../tools/bpf/resolve_btfids/resolve_btfids-in.o'. Stop=
.
> >>
> > Tools has been excluded on purpose, as it is relatively large
> > (and complex) compared to the rest of the curated files.
> >
> > Figure out just what you need for bpf, and copy only those
> > files.
> >
> > Bruce
>
> I can do that. However, I want to raise my concern here first. Does the
> 30M really matter, compared to the potential errors that would possibly
> give users bad impression?

Yes, it actually does matter.

That's the entire design principle behind devsrc. It is carefully curated.

Considering something like this pops up every couple of years, I'm
quite confident that there are very few bad impressions to be made.

As you could see from the file that there are many specific copies from
the tools/ directory structure. That should be the hint that if we wanted
to copy tools in its entirety .. we would have done that long ago.

>
> Before enabling CONFIG_DEBUG_INFO_BTF, things were working pretty well
> for us. In fact, I was a little surprised that adding extra configs
> would result in failure of 'make prepare'.
>
> Not sure if CONFIG_DEBUG_INFO_BTF is the last one. I guess it's probably
> not.
>
> Again, if users are using kernel-devsrc for compiling things, do they
> really care about the 30M size?

It's not relevant if they do or don't care. It is the principle of keeping =
it
as minimal as possible and not doing things "just in case".

There's a bugzilla that I've attached a patch that creates a parallel
full source copy of the kernel, but we've never merged it as keeping
to the low footprint design principle is important.

Bruce


>
> Regards,
>
> Qi
>
>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes=
-kernel/linux/kernel-devsrc.bb
> >> index ce5777fbe9..c2aeb8e216 100644
> >> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> >> @@ -62,6 +62,7 @@ do_install() {
> >>          cd ${S}
> >>          cp --parents $(find  -type f -name "Makefile*" -o -name "Kcon=
fig*") $kerneldir/build
> >>          cp --parents $(find  -type f -name "Build" -o -name "Build.in=
clude") $kerneldir/build
> >> +       cp --parents $(find tools/  -type f -name "*.c" -o -name "*.h"=
) $kerneldir/build
> >>       )
> >>
> >>       # then drop all but the needed Makefiles/Kconfig files
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#193563): https://lists.openembedded.org/g/openembe=
dded-core/message/193563
> >> Mute This Topic: https://lists.openembedded.org/mt/103676210/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

