Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42141CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 06:55:57 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.37119.1760338547739220212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 23:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i9iwCQhY;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87be45cba29so10608946d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760338547; x=1760943347; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NqYqf3pQTDoWa2oMjG9dRHMaPZhj8Qy/vZqWv2KFykc=;
        b=i9iwCQhYZnA8l2lOnsPv4CIHsN9eM4d4vxHOivzdl8zMDa9538Ga+zrYTBRgK/J9aA
         lvpv/BR5T9QKytlB6q2iCOuElxYC/Tx3KcZbXWHyie9bihyLvhSdLu1VQ28x6wFKFeG0
         9cmW4o2ZsC/Nm8Mf8NpIFpoyZzoocj0PSKm1A2J8I//glW+m5RVXTd4EA8vj4K1/fndS
         D/yZ3XO8Q9HD2JHLk+5xnWGwcbj0kH0qtnryd5QQucVx8JMnAUPVOXEKzmeBVunshkXZ
         Fyp9crRsjQa+hbI8fQ1FnBz4SobGjPGs+GeIBGeADSeFQ5Xg8Y+uE72E0rQt4ebg0/+U
         zQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760338547; x=1760943347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqYqf3pQTDoWa2oMjG9dRHMaPZhj8Qy/vZqWv2KFykc=;
        b=KgeSMw5j7NQ2kPTupv3uONeyLdlsm6RswubzzQg1ItDfmjjKCvG4PVhJRHTV+E7GRk
         1EyIRvo97HLgkhjL3O0XrB09WSEkLoJ3FruO/6J3KMp/dpHDUFYjJHguaFvfphM9BYi4
         5RU3GmqSMUdbcwwCAMt3EvjAKsNhzX4/FWnqwb0q4w6D2OFg/XPDCSEZxo1pZB8K9a0M
         eLUQdvffgFBfzhhaqitDnI+21uQgGJyY2GEgAUXkctIJEXTaZ8WAk3tJXvbMuBxr+jFP
         ZdyLfW+Hfw+u0oK6M3M2Ec1DUswOoh7ujf8iidQPei08AnXP7qmJBkMO7QvDmy5VJXdN
         ebOg==
X-Gm-Message-State: AOJu0Yzd9kPlu20NXKoIY0pYSfAaEYzXC1u8E5bcNEyKHsrVDGTeHURm
	uOlLmzS4iBXcrP2H3oEymjycsGdu20LEVHflJxbWlrmtUNroNYDiiw5mVcbHtyRExdSuyJxSgKG
	xdiV1yFwqZcrxWT/55fzY9sZ9YJCC5OM=
X-Gm-Gg: ASbGncs2a0OxyOWIPEAwCJ08dkVLhFyfvMzZfBG1Ao1mHy6/l5+uYScR9/+0AzTGD0A
	ja0EwpTVrLR95V/Y+YoEMLM5PoGMYKJvGYTMncqwxN/xq2Nbej2NvUXXO36zx1ObAB4vx2gax8F
	OdlOrBzZgFpeA/7DTGvMqFcyV2ObYYdH3QW5JUijUBsoRuutVmluNdDxZIWpczYKWrsn0X5i3MI
	nehv0s0VlyptrKyXu3H5VOHm4AFV97EZZJee2wKQd0Io3JC36Ye8Lffc7WQiOGN0dIdt0ylMBi1
	OX6fsbM3DolAkeZfBrz6+aRXzA==
X-Google-Smtp-Source: AGHT+IEwQwBpRBYby5cXBowh2chI12N+w8jdS26ss8JBInrFZbcdrgv+rp4nJYaDuOUd8EhaJW/ZNkc6ihT2AKXrm4M=
X-Received: by 2002:ad4:5ca6:0:b0:798:acd7:2bb with SMTP id
 6a1803df08f44-87b2efdb179mr260665866d6.51.1760338546739; Sun, 12 Oct 2025
 23:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <186DF8D2507720C0.3474@lists.openembedded.org> <AS1PR10MB5697EDF33ABB021BFA11FB7BFDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697EDF33ABB021BFA11FB7BFDEAA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Oct 2025 08:55:34 +0200
X-Gm-Features: AS18NWApl5vxHSePg7sFaE97AVHtCnaMkQwBXCT7Fk3MjmVz6_MMqqyGtyCbtnA
Message-ID: <CANNYZj8ynORdNtr+nxm_Mbv=O_hMjoa2uhFJZ_OUH-t12vpnfg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.4
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 06:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224763

On Mon, 13 Oct 2025 at 08:26, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +Upstream-Status: Backport [TODO]
>
> I'm currently unable to register myself in sqlite forum.
> Either registration is not working or our email system blocks it.
>
> Would be great if someone else who has account or can register posts this patch there for comments.
> Alternatively I could make this Inappropriate [oe-specific] for time being...

There's some rather discouraging language about making contributions
to sqlite here:
https://sqlite.org/copyright.html

They basically want to keep it public domain (why?) and thus require a
declaration from any contributor that their code is such (without
offering any specific help in doing that).

I'd say this is too much of a hurdle, posting a patch on the forum is
not going to count as an actual submission (they would have to
'rewrite' the patch, whatever that means in case of trivial/simple
submissions), and it's probably best to mark the patch as
Inappropriate, explaining this, and noting that registration on the
forum (to at least report the issue) didn't succeed.

Alex

