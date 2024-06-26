Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1A3C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:26:00 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.26479.1719408351021177939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 06:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dli+PB30;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42249a4f9e4so49542645e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719408349; x=1720013149; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xwbHpWNio9o1UXaAB5GRoEus9fTX3sJB55j3duHOWGk=;
        b=Dli+PB30RuQHceDCbldxdCrUVv559PEzIUnC6O0+3JW2nGq92bJeTyYKpwkwhS3Ll9
         O8KjEHUAeJNHydz6PDNpSEFcGoKfd6pL4w0pIxKza2gvOE0w86Lq7xbHbkCM2W9p/Jtf
         d8PDGhx458MhlVupFn/eRMg2+KqQXiheKOPNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719408349; x=1720013149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xwbHpWNio9o1UXaAB5GRoEus9fTX3sJB55j3duHOWGk=;
        b=sd9MUS92eU+xwe4AFHZOQoMjSG+DNeaHMaqcy6bMrRwUpwxX8DvuEB9nVYwZWm2Tv7
         eQ7lFoZzG3FAyemzJDr9IobpZm+uRW8bBLX2TUoZqhbPHVbFyJkDJ5BqwMr9rJeREPl3
         l5m4vutUlaWzHLkFyCQoiHbUGRT9jovFvHkCB+waotfG5Y/p8DmwElRLfC3s3a/AO5PQ
         Mu8fY7BvcU+gI32El0Ho2T7h8EUta4T/R7eOD7foDtRzUdlQOEKc3hwQtA4g7zmJBuXu
         FZWmrlgwfqTxMU5IdCITVsB5rrB+jYihrN8krTdgSfalseolo+G+o5jBB64HRUwixsHX
         Yr2g==
X-Gm-Message-State: AOJu0YzWtDP5hPvCiLOAyNCcAlWGb2PC47gtyjkw7NKg8kQtqIWfaE2s
	ocFkcvyNjHx0yyWmvSPQALnlHJ37/yXT4xvq2GLHS4i37P9Bs/Z6jxP7zrWlIqY=
X-Google-Smtp-Source: AGHT+IH4El5/zrB4/WUy5zr7tXSiEfjphWJGk7idVBuTM+8lELyo/ZmwDQg895rofnseSjQcy/PCMQ==
X-Received: by 2002:a05:600c:54e1:b0:424:9024:d45d with SMTP id 5b1f17b1804b1-4249024d490mr69322835e9.25.1719408349385;
        Wed, 26 Jun 2024 06:25:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e301:b0b7:be9:7182? ([2001:8b0:aba:5f3c:e301:b0b7:be9:7182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424bb91c9d3sm26678905e9.0.2024.06.26.06.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:25:48 -0700 (PDT)
Message-ID: <974d7f3b4059405d8be05ecaa16a9b48ba48ed9f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add Requires.private field
 in package_do_pkgconfig()
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2024 14:25:48 +0100
In-Reply-To: <17DC8E5BBBC3262C.8385@lists.openembedded.org>
References: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
	 <77c5ad08b533613dbc8d57fdf565d53a373160d2.camel@linuxfoundation.org>
	 <CAFt4JuG1QWoyoi0gja4hNVb9NYeiGo=DQ2_a=ijz1XUZK6regA@mail.gmail.com>
	 <17DC8E5BBBC3262C.8385@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 13:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201162

On Wed, 2024-06-26 at 13:41 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2024-06-26 at 10:07 +0100, Sreejith Ravi wrote:
> > No, static libraries were not enabled. I am using only the -dev
> > IPK,
> > which has only the shared libraries. With this change, it is
> > successfully building. Also, if it links to the static library, it
> > will fail as I am not installing the static IPK.
> >=20
> > In the latest pkgconf commit, it looks like Requires.private is
> > needed for header inclusion also:
> > https://github.com/pkgconf/pkgconf/commit/2d26db3a984e7a69cedc6274c2211=
9de4bcf1b40
>=20
> We standardised on and use pkgconfig which does say Requires.private
> is
> for static linking.
>=20
> If pkg-conf wants to change the "standard" I really wish they'd use a
> different file extension so we didn't have two incompatible
> implementations :(
>=20
> I'm reluctant to try and mix both tools since they behave differently
> and one form will end up being broken.
>=20
> We should mention to them this change of behaviour makes the
> compatibility situation worse.

I did more investigation on this one including looking at the pkg-
config guide from freedesktop:

https://people.freedesktop.org/~dbn/pkg-config-guide.html

I suspect you're probably right that this is needed for headers usage.
It is worth noting that change is just fixing documentation=C2=A0so this
could well have been the case for a long time. It all is a bit unclear
but we should probably take the patch assuming it passes testing.

Cheers,

Richard

