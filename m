Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C61CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 14:38:26 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.18433.1757687902722740207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 07:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SSiUa1gc;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e9baa0310cbso2100993276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757687902; x=1758292702; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HnXtE5FOWu0TKEzjbSyLpVIGmaQcXbchDdSjq/9SP8=;
        b=SSiUa1gcJx4zNevkZkumVyzpEzjoVF9vxPgU+B6NWX0DKo/5PS4/y9L/ZDqqXYo3zo
         NycJgzfCQT6eNyDSY2AUnpJx3/Jy7ZBYxMZ5N+hT90amzisBHneTYM6Y2GfOeENW+PXO
         STl6zJW84BTJ9Xc3AKMrRowvPr98e49KBKeziNkkl6Pk8lU2Q1uP6FT88nX7g7Inlq+q
         6QcItHtxMc05Dcn82bZoTgmjkOXKR9jrIPptf2FK74gmnYAtr14cXAGVdoIi5IAH4I9Z
         LVx4o1LggluxMxbDj9RfvX4bZ+9PXKbdAVbPRspYW65I44BU2Zy5UUS+9eAD8gYzewpx
         6D1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687902; x=1758292702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HnXtE5FOWu0TKEzjbSyLpVIGmaQcXbchDdSjq/9SP8=;
        b=cqAtOCCn/dc2NhCbPKc7k0lLTyYiHQd0o6x+4dBRF3f9fYX2LJhvCuLVpw+9la3X76
         NrIkdDfJ110JejUBXUOQUIe0Hjnk/SbaslpLBlEkEuhoGbki3cTdmK5oxx4MGXsdYqrX
         6r/XBuGU/mOiBEpMB6lMRONwXTKZsnySG+CkK/zBneX36w8pBTM8humgfo9UYipesvMu
         R/i8KsItFT/jLFZsjg/u8Eiw75Su4piMppCkoZ3RoErhMUWFw5s0oZHZ5N/yZd0vMmDF
         dXHtErDwa+1zb7loot0j6Z7V1DWZzTar8+gEDV5cZGUrWJlIhbA/hywLgVIWa/x1xYcQ
         DaCQ==
X-Gm-Message-State: AOJu0YzoffYLzwZkgMLz8KmZZrVqc59trX2gyz35TzVW/5etW0+BqqJ1
	PBpTTj5iCIiLc3hN8mWue4QzPYQ2xnOBdQ1q80TMFzt6NgV8RFx1EQX9NpCqXl8K4hrA+lBnTGE
	MvR94vqBcxC3OGZSlaC970DiEwFVQaBY=
X-Gm-Gg: ASbGncsZeiUo/l0WiuGkA8KuQgFN1eP4fgNAKOkcilRD3TOYI6ZabFhNjrXvqEvo4mM
	wcQbJoXH4dhE0vJOGj9hEPQayNkYBoRtq6eilTY/PQUwVhOjsySn84vDKXOUF6/yS4GCvgQeLt9
	jQr+fvFR2RQnArmlulTi0xG07gmrLK2eAt6vqOXuEeameGKZnWA467xHFxGNbttmw0av5KMZC/K
	DxvunfCnETZnshRMb/RT4WxvxQm3WQK
X-Google-Smtp-Source: AGHT+IGJWJRDY8trDOISLU1EBl5WyGounylX/sALzXw5C5AZefY/lU0AnYx9sDhlC0r/OjemexHYlQThq4G+iWu7hXo=
X-Received: by 2002:a25:b2a6:0:b0:e96:e420:1a1b with SMTP id
 3f1490d57ef6-ea3d9a7bdd4mr2554819276.33.1757687901724; Fri, 12 Sep 2025
 07:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250905171154.182825-1-kamel.bouhara@bootlin.com>
 <CAJdd5GbX8GT+k+YkSkFiB=dk4ChfhFcVeENk-O4-NR+x7EMjqg@mail.gmail.com> <mwdzemgsgy4ukf5x7xfjsatfqoq27nq54fddaoxnjvpiztlcpr@xjo4wkk7ahes>
