Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37414C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 12:09:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.39714.1708344567560129028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 04:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GlFC4fG+;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512a85806fcso1640076e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 04:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708344566; x=1708949366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhlt3IAdT6wsrxbKqXj6myIUkAXDQhIZ/hRzkBzDfO4=;
        b=GlFC4fG+PQN8YWdm+t+GqMz7PSKYFXHyOC6icZmo/eZESFXJ2SdjGQeqeol1uJ7DOY
         7ik36w+nHlR/thsvP4iJgmuEJcrxNHqvrN6PybXfDwKtVyMOiotYnKDRLiEUleqrBT/E
         UbwU2PaAGqnrKz+VZaYp4mhrcm9zqX5zr7ghy5a1JuGsy+27NKaCXpJ0xxySP4+Y/7nO
         nAKBmPBxScvAmZ/HD78QMYOOb60jl1f32IzhMnBx6wkFQUSrGCXEbAFBwEDyzoh2kYht
         5+rH4DW8yDVJFCou0FEdfxuJrtbssSn8ahxfCuZ58+6byOaz8nf0xglLXx6ZEAPp3aBL
         I5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344566; x=1708949366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhlt3IAdT6wsrxbKqXj6myIUkAXDQhIZ/hRzkBzDfO4=;
        b=rsHHDBtdqEMiojo2xkJICSSiDEbW5NT6w0NMFJIqije/5OdJ9x/wkiHdfHMEKK9vys
         mtITjYS815wh+HqqvlYRQ2MOR3plDN3ND8YtANOMrH+hBcwXP04k8tmowRry7IwyCCD2
         vaHR4rS+YYGjTFTW13aRLa4mWjNQc4KJbGmABppJ4Jrdg3Nb7GTbBEfAo8eHk7HdNGb0
         K00OYnJmdqsfr1TH2ZpkMhCxY1V6G8SxBvJFSs8+6aZyyELwVL/UAoRKFHtvUgcqZUw3
         syzTtYDEtYmr6TSnWtCVYFuX6xalppxS4FiNa3xf4C+FeUjSV/wu4Iedb6sfaPPteh5f
         ybPw==
X-Forwarded-Encrypted: i=1; AJvYcCUtTxjBMZWVstjqA16ENN2KCOOGkX9m+weQZ3a4VGzJhK4w5KfYPejoNwVwez+OgDd8ESFfGMfwNYpc5Zp8ucheDS+preuv/5lD3yzLjk4teMNq0X8UpXcX
X-Gm-Message-State: AOJu0YzPNGs4NoqJovriOxwCMUADCjKhnayKWA7CUpJtXHqyBRwSXEKJ
	IPUXONk1AN0FgV0hbRRQfEcgw9xUQ3Kp1ev5AJexflpLXIt/pQKfNoIJiISrYz9LNmaiKbh5icr
	TSiLMdRRHTcyYpuZXLBkYjVxc47Q=
X-Google-Smtp-Source: AGHT+IEzZhXsakMW4DleKYNM4iGFbu5p+kkV2244/kbjaK6YPgygx4MpfguDouMTsjIe7fTk/6frGciCbg3PTVzUqqU=
X-Received: by 2002:ac2:4433:0:b0:512:b915:3b18 with SMTP id
 w19-20020ac24433000000b00512b9153b18mr924818lfl.52.1708344565383; Mon, 19 Feb
 2024 04:09:25 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8YQoMdR=qKDHPYVUo7jKhRDEjS3Ah6EDccsbdwgmm+Vw@mail.gmail.com>
 <007c20be5b61da1d7752835a3f4775368a76bd97.camel@linuxfoundation.org>
In-Reply-To: <007c20be5b61da1d7752835a3f4775368a76bd97.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Feb 2024 13:09:13 +0100
Message-ID: <CANNYZj8kKYN101ednHKda0n4MF6tGqK_PcjD4Q4VhN5_ui3WDA@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 13 February 2024 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Stephen Jolley <sjolley.yp.pm@gmail.com>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 12:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195870

On Fri, 16 Feb 2024 at 12:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm sure there are some things I'm forgetting too.
>
> Please let me know ASAP if there is anything else pending.
>
> The good news is that several problematic issues do seem to be finding
> resolutions in the last 48h.

Last week I got the build replicator script and several supplementary
fixes to the point where they do what they're meant to, and they have
tests:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/sstate-for-all

Locally it's all working fine, including oe-selftest, but the same
oe-selftest on the AB is failing. Depending on how fast I can fix
this, and how many other issues there are in preparing for LTS, it'll
probably be delayed to after that. I'm ok with that, although I wish
the feature would be a part of that.

Alex

