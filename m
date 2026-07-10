Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DB9C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 11:01:28 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10167.1783681283343869110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 04:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tLaBBtI4;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7ff05e5d009so8786867b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 04:01:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783681282; cv=none;
        d=google.com; s=arc-20260327;
        b=l1T5px3zBDFpX2OcvqaYeIWhJYJ2Br9qLS+KrAgmFU2QrdR1bPu6Dh69Al5Yy36pdF
         7Zxsa45eAxTjclz4KMmcjYjTzHyx5e8N/D3jRFqoI1mj0cKNQ5cnTnNy8G7poCU6q08q
         NlbhqcpTuRKE0c1NxeEOMVjSK44ERgtMetmIokxI+Q/m5rD0x6P98pPvlH+htN1UQpWD
         Ic0pVB9Z+GKfGFJFqEJj/xWD/lesGyuvKGVkOHFke51OpkG7iQEkDCoiZCyzU7lUi5qO
         pURoDOdOw7RGVgzXT2QGWGRMsKarN12Pqd3Z58rE2oQLghBHOVN5x4w2iFxHmzPnoHdQ
         0qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4su9o3KRHE/zhW1VyTF08S8R1Y9oIbhUIVoO2puC4JE=;
        fh=lAEzW9vRvd8gHm1T+OLvrwGw7vSffOJLuDvNhCcJHhA=;
        b=eSJpBfLoLltPXwkTbr0ITmFqdTWa5lHw4ftXLqHAxYgxhktcxHwHu+ur6ywX+w7W2E
         Ckf2Gu2p9p8+P/5R+7nHrTTyL9jzcPoYDqWDUu5v/9ksprx3d8p2zZb292ruDFS33pXD
         6BK7lr3bIS6fwR0l9f+CNfdPnIv/GKYikPVlomNi7Ot7Jedj6bbo1+ZkEH/PNh+j1pus
         ySfGaD7sorGzyQFJYvqV2WKJf44Kgd5eKxWIyFKIqAcad2fzT0+SO42JTwx+p3+lmaBd
         vpcWCjYsVWztPVNdv0aec0u9YJlVc/qaXM4eR4EXn/UEhRRTiQwuT31Mb8rwC7vK4Ap9
         Fu2g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681282; x=1784286082; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4su9o3KRHE/zhW1VyTF08S8R1Y9oIbhUIVoO2puC4JE=;
        b=tLaBBtI4YX+jU/InZLoEbNHES5/9RhlyjUs6UA0khBXF31obyby5oeNJKsdBrjiT+K
         TEDVczkwWvOiFxwjXxwlubvv2UiAF8FlD3zCUyHtMs0sARM74VaPJZkEkzYkKjVbUODc
         sxP2SoMRA8MFn/VlWJCQmBjV1YulciShzZmBPkUiElxl8uZPWwXa+4sUtoL8+smU6LAC
         7WR6VUdxDZHzKvyQiAhTBoPU0o9oWsCHR1cp69pgqvrsFDX9pJGEAvkW4qwgMDqfTmNh
         KME/IGhRba0/ogkMQBKvmiuwO2/+jGHYVHFMZmA/sY+GoZvrut2SGKH8Rz3yc8oIZxgV
         A7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681282; x=1784286082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4su9o3KRHE/zhW1VyTF08S8R1Y9oIbhUIVoO2puC4JE=;
        b=JgsbOVSwreyiIeWL+A47vfzMRxRDedMpLeZ2CneFt8dofOvsvUevr5m9OxYdYGNrY5
         Yp7AD9VgGil5UgggvEnqqjrMjXETm3+fOTlVdyvl5ZoGs+s/aapfFmsd0sO/t3azFS5C
         Y7egcfYyjjpfvVO238OBSjFvAtWwkcLEcw8owrwS3t9KdSt4/k71W34JTUPZGJ1cAIss
         x4F3PxdB8mvzcRPOUwYD4O+yi1xAgwmBGj7spR/P9oYQkHWBhefqAcOF/cFIDudpJcIo
         mtETBwWSw10CIcVRDFt0rLuFPByIVXooSboiBp/nyH8D5mG0pkTvnH1ob5Rkfc1rqA6b
         XRlg==
X-Forwarded-Encrypted: i=1; AHgh+RpL2mQ7wxiwe6QbMUn0GUONdPhHAdy5C6l5p+Ijbtk7HswUGGuyMrFDcKKfM1FOSap1F6c9Tiq5ro5Y0G+BiYsw2g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzA602l0xj3ICRPcsmHY6VyJuM4qWY+qf+00kNJT8s3c0F8Gqch
	pRFToFQ1+7CcFUdvAwQUUzNKPfKPnLRsw8i8NizAIfmX8uqd9juVj7ixm7+UfcfBpmEoAXXfXmt
	wS/QM5d/PixsqWdVgttaB4MiNaukkTLw=
X-Gm-Gg: AfdE7cmObGTSNz30sVtxr3PHJMNA1VMvsbEqbuOtJAvyM2P32AjbGvhDOirDrJCf6na
	VwoKV9mwny+3OA2Axnf8WJAq4pTiYPMyM8b395hggw8uD8LB8KJGsXy6EMTQ2RidyZx7Ly0UhI3
	NXwlrVVnSjREPa0FJJXZlBhSPrkCnl30JzsS64b3YQp5Adsy9GIc1ZQd0Do37XwQhc33RyrNnub
	XzMgT54UJTvL8MX1/IKl3q0mA/PVv3Z2X9OG6Q4He+VZycjv559ulTogk4eu3JSHJP0aaxg6ht/
	rF2WL66FH+n18jaD/yvFof3/XAkna9Y=
X-Received: by 2002:a05:690c:6b83:b0:809:fd83:a88b with SMTP id
 00721157ae682-81dbe34a63fmr82996927b3.3.1783681282097; Fri, 10 Jul 2026
 04:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260706135009.1818867-1-ross.burton@arm.com> <DJT6HQ4N7EGR.2UDG8J0QL9AL4@bootlin.com>
In-Reply-To: <DJT6HQ4N7EGR.2UDG8J0QL9AL4@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jul 2026 13:01:10 +0200
X-Gm-Features: AUfX_mwFB7iLJwWfjFAmWs5LMhXZR_32fwPvd2b6Q0DQlUGteeMuRc9W0sMv7wI
Message-ID: <CANNYZj-NtN6DeXpLYxA=XfPNJ3Edhb8f-OQ3_-3CxBmwsXmXXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] nasm: upgrade 3.01 -> 3.02
To: mathieu.dubois-briand@bootlin.com, Joshua Watt <jpewhacker@gmail.com>
Cc: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 11:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240631

On Wed, 8 Jul 2026 at 14:12, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> > Drop the backported C23 patch, and replace the debug-prefix-map patches
> > with backports that are now merged upstream (thanks Joshua Watt).

> Sorry but it looks like this upgrade is breaking the reproducibility
> test for ffmpeg:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4343
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260707-b241bpry/
>
> It looks like libav built code differs. Can you have a look at this?

Seems like backported debug-prefix-map patch doesn't fully work?
Joshua, can you take a look please? Is the backport not done
correctly, or is something missing in the original master patch?

Thanks,
Alex

