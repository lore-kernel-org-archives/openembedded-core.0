Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web12.17658.1590687507222679671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 10:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qzhAnjfw;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id g14so4248969uaq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zV+AX0gNpISIzumlq4QF2B+OVScBLbI3Zt6Z2EyVe1M=;
        b=qzhAnjfw/TwqXOYX/yvUuDG2ld+m6DK14LHlrZXliMStzgLeTzA3yOpiuDkY6pWcpg
         qv4Nkpg1BjOjLLfYHxbpYdhYCTN5MBon/1Bu1KRbJ1cUAFKAAJzPvxQjBBPW5cD13ykt
         vE5Krm/NrDCfxxqt/93Hxi9WCLV2SHcZfGlDu5WvrxKiKaHplrUPxrS4obRvUZSJcaS9
         2QthYUYy7DO6roO6YaqVaX8JDX4UR2bOWK9rw4pbSH55xIZLmurgcM4GH8ukuX8hcuA/
         Kg5smrknl4UfAcjGx3TkTaJ5hXBac64qg5MFPkuiG+Jh83PmndZqGLzLjclgggYgIMBl
         zoQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zV+AX0gNpISIzumlq4QF2B+OVScBLbI3Zt6Z2EyVe1M=;
        b=j1IdxP/NVKQ5VhnfWzksQtZ7ZbloVUFDWlo6dPlKe6vGiUdrP/cX4Cj1rSYSvhm+OH
         CX3PzIrk7sPV681/lEBFlHoku3Q9EXxQUPBOpPWW+ga6oMw/+Z6miB4IHAXqifPvxDdh
         j22sCj+gy09gwvahuEec11q2CgniZgeGjHhY1XMv1ssZ5Z6pE4DmXEnmSjMDxHnQDfvt
         3qbuepvOhxN2cHvNFnj0fLfCOcLmuoDCi3zHb0NOQ16bmLXiotmlaq4RhLsB/X4a9gD0
         zjn2hII1OKAaM7VBwGHcM4A7f5tYAfniS7CjniQySnnFKOT6zTg8eEkuDiWjI68hHpAP
         f/NA==
X-Gm-Message-State: AOAM532aysZCDGD2gSe81LgUqEjLfLN7aktpBlUp58n9rPOfJ35D0scx
	hB/2nKfmH1w25kkoXy9tlQuoMhXbjjqWtbWekO0=
X-Google-Smtp-Source: ABdhPJxD5VJhtCwl7t78PxP/Jbo9dM/gSpsf9W/JzJeNvN/o9O3LI5wIw/6hpGKSaXpYo7ca+v7tcCYnU5w795Oewag=
X-Received: by 2002:a9f:2788:: with SMTP id b8mr2986617uab.81.1590687506141;
 Thu, 28 May 2020 10:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <20200527231145.GO17660@denix.org> <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
 <20200528133912.GB12536@localhost>
In-Reply-To: <20200528133912.GB12536@localhost>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 28 May 2020 10:38:15 -0700
Message-ID: <CAJ86T=WmE-3Q4Y4ezZs56RRbZ21P=tomBHiSpzyyir_j6wV27w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Adrian Bunk <bunk@stusta.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Khem Raj <raj.khem@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 28, 2020 at 6:39 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, May 28, 2020 at 02:20:02PM +0100, Richard Purdie wrote:
> >
> > Right, external toolchains I can understand having specific version
> > requirements. What I don't really understand is external toolchains
> > would come with their own headers in most cases I can think of?
>
> What I don't really understand is why kernel 4.1 was mentioned
> in the submission.
>
> At kernel 4.1 times the latest gcc was gcc 5.
>
> gcc 5 is not even supported as host gcc in master,
> and target builds are only tested with gcc 10.

Is that an argument that users with an older vendor kernel should not
update to newer versions of OE? Or that OE should provide older
versions of gcc (in addition to the default) in order to support older
kernels?

And where does it leave OLDEST_KERNEL (currently set to 3.2.0)? If
even kernel 4.1 is too old to be used with OE master then
OLDEST_KERNEL looks like it should be updated to avoid giving users
with older kernels false hope.
