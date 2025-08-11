Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010D5CA0EC0
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 08:18:15 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.43201.1754900287168354008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 01:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+TWPeGr;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4aeb5eb611bso40342451cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754900286; x=1755505086; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3qqfvVreI6mjZPbYWOALe7gfNGZPlV7tNxn2qQQukU=;
        b=h+TWPeGrLsUDsB84FdgtIRgeqR1Q/5yIRa4Ppr1JxgteYMnLBY0vE89heh4sPZZZqJ
         AbIgg8Lzf4QfNbLUB6dl1pY0NSQ6sD2yXFSdMhdTJtF/K/6LiUKz2/BpnWJsCo8HT36H
         qEdAixkOm76sqKC3Yso1LRFD2OjdaT7eiSEGdK87hprKdUinRAHEAcLtYmWgRf9Xo6vR
         knPN9eEFqpBerZN3DnuvFLs2sgRUOfzTui/WIMto50pChop3cp7kcp+Je7KrYWmNVigT
         2f4ql7EQ7q0EadNGhafb+kWJGlrLHEoaw/suHpOhNl1t5qRPWURQEuVavX0VdFDxuRX/
         skmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900286; x=1755505086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3qqfvVreI6mjZPbYWOALe7gfNGZPlV7tNxn2qQQukU=;
        b=IHqmEAJTcAwrl13fMmQGQ1Ogyv02yYb+dHRe1aljhauYxhTh4nNAqqtJYjHox1xzr2
         +6tnB2ssLGBHy2qBbFlzUgfnPS/vPi+vEKS23wuHCMYYhFpM6LJOZqhhmimVIrybpG+3
         lkjqGg6sQEjlOcAvhqAOraiB8NEuHqKBzrnd0fleHePJa5ZOGLSxcZVquKc2ggTLkW40
         3L6Dxz+RaDPkzsFvzohLdf3sEI5i5fP5LEAQAKsj7+/UawXtnrbqyPZ7rkibjzJrc5mP
         o7IhvEdTlsiqqgxykMiFSYsE8FMDL5na12wsNkxmnSI5di8AlvQzbEayU3E+Hzq39B87
         /i6A==
X-Gm-Message-State: AOJu0YycCKCetRmzxJwPtyoSG+jU5rnACZ0ig+3vCS4M4bZdo+3O/9xV
	1MH5W5TZ0JIIogPFvc8+BRk6RW9ZSDjN1lam5xvtB9RmiBFF6I+JKaB6bfDbjKvaKYXJtywSe/0
	pQRcl3O44UK8dCI76XzwYsaJrpJnL2vs=
X-Gm-Gg: ASbGncsEqldIaRIS/lHFK0KUT6BjFwSnAFkvydX8DwaE31KxLu//P6p63/CkPXDZis4
	57ekwoZOgqSDRvAWz6rZlAsA3MUiI/QfT2LRusZCNOKoXFXMrdr5PUijlfJXdBiJBPC6P1oz33D
	S9t1AcZrn5L7jEturPP7oSkhZDIc+S1W2WbFzo+gA67BglQ3QzyPGlPo8/YFxI3T5bTV52wIcEv
	3wBh2zz7L0NIIlv/g==
X-Google-Smtp-Source: AGHT+IH4B3aZ7JRl4OJ59GcxGLY6otOBc+otaJwnj+4e5RHq7tTQNFClwVQ37JxLlvBgF5aItS+ghJP92KrHs2PB+3M=
X-Received: by 2002:ac8:5704:0:b0:4b0:616f:919b with SMTP id
 d75a77b69052e-4b0c7a9de68mr76138611cf.39.1754900286110; Mon, 11 Aug 2025
 01:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250801042242.3076232-1-raj.khem@gmail.com> <20250801042242.3076232-3-raj.khem@gmail.com>
 <CANNYZj_aGce4mmz2P+LUHZdDYGVYQ1sOSkdcOdn6-mTY_USk2A@mail.gmail.com> <CAMKF1spXxqp=U+430dTzHnTiQzJg5M4TWXGBeyuM51rOaPv88A@mail.gmail.com>
In-Reply-To: <CAMKF1spXxqp=U+430dTzHnTiQzJg5M4TWXGBeyuM51rOaPv88A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Aug 2025 10:17:54 +0200
X-Gm-Features: Ac12FXx7KAmwRTXeYUwNylLjRQjWdGcAV5IiMO7fZ-U3qYFEejOdCMKKYVpTdvQ
Message-ID: <CANNYZj-CwsORcS2QF=NO=O82r+nqLe84tiPWO5CyX5oDBxq-tA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/7] libxcrypt: Allow undefined symbols in
 version scripts with lld linker
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221723

On Thu, 7 Aug 2025 at 22:18, Khem Raj <raj.khem@gmail.com> wrote:

> Hope this helps you understand what's going on. Feel free to ask if
> you have more doubts.
>
> >
> > The same question stands for similar patches for libtirpc, gzip and
> > binutils-cross-canadian.
>
> They all have the same issue underneath.

The way you describe it, this at least merits upstream tickets, if not
actual fixes. Upstreams can then decide if lld is something they care
about.

Alex

