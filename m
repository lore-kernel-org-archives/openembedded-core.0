Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79C6FED3E5
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:19:39 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24823.1777043971000445773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 08:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h8BBFqK7;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8acb550db18so83715126d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777043970; cv=none;
        d=google.com; s=arc-20240605;
        b=c2LsBimcNDSu1T79qehvQwhXd5l1xD4AOdWZtbATfZeAOZ/FtZre9q6L74dOWDOOqv
         7ySbv/C2TNcbRfKml5mSwjZTpdjCytHZoJ6nraWze2Ves0or4PsPiCVpih5rl+PG19To
         MRnExOiTTtLMXBjMbV5r2JY34OLaaVv3pxbWaIFRVp/XCil9+wQuKCAPjBdj0811opIG
         YTOKuXUGytw9+WZpd1Tc7KW964A6BiW6V98CJt6Dtwpfp/3j5f0RZC7QNAg2MuefwMGw
         1zxs/xmAXGL4cCbGeWWn80mvWFKF5RLWDSf9kujyZtzYanzDYeUJQkfc2HHC9EqDwHfC
         +lIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m6CaUaqBAowGz5XN4Auaf6u8zGDj08mg8Xl9G72IWcc=;
        fh=N0upAYIiDVqGfj5GUfc6e4DBLv/4Q3r1ndLH3rRtA2Q=;
        b=UyApPG8kl32O9dRVZaR2KxoN9QlvjYYdreK59YFcl5t9A+9XRLXtJ9mw1ebDCsbBVS
         egkKmQej+UQ7a6M5jFJLJ36TCp+K3Gnxali9+GAeJ2HlL6y7lcljhtWOHjFXP8xAVK1N
         OIMRcegNnPCcsMdcI3sp4lf9qb9oDfjc60KrSHd7HV6Od92j0ZTZocaTDKnZJl1bxmhq
         YicDfUtcqkmjd40J2ssEWKB+HFTspithFSb/1VxRm9wQ/sWHT7hy2hKlvsiA6bEIsky6
         G3WqY4y4lAe6VXn1TLiYHIaS4EwrsZ2+z4mtXZifZarRa//i2GnZjXZz2Z4jLreFGtOb
         AhVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777043970; x=1777648770; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6CaUaqBAowGz5XN4Auaf6u8zGDj08mg8Xl9G72IWcc=;
        b=h8BBFqK7tOy4zqw4Z4o5FRc7N+4OyRIkZ4ui7S89+tAE/zOPfxjIFOeMCXBcJ0Y19M
         FY8EjXxmCraPfWGTr23IeSZkRei/Xz0XX6QJ7p+6Fo9PXUJIXaoj2wfdy+KUkV2iaQiN
         PFvvB/mljPvdP1jc06vDGrw1go8N3b9TgUeCrazs6J2CJTgFhluyEfvaPGRql7cOEuRi
         HtnELidmMqukeqSMFpJP4GYWlcp13IP0LIQn2XQloEP/d/jNuFkWjB57d+5grfssbPVV
         c9q01oVeV7vFjZCljgiddLSr1541EEJWYWqUS4bbtMJyB9jHGIsq7mdO95lKexjlY2+6
         EnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043970; x=1777648770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6CaUaqBAowGz5XN4Auaf6u8zGDj08mg8Xl9G72IWcc=;
        b=f64VvbvES+uhAWM2G5yA9XPH3zkXZ9T5I6lPiohXGesz77ypRbHTwQDbsok1lshFG4
         SgCvggJqG7UdxcywxKjhE0bjPrOhYStO7dZnYPxKHH15iE6GTUNSt5nl7DgEtai/AHXT
         cac32gL2T6jSB1PKjTMAyPWTk8ZH8KT2ZtgmUGHgw4Vjgcewt6qljSq9M/Fl9F1ZRU+p
         Qk/zUFEN/m/phXB5QSALS9bcuKgNyh5wRV6YUkFjugfA5ML1F1/AoWG8PslVT2PELlt5
         dQ1NQg1uYGuSEd8TFmzbBIM2bJzSSlBZYQ87Le2vIgO9Jvg1eyFDsU9ycvGcLcjakDUW
         DfHA==
