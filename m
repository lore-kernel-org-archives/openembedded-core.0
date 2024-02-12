Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF28C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 12:56:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.5727.1707742563691659104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 04:56:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mv7CWRQZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51142b5b76dso4639357e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 04:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707742562; x=1708347362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHrC+g4Z3PvRYOOyHh3SkSRvCiEnlvPLVsLpmz0mrDU=;
        b=mv7CWRQZALsYw6Cojg5Jpt+PnMuNT3E6fugTIRJj8Udez8oG26st+a7nk3caxbiF96
         ICknSxIjfS4UKogZ631QjbGK7VKNB5oE45hCa95Idx6mUegx8Of3LMbOK+YUW19YtaPX
         Z1lhgSitm+lPdGP6raJe8gA7BTew8FAj8/mTQoOvM80wFYgbjvZm1p/8DabhSI1Fl8tH
         fn20F7SnG1Qt5KhVZ/HcjtiL+Utt7ho2RFeeQsnjfH+dKrPi7idkVf9WCABTbN09JdUL
         TAt3OHemptWoxTr4RNj7xpSo/6bRha2K1aCzJnn9if2J5DmRA+M8unDkgpcAGpYJaE1e
         gN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707742562; x=1708347362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHrC+g4Z3PvRYOOyHh3SkSRvCiEnlvPLVsLpmz0mrDU=;
        b=uP5jksuUPHo51SyXk2ogrMOo+xclE5UeqNIwPaqcLe/PWBZvk1AYBjByz6uJMppGsb
         s7RxGMNAyvEaC4pLHd974r1rlSyUZB27LcvzWocvtKzCa45vfe0qCEa2fJzJSUo/zqj0
         govVx7qGNDoiLdLXJqOo+uJR48Doxw7AhOxNVOEwt1y62ayliOeSbNRe/MHeuuz722nl
         r5FJU7N1xjmLyolZv61+ca2OGJlIBUBXuG8s1i0bhtZ33JJ9H6BwphBKSnw2tCrjtD0C
         w48qfylXXj0eLt8eoeNSomDc3tuj3IQlSbwo9zoZ9QrQzjvipw1OWNY9ArRbCCF9BjMV
         D5Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUhqyKi3XSey+tNXWK5LLtgeqpRe1yE1xBA7WZDWTdp7nrPT0yRQGJVC/MNo7q/Nd9JhHxZyvWRtlKoKSLj2cwwyVnCJk0deHqXJ1CrY5P+SXEkMACs7Aqg
X-Gm-Message-State: AOJu0YwVLMwAtbdNe6c8lWqzyMe1NLzkIHwc0j0VcsV4lVhz4XlkExEo
	b82sXxKI8cmXU8wRQjTZNw5T/+0gNPg8UDk0zhhyIgwVmTpFZ64u+5g8b41uFAqy4Wg6wKNPQsy
	2AlpjYOA8yb5EWIadEAOrSaWRZ6k=
X-Google-Smtp-Source: AGHT+IENawdre9X2sK9xkcz98Tpc3EqVH/N+j9iIxmIlHIlQtnzgypGxDikF8zK6TFlUs7YChRqzJ2Uj/iuEbNhlFD0=
X-Received: by 2002:a05:6512:513:b0:511:87c0:a327 with SMTP id
 o19-20020a056512051300b0051187c0a327mr2725217lfb.68.1707742561655; Mon, 12
 Feb 2024 04:56:01 -0800 (PST)
MIME-Version: 1.0
References: <8d71c0f-9120-85b7-80ce-d985aa557f8@crashcourse.ca>
 <8C7A9199-D49B-4190-9D96-F060CD858C71@arm.com> <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca>
In-Reply-To: <bef4a38f-aa1e-d57b-e23-f3a059ebe313@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 12 Feb 2024 12:55:48 +0000
Message-ID: <CAO5Uq5Qyr7ca2rcVtRs4seSyKid58J3ZGhRHuynm-AFYgM1PXw@mail.gmail.com>
Subject: Re: [OE-core] more ptest pedantry: why conditionally include
 "run-ptest" in SRC_URI?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 12:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195316

On Mon, Feb 12, 2024 at 12:17=E2=80=AFPM Robert P. J. Day <rpjday@crashcour=
se.ca> wrote:
>
> On Mon, 12 Feb 2024, Ross Burton wrote:
>
> > On 12 Feb 2024, at 06:39, Robert P. J. Day via lists.openembedded.org <=
rpjday=3Dcrashcourse.ca@lists.openembedded.org> wrote:
> > >  more annoying nitpickery ... here:
> > >
> > > https://git.openembedded.org/openembedded-core/tree/meta/recipes-exte=
nded/xz/xz_5.4.5.bb#n28
> > >
> > > it's not clear why someone would go to the trouble of conditionally
> > > including run-ptest in SRC_URI as i would have thought the only
> > > benefit would be to avoid the triviality of copying run-ptest into
> > > WORKDIR, but beyond that, i don't see what the point is, and that's
> > > the only recipe i've run across that bothers to do that.
> > >
> > >  is there something more subtle happening here?
> >
> > No good reason, and I=E2=80=99d approve a patch that removed the
> > conditionals on the grounds of cleaning up the recipe and ensuring
> > that there=E2=80=99s less conditional paths through the recipe.
>
>   it gets even stranger when you have a conditional to apply a test
> patch, like here:
>
> https://git.openembedded.org/meta-openembedded/tree/meta-networking/recip=
es-protocols/freediameter/freediameter_1.4.0.bb#n21
>
>   i am also assuming that it's cleaner to conditionally check for
> ptest assignment for stuff like SRC_URI and DEPENDS, not with:
>
>   ${@bb.utils.contains('DISTRO_FEATURES', 'ptest' ...
>
> but with the more intuitive:
>
>   ${@bb.utils.contains('PTEST_ENABLED', '1', ...
>

The PTEST_ENABLED version has the advantage that disabling ptest for a
single recipe is much easier. I guess you could manipulate
DISTRO_FEATURES on a per-recipe basis, but that feels awful.

--
Alex Kiernan

