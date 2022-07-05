Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B6DC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 08:56:17 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.81806.1657011367296855097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hZ0JgRY9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id q9so16525225wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 01:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GdzT0rXGY1hN2pKSTfzV9AukRUtnmLnXJLXxxQ2dM0Q=;
        b=hZ0JgRY9hl/z8H//QEyG+v8orfvTjey+8jvH9PGXU06HlW9xaAH/9Xtp4d3dUEALQ6
         ttjNGVG48kiqxCfjZIMnZecxmmbaah9FaRPRb/A54YT960u17FLhCvdADai/JlXghnbu
         wEy/CoXnrFHJ6DH1oYHZ9ZF5p4WlDvgp1yIaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GdzT0rXGY1hN2pKSTfzV9AukRUtnmLnXJLXxxQ2dM0Q=;
        b=kzlCtYtG/esrOX7hc1xW0kKnIusCnRPuOtkHuqarb4I5BAA0aafok+oqsRu8Ru7T33
         PSLn7JbZL+OBy269tWoqIQaGSa6qhAGlJk01pXjXVDYQ3XD7om6Q7ywE3v63cCvUe3mD
         DmGcXMAuombRVRPxUlOaPW1d1brx7y204Q9ex5EZ0lTujkl3jEVLw07r7YjMkkUlq4d+
         kYjL1mqkJagCvpjCocIzSKk9p7ZiaARVd0zv3TQeocQ3pxNKdkO06xwOgPqKs9pTFGCM
         RBG0opPFVmZP4iVmc0Hu4VT4o9EqiPc4yrh27wNMxOtxFiRVtyTdJEX9Uiz/2obJgJig
         J2HQ==
X-Gm-Message-State: AJIora+XkMdFs+IjHU8rJRCOU4eG/mBPI+cC1Y69S5x708F3fB7Tply3
	7/i2stEdQqYinesV9p6rf86yqw==
X-Google-Smtp-Source: 
 AGRyM1unnuglT4foummJ427lqB9EKkN1F2etepX9m6JviZ4UHSyNYjigq6cDKBxubjjBHp5Kk0YX6g==
X-Received: by 2002:a5d:64ec:0:b0:21b:aa79:623e with SMTP id
 g12-20020a5d64ec000000b0021baa79623emr32380229wri.710.1657011365869;
        Tue, 05 Jul 2022 01:56:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8?
 ([2001:8b0:aba:5f3c:7dad:6fff:75bd:1ad8])
        by smtp.gmail.com with ESMTPSA id
 m123-20020a1ca381000000b003942a244f47sm19620984wme.32.2022.07.05.01.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 01:56:05 -0700 (PDT)
Message-ID: 
 <2f419565e69455c68abb362c666c0bb19935c197.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>, Adrian Freihofer
	 <adrian.freihofer@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 05 Jul 2022 09:56:04 +0100
In-Reply-To: 
 <CANNYZj93XZ8UxBzUfPBbu093_kY8B7OyGDm_PCNkbdmb+aRpfw@mail.gmail.com>
References: <20220701192449.1358325-1-alex@linutronix.de>
	 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
	 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
	 <16FEE1E2A731461A.2437@lists.openembedded.org>
	 <CANNYZj93XZ8UxBzUfPBbu093_kY8B7OyGDm_PCNkbdmb+aRpfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 08:56:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167644

On Tue, 2022-07-05 at 10:39 +0200, Alexander Kanavin wrote:
> On Tue, 5 Jul 2022 at 10:34, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > At this point, I have to remind everyone about our harsh reality.
> > Which is having lots of core pieces without maintainers:
> > https://git.yoctoproject.org/poky/tree/MAINTAINERS.md#n45
> >=20
> > Let's focus on adding foundational pieces of layer and configuration
> > management in a controlled, testable and tested manner for now. Which
> > is what I am trying to do. I think discussing grandiose designs for
> > things that try to please everybody is just a bit premature, honestly.
>=20
> And let me just go ahead and say it, and I understand this may be
> upsetting. I'd rather try really hard to completely avoid the
> standalone setup tool.

I've been trying that for years, it is looking like it is no longer an
option as if we don't do something, I think the project will suffer
more damage than a tool would do.

>  That tool, and the way it's just been described
> sounds like an invitation to compatibility issues between various tool
> versions and the metadata and backends (kas alone has more than 12
> config format versions and requires to specify the version
> explicitly?) coming from all kinds of places, maintainability issues
> (we are already pressed to the limit with many pieces getting no
> maintenance), leaky abstractions, not quite covering all of the ways
> people want to use it with their existing setups, and overall greatly
> increased complexity in a project that is already notorious for it.

In defence of the tool idea, we do have some experience of what
compatibility looks like through the autobuilder. There are a lot of
parallels in what it does and how it does it to what we need in that
standalone tool. Yes, there are differences needed but there is a
decent chunk of experience which can be used to hopefully largely avoid
those compatibility issues.

> I'd rather avoid repeating the story with devtool, which is both more
> complex and has less use than what we'd hope for - and has no
> maintainer.

I don't think the setup tool should impact devtool, those are two
different components which should be orthogonal to each other. Yes,
there is impact on the eSDK but I'd hope in general that would be a
simplification of the existing setup code.

Cheers,

Richard



