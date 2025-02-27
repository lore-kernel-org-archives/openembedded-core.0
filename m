Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF45C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 09:59:18 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7503.1740650347550652176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 01:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c46TPyK9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f406e9f80so493920f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 01:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740650346; x=1741255146; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1kfgxK0U2PP7ihLYbyw+wfnLvORp6UnwDgSy+nvFvg=;
        b=c46TPyK9olfdJiXrbKY1oTIPZm0Pocc/bQgo2gPMFK4QyRXuCrarI9993apLVE9KpH
         q894P5wRzzIObunLzkLZORh/nlLwh483AxHdsZE1wNoRU2vqF2+nY+rycpVanPFBITpA
         UhvjgWsKc/3MbRuPi8fWM280762WghiW3IABo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650346; x=1741255146;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c1kfgxK0U2PP7ihLYbyw+wfnLvORp6UnwDgSy+nvFvg=;
        b=A9OTxA7xEByXzqbyKkaije6s0hXG26+eZdRbKQ9jHFyNS8isBF2MaG3LHXV3l55Pep
         dgVCdRmJmeIP7zAgZ5sBeKBer/1D8aNePj1GYCHvYD1wHd1/izVcvob6+CIf9CeofrUt
         DlLTtqaHqHeiaSjBKv4NIbnxkw07ftmSd/u8u+s+Zba0MQHAboV9JErrzzdl8M+0JiA1
         BqlpY3JdHorEuInvI9ICBSZYcCh1DX4j5SESt0WhOCkzYVMtob/BTp1ZkZ0jy1FJiPq8
         vzD5pjx+UNtZOg4Ixc1Tpy/c9m6qfRNqlSQk26u+uH10lzToYcTjthnM1Y6WrdYK7mql
         9y2w==
X-Forwarded-Encrypted: i=1; AJvYcCXhHuXnW+PtlGla0NSjSkCaI+UIP94srb2IRKUjwwjamWzDMlbsRaT3Uay7MRlWqoM3mFulfPUfXWdSPlSkZm9a/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXUyMv1pAYc3nbavUAuhYf3godPo0xcoCjNKRaschjcubpeywf
	8gno4ELKUXrvRASrJ7eW05LLqHWZK0QZa9cJRvtKbJHZ6/Axn8ebDl+9otSTY60=
X-Gm-Gg: ASbGncuJSs8Ry/fzrToCNRfOiZXCRYqJwO11QM9CFUcAAYp6EdP1DOTrAJbv+iiYoI0
	hI6yiNVLjsdX58gvboVUWVVT60ItBaONSd5t4lsEU5f3OOYkH0fRtsXxywSzxOu6jS1gA+4tGsn
	qCG6rR7/FoTjYlkQRzMAhw3nam29CnOuLKIO9684a+DTUkHx+u99DGhz+nGOQ7wJwhg6gaMelIl
	fuF0aYWzpEUrMNu+++nLqrKreU/mvHF5oXL+knEUZH5sPcljVM21QAM1tax8Na44S144HQStLHr
	VAW2BBL5c2B5HKrsWNbYqxie3y89jXMRYvuEPwP83SeNghBIjciy8B+yalIGjk8JEHoMCtQu5Nb
	phehgOdm4/u8bZsI=
X-Google-Smtp-Source: AGHT+IEGBe0FEBn53CMkUMEOFp41DF2BjvmaF8h4ZGc2HI/+SJ5kJQkz0mWLxJq5JMQbqJ2aikfzjg==
X-Received: by 2002:a5d:6d06:0:b0:38d:d299:709f with SMTP id ffacd0b85a97d-390d4fa366amr6125725f8f.48.1740650345820;
        Thu, 27 Feb 2025 01:59:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af40:c449:3dc9:d155? ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d773sm1485185f8f.81.2025.02.27.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 01:59:05 -0800 (PST)
Message-ID: <290e2e6c68dedf8e077fc406e665a11258964704.camel@linuxfoundation.org>
Subject: Re: [PATCH] cargo: remove LD_LIBRARY_PATH wrapper
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jan =?ISO-8859-1?Q?Strater-B=FCddefeld?= <jst@mbs-solutions.de>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Feb 2025 09:59:04 +0000
In-Reply-To: <8c282110-84d5-4e9a-8c19-68ef2f10153d@mbs-solutions.de>
References: <1710ee6e-1ebb-4f15-bd5d-9c995b109e99@mbs-solutions.de>
	 <20250227064410.49465-1-jst@mbs-solutions.de>
	 <8c282110-84d5-4e9a-8c19-68ef2f10153d@mbs-solutions.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211986

Hi,

On Thu, 2025-02-27 at 06:48 +0000, Jan Strater-B=C3=BCddefeld wrote:
> > > On Tue, 2025-01-21 at 09:12 +0100, Jan Strater-B=C3=BCddefeld via
> > > lists.openembedded.org wrote:
> > > > Fixes [YOCTO #15579]
> > > >=20
> > > > This commit removes the LD_LIBRARY_PATH wrapper around `cargo`.
> > > > Setting the LD_LIBRARY_PATH causes many problems.
> > > > Some build scripts will not run because the build scripts
> > > > execute
> > > > binaries from the host system that are not compatible with the
> > > > target
> > > > libraries.
> > > > Even a simple `cargo help build` can fail because it uses
> > > > `less`
> > > > internally, which should not be linked against the target
> > > > libraries.
> > > >=20
> > > > There might be cases where the LD_LIBRARY_PATH is needed for
> > > > some hosts,
> > > > like the case described in
> > > > 388e7cac9f90e79ce8c3c1683d8ee0f4df1bc907
> > > > but one can always set LD_LIBRARY_PATH manually if needed.
> > > >=20
> > > > A current working workaround without this commit would be
> > > > always using
> > > > `cargo.real` instead of `cargo`, which can lead to confusion.
> > > >=20
> > > > Signed-off-by: Jan Strater-B=C3=BCddefeld <jst@mbs-solutions.de>
> > > > ---
> > > > =C2=A0meta/recipes-devtools/rust/cargo_1.81.0.bb | 8 --------
> > > > =C2=A01 file changed, 8 deletions(-)
> > > That wrapper was added for a reason. Is that reason still valid
> > > and how
> > > do you plan to mitigate against the issues it was originally
> > > added for?
> > > The commit message needs to mention this.
> > >=20
> > > Cheers,
> > >=20
> > > Richard
> I have rebased the commit and reworded the commit message. Is the new
> patch better? Let me know, what else I can do. This is my first
> contribution to an open source project, so I'm not familiar with the
> process yet.

The commit message is much better, yes, thanks. This is a really tricky
problem though, particularly for your first contribution.

My concern in merging something like this is that it effectively fixes
one use case at the expense of breaking others. Ideally we'd find a
different fix which fixes both your issue and the one that was
originally being fixed. I appreciate that is very hard to do though.

I'm not sure what to recommend. I have vague memories of the original
issue but not enough to be able to give useful pointers. Whilst we
probably don't test that tumbleweed combination now, I would be worried
that some other distro will replicate that type of combination of
host/uninative/nativesdk libraries and see the issue again.

Suggesting the user set LD_LIBRARY_PATH manually when needed isn't too
helpful as we don't know when the user would need to do this or how
they'd then add this.

One idea, could we add base_libdir to the code in cargo that is adding
libdir?

Cheers,

Richard




