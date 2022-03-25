Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D280C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 14:21:07 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.6085.1648218063813323167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 07:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e7hrltYE;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id i186so8498882vsc.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aMqFunRYzasoLA+a7CCBoa6cdtGn6JdeVp9alOt+7Ok=;
        b=e7hrltYE6ta3V1QpXtzIuu7tLUQB0ELAj6/Ec6nziksn5bTeYZSOhOOVugVyG1JxB6
         KH3kEk+v+pFUBkSdrngebql/nGbbL2mB+DHooRHfrHWRyVrwj/VRM34nSDXvOLTKZKzM
         Rl1F2KotXQBbF0craEWAJb7uOZJdSOMONy3tXIk606PUypND91mF77/TVNgMZQOse1YS
         uC2RoParf60KeaxNfFi0p9EP9bYYsJKDd1PQQW1Sh08kK4MDYmra/7I/hxGmzJcpBWuz
         1WWYaEx4il6lESosqy1QmL6RK+v3OasKp2M0P37aG47Rk07lkIKnem0kzz0n4VdOYFGa
         K09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aMqFunRYzasoLA+a7CCBoa6cdtGn6JdeVp9alOt+7Ok=;
        b=WQp0iMdEm9WV8O2JYsXumxaFZef2dd/dstJgfkM0cSYN8r0b1x+3QUD1xaNGmI41V6
         fl0D1Dzsw3nhW1V1NSCg13nLnv7YyAWcZ34NTvit8+BKSNLpHaLr0Fgd80GWa0PY7vaV
         rTPiWl/QmrK/m5UW/lVek5w9Awc8acr6x2TWf859wvjsgDJwbGXMg6v0M5IX+qeN9Ifh
         JwNV9PhUjAK3XWGLY/vx/hkRyIrlu6soW/2p/epv1Eqp//ZxcqhI+q3I34YGUhVPLQNF
         B/GJeJM5pN63VVTf0pOisUb7rPMwtONu5kHGruhYq2WVeS7Y7VSBK3amhdfLof3jqIkg
         es8g==
X-Gm-Message-State: AOAM5338C13OjZ2cAJATsS1cBdjRxAm2dJON8YN4rVr24F3eVjiErHD5
	+R+MHaAaoZLO2HYLaQhqg+rk0Ixg3GWy2ATbcB0=
X-Google-Smtp-Source: 
 ABdhPJwavlvZnOfXhNyeL+3HdDucsxtX9kDdeLM1D4B1xQmoZsGFu7XRymn+yjWmJLZKUd+bT3rPMKLn6XwSzm/Dfsw=
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id
 v12-20020a05610205cc00b003209bd23823mr4973978vsf.81.1648218062950; Fri, 25
 Mar 2022 07:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
 <1a104385-ede3-53df-37f9-141de5e191cd@gmail.com>
 <CANNYZj8vQhVntJbCdH4i+okyRXUVwFLRJ4kzO8=_F6QO5omreQ@mail.gmail.com>
 <535e521c-cfff-8d7d-ab78-f43a1b0063ee@weidmueller.com>
In-Reply-To: <535e521c-cfff-8d7d-ab78-f43a1b0063ee@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Mar 2022 15:20:51 +0100
Message-ID: 
 <CANNYZj9G=N1sScfYAddKRFLVcnUAcMgDVgSuHf22QEyD+mmi2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 14:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163643

On Fri, 25 Mar 2022 at 15:15, Stefan Herbrechtsmeier
<stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
> > No, it's the same here: most (or all) of the consumers link to the
> > library, and utilities are mostly for interactive development.
>
> We have examples for both solutions. xz has a liblzma package and brotli
> a brotli-bin package.

Then it's RP's call. I don't have a particularly strong opinion here.

Alex

