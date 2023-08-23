Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486A3C27C40
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 18:39:00 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.833.1692815937549908529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 11:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZMzxqMQ6;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bc63e0d8cdso66643191fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692815936; x=1693420736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JScHfeP3AtGb8kqjifelx24ObCJnn0gso5GZFFJeVLs=;
        b=ZMzxqMQ6fLnS5EePBf6+woU+AAHA7vyaA+IJsfX1V+czCNsWwl9iuuFkIURN8atgcV
         FEyz7FT1WJNAI6zi1KJp6YZonYUiEKJ3kfrmMojDztR7IJUAWxlHkrU9sX/5/Fg/bw9p
         Ir2SrGCeP9SMTeVQX0dJJGEH5bstHVntbsWFoxveGlf4DKPDIYScJwk74G/PMR0T4KaA
         KaGeK1gpByddFeY2p9vw1o0XA7S+T/NGioxwF33La9i9G0PDpaeWhWq6OT6OIa7Ej7ka
         1hgmcmIs1A8UlWq5vBPXC1C8C/fG9+5PD6uwkBpjw8IpmCIUIIwdY1b567fkWTaej1qZ
         +skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692815936; x=1693420736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JScHfeP3AtGb8kqjifelx24ObCJnn0gso5GZFFJeVLs=;
        b=J6z10Pqb0Z1wZjj6Au1IhfO80Z2tNOYFVer+HlofYVkrwu9T2J0DqSa+rO8MrUFI9B
         QKrNhA9zB/M2QeHMhzNFn2t8aWxavLqHWuRkm4zt/uUNDRYVE+0mL8U3gP9tDps4b00s
         ChRTFH3MpPYCVdiStlpImdVMTg8XQRbWqOfFQ19BHC9XCisAbX20QV9AE7j29tCd3HmW
         zpheHlKqE/z30eUeNrhtSGuTihq/FiPDbMtjNoJWrBKB8DBIsIQc/GLI/wSPrsRxs2l/
         HnGRiVJpFGn8vknWJZNQe6AOJ18mdh9/M8tgYkA2Xddkl4SnCyyYkMu/Taj/ysovBWWh
         vDRQ==
X-Gm-Message-State: AOJu0Yydx6eX3HqKcPh8RICvfSLiH6yfYKuvkfdoM+IqcguKBkCcILX7
	qiB3A2tVl+tJts/L99FpfbZujxv9vzuJ902Ij5E=
X-Google-Smtp-Source: AGHT+IE4JcAB7ZOMPJ2Ps0r6rNnnKdzO+om35AUx1ge7Iqjvih4jJv1xbutIUTGxJS4c8iLWOsfHUdSPxwtZhOfYnNk=
X-Received: by 2002:a2e:8558:0:b0:2ba:38c4:1621 with SMTP id
 u24-20020a2e8558000000b002ba38c41621mr10915287ljj.9.1692815935378; Wed, 23
 Aug 2023 11:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-9-mikko.rapeli@linaro.org> <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
In-Reply-To: <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 20:38:43 +0200
Message-ID: <CANNYZj-i3gAnho=+D=95G_Ez3C4ZaXLMRxsavgbmEOfaO-ZR8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 18:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186628

Oh, and device should be /dev/dri/render*, and all of this should be in runqemu.

Alex

On Wed, 23 Aug 2023 at 20:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >
> > If access to /dev/dri/renderD128 fails, then qemu with 3d graphics will
> > fail to start and errors are rather cryptic like:
> >
> > qemu-system-x86_64: egl: render node init failed
> >
> > To fix this, users likely need to
> >
> >  * modprobe vgem
> >  * add their user to "render" group to write to /dev/dri/renderD128
> >
> > If access is not available due to missing HW, driver or failing access,
> > then skip the test:
>
> This should be a failure rather than a skip. Otherwise, autobuilder
> testing will silently regress and no one will notice. The error
> message should include information from IOError as well so that it's
> clear that the issue is device file permissions.
>
> Alex

