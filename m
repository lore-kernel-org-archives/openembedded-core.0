Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9555C0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 21:06:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.185270.1698267957748246570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 14:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HfO+L7iY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso8007315e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 14:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698267956; x=1698872756; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wJUC8jYW4ZR+dGggDltObB7Mr63Ps5uqxvKftzql294=;
        b=HfO+L7iYlVGbsHONYpNaCtFNTxDkV/yOEbGXnuDIczaFj3AjoFZ/pLF0Cwpr43PxHZ
         KmsVSamkIKzVbaMvtmM8jmD6+cFCceH78jDnb52jmdfEjVhJnCrRrolYAaPsyUZ0bCVf
         WXLsMu3xRj5EPdO4WyVz1GVjRdfdC53vNWA98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698267956; x=1698872756;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJUC8jYW4ZR+dGggDltObB7Mr63Ps5uqxvKftzql294=;
        b=v2IEdPkPD1hfiumcXvwJKi2wSF9hAH9lYwaT6jOUulsJXWIXEHdgxKW5QjMDJ/t/gp
         LFhO86le76IZbE8z8xDWLZXI7u9oJOeqvUJrldMQTIUDAUoEKKec1AoUDuxE7B4W83rD
         ARvFbrEV7geDXBqmmHCzWxy4d9g37Tcm6VOgbAHDJVNKwJQjb4GoxY97j251ABdRQN3R
         9pwpycxsEUgLKruOcXzOxPen+8R5EPqn6n0DXKX2ZUvzZ2iB35Kj8nHBdarXkGbxaQxQ
         FMQzhEKSwqiD84XFg5NOtfmK0ryYsJHePDoONRFBkU5JenrPMM8rMcBgzcQBlw98CA/w
         rnBA==
X-Gm-Message-State: AOJu0Yz1iKWgbNzzVg8EMyQkgOFytx+PHT/Qo1Lna+19fsiNHmXrDg9B
	RQgv7ZgVqBdS5BiYmq8gur9tjg==
X-Google-Smtp-Source: AGHT+IHz2gtA25LylJfM8pFLOhwwy6pZ5l9081hMxKDkWD6hQYQSeQLdaljhVgyTYqQDkZJfgmkLxQ==
X-Received: by 2002:a5d:6c63:0:b0:329:6b62:8d18 with SMTP id r3-20020a5d6c63000000b003296b628d18mr806774wrz.0.1698267955839;
        Wed, 25 Oct 2023 14:05:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id y10-20020a5d470a000000b0032d9efeccd8sm12806030wrq.51.2023.10.25.14.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:05:55 -0700 (PDT)
Message-ID: <00f88dec1f4599e84aa46dbac441aca5b47924a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: Use strip utility used for
 kernel build in do_package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2023 22:05:54 +0100
In-Reply-To: <CADkTA4Oa6rxshKxTb5aVEnHy0mnqjCeGkWsPWLuoJYe+S5NG5A@mail.gmail.com>
References: <20231024220735.3011192-1-raj.khem@gmail.com>
	 <CADkTA4Oa6rxshKxTb5aVEnHy0mnqjCeGkWsPWLuoJYe+S5NG5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 21:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189693

On Tue, 2023-10-24 at 19:17 -0400, Bruce Ashfield wrote:
> On Tue, Oct 24, 2023 at 6:07=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >=20
> > os.environ does not pass this down to runstrip() function and in
> > strip_execs() its using STRIP bitbake variable to find the strip utilit=
y
> > to use. Since there might be a trailing whitespace in KERNEL_STRIP
> > remove that otherwise python is not able to launch it.
> > e.g.
> >=20
> > FileNotFoundError: [Errno 2] No such file or directory: 'riscv64-yoe-li=
nux-strip '
> >=20
> > This is more evident when STRIP and KERNEL_STRIP are different utilitie=
s
> > e.g. when using clang as default toolchain but using gcc+binutils only =
for
> > kernel build.
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/classes-recipe/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> > index 2ec9ea2091e..16b85dbca48 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -336,7 +336,7 @@ kernel_do_transform_bundled_initramfs() {
> >  do_transform_bundled_initramfs[dirs] =3D "${B}"
> >=20
> >  python do_package:prepend () {
> > -    os.environ['STRIP'] =3D d.getVar('KERNEL_STRIP')
> > +    d.setVar('STRIP',  d.getVar('KERNEL_STRIP').strip())
>=20
> Looks fine to me.
>=20
> I can't say that I know the mechanics if every setVar'd variable makes it=
 into
> the environment to be available for the build process .. but since it is =
working
> for you, I assume it does :)

FWIW, only variables that have their export flag set or which exported
at some point, which STRIP presumably does or is.

Cheers,

Richard


