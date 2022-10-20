Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8C5C433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 15:19:07 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.10792.1666279140033297248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 08:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C8gpEaNd;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id a29so34217324lfo.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K/qUFWh6C6ng+aYhw95Tvtc8ebbxLavxxX7R34FJg3s=;
        b=C8gpEaNdfVRFJCFgW+SbTuYFIg2KesWMlYhpJ0s6bB+jrSW4cJvhcqRC0dOzWjCYvM
         iQ3ReAGhvNd6xN6XvRvX/b6CTbmcP+l6p3h1BiFw6Ka+b3Qnwfmpkpzy1EFzunLl/T8N
         g5I5V4N7O97WyU3KDLAySiNAXd+pjaHq1SgMIBbGhakB4+2cKIabBvedlBUXR+4WARW1
         OKHazCkXPFAB7BteGxj/mIwj+eXKK+ZIT587SJIdSxWNZ4z7TJg9at3apgLOH2s41EAN
         SeVAtpsjKgVH3JZAQu0Ocy+MZYUwwQzhL7YKj/C0PbzeAtWmyFokKmuTObovRoGtDRRi
         IVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/qUFWh6C6ng+aYhw95Tvtc8ebbxLavxxX7R34FJg3s=;
        b=kULAJX9+gxDvk5qlcJJTxYK8SSaO1FOzn92VXfDwgcjJR0OTlkhDQXHaoa+EILwwkA
         8Pu3UwVq/fyBAgeiLJE95kl9iZE/fcN9gFarMVV3A2jFoE+cDEzDGRC1Dd/oYpQ7HS+s
         6n5yUMx6POU1Ibgx5Jg+asVUmbPwelK5IqCXy9VfUMbqeGFXFe3K8zdyujjILm8RfdHY
         DRyKKs0+HftSYXD7oD6iwoZHjupnXStiAmUwFGSZw5xOovfAcNTxZOT/iT0ZllcN+089
         mODn/6tV1FKoYl+6InX5o8Ezwew4QPoFVz7DXAtOdaajDJJn6Nhyurc1hsGYeWsGEoj0
         z8Fg==
X-Gm-Message-State: ACrzQf1uOhSR/PV2xvT5sO0G0LZhLFrohUsQgBftD4AQNMU5f0urvFqD
	5vwdjBfk+S5PM6oxJOnUMAUcHxqScGlvbjF0zWE=
X-Google-Smtp-Source: AMsMyM5HY1NK8SEy9Ovoh8NF+EUoWXh70V0jG6sLr3qauJqv02gQEQRjSmbRDv8473bY2odqSWY1tkr6uIHMgl7Vo64=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr4818266lfl.367.1666279138080; Thu, 20
 Oct 2022 08:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221020135531.57483-1-arturo.buzarra@digi.com> <CAMKF1sqtNt+5UXRc18LR8Uhq9Vcppg2nadsQVpabKw5ekoNjMA@mail.gmail.com>
In-Reply-To: <CAMKF1sqtNt+5UXRc18LR8Uhq9Vcppg2nadsQVpabKw5ekoNjMA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Oct 2022 17:18:46 +0200
Message-ID: <CANNYZj8_C_=HW+ALVikFWGcWH5yqEFuknFQtGKFuedsz1VxfXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] run-postinsts: Set dependency for ldconfig to
 avoid boot issues
To: Khem Raj <raj.khem@gmail.com>
Cc: Arturo.Buzarra@digi.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171999

On Thu, 20 Oct 2022 at 17:08, Khem Raj <raj.khem@gmail.com> wrote:
> > -After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
> > +After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount ldconfig.service
>
> ldconfig is not always enabled, it's controlled via a DISTRO_FEATURE
> so this will fail for such
> systems. Maybe adding it conditionally via a systemd unit fragment
> drop-in file would be a better way to go.

But will it fail? I thought Requires= is the hard dependency, and
After= sets only the ordering, but not dependencies.

Alex

