Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A51EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:07:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8533.1690880878521613306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pe3YTOsv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-307d20548adso4817327f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690880877; x=1691485677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6I0BgXWQrbRIoAXy7GHBVwz3nmAtBWTB5hUQJuKf5H0=;
        b=Pe3YTOsvkfg62n9jRCL5+3tZM3lw1gCGDcxT57K96M8l7kvevEPOsMeQ7ALYJ6dNwi
         P8pbpCdzb98G6fnLPvQIXeZGI21ykZVxeLX+wbk2dL5DVUuNca1X2aypfJ3cN+W7eShB
         lK8sbRSIwEHU8lAxvUp++5y3VA545BUZErQK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690880877; x=1691485677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I0BgXWQrbRIoAXy7GHBVwz3nmAtBWTB5hUQJuKf5H0=;
        b=JsyDa8kmqDhQGrXRQThcc0jXssdXlF1AKDQW6ROEjet7gkdsaO4tYozUzqn87mk+yC
         ZEFG1i/lo94GOvEkEKU82sloJCsk0id9xLoywBD62xaRKaQVPch6DIw8TVQioROwpex5
         wu6YnzSaj3Mrrbqo2OrMLTUsW21ezG+hEzEhYFcCRhEtJ6gh+eWhmd8U9TwYauaLIm5C
         v3AZih1YfEWA78J7+7mBrHLwvuzZtKFyXE3gP/3qB777vh5ZhBUtkhGMdC3QdWVURF96
         O2IlRFIrKElLufhCD0ZR+S++/wAqFzyeJSpvC0kpze1fRC39n1mnuyVst248nN5B3lHR
         qi8g==
X-Gm-Message-State: ABy/qLYqTwEJmuLDeB2zWxfpC/VflUzAEQdqZ8FOiypExzfFEn08LySI
	bntq27GqE7x9dlHRpIczKNYu5w==
X-Google-Smtp-Source: APBJJlFohmgNSR+rPnWYpEAyewBHK/w3XsKIbqu5kraarDzJ7D+YGHU2SpgmLk9/Ux/bONctFwWLEA==
X-Received: by 2002:a05:6000:1005:b0:317:5c36:913b with SMTP id a5-20020a056000100500b003175c36913bmr1721788wrx.48.1690880876741;
        Tue, 01 Aug 2023 02:07:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id y17-20020adfd091000000b003178dc2371bsm12075551wrh.7.2023.08.01.02.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 02:07:56 -0700 (PDT)
Message-ID: <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use
 --offline instead of --frozen
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Date: Tue, 01 Aug 2023 10:07:55 +0100
In-Reply-To: <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
	 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
	 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
	 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185219

On Tue, 2023-08-01 at 11:00 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Thanks Richard, but I'd prefer to drop this patch if possible.
> I think the rust-hello-world is no more useful=C2=A0and that we can
> replace it by a more "real" example like zvariant
> from meta-selftest.
>=20
> Let's see what others think about this

After some thought, I'm in favour. Lets drop it.

Cheers,

Richard

