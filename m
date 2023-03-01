Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BDCC64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 08:22:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17380.1677658919981438076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 00:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hzc3mv01;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7778211wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 00:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eaJSZpZKjmEyn/4EtntvBaWk5kJDtOUids5RBCw9QG0=;
        b=Hzc3mv01WYFcL1wmQAplcr490+vT231etffyGPW3PrP8z1PtXdgspsAAbZaC8Vf0et
         6Uq33E5H4olUKZcuoKk2b9IMl8Xof1YngnYhU9xuTEjuH2671pzG7ySaNzrFmDTALlEL
         7fp9wOXKNJeHu75BMkuoNSJloCtKrshndY2do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaJSZpZKjmEyn/4EtntvBaWk5kJDtOUids5RBCw9QG0=;
        b=m9zR6MSr0IABvvve897YnvGyJthCSYeYcCeTQrE8dOcQVxk4GhNFMw+twyHREH/XjW
         izPgQraHFeBkijADQYV+ymbA2KDJzeayjAeHdV/7cauI/IX5TeGmRL2Zt4U0nt0T0VZB
         viglwHVK9NG/NrUE8IZoZkluZuw0Y7DLUcZcGdeql5ASbauLS1EtE7ITShVqqMVuNZda
         sQtQi4pIxnsPGKM7luAK1CD9dzI1D3Mv7sn+ZvTQqEGMlJ8ld4fuhXtirXyr1yR8xghC
         8T1uzNSf/YBhq3/EioCR2fTPJdAoJJsprEZ1zqc5wzUxP9x8aHjyIGyEW/9PkauwfbsN
         HwUw==
X-Gm-Message-State: AO0yUKUJ/ee28NTYbnAWymEibInFJ9E/pPi3Vi8Ojp8ZRFRs/YgL/oSi
	E1FT4peFc4xEfTgrGUPgEh9YYA==
X-Google-Smtp-Source: AK7set//uGsnHV8s/CG3sGjeSI3KWbR7yKTgM6+KczQmKW0acHhRIfG7EWSDSwD11c7MWahE30JfxA==
X-Received: by 2002:a05:600c:3b28:b0:3eb:2da4:f304 with SMTP id m40-20020a05600c3b2800b003eb2da4f304mr4104381wms.17.1677658918233;
        Wed, 01 Mar 2023 00:21:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c? ([2001:8b0:aba:5f3c:cc9e:5433:f22d:3a1c])
        by smtp.gmail.com with ESMTPSA id r23-20020a05600c2f1700b003eae73ee4a1sm14938542wmn.17.2023.03.01.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 00:21:57 -0800 (PST)
Message-ID: <f78ae7e0d5df790f717078ff1c2ca4492f3e40f7.camel@linuxfoundation.org>
Subject: Re: [OE-core] Yocto reproducibilty issue :: rust-llvm binary
 differences
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Sundeep KOKKONDA
	 <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 01 Mar 2023 08:21:57 +0000
In-Reply-To: <CANNYZj9OEj6tK8ybuXpj6qvXWmesTk+y96qdkrm2D-p4OgQKdA@mail.gmail.com>
References: 
	<CAMKF1sp8fQHaZw=eyXD6C4qnQhLjNjZ6_upxfauEZ8jBT9egbw@mail.gmail.com>
	 <22315.1677652117161137395@lists.openembedded.org>
	 <CANNYZj9OEj6tK8ybuXpj6qvXWmesTk+y96qdkrm2D-p4OgQKdA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 08:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177873

On Wed, 2023-03-01 at 07:47 +0100, Alexander Kanavin wrote:
> You should not copy things between sysroot and ${D}. There is
> post-processing between those steps, so do it only between sysroots
> please.

I think Sundeep was trying to so something I'd suggested, which was to
inject a different copy of libLTO.so from an external build. The intent
was to check if this was the source of reproducibility problems or not.
It is unclear where the problems come from and this would isolate if it
really was the cause or not.

It looks like we may need to tweak the file being injected to have
safer paths though.

Cheers,

Richard

