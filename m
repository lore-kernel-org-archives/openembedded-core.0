Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8D5C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:47:02 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.6057.1716371215671695144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ST1MbPih;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51f174e316eso5752056e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 02:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716371214; x=1716976014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mw7UE6A/RkI0JCp9/oymm9ZOnMEoz+fsqKdKoOnvcVs=;
        b=ST1MbPih5TvV5Bjy9GUWIskh+qId8j+g5iTqj8nd12xFtjTflTXOUJ1sF+6O+v1D1t
         D+yOnao0UrI+J1ouHacmOtIriSHPNIP+zzvp7xX1FwO0iIAeTzqPTh94nR1nvJ2QV2iL
         50V+3FFLpenh9VX563aa1JfjBRH7C6i3/GkWBgceV3Rkbj2Jo5ZH3F+5PgewbSIoLyIg
         CLtZAfz0CRLyyQ2Lm0KRyKyQ920/p1Pzo9E2BCu6Q/d7NdbIXVnKKafFlcmDsdivqR3h
         o/Sxa9Wij6X1gVcbsf3CyI7xek+ZUdO8dXaJl7Fi8CMT8NsBZiAhSCfleKHUBuaWmbP8
         a/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716371214; x=1716976014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mw7UE6A/RkI0JCp9/oymm9ZOnMEoz+fsqKdKoOnvcVs=;
        b=ZIVfhSDRvmeHQGrpBgC/wTKbqf5J530wimp9iFe8Ltx0vbKThitL/0zpun1MgJns9j
         d/ciwgQYoa9ngQ3e3WNk7j+vI0gqYyd5waYAEE01kvikAfl3hFiv/2h6HSeYFXwDFNQt
         IQpCqyA/mTd46CbybjkthRqodznHPDBmTalEfT83fozCoWu2lICa47cNBaWSsO4uLbkx
         nHiGqavvXArVKilkw9I4I5dwloLwGSFlDrDfZAc+YVYO2S3I8+Y3pMC6MmT7fBoMXTGc
         u5ttv5atCcib3+Ml9/SUQ0rkqBYDqvjqj4WftUXix4aY27HpQ5ecNW2wgdpq8utN/DIg
         2Wyg==
X-Forwarded-Encrypted: i=1; AJvYcCWq6sEM+oyyy5XCK+c9TIyStVhjp0i7PAC0wAazKYH2y/g2jH1e0TSyvBcU9B2SRT+FGmtt+V+f9Xikhd3KA4xMWHmzxVKSF0RcdSjEF/RdgX1RSIjpCIQ6
X-Gm-Message-State: AOJu0YyDHr7ivbCo2X8dEAMflyx/otbzR/ndieGWMF0CBdi488JAoP6G
	cxFD/spOz1QOxoEJbG4U5rHCkNUxcn0bZrbLgZjXkOlM1Sn10A70m7LVyafSzfjJJ3wxZbgLLqq
	LsSvKcyviteKbj0y+3+pPDguQkw0=
X-Google-Smtp-Source: AGHT+IFal7vXNUXoiu3CBszdYHwtPyQMfhJILctoupB5Zj88ptbOvQaxmoHme48309IxFV3veA5B3dh+gmP8iP98BM4=
X-Received: by 2002:a05:6512:52a:b0:51c:c1a3:a4f9 with SMTP id
 2adb3069b0e04-526c1215592mr902850e87.64.1716371213495; Wed, 22 May 2024
 02:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
 <1716369289-22526-29-git-send-email-wangmy@fujitsu.com> <96b1f8777059b63c09a0b25655182950e687567b.camel@geanix.com>
In-Reply-To: <96b1f8777059b63c09a0b25655182950e687567b.camel@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 May 2024 11:46:41 +0200
Message-ID: <CANNYZj9G4_XRyVMUvKJA6mVjsKPY9XF7J9Wmk0njOoac0kYVvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 29/42] ofono: upgrade 2.4 -> 2.7
To: martin@geanix.com
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199743

Removal of patches is always preferred :)

Alex

On Wed, 22 May 2024 at 11:38, Martin Hundeb?ll via
lists.openembedded.org <martin=geanix.com@lists.openembedded.org>
wrote:
>
> Hi Wang,
>
> I've sent a similar patch that also removes the two patches, which
> aren't needed anymore:
> https://lists.openembedded.org/g/openembedded-core/message/199693
>
> // Martin
>
> On Wed, 2024-05-22 at 17:14 +0800, wangmy via lists.openembedded.org
> wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Changelog:
> > ==========
> > - Fix issue with handling SIM7100 modem enable operation.
> > - Fix issue with handling QMI NAS indications earlier.
> > - Add support for handling QMI default bearer.
> > - Add support for handling QMI DTMF tones.
> > - Fix issue with handling ATD*99 for non-muxed ports.
> > - Fix issue with handling QRTR discover timeout.
> > - Add support for QMI voice call feature.
> > - Add support for exposing modem capabilities.
> > - Remove support for BlueZ 4.x services.
> > - Fix issue with LTE provisioning support.
> > - Fix issue with SMS and address length checks.
> > - Add support for QRTR services.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta/recipes-connectivity/ofono/{ofono_2.4.bb => ofono_2.7.bb} | 2
> > +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-connectivity/ofono/{ofono_2.4.bb =>
> > ofono_2.7.bb} (95%)
> >
> > diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb
> > b/meta/recipes-connectivity/ofono/ofono_2.7.bb
> > similarity index 95%
> > rename from meta/recipes-connectivity/ofono/ofono_2.4.bb
> > rename to meta/recipes-connectivity/ofono/ofono_2.7.bb
> > index 5e1e5f3b6a..87f1958525 100644
> > --- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
> > +++ b/meta/recipes-connectivity/ofono/ofono_2.7.bb
> > @@ -13,7 +13,7 @@ SRC_URI = "\
> >
> > file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch
> > \
> >
> > file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch
> >  \
> >  "
> > -SRC_URI[sha256sum] =
> > "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
> > +SRC_URI[sha256sum] =
> > "dabf6ef06b94beaad65253200abe3887046a4e722f4fe373c4264f357ae47ad3"
> >
> >  inherit autotools pkgconfig update-rc.d systemd gobject-
> > introspection-data
> >
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199741): https://lists.openembedded.org/g/openembedded-core/message/199741
> Mute This Topic: https://lists.openembedded.org/mt/106239640/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

