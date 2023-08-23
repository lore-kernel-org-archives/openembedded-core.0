Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F6CC3DA66
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 18:40:10 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.888.1692816004431312858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 11:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CqSl6dbv;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so50669631fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692816002; x=1693420802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/mu++HF25OqVzBKeEMQP42uqWSpxEtsUY2tFagPNDI=;
        b=CqSl6dbvJ5za9AYeUCpgdJM+EpfpBjH8YcSQvzyu7lAuGga/ltzoKhAVEahEeF6nri
         U747NJDctFxay+rvPOU/gNtb7wBdiJVwjsJxxuwXqrVxShNZfdQ8eP60SlSzHgV9tqXd
         9JJb2HqFaGZ9Qzh/BQa7vy7QYoD3mvRVnDK8B/FnspySjXHl3BE/6mpiOXNd/PYceAFj
         36BEUHUmLw9PULMSWFmTMi9v+tQt97T3ZFabvAxVSzctsv1bLc8Cq6oWLtobF47ybNTU
         awXRWfIzyrE7GxgW1qH9mdFeyNUr6z50qfq1N3FDz6Mem95kRUZK40bf8jRdc9P1i+XL
         TxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692816002; x=1693420802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/mu++HF25OqVzBKeEMQP42uqWSpxEtsUY2tFagPNDI=;
        b=W33u+2codyydqHQQCdRTSaQAY8j0IJY+otMFxTekTC+HklETokAeH8tlOtah6LLTi4
         kFoJjyXjuN3LxwDzvVG9N9rIQlsNT6FbOPZ0QvyOvX1hnzDjQMEMIS4E+nRKkreoZV8n
         +1CqA7N+mC5+VT9DURh+HM/VTdWIPmk655DtH2SDPl0yz7hHyEhPitFp5QsqPQFmVira
         rOczs1YJHVHIMT7qCKwlNNcg1Rb9qZCL34G/O0aYxPo5cmZGHmDmOlhWYONNWvn7jpEp
         JZBjCJqkW3m0QEWPjdBeaXAbRhvKd80nfaMNTgAUu2m2U7aoe1nnSHOTKjkNDXgABswA
         vozw==
X-Gm-Message-State: AOJu0YzX4B4hI6QEr+b7G4s2Awc/uqUFViXEYH0kKphslv2u1B+EH4iR
	udTnHulcI7uXewP4ZeYR3dHz16rEnB9B/ACxuS8=
X-Google-Smtp-Source: AGHT+IHASVvvMCEAcNd4z+2TZFKWODIaRorznyuVb1zMgQ+57v950+smIEFRW1Gwlytw1zRkRh3VcHSfJlGKAskVRGI=
X-Received: by 2002:a2e:81ca:0:b0:2bb:a28b:58e1 with SMTP id
 s10-20020a2e81ca000000b002bba28b58e1mr11251473ljg.41.1692816002488; Wed, 23
 Aug 2023 11:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-9-mikko.rapeli@linaro.org> <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
 <CANNYZj-i3gAnho=+D=95G_Ez3C4ZaXLMRxsavgbmEOfaO-ZR8A@mail.gmail.com>
In-Reply-To: <CANNYZj-i3gAnho=+D=95G_Ez3C4ZaXLMRxsavgbmEOfaO-ZR8A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 20:39:51 +0200
Message-ID: <CANNYZj8mmueJJnWknEnMhZFRpXk6xYLySR6MyS2T4Sc_SAhG2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 18:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186629

Better yet, how about fixing this at the source, i.e. qemu itself?
Sorry for the rapid-fire :)

Alex

On Wed, 23 Aug 2023 at 20:38, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Oh, and device should be /dev/dri/render*, and all of this should be in runqemu.
>
> Alex
>
> On Wed, 23 Aug 2023 at 20:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > On Wed, 23 Aug 2023 at 08:10, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > >
> > > If access to /dev/dri/renderD128 fails, then qemu with 3d graphics will
> > > fail to start and errors are rather cryptic like:
> > >
> > > qemu-system-x86_64: egl: render node init failed
> > >
> > > To fix this, users likely need to
> > >
> > >  * modprobe vgem
> > >  * add their user to "render" group to write to /dev/dri/renderD128
> > >
> > > If access is not available due to missing HW, driver or failing access,
> > > then skip the test:
> >
> > This should be a failure rather than a skip. Otherwise, autobuilder
> > testing will silently regress and no one will notice. The error
> > message should include information from IOError as well so that it's
> > clear that the issue is device file permissions.
> >
> > Alex

