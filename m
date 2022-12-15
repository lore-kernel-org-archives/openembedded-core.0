Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C657C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 18:01:33 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.140475.1671127292573242890
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 10:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okyZ1pB7;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id l8so10717646ljh.13
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xigwm7XufkS+Jn/WZlTRJs0JRrrougBL0XzojENVQXQ=;
        b=okyZ1pB7A309nkNR/naoX46NHCBgBAMYuoolaDrKgsoCWin8cH4u/J71Rzgzb4Ky2I
         pQWgDKFA0S+S4R1HSGWKmBK7NlrYnPFehhnxW/caLKZl530Nj/uaYXafJ5BHkAP9w8mL
         5vDk3XCHkibIPCiTVB5cEo9sJBb2oUL/5h7LoA1A1JtuFBj5F6p4otDsipW5r/CjEHXI
         LD2+Qo0ftYVWy/bIdmiDZnet1qnSvrrbUPdg4qP/Lwu9XpizArHf7KD2ralw3RAdTZE7
         yFtL+PUG+pZnmDp6TQAWi7h30nY7m4gr6ugz3S/rlxIiYpkg8BaZscpsUffurqmmk/F3
         ce9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xigwm7XufkS+Jn/WZlTRJs0JRrrougBL0XzojENVQXQ=;
        b=q8XkKt8nOwL7EJIKcxUOgd+L/9YI819dg5zSGz3PPCwcmpVt9bM5dGIEfiJonzijW2
         oky3gGtx1qYoBC7nCVWuyy9yQE/7I/4b8/iQZBqo10GEsLHK4ny+V6HBSkRc+IOC8185
         JLvQUFpWREp7SOsX8F0EIXkX5nltjTDZBlnhZ60S0CjPCP3K/MOMikdbJEpVuF5XvzQO
         puCXy0vdEgq+841IYWcV7u6Nk6wgctXL/JvVfte1kHiyLmoY9nB7tiZ+wjSSMllnEc91
         rckcIjyIpYeEude2ZvNDAgDEoMEC+kaypxCbXV1putOZDTuKlXkndG2CC+0kv79IFpP2
         pQ7g==
X-Gm-Message-State: ANoB5pm5anfF6+vEGXytzaQYvKfQjly2ZVVVdF7/R9nfH6dFzuXEpVAK
	Oh5pkNQkLD4+Hrls3fWiWSFlMonymnO95ejwI7g=
X-Google-Smtp-Source: AA0mqf5yhtzE99pt4naK1/rGdhyyypSvlHqJdRSQ7KQEtL29ugVLDTbBGeWwOIAsXrpQ+YKUIaUDeAS3ci2Phoa4TIE=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr30865121ljr.222.1671127290728; Thu, 15
 Dec 2022 10:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com> <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
In-Reply-To: <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Dec 2022 19:01:19 +0100
Message-ID: <CANNYZj-_xE=P1D0JG9KAJcTotkqQF6QdoMb+HDsGcW1UuyA7fQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 18:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174587

On Thu, 15 Dec 2022 at 17:38, Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:

> I'm referring to any recipe that could include rust-source.inc, if RUST_VERSION ?= ${PV} for example,
>  for rust recipes that works fine because RUST_VERSION would expand to 1.65.0 today, but lets say
> recipe foo_1.0.1.bb needs rust-source.inc to recompile built-in crates, in that case RUST_VERSION
> would expand to 1.0.1 instead.
>
> While I agree its not ideal, in my opinion this approach provides more consistency with the drawback of
>  modifying that variable on upgrades, however I also think that requiring rust-source.inc is seldom the
> case, hence the other option is to keep RUST_VERSION ?= ${PV} and hardcode it on every recipe that
> would require this flow.

Ok, I think what we should do first is to actually drop the version
from all of the .bb file names, and set it once, inside some .inc, and
probably next to SRC_URI and tarball checksum. Then this should allow
a convenient scheme for including and overriding things.

rust_1.65.0.bb - > rust.bb, and so on.

Alex

