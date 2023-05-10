Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F59C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 16:25:30 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.22089.1683735920480832195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 09:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qNUPySZ3;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-32c83c66b1cso52602065ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683735919; x=1686327919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNutXSgZMYxI6+V7LuBghyqSOIvGGT2496narj3aZis=;
        b=qNUPySZ3pfaGoN3WQK3d1IDgSY+c4ArLssdzQQ2LMaLyHxhaPf+oVoEMPAfCPuYAkU
         Cm+FvC2800I9wgi8HVswuW/THTvZupPbC8Ll5/yII53CL3zgU7/Cg5w0jRAfAOr9qdAq
         +LAH722UwS0crC8eMV83Sz77qJsk+p42husBsru1lTYS1FZsYhO0KAoCeRaRH7uLs8o/
         tqI7jO3/n0t9bPuQH62vMBOogR77vcRRZYgWFSUlYb7b/0+htZ3iF9EjMJglNEX8GbSA
         4SPQJGXtBUaPMwbCJr6jso/rysFlCmsBzy638xXvs1avuYtWiWX/akUV07DPukNDp+Md
         AMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683735919; x=1686327919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNutXSgZMYxI6+V7LuBghyqSOIvGGT2496narj3aZis=;
        b=gsME1JT2c72cfkU1Fv7FgXVVTKlcpvPXdVc1VE9CpNrJkwCN+wfSHphyZwuRqFZHd7
         MQqAEbwErbuNVdHwKCJmDbJUx7cRQhiMo6PjLZTr51MKr9qf/C/qfQnzTJd8kVDmtl0v
         kHxjQT6TKjNEuTSkM91Ez8nIjx+R63dt04fUUcs2NdfzkBndkJCQ9RemdYjTPfmd8A1y
         cQnOmaZBwHtE5Fq0bpQDqTFRb2tTKM92NsuI+cq9F3wNe9WH+Egdb06FG/eLl/LZjbHR
         Eccu3TKSryhrtDFj9yUusWMelZ0MRMeXH9W4aFZ2c/Q7ELz7kJZF4EColdx55cndfcIb
         nNYw==
X-Gm-Message-State: AC+VfDz7e68WorjKlQwePK1fry1AfT9sPhWJ4XhxGrsDSZEm7D3M8JLM
	fm7oJf591E8EdXDUxDRK6IDChZKOAAYuJzEANVU=
X-Google-Smtp-Source: ACHHUZ62BbdxRCrujgskyfhCNSVPL3GmWd47hnYuT7MJC5b42+Zpea1O0gPLy8IvoK0lgoEyI0kdiBD6sBQN3+wOsxY=
X-Received: by 2002:a92:d9c7:0:b0:335:877f:d570 with SMTP id
 n7-20020a92d9c7000000b00335877fd570mr4971180ilq.24.1683735919571; Wed, 10 May
 2023 09:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230508013317.3937457-1-xiangyu.chen@eng.windriver.com> <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
In-Reply-To: <015d196800fc8046575b7a6a9a1e38e893f2b1fa.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 May 2023 12:25:08 -0400
Message-ID: <CADkTA4OkMJOkA+JD1AOJOpt9pLwPJ0jFwpsg4gNZSC99zwPsmA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] linux-yocto: fix missing pahole and elfutils
 when CONFIG_DEBUG_INFO_BTF enabled in devshell
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 16:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181119

On Wed, May 10, 2023 at 12:16=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-05-08 at 09:33 +0800, Xiangyu Chen wrote:
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > after enable the kernel CONFIG_DEBUG_INFO_BTF in devshell, the make wou=
ld report some
> > errors due to pahole and elfuitls is missing, since this is a debug opt=
ion, so conditionally
> > add an option named "btf" in KERNEL_DEBUG_OPTIONS, if someone need enab=
le CONFIG_DEBUG_INFO_BTF
> > option in devshell, they can add KERNEL_DEBUG_OPTIONS +=3D "btf" in loc=
al.conf to solve the pahole
> > and elfutils dependency.
>
> Is this a defined workflow somewhere? Is KERNEL_DEBUG_OPTIONS with this
> option documented somewhere?
>
> I also think the mention of devshell in the commit message is
> misleading, this issue happens regardless of how you enable the option.
> There are also other ways of enabling this than local.conf, you'd
> likely not want people doing that at the end of development.
>
> I'm curious on Bruce's opinion but to me this at the very least needs a
> commit message rewrite and I'd question whether the docs elsewhere
> would allow someone to discover this workflow anyway.

I missed this entirely, thanks for replying to it, or I never would
have noticed.

This mechanism isn't appropriate for these dependencies. I only added
it to work around pkgconfig issues (which we can more cleanly solve in
newer kernels  (see what I've been doing with make-mod-scripts) .. so
it can eventually be dropped).

We are already enabling elfutils-native conditionally on a
per-architecture basis (currently only x86-64).

If we need it on more arches now, we should enable it in the version
specific recipes, or actually, we have moved far enough into newer
kernel's that it could be in the .inc now.

Similarly, we should enable the pahole-native dependency on a per-arch basi=
s.

As Richard mentioned, what's the reproducer to see the errors ? it
must be more than devshell.

If you can follow up with the steps to reproduce, I can take on the
refactoring and broader dependency cleanup question, since I can test
the wider matrix at the same time.

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

