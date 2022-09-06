Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14193ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 11:32:05 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.2818.1662463915975929768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 04:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UXSueRId;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id i26so1159408lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=wGIzYxEiIcVbi5RZZJTmmywafqXlFVdlM/gRjIjFHqo=;
        b=UXSueRIdhkPDfUS/669kijB/JLRzxR/2VTD6Us6Sir/82+BYiE43VqCOIaVjH7g+4a
         nohV2h7ag6wsg+IlEdKjp7LiZdkT1VJ6Q1fkM9DRQTJyHncV1MkFw80cHmy4+5qsiYsc
         7kAzBsRSSb383zZoTRUdKGctbF2IKbwr31Pu4fek86yoe3mriaBEa3vh3sZUTUho1HPp
         +bh4AFR1S43rnhCM9AhBsXVy1NyNeCeCffQJIlzFe43CUdcLR8lVQp/wm6h93HxR31no
         F7dIx9DI1KYyZDnVtio8wY/3QVlErXFxIEkBxmKwFzF05hCVQuLn0SmsPex1mvzVjPFz
         WTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=wGIzYxEiIcVbi5RZZJTmmywafqXlFVdlM/gRjIjFHqo=;
        b=aKILB7ovFBFslEZtMj+abKNlipnbabt5if1EtR7wXXz4YDjKmXdilwOLgnmC0dAVuX
         aPX6H9P6iUFEFniniFxrHpQizpyuwwLkcXkZd0wut8haWwMoMWA4s4Y0c3MJleeJfbCt
         QkZUcfpnyc8kW+mRsrU7oP0+nsHRovECc+otUy7Ff2H8Uh6necQVciMblerEXExNw3lq
         pPnCN8ROIWHQpzpCQtCbEjGEcV8a7s9HNirZcNJu1OMgMRnAOYhDUymzfDYS5bPxlPMC
         E94jZNZLcXJOTVq/+9gBeTBsna8/NKE1MyZczb/NxzIh9omzyzKe2y/kmt+1NIt2iDmF
         jOtg==
X-Gm-Message-State: ACgBeo1bLX9+cfJTKJou6XdyLB6zBdCO90AXuSdUj8dgFY95udU48vWY
	vXIsUu0dECQM53sAsLD6Dnrj2TLboFRql4kWEII=
X-Google-Smtp-Source: 
 AA6agR7Zf1oTPTVbhSmI5upFKqxkrGGS0oAYdSfMvzrvt1qAnGeYgmH73/scpM2d0XO0mkMU5atoHU6oIxDhXcZ4vw4=
X-Received: by 2002:a05:6512:694:b0:494:9a24:3243 with SMTP id
 t20-20020a056512069400b004949a243243mr8866639lfe.673.1662463914055; Tue, 06
 Sep 2022 04:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182141.1091053-1-alex@linutronix.de>
 <87leqwztwp.fsf@jogness.linutronix.de>
 <171241B5563541EC.6347@lists.openembedded.org>
In-Reply-To: <171241B5563541EC.6347@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Sep 2022 13:31:41 +0200
Message-ID: 
 <CANNYZj_sTxPuZtdVk68A8AGqwnT6=RNXmJ6u1LVuc6BQiHRvkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 11:32:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170348

On Tue, 6 Sept 2022 at 13:24, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > 4. Listing available templates is a nice feature, but this alternate
> > mode of operation should have its own argument. Something like
> >
> >   -l                List available build configuration templates.
>
> See above please.

On second thought... the two modes of operation should be more clearly
separated, perhaps with git-style subcommands. As long as the default
without arguments remains discovery :)

Alex

