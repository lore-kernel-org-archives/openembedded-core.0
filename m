Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61A4C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 12:02:45 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.21962.1704456158215923030
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 04:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZxO54dzi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cd0f4f306fso17991341fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 04:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704456156; x=1705060956; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HeODbCxIWQVAczIZqYDk8r7J/xCTq2CThdj0c3jGnWM=;
        b=ZxO54dziodca05/WdHgVDjDbaJXcUlcDj+XCpSQuAe2L2io1vtEKlIk8cwTwXBMV9/
         HzaN8/M+zZtJ4gMwspOF+AnNkWA0h1B8/vto5/xrH5SvFS5fMn6FepcsdwRCiiUBjwdH
         3nF39ofex0281K8o23hfNwTPcg1cIpLXSK1po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704456156; x=1705060956;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HeODbCxIWQVAczIZqYDk8r7J/xCTq2CThdj0c3jGnWM=;
        b=qOHOboDaTnNrbZUudzZ4K7yfDcbEEjaFoMoYDkNXXyt8HmswqceWkFPgh5sf6DQiFM
         vGbnEcGb4U5B7cQL0pN/+eIGP5xwYNBFHNF4inn5ATCPRR9o6bgtdqAZOfetHdAbvhc1
         GcUlQBBtlGTggFvVu9AvyhKbDs1ieG4hzZSTMqbQJqn//r2snj2iN1I9cRLyZLU9Mg61
         WDwrh85EL5IAF7r8DT1XIcsiGQC8VhKDJhwTTkdWieDryXFvfmmC7rojJg7DtTfc9lrN
         ESB3itY4xtqRdXduYr39Nm3/D7+VlOvFf08WhjzKVIUGMxAERxkuKBdVsZlxVosc4gPF
         w6WQ==
X-Gm-Message-State: AOJu0YzwTN5XlNkucRBisXiqH6zMm92MEty66JdEUsk2vLeG+wBnrex6
	2qsnPqbgfrEV4/8bQfSF8jjkjrIiZtOnHg==
X-Google-Smtp-Source: AGHT+IHQT6TORs5Oua0NI7EL2xOyQlny3Kt06AMVmel3+xD5C6RHALkcnh8nq13Fjgv17Lpxrt4Rmw==
X-Received: by 2002:a2e:9b55:0:b0:2cd:1ece:e266 with SMTP id o21-20020a2e9b55000000b002cd1ecee266mr912264ljj.36.1704456156234;
        Fri, 05 Jan 2024 04:02:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8000:8a34:98ad:54c2? ([2001:8b0:aba:5f3c:8000:8a34:98ad:54c2])
        by smtp.gmail.com with ESMTPSA id d10-20020a05651c01ca00b002cd0ff0ada5sm289172ljn.94.2024.01.05.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 04:02:35 -0800 (PST)
Message-ID: <8448a0253f31a705f7baf167519167d95c8b05bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/7] sstatesig/find_siginfo: unify a
 disjointed API
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 05 Jan 2024 12:02:34 +0000
In-Reply-To: <CANNYZj-px=OXTm0x2D3sJVJxHx8c_wqMXwHeO0Ex1B-829bUpw@mail.gmail.com>
References: <20231218084403.599015-1-alex@linutronix.de>
	 <20231218084403.599015-3-alex@linutronix.de>
	 <c35a799d9843214d220362c0a190129e2299b93e.camel@linuxfoundation.org>
	 <CANNYZj-px=OXTm0x2D3sJVJxHx8c_wqMXwHeO0Ex1B-829bUpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 12:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193354

On Fri, 2024-01-05 at 12:42 +0100, Alexander Kanavin wrote:
> On Fri, 5 Jan 2024 at 12:22, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > I've a few ideas on how we might be able to detect potential problems,
> > I'll continue to try and work something out but I want to make it clear
> > there are some things it is hard to change :/.
>=20
> There's the option of adding another function (find_siginfo_v2) and
> leaving this one as it was, this is how the kernel does things. They
> don't shy away from adding v3, v4 and so on either. But I thought less
> code is better than more code.

That is effectively what I just merged, except I did break
compatibility by dropping the v1. We need to give the user good
messages about how to fix their problem which is why a number is needed
rather than just a function name.

Cheers,

Richard

