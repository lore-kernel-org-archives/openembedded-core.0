Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A6FCDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:26:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.22996.1697704012623312130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 01:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J9rh/j65;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40675f06f1fso2651475e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 01:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697704011; x=1698308811; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=29zSY0eNvpaSUkU0utixK6gSLlNMzfLdWVTj2Kp+MUs=;
        b=J9rh/j65E/6TvCuHBmGxo3WS7Ug6qzfWqzHpEc0qafCbITzS3R3P9O/4xubfsQqv27
         FczwPTlgrxKbmiemN5E7gSfXIiWV49JsJFLW/YRbdo4sg/XbvqXo2JjeeHYC+Gr5jIt4
         ZYrT7HqMTg8VRFSP6RDQiiKFqrdE9lQ5E+Hv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697704011; x=1698308811;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29zSY0eNvpaSUkU0utixK6gSLlNMzfLdWVTj2Kp+MUs=;
        b=P7f3+EcrWAPK+bCVH8cJPQ/fYT73vyPJuLyDg16P++hQlX/kGFo1puwer1e/fGdHJe
         kvgEFybO0dNBtZFt6UpjAE73m+6B3hRUBaTBSei9J3WQnK2a3WSdK+USbQER+3M9algU
         I/5l81wQTrHaAFbeCm1+L4syRiaDYC20gdZLTgCsdwl2k4nRB8dCjMELaoKXvQ5bL1Eb
         m+ImS/v2wy8GjtwzWL1SSUO5k4WxYXLx4T0q7CKhtpCUMI+/ysTsTv6wFP643PFTbP6h
         5+bDxhdiozprExINcIrYLqS8HpLsyzTHnLXJihGR2fA7mFJjmF+T7N5IiShPhOP6loUc
         2AbA==
X-Gm-Message-State: AOJu0YyUlZnq4zOZWEdvpgytQ6PWQ0cX9GaaCAsYi1HOBbb4iXcRdH9R
	ijQobmrkslD8RTh55gv/9iZBfw==
X-Google-Smtp-Source: AGHT+IGv7opgX1CDBKRjEv3OqiIzpATARBeQsEucsmwVsHHi/jMTag32PcKQHUr6xUrKOaALTmS+iw==
X-Received: by 2002:a05:600c:5254:b0:405:409e:1fcb with SMTP id fc20-20020a05600c525400b00405409e1fcbmr1164796wmb.5.1697704010974;
        Thu, 19 Oct 2023 01:26:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb? ([2001:8b0:aba:5f3c:9ec8:2948:ce65:9cfb])
        by smtp.gmail.com with ESMTPSA id d28-20020adf9b9c000000b0031f3ad17b2csm3915095wrc.52.2023.10.19.01.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:26:50 -0700 (PDT)
Message-ID: <fdbd86b794b44a192e6bfea3564966bb890310a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] lib/oe/sstatesig.py: dump locked.sigs.inc
 only when explicitly asked via -S lockedsigs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 19 Oct 2023 09:26:49 +0100
In-Reply-To: <20231017133050.147000-1-alex@linutronix.de>
References: <20231017133050.147000-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189435

On Tue, 2023-10-17 at 15:30 +0200, Alexander Kanavin wrote:
> This was writing out locked-sigs.inc into cwd with every
> 'bitbake -S' invocation. When the intent is only to to get task
> stamps (-S none), or print the difference between them (-S printdiff),
> the file is unnecessary clutter.
>=20
> A couple of selftests were however relying on this, so they're
> adjusted to explicitly request the file.

I think there are a couple of other places needing adjustment:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/7962
https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/8022

Cheers,

Richard

