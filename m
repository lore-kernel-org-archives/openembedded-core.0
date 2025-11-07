Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7898BCCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 17:26:04 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4742.1762536354876030079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 09:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPG2+mtj;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63f74b43db8so990830d50.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 09:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762536354; x=1763141154; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bet169TUNmc3CDXyedFjJ7QI7EmtQtpIbKVCFowXocg=;
        b=UPG2+mtj9xhDMK/RR+/AgyXnUclra8AtfoVkhjrsMFYnVNgUavd2wCKxaHkCJvC5dq
         Xt/zZT2SKzJd6FEgtJG5I8ZKKNl0hRysOV45NWD4oLkIU/5MExBrl8zjVFiTtKTRNTpD
         CfwEdib9o5e12Pm04VsPlBy+DeenbmnzQjQtJ4D6hUhXOMm++HwUSKeOR08Vypy2sLSg
         EZY1Ht57tfrhSrK4cBXgKBi0I0lJmeuhCx6+hNnzjJt68TvdfXEr7/FYlIPua5TxXVlK
         S/8Qq4xqePNNjEuWcfEAQoecyMLAzpwD+ShQj5l6sXAdSn8Lsen0MTc/RCfO8od7Gl9i
         P7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762536354; x=1763141154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bet169TUNmc3CDXyedFjJ7QI7EmtQtpIbKVCFowXocg=;
        b=pW0sPYarCqTQJ0Aei8Y9WKmeEgo/Rmtmg0H3FvQb5fpVj776ERn2Kouxrgqo79/NO1
         yeIjrTStQN495ZZrHer5LuSU0d8eY1txsioOeDDl7bTqWEcR3HfH63TqWYrHtzBiYUcC
         ymsq0LV50SesQC7UQlQGVjofJZyOOdd6JqF0+haE22SZ0O9MoKnWgPvAi4FFqs9BWWqq
         xNJt5C7jeF2TgBfR0FfZVeF6VpeUYD72UGMHa7upGWV5i6EpigtGIUhZfmSc62Zm9wN1
         6vHyatwYoX4Bq8PIWmVADVW3y8po3OL67I50C/VzOu5UjKvvQbmx9QwOwtzySZNTpW9J
         dB5w==
X-Gm-Message-State: AOJu0YwI+WXuW9OS/ecxaczCq3++gM+MJ8zNLa9kv1O1GSA8dUN1DQ8K
	l4IaevLg2VpDBGOf84a7x2OavDgPoAzqflXx5S8iYijVKvx0m5zw7tgAjLdG/IJ1uV3aE4PW2M6
	2IsHxZ3AjO6ZD3gRAjlXlv8Bf0QEJ9xc=
X-Gm-Gg: ASbGncsCI0oLeWhLaIZJFmqWkA6hdZlxaOm6ht9uoX1jxnPVy6M6hgn17ILW7dGQerG
	TUUDiEc8PVCIOTgMHfgn8czg3UOrJWwHT8No+7RNJuAiALYKw9yINBEdTyA7fp8RZR6eCVBFkTW
	zlPKT851RtfvL4gul5TE1m1xe6Vi+d+ZzV7kJzzSlWe6ta2EZOLrDzqncxCKtz7tI5P7BHmmrpK
	b6VpiyHyz4hJ279YPhQMn+IIsHpouD6hEYumKTKnFj9PISenn6jC+k61+36658JTMjz2eGwLnc=
X-Google-Smtp-Source: AGHT+IGFNVF0WbvYwUVOgGHIPxQaESYxGLYYKkpyEbPifLdlCgrvMz0IPDdLAHYKhtFiCY6E8Q2uaHA87CyTFAx2QZg=
X-Received: by 2002:a53:c059:0:20b0:63f:b922:ed79 with SMTP id
 956f58d0204a3-640c418d78dmr3046186d50.14.1762536353806; Fri, 07 Nov 2025
 09:25:53 -0800 (PST)
