Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80373C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:56:31 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.8778.1661331385113281980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lUiiPjBW;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id l8so5553921lfc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4HS2RtAm2bDXWWa5lcNe0tactPx+r0L9g3AKBUN0JjY=;
        b=lUiiPjBWDuvXBgBzRIBxDIiiJTvdIITgbIPI37WOMsOgLscZZBjxuYQe77eBomdmv9
         SlEYGEm3CYRCmjBJEFgrmvqzUTS+68+bW66mZ32hfDZXH5qVj65Xe1+zMmaMGRDCEagw
         bAUPiBDijOFVtWqJvmV8cTMWYkSQD42MWIFuytm0YxieL1DIVpsyTgGteCUi2NBzbjXI
         +aYEmOWkxEdZgaGt4Jl+saskvY521YoYMAEmAIQ5O5PalvloIPimUjnkUkq/s2y691du
         T6SXycXUnIfQLBsmh3zmaKUn6hMq/rdb2B6/TmcLLEuYz7F4SwTwGlYJiZD7zvw+CEzW
         8kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4HS2RtAm2bDXWWa5lcNe0tactPx+r0L9g3AKBUN0JjY=;
        b=bY2ss9rKQAmCgmmNUm/f4uBczy7xJvxybu0scyVyAQMPOym3LA/TYpJnk5eN77NdeX
         veVCTFB5FUuVHgDn4tN0vpuA0+Gh1yHlsYhI90vJ1wivZVNjuBvBSim9HKhlD9s8KMDX
         SD8O3b12SqmnfR0XaGJ2ieLUrrTt7JPoXXUjUD+ZdQ1kJLJrIOyVbsvsURZ5Jl4WuviI
         43zHIxi7ponTm0S+HGfA22stmTsc5YNoQrKipeNY2Bsed/auxI1KetUMsyG28HznmCUU
         tZTduJf4ecTjezD+UymeKenFrWh4cuhqBDhi/uymJXHWr78YFB/adQLqsDbLrQqSmYeI
         Z8xw==
X-Gm-Message-State: ACgBeo2UeTWyy23iQbhkzdndu5Hw02P30ysAj9hZUbwCR3/GUeuatMZG
	mMQxssdYg/gOGaRfboa56aoFNF8L+AoqvYfwB28=
X-Google-Smtp-Source: 
 AA6agR6+3hwlg+QlcgeslmeNKaQIEscv/pfG8zeReF1OdlUunQJu2fd7EneqG4ZBihei0mFKt/iDKHzGEFqA288tOmI=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr9467558lfa.380.1661331383448; Wed, 24
 Aug 2022 01:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
 <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
 <d90ffe02-9459-414b-9c9c-758bfdf6355a@www.fastmail.com>
In-Reply-To: <d90ffe02-9459-414b-9c9c-758bfdf6355a@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 10:56:10 +0200
Message-ID: 
 <CANNYZj-9x5KFk-FMp9tbfDkPa-8uyhPx2R+rHvfsxufS+w1NkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:56:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169797

Thanks, can you also resend the patch with the link to the ticket included?

Alex

On Wed, 24 Aug 2022 at 10:49, Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 24 Aug 2022, at 09:30, Alexander Kanavin wrote:
> > I trust the upstream will figure this out. My goal is to avoid adding
> > more patches that are declared unsuitable for upstream, and so have to
> > be rebased until the end of time by (usually) me.
>
> OK. I have created an upstream issue: https://github.com/shadow-maint/shadow/issues/557.
>
> Andrei

