Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0309C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:26:40 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.10683.1749137200122653099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HkVJJ1/w;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70e767ce72eso11964417b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 08:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137199; x=1749741999; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NdiCifraq01+BphNfE7F1QAIpj6jGxAbeOYLrSbySM=;
        b=HkVJJ1/w+EW/fBAmtOvsM1rWKSJjRPUgpVzz9AdC4lR2vccFn+kdJ3mSgko3QwhAMF
         F8nIO6tGKfeVlndbdF0Z9iP97e5JuA8J3tBlk7vz9wSTwN9UfMlxjVhhMcOAMBllAEkj
         DhkQg2KHYpYIlYPkZskf40o72LOFxZfPnz5G5s9cEqOQxHnceWs+r0SNXNnmZgQBFl41
         QuCj+KikMh77BqzMo/QUI0RZGa5s6GHiQWT0Gp/ZHH1OJuG6C77KH6p/iIjwf7UtEWGd
         nI7YfQg/9uLOTiHBi7wzSS8sKIrNont6A6K1DgWN9Yr1CuCK64g+cEyJ1tpvS3WGpqXT
         l+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137199; x=1749741999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NdiCifraq01+BphNfE7F1QAIpj6jGxAbeOYLrSbySM=;
        b=Ylrmk53xM7Oj2vdnfr3u3fxsV/E7DA3wweEMFzqa1btkZXs8gWlEUyKktgpvCHuyiz
         3DV3I8vW616LtBxlw6aaczN1x3HmYz8iuYeDj6jlFf9tLOTiTik7UVC4eiC4SPMAjOly
         cIy3+BD55HrN3BR5d0wZzadbQAILbXvkBxlPzb/SvuvaPiEdium8Pl72TQfvPkxgO6Bd
         W2WTkeewutQjWZ1GedKxmjRWca5vZYekRuBbDKu/v4mrJrs6MvSax7G7fOFuS3fc65ar
         8Y+oi5Pfyrxk9ozV/1PVMWDMnujzujMZ6pyn2auVnwBYjr4vUhTjMgUm6EwXVwo4OdBc
         tQxA==
X-Gm-Message-State: AOJu0YyfUk8nbqOK7Z4TlargvgkDwGbZ2UsjbIPIbfFfllMPq/pDbk9W
	Kh8+rDVjALpztbYss9lVNZ5dNblP6inZUbPqhQXUUP+FjZ0ptwl+VJd5Vaq/GJ7i56HDg8PmdRg
	0GOmjRQWMJ8/lx81KOKco0PA1dYfjtQu2hzKx
X-Gm-Gg: ASbGncuKaGzito1MtNVC1esTkp0Fm/x8hgrT9PYeJKLMUVgiFpIaz096zlC+3ycCImV
	6slo/vuQGJnjpXggMH1pVBdeG6N+hB0qHW+kGBlfCJewvAZiG1+CJI1jmGpy9gHTLHZ7W+43UEw
	Kp097bWhh1QAnyXWnJFN3ilr9h0Yz495o=
X-Google-Smtp-Source: AGHT+IEF3TW95GyfW8N7jrZvrchat0328hPsGdZhmmk49x/G44fkSz6EyQoDU3sPjikxFm5ZQeOb1+GiSbBLHJ6iwm4=
X-Received: by 2002:a05:690c:3503:b0:70e:6105:2360 with SMTP id
 00721157ae682-710d9f52358mr102462147b3.24.1749137199145; Thu, 05 Jun 2025
 08:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-28-db97c2eb3756@gmail.com> <EDD30BDA-3E47-4171-8FA4-594564A7DB38@arm.com>
In-Reply-To: <EDD30BDA-3E47-4171-8FA4-594564A7DB38@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jun 2025 08:26:12 -0700
X-Gm-Features: AX0GCFslH3krAYu4PAUtoEHo5w70ThMneGDXb36hIAvSJEJ9LDj-3v6qld_prHE
Message-ID: <CAMKF1sqjLr2SV49UhJ1k9djvGFipcd8d=dsHSxjJpXdQBDe+CA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 28/28] perf: Do not treat maybe-uninitialized
 warnings as errors
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218034

On Thu, Jun 5, 2025 at 3:06=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> I just sent a patch to linux-yocto to silence this at root.
>

Thanks, we need to send a revert for this to OE-core as well once the
linux-yocto change is merged with link to it.

> Ross
>
> > On 21 May 2025, at 07:20, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Clang finds more warnings in kernel code, make clang happy to not treat
> > these extra warnings as errors
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/recipes-kernel/perf/perf.bb | 10 ++++++++++
> > 1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
> > index d06dd2fa5a2bb9b2982572081ef57e2dbafbd5da..0d19e1bdc222da26a5ad0a1=
d4964acca437a6692 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -81,6 +81,16 @@ LDFLAGS =3D "-ldl -lutil"
> > # avoiding the 'buildpaths' QA warning.
> > TARGET_CC_ARCH +=3D "${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
> >
> > +#| libbpf.c: In function 'find_kernel_btf_id.constprop':
> > +#| libbpf.c:10009:33: error: 'mod_len' may be used uninitialized [-Wer=
ror=3Dmaybe-uninitialized]
> > +#| 10009 |                 if (mod_name && strncmp(mod->name, mod_name=
, mod_len) !=3D 0)
> > +#|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
> > +#| libbpf.c:9979:21: note: 'mod_len' was declared here
> > +#|  9979 |         int ret, i, mod_len;
> > +#|       |                     ^~~~~~~
> > +#| cc1: all warnings being treated as errors
> > +TARGET_CC_ARCH:append:toolchain-clang:arm =3D " -fno-error=3Dmaybe-uni=
nitialized"
> > +
> > EXTRA_OEMAKE =3D '\
> >     V=3D1 \
> >     VF=3D1 \
> >
> > --
> > 2.49.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#216996): https://lists.openembedded.org/g/openembed=
ded-core/message/216996
> > Mute This Topic: https://lists.openembedded.org/mt/113225040/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

