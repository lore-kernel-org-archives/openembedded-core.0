Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5B3C369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 11:46:30 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.23063.1744369000333418573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LsqGilge;
 spf=pass (domain: linaro.org, ip: 209.85.219.170, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so1513920276.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744368999; x=1744973799; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BukXVdZ/hjb5AHVGoOnY+zTxra1yAk2t9d6tWiKOLe0=;
        b=LsqGilgesppVkTpOBTX9uvzJ9Gb5Dz5LsSd5VJ2eWlgk84hTkuKXFsoRDv28dW2IYi
         NaGPiN9CLLXfW4VL+CMHYP8zJAlUk5n8qewbWk5q3iW7KDgRZTkdTlosz8tN7iZUtWTr
         GgZkW8PujjEAvEea10h3GXxUHXeE6gvd6zXVmU46kVnnlfDbNCtW5rHY/eXt8snmT32N
         TKNYZW30ANc1J3lyJXroLtRSjfHd9jksG0BDVL+uu9B7prkd2qkytADBZMiNaxdTViRx
         ehaahMhGMgw/9O4sxJliDJMxT4iTJMS6I+dDtjwdzeGmeeMXDQlS4Jvd8ZoAksg607hu
         tGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368999; x=1744973799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BukXVdZ/hjb5AHVGoOnY+zTxra1yAk2t9d6tWiKOLe0=;
        b=wysnzVgkOfDTZo9kJtZFZ8cXQTZgBoGyWteMNhkKUxspmGDk9HT4LPcsz0/iMfcPGa
         ok9UZBvHlNrgn7FpgOajfg30TTUo/yfGPedw4KClRO/bWrIuHA2BbNFRgZr2At8yiXXA
         EcXgJyJelvLpybEdOnIF0rZ02zWah/suTFqTwbbd5VxRL8Of/giuFSMgeq4G5RBil1Mk
         dhMRJfhxow8ztFNE4jEPEadwQpZqxDhq2MGscX8ga24/5gSdSCNYBIZ63bJjxUilMLLb
         x/us551/OnaJXacz8fgAuD2P2r3R+o7c6bQuStU/Uiab+AHeMwMSF9QSvvR1lNc7s8A4
         O68w==
X-Forwarded-Encrypted: i=1; AJvYcCXhqOUV6FoJmC3kCNoU9EE8pNhfcQf669upmK2vzMM+2INcLo6pN9RT+D7HHmqZS5vr0PIy2T+kmna33usn6feTxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzL6MeKZSZm6KnAfe/Ac3xb5DZgfNItTaAsPbcvrkASKkhZWqQn
	IxFRwYNeWikl9WB5wskJKtty5iV4XrJEJlbH2dOqJStmCV2X04eCSPy0Mb/P9FSpilMPVRa2v6d
	lWKVKGb45fK2fmcYxIqG3i5n8mQ9mSDhVPyGZ6Q==
X-Gm-Gg: ASbGncsSPTgqt9C4asiXFlWFVnEC8CCPg+Ro42BfwOGZRFbqspM5sHLblcA1uk7IJ5V
	aA4lH9YiGS7zlUn45s+O/pz9H+DjpIMaS/TfnFTHQpqLdOO+7mIHETBRULwCoLe2x2575x0+yQm
	Uyj9NJUqloSVQOlLxmK1JjAfY6e+dyhTVFAQ==
X-Google-Smtp-Source: AGHT+IHcb5sw+Yfu9aOG4KPAFZO8fGSUcmHI/suwZUieCroRMuALs2vy3YgEYPgxxX8EvFt0th9om55Z/P5hok/u4YA=
X-Received: by 2002:a05:6902:4893:b0:e62:d12f:1526 with SMTP id
 3f1490d57ef6-e704df6e577mr3758640276.48.1744368999519; Fri, 11 Apr 2025
 03:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
 <CANNYZj-ORUDVcfGMBUczC-CQ1LwFZiS=6qToSCZUH2WCVqxGbA@mail.gmail.com>
 <CAC_iWjKWLoWc3UE0pyvsq9U70xMGaDeWL0NdUsoPm+jvByri4A@mail.gmail.com> <CANNYZj87jO6=GrJ+1WTYEZP-LB=2602Pe+oG2xd0+LQXnQR0TQ@mail.gmail.com>
In-Reply-To: <CANNYZj87jO6=GrJ+1WTYEZP-LB=2602Pe+oG2xd0+LQXnQR0TQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 11 Apr 2025 13:56:03 +0300
X-Gm-Features: ATxdqUH0_M64F3znKKGMy_4_eDGSHjayk1hc0q3EVpJmvsgbMTxq_YQRdu_5GJQ
Message-ID: <CAC_iWjLrhcj2WYwWoyG7dC4D-jWzG5=1_42MPfAyisOJJ3=-0Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: adrian.freihofer@gmail.com, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 11:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214735

On Thu, 10 Apr 2025 at 22:19, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 10 Apr 2025 at 19:48, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> > > But none of the last few messages answer my question. Can I restate it?
> > > Is there a physical board that can boot from ESP formatted to something else than FAT?
>
> > Why? The answer basically says that every board with u-boot or EDKII can
>
> What I'm trying to get to is this: there's no working example (in the
> shape of yocto BSP layer for instance) or evidence of anyone having
> actually done it, ever. If you look at wic's bootimg-efi plugin, it
> hardcodes vfat as partition type with no option for anything else. And
> this is then used throughout meta-intel and meta-arm wks files, and
> likely copied and tweaked into countless other layers. So it is not
> exactly reassuring to hear 'but look at the zoo of filesystems that
> u-boot supports'.

All of what you mention here seem to be OE limitations which can be
easily fixed. But that's still completely orthogonal to the current
patchset. I don't see how enabling EFI automatically forces you to
swap around your entire boot or firmware update strategy.

>
> If I have a board in front of me (for instance, this Thinkpad X13
> laptop from 2021 that I'm typing on right now), can I find out what it
> can boot from? How?

Without extra information on how that firmware was compiled or what it
was compiled to support I can't answer that. The easiest thing to do
is check if you can load something from a !FAT filesystem from the
firmware.
/Ilias
>
> Alex

