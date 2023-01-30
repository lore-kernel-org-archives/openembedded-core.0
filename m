Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73283C636CD
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 22:14:28 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.8658.1675116864906273864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 14:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PlmNhSs5;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j17so21379398lfr.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 14:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+rIp+iDe3HVDAEbI8oRKEKOhx7cc1J59EzJR198NWN0=;
        b=PlmNhSs5trFWv3BrqWvM9qqJka2TWMAvoka5Ibv31qfrCOi6vj8ttePuXcsPaEqkv1
         R1Of+YKYUqirn0wXSL9WE9bJj1nqVOPbog4+c5Zmn6aHBiSiaURc/DhuaJtwKMsbb298
         cO9VFg+ex758FoEPTfzvxYIwRRUVgrNalgzigA1FKo3BxzHqkBGbT2qKryIiAlTjeInJ
         40MUh5R3i8LW7gLrvxlHUFxd1XETj5btL+hRHCQLdT1zAHsjmhnvAyPO1mku7tUcYGvN
         xJZkm6HHWSkLLaiysTHPCyUlnZAUfIUu+rGo+qV9AiayDSAeHnq3YEOuIxUW9xRzeIpI
         9sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rIp+iDe3HVDAEbI8oRKEKOhx7cc1J59EzJR198NWN0=;
        b=6XQu+ZgPCnPEd45RcRGBDLOvico5/7TThhqotrkpa93Juw5O3vsE8IKBDUVP573Pkz
         cjnTAHKBrwhV1ObHgSHGCEwdmJ4IOG32dBS04gzzg7taI3UHx3kZR7PzazXTqC+fuD0X
         HupzCPb0NBPaRqKgepOWaaiyzXTLtP2718hsMZ5sWIfKLZvb7ympNQotuyjzb2bJ7Gp+
         F8L+ixH5qc90loBoEcZr6jh0c4XiCTp1rdEKWwRELIyPjhZgMVT9JNXcVvavMzY6sBQB
         jwbXj8rHdpsye2XASXqrbOeW+c3zw4kTOPMHhRfDOceMiaoxZTl2+er9NwI4Kuj+eyDT
         7KjQ==
X-Gm-Message-State: AFqh2kqH/PdeEnqEVGFpfxCgmBe/o+QnOdyKiuFdD05MPobZ+MCxprde
	CNxGKpGDD4wuW1Z32vO+gw2pGDdy+bvm6vwIA+w=
X-Google-Smtp-Source: AMrXdXtMc+YVOdc+g9namy6GP1Dwztr71ZnMCWcppJn7bBylRNMYarj9CgCnepoNM9IWeZcWUlS1Tc8q0w9ynbLZynQ=
X-Received: by 2002:ac2:4f0e:0:b0:4ca:fab6:91db with SMTP id
 k14-20020ac24f0e000000b004cafab691dbmr4525881lfr.202.1675116862961; Mon, 30
 Jan 2023 14:14:22 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
 <173F3040B8ABB5B1.13569@lists.openembedded.org>
In-Reply-To: <173F3040B8ABB5B1.13569@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jan 2023 23:14:10 +0100
Message-ID: <CANNYZj8yBseLK+29ayWBWz53rNfT_+W6yh=wyT6=kw7GG4v_7w@mail.gmail.com>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 22:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176503

On Mon, 30 Jan 2023 at 21:30, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> The 'slightly mad' part is that assuming Popen.poll()/waitpid() do not
> wait for the signal handler to complete, how to ensure that the child
> process had truly exited before proceeding in the parent? Am I
> completely wrong about what's happening and how to use these things
> correctly, and sending me to a beginner's Unix class is in order? I'd
> like to write a simple replicator showing incorrect behavior, but not
> today.

I sent a patch which does fix the dangling nfsd processes. I'm still
not sure if this is indeed the semantics of waitpid() or I'm papering
over something completely different, so if Unix gurus can set the
record straight, that would be appreciated.

Alex

