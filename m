Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AA6C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:25:22 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.3415.1737141915915207314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 11:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JhqXDzRh;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29fc424237bso1961324fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 11:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737141915; x=1737746715; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbYrTQg6uhkwlM5ysmyaygplQK/kzShg+HRH60Tcr/E=;
        b=JhqXDzRhJ3lp+mMGGY8giOXzrF4UFZcILtkr0AD7qV/+Vk23q3TzIV3CeeIgVAn90O
         lUdi9Oacs52igK/Q/7IxgA/ux8aI9Mx2jhIa/Tm1vkmOwthFFG2i/uOpy7Uqog2Ze9AY
         2Tik+KUevfVClx1CjQwNnfKJIdf1JDCrnBm4Omr6H5zuRYcCktjk6g7kgzLJiylV63CT
         3y7CpDqtm6vjNNpYSwab7JSGzuczhXK4C0B5zhpkaSUTste8z6ft6nYQWEkhmyr1pFrq
         iW6Cp+syHchr4EfPtCeZiud/46C3H1yE3ufN/aAlpu5r1rg3Zn+aoKGg/waxhmIc0uMi
         O2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141915; x=1737746715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbYrTQg6uhkwlM5ysmyaygplQK/kzShg+HRH60Tcr/E=;
        b=JTcmcoT2N+VqJg+JeKVt+wjJ5nAO74ecF/wAqT37OmN7VUCPEwzxYDVvI44LzJ+34R
         iCyBO7UgbUqHUJQ+M6NadLGICg7QsENlspDXgRNPBqOhcXb/rY8NSpDqE8wFEy2rz7sE
         bWtTWOGGR25sdixzENihALuWDsTHHZUISnEnvg97vR14ftgDWGdzSTWF5vN3rmrwb2U0
         qODW/vEIA1TkzGv1gLLoMQtJlmM1jTPpbfenblXyf/XhiM/5IMRscqVK4ApZtX7wUGuY
         y8Yx04DhIkBFtGegaN48cco+OGeqTMPqH/+wGBElEltAjL9x+6fN+vFX7T7fOfF4I4sH
         my/g==
X-Forwarded-Encrypted: i=1; AJvYcCXU4kls2sCMbiTQlosReu4TNCOBEAzOkXUFGU8/4yU7zDRGGUwGDDPcdqY1kBKX2gG6/YR8sBQCThu+9ExNYWks3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx0XkWrkPsI/gOnPsueFrfQyRzrM5+GBdbLn6+qSPRzPb+XAhnD
	dOO4ANYMh5wSbxyf5859G+7p+G5UlG396JDb4CLh2Tob3zISx9oo71JUfU5Bcqudf4LopVWKyBZ
	yai+Vsd4UiEaFiRC6VlX8oCCWoMY=
X-Gm-Gg: ASbGnctlrm+IOMqdR8t20j1/g98JYgBleHLbnb+S1OWsLhWFg9Ixm/TvgTKu8tDQ1zx
	9urT0tKooZvMUhCdXrYklE/GmTLjHvY8Uckhh4Q==
X-Google-Smtp-Source: AGHT+IEsU+vyQ3hCR3dROrkat4Wdmuvl5iJWZn/WdXj+9LWQORJCXoRarZP5uPC2VXlBct6oBItm5nXjTjtauss7QHU=
X-Received: by 2002:a05:6871:538e:b0:29e:5894:9de7 with SMTP id
 586e51a60fabf-2b1c0cd8350mr2381243fac.33.1737141915121; Fri, 17 Jan 2025
 11:25:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1736150475.git.liezhi.yang@windriver.com>
 <b6a3ea4a7a3c811d7f3f9fa74e11d5001321ecb1.1736150475.git.liezhi.yang@windriver.com>
 <CAMKF1soHePWfU3Vf5614+rW2iCLKmfmXwqFhh+genW++s_JcYg@mail.gmail.com> <A08654A9-D6FE-4BAA-9181-2EC9CE497D61@arm.com>
In-Reply-To: <A08654A9-D6FE-4BAA-9181-2EC9CE497D61@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Jan 2025 11:24:49 -0800
X-Gm-Features: AbW1kvaw7W0wCJL0n9fx94N_gtOHTltR1nadddXseMut_HzPpMB7TmQN-Wb09Dk
Message-ID: <CAMKF1sr0zrrF3hgVT0faFJXx6MOWk=aTiNYms0LXX0s85qmzSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] fmt: 11.0.2 -> 11.1.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 19:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209997

On Fri, Jan 17, 2025 at 7:46=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 9 Jan 2025, at 18:35, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> >
> > I know this patch is applied but I still want to bring it to attention
> > Many packages in other layers depend on fmt.  fmt's APIs are not or
> > not used in a very backward compatible way
> > some packages provide an option to use vendored version of fmt so in
> > case of system fmt being not compatible is not
> > a huge issue other than duplication, but some packages e.g. gerbera
> > rely on system provided fmt and it still has not moved to
> > 11.1
>
> If fmt has basically no API stability, should we just have fmt10, fmt11 e=
tc recipes instead?
>

maybe, although that also means that multiple versions are made to coexist.

> The -dev packages for each of those will conflict as they don=E2=80=99t v=
ersion the headers, but at least the library packages could be parallel ins=
talled.
>

exactly. I have seen that most packages have it vendored and it's used
statically.
Sometimes OE-core updates versions of such packages, before rest of
distributions have picked it up. It means the burden of porting
the dependent packages falls on us too and we may not have enough
folks doing this sort of unplanned work.
For meta-openembedded I have decided to add SKIP_RECIPE to recipes
failing with such porting issues,  until world builds become clean,
sometimes it means disabling a lot of recipes but I expect folks who
use them will fix them in due course.

> Ross

