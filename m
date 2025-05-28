Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2055AC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 09:08:27 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.11434.1748423297396882866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 02:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a4R1Rzdv;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476b4c9faa2so51300631cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 02:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748423296; x=1749028096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uKN9VmFKJkoMBhnP+n5CexloGi+byP0NYAvvt01UPx8=;
        b=a4R1RzdvlO9TvQG6Lnkl9dpQyV767nC3fR60P6NaJJKxToUsygeysf3mA3Om8MdLKy
         EEWnlMQl9VY5tBXKmJYFzDNAI/JfmEJRtJNHzpF5qhiKA3pEV6RLWcINJwUmnSNGFePV
         3A3hoq6BC1hQLiAcGf26AyH6zixk0+VyGdGGSGUyXQrLB1COZaFRLqqDkY1aHSH27jFO
         1EUM8km2RQKeiAe2tovR7/cRcpeM0pOXmmQ+W5kGb6TVLKEnNf46VwUL01jdhX95FryQ
         OPHRpyodpx6Ih4N3/mBmNu4ENNkM6SKBPDgZnuXCIgNqw+3cQDNqR1VypbDQE3ijKL8E
         CqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423296; x=1749028096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKN9VmFKJkoMBhnP+n5CexloGi+byP0NYAvvt01UPx8=;
        b=cCd9mDa8Zx7RwMutc0K+OcuXFfkqH+G0ZR9ieaiawSNc6uULO5NHpndWIpaNpKKuUy
         wCZHNajGA7gvo6VVgmpXDsgRAI8D872TpQ4U2Elw3HYAoMY5JTeD89ATipQycVaqDspt
         Iry7qif4nUox6hD8NTMOfTesM/AkhZ9fqTvL7+Ue1htMNTfQVcx5LB/NkoDV5cqsBxSP
         7EvwP86tyi8sCQuHXbeB519jJgaY3LvmTc+vVoS1ia2EEkt/34uX8SAvuo50e1Ze2HuW
         UeRsmCekT05Y0VcbwKifwrzlGaGFZyyzSuzNgY0CsOrvIb+US3UIGRa4sPWmTKFs/b5X
         ckbw==
X-Gm-Message-State: AOJu0YzGkeXdqIY7FKVPS2/MlO/boKsunNxQbVohqivSljdZmq7ng7bt
	1JWSRnyYBP1bxMwWA2Vf/Li71yjV8uqx2ug/WsCV1Nbj8uZ6fYGLDxwrCnjqoCku2Y2+6Zjs9FG
	chyQiKGyevJtnjY7GJtG5PCugnbk0Ha5y+KBk
X-Gm-Gg: ASbGncs/Ke6britplhiztsp1rO9FoOxScAJTJ/kopCk4zGe1pZ5jRiRdMtkh5XvA1X+
	hur1e7L0panmsHxl2sSY6hAmbZ25adR2dUNwU8yDqnJQgkgGn0vR+1vzS+f1/1rv2GNl3R2ibON
	Y+PpBgb8CBvQHR3GDFCDjc+r8kZrC6sXoVGuKiWDSmwoe8VahR2DLQ4RK7XYVLkV6qBTQ=
X-Google-Smtp-Source: AGHT+IHegEQw5OzmdnVIkQvD7bC2bwUZcgcqpKKPczMFLZQcaJT5IFi5eNEE3m4FIJgyhNza6eDBu70/S0pynvF+kcs=
X-Received: by 2002:a05:6214:50e:b0:6fa:bb74:8d72 with SMTP id
 6a1803df08f44-6fabb749064mr32208836d6.0.1748423285962; Wed, 28 May 2025
 02:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250528035625.1262266-1-patrick@stwcx.xyz>
In-Reply-To: <20250528035625.1262266-1-patrick@stwcx.xyz>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 May 2025 11:07:54 +0200
X-Gm-Features: AX0GCFsF0z8rMQXfDeqLUI5DL8lhJx5-2O5wB-TkC1Lwy1W4BjQq1a_OFnZ4PMU
Message-ID: <CANNYZj_5Wbvx0p54pqvnpHuOAX+nhpQenZKzn1YEduDs=tf2ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: fix postinst for real systemd-systemctl-native
To: patrick@stwcx.xyz
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 09:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217340

On Wed, 28 May 2025 at 05:56, Patrick Williams via
lists.openembedded.org <patrick=stwcx.xyz@lists.openembedded.org>
wrote:
> The commit 7a580800db39 switched from a small Python implementation
> of `systemctl` to using the real systemctl executable from the
> systemd package.  In the systemd.bbclass, systemd-systemctl-native
> is used to default-enable services, based on the SYSTEMD_SERVICES
> variable, but this was only done if `systemctl` can be executed
> without error.  The problem is that the real systemctl executable
> treats a zero argument call as if `systemctl list-units` were ran.
> This cannot be done when cross-compiling and yields:
>
> ```
>     Failed to connect to system scope bus via local transport: Operation
>     not permitted (consider using --machine=<user>@.host --user to
>     connect to bus of other user)
> ```
>
> The end result is that the `systemd_postinst` effectively turns into
> a silent no-op and services are not correctly enabled.
>
> Switch the systemd.bbclass to use `systemctl --help` instead, which
> does not require any dbus access to be functional.
>
> Fixes: 7a580800db39 ("systemd: Build the systemctl executable")

I don't disagree with the patch, but I have to ask, why isn't this
causing failures in our testing? There are images built using native
systemctl, they contain services, and they do not produce fails on
boot. There has to be a gap in testing somewhere, or systemctl somehow
manages to do what it's supposed to.

Can you set up poky-altcfg qemux86-64 on master, build
core-image-weston and core-image-sato-sdk, and check what is
happening? (e.g. by booting them in with runqemu).

Alex