X-Gm-Message-State: AOJu0Yw+X85X41dNBhzGiiiatk+Z/MXPdmgwS4Wea7jhzsRdz8QwG5eM
	0AVsMvPedAu7DV/WmzzfAjOpacH1FyLZdZ5N9whAAXAKbJSs4BQNXYjkQ9ghALpg1rOMPHQn3FC
	IqblYSs7oYYUG+xUiaq8/rWY/Gs0P4kQ=
X-Gm-Gg: AeBDievDTjT+lpQ6L8s3Hhvmdi58eYhOR72MxSbYcq6+02cXYAtU2qGvVr3TXnTa+tD
	1wAUsdjmZb4ZknBdcIWQgJSQpAGUP2NkMfdx8OXrRmg1/6msdE5D7LSEkXaPJi44wV2vcL3rroy
	3CyETUkmSVPFOhFJnlSs3N5fUaqrCZDNu6ywxS5AXavX7kKzfR0cjN5sXXHptPXxBAES2UfXBvl
	/jvUx6mMg7tckcXEVlWoDbAluK1RNsgP241BYLOGA5s9xhNAMzn+PaIqbv7/aKgDdPilqWN1pNV
	LvACmEjGoRk5Ylk27obHVDdvciT5uARMxp3hwAkdDjsL0PuxYjOV
X-Received: by 2002:a05:6214:4703:b0:89c:8709:d238 with SMTP id
 6a1803df08f44-8b02816d232mr429708546d6.40.1777043969922; Fri, 24 Apr 2026
 08:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <711678500.248994.1777008574252@app.mailbox.org>
In-Reply-To: <711678500.248994.1777008574252@app.mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Apr 2026 17:19:17 +0200
X-Gm-Features: AQROBzDS-hQdCaIVX7d7h8UdwaIfY0jhq6LPMdjKuT85h28AErtDP44my8Lr6TE
Message-ID: <CANNYZj-O2OXqe4JnHhnP1D9ETtmWgwPt+D-hJ+YQ=XheMietYw@mail.gmail.com>
Subject: Re: [OE-core] DPKG Issue - guidance neede
To: patrick.vogelaar.dev@mailbox.org
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235869

You need to explain why the directory has permissions that don't allow
you to access it. What is the workflow that causes this? Typically
anything in a build directory is built by the user themselves, and
taking a build from another user and reusing it is not supported.
Sstate cache is the correct mechanism to share build output.

Alex

On Fri, 24 Apr 2026 at 07:29, Patrick Vogelaar via
lists.openembedded.org
<patrick.vogelaar.dev=mailbox.org@lists.openembedded.org> wrote:
>
> Hi all,
>
> we are building a custom distribution and are using a shared sstate cache. Now we discovered an edge case where it causes problems if parts of the CIs build path exist but is not accessible due to permissions.
>
> Build path CI: /var/jenkins_home/.../build
>
> If now on my local machine the directory /var/jenkins_home exists but is not accessible due to permissions the build fails in do_rootfs with:
> dpkg: error: error opening configuration directory '/var/jenkins_home/.../build/tmp/.../recipe-sysroot-native/etc/dpkg/dpkg.cfg.d': Permission denied
>
> If this directory does not exist dpkg fails silent and there is no problem at all. But if it cannot access it because of permissions it throws an error.
>
> What would the workflow now be?
> Provide a patch to the dpkg project and also add the patch to the recipe? or something else?
> Should I create a bugzilla issue?
> ...
>
> Would be great to get some support on the typical next steps.
>
> Thanks for the guidance
> Patrick
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235836): https://lists.openembedded.org/g/openembedded-core/message/235836
> Mute This Topic: https://lists.openembedded.org/mt/118983534/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

