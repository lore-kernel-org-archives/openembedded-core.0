Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50656C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:39:48 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.32635.1741772382596367127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 02:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqeNtSF3;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8fce04655so48348286d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 02:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741772381; x=1742377181; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bKI5n7mD7yLxuELm0iZ6UXeI6QucopHPMMBiAtnbw5A=;
        b=LqeNtSF3ctFMIbr9gFBXp7F00tMTZ92uDDMF6cMpKGeAEs3L0YjgtujEWjvTnKUgw6
         B73ZxkuqdPm3AuFF3Wfcehv5zBEfrYTH2XmD5RY5FYfYqeHvJWPNqlU5yaLab0GsB5Bx
         kmHQwDAsnLHBGFmr6RKvZcFgKlQHuYd49xSau9EtVhtfH+NFvxNBaMF3VMME55Yn/lZq
         gwnQctfki/iQXUrsrq94KlHpGmqxHoRR+aqyCsPzmeXMF0KmnaYE+ylNlsQ3uBWnBb+O
         I17qLfElZ+iIgNQn6aSyqEW4mdfeHDZ8qfnTC+YwKlWERLVySO9iauxKXTjbse0CMe8P
         fYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741772381; x=1742377181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKI5n7mD7yLxuELm0iZ6UXeI6QucopHPMMBiAtnbw5A=;
        b=qsuFiiqZ0barpGw5sEVK06ZjKM/LRAX+pcrlJzKSnsGztrHsyWxAqkuXAG32dapBbT
         bZPTAYEH28Y8B536RuL3CTv5zlAMuqzblaGfelDrbGnkI+Mnow+rO2uqf/J+PDnbyaBI
         L21seCKlHjYwFB3FgS02pJsoaN0boclsALsJcs85lAbt1xNL0SrlSYZmf3Rf8hvW7U3e
         Ns5tusAG9bsRwXHnRueK0xAYLt30GXa1zzyvDzOKpka2dGYct3fdgJAOVIMeq1DtXm1x
         wrcod3SqTdywJOL4jmeOMbv6BJCVPres4Ae41nBSNFRtPNYtqIAYJQt46P9WNVQT0hiH
         2TYg==
X-Forwarded-Encrypted: i=1; AJvYcCUeTnW08Yz9IDIXt6F6Cj9UfMri2BHxwZl6zGaaO0i1MMHWLXlHMnnpdCZKb8LmNZQg2dh5okfe6+T5tO8PIptAhA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXj9jGRuOFHBedq7dXmrDl/17ZfB4LhhLvGL9Zfb2Hq1+OaAln
	2MORRHHkutthO3s13p/zpD6hREswSvF3jtQ/DBhsxqKLF/FdFTL+6E4MzWeQyDi5HiLOE03fHF3
	C3gJQ+fUCxU66ywecmOvUrhnUs00=
X-Gm-Gg: ASbGncsUTAzarjWMf6yOeVmUbwGMWnBhOKXTYLz3qIVXKCttxN5YrwDxgwrTF/toUmV
	06dMxCKuPVH1d1O3pA+dd271ba5JgByC/xUCHXD5UFq9NPwwd3vka0/37yhaA3nZynYAlD8kuGE
	fR2g33IJk9bEcUC+QHOONHo+LTYbityoDy+b41z6ZIYQKnEHufRfOfAQx4M6uF
X-Google-Smtp-Source: AGHT+IHv0sS9NCp6P9DC/p+bxFQxD3wNVUYxv2H+TjMSMZ41NpwKxmTfEJutnqn9qFm/Sw+E5S0qW90D5x2yS99ZlzY=
X-Received: by 2002:a05:6214:262d:b0:6e8:e828:8215 with SMTP id
 6a1803df08f44-6ea3a696ca6mr86184286d6.30.1741772381633; Wed, 12 Mar 2025
 02:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <40fd57cb-deaa-480c-8ec6-87ca1a55e21d@ti.com>
In-Reply-To: <40fd57cb-deaa-480c-8ec6-87ca1a55e21d@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Mar 2025 10:39:29 +0100
X-Gm-Features: AQ5f1Jr2aJpcY3uBILRLueDmltDhxOcundvdv6ZdKXyVTXKsN6x4FXEOXz9Y244
Message-ID: <CANNYZj_p96AQaaPqW52m_gCKGrPqxKWmC3t2TOrPnmKP6A+Kcg@mail.gmail.com>
Subject: Re: [oe-core][RFC] Display manager proposal for x11 and wayland
To: rs@ti.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com, 
	alex@linutronix.de, otavio@ossystems.com.br, kexin.hao@windriver.com, 
	Andrew Davis <afd@ti.com>, Darren Etheridge <detheridge@ti.com>, Denys Dmytriyenko <denis@denix.org>, 
	Ryan Eatmon <reatmon@ti.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Pothukuchi, Vijay" <vijayp@ti.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 09:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212640

I have a couple of concerns:

- can this event handling be achieved simply by using udevadm which is
available in any init system?

- who is the author? What if they abandon the component? We've been
reluctant to insert core graphical dependencies (e.g. more interesting
compositors than weston) on not widely used things with unclear origin
and support promise.

- can you produce a patchset that showcases the benefits?

Alex

On Wed, 12 Mar 2025 at 01:46, Randolph Sapp via lists.openembedded.org
<rs=ti.com@lists.openembedded.org> wrote:
>
> We've recently run into some issues with weston-init attempting to start
> Weston prior to all drm devices being registered. There's not really a
> good, scriptable mechanism to listen in to device registration events
> that works with the existing weston-init package. Well, at least one
> that doesn't involve polling files or introducing more dependency on the
> init system being used.
>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the
> same issue.
>
> I'd like to introduce the following display manager for oe-core, emptty
> [1]. This display manager is, as described upstream, a "Dead simple CLI
> Display Manager on TTY". It supports both x11 and wayland sessions, with
> togglable build parameters to completely remove x11 and pam
> dependencies. It's licensed MIT, which shouldn't be an issue for any
> users. (It is written in Go, if you have opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be
> re-tuned to leverage this display manager and simply add a user and
> emptty config for an autologin session. This can resolve the current
> behavior across init systems without additional scripting, and move some
> development out of this layer.
>
> I already have a recipe for emptty, but I figured I would reach out for
> comment to recent contributors before I submit any patches playing with
> the existing init packages.
>
> [1] https://github.com/tvrzna/emptty
>
> - Randolph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212636): https://lists.openembedded.org/g/openembedded-core/message/212636
> Mute This Topic: https://lists.openembedded.org/mt/111652153/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

