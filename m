Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC6CC5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 16:25:27 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.1266.1724775920504269662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 09:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHZfN4Tw;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-533488ffaebso6934689e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775918; x=1725380718; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e6lBTviHym57jMCYJlotsSfHCu7edhw+iJlF8aAXfcU=;
        b=cHZfN4TwJ9wG+dUp/d2Y6cW9eLOrAUhYfwW3I7GxgN0WFDiASaP5YVU+t0Rxhh3mB5
         pxtpGWi8ZIh/vrEufgApuTjthJo5Xm1a2GSArsEIQHS/UlLuOc5qSh5h1jGJKMN31qzj
         piFYMPnhiJEArqU7jJn5MC8tZ59GQmxEZc00wS0yiV1idkamggTYSYOsQbMkJEG8LM0S
         RwNFfNBZSAF5NyJnkcKmro9hYe8wM3yJBiqWOp+xQ/NwCFkoP2a/HktmVhuWSBxbFtcl
         hyNJStyHUh72piT2BO4J5Y8I9yArefqW8NVBfI0r9lfyNZ+kA9kuo4FrKcLJFmJhwvji
         KK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775918; x=1725380718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e6lBTviHym57jMCYJlotsSfHCu7edhw+iJlF8aAXfcU=;
        b=mS6RUEbKLTSXX+/bk3ih0VgKTaOIaXfRsid6asZzTkpmwLfF18BkNqXoBMzKA2TQ/W
         T1n563volY/2GWQCEnVFXuOvGIj42ZbY9oSrKPfpZCtXOwglYHY0v87ttBY5n8/ECVRF
         FHc0HQuu/Y1lF6kA6c5YEC1WLVGh0ToLRqK7WUcsH6hznqwSaibmZ2WOoaKA9TqsxIlq
         GtWPd3f8pkstl96CJeLK77M5u0gNncXrzKCsT1C7DCZRA8bH6kQjYsZCBb+Mwfld/n/n
         SgzrHenQG0vxywsWjLMbkiITpXjFNFVNUj3v/eUT6WPkgtV02ykkFfdSzvuEZylDplPh
         zaFA==
X-Forwarded-Encrypted: i=1; AJvYcCUlriHMxA2NGVFV6y5djAj62JMNsYt6YxH/fXYWk9N1J2Jd9usq02T4GHm2ix3ynW4zXO5AiKaX/BZyCO5yuea/gA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwU3yVBRSP7uxOpWUefjqEi01JH/McpAp2bDtXOefEuE2eP6Zfv
	ji9YQlw3/dNjIJL4n6tP+18D0hGALKt3MU7C5YfBK9XlL4K62Kro9aeuhSgeyMGnmHfHhBXtScM
	norMN5VK1x+dUoqabTjmaDNwBMFU=
X-Google-Smtp-Source: AGHT+IGEuiEKLR7SdO0oy8UCVzNsoFJ2pI1hW0wycuVi8teFx8UglvWVgopS6Als/SymZsCtk31/KlB/TjkECgmZ2iQ=
X-Received: by 2002:a05:6512:108b:b0:52b:bd90:29c8 with SMTP id
 2adb3069b0e04-534387bebb8mr7267439e87.60.1724775917911; Tue, 27 Aug 2024
 09:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
 <17EFA275ACF95534.20373@lists.openembedded.org>
In-Reply-To: <17EFA275ACF95534.20373@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2024 18:25:06 +0200
Message-ID: <CANNYZj90RNiowNW8JLXmpC1Ki0S53J55_V8=R67QH7hxVNyU1Q@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 16:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203853

On Tue, 27 Aug 2024 at 18:23, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> I just reproduced this on autobuilder's alma9 in a private build
> without sstate. I don't have any immediate ideas on where to start
> looking into it, but I left the build in place, so if any of you can
> suggest experiments or things to look at, I'd be glad to help.

Oh, and I immediately got an idea after hitting 'send' :)

[akanavin@alma9-ty-2 build]$ gcc --version
gcc (GCC) 11.4.1 20231218 (Red Hat 11.4.1-3)

I'm going to try again, with buildtools-tarball. It may be that red
hat compiler is 'too old' anymore for rust.

Alex

