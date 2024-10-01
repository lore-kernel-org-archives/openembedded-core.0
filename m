Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B709BCE7CFF
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:38:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.77430.1727775485715748146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ic5xnelg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso42441125e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1727775484; x=1728380284; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j9JCzgj9PES3c8IsEq7KgCdx2oUoXSnuAIYH3B64Yq0=;
        b=Ic5xnelgmNifYarcXnYbSh6LdhNit3zJr7WeUw4veM1OGNsiL5nAqvMVZKz+MNbmIq
         JTjAuq1DSxfOx6yfnO118u6u82bMlXDocHoDsTzO3UWdoicUY+FEvkaD/96vcsOTkWGe
         Qn5oT4qNmSyEoD64fM9uDIOu1evTPB/jo8iKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775484; x=1728380284;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9JCzgj9PES3c8IsEq7KgCdx2oUoXSnuAIYH3B64Yq0=;
        b=a5uubQAEYbDfH8Mz0qCTR9JL63Dla2VL3Xdg3cSkgqGXejd50esghBY7rmuEof+vu4
         JgcEx12hQrfZjuYpajKebV4j66eekvKYR2t7+BDtqR18k75lIB8p6s1FaDwlwS8lHWS4
         cUr0kRynELWASGkGe42LxF0yaMcQ8cvvYglCT6wm/vpE0uGFBIrQJErcU5XVhuSqeIQm
         2WpP2hoo/4GeDt+Ahu9CRoSlJme22rQR37VBVerEgoQJMkA5RwqymjX6pjtHh1MHQ98l
         ZKJizcYfEMYjLgSyRthUppfnQ1YyTQq8DtV+C62hHDeRsJNcN3w8ldp2zKL+OwUSB9VT
         uiHg==
X-Gm-Message-State: AOJu0Yz6/ycRoslngAZaOPBOD5XjCi/sNzy2iiys4TFJ93Egyn/+rJwS
	51WLnSqKSQPcU21YWWf6fIoCBgDELPU547e8tU2FjkTKe7OIGwwSV6/xFBiC2LE=
X-Google-Smtp-Source: AGHT+IERb0V0Fk1XfeQFe9f8UUHMFvErrkR+f6x8dBsx1lnjNWsLrNfu8zAhcTTK7IMgI0y4ICBK1g==
X-Received: by 2002:a05:600c:1d8d:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-42f584982femr109147765e9.30.1727775483879;
        Tue, 01 Oct 2024 02:38:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d? ([2001:8b0:aba:5f3c:85a4:e3cc:bdf8:640d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a56fd1sm172590935e9.48.2024.10.01.02.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 02:38:03 -0700 (PDT)
Message-ID: <0e31030d839492e72dbbd06506e8d279fa8f0284.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] reproducibility: continue testing in case of
 build failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal
	 <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 01 Oct 2024 10:38:02 +0100
In-Reply-To: <CANNYZj8gk8W-dB2SEq+pJN0vxXkOR2KsH0AiLROK5FKxAi43YA@mail.gmail.com>
References: <20240930091015.21148-1-yoann.congal@smile.fr>
	 <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
	 <f6f743c9-89ea-4831-a03c-7b88fa403489@smile.fr>
	 <CANNYZj8gk8W-dB2SEq+pJN0vxXkOR2KsH0AiLROK5FKxAi43YA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205151

On Tue, 2024-10-01 at 11:36 +0200, Alexander Kanavin wrote:
> On Mon, 30 Sept 2024 at 16:49, Yoann Congal <yoann.congal@smile.fr>
> wrote:
> > The problem I'm trying to solve here is the reproducibility of
> > meta-openembedded. While oe-core world is always buildable, this
> > is, sadly, not the case for meta-openembedded layers. In order to
> > move forward with its reproducibility, we need to know the
> > reproducibility state of as much packages as possible.
> >=20
> > Do you think that goal is worth making the code more complex? Do
> > you have a suggestion on how to approach this? Making (and keeping)
> > meta-oe build every time is the goal, but history shows that it is
> > hard [0].
> > [0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155
>=20
> The real problem is that meta-oe isn't built in lockstep with oe-core
> changes, and regressions slip in all the time, and are fixed after
> the
> fact through heroic efforts of Khem and others.
>=20
> Maybe the new AB setup will allow including meta-oe builds into a-
> full?

That pushes the problem to me and the core maintainers as we then have
to block until meta-oe is fixed as well with all the tracking and push
back on patches that involves. Is that really what we want to do?

Cheers,

Richard

