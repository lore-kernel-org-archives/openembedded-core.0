Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7C9C636CD
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 07:44:06 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.24940.1675583038815454067
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 23:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SUlbjrA4;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id y25so13578684lfa.9
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 23:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SRDE7G9QmHtPicLoW2pCmZry5SpjhdDtmEvYNItpLVc=;
        b=SUlbjrA43rzWHoQZuGhT5CmwJEFTCbM1Ekwtsj+XGchX/3nF9+TsQyi7xS2pJ+OCyw
         I1YWL7L97LW5GfV9Pk4kGdgh3FdYHw6lWMbYUSfMvF2dmO1Pr96xIaEMjuTD29Uxt0R8
         eOZ+aAwVjoNbCrVEl7uTHsjej3RHmy4dmoR9QgUCkJL5jwh4xYOY83pYqgpG2VPMdPkY
         P1v22Hng+5S6OLmdFeC2/i2Q8XGlnAYn6SgTGoMb8+T9kavvv3bGLL5NClmPsyexz0qx
         Va4IO3Uea9KSvytFfvA+DWy4OCrHUmo9rGn9Ml1ouchWMij8yCRz3Z9xrTAk9rK1k9ax
         X1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRDE7G9QmHtPicLoW2pCmZry5SpjhdDtmEvYNItpLVc=;
        b=siaSo6GOSKwXUf0jTAUC3CqbwNOnJXYgu/G5x7lzE15mlgDH/3Su4ysLwPPAh6M5A9
         5o9wvOLngmhSzItuMG7Ymkl3AVXS4AtY24afCvmBf+EwO/Vz4NXD7S0t5bfV9EzBSCv3
         XfY2ZJVtyGfeG7nrQ0F96MI6aKIXu7WXMCo5tzTjB4cGQyYnUFDqS2DcOJwFWQ/AbTft
         GVcp/YPKdK3msLfoRzrpZBzcXlRvbHct7ygy4C54nVIjVTnAVagBZdKEYoHlWfz91Apb
         8VZDM2VdwcYnad2aJk0OwPF99ZxtCNu/qVzjG8YcpU1d+5ai6doawhBVGgUVVEvktcPt
         l0pA==
X-Gm-Message-State: AO0yUKVkVPr7II9EvWgcKWVnOVQZloI06I3IxudtcOwHfx60jk+dX3o9
	ADZW0BE3K2ldpaXCIOp+BiB6b/4FCdo8CWlIbwA=
X-Google-Smtp-Source: AK7set+1QLnXke5BRQWvbOrRnQPGgvsfIXaza7i6hJrHXTlyABh4TTvcAy6/mL2/Fxum1r9anE9r25zqvneMf0+qor8=
X-Received: by 2002:ac2:5b5e:0:b0:4d8:76f9:7387 with SMTP id
 i30-20020ac25b5e000000b004d876f97387mr2348155lfp.266.1675583036983; Sat, 04
 Feb 2023 23:43:56 -0800 (PST)
MIME-Version: 1.0
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com> <a23ee023a5ead9c3d66a69b101a8facca3b3fdbf.camel@linuxfoundation.org>
 <80111487-04f1-0c45-4a8d-bfc927b2a812@ni.com>
In-Reply-To: <80111487-04f1-0c45-4a8d-bfc927b2a812@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 5 Feb 2023 08:43:45 +0100
Message-ID: <CANNYZj-ozyiR7r4e6yFK71+o9mU4Y-EuJ0qp27J3xDYpHLUPdQ@mail.gmail.com>
Subject: Re: [OE-core] SPDX 3 and OE-core CycloneDX support
To: Alex Stewart <alex.stewart@ni.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <JPEWhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Feb 2023 07:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176782

On Sat, 4 Feb 2023 at 22:47, Alex Stewart <alex.stewart@ni.com> wrote:
> > At this point OpenEmbedded/Yocto Project has decided to go the SPDX
> > route for various reasons.
>
> Are those reasons documented somewhere?
>
> Something about CDX rubs me the wrong way (besides it being named like
> an off-brand printer company), but I can't put my finger on what. So if
> there are technical reasons that it is less desirable for the OE
> usecase, I'd like to know about them.

This is entirely non-technical, but what is the reason for CycloneDX
to exist in the first place? SPDX is an older standard, it's managed
by Linux Foundation, and yet some people decided to go off and write
their own thing instead of working with SPDX to evolve that in the
desired direction. And then they promote it with a long list of
company logos. Xkcd's standards link would be too tired and obvious
here.

Alex

