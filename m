Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F034C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 12:07:06 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.9612.1707480421940556758
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 04:07:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZam1Bbu;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d0cd9871b3so18093061fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707480420; x=1708085220; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bK7MVUnIwxOr0sh5MuSsyR+oKbqKRuCh+JQN6tgodrY=;
        b=QZam1BbuOjQqqkzQsNhG6vtxaGGF+Ne+LqHDP5dxpiy8bsWMMYrI5d8ZRpQhjmypgd
         BwpUfVQbC2PCxoObrTqEl7GIfDEPTYhMDUErJzNByi7QmEWCBLdb+0eWUmJptL3WwpE7
         a0vUQsq4Zojcxo0WTG+oIuiK4L6A+/EGI8RALkNU2TVlJv7UmgoWMYBYEQPC9tFw29Wz
         GUtiRkxdagwku4By082DdcbgvXQAmenNJ/J+3VEjK5KtNFUg7K4jGyoHZussEAnF9aG1
         gHeJ9MoSdQKA/b2HmSbkeeDcSicstccgqy8LqOwm/84lHRuJ9jP+Tlnp0fAekVt7M5Wl
         4AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707480420; x=1708085220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bK7MVUnIwxOr0sh5MuSsyR+oKbqKRuCh+JQN6tgodrY=;
        b=k4jilo9jo/KUhZqAT1TcC9fY1PzoxLTk02oLckMACyQpUaWPChM5Jj7p1pCq6XKSgd
         rc0k3tjgOTgEbkhy2fA0KC0xvAJqKW2HcLl2g6S1VaGKFYBwmHSfWmwee8jib1sEjwFS
         kWEsCLjszENHfLWsJgJShFDy8I2zDOm9SU5i94kZdK4EmwTrgK8lSdpiOmSxK2bEEFRA
         rlwRZyK08MOG4zfTk+0pzSN5rLx1qqD37a92UxEfnEbnPdDQLd+8b0uiJVQIaQOMgke3
         Z3rW0VJiP0W0PCipMrJ8CS90MD+Xo/wcrKniApj7eZeks+QlDpXokQ4OdwHshUcwwMCp
         TXRA==
X-Gm-Message-State: AOJu0Ywvk9NBLmar4cGn4S7/pJJPL/w5JkNUsxa9cRGKPefjY+Dmif3p
	eMKSVJMDOjCl9elziBaly7ddvy5VaR/C3PMuIPTqTZMazxO2+wrdpAqCUaCziAWC3dp5VyQbEa7
	JQG4Bp8yHv5OgWpiPxGJRd/Ya380=
X-Google-Smtp-Source: AGHT+IFaBJsDoYcASzEaIZI4wmfhR1jtwrPzaRoXT9TyqlGzZJ2GoxiEhxDW9d53eLqe/boK05KxL6N5vP4aOxJHrxM=
X-Received: by 2002:a05:651c:603:b0:2d0:bda3:aa6c with SMTP id
 k3-20020a05651c060300b002d0bda3aa6cmr309343lje.13.1707480419750; Fri, 09 Feb
 2024 04:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20240209113035.3372683-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240209113035.3372683-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Feb 2024 13:06:47 +0100
Message-ID: <CANNYZj8xOso7+5Kv9Hx4=+abLmVeaKq9RiJwZwOiCu4Cz2Lg0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] no-gplv3: Add workarounds for
 update-alternatives and ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 12:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195203

I find DISTRO_FEATURES:remove = "ptest" item problematic. Ptests
dependencies do not cause trouble if license restrictions are
per-image, and I had long advocated placing the restrictions there,
and not globally like was done previously in meta-gpl2 times.

So let's clarify: is no-gplv3.inc meant for the global license
restriction, per image restriction or both?  Should we rather have two
files, where one includes the other and adds additional restrictions?

Alex

On Fri, 9 Feb 2024 at 12:30, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Document the tribal knowledge that we have to disable ptests for gplv3.
>
> Also document the workaround for update-alternatives issues with bash
> and opkg-utils.
>
> As with anything in this file, the exclusions come at a cost.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/no-gplv3.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
> index bb2e836f982..571e7f882d9 100644
> --- a/meta/conf/distro/include/no-gplv3.inc
> +++ b/meta/conf/distro/include/no-gplv3.inc
> @@ -5,6 +5,9 @@
>  # The intent is to allow some images/configurations to build, not everything. There
>  # will be a cost in reduced functionality.
>
> +# Many ptests are problematic due to bash dependencies, need to disable
> +DISTRO_FEATURES:remove = "ptest"
> +
>  # Settings for full-cmdline
>  RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
>  RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
> @@ -26,3 +29,6 @@ CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
>  # Some python-tests use bash outside of ptest
>  RDEPENDS:${PN}-tests:remove:class-target:pn-python3 = "${MLPREFIX}bash"
>  INSANE_SKIP:${PN}-tests:pn-python3 = "file-rdeps"
> +
> +# Assume opkg-utils is only for update-alternatives
> +RDEPENDS:${PN}:remove:pn-opkg-utils = "bash"
> --
> 2.40.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195200): https://lists.openembedded.org/g/openembedded-core/message/195200
> Mute This Topic: https://lists.openembedded.org/mt/104256940/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

