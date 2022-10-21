Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55E9FA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 17:12:32 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.586.1666372347086403920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 10:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GabIpcPr;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id a6so4591991ljq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YP/o0o9LIhdR9CrBhQ5ojUG5t8td1ImfZuTAu1r3mEc=;
        b=GabIpcPrjqTBwFtS1K/52a3fAqb2HeBngGzrz2oJ1f1FE2YQdwDAsjd8T8tnpXwoa/
         cMUvNBjYTZHrtEI75eW6ZF6nNeMMFCCdpj7TGTNESlAOgEdcMDIReN+a0ZwifkZlMTav
         zH0UmfJQuPPcXOBhAP+pn6wTIvvJIsFSCkgBcvxWxhaszMBjAhp3de/ajRMnJ+AwmHO/
         zNIrZZr5q4h52rSbphHhlFYYRUJHWfXedFOrL0gjDTW9zabpC8nlg9l94VaXpvhPUznx
         ru/Mg85DeOomUMpjCxwINPGnG+kn9eyXyqL4xOU91f61MM9Y3QQhdjCkVdL8/fm+Fyvi
         DWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YP/o0o9LIhdR9CrBhQ5ojUG5t8td1ImfZuTAu1r3mEc=;
        b=BX8kwT4qo2o+qoND3ooc8640qzwz9DwKOY7a90bPKb/FtfnNS9evY9SA7ni6nKcstf
         +MthaR5JT0vbZNG/rjZDfxcfpw1Ry2kMid94vEH8EHstfkCnzThoG6vZL2v0sq8qMwpL
         N+78fXIFQhQwZoc97G0lqawqPhlTZnPRIZwGJqaMAupwJ0cV5NhirgDxntTfr3NYKGat
         g3XGRN2dFyPdFNcR1u3KNV3XJrsaxz+bzyuzsHtdpfxifkRgwMD51ukFjrr8Y7EfiLdp
         22r6bdyj8KP8zJV8E3Zpk3LmYSB3lEh2gOCjiSk+2/beW8J3bavImG/K9boMug/+JP4w
         Q/Rw==
X-Gm-Message-State: ACrzQf0n3giLGVznZ9fIZ7QW0no4n5XomZ9FV+ULSfRb7l58zXFdnSOa
	aol1Oqi0tGkkobiY8haO7siQ9lDs5DScy+/TjTY=
X-Google-Smtp-Source: AMsMyM65LFk6fbQkrFTQ6v1eKWklC9gdpsgK/OfuzAVvz0flQjjhdOamM5RXlqvt7Eb8xfcPFucDEJLl/zWHWXszvgU=
X-Received: by 2002:a2e:9811:0:b0:26f:aa96:435f with SMTP id
 a17-20020a2e9811000000b0026faa96435fmr7570968ljj.45.1666372344875; Fri, 21
 Oct 2022 10:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
 <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
 <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
 <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com> <CAMKF1srFawQ7ycwmJmw2F-me8JM5bXZ9YBHhhjpyvkgud9Bx9A@mail.gmail.com>
In-Reply-To: <CAMKF1srFawQ7ycwmJmw2F-me8JM5bXZ9YBHhhjpyvkgud9Bx9A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 19:12:13 +0200
Message-ID: <CANNYZj_nHbJaD75PpxsTtV72Dmhw_hO9Po+jCjjgOOP3dJY-bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 17:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172037

On Fri, 21 Oct 2022 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, 21 Oct 2022 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> > > Looking briefly over the code, my educated guess is that target names
> > > are still not matching
> > > rusts tuple uses riscv32gc but we use riscv32
> >
> > I believe we have a remapping in meta/lib/oe/rust.py, can you check if
> > that works?
>
> This is mapping host uname, it wont work.

No, it's mapping the targets too. E.g. in rust-common.bbclass:

# Responsible for taking Yocto triples and converting it to Rust triples
def rust_base_triple(d, thing):
    '''
    Mangle bitbake's *_SYS into something that rust might support (see
    rust/mk/cfg/* for a list)

    Note that os is assumed to be some linux form
    '''

    # The llvm-target for armv7 is armv7-unknown-linux-gnueabihf
    if d.getVar('{}_ARCH'.format(thing)) == d.getVar('TARGET_ARCH')
and target_is_armv7(d):
        arch = "armv7"
    else:
        arch = oe.rust.arch_to_rust_arch(d.getVar('{}_ARCH'.format(thing)))

Alex

