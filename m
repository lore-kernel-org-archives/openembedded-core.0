Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76A5C4706F
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 00:41:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.170463.1703896879296909829
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 16:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bRJc6b+U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3368b1e056eso6517032f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 16:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703896877; x=1704501677; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7GdwjqRSVvZKSOYwlI+aHnvVeSuvELF0IJZckY7DyEw=;
        b=bRJc6b+UpPxbXbfBQmziCkMr/HowUtURSAdqTmtnKPP2lveC8VSzp+1IIjmGZ22idV
         QQSfM9kSyJjFW+BbCg8hJiMpeM02U73vYjNUv5r4Lev+P8TPUddKRtVQw03UbJtuEUr7
         AgUnAWueh6L9ZiGp3Y1PBbG7W8nFVM0my4KCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703896877; x=1704501677;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GdwjqRSVvZKSOYwlI+aHnvVeSuvELF0IJZckY7DyEw=;
        b=fzzPTuNgWQN+zQ+I0IhLVQEYKe3ePpnrsxUFZzHIg/LTGBpO7u48haEIfP34+e9Ds2
         FOFCrW4qL2H5NcEMp9kH/0JO7CpS+vT9X6tOjqT4QzYugaajrXGJcoabhdJ+ZNP0ngo9
         U8aFxFkXtRU6n4qMSknLlc5JEmPiwyTS/Z4kGeshoXKOx62BBJiJkzI8w/6RndLle7xh
         7y2A3Q0t0cDjMYsGTewm1cIPb5E4/cbzjBmZeUP07GvwloTdf0GADkkK87rX4WHbOR4r
         Oe704eCxpx2ct1bIU0y5eEVsndO9y51QhoXAcxjqjzHdAOX+2BR96U3Rq09ObAGMc/Ko
         o85g==
X-Gm-Message-State: AOJu0YykWEoOvD+bLVVB5ogaUcfn2KKLhiMC2IYsuG3Pg+Qs9Mh/YAyn
	MBtN03t0XwHWyL1aVH7URN+ht9MXF9qstw==
X-Google-Smtp-Source: AGHT+IEvyH4KmMsMpPPKxtwY2RnmDUq4Y6DSK4Upjia64Cp5EAFnWCAPg8rBTddxuFXm02abN5KMaA==
X-Received: by 2002:a5d:5226:0:b0:336:8ac1:179a with SMTP id i6-20020a5d5226000000b003368ac1179amr5510784wra.11.1703896877588;
        Fri, 29 Dec 2023 16:41:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a152:ea8e:7a3:4258? ([2001:8b0:aba:5f3c:a152:ea8e:7a3:4258])
        by smtp.gmail.com with ESMTPSA id p17-20020a5d48d1000000b00336e15fbc85sm9219826wrs.82.2023.12.29.16.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:41:17 -0800 (PST)
Message-ID: <8aa0cefc25134f97e7bb0b9af30dc19eb516b74f.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 03/10] meta-selftest: hello-rs: Simple rust
 test recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alex Kiernan
	 <alex.kiernan@gmail.com>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 30 Dec 2023 00:41:16 +0000
In-Reply-To: <CANNYZj8mZEE=6e4umfXWFKKyMwHfDm9r6wVuFp67qfnm+qZU4A@mail.gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
	 <20231229114435.27810-4-alex.kiernan@gmail.com>
	 <CANNYZj8mZEE=6e4umfXWFKKyMwHfDm9r6wVuFp67qfnm+qZU4A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 00:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193066

On Fri, 2023-12-29 at 14:04 +0200, Alexander Kanavin wrote:
> Reproducibility exclusions should be listed in the test itself, so
> this continues to be built in regular world builds (otherwise it may
> silently regress).

FWIW this is what the zvariant recipe was doing and the recipe is in
meta-selftest...

I'm torn on it to be honest.

Cheers,

Richard

