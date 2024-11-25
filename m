Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01BED59D6F
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 20:59:16 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.29658.1732568351387357813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 12:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SiYmbExj;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d842280932so22228836d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732568350; x=1733173150; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYyOYmUULHETXea1C2WRniBRQ/VO2nLsMzxQo6Y5OG0=;
        b=SiYmbExjbQBCvLxHUPZ1o07tnaXrILli5ju1XnhKpNToyA9LUt1r2/WK8b/jz6dG9r
         y6haBU0qz/x+P3EAhvkj93e9LIiEPuwMe/Gk22HhYST3VxyQ8GqiznL2Ukq8Rmhn9ln+
         ATMhWBdCRunZhDmW6sSL4l7heAph1ova6Ie84O813EeDba5e1zGnEqQpuTe00acfUm1K
         s9SAlEXjb3PtJxY+zvXkOgin9BGULoeVb8vhVq43/LZbsjuU0jg1DcLtHWNJhxn6yy3n
         rYa4aOHnZD3pWQjMfvX0mCFr59BHz8udaR8ck4Zqb2hGXH2jjGzAi990e4Buh68Tw1Sx
         /MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732568350; x=1733173150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYyOYmUULHETXea1C2WRniBRQ/VO2nLsMzxQo6Y5OG0=;
        b=HcBn5L4dL14Uam7Ss5OcI8ZMcYLRodqeh021tXAEmtcGaSfuRlTtPzWR4O7OPkBoLM
         n89r0ifA/9+1+ursat2bwJ+CeyeVSVim7/gxnq19JKRE4EGVGfE5qBV5muCLBV1C2fUY
         GGt7UH58PRVIMbkv23WIp4CKtrsoVrCsnc7da1lHn7xxwr46WmDwTI8zQRFaR/o/oM9c
         J/wLdKHvRASF5Cp0s9WTOqfEGZqO5pvFQaOjsZUaMza/hm22/FDsqt9wrei6z/LEvKKS
         E20ACULjT3VPy09mXpUj36r0+3Cot9MXbsZwiBSQlsb4tjaritt0cSlMzOPJA2gWn5dh
         WQtQ==
X-Gm-Message-State: AOJu0YzH3bVqFuiGTS+X4hV7brtlpKatjgtQqVpylz3YwcTMZG5/VsY1
	aion7kif7scAON9om8WhVjDjq4/snrwcz3xc8HsAo7XDKg5zoMmVb8HIV1IrM58E87qFtemj2to
	CZCD3khT9XOMPUhhAZegNZ9H2Weo=
X-Gm-Gg: ASbGncvRFe/iBPnYhF098FHuj6rSzsrc1ttBODI8j+470SIp27PGpcyhsuWO1cz40Aq
	v+8KxPYyM6fk4nByZpXeM56glejHqqDCke3W1E4u1JBPENiTHk7cvI4gRAVhUjHFo4g==
X-Google-Smtp-Source: AGHT+IF/CM9KYHOHiphKG4N3KAuq0h42L8BIPWzCAL4cf9In4hsFZyLtxAl6yWEe7/UY0l0NpDLARUI4k48c7GELoJk=
X-Received: by 2002:a05:6214:19c6:b0:6d4:e46:b438 with SMTP id
 6a1803df08f44-6d450eed1edmr250477286d6.23.1732568350466; Mon, 25 Nov 2024
 12:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
 <20241125120127.2205232-15-alex.kanavin@gmail.com> <CAMKF1srY--yRX9W-n2WB2WerNry+-a+Yh=hfun7AR_r39fZ8fw@mail.gmail.com>
In-Reply-To: <CAMKF1srY--yRX9W-n2WB2WerNry+-a+Yh=hfun7AR_r39fZ8fw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 21:58:59 +0100
Message-ID: <CANNYZj85oV8dFdNV+FsSsGWUz_uNx7x3FBivB2eBge3Zax9FvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/35] mtd-utils: upgrade 2.2.0 -> 2.2.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 20:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207801

On Mon, 25 Nov 2024 at 19:34, Khem Raj <raj.khem@gmail.com> wrote:
> If it is Locked at the SRCREV pointing to release point then maybe rename the recipe to reflect the PV

I queued a followup patch for it.

Alex

