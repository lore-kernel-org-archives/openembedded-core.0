Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.web12.484.1591134372998527061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 14:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kkgCT1bn;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id r10so149222vsa.12
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 14:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Do64e7M36xUo1FWiaNRYgilQiLu2FspLO7psY0Z/IEU=;
        b=kkgCT1bnPfOcysHQJiUK3L8qhqbmmN5mzhQgHZ7buhx79dzXEtk2SDDAPA5/PjHUIW
         HvTm0nXCSQxUkRezcwTg/tan1IxkS/yVHHKNuLWJWIztye8gF5X5NVy+lzJ0/aH6dZNv
         VU1sTwqGykBlMAmH4DepoDf5RA5yAZCM3exRnGvm/gzyXAKqXPtOduCxoDD3UGy3qHSZ
         8TMJsZ6s+e1aKthF2ah9xWHOt18p4Zj1ga+I9ayUuTag26DXukrRbhnIsIf6vltgwM9D
         u/cZ1gYk1PTmF9GGpHS2Az54CeyHCG4JlF7MRtDzNTPcxCST3gSIJ9mPH0tu6wpFRuZD
         IqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Do64e7M36xUo1FWiaNRYgilQiLu2FspLO7psY0Z/IEU=;
        b=J9gifyAPHOtwXELbIEx1K+eoUmzKdw3YpiK9MA/Dv5mkQ39/GT9lSlO37zuubY3lQF
         r+O0K219k0HWHwuZD3wE7dnHIYkXiUVjzK+qD2fEvAJL/CfBxUuZf6ppcwotpwS4yjqZ
         W9/4pDIdZleDIO1jx31Pv24rbcCMtIMzgF4R8DmE45TsjThwBP/NCwPsQ+sgelVqSzuf
         1GRAtxu2l2peFpWfOkCtX/o5oIaZ21bNU4hllp2bwM+x/nagedOeFFxjl+wvfykVRH+m
         2Pmv4qTVIV8mpKBTm5SPD9J+HHffB+hfMhkKEYHfkp2eOuS8dIdO8vq2X1J1iDi9CICp
         Crww==
X-Gm-Message-State: AOAM532oCxYUS6b4KzrSpdLMKzDdijw6ODHjn+Xu293QUlBVLgeNMRtC
	Hc0f3Aho8QnP6oNriL39GRBnBsiIkzeFboMFJFM=
X-Google-Smtp-Source: ABdhPJxPdiY9WDF/cBzDJwwDLamBlIHAJvol+mBC3gU8oclTnpHo/JHBOMd18axbgPZBCcMmCGejLUZLCu8QWHOPNoQ=
X-Received: by 2002:a67:ed02:: with SMTP id l2mr6523277vsp.137.1591134371977;
 Tue, 02 Jun 2020 14:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk> <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org> <20200602211524.GC2207@pbcl.net>
In-Reply-To: <20200602211524.GC2207@pbcl.net>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 2 Jun 2020 14:46:04 -0700
Message-ID: <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Phil Blundell <pb@pbcl.net>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Andreas Oberritter <obi@opendreambox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
>
> On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
> > I understand the concern, I am a little torn on this as adding in too
> > many different controls and options complicates the test matrix and
> > makes things harder for users.
> >
> > You're effectively suggesting a new DISTRO_FEATURE to control this? or
> > maybe better, perhaps a glibc PACKAGECONFIG?
>
> Yes, right.  I don't think it need be a DISTRO_FEATURE because nothing
> outside glibc needs to care.
>
> Here are the scenarios that I think matter, ordered from simplest to
> most complex:
>
> 1. Immutable filesystem, every library installed in the place where
> ld.so would first look for it anyway (i.e. everything in {/usr}/lib).
> In this case, we don't want ldconfig (because it can never do anything
> useful), we don't want ld.so.cache and we don't want ld.so.conf
> because they would cause ld.so to do extra file loads and computation
> but end up with the same result that it would anyway.
>
> 2. Immutable filesystem but some libraries are in places that ld.so
> wouldn't automatically know about.  In this case we do want ld.so.conf
> and ld.so.cache, but we still don't want ldconfig.
>
> 3. Mutable filesystem where arbitrary binaries can be installed in
> arbitrary places.  It's probably debatable whether ldconfig is needed
> in all these cases, but clearly it's needed in some and I think at
> this point it can be left to a DISTRO decision how exactly they want
> to optimize things.
>
> I think right now oe-core supports #1 and #3.  The proposed patch
> seems to be aimed at #2, which is a completely valid usecase,

It seems like a weird corner case to me. Where do these libraries come
from and why can't they be moved or symlinked into a standard path?

If they are somehow special and only used by special applications then
setting rpath or using LD_LIBRARY_PATH just for those applications
would seem to be a better solution than enabling them globally.

> but
> my concern is that we don't want to pessimize #1 in the process.
>
> There is a whole parallel discussion to be had about the merits
> or otherwise of ld.so's hwcaps mechanism.  meta-micro has been
> carrying a patch for about a decade to turn all that stuff off,
> on the grounds that it's just a loss on any kind of embedded
> environment.  Maybe I should make some effort to get it upstream
> as an option.

Note also that glibc already has a build time option to completely
disable support for ldconfig:

  https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/configure.ac#l89

Sadly it's not usable in recent versions of glibc (setting
use_ldconfig=no results in a build failure due to some seemingly
unrelated missing build dependency which I haven't had time to dig
into yet) but it worked well for OE 2.2 and gave a noticeable
reduction in glibc code size.
