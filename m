Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7D8C25B7E
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 12:52:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.11042.1717159947023831535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 05:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZuy557V;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c1e7708cfdso328109a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717159946; x=1717764746; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c72Tw2P4Eb1vbwwzWxs3RrSyVSA4r5glFiJosRtt9G8=;
        b=kZuy557VTQD6L2UV7dQTaBUpKq1CQXOSmR9Ag2Xh5Cp+dZ0oYKOuLY8PoClVL5kV7a
         +hfafcE6D6P/Qv/sQ7umKaGTJryWv7F82js2R8MZofqfK4s93ewekA7rr3hPCTTPXoJ4
         TdKChCZQujT8mFpa162S4ijtrnud/EIVJqAGbd7UAj3OLVxQAWxJUsXNJBL7wuXm8tSm
         kb5TiFWS5m0ru8dfbcggfNYRs5WRm0jzycMv4cQy17I9++z/dGp5VzxbG0mUAudbH6q0
         QIqlIuYXT/4UCnHNDZf5VM/7Fq5fKbQhK+SY8helKq+PgswaoamwMQX9NLKUtqpo6K8z
         qtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717159946; x=1717764746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c72Tw2P4Eb1vbwwzWxs3RrSyVSA4r5glFiJosRtt9G8=;
        b=pp2q55hpr+3kxJUSgPGMl56RmXKwLMDgveV9o3mTkCC6RnSGz85NH2puw+HnwOXZGc
         Gx0iQePZWJpKVp/UPLcZ+Cxl8L+PAEo5EqrUK+hTF3kngwQ9+m77KaxYGdD+uEjdrj0M
         YdSb3NcnrGxqZNaLPd3OD/nET56Kj1WLj4TwNkKmLKot2Y+lIp5uIH1nJE/xOz/TbeK+
         iHLyOSpa4pQev6feH5hcmBZF5hgO6NdtzJAQBp9YXqsYODdK4QGYkiz//ypvMdonF++U
         /ACdlEyR5x4J2tVoJCZfK5Fc9c0ec3pgg+cHGWWcgqF0gUXpahpbbvyER1pjBZvds5go
         jgkg==
X-Forwarded-Encrypted: i=1; AJvYcCXPoHLyz8rrwgAbD59Qmiz1BbHOADxGUODzV1r09Tv+CUq1Bp8FUJ2nH6TmfNb1gmjwSOrSC7doOxery4IBgGzR5UhB0mUprPbCCDtVRjVjqTMJOXyiwkdI
X-Gm-Message-State: AOJu0YyUyAMo1nC5dumjR5YMXyhDA+BzBGkXR4pPC6VQPbL0CZKEgwk/
	Y447EPz/vuuey8f2wJPh8XhINugDit1MQzS0o56fiBT7WKVCqorxP1aSakYWGGnH41CvDUpNME5
	A1slemtIzGE5oS9M6obyGw2TWikg=
X-Google-Smtp-Source: AGHT+IEBUv1EgOb+2f7BbvBAuyPihRAIG5a58UwQmnFyReHZJpB0ToFnwwdwk0gs+UuIx3IyT8E6MZnC4Ix3nVKm9yM=
X-Received: by 2002:a17:90b:1943:b0:2ad:e004:76e6 with SMTP id
 98e67ed59e1d1-2c1dc56d957mr1632144a91.7.1717159946242; Fri, 31 May 2024
 05:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717105222.git.bruce.ashfield@gmail.com>
 <c44b4254b0cbc679d548171abbc415a29e4e2b96.1717105222.git.bruce.ashfield@gmail.com>
 <17D485A451D95A5E.21428@lists.openembedded.org> <fff284602f93b1babb2da087c114eab1c23b80d2.camel@linuxfoundation.org>
In-Reply-To: <fff284602f93b1babb2da087c114eab1c23b80d2.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 31 May 2024 08:52:14 -0400
Message-ID: <CADkTA4M51sca6vmZr=s=x=qww9eAbdnYLwHJPZV_SET29u=9DQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] linux-libc-headers: bump to v6.9
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 12:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200072

On Fri, May 31, 2024 at 4:58=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-05-31 at 09:31 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2024-05-30 at 17:44 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/conf/distro/include/tcmode-default.inc                     |
> > > 2 +-
> > >  .../{linux-libc-headers_6.6.bb =3D> linux-libc-headers_6.9.bb}    |
> > > 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-
> > > headers_6.6.bb =3D> linux-libc-headers_6.9.bb} (83%)
> >
> > I think this is causing a musl/busybox compile issue:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/9384
> >
> > but I haven't 100% confirmed that it is this change specifically yet.
> >
> > Copying Khem.
>
> It is gated by CONFIG_TC, which is disabled in our standard builds but
> set in poky-tiny. I'll try unsetting it there.
>
> There is a patch on the busybox list to fix the compile issue but if we
> don't need it...

Aha. I didn't build poky-tiny, I built poky and core-image-minimal to
test, which is why I didn't see it.

This probably explains your comment I saw earlier about busybox
being a bit concerning due to lack of updates.

What's the preference here ? I can always track down the patch.

Bruce

>
> Cheers,
>
> Richard



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

