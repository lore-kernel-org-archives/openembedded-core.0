Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6755ACAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 14:35:22 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.35443.1757946919232799615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 07:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rYOHNBiW;
 spf=pass (domain: konsulko.com, ip: 209.85.160.179, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b61161dd37so33516711cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1757946918; x=1758551718; darn=lists.openembedded.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9ao+rc6P7GWIZYr83QM9WwwwsPoocaXt7GxQXJrukg=;
        b=rYOHNBiWPCshCJNs9QE5R6tP4K/j2jC6lWvCc0ErxPngu7S75thqutlEmfxEFCDJxM
         9lLoeD1bYYMS2svQxsP/7UZvVJM61ZJejGUSSgZCwJTN2xupFfxPOREoApHjQ7yO8Ggo
         usInNoBiaK18ZrDbTP13MEcC7pPbh9Plwhtpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946918; x=1758551718;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9ao+rc6P7GWIZYr83QM9WwwwsPoocaXt7GxQXJrukg=;
        b=mtA4RXcEDuqqZfBuct2jwbw84tk1q7/uEVi6wGsGjxnnjJ4O9Eyn3IxmtAMV3ZVOZh
         5v5La30wiME8MCueAZU2mAgpDvlVMsyr17nSMM4I9HJ2xAWk1WH/0H+ERszA0LvIc2wG
         Fk9Jlo0nRbQJP3gtaRZ/yyMyeFD5WUlirnAdwmntds8enM2QDhD4kruX5sHSXrSrEl7i
         yXyKFpfckRkLJQDoO6+rqWbvgSDVOeoaAwU3wWqJqkFAuCJDC9BIo2p10O3DKk+i0JWJ
         FoCSUobUHk2DS0ZTgsiYaQslaKzMi8CnThGN7hU0Ie5J88Yy5Rd29tXasvFX9yROkv2d
         j2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVQwRLu90dxsJP0ISQ8K2cOxcYI5Q/GDfMf8Tw88opVm0NFxsKUEI07HnhSCbEpcWD6UT+w+sppumUlH/JX55HFcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxD+flwuRWcBX2tOrnPINO/Nx7uHI6ePNjiqAAvhWng04ZGmKrL
	IAu+2J9v22qAI7UAA9PnXPjWL4J7/6J+7/pPZvSkWkgsEcN3+9uDrMEj+d8l+LdqwmE=
X-Gm-Gg: ASbGncsl1jhJydAnt4+jSksGxGSALc4qF3FwFh30u2nVcHRdonVJiaTH/BMX8tNL+M1
	eMZkFoiygAC4NWvZt6yIb9i/wVBycjHIojf89AwvXuAEJoKsF4EOnuuj7/J2ExY2EwQxa5LKC3j
	GWo3DK0K5uunyWXZ0OsBt14Xedq1rrJG1WQQp7tQ2X7qaFZpQu86g7YnJCoEwEDPbqOCFo80+01
	O7ImsEctz90iyiUPhpk7x+y1knyL3qAwkaTNwlvDkJcyK4mh9r8Dvxlfhgu9Psh/o9nNOSjes66
	5Nps7NBs+WKMJVoeoCKN/lgoaqwevKcnsB6+X5rdwxJlyExoW5BM0rF9tKTBN6lwyq/T8FvLDFL
	Ztl2hAIlF3IOUWuT8AsNQOqzCLKijQZPnuoObBvgNUzawk5/jAoE0uPwN+g==
X-Google-Smtp-Source: AGHT+IE/K0YgrodiHMh0cWPZEb3IkCrvMuUmGpfbdsF6Ks2zpYA2/D16FvuJqjyMu+S4cKN+7KPUnQ==
X-Received: by 2002:ac8:598a:0:b0:4b7:9c5b:8d13 with SMTP id d75a77b69052e-4b7a578fc7emr45582921cf.84.1757946916688;
        Mon, 15 Sep 2025 07:35:16 -0700 (PDT)
Received: from godzilla (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639dee768sm68916121cf.52.2025.09.15.07.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:35:16 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:35:03 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org, 
    =?ISO-8859-15?Q?Jan-Simon_M=F6ller?= <jsmoeller@linuxfoundation.org>, 
    Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [PATCH] linux-yocto/6.16: cfg: fix audit warnings
In-Reply-To: <3c290199cd4437f8dc25d19752c51ebd02cb4ab3.camel@linuxfoundation.org>
Message-ID: <608106a6-27e4-9a02-b013-3fdaa49322c4@konsulko.com>
References: <20250910193942.4072450-1-bruce.ashfield@gmail.com> <3c290199cd4437f8dc25d19752c51ebd02cb4ab3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 14:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223491

On Thu, 11 Sep 2025, Richard Purdie wrote:

> On Wed, 2025-09-10 at 15:39 -0400, bruce.ashfield@gmail.com wrote:
> > Apply these on top of all my previous patches.
> >
> > They fix the overly agressive DRM options I enabled and address some
> > of the warnings in other configurations that had slipped through.
> >
> > There may still be some issues lurking, but this will definitely
> > improve things.
>
> Thanks, this definitely looks better.
>
> There are still config warnings for meta-agl-core and meta-arm:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2218
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2254
> (copying people)
[snip]

I believe the meta-agl-core warnings should be addressed with the changes
I just pushed.

Scott


