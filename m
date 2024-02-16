Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA84C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 14:04:40 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.19424.1708092274196230190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 06:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZZM9Byo;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d1094b5568so27754581fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708092272; x=1708697072; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k445R96OPFqA2+SzmcQX92zHgElMB7+W1gXgKSjZGGE=;
        b=FZZM9ByoihT10JA6O3efQGvW8kyQg0gEmvLCRY77ntTZ85lIcNYWKNzixvVIKKoEyQ
         2Ts/GCCbQDDNJxp6I9LBU2vhVtnTcyJ4L0RWF9DG/QICcEsr2YguGEX9xe4uIP4tFzcI
         /z/lC5ZJkr4d1uMf60lZAhk7p/aFRroD8Svy2qWM2h0tFND+M7NVskDBTJ/bco8OsHxW
         xTcP4ZOui7CzyzME/yq2thzKH9dBsth8eJ1BFLhg9cbZbBbeENcDznCGbELvA8AzA/yr
         pADAJbQto2Pt1xVWSHQ4QsAedTSSi6A5IynM9Shqg9jtq01581RxLhEEyDZZeZXhkWG9
         quhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708092272; x=1708697072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k445R96OPFqA2+SzmcQX92zHgElMB7+W1gXgKSjZGGE=;
        b=u9GO9GG9/vLIEf910kRbLt4J00A/i/ewb/5m5V6bad6fAOmytjjD8i7MDrqXXVf/nD
         Q45KjNPzKPbmJUJDwgebrWxTf6I9DSmPHJB+MrpgBg7uxNAXaCPMoTtcDgWLQs1Cb6UW
         DA4VkSvLz8i2Oj3IlmifpVRrUuJ2yTA5NJl69az+wa2qF9FdXKs1QK3hYhHHh1DNzYyx
         mgdsAKxUqZ3lWMcetuJutjs8dlO+M59tpGbVpmPC4SX9rn2isN/ZnAdkf4hQLEuLHt4f
         53fJZBlVxp6eTprcme36HApAr0JCvfBWX/5mdp+tM/RuW0CqqNjpn9Kmz+GiFwjXGiDq
         pz6A==
X-Forwarded-Encrypted: i=1; AJvYcCUP9CyeN1cnLRIR2gEi1ZotaT6offjfzMaxe13BJ6nGMHucTcrz9sy3eKt4qhE0cBWJSlCYxXTjy4nxnQWojP7QMyNJeF0JDz1Tay69d252vUB5mDW/pf9d
X-Gm-Message-State: AOJu0YxBDed2kfj4IpYyy/zq+A+g6yQcdwUizvoR22+3CZ53XGRjb3XU
	+PkgEL89GqKteb28RE/bbBkiLIFZYrpiGJMoadyvhXjRnJiKLwazUJbEe3pozMNnyFxW539uKIp
	VAVdMKuHULD6jGk4tc8hd4Gt5ygg9R8/0
X-Google-Smtp-Source: AGHT+IEwNgQI6g6Zn4DdFlaAk5KwT8n8OuCdDLfh3yoTazy1Z7xAndOVsHpfE/FvE3KsRumPe/NzUD5/1hwuYN5eo4w=
X-Received: by 2002:a2e:9cd5:0:b0:2d0:e36a:6424 with SMTP id
 g21-20020a2e9cd5000000b002d0e36a6424mr3569514ljj.35.1708092272136; Fri, 16
 Feb 2024 06:04:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8YQoMdR=qKDHPYVUo7jKhRDEjS3Ah6EDccsbdwgmm+Vw@mail.gmail.com>
 <007c20be5b61da1d7752835a3f4775368a76bd97.camel@linuxfoundation.org>
 <CANPvuRmpF1m_TCQPotoNLUQUoW6FHJxEJsDnvBGr4docaCgK3A@mail.gmail.com> <b8e60d2febe6c9369da2f5b9923b4afc6f69e47d.camel@linuxfoundation.org>
In-Reply-To: <b8e60d2febe6c9369da2f5b9923b4afc6f69e47d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Feb 2024 15:04:20 +0100
Message-ID: <CANNYZj-PyrNwg=MDKuHFr0Og8k8nbboOqmAVeJSANeVe5Ku99w@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 13 February 2024 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Stephen Jolley <sjolley.yp.pm@gmail.com>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195772

On Fri, 16 Feb 2024 at 14:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Whilst I agree that would be nice, I have no knowledge in that area, no
> available time and nobody else seems to have that either. Not sure what
> we can do in that case :(

I'd hope pressure on product-making users to do this update can happen
'naturally' as outdated version becomes a blocker to shipping products
:) The tricky part is to not fall too far behind though.

Alex

