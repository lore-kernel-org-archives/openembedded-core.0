Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD12ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 07:16:38 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.3866.1662102989650138933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 00:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fJ6zVTgg;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id p7so2042820lfu.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 00:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Orm5d3YWagptLxutHLaml414HI2R48rfFLlGKZClfxI=;
        b=fJ6zVTgg71kxgLmxxgj+IQE01vv8TURpkcOdfDF6X6FL1AAOEXd0rMSAwe0917GhxP
         PkdNQKbLxHCV3BxpfqPvuLOpTm1utM2HfoMPa821UBPoRx5yNxpN2DWJkJSXhp3qchTG
         xgLe6DxyutQYpK2Wlcuh4keMrXZ8mnrh2lDq6RR9BMMc3Hlne/x8Ly9zTK7VZ1uZKgkW
         0LhPmK89Ae8W9bme7mE2AmEvzMYfx2v+GSdGAuYGOgXEi7Shq93QPjRZbjXJ+TE0WcKg
         EFeH9+JNYHI5UEITllPJ3gr8tkQXs/UVDQ0yjLiP4LkHTk9IxkYs62VV+ogtaKpLEt4X
         z1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Orm5d3YWagptLxutHLaml414HI2R48rfFLlGKZClfxI=;
        b=yiKtijIoM07DhC7ZIfMg5LFs6xiOpCj/dCGJHiJFe6GU05vT1BJ9we7ZXjx0OpxuX7
         z+ofArQrGK/D77LXqxxNmmfVM1WYIaXCeHOvkMEtx2Xt6RI6df37QcairWIfCzv7prrH
         /7B05clhtVgiPPjS2xbcxvR8HXFYgu3vY8h7v5XNoRzLBWUiCy0+MSIHJiJyNGlVthwD
         uUkAqOop2k4xz0EyPimr6v+cOJdvC0yaavfo3steX4Mi9Ob6es8k5iiwXPV+CCf47jvI
         k1Fpov6m4OB7xEhY/3dlWZ2sbUxwJKbNcj+Ejx1C+8q58kVMj5Bs9dDPAupgTHAQdGPy
         OOwg==
X-Gm-Message-State: ACgBeo1/LL7vCM3mWw1WI90N76iEzuTEJ2I1WKHrJynZoPmygLPMGBNo
	fsZkwzrSQmLRRpwU2lJ2E8yGLe7+hvRKWan7eoM=
X-Google-Smtp-Source: 
 AA6agR6ZRgCtlxxn5om++Vb8hzgU89aL7Wu2JF61yqdNVe7g2/py8jZJ8+c/8hI5hpuQzlkmiyOdlorggpzL2iFALKc=
X-Received: by 2002:a05:6512:2391:b0:494:7f90:ac04 with SMTP id
 c17-20020a056512239100b004947f90ac04mr4807254lfv.521.1662102987462; Fri, 02
 Sep 2022 00:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <1710F0E3F6A43399.12033@lists.openembedded.org>
In-Reply-To: <1710F0E3F6A43399.12033@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 09:16:15 +0200
Message-ID: 
 <CANNYZj-YxzNONuKM5UVsvW7aS+k+aDTUw4GeK=MkMgGCdygxFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 07:16:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170236

On Fri, 2 Sept 2022 at 06:32, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> We can however add a hint to check what is in
> build/conf/templateconf.cfg if the test fails, as it is not obvious
> that TEMPLATECONF obtained from there takes priority over other
> sources (which are, in order, TEMPLATECONF passed via environment,
> then .templateconf next to oe-init-build-env).

Ok, the more I think about this, the more I'm convinced that
oe-setup-builddir needs a complete refactor. Specifically:

1. Let's rewrite it in python; shell just isn't expressive or readable
enough for what it needs to do.
2. Let's have a clear, logical priority order: TEMPLATECONF env var,
build/conf/templateconf.cfg, dirname('oe-init-build-env') +
'/.templateconf'
3. build/conf/templateconf.cfg becomes read-only; the final selected
value for TEMPLATECONF is written into a separate file (for having a
reference to where the configs came from).
4. oe-setup-builddir can also later be extended to support
'configuration fragments' management, see my email to oe-archtecture
from yesterday.

It's just too late to do this in this release cycle, but worth looking
into afterwards.

Alex