MIME-Version: 1.0
References: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
 <CAJdd5GYSgnUtey269iGQzcoxNfB6u48QWMGsjsDYoAQCa_YNCw@mail.gmail.com> <8e5019335cf683491cb29159a2ae3e34eb3942c4.camel@emlix.com>
In-Reply-To: <8e5019335cf683491cb29159a2ae3e34eb3942c4.camel@emlix.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 7 Nov 2025 10:25:42 -0700
X-Gm-Features: AWmQ_bmwR7alrdeZhjuK5z3BTuB4CTCsCumEBliw3jLbBZu-bgutEQtTq4Yvx6E
Message-ID: <CAJdd5GbX2UfEWrLs5gaYFGZK9SrHT4YxeZgTUmOyhDsrQOBprg@mail.gmail.com>
Subject: Re: [OE-core] Thoughts on SPDX for files from meta-layer
To: Daniel Wagenknecht <dwagenknecht@emlix.com>
Cc: openembedded-core@lists.openembedded.org, 
	OpenEmbedded Architecture <openembedded-architecture@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 17:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226063

On Fri, Nov 7, 2025 at 6:33=E2=80=AFAM Daniel Wagenknecht
<dwagenknecht@emlix.com> wrote:
>
> Hello Joshua,
>
> thanks for your remarks!
>
> On Wed, 2025-11-05 at 09:53 -0700, Joshua Watt wrote:
> > On Wed, Nov 5, 2025 at 7:54=E2=80=AFAM Daniel Wagenknecht via
> >
> > I don't think a variable to specify the public URL is going to work
> > well; for example, if a layer is forked, it will be wrong and
> > confusing.
> Agreed. My intention was to get the "public" URL for a layer, even if
> it was pulled from a fork. My naive assumption was, that this URL
> should point to a publically reachable location, but according to the
> SPDX documentation for the downloadLocation field it might just as well
> be an internal URL. This simplifies it.
>
> > Just thinking off the top of my head, a better option might
> > be a variable that specifies the name of the git remote that should be
> > used, and if it's not specified then the URLs are ignored?
> > [...]
> > which would use the "origin" remote of the oe-core git repo, and _if_
> > the current SHA-1 of that repo (which bitbake already knows) is in
> > that remote, then it will use that remote as the URL.
> I like that approach! To clarify: this should not access the network
> but work with the local view of the repo only, right?

Correct

> I guess the local view of the remote could be out of sync (e.g.
> something was rebased on the remote), and if a commit is not part of a
> known branch of that remote (e.g. the commit exists in a tags history
> only) this would also yield a NOASSERTION value.
>
>
> >  In this way, if
> > you fork you can choose to use your own remote, or for example pull in
> > upstream oe-core as an "upstream" remote and use that.
> >
> > I'm not entirely sold the above description is the best path, so maybe
> > we can let others chime in.
> Developing the thought further I think it would be fine to default to
> using the git origin remote as default and allow adapting it per layer.
> I'd then introduce an
>    SPDX_REQUIRE_META_LAYER_ASSERTION
> (or similarly named) variabel to promote unasserted values (like layer
> dirty) to build failure.

I'd start with NOASSERTION. You can always post-process the SPDX to
check for NOASSERTION after the build finishes if that's something you
care about; then we can separate the discussion about whether that
should be a build failure for later. I suspect many users will have
different QA tests they can perform by post-processing the SPDX, which
would remove the burden of needing to make builds fatal for everyone's
specific (QA) use case.

>
> > I do think that we will want a way to
> > solve this, as we have also talked about including the information
> > about the layer itself into the SPDX, so this is more or less an
> > extension of that
> Yes, small steps. Working out how to refer to a layer to construct
> downloadLocations for individual files is only a first step, creating
> SPDXRef-Download-meta-layer entries for layers and refering to them
> would be a logical improvement.
> >
> >
> >
> Sincerely
> Daniel

