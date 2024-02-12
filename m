Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267DEC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:18:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.6136.1707743929835649832
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:18:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UhSD/3/h;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51182ece606so1245516e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 05:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707743928; x=1708348728; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V2oYngVEi3nh5ALzwbkOurIguM7UUQHC6AJV76yZVqg=;
        b=UhSD/3/hEbt5c0Xxr9ZjDSfElCv6Pu7Kmg7IV0WhSkBJOD3u7qdkt5hTSslixmsSBN
         3wNMhZ7Dnt027rKVE0drIlj56fGtRs/LMvUaU+/h/lYfAix8yx2zKAEdgApc4Hjn4lj6
         6zXBTWU0qGYTTq8IdrrBZrt+6GDq+SKV6tQnRKtWGpKjRdZyv9qWuc/gBeVV2VPDadn9
         Z07JQs1ztV15RGgRK/WaKncr0rBgJ9dFy24KyDOaHiHqRBlCHCoAylDLrksqEEZiYeIY
         6ZaUY1UHBZmT0XzZAGlZfXKOiMsq0ZFnOX2gtDV8Nog67hVszL4Tvzf/q0D+vyDdnvso
         H64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707743928; x=1708348728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2oYngVEi3nh5ALzwbkOurIguM7UUQHC6AJV76yZVqg=;
        b=wHkalrdAfuD9ue9uGGsqJcFZUIQnQO/dsuALguSMlle7g0tcDPrRmRY9zd+tlKBmrx
         FBMjX5m1iJBjIB8+17L5ATDkmX8mxrfzbM4i47cwcgzsGfBAqDWoEw0OhIpR0XM6+32a
         jzoUEkNIR+x7TGa3lXB3xYID0Tl9iHmQRJK1hFy8h3nRb33d4Hugw7KZgaa59GWPloDr
         7Ud4IAC6n22NnSr6IQVKqaOQ2VUnSf0NPVRlgLoqCfpaPaiJyN1uF0EDM1PT2HqX+/zu
         6mhXvE8i3NtRxAgImzxgmcoCpDnNQ6g4fymRLZHPTIGjyzH5d/0tRIBATR5CV5vOZoTd
         dGXg==
X-Gm-Message-State: AOJu0YxH0iNnWMyguryDko8/vVMLS9lhX1Bf5vjTqMUdUtqxLeKbFExm
	DZw5V2yEn02l9nuyGxdhMt+UwPqkT/1MsB9ON+VMbZ/THwrOyzlZ+ZBPi0NgSkxBjgN1KaTmHBR
	xRu1s7Ddz81s16gQL6xdmoLdjCMQ=
X-Google-Smtp-Source: AGHT+IEQwjP0Yl8zTeq2xd1DKyhRs9M7t0ONlmOJRxE7fNuKUPh2iuU2q10y+pxHpkO1aQkzGYDtvynpEFLiBIEkpc0=
X-Received: by 2002:a05:6512:ba4:b0:511:947f:7eec with SMTP id
 b36-20020a0565120ba400b00511947f7eecmr141813lfv.7.1707743927716; Mon, 12 Feb
 2024 05:18:47 -0800 (PST)
MIME-Version: 1.0
References: <19b4555c2cc17fca8f53064fc7e77a50e14d9e47.camel@ew.tq-group.com>
In-Reply-To: <19b4555c2cc17fca8f53064fc7e77a50e14d9e47.camel@ew.tq-group.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Feb 2024 14:18:36 +0100
Message-ID: <CANNYZj9nSGUMTgh4VpCLpy736hKvfjtOpRJnZSbh4ZYb1QQbtQ@mail.gmail.com>
Subject: Re: [OE-core] populate_sdk_ext.bbclass: include files for auto.conf
 are not handled
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195319

On Mon, 12 Feb 2024 at 14:06, Markus Niebel
<Markus.Niebel@ew.tq-group.com> wrote:
> just a question because I'm not sure if this is an error / issue or if I missed a piece of documentation:
>
> Part of populate_sdk_ext.bbclass is assembling of the current configuration from the conf directory. When files like auto.conf use the 'include' statement the files to be included are not copied.
> This will lead to an error in do_populate_sdk_ext.
>
> Question: Is this intended, e.g. 'include' shall not be used for files under 'conf' or should this work?
>
> Use case: separation of configurations sharing most things and bring in slightly differences via includes.

There is nothing in code that indicates it is expected to work. So I
believe build/conf/ should not contain anything except .conf files. If
you include things in them, the include files should be placed in a
layer, and eSDK task copies layers wholesale.

Alex

