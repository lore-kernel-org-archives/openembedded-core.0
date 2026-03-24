Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D31AF532FB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 09:03:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15416.1774341993773711911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dk7tE9ib;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBBFF600C4
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83293C2BC9E
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774341992;
	bh=l5j0Job7uB0298XbZfeP9dwGDPsVwoNxoCuSR8nn+Tg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dk7tE9ibP/rIeD3MpMMJRN3ALc/B+LxEhehzHY3TlnpQWd3XL6LBHJ4GPix9NiNJA
	 mEJxB7zNLKmi5WEKHsupQh6odV/BedFafKop1xOy8fgge5g9kHUmtjF/jdKoPDeajM
	 XzFIB/EyoZOliKnKroeMnVGnkYAys6Gji92JzIYaHc2ddPKUMrSIZI+7gEQycL4gT9
	 lc7OFYIIu9xPQaooNaShvZhr3rLUbOy+xaAkBg/Inx1UyuOlQrCYeNegLOS+mLDLTv
	 f1ejE0tQKfV024QQDkk3m6mct23Y+BNtIhzDUGlNcAXEXyZdWWS4ahYUfw5Tdijh+R
	 8AvdHKM1DpbQw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38a23dd61c1so41416111fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 01:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1zr/hi6jVcb+eTQKw8OvPcvoLt4vm2OwAYcRPIVUEsGa7g/oWai416jNYXNX9dplYF7J8YzcMiCMtIWhkm7mBWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWVwIhBAdDkwS84bGwlvkGhO61UeAUOLnFQZtkXg2weJLR/29L
	A/K+52mTHDRBfp0LD3+qeQ9McJZzwUshOaA0qZ4qhQ3sNkSRPZkyCEjmG0rZW1yZXg4rWxhl+BW
	qKbka1zsvIjUyJDprO5ZMx6t6lGqit10OmnfhYTE1Hg==
X-Received: by 2002:a2e:7317:0:b0:385:c7f0:2b1a with SMTP id
 38308e7fff4ca-38bf9732a90mr34542121fa.33.1774341991194; Tue, 24 Mar 2026
 01:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com> <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com> <CANNYZj-Z3TKK9RTas0dnn__fvoo+-jP8SRjjLzhKBghR7NiWWQ@mail.gmail.com>
 <d8c59726-e8b9-4dc2-9bf9-48b0647d10dc@gmail.com> <d33eccff-ac69-4eb2-9204-086ef9f864a5@baylibre.com>
 <bed42cad-f7a3-4c1b-88b1-cfdf901dee81@gmail.com>
In-Reply-To: <bed42cad-f7a3-4c1b-88b1-cfdf901dee81@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 24 Mar 2026 09:46:18 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mffe963zy4vEH+TGvXS_iMUNPoan25_szUFfxvGcemEcg@mail.gmail.com>
X-Gm-Features: AaiRm53SjgpENHVooSGky9z4hkwiuaryMt5wB8szOUwhlz3O-IHZkVGR6omXM6Q
Message-ID: <CAMRc=Mffe963zy4vEH+TGvXS_iMUNPoan25_szUFfxvGcemEcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for free threading
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 09:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233779

On Mon, Mar 23, 2026 at 6:23=E2=80=AFPM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2026. 03. 23. 16:03 keltez=C3=A9ssel, Trevor Gamblin =C3=ADrta:
> >
> > On 2026-03-23 10:52, Zoltan Boszormenyi via lists.openembedded.org wrot=
e:
> >> 2026. 03. 23. 15:47 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> >>> On Mon, 23 Mar 2026 at 15:40, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@gmail.com> wrote:
> >>>> I also see other issues popping up, first in python3-installer-nativ=
e.
> >>>>
> >>>> Probably this setting ("python-freethreading") should be a
> >>>> DISTRO_FEATURE and then the python3 recipe would use that
> >>>> to enable its PACKAGECONFIG.
> >>>>
> >>>> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
> >>> In patch review it was suggested that we should actually have two
> >>> co-installable recipes, rather than an exclusive choice between.
> >>
> >> Which implies doubling every python3-* recipes, too.
> >
> > I think that should only be for python3 packages which actually have bi=
nary builds.
>
> Not just those. Script-only modules won't be found either
> by one build in the the other build's site-packages.
>

Am I getting this right: This is experimental, never worked and
actually shouldn't even be in openembedded-core master at all? I'm
trying to figure out if I'm wasting my time trying to make this work.

Bart

