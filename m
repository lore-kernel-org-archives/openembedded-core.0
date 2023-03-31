Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25071C761A6
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 13:50:59 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.55065.1680270658414706889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 06:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i4aRjfWC;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id s20so2772854ljp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680270656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PLjWdJen6cwGB6XKIMhCGgXFiHZ+9lyzv4pVzG6zM1Y=;
        b=i4aRjfWC4W3Spxd+23hGmraYyPGTgXoXdV2g3uhr7xSVeTnEcJGSOQ7V+OfW0KhhwD
         MM1oRs38gQTI4+0CEC+fRsWqgarog+FMOVxPVLViDW1LyErLFF9TlQgUgGL4Kify6aN+
         gpPsFWnWcpRfXRWvMg0a9IbRs0aZg3lCSXsd6Ve9X8HRzA9BCAuscEWAsuYPxLVgwJDL
         1SDqWHHJirHFPJcDzZFlC5N+jdw++lbQmbzvkxmXtfejPivuEREHsa5Ns+1kEDj9PNLa
         CpJ4BQ/kx5BBmGqDLW5+vlF976b7Sl6TeVKXwQcn7M8MDka1ZIbPVYLLDWGhSP8EON53
         LjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680270656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLjWdJen6cwGB6XKIMhCGgXFiHZ+9lyzv4pVzG6zM1Y=;
        b=fXDkbC4KajaZfGXql+t57RWIUlCAXS4bUl7FRnFHuoTggILq5sk4qwVJjwHvhXwE65
         Fbzfnoap4iPgKUp/gkjCppezVljiF3eiT+expHqvZFW0mdiLuWpkdsUNIlVgHi2Vo+2o
         PBLP1qCwb2OMbRlr0gtG6KuqM6yFMyiTU60Z0t7st0Gu/804RlWhnLT5fkmklpRs51Lm
         bxHB6Gg69RImHaQJQd6VHLHZxUa8K8ja9fRQU6FoOfpkzlJnrxygCWUw392hCcdu5T0P
         IyiZkI72ZEvA4hYQD7aqVEpGlu1G7cIB5A3HWBQSiHwKLMXtxDr6UmKISCvJnsarW2zi
         IqRQ==
X-Gm-Message-State: AAQBX9cJrYJFLklcnIFidi80Sc/UmE76/szsOVV21a3iq2nUY4+7QCLH
	V3S1E66q0nfRRQt2ydnTfuR5dcHRh+aE00boP/g=
X-Google-Smtp-Source: AKy350byIyzRsL7AtmbOWDCa5XqzqygkAV/+uycDoRCQRsxHOsfUJ5yK+LJOAVhXT53qLjIwxrAOSh0V0okvwM/iI3I=
X-Received: by 2002:a2e:3203:0:b0:298:b337:c11f with SMTP id
 y3-20020a2e3203000000b00298b337c11fmr8315208ljy.7.1680270656563; Fri, 31 Mar
 2023 06:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com> <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
In-Reply-To: <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Mar 2023 15:50:45 +0200
Message-ID: <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for zvariant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org, 
	alex.kiernan@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 13:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179444

On Fri, 31 Mar 2023 at 15:26, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > We do have other reproducibility issues in rust and had to exclude some
> > > packages from the test because of this. We do want to resolve those
> > > issues though.
> >
> > But aren't recipes in meta-selftest exempted from reproducibility requirement?
>
> I suspect we can put an EXCLUDE_FROM_WORLD = "1" in there and then this
> will "go away" but shouldn't our output be reproducible and isn't this
> therefore actually a good test?

That's true. There's also rust itself which continues to be the only
item in core that's in the reproducibility exception list.

Alex

