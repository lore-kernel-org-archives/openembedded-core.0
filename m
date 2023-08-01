Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5549CEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:41:39 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.8871.1690882892023373419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Dem7V3/C;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso82204231fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690882890; x=1691487690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OJ7mgOpWmhG+kQsW7Ff3cNz0FsRUpRW4XZbDmgaPOc=;
        b=Dem7V3/CX7HxUwHi6Vlo1HdIC4dV0rGmg99NWJTUa/h2CPUiBACB/c5uK2SPABHK2e
         jrH0DfJb+wM8V+2sub8zhymzTQaRojZSHQ9i5kXVOy0PePajQdftxvdq7A5Gp8TXTZ2j
         t+plveYro4Sbb6pBdSBhcxopUvgtZwqadLwzFUy5obulE2tetW3jDYRJEfK3Q6yVwEA3
         kS0hyN6Q0eP7gFGjh9ENQqKbKGxDCFtmcaOBp/EOgGnWBFvqHcrSHr8mzkrzHbMxEjkT
         Jcvx2hrf+YiHriaX092L6Z0HYS5tNQ4kJ2tUWwUOICiwbZr5ZKGkWSCjRPqSnXFUYsRQ
         uQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882890; x=1691487690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OJ7mgOpWmhG+kQsW7Ff3cNz0FsRUpRW4XZbDmgaPOc=;
        b=Sw7rQ41kMzD/bnZRQz7RpYzg0iIkt87c22u5TEE7QnWWqdxTXPLWF8+rke6ohQW9AJ
         pDx+OvHYgGlHHkeeVq5bmqVUWvRGOSIetsi5+PV7ujuuKJ6ljng4GBlP4nZhb2NWhsxY
         RF7ABbqnevTBA6CPH1SFjpTJNOqEoKFp83J8pzWQR1MVlKiWEXKQUePQ9/WRVb+aehGo
         e/Dc2LRj2fd+qtYZwHrM1UD5GfB2+EGy9TNVn8WpQIXwogoeCxT5LQHsy0VowQO5II+L
         Jg33E5K66l8HXRtg6GBCZZTA4vDMFNqngJ1Pr/X1OHYc+I4+18FOINkF+cecUj1Gh+fS
         Nd1A==
X-Gm-Message-State: ABy/qLbqyJ9eCGu+/IdozqchWtHVSeY+eRAbM7xJd6n8pmBO+/7WPzO0
	TPNEoqVBB5WEnK9NB6FM+tSJhiiEBBB5V7GOkHc=
X-Google-Smtp-Source: APBJJlEXOdE7GgtZZc62q9xVqLOoKKq2i73HniZ2/f241MUeFBbmauzibrjN7RZq1qyWAfT/MS917iValOg2nuTmMNQ=
X-Received: by 2002:a2e:8193:0:b0:2b6:c8e8:915f with SMTP id
 e19-20020a2e8193000000b002b6c8e8915fmr2270624ljg.22.1690882889679; Tue, 01
 Aug 2023 02:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
 <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
 <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com> <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org>
In-Reply-To: <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 11:41:18 +0200
Message-ID: <CANNYZj96-co4wRxY=N3KS4bEsFr_v=yJphOC0ZBO92TerGtmug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use --offline
 instead of --frozen
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185223

I have no special feelings about rust-hello-world; if all places where
it's currently used can be reworked to use real world components,
that's totally fine.

Alex

On Tue, 1 Aug 2023 at 11:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-08-01 at 11:20 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > Ok but this raises other questions then, this recipe is part of
> > packagegroup-core-tools-tesapps
>
> Just drop that.
>
> > and is part of a test case So what to do with those ? Suppress them
> > too or adapt them with another recipe (zvariant ?)
>
> I think the other test cases supersede this one so that can be dropped
> too?
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185222): https://lists.openembedded.org/g/openembedde=
d-core/message/185222
> Mute This Topic: https://lists.openembedded.org/mt/100458217/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

