Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2485C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 17:16:32 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.604.1666372588126119614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 10:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nxF4X3hY;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13aeccf12fbso4295613fac.11
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi4llv8tm/TAHAgXiAzxEhjR9fLdG2MZ1XNkkHWqxfk=;
        b=nxF4X3hY0d8up841WLLyaNGt1cEybpdhCqEkEc0Ucu0LKbeFteTU0v/nc1qSzUgAjq
         Phk5DfmCjCoSP9hOyi23rexJfw/uXS7vwDB/yZozotlUCNNpWNwdHTy86XEHQMTeacke
         tsg0Kj0/UrS/E8jwJCCv1vs0iDlYS804cK+pimpSTbS9yw2CTkxjlFHtDY3rMCPqK2OQ
         xNjfsBRl1Y/jATVB+e/1ogn9cNDK5kFVpfCLkkJFmJCFGxumNTMhqns7l4yfer7oH1nP
         xrKU0KoRHqZFobmRascpSHngw2g9yJWxx4PwsXM9HAfS58WQn+83gP6zWJ6LCqWwQ9Qj
         9ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi4llv8tm/TAHAgXiAzxEhjR9fLdG2MZ1XNkkHWqxfk=;
        b=6nFNJUv/WtxymEk+roJ+TQsO4hQdrSZPSdVu9o75BFwmgH243Qx6L58tyQEWfyYDO+
         BOg71P+n0NI4hZeRYJc54m46y8ONXihp92k/WER6GvjULU11xIP/dgAFZCNMjm2Ugg3v
         rY8BgsX2wBHMGQPbrjzVF9/wGWTQOMg6LGeHofBrN+vu1M03gfcjNiaKAYeS3XlGmIKV
         DvGWLBaL4qv/PokRFhnjpTmjMCh6t0lYQerGwOy+8E5pcWkMdiz5znv5NHQkyjVqVnwE
         RW1Nkzp0CgSyH3o6WGkNiJv4h8WHhi8/htlwk2LzrzzAb1lu+zhBQftAHjaOpItZZ1Hh
         y6Sg==
X-Gm-Message-State: ACrzQf2yBhlyzlDk8zYp/T9OSwBUgrFbDQkSM1PQVgKiVdhatMMyqQ90
	jszCQy9+h4OmqgiCdNwtOLuRdWKmoWXiXn2pj54=
X-Google-Smtp-Source: AMsMyM71OHc+stw2BcgtuoAKRWH1tAXwGkwCqJbHNadb6cCynbExy6ZZUHJS3e6sxNXcfIFq9IorcYD/5oB6xM9W7pw=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr29150080oae.262.1666372587374; Fri, 21
 Oct 2022 10:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
 <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
 <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
 <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com>
 <CAMKF1srFawQ7ycwmJmw2F-me8JM5bXZ9YBHhhjpyvkgud9Bx9A@mail.gmail.com> <CANNYZj_nHbJaD75PpxsTtV72Dmhw_hO9Po+jCjjgOOP3dJY-bw@mail.gmail.com>
In-Reply-To: <CANNYZj_nHbJaD75PpxsTtV72Dmhw_hO9Po+jCjjgOOP3dJY-bw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 10:16:01 -0700
Message-ID: <CAMKF1srBUW4GsRorupnU_wYXR2U1QwUz9LCT+beOOA_Kx=F9=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 17:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172038

On Fri, Oct 21, 2022 at 10:12 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 21 Oct 2022 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:
> > > On Fri, 21 Oct 2022 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> > > > Looking briefly over the code, my educated guess is that target names
> > > > are still not matching
> > > > rusts tuple uses riscv32gc but we use riscv32
> > >
> > > I believe we have a remapping in meta/lib/oe/rust.py, can you check if
> > > that works?
> >
> > This is mapping host uname, it wont work.
>
> No, it's mapping the targets too. E.g. in rust-common.bbclass:
>
> # Responsible for taking Yocto triples and converting it to Rust triples
> def rust_base_triple(d, thing):
>     '''
>     Mangle bitbake's *_SYS into something that rust might support (see
>     rust/mk/cfg/* for a list)
>
>     Note that os is assumed to be some linux form
>     '''
>
>     # The llvm-target for armv7 is armv7-unknown-linux-gnueabihf
>     if d.getVar('{}_ARCH'.format(thing)) == d.getVar('TARGET_ARCH')
> and target_is_armv7(d):
>         arch = "armv7"
>     else:
>         arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))
>

anyway, the builds failed at exactly the same point so as I sensed it
does not work.

> Alex