In-Reply-To: <mwdzemgsgy4ukf5x7xfjsatfqoq27nq54fddaoxnjvpiztlcpr@xjo4wkk7ahes>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 12 Sep 2025 08:38:09 -0600
X-Gm-Features: AS18NWB4dYWm7OJsjodEHmFjuqSMfADyTPxQg1thEBaVxNINhJnmW9wlmh3Gh74
Message-ID: <CAJdd5GbUCa1b-kDKfNRCaJj-CP_CA2odTWv0aGcT_VK-nUMBPQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] backport: SPDX 3.0 support to Scarthgap
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, 
	antonin.godard@bootlin.com, Pascal Eberhard <pascal.eberhard@se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 14:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223319

On Mon, Sep 8, 2025 at 3:01=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootlin=
.com> wrote:
>
> On Sat, Sep 06, 2025 at 11:02:26AM -0600, Joshua Watt wrote:
> > On Fri, Sep 5, 2025 at 11:11=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bo=
otlin.com>
> > wrote:
> >
> > > Hello,
> > >
>
> Hi Joshua,
>
> > > This series backports SPDX 3.0 support from the upstream Walnascar
> > > branch to Scarthgap, along with a few additional local fixes to ensur=
e
> > > correct integration.
> > >
> > > The primary motivation for this series is to bring full SPDX 3.0 supp=
ort
> > > to the latest Yocto Project LTS release, Scarthgap, which will contin=
ue
> > > to receive maintenance updates until 2028.
> > >
> > > This ensures that long-term supported releases can benefit from the
> > > latest SPDX standard for license and compliance tracking.
> > >
> > > These changes are also in line with discussions at the Yocto Project
> > > Summit in Amsterdam, where the need for up-to-date SPDX support in LT=
S
> > > releases was highlighted.
> > >
> > > The backport introduces SPDX 3.0 document support, SDK and image
> > > integration, and related helpers. It also brings over tasks, classes,
> > > and library code from upstream.
> > >
> > > Feedback is particularly welcome on:
> > >   - The correctness and completeness of the backport
> > >   - Whether the local fixes should be adjusted or further refined
> > >
> >
> > Interesting. This backport isn't as bad as I initially thought it might=
 be,
> > thanks for putting it together! I'll look it over more closely to make =
sure
> > it seems alright
>
> Thanks for the quick review and the feedback!
>
> I hesitated to do cherry-picking and finally chose to backport every
> SPDX3 related class and library in one patch to have a clean and coherent
> backport. For related functionality (like the license refactoring and
> image manifest), I used cherry-picks.
>
> >
> > We had originally stated that we wouldn't backport this in OE core, and
> > would prefer to use a mix in layer.... that said, it is probably the nu=
mber
> > one request I've gotten any time I talk about SPDX, a lot of people are
> > pretty interested in having this, and there are a lot of advantages to
> > doing it in OE core, so perhaps we can discuss that more.
>
> I also think that this belongs in OE core, LTS releases are used in
> production for many years, and SPDX3 adds significant value for
> compliance and SBOM requirements.
>
> Regarding the suggestion of using a mixin layer: I=E2=80=99m not entirely=
 clear
> on how meta-lts-mixins would apply here. According to the documentation,
> mixin layers are thin and specific-purpose, maintained by the community,
> and not tested by the Yocto Project. SPDX3, on the other hand, is a
> fundamental part of license compliance infrastructure, and its
> maintenance should remain unchanged and part of OE-Core to ensure
> stability and testing across all LTS users.
>
> >
> > The one thing I can tell right away that you are missing is the test co=
de;
> > if this does go into OE core, backport of the test cases will be requir=
ed
> > also.
>
> I did a quick check, and my plan is to cherry-pick the following commits
> from upstream to bring in the SPDX3 test coverage:
>
>         838d64c096 spdx 3.0: Rework how SPDX aliases are linked
>         14f534f15f lib: oeqa: spdx: Add tests for extra options
>         ccd6dde301 oeqa/selftest: Add SPDX 3.0 include source case for wo=
rk-share
>         b1d2309b3a selftest: spdx: Add SPDX 3.0 test cases
>
> This should provide equivalent test coverage to Walnascar. Does that
> approach work for you?

Yes, that sounds like a good plan

>
> Thanks !
> Kamel
>
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com

