Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1E9C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 16:33:30 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.1274.1708101206701381076
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 08:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oqIaCEMy;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: andre.draszik@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-511acd26befso2874143e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708101205; x=1708706005; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcyfYwebGHW6MYySY/FvI/R2Xm54JuYG9oi33W+Z0Og=;
        b=oqIaCEMysSx3G73MwPcx6oxPTlM9yTu4gfhDP5K3dj3uqXFIFZ3WhZw9QUkZE83RSX
         cwmfIw1roSL/8hypEJbWbZKdULg6KvlLATwc4SLFBQHq3ssl+1jTOEaJUrkZBy3n+Vn9
         D+uRydxrW0oDN6fK7qNeNZ+AXQqW1zYPebjeo5KgQds1r1c3WqKcKgc321d36/GseIIs
         np/9USbU9YuL9AuJPZUaPxwlP0cRDeFuYALT8f/m+7BeAUSWxJIkoyNUbvdDpaHxAIkM
         r7baABXbYWlhNlbiHXND4cWKQQ+oUyh57EnRKaY6/ICB/JmGoTnYvwfzKnzQqsigFNZG
         sQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708101205; x=1708706005;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcyfYwebGHW6MYySY/FvI/R2Xm54JuYG9oi33W+Z0Og=;
        b=q9A7cAJD2KW5SKHT08dqXf2k95XOOkibSbcgn8aCl2fMFeOSJVKJE40XWkfnqAMhRf
         /LAAAtqTFdMp0UofkwXpCyY2CzDyedCrGB1LCwlJxAMgcTd+vQc3EtYfFGt7T+X+DOzz
         yp2FZsxGjOQkQEdqk5+s7oef2DuvpfdPrggvghhjkyoCpH6XVwW0UEb8aHQpZiZLh5U9
         sF2ImTQPfMkArb4fKyOilvcG+Wc4f+TlglQAGlQIPxJA9zYE1qnPE1LmEfNDL5aJFLor
         I+TEFac2+cUippoW2YUyCDgOXE1EuUzo6Yi6Ae6w94pT7jGb3MxMBLOXvqTy4aWL0dTK
         K4NA==
X-Gm-Message-State: AOJu0Yw7k9RIMCFKB+MDG0ITuBR7yXB9GuTfJuE2RLeSha13LG0EqEnO
	dlKugFuYqicve/H9J0F2y8+PNIb40kw0YE2FlxQoKvR9AYpQS1wYwVJbhqEuUFPFJHew+FvpQrC
	BW/U=
X-Google-Smtp-Source: AGHT+IEGES65AbTt29MPEQb7x2pICJuo/Iv94mCjwrX6RgQHLw6sKHRTcl2x5jXFYKw6LzLy7ni8Ig==
X-Received: by 2002:a05:6512:1150:b0:512:8a8f:4bf9 with SMTP id m16-20020a056512115000b005128a8f4bf9mr3807586lfg.66.1708101204771;
        Fri, 16 Feb 2024 08:33:24 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id s8-20020a7bc388000000b00412260889d9sm2778459wmj.1.2024.02.16.08.33.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 08:33:24 -0800 (PST)
Message-ID: <81b4a82d348c93cee4ab55da31c84396191fe989.camel@linaro.org>
Subject: Re: [OE-core][PATCH 0/3] support git's safe.bareRepository=explicit
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 16:33:23 +0000
In-Reply-To: <20240216163113.2751935-1-andre.draszik@linaro.org>
References: <20240216163113.2751935-1-andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 16:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195785

On Fri, 2024-02-16 at 16:24 +0000, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> When git is configured with safe.bareRepository=3Dexplicit [1], various p=
ieces
> here just fail. LWN has an article about the problem that this configurat=
ion
> option addresses and why it is useful in [2].

This went to the wrong list, sorry. I'll resend on Monday.


Cheers,
Andre'


