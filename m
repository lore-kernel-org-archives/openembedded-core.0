Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E61C47DDF
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:33:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.15926.1706276026589195988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ft0al8K0;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso3731981fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276025; x=1706880825; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dh4I05hLAgTmxKqa9EExS7JE6b0uRmq2eBtItMbie2c=;
        b=ft0al8K0Fa0wrVGiAo0yKKjR3VBBG0AawWoMubX3ysThO6DARrw1UbzpnAGM+Y4+VZ
         v34NbAsqA4zaJJj88MQZRFEsMm4klea+RHlquZPMQ21H/zCk9rPzTRf1c6bP/f5rtVkr
         eYyVVDaybaw4ataEB6uD4Lemszy0qbwCn1qaZunB+s0WAuUl03XSnU/Iqknj1F6l5cXI
         6KTZXY1mpr1pnPDBdHyNFGwAFcWbrQFZpywcJrARzn/8jGjpVge1XLQqHHWxiMl+3KVh
         aGf/HafBrWpPjoO0bJT+tr0sFi/Ft9EKr43Y0y68ZdDgcDldUkU4vCK8K+c6oDHiWbfe
         hGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276025; x=1706880825;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh4I05hLAgTmxKqa9EExS7JE6b0uRmq2eBtItMbie2c=;
        b=dE45i6QK1rjYaFQ7AdzNlpDaO7rHmvXm+VEBKeb/a8qb9xKkEcSHbdK9gb1SiZUD+x
         wB5IRrz9f3O+DkSe21vXmabZGu4qUg0jF4Z2KV+uU3ih3dXHKCP3I8c/zekuiBgfrW6v
         F9F+DcJaWwyeH2hib1AcIFoMn7iAQEvWdXppHRNBumfcmXZtdYT0OM0/L2JUidlAc9kj
         tD5W++9wsfkfu7qD2qe4gmMiaH2Xo8K+hxLThZgAq8WJOgQBNqY6yeZqNJCJRs7RoeUo
         XYEBhCYWQUyqCDRzEfLmKd3DSlfxUnLwd59MU0tWlVh9qoupyWvT/XgAmDWc9n4pQ4Uo
         43dA==
X-Gm-Message-State: AOJu0Yxs3Ls4bg8XYNjiO9iZhUFYxovnzZ8Mp77QKIwxe9oPySj+7CCj
	MXpHmVXCPupgXPBtS2bxS70mghsJT0DtdzM0QzXKGBNKSjjCBMO8oB9v/AFhKThZw1EfhkMHCdA
	gLXcZYD2GofYzEc8JuuaHvGEPW5E=
X-Google-Smtp-Source: AGHT+IFRS6UQ8HbWh8XlUxH22XygehrMxViFmCORmZgqrTPZdixdQ7duEUb8B0mhJUxX1+8PB+r7V2IeXsmskoZJhhE=
X-Received: by 2002:a2e:9858:0:b0:2cb:2d48:334 with SMTP id
 e24-20020a2e9858000000b002cb2d480334mr809010ljj.60.1706276024570; Fri, 26 Jan
 2024 05:33:44 -0800 (PST)
MIME-Version: 1.0
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com> <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
In-Reply-To: <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 14:33:33 +0100
Message-ID: <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
Subject: Re: [OE-core] oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
 appears to hardcode important tunable params
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194360

On Fri, 26 Jan 2024 at 14:21, Joakim Tjernlund
<Joakim.Tjernlund@infinera.com> wrote:
> I will try workaround these somehow but will not go so far as creating a new MACHINE just to
> run these tests.

Why would you need a new machine? You only need a new configuration
template in addition to existing one (e.g.
conf/templates/repro-test/local.conf.sample and bblayer.conf.sample).
Then initialize the build with TEMPLATECONF pointing to that.

> But now you know what the main issue is, hopefully you can fix these somehow.
> Why not force offending config off instead of error out(in kirkstone too please)?

Patches from you would be most welcome. I think there's a already a
mechanism where build-st/conf/ contains a custom local.conf, so all
the needed settings could be added at the point where that is created?

Alex

