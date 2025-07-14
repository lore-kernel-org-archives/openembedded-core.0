Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB03C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:28:52 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.79373.1752503326537239596
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSwL5uHW;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6faf66905adso26376886d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752503325; x=1753108125; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6w4RAkpNkaUd/3UoaK9e7XoYIwyOTILOMLw6jij3dHw=;
        b=hSwL5uHWQVjzqikvvNudPIOGs6WHpUIFXBMq1nEeSEjOX/nLo63AZ0Z+2beVcd6GQb
         ZCnNBfr7zJyZxun/f3vTmmdBsXl9pmk6F7K20uGoY21k/l6IVGl6cF0Sx7ixccD2j9Eo
         8cdEIlXzlCUEjC4lIiNwxAWAqxH7a+CMXBdlg/ovms7HST4KrZ5Tni0ww9enTOZ84xJa
         wUQYOk+ukiDR0ErJ9w91BybmNqJUu0dbraX3A/dY0QtkV2f3L9k7p4WITdkEOUs5+Sg4
         slwKRGO+4jZ7thRae1McR+jkBTzjcdMze9MXCGkxiRizCBhr2Y4lAWCCwF8yVNirDbEH
         2qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503325; x=1753108125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6w4RAkpNkaUd/3UoaK9e7XoYIwyOTILOMLw6jij3dHw=;
        b=O/+Ujm7QhQr0sXGl3q7Tkgeq1KwhKCy/TSgTt3qFetIq/UK+xunukTVNoqXrFfTcfF
         SkdhXGT1pMqfP3lNCH6FQad5BYgLKDQy0o98t3IoAR81G3YdAoMy1W5R3k5EvIQNhS8e
         O18y0XiMAFG2vHiYombnfMFoLpwPVbw2D6gvZy9h7e+WmagiIbBmINRG7XiKToQp/rlv
         4s0tNUfGup7kp4d7HKidB87qhdSVgG5uN2Mbbz8NVHUvqmDlxuTKqUNpVeyfOHTQLNcO
         UMYK8UrLioH+NvSpeq8NCWPA8v9hd2MGfhmUzdrKfCs0U/5OGZ02OiiKLkaJK7d2faTq
         Wc8g==
X-Gm-Message-State: AOJu0YwU+QiGGMyQ8hFujQ6sdnX/8cmfWH0KyTrvakQdolOGxDit7wht
	/jPbZCWcSmlSJMmOd5dmov5GlyZEC+A0iPVtYC4uiKWuG55tY0y/v+v+sdPYR/QxTvkpHM+UvbY
	dizRCgpJU7kT6d1jD79IsbnZpfbhv/sU=
X-Gm-Gg: ASbGncvjE7+pXzY87YAgl3cZa2ZvLudF9dVP9zHu8oB856/tN0mBAdBLiDOlUAnaKoI
	K2oH+QEe3IMR3xSHo2weeo9txEevaKrq+cfvVN6YpC3GxCVn9P7JM2Q5Ag5iZ5D2ebou1miSiTk
	ZCywbkJHHreqHRIMx5XzWYGzvZPkleV7OtbJ2sbOmCrTfnu+x31ZUEljqeJKcApT2noFTKs81ga
	VH31sojCAQTbaLxjMFglzqWXTqYYx/Ap8epSGvt
X-Google-Smtp-Source: AGHT+IG3dh60O+ETyK0vmq5K+6yQ6W5t64p3jnEMbiSU4Qd9TgfheVPH0JxOJ2LBOhGLE/RxWI66HKfhuGTAd9p2GiQ=
X-Received: by 2002:ad4:5ded:0:b0:6fa:fbb4:6404 with SMTP id
 6a1803df08f44-704a403d024mr204492466d6.5.1752503325336; Mon, 14 Jul 2025
 07:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250711180958.tbmriqtce25kxd2q@hiagonb>
In-Reply-To: <20250711180958.tbmriqtce25kxd2q@hiagonb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Jul 2025 16:28:34 +0200
X-Gm-Features: Ac12FXyO_3HPwnsxM4RLumWg-4_pkZumAwi2l_QUwKk21UTO6dsVM5H7EfN_FWs
Message-ID: <CANNYZj_uadTj_Z77A8SvdH71CxTzptieMCU450nJ_-6w-C8yCg@mail.gmail.com>
Subject: Re: [OE-core] Circular dependency error on util-linux fstrim service
To: hiagofranco@gmail.com
Cc: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 14:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220234

On Fri, 11 Jul 2025 at 20:10, Hiago De Franco via
lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
wrote:
> Currently there is a circular dependecy error on util-linux recipe if we
> try to use fstrim.service and fstrim.timer. These files depend on
> libsystemd, therefore when you enable the systemd PACKAGECONFIG of
> util-linux the recipe breaks because systemd is also dependent on
> util-linux.
>
> I was wondering if we should create an util-linux-libuuid recipe
> equivalent for fstrim as well (util-linux-fstrim_<version>.bb ?), so we
> can get rid of this error. I am not sure if this is the correct
> approach, do anybody has any reccomendations? I will be happy to send a
> patch to fix this issue.

With a circular dependency it helps to ask the question (and consider
solutions) in both directions:
- why is A depending on B?
- why is B depending on A?

In this case, why is systemd listing *target* util-linux in DEPENDS,
which is build time? I quickly ran an experiment, and dropped that,
and systemd still builds ok. So you could investigate further
(particularly verify that installed systemd artefacts do not change,
e.g. there is no hidden floating dependency on util-linux) and propose
a patch.

Alex

