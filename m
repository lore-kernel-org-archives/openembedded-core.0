Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69874C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 11:36:22 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.87998.1677497773355056235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 03:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M+4/eszR;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id g18so3958605ljl.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 03:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677497771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDg+43ucKD7DXHhYFlrdL1uLD6opuv+FiLUp0Sk6/og=;
        b=M+4/eszRHhBN1KGk/EHYZC0ZQGzHLUsvrY43WmHnvQ9JJ7OIxPtfy+2qulKJR8vSw3
         wnP+Tre1CmHZVOlH04UAcHkJFbz+uGjqAZbjHPm9E6enhuxdLa+7fFv+iOzbIBkNgDYo
         IV6HwAS8bO7mNm1+3MpD22+I1vi2uNfPEIyuRjT9GGL//79XvMXbRvMNh3eOLbacngeN
         gbTx3Pw+YqlKVEHw3AS2soRdAVQ3u1rQC2SOZG49/pZiGTamWCBYxQNpLAfzXQov5YdN
         NcKtMdEJr0om1RS0XK7uYF5Q+Z0tfh2qeUuYuI3Xf+/Yfd7hlIzzJ19WNYeZLDnscZo8
         X7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677497771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDg+43ucKD7DXHhYFlrdL1uLD6opuv+FiLUp0Sk6/og=;
        b=u4wM08oOpn2Po4hKKjRIqJNfpmvUZfDeaD6BKa1H0lXp309jlfKmXdXRm0oyugSVzT
         m60ccteHpbfGOTBY0dUHSmFbcGhAf6ox/t81M0ao//F+BXq4wq4MUuHe/Mtso3pFcA0a
         96f9MTLWy0rTzN3SBN8N1t4AT56OsRTDJnxmUd9IjKoyk3PBvvIJLkwP9xL80HNkCieb
         JKPU+wkbiONL5AYikUoFDKS6TMfFTz0tgrgdncFCa6PIcFcKj5WvOxqGC9kFYRx9vYui
         +AovRRT7aLzHae/x9NrWvgI2fhgk9v6M8erE65kFiD3MN2gzB33CKGxGN8jqQAWp+xCN
         TB4A==
X-Gm-Message-State: AO0yUKWACqsItafesHWWQPcUPLxH5atFScvMpHQ/z6DEQaguoo5MI+o3
	APsSEgerPamB3cHlnQ0t48wzmULYGIqX1NOd7VA=
X-Google-Smtp-Source: AK7set+GT+H6k1/M7DYnYT7ZPmoOHs/U2O8dgrQIQJSdM3sJk6oFF8JH6a2sDAHT4KaemFUXLUVO4lybb+udQi+xQ24=
X-Received: by 2002:a2e:8e32:0:b0:293:5f43:c7b0 with SMTP id
 r18-20020a2e8e32000000b002935f43c7b0mr7257083ljk.5.1677497771449; Mon, 27 Feb
 2023 03:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com> <17479FC3A76A2964.29542@lists.openembedded.org>
 <CAO5Uq5R0gJUJuE6kMfsPd4BT5Psy=nVPnLMuYbYVfH3OgC5rpA@mail.gmail.com>
 <9e42abc2-7920-8a01-cc49-53d2e9f66150@gmail.com> <CAO5Uq5Q+zRcvQ1zCY23p2eRFd9HQbXpoKFifnmPsG82jiDMX-g@mail.gmail.com>
In-Reply-To: <CAO5Uq5Q+zRcvQ1zCY23p2eRFd9HQbXpoKFifnmPsG82jiDMX-g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 12:36:00 +0100
Message-ID: <CANNYZj9JpNdu5hP=wyYB-6qmTgmkEeaeXgGuf=wJK-PMXhrH1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: Alex Kiernan <alex.kiernan@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 11:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177789

On Mon, 27 Feb 2023 at 12:28, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> Reading your recipe, it looks to me like your libclang dependency is
> resolving from rust-native, as you've no DEPENDS to bring clang-native
> into your recipe's sysroot-native.

That cannot be because rust-native doesn't depend on meta-clang
either. It does build rust-llvm though. So maybe meta-clang is not
needed after all?

Just to ensure that the recipe ends up in the right place; there's an
open PR to add it to meta-clang, but I'm not sure that is the correct
destination.

Alex

