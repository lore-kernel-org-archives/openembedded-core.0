Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34C0D5B862
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 18:06:19 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1015.1765821975580318864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 10:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HMwUwTZ3;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-888bd3bd639so31159066d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765821974; x=1766426774; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9t0dvBtZjacI2XxdEg+Ano5dYm4ZBcIRiK+/a81IGKU=;
        b=HMwUwTZ33lB6OXLAMwwU8pC74ql+wOmLxU+NhhSKuDz32z9ZcqJdbx08tS5nS/WKir
         /krDbJNwL0ujwc6mpzMaZgGjG9r1iYgOCAlzvRz4u8hHIkqUbHm1lKEWOLisD0N0IaOL
         z6kr6J36wnFowgFKTH6zfaslEFeS1WmXhN2xHBZC8BAh+hxkM0ml6WpqnoUcCRLjkNGW
         fmfvFX5WvUswxP+GtRc1LlGuw04FQilaeZqcfFLO1A3WRPeBFsmDxlrAqFz0by86h2C9
         A32GSG58KE7am4WAy2Vf2VYRo/Gwrfc7FZpuslr25tbBDgu8uXOEfSWUFPVQz1QgeuwV
         Hrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765821974; x=1766426774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9t0dvBtZjacI2XxdEg+Ano5dYm4ZBcIRiK+/a81IGKU=;
        b=wXk5qvkncQJ4ozAlef0e8UKMrbdCApP2fgSYGEWCxBwO+UrghVLVv8cns5jj4uHBDN
         2B3tDjJA+S/Aem+NLZKTzcn8Scw+HIfse301qlIEorWM0Z1AHAzGg8gi1RABFUkO4AMs
         fTdfA90Lbcmp04U/laWqI+XnNlI+8d4JbARgip/tl0XJJKvlA6rLgJPxKO+a7ajlBtNb
         x2P90l2M+NyXz5A2brK6yC0tStXTnJAJ64Aj69q260+hYhSt51CCPEhEizGlu83S6/Yf
         E15mN8htACPrMXBzrHFPcONdRa3Q8Blpjd57B+MGvxroFzGRZZn/NSftv6vFfx2Lh9+p
         O+/A==
X-Gm-Message-State: AOJu0Yx5Rd/ImQqe+dRWYnrh+Ffc7iHiHPNI32GU44hbbSdJGo0QVfGs
	47h+VBSvqLj1M6zszoaLrpUZpbXD9l1o+18xJh6gH1OvsZRZqLq9rkaIxXsEFm7QnmAzx+1GzwB
	TtyhddSTym150L8Ufkofp1UgSng6kOn8=
X-Gm-Gg: AY/fxX7kUQKrbkGD3AC50Mmyp8bGhsAZYqUiWM1PPqF8VSqzdok4WPNlsDM860Ntlwu
	ETr00+5SAe4MsaDdpj2Qqulo8EuhIEKZhn8QpXPtJsgy2Q7Ige4FgSMxc5fMt8BK0QfF0WmKEaA
	GTUQj+TSCEkV0Z1ssHQ44g9VNDKWG8294dACg2pQuYe9Zn2DItnQ0MNDIw0P9jBu61OWfke2SLD
	q4udcDKd3iPxPfblTs/2sxWxVUVLuS3VvOwgopP58isq3AxSfGfCf29FJWg3ZBlncRhWQ==
X-Google-Smtp-Source: AGHT+IE3FBFV03AmP4nUiwn67P5a2yOHGa35Z0PZH2fQlxNjBvDcjw7RbTS8YnODBuqgtRxkqlmywNhJVNt5sjYTi54=
X-Received: by 2002:a05:6214:495:b0:888:6227:3e77 with SMTP id
 6a1803df08f44-8887153bdf1mr253211696d6.4.1765821974439; Mon, 15 Dec 2025
 10:06:14 -0800 (PST)
MIME-Version: 1.0
References: <20251208091148.368769-1-changqing.li@windriver.com>
 <CANNYZj8TPT+Y0-ni63tyGPWZHZ4zweaAm7nKdMM_KA40AOkwGg@mail.gmail.com>
 <47201384-ce8d-4188-be45-4bbde9a27601@windriver.com> <CANNYZj_kb0aX2TbAc2dQujwrDit_nOh=HhAQi5fG-U0+DurM8g@mail.gmail.com>
 <e4a61408-3316-4f00-b6d6-dbbd236b5a4e@windriver.com>
In-Reply-To: <e4a61408-3316-4f00-b6d6-dbbd236b5a4e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Dec 2025 19:06:03 +0100
X-Gm-Features: AQt7F2opE_c5AiHqtrhXey5Rn5o5NNOXCzlS453ejSVhcHmcCi3o7ZuVNBmnV1c
Message-ID: <CANNYZj8Gr4-KsQeYtUD=+z0ETrR_+Uq6MwmoDsY_of+02wtnkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go.bbclass: change GOTMPDIR to improve reproducibility
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 18:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227750

On Tue, 9 Dec 2025 at 11:13, Changqing Li <changqing.li@windriver.com> wrote:

> There is one recipe on oe-core that does inherit go class
> (go-helloworld), can you check why reproducibility issues don't happen
> there? It would be good to have a reproducibility test for things
> written in go in core, so this doesn't again regress quietly.
>
> This issue reproduced when cgo is enabled,  and go internally add --ffile-prefix-map="WorkDir"=/tmp/go-build" to gcc
>
> to tell gcc not include workdir in object file. for go-helloworld, it should be pure go,  does not include the "C", so it will not met this issue.

I have filed a bugzilla ticket for the missong cgo reproducibility
testing: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16100

If you have ideas how to address it (with something minimal) in
oe-core, that would be welcome.

Alex

