Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEACC5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 17:16:48 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.2400.1724778998719457810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 10:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2QfqqyE;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53343bf5eddso7655913e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724778996; x=1725383796; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kh2F77ZTpHpUYAIzfZ8HFmq25HizZLJSc6ulQgqCdyo=;
        b=k2QfqqyE92IHYPdR6l4YNeQb8ntKZh15PToKW4EEGQIrcs+oG7ulh8ZB7vAZESdjmT
         LFv+/lGxl53RJ+Ax8YlLSAr7ykflYHY4Bv2/LmVuovarpDeRsrUi/5Xcqq7z/CYi0hcp
         91N4Kq/8mxKahSnVtnnqpVy2q14GbgFRrK2PDAIVTHnnoXVcVd4ScbDujLvecu+x1lPD
         viundHUF8ZdZ0KLe+Rt13sr4adYWqNdftp0qfMsXG0e00cYIT1qAp9FnFB9lv329OwQY
         w3CrXdLg1ZdcneP9oGgNM09l8bwZU7Wlpm53D9V9Bkpmo3UxEAWXtwqaThEpBNdcOpsr
         KsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724778996; x=1725383796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh2F77ZTpHpUYAIzfZ8HFmq25HizZLJSc6ulQgqCdyo=;
        b=SsLb6a7JsBl3jLZr1uFC6gmUDz5cucM5ZnUGQu+KJPrh70NLDvnv1ZxP2bISCvOcEx
         KMcYUPSaE3TPrPvE06UuSWUNnNr9QIwL+5Ap6/6UaOepZRRO8zFtqzNv4dqpDtRmEmDH
         QWu5WtkKuSO6Uil40IQYIx6HjbVm4423XyrdrUHSEQMMO3KeBNmOLERHqh4lf6mw+pRa
         kxAqByXpHwmXh9qsN/zdyGy/8m6ENl2uZLNxmtjM3og5zyfAxhgacB01gBDa9G7ZUWX4
         Fn6EOz992gnJg9J+6JZAD16XOMhxu+VgPA7QBKD7bQ02L5riIOV/yA5DySmWccdbfXQH
         ObdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt2SRI+ONAOo/kFvUJlaeBul967iYVtJnSgrvoMBJsRhT0i8Wcs/n9gel/6XDtHqiJa2D3XdAvGEfFlrRLEYI7/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMxuLjpNqyopmsAe97N6c/u0EFsB55X2rr5/CktnODowqlHnOY
	NqPfZ2ZouhYu00ULBRIuP3JpLEQD0pmr9suJHA7hgtn3TvCLOvQeS2LCTkrNGwQwR6W2mNOZV6R
	T+uk4CSAr9v2SC4LRN9ApbDD+YtU=
X-Google-Smtp-Source: AGHT+IFQOGCNP/bjWYhysswGIf0+croc4RrIKRpHBjYDKPfBN2CbH3Sn0J06gDyuK5Vz8rwFznSk4MYnKao0+ci6yOs=
X-Received: by 2002:a2e:a9a0:0:b0:2f4:9fb:5905 with SMTP id
 38308e7fff4ca-2f514940df7mr27755151fa.0.1724778995905; Tue, 27 Aug 2024
 10:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
 <17EFA275ACF95534.20373@lists.openembedded.org> <17EFA28FD32C2C48.20373@lists.openembedded.org>
In-Reply-To: <17EFA28FD32C2C48.20373@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2024 19:16:22 +0200
Message-ID: <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Yash.Shinde@windriver.com, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 17:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203858

On Tue, 27 Aug 2024 at 18:25, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Tue, 27 Aug 2024 at 18:23, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> > I just reproduced this on autobuilder's alma9 in a private build
> > without sstate. I don't have any immediate ideas on where to start
> > looking into it, but I left the build in place, so if any of you can
> > suggest experiments or things to look at, I'd be glad to help.
>
> Oh, and I immediately got an idea after hitting 'send' :)
>
> [akanavin@alma9-ty-2 build]$ gcc --version
> gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3)
>
> I'm going to try again, with buildtools-tarball. It may be that red
> hat compiler is 'too old' anymore for rust.

... and this worked. So the easiest way out is to update alma9 config
to use buildtools.

Alex

