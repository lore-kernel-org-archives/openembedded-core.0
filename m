Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8485D2127E
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 11:26:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.46815.1729164371431864710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lux0KrJJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so630452a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729164371; x=1729769171; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtB3TYYWs0FQwLet7pepkn9tpGY+ISVakuidD/4XEd8=;
        b=Lux0KrJJwRL8qWJkyxH9esfpK0kfsC1W1ZbxUnvd1qONATFhrpWfo6d7Ji0g2NSwco
         lbbRHmXwPvwA82R3WQfZNBwG9G4z0sb3UOolcC/xSD+tpu9B//t8ei7unyvWOMXp5d9l
         nWJm6+15V/HJ4wTDbYv+eAdl3Voi2vuXgT9D8EIY3AmC0ANqgrY/Cfsvt4hh9MKCatYa
         oaTcs3acnBRPSthbEdwsg5SBjMOLL6d4GvosgXt4xXoadznj8pDYvJrgoulpM47ksapK
         lPdKL/Q/SVYLxTpjP5zepWPnkUjTh89w3gYZWHcNrndYTWF9T9PWvUhwgbMWP/EJoV2H
         F7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729164371; x=1729769171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtB3TYYWs0FQwLet7pepkn9tpGY+ISVakuidD/4XEd8=;
        b=f5kFG+SpuFoIK7p775OyogpkDpiub7ynn4kQHrUZ8LVLZ5g4LlTTumvpTgbb1MJQZb
         PoqzfrVP49xShml4ffevFfKSPawIwHy+cRK7NkdlorvQ3e9Hm3B3p6EpkeOn0lg12tk/
         cUeo5edet1aMrmE9glMSQu+O/7xq2bcJKIa6H+uxbBqGE9emzfBlYqHke8/+W+hTVoN8
         /3OE6WoF+RKmfw2jlvKMzq7zlTzSVkHSFOY5oFB5XYotoGbnaw4Hhv4+hQYOBkDnaXhw
         35IFnIYLI3v0DbYC4exNpc264VrD62Ctyzc7pUuXNxM14OaBSPhVCrkyLoqfgmVALeI6
         Ytpw==
X-Forwarded-Encrypted: i=1; AJvYcCUNztPeWcIryVJEKe2ff5sMuV2oIn77fuZShSWMeXVDGeR8hZwteqxvZSHtRnxul2L1q70a9J1WO6SVC/xMwuR7Mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywo+6BNAOYn0qAlEiY7/4lekPIrWC5sJzOqPv+5pn6iTvlL7iHh
	pq++XyJ36lZnlu6gyDDDBJz+ZVGaLWaGqzbLf9GJAA6fcswlSgb9Cqo86LJIwyQCzf7qS9HIiLA
	g3IKqB4GMBNTnnPJUjBwoBUinw0A=
X-Google-Smtp-Source: AGHT+IHrERqNAUoxQlrGQENBxMfPN4ztETGhdN9EJShMB0uEnXPnWwwYYd28ECYUPBTd5KDsUFddDsqHGAFVPZJF+tk=
X-Received: by 2002:a17:90a:d788:b0:2e2:af0b:7169 with SMTP id
 98e67ed59e1d1-2e2f0a9d238mr23460997a91.12.1729164370740; Thu, 17 Oct 2024
 04:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241016193606.3459951-1-alex.kanavin@gmail.com>
 <20241016193606.3459951-2-alex.kanavin@gmail.com> <17FF097430B9CA8B.11625@lists.openembedded.org>
 <CANx9H-A+YJEcstXeh4N74m0N-xtm7AvWT621W18G9MtajG=a5g@mail.gmail.com> <CANNYZj-SK3jt365gTkjqh2kZXAqFG=L-vnQeZWPxXYY_0o67Mg@mail.gmail.com>
In-Reply-To: <CANNYZj-SK3jt365gTkjqh2kZXAqFG=L-vnQeZWPxXYY_0o67Mg@mail.gmail.com>
From: Tom Geelen <t.f.g.geelen@gmail.com>
Date: Thu, 17 Oct 2024 13:25:59 +0200
Message-ID: <CAJo0Az5c_viUiQX+OHuDQ9vstsomi6YsCLxXia4qW2EMGNECfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3-cryptography: update 42.0.8 -> 43.0.1
To: alex.kanavin@gmail.com
Cc: Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 11:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206013

I don't really mind, the goal is that it is updated. For future
reference, what did you change to the recipe that fixes the
reproducibility problems we were having?

Tom

On Thu, Oct 17, 2024 at 10:49=E2=80=AFAM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 16 Oct 2024 at 22:41, Tim Orling <ticotimo@gmail.com> wrote:
> >> Tom already sent a similar upgrade with more info in the Figur commit =
message.
> >
> >
> > s/Figur/git/ (stupid autocorrect and clicked send too soon)
>
> I just wrote a reply it explaining why I didn't take it and kept my
> own. (it also doesn't have the needed reproducibility fix)
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206007): https://lists.openembedded.org/g/openembedde=
d-core/message/206007
> Mute This Topic: https://lists.openembedded.org/mt/109050853/7396403
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [t.=
f.g.geelen@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

