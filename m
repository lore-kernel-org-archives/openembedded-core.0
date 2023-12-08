Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93456C10DCE
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 08:28:41 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.15912.1702024112321604239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 00:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C2M8Hdh2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c09d0b045so21631035e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702024110; x=1702628910; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k/k/g5j6EL/vR66naLeSo8tat0Wtow7NHcj4ZBwBGAo=;
        b=C2M8Hdh2JyaNilgxyc2Ha35ciWYbvEBNxInIfOhtTc8/swxDe0QOAVqUuAn6XIbInk
         M7KuMbxeVdX9uLGXVF4/SrEXaP6Gfe96Gcd5G2Rbd3Rb36DRAV0qQcOPPI+rxCcJGsgv
         C+wqb110TH6AmAXSfWwNwk5WhZNJh/iKSFIvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702024110; x=1702628910;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k/k/g5j6EL/vR66naLeSo8tat0Wtow7NHcj4ZBwBGAo=;
        b=MkX0UdLS0+0gcsunbzoE5TCewTLAkmDmf0CYCCHXoOlm7EMIwA4fi4S1cnVcNYFY99
         hn4mcwQYXnqXf/P/4LRPT3tWxHPNHvhCI1z0EWK7mddlLp7HHxqIoM5V1RqvlBhB9lCz
         1TocRX+Tg+psYcZxhv2XDFX87YJrdyN1HPmlkQ6Tt/htjkFXjfVbofXJXUe31YSq3aXk
         jVJ824fIT1Lm1zkzinqcQcAPs0EtbGy5jJbGCkf7UQ3S4R+BW68aBDuRaYQbdRhVnst3
         ypwG/Y4jv74Xj55zwhJoWUzz6+1yJvFpNgylUF88e9cYm+vSqGQSpqbspXh2A/1vqbNg
         8iqQ==
X-Gm-Message-State: AOJu0YwDfBB8R7sKWXS1liE8DEdpfQH6ze8bsTOzWWMtZEJ0OxJlDp9N
	QgXiTKPIAn7R9mtePGAnY4NixbP+W+sBlXQ/lT8=
X-Google-Smtp-Source: AGHT+IEme2mTyi86Q1ooJXfmzuqX5+OhG8jGiIR7kEgLPIA+Cqjb+buUggbG+Va56R4+5SF3B9K2oQ==
X-Received: by 2002:a05:600c:3584:b0:40b:5e21:c5e7 with SMTP id p4-20020a05600c358400b0040b5e21c5e7mr1479960wmq.181.1702024110626;
        Fri, 08 Dec 2023 00:28:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b? ([2001:8b0:aba:5f3c:7bab:5c16:7781:6a4b])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b0040c1d2c6331sm2090064wms.32.2023.12.08.00.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 00:28:30 -0800 (PST)
Message-ID: <c0e97192f405d792551702597904a182292862ad.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 2/3] cargo: Move
 CARGO_MANIFEST_PATH/CARGO_SRC_DIR to cargo_common
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 08 Dec 2023 08:28:29 +0000
In-Reply-To: <CAO5Uq5T2OdiJS_HvZJBVGNqaS5gA7MxQUx2-5embGX9jMKs_gQ@mail.gmail.com>
References: <20231207133913.443-1-alex.kiernan@gmail.com>
	 <20231207133913.443-2-alex.kiernan@gmail.com>
	 <58a265ee08706c7d5e0b9c5678dfbe44b63c96cb.camel@linuxfoundation.org>
	 <CAO5Uq5T2OdiJS_HvZJBVGNqaS5gA7MxQUx2-5embGX9jMKs_gQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 08:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192017

On Fri, 2023-12-08 at 08:15 +0000, Alex Kiernan wrote:
> On Thu, Dec 7, 2023 at 10:40=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Thu, 2023-12-07 at 13:39 +0000, Alex Kiernan wrote:
> > > cargo_common_do_configure uses CARGO_MANIFEST_PATH (which depends on
> > > CARGO_SRC_DIR), but their definition was in cargo.bbclass.
> > >=20
> > > Match the other variables here and change to default values, rather
> > > than weak defaults.
> >=20
> > FWIW "single value" class variables tend to work much better as ??=3D
> > (which I'd call default value) since than it doesn't matter if the
> > recipe setting comes before or after the inherit and the inherit
> > position in the recipe doesn't matter.
> >=20
>=20
> Ah, I guess that makes sense - for "single value" :append/:remove
> aren't really useful, so leaving the actual assignment as late as
> possible works?

??=3D means "fall back to this value if nothing else is ever set".

For a single value, append or +=3D never makes sense so the fallback is
probably what we want from a class regardless of order.

If you use ?=3D it just adds some ordering constraints.

> TBH I've never really been very clear what the "right" thing to use is
> between ?=3D and ??=3D

For the above case it is one of the few "clearer" cases. As soon as you
have multiple values, it becomes fuzzy sadly. I'm not sure how we
improve things either.

Cheers,

Richard

