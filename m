Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EADC77B72
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 09:25:57 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.3846.1681982751009529990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 02:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IiljB15Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id a10so2050480ljr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681982749; x=1684574749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W9ssOEBpA8/IfcdN6Wa72pHPhZCUBPaO7g7FZDPqwG0=;
        b=IiljB15QKKrcr0FoT8H86xEaYUIccttQM5pWz/OWRb4VD9J3RS0f/l6r97iIk3eAoW
         f40gxp/lIEZvqIPhgrqxI/1uhrSn7tR1zUHPcYy70lFEeap21SkcYYiljpl2F/zCZLzG
         7CwCG7MRQGlLdRSnhyx7CpS0kItYs/Yyrdd5lHTijZcZqeJnpTvogGhCzq3t+doKyj17
         0Dep4adszR+u6xIrtcwkdibmoZ8Mj/+/sd7GB1XLb4ttLC6NAAmnGBGDOr0zGoZxgGGy
         0Ya+VV//A6CGf5hM6rLcplxnqWisKqExJn00SHnAZNFhV5lZDk5b2wW0sKdfXLy3uguz
         D9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681982749; x=1684574749;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9ssOEBpA8/IfcdN6Wa72pHPhZCUBPaO7g7FZDPqwG0=;
        b=LZ8ULkSu39DAVQo+0X5SNDiMBTA/7etC9vRj4vjjdhjAe/2TrIS+siXVGc4gP//vFc
         2amofhqofmgeDmZe0I+9NKcLh5/zeq9/E9WKdpqEu1/jmK+wtG5EBiHGIsuBTE/5ooMQ
         UiecXmMc0poQ/TG8uQPH/MNrq99TMen06n4Y8D802uGwn8O9cHlMkcnJeNQMvGslysDi
         oF8bopQ/idQ7pu0kBGICsWf9YkjndYv0oDOX+eLzCUwxj60IcSPDhfkVMZDnKfvVkITk
         0SJnKF6xmTHi/gbKO4fCwrpU/G09522bu1akexEJJjpNr7/L8i7Ad612CpXljIqxUzS6
         pgkg==
X-Gm-Message-State: AAQBX9duD6cA1lnDXrBe0Qi43nCZSVnsZoL+gh9jnIdPLVyWJvBzXCvJ
	mTSYA+g3BNy3i7CJAEzYctv1lS8wvr29UEYZOkQ=
X-Google-Smtp-Source: AKy350a4WXbd9wRHEsE2Jmf9Z6BvC3zWYZJ8L8q4HOT+t/EpjmuRPIBVQV4WEg8ZOOYup4FkfvZEIWUetQWhqgLmaKQ=
X-Received: by 2002:a2e:721a:0:b0:2a8:e430:34e9 with SMTP id
 n26-20020a2e721a000000b002a8e43034e9mr269008ljc.20.1681982749085; Thu, 20 Apr
 2023 02:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
In-Reply-To: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Apr 2023 11:25:37 +0200
Message-ID: <CANNYZj-G1AzrcbdVjQnBt4eSc7Ky_pHgzd+3KQ_p2ory+F-Prg@mail.gmail.com>
Subject: Re: [OE-core] Cargo and ptest
To: Frederic Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 09:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180242

I'm not sure anyone can really give qualified answers, you just need
to write down some code and iteratively get it to something you like.
You don't have to show your work in progress, if you think it looks
horrible :)

Question 1 is odd: cargo-native would not run in target images, so you
can't add it to them.

Alex

On Thu, 20 Apr 2023 at 09:27, Frederic Martinsons
<frederic.martinsons@gmail.com> wrote:
>
> Hello,
>
> I would like to build and ship tests for recipes which uses cargo and in the process, three questions arose (maybe more when I will progress).
> I would like to have your opinions on them.
>
> 1) should we ship cargo-native in ptest images or should we just build and ship test binaries alone ?
> 2) should we place the cargo ptest specifics in a dedicated class (e.g ptest-cargo.bbclass, like already existing ptest-gnome or ptest-perl) or put this in cargo.bbclass itself ?
> 3) should we embed all kind of tests (unit, integration and doc tests, see https://doc.rust-lang.org/book/ch11-03-test-organization.html) or just the unit tests ?
>
> Thank you very much for all insights you could give on this matter.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180238): https://lists.openembedded.org/g/openembedded-core/message/180238
> Mute This Topic: https://lists.openembedded.org/mt/98384286/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

