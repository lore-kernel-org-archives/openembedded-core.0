Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68242C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 11:54:48 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.170233.1719316479304422000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 04:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R6p1WtxU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-363826fbcdeso3992263f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719316478; x=1719921278; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I2Ki+BAQ3mPHwJgIlX6zCB8NRqQ+uzTadibX6Pey2bs=;
        b=R6p1WtxU+nN6S9NXABxtLBVF2lFt25knrJqcLpkGKwFD0gqMrqCqYEiTxwRRaALOzG
         PFBK5IEzv8yrt7ht+rNxgajBk0UZRPs9u26pXQwdj2YYPwFBmLNKbz5grjIGSJRAEJM7
         UtrVW1X4BdYRaDm03AO6miiMb6HHYN4kHG6/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719316478; x=1719921278;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2Ki+BAQ3mPHwJgIlX6zCB8NRqQ+uzTadibX6Pey2bs=;
        b=qfViddjj7xyOpLMw3D8eh0ALG/WWdjBJp4fvYch0lTx5sXg42FdKdg9+FQP3eQcThR
         WnxSOW3bqf/uUnPqL3vKLGvqWVcbne1bSOy0teETHMU1Fb4OH/Oy0cJXTQQkaJvWEggK
         52XQ5VVnj3ad0+GjHIiqTy/iW42chsjt9nAnY7s9/fLTpx9UY87ZlwBJqY0ptjKGIAyw
         YHJj5AjpavQ96OdPRKdLAlGCzk2MizckWJUMtcnhH/7cRLy/dB/Ggj4AFQm/eqZ/MGL/
         mKHz1bJX8+SmI57e7KrrToPgVkZPP/hxWRYEW8T6WRR8F+Dd3GgQjIOrmuMNWKvQZad5
         WE+Q==
X-Gm-Message-State: AOJu0YzbfyEvsQhAtF1VJpO0dE/Rn7upxaLY0UhC26rSsGUS2x+F2rZR
	4MyUEoiiidnYBrtd0Rd5NY1tNoB120HbFyBCAguB3noqIYfAqxRma55A5oiR1yM=
X-Google-Smtp-Source: AGHT+IHYc02Tr02TgeKhbUy1LiWRzg96UyGavtgse6eRpXR36x7R2ENJEzcvEnNhNaVyPZhmAfC9yA==
X-Received: by 2002:adf:e643:0:b0:364:d5af:3460 with SMTP id ffacd0b85a97d-366e7a51ba9mr4577237f8f.61.1719316477594;
        Tue, 25 Jun 2024 04:54:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e? ([2001:8b0:aba:5f3c:981e:2f9c:5cce:4b1e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8922sm12725365f8f.28.2024.06.25.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 04:54:37 -0700 (PDT)
Message-ID: <3bd89c381318290050137e1ab5f65bd25f94ec83.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add
 RECIPE_UPGRADE_FINISH_EXTRA_TASKS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 25 Jun 2024 12:54:36 +0100
In-Reply-To: <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
	 <20240621103414.2842509-2-alex.kanavin@gmail.com>
	 <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
	 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
	 <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
	 <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201131

On Tue, 2024-06-25 at 13:34 +0200, Alexander Kanavin wrote:
> On Tue, 25 Jun 2024 at 13:06, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > I don't think we even need to list the recipes like this. When
> > devtool
> > upgrade runs, we get a list of files which change. We can then
> > query
> > bitbake with that list of changed files and ask "which recipes also
> > depend on these?".
>=20
> Right. Can you give me a lead on how this can be obtained? (e.g.
> where
> is the data structure it's in, or a function that returns it)

In tinfoil you can see the code in
TinfoilCookerAdapter/TinfoilRecipeCacheAdapter i.e.:

self.recipecaches[mc].inherits

i.e. the result of:

attrvalue =3D self.tinfoil.run_command('getRecipeInherits', self.mc) or {}

I appreciate it calls this "inherits" but this is actually a list of
any file included by the base recipe so any bbclass, .bb, or .inc file
that was included should be listed here. The True/False associated with
it is whether the file existed or not so that if it changed, we know to
reparse.

Cheers,

Richard


