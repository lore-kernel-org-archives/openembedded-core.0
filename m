Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FB4C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 09:44:54 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.4268.1667382291987570709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 02:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Khs23LTD;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id k19so24059545lji.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5rXuMuvHEJNPMMpiKkUhMLtO0IQvPV+Y1e9NETP0N4=;
        b=Khs23LTDdE3uQBxSsji+7gDzqELc5ilr5aYnJxsFeRhXq7uG2qevOEwyjF9hbwwtbX
         Y1JUsh9CaZcdLauiCIjEW9OFCtBXPf58r0lCTG1JvmQnPXcA/JwsQzMN6G37hQkzD3OX
         uP+idrEVrV/NTrYLZ4KWcLY8/p4+3sD59OnIGRniqbqiWDMrr6wsRT71CrUwtTpaAFZb
         9WOZfNJdncYaGDzi4yOJ6LBtGbfY4xLGZSZ+UYFuJeNFnVuQ5H6PN2ug3S+V0xtzKdRg
         JWqjiWV0oQ5pInFDgDIZzth1Mut7dy/PXzdXDKJcg2wRhuNzbGk9gUHaUWrFShHho6wl
         D98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5rXuMuvHEJNPMMpiKkUhMLtO0IQvPV+Y1e9NETP0N4=;
        b=fvG/ImexGRc14tRTRzROdfVWIUP9OgU0xWtqR5AqRlzXCnPI/YdKiPPnai6KkTTym6
         /ouJD8sc8qW33xsVtaDO5xzhdEyr16CpwU7q9eQdzqVvOH3viJUYbAcRZGQjwoTdlh+N
         U7IvWTYpvX0dZLIaqR05TjjQroF4UZ8JvfmNJvpLr8eqccbfELyLL92azUH4/n1xIuAf
         JjCPMeL/FoBIe1RbJcpUVkUjMbp9HcWsbjabYDSgeiJaD5H/mPwlSaoIuu8Er7U4GLLI
         uwHVpiHPWqSaXqOyNEzYyuiopCfgbGtZMUtAbEy+tyhf9k7ZkzXG11+7sd1a9Fj1+cYs
         NPwQ==
X-Gm-Message-State: ACrzQf0nshkCShrZ89+MIHry1+95pMgcqiXjp38i9NXz8rGIBgB8n9bd
	1eruXRK1RbCMTuiOR48/jBT2icBWN1FUJI1ejGw=
X-Google-Smtp-Source: AMsMyM583SZ3iun6KzBlM+8Tib/9pCrvzE0dqTO1FH4ZEup8/42PmuaMgE+F9Kup5aHFZkC/RlZ0O3oJVY6NCscPm9w=
X-Received: by 2002:a2e:bd8a:0:b0:277:280:45e9 with SMTP id
 o10-20020a2ebd8a000000b00277028045e9mr9374941ljq.31.1667382290150; Wed, 02
 Nov 2022 02:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221101201044.1034019-1-alex@linutronix.de> <681b5a850dec436f41961b15df6743b683dfd285.camel@linuxfoundation.org>
In-Reply-To: <681b5a850dec436f41961b15df6743b683dfd285.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 2 Nov 2022 10:44:38 +0100
Message-ID: <CANNYZj_FvctYfbjKgbEoEVDCnTTtzRxNk3J4bHLmSyBZ2Bj4+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: submit a rewritten version of
 crossbeam_atomic.patch upstream
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 09:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172582

On Wed, 2 Nov 2022 at 10:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Should we not update the patch here to match the one we're asking be
> merged?

I would rather see it through actual merge (where further changes may
happen) and update to the official backport. Updating this particular
patch is a *royal* pita.

> Thanks for sorting that btw, I kept meaning to but hadn't quite had
> enough time to learn enough rust! :)

I wouldn't say I 'learned rust' either; I merely fumbled through
compiler errors and stackoverflow search results until I arrived at
something that builds and behaves as expected. :-)
Going through https://doc.rust-lang.org/book/ is a pressing matter for
all of us I suppose.

Alex

