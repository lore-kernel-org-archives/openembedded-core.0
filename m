Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B523EE49B2
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:45:44 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.6524.1692866734793694734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Jr8Hx2WH;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b9cdba1228so101248261fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692866733; x=1693471533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHDmPI7OSs07fk8qYufRTyQzCoB8QZ0ij+z5FiBXD+s=;
        b=Jr8Hx2WH8YUybodw5lzlVJw5R4cmZktkp3NrrY+g184biNOLoo4dA2Mw4JqC6fGZS1
         LQ9k7qWyzhWPws32zdvqvcWPxAVNWjou5XN0OSX2b9OLRF29eEelBVZn+iyEmqoavzyq
         wxlRYlEs7VdFb56qnCY2rNVMADmYb7zpBaoCoQsTnwmGavn0lKYwhkakZUfUoL+RND8a
         BDCX/sgwIPAmSUwKLHKFZlF7CyNmJXTe2GVBH1/KceW0HiN/GX+MjGTIhb9L1hRUuqsb
         415cBjP4Ah0mtO5aoBm3dUEHGQqw/m14OepGLvXU+YcJ/++HoDFfuTytz4tzpA1cOpEN
         xJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692866733; x=1693471533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHDmPI7OSs07fk8qYufRTyQzCoB8QZ0ij+z5FiBXD+s=;
        b=l/XOIezmo5ltmd3b5Lz0mZJEvfTidz6PDhM9vJWYjKzkbRfzlm4MgpGpjI/v+TuTkf
         a6G50FpGuWsD8vWcHxZE1nTVqO30MmcdbNbCtIHA9j3tH31TbFWAfvw8l3IqxDmR3Rde
         v8m6xJOWuyZMG31iFPCHbJO+z6SsL8XAqD2fTATDojouI6by+jZeQ8lWf/UjwA7RFjI+
         9rF32yioHgqvhRmLkK4tnPa5tRkGUkekq5/OIZQN8cOy6YG68Y/AwBLiqjszpcqkl3RZ
         ClIqlYej3nHnEMhAf8u+QwRJOcpM58h/0y9MzFKZt+dRiIRFMUaLvt1vgQ1TOVs2F1s5
         86xg==
X-Gm-Message-State: AOJu0YzgDmzjbh0IJ6Ahxrf0M30cXv1/BAN3sol3yy8b/6Ufsxpb5911
	LQwQ687Gi7vRCM973+HSpFppGBSQP67DtD5aU/Y=
X-Google-Smtp-Source: AGHT+IGbusJQn4mk4agj0ulxPkH6NtzjDsXUFEpRO0uwWwihFQi3NfJ2dU6XpXYbCDom0UMt0XXswGRiHZ7VVVUAdHU=
X-Received: by 2002:a2e:3801:0:b0:2bc:b29e:8fef with SMTP id
 f1-20020a2e3801000000b002bcb29e8fefmr10518813lja.34.1692866732689; Thu, 24
 Aug 2023 01:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
 <20230823162404.457379-2-leon.anavi@konsulko.com> <CANNYZj-et3+B=2C5TfxFjMBTck=JCGDh36giY0hcD5nN7TSdPQ@mail.gmail.com>
 <098c6e92-55b4-7930-0e98-712bb6141fd8@konsulko.com>
In-Reply-To: <098c6e92-55b4-7930-0e98-712bb6141fd8@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Aug 2023 10:45:21 +0200
Message-ID: <CANNYZj8ei0RKo21Yt-tV6a4XKqWFzgxGBjAk0gBFdH4GYG3agQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 08:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186646

On Thu, 24 Aug 2023 at 10:38, Leon Anavi <leon.anavi@konsulko.com> wrote:
> Without these 2 recipes Weston 12 fails to build if PACKAGECONFIG
> includes vnc:
>
> Missing or unbuildable dependency chain was: ['weston', 'neatvnc']
>
> In this case neatvnc and aml are dependencies of weston and in my
> opinion they should be in the same layer. However, if you insist I can
> submit the patches to meta-oe.

The criteria for oe-core are:
a) core feature needed for a typical embedded system
b) hard dependency of something in a)

Optional features go to meta-oe typically. Otherwise, oe-core would
just grow uncontrollably.

Alex

