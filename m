Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5353DC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:39:28 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.15457.1751035163289501208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUNNEVhg;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fb01566184so19714526d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035162; x=1751639962; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sbi2Zhwyw7INlXcNFO+iQwDkBrATMYFvJYheoF9B8O0=;
        b=fUNNEVhg+gHTOsgRuEDFGh3az6yQI8GZBSriWBJdlxANcDL2sdUrx6XFpGafrEuplW
         P4S98J9MRx1bPu9mBFg2Rq9AY2ViAF5UhFK5TVqSeiQ6V7CSeizfq26t1ob33pfPgCB5
         TqYqPhv/j9CxZ5xJpMooqLysCxvGvNsjAE5D97XHSwXJwwnfitIUhU2haQvtzIZwPinz
         lpreFE00OxpfNjaDkH6QmXMfLfJIfS+am+T2y/q3TWCBuV09/Yk3OsdNduPGFqIM9fS+
         J0XJDEqUzrTeFDRqoyApf/jcB2juRCcM+VvTbU2gZuDqqtsigPiF9P3eqgU1le4GDkue
         EnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035162; x=1751639962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbi2Zhwyw7INlXcNFO+iQwDkBrATMYFvJYheoF9B8O0=;
        b=min90G0PeihFv8rktV5iGdcCl0VVXsNYPu+92wXcvqJnMYLpKu2AhoGWXWKChXZ0lc
         /JF9g+xQjpEYjxNl2wJ081h23i+zPlN4qEhth0nrw52WwVbkoP54Qd9iaKlxRcfuH5KK
         +RZ8NI0wd2Y2MUMYwYm6SXhpy8MGZSnxX2vjN27mFWSCSXhuLvvH4SszYFSIXEvsMfcy
         XnAOg8hnAIP2s8cWxsQmDGyahWKf+3yuBlBJp5oCp7Du4hxT2oXfwOcoxjpwkL2SEGd6
         OpQoiw+/xeJMsL0ixRUxBoxuNstIAdmiPbtv53krCx8KsA4rNr4jtzD7S8M+yabSntrv
         HcTQ==
X-Gm-Message-State: AOJu0YybxASolxR3m8DY7VJ7C0q0jNEaR6f3C9Re8R8UKNwKNGhQDvQB
	ekzysRRAVHeIW7wPXpXtVgsuaptq/L2HHOVLD4WrEv7lt1KJoRX4mLjjkF7uN97Y05ttCWU1c9m
	Ny0/Mvlv7lokuFLoTjKkP2ljNSaADwHJsYBBq
X-Gm-Gg: ASbGnctyRxykRAEu5R5Zz1f1AeqGhy44F+ZnNJspDYSUPq7RSZdnSMUdaWm9W/kPtS/
	sNRB8kkfLw5EddcvTH4DRItPxfY0LdmCEAxwSXoTGzcBQFTOfHPxynEYpCbjvhRPDxu6PKSBm2L
	srAf16V9q3s0G7fc9g0OFW7Nui8IhMryvrYq26KfYOmpR7nr1HzyziB+/mZRkZjM5WrZIMKDdQf
	f7iLsSHt1ojSsu4
X-Google-Smtp-Source: AGHT+IHetO5E4qS2jo0MQyC8FPq9hY/RPmFpLkCK2ppFPLowOeygSQVyaMk5iaDSlndPWoMifbenx4zy/faGWxnGd4c=
X-Received: by 2002:a05:6214:1d03:b0:6f4:c824:9d4a with SMTP id
 6a1803df08f44-70002625b60mr53118376d6.13.1751035162026; Fri, 27 Jun 2025
 07:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
In-Reply-To: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Jun 2025 16:39:10 +0200
X-Gm-Features: Ac12FXwL6yjhZBELU9ufoD-3MW8Kv1bUnjYQcNxzfxnB6Djyn8xo5l3LCh90hG4
Message-ID: <CANNYZj9ABvvEZDAHwPCTpwyv+GomWhasey-2TB7t_pgGeeOziA@mail.gmail.com>
Subject: Re: [OE-core] should local.conf.sample include qemuriscv* machine
 conf files?
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 14:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219422

On Fri, 27 Jun 2025 at 15:31, Robert P. J. Day via
lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
wrote:
>   i forget if i've asked this before, but should OE's
> local.conf.sample be extended to include all of the machines defined
> by the OE-core layer? particularly the two qemuriscv*.conf entries?

TBH what we should move towards is an empty local.conf.sample, as
things it does include are all over the place and at the same time
don't cover many important tweaks.

But for now, yes it should have risc-v, and mips/ppc should be
dropped. Basically it should match what is getting tested on the
autobuilder, rather than what is available in oe-core.

Alex

