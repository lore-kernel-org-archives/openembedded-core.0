Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205B7C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:31:26 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.1233.1742315481507085100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g86o01/H;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fb83e137so47902226d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742315480; x=1742920280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eCllkZcNfrC5wS7OT3Fk35ND/3M1dJ8pcqiLuHO1k9I=;
        b=g86o01/Hm9G6hYIFaNdu422gHXJTgAxZZZBx0Ciibao0/5yjCP1zR1q8O1CTHy8EFA
         gfS4jR8i2wHXZ3YKy7hg7QA0cUIsrW6BA6IAazs3Ip0rCMXF2AaWFupaTPgECVrArE6v
         UWbxXL1Hhq8E9fhinZ4R7orntk8zQ5g1Ov6iUhlev29jQiR0rijpQMkeVVGzGDjp/Gmh
         rRMcVVSWCUTMDTF3inRSchwWQ13ltgRf1jFzQSCrxh+czyu2SZqR/oWPl8vXqbqc6+Ss
         HoVgdbuxzyp2XJ13yWTk57Jeb/If5/Zj3vBSpaa7pHKQpR+0FFlpDBwyOticK7BI2DON
         G/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315480; x=1742920280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eCllkZcNfrC5wS7OT3Fk35ND/3M1dJ8pcqiLuHO1k9I=;
        b=Q1wpt7VpvQBiZzjf1W2eR1tC0fS0HlOqavnGCmGKp5EX92xFxf6+LhePIcax4su0oG
         iehEb8E88WCOLBIx2E9VHLWpA8rnwahHYP1i3zLbKlJDtSRmERjRMI1UxioqUtFY8z6X
         oKwMUkU9KELrGywvICc2IvpU2DXBAYU1MYOtsbjPk9gGAQN+5aAwxTQOL46rRM4wnKG1
         hkPpkYcne4cx8gO48wvMecjd+57XoZQeoOgisxWFWf9GoU4MN6+sGArqKQys/9MC2275
         5zBbe6KvWGVELwFieMLUDRLPyiJfoVfprIYtl5/2nNOWMVLPgKb0SgImWBofc11v593+
         CEkw==
X-Forwarded-Encrypted: i=1; AJvYcCXZrPKqqmVuEUC8ntTalMASeQkMY7HNYyNWoOuVflCWVehiVbBy9Ykzqh28Lgd0pv8b5S8DU9HFcFA3c5BfTnFOcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxy+Llo6TuyYnEi2zkCI9pEUXkZl/xBvjr87U/Hh4iQ+fX8ydIp
	ynsymzolZpNndvX2FMD0OBlKClXdecrlg6T3r/ymsuAlb5tihBOP7lkjQJflN3p//wLZAH5mkwq
	DbgQ135SFzLmU9/Ay4UyhoJNWK8s=
X-Gm-Gg: ASbGncvjFHQ9fap2eBJI6cGYYG/nuhnmIOzD2GzdJXgudpJKYDt5JPF027bacjgUHxL
	RPq/D4J3VcYdLsTXxsGWDP5M66bX3clKyCGVOZhMnFHJ5NdQNBHti5WLjH75JHHerxzC+AeDNDo
	fo/x0YxrwNXvjVurzKan4EQPiatwFjobLvl1nv91XtTcyzbCmS7HiioVoACeqN
X-Google-Smtp-Source: AGHT+IE8JDM95ZvDk5NObyk4/QGv2dGaGD0gvJJdeTPzP7bQ/QDGaL+p/AkJP4bv29J7VZ0LltHtwdtoxz9hoVpSbYQ=
X-Received: by 2002:ad4:5dca:0:b0:6e8:f4c6:6813 with SMTP id
 6a1803df08f44-6eb1b83f886mr58568306d6.13.1742315480535; Tue, 18 Mar 2025
 09:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-5-raj.khem@gmail.com>
 <CANNYZj-_OsiNMuYvm8iVDvKrvcnGujFqN9_in_cB9qj-gdqVBg@mail.gmail.com>
 <CAMKF1sq=tF+-=ReffePVyaSY40DZNytGbbUOmyjSkOHox7FQUw@mail.gmail.com> <182DF220561FBBD8.16918@lists.openembedded.org>
In-Reply-To: <182DF220561FBBD8.16918@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Mar 2025 17:31:08 +0100
X-Gm-Features: AQ5f1Jqqi9dkm4dzvtTzrrW3p_RfwGyVKxuZFQL49JDdernfKx8JIrAd11bevok
Message-ID: <CANNYZj8xP5jOPBGZczyOgt9R77zGoUChVTB3Y7nDKbtudN2ORA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] ncurses: Upgrade to v6_5_20250315
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213223

On Tue, 18 Mar 2025 at 17:20, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 18 Mar 2025 at 17:08, Khem Raj <raj.khem@gmail.com> wrote:
> > > I know we had them in the past, but ncurses' YYYYMMDD are all random
> > > development snapshots, and I wouldn't want to update to them. Is it
> > > possible to cherry-pick needed fixes?
> >
> > Fedora is using these releases as well, so I am hoping that it is sane.
>
> Fedora is wrong too. They're *not* releases. I have to put my foot
> down here Khem:
>
> https://github.com/ThomasDickey/ncurses-snapshots/blob/master/NEWS

That said, upstream doesn't seem to be doing proper commits: they just
roll up any changes into those weekly snapshots:
https://github.com/ThomasDickey/ncurses-snapshots/commits/master/

 I'd still hope you can find the snapshot commit where the gcc15 fixes
are, and extract just the needed pieces from it.

Alex

