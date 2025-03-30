Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F593C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 16:45:55 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.33592.1743353150105585730
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 09:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XTh8Zhg8;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ef7c9e9592so28440587b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 09:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743353149; x=1743957949; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH6FYx0UMYOB8LfGsIa2iPvHxkwLwz6b2VnNGmL6SEQ=;
        b=XTh8Zhg8QKCM0e3aHqqQxVmLJUjMvSV7KqvV0/lYR7c1K7MxSC/xB1ZOWv4b+pE4R0
         WvuzwJzcyErYRzJMot1DHE/PQzR2stRgf+5YJJqOAfqWQHkVwrWirVxONEFZwmG9jXos
         Lt1FtUeFLSwkq+BNdMKLhzPc55n/uqh8nxbX0J7UxcqORFxabJHWbaslct1NrCGUQwBI
         L+j/ddq9HX76s38oVnRH6h0FtsPf1A27xzjbzF1gpdbCQDepF30edlYTMM+elmMisRq5
         paeDjxehrz6UzDwGlR2vKFD8EsDntcyfvLxU+8+rWpkp+tYkCfwom55HX38oiLIwDayg
         IERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743353149; x=1743957949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LH6FYx0UMYOB8LfGsIa2iPvHxkwLwz6b2VnNGmL6SEQ=;
        b=n3mBTumCXurfRNTMg6w77i5OIyNJavreTQO9YlJmZCTjGnueTf1G0RVGHewHvt/QYx
         lyOENOPEWW2R3m/IHrf/Ptj6sqoO2zsHygZpCBfQfSC2Quc8im0PeBS5GAGlY3vgKps+
         lGIabavcVlRliYwuUc7ZIl2QsPybICZzX4t2HXQ2Jeqm46iGl9bsEYzuL3Wa2sAcIXdH
         0pozvTmLD5MjHVnXwIKzcrBKeUnMnugZizY4CF6QX1e/sC5+PNDvFSCHPof8875ZcPLv
         x+l+4r6Z5sP7LZCFvNfUJYpkp7fdd9nbpI6SmdDiShNT+uW2Uw1P72eFaLmDd+usbh1b
         W6PA==
X-Forwarded-Encrypted: i=1; AJvYcCXVs/HHeF8E6aznU7B9oc2TZuMKpPmgsQB43XQF8fz14wKtv6fzaAru6ELhbkceBjguz78tvChIhYc/ZytaQ+TbDw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcFVdzNva3wciAkVeWP/Fp8M4Zf3e8YjMUOYSlo9YbEBm+iPsu
	iCLFih7J/9FjIuLn9fKUQw3WBwWBwsHel3sAqrXFs7i9z/ayI+JlO6OP+WU+8KpWXkbKAeMfr+8
	eBiTk8HLitfgraMcCugJo0CtAbeKk1Q==
X-Gm-Gg: ASbGncuIq2A+/WJZK068tIVVBV72gmmtsrE0mCJzRf5WXJgR06RG4ep4EgzfEhi+RLK
	ih0ukBHnYCS+EdJDKRwhskqvyWpEI6isgrlLPEKTZ3RzaqEPwwkQdlERo1gRiCx+xmtO4IfxYqX
	bx4l3VnAEY6NrWQOphX8MBiRk/QR+1Z2Y86JaT12FwbcR6BuQwzFXPYNe0syg=
X-Google-Smtp-Source: AGHT+IEjC9+Qit8AEqhnTI4JnMgeDXgy4NFot5ByzqJi4+cHCxYSxpKKAmDkBplUF9crnZCtLSTfOr9wpuvRSD6XMGw=
X-Received: by 2002:a05:690c:6e05:b0:6fe:b88e:4d82 with SMTP id
 00721157ae682-70257309819mr81698547b3.28.1743353149229; Sun, 30 Mar 2025
 09:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250330101938.2634400-1-jan.vermaete@gmail.com>
 <dbaeb44938c460c2a14c388ac9807476684e140c.camel@linuxfoundation.org>
 <CABF_=ygQUzCs0m+4NXF_fGVFcEnabAf7dk4+ofARuPBiumY27g@mail.gmail.com> <4831ec28-9c53-4b0b-ba6a-e7571c2f93ef@baylibre.com>
In-Reply-To: <4831ec28-9c53-4b0b-ba6a-e7571c2f93ef@baylibre.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sun, 30 Mar 2025 18:45:37 +0200
X-Gm-Features: AQ5f1JoJvFoLCE8WfOoKjr-91Gl83T8mhneHN-zE5hFu73ErtL54RojuPuBXer0
Message-ID: <CABF_=yhMJjTc_KNBkeOyEOQFhw6TtDHbsLdZZ9AefOzT1JPpHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-breathe: new recipe version 4.36.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 16:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213921

I will resend them into meta-python.
please ignore the python-breathe and python-exhale patches.
Thanks for the review

On Sun, Mar 30, 2025 at 6:36=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
>
> On 2025-03-30 10:31, Jan Vermaete via lists.openembedded.org wrote:
> > Hi Richard,
> >
> > I thought because python3-breath and python3-exhale are closely
> > related to python3-sphinx.  And that one is in oe-core.
>
> If they aren't required by anything in oe-core but extend sphinx's
> capabilities, then it's probably fine to put them in the meta-python
> layer instead.
>
> If you're adding new recipes, you should also be specifying yourself as
> the maintainer for them in this file:
>
> meta/conf/distro/include/maintainers.inc
>
> >
> > On Sun, Mar 30, 2025 at 4:00=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Sun, 2025-03-30 at 12:19 +0200, Jan Vermaete via lists.openembedded=
.org wrote:
> >>> Breathe is a Sphinx plugin providing beautifully integrated Doxygen o=
utput in your user-facing documentation
> >>>
> >>> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> >>> ---
> >>>   .../distro/include/ptest-packagelists.inc     |  1 +
> >>>   .../python/python3-breathe/run-ptest          |  3 +++
> >>>   .../python/python3-breathe_4.36.0.bb          | 22 ++++++++++++++++=
+++
> >>>   3 files changed, 26 insertions(+)
> >>>   create mode 100644 meta/recipes-devtools/python/python3-breathe/run=
-ptest
> >>>   create mode 100644 meta/recipes-devtools/python/python3-breathe_4.3=
6.0.bb
> >> A key question is whether this is needed in OE-Core? Are there recipes
> >> in core that are going to need to depend upon this soon? Or is there
> >> some other reason we need it here rather than in some other layer?
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#213919): https://lists.openembedded.org/g/openembed=
ded-core/message/213919
> > Mute This Topic: https://lists.openembedded.org/mt/111984549/7611679
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
tgamblin@baylibre.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

