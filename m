Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76783C7115B
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 05:14:00 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.1449.1750914836834386446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 22:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGl+KkOF;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fada2dd785so9436736d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 22:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750914836; x=1751519636; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZggoKJLE/bZGOhR0zkUPBELvN7ktEUEGYg8kG+TYvA=;
        b=NGl+KkOFH1RtEPItZyCxRZWqVZXgddM3myTs9i/EkLqiyVCotayQ77oPXBifjIZJpI
         wXpder51/XZOz91Yhx8meLS6k0qe8dNc9IKXbko3cEcjJK1PqfBZsoFP99vrkSE9SubE
         kRUV/SzqZrpWNCJpWqLERHH9+I2t/13bi1QoZeUQOwwtGA2JylAXurYi465k/CJRbfuE
         N+jwh8pHG27QEkG1jtM1u67vf/k2RcbmgBoCuN6XfI0LaBK0nHVFglxESAXoxBt+wjHW
         R+ki037bNdOyhFJ1buMU7wxgSAk0hlgSasWRb5iRv3mMs2xdD011G7wZHk3gR2/KteC2
         gj7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750914836; x=1751519636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZggoKJLE/bZGOhR0zkUPBELvN7ktEUEGYg8kG+TYvA=;
        b=utb0OE6z4UK+gIVGLFsC+7f5F7tXbQcca9XTULHyBWdsr6aYfW9JyjTf4TaJf8BORZ
         XOKryRoRGnNI+QRy+ujsSM0g2dP9BYwqdmh1U4oXsQaC/xzoH2xVpTqvo3tHrWTKPocB
         x/5WnA5UC/EqSZhgkLN0THwPJTQsKtDv+nEYMh9IOnaQa6O6mVvCRU3xXGL/UeljtkRR
         4O0PEbTCqFgRr6YBTmd5pKGqQyBu98wL7UFjWj0glZnInp85D9G/qJpfcH4YCGV0VF9o
         RuDJAjZw0EkowycbPnBqZTbulcjEj4LL3VXeiA9MIICAxABeAWzQ02LCHtMV+mFTGF9n
         7duw==
X-Gm-Message-State: AOJu0YyimYaJguKiFuQIIxRpP0WCsJSRmnd49Rxcp6uEwj5zULB0lRRF
	m5YYaAa9OX/rOplEKx5bsEajDBRXShlsPiNT/FYwHjVNPLKOEu9qA1InLQY8E+349u1ZMhflRz9
	KqHxqovx0zzc8yWF1Ae7SraTd0g8dCHo=
X-Gm-Gg: ASbGncujbL+AuYWcewdO07ZuZQOg2OndfUwbAnh3cb2uDIViz6j8BMrUjpWixk6FoHa
	fO5JK9BzljAPlcw/gKGkQZcZoQKas/A/P5meAL8e2rfK2Lqqu15gi+JkD6GeDAp8EHhpJ1A9sBC
	RnPSsNS5dzYiK1mTv3Q41z2/Q2bH/VmUfGI56Vyb/2bvpz9uyqdBrvakIR5tpji4EKrKhu+tG5u
	bl67w==
X-Google-Smtp-Source: AGHT+IH4Sc9kIcT3HSuiFM2vMERs3nSA15htmBR0Nd91+1KA64e1i5ZWDzySUtwgdMGZZgJejVQBX7roRGXBDNanwnM=
X-Received: by 2002:a05:6214:5b83:b0:6fd:151:a58b with SMTP id
 6a1803df08f44-6fd5ef45623mr111120926d6.18.1750914835754; Wed, 25 Jun 2025
 22:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250626002130.791664-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250626002130.791664-1-Randy.MacLeod@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jun 2025 07:13:44 +0200
X-Gm-Features: Ac12FXx59WjHJ1YjochMFJMzK434pvNE530E-ceOXvwqInZVDfXKHUS01Src6HM
Message-ID: <CANNYZj_YaUGy9ZXN+MpH-X2v0ZORT2eonYAnDVxxpkKmbyUGXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ninja: upgrade 1.12.1 -> 1.13.0
To: randy.macleod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 05:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219337

On Thu, 26 Jun 2025 at 02:21, Randy MacLeod via lists.openembedded.org
<randy.macleod=windriver.com@lists.openembedded.org> wrote:
> -SRCREV = "2daa09ba270b0a43e1929d29b073348aa985dfaa"
> +SRCREV = "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
>
>  SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https"

tag=... should be added here at the same time.

Alex

