Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86B0C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 14:10:49 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.11187.1740665448529504054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 06:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dY7BmSg0;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fb6c36ba25so9075507b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740665447; x=1741270247; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ts0YifBYbXeZ7IUnPDzDeJybV+0Zd4/by1kqf4rTYcQ=;
        b=dY7BmSg0Mc/2B7lXDSZxFCcC/k8ILdLwwk2AqN9RyDCm1BJE88H6TlTwBa0LgE6qZt
         ayGBLBrkAmeCRBQo+UQzbXY957rZGmSE6Qd5+JC0oKuWYjbDk58jV8gWKoy3PZVmHSr0
         TTBsR5goV58E0dKcr4uB0OI7SDQ7YIjSKMUFHitPW+C2Y6wa591PTG37L5oimtxzSOiJ
         ajhRcInxbFBzlp5RrVjd37XsU3u1wy+ZqzvdwNrsH/cEqb/GK0+bWya8OJilyL2Wc3Z/
         qVpOFWr3wj1WIGDStFk4W207lHgKfLmH5vImJ+4ZYpbsvzYrWmcG7yx+K3KqJN10SsyH
         HmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740665447; x=1741270247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ts0YifBYbXeZ7IUnPDzDeJybV+0Zd4/by1kqf4rTYcQ=;
        b=vhP6+lOsbJBYtyYCBrRYhsE6AXMsuVPqE5XfjxmHhfOVuSE8R9WK6OOWtT8ldNEj1b
         pTVJvOQZbtQ/SIk2FiMt8px7SgTLm9wcXmGYScsnipSPgRxKPNzHgxvb/xwaQwV6KdWV
         eiM/9fWFhX68Lz3dEJmwW5XIVkBcFVSdnBRc3RL3lv4SSkLSq3oRFv7V3LV+jinDFT+J
         vtew2s6y2BF7AOebOijVc5uuEy9CCqURwj7cPbsLt/m69+5VanP2OtsfrjmJ1e6+otD+
         Fw27uXpdO7jq/w/9Fv4Igg1N2WlxlO2lTqKUZ+19dt4Mm/Mx5eqbL1HY4rvs1XGsJWgH
         OzlA==
X-Gm-Message-State: AOJu0YytxlwJXZtqtEOTZQXfpMVj8f7wdyTpYpAFB1/Z3j7VAj4GXVKB
	8K7B4Ja0r94lgz2Vtt66E7NI3n41seZB4A0DOSqiig2VvVUiV6ptB4pGlBTBpUojL9bLjHdlWmM
	skdezS7OdHa6Wx+Gxp7BR9OecH1yRVHzi4xtryw==
X-Gm-Gg: ASbGncvMA8IjNDFLDab1xcqgOzv26GTRht9VlDchVlr/GS2KJmyODH3uXLsyCuvIImv
	2dB7Qkjbe44ax0ZHojnypUD0rZMubFZPzU+zB+5KF7rNkTbxqNF1UFZqSp3YiAwyVMdG52A1l7d
	IECYHBNjlUy6bZ79YV3MZus0b2z7SIRbJb2/2AIH4=
X-Google-Smtp-Source: AGHT+IHvF0hWUBvlgarRqokA4lISm9cPbGXw5s6vBGbrVUf2C7BxpRYuLv3P31DWmjvnPUxPbMWTWUE3ldujxrT7/jU=
X-Received: by 2002:a05:690c:6482:b0:6f9:c8d9:50f with SMTP id
 00721157ae682-6fd3946afaamr45304687b3.2.1740665447489; Thu, 27 Feb 2025
 06:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20250212173847.9923-1-peter.marko@siemens.com> <AS1PR10MB5697596B020A14AC2754EC7EFDCD2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697596B020A14AC2754EC7EFDCD2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Feb 2025 06:10:35 -0800
X-Gm-Features: AQ5f1JqXsq9T-fYMaf0PL21D76yOvz_XFszFzi5T1Y5NKOpFD0iui1yBkaMpAAM
Message-ID: <CAOSpxdaxvEkKZ6hvB6b+kxA8BQPLquEHKsefVuAbqM7gO+nqwA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][styhead][PATCH] subversion: ignore CVE-2024-45720
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 14:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212011

Thanks for the reminder.

When you put more than one branch target in a patch submission it
greatly increases the odds of something going awry since I can't
easily track status in patchworks.

The process goes much more smoothly if you send a per branch
submission, that way you aren't relying on my poor memory to make sure
the right thing happens :-)

Steve

On Wed, Feb 26, 2025 at 11:54=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.=
com> wrote:
>
> gentle ping for styhead...
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Wednesday, February 12, 2025 18:39
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [OE-core][scarthgap][styhead][PATCH] subversion: ignore CVE-20=
24-
> > 45720
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720
> >
> > This CVE is relevant only for subversion running on Windows.
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-devtools/subversion/subversion_1.14.3.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/subversion/subversion_1.14.3.bb b/me=
ta/recipes-
> > devtools/subversion/subversion_1.14.3.bb
> > index 1ef3d498a5..679228cbb8 100644
> > --- a/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> > +++ b/meta/recipes-devtools/subversion/subversion_1.14.3.bb
> > @@ -19,6 +19,8 @@ inherit autotools pkgconfig gettext python3native
> >
> >  CVE_PRODUCT =3D "apache:subversion"
> >
> > +CVE_STATUS[CVE-2024-45720] =3D "not-applicable-platform: Issue only ap=
plies on
> > Windows"
> > +
> >  PACKAGECONFIG ?=3D ""
> >
> >  PACKAGECONFIG[boost] =3D "--with-boost=3D${RECIPE_SYSROOT}${exec_prefi=
x},--
> > without-boost,boost"

