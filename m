Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B53C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:12:28 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.53828.1697807540172926579
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JbuMoF45;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c51f5a1ecdso21814051fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 06:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697807538; x=1698412338; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GetR9CLtBYvAODkx1ObBVAWA0pr7JLKU/MGWqsedMQo=;
        b=JbuMoF45+fzJdloU7VuL9sOjNtw5P/1wiDfilvf9eUScJqIgyK8XDnLg2CbN6lUUwQ
         1t0DWznq4xoNyRpi+FkH2QQnWhyAtKe9OcbHqucgoF/SQhUo/+mrSGzVoyPiVzLOkM/W
         0xnGkgsTylhs8LJjazEFqtgp2Oas8GDSj9Te4G5WPd+ADAnha7Qs4oIGorS8v8x+1wnx
         UxPNsHSwdxZuGFfyXvDzfV/9U7IW98AKpO1sRnHSi9SW79fUUCKUNSShHzMFx/qa1jpg
         aLSPKw2kLJT3K7rdlTEaeQqW/Gra2N/+UPIuyJvSiT6GFdMcOMtbQ5q0uYANdVdjgVHV
         4EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697807538; x=1698412338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GetR9CLtBYvAODkx1ObBVAWA0pr7JLKU/MGWqsedMQo=;
        b=EuxE5nT6URbtwWR9G7A0jFB5xhCOOwmn8chUxyBXobt/1kKwg8XZt858NOrDIR1Y56
         hUvAg6G9zcxX7skxOmosYJZk3T9he236NvTBgFwUE/8aM7XaH1L8QKxn+wa4IpXPrVsy
         NoAPiC7iu6/FzY9atNEOWUT9BqEia+xCn3e9exUf8Y1DJ2fR3jLlEjV/4lyfVEDCa1dj
         RomfuEUCDiKYD3ctobTUrJVMu7R6/Qka3MSVDbjpQ53A722UhTE/d/6XsQpIJghASDx9
         GkQeDjH5gZ+GwyUupKr4Kwk9J/H++BrDD47qEuUrRS3wKd9v9S/zdv8QcQ7FcJFQmYFt
         I+zw==
X-Gm-Message-State: AOJu0YwGZiGJ2ER+KyHuW4tmHZHfiEOOO0v3XilKnI/8kHCz0byANTG9
	sxVOkn0lYlztQXjWNgclPT/oR/LIV87ZIUsK7B4=
X-Google-Smtp-Source: AGHT+IGxqHyo8HxOGNCvN+xrEqGIfsG1peCh6wQjEGG4bCnOyrlbBwc2HLfi3EW1ZzXFBAjLpLeVd9RUJx4PScLeI5A=
X-Received: by 2002:a2e:9490:0:b0:2c5:985:2484 with SMTP id
 c16-20020a2e9490000000b002c509852484mr1686761ljh.4.1697807538055; Fri, 20 Oct
 2023 06:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231018084652.900785-1-alex@linutronix.de> <20231018193932e6cb99ef@mail.local>
In-Reply-To: <20231018193932e6cb99ef@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Oct 2023 15:12:06 +0200
Message-ID: <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for 'bitbake
 -S printdiff'
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189527

On Wed, 18 Oct 2023 at 21:39, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> ERROR: Can't find a task we're supposed to have written out? (hash: e79d70b9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?
> ERROR: Can't find a task we're supposed to have written out? (hash: 999250461834bf74545962a8577bc26854a3d08bb2a96140d5efe314e0ef2d63)?

This is proving tricky to reproduce. It happens fairly reliably in
oe-selftest-armhost, but so far never on regular oe-selftest, or in
standalone local build on an arm host where I run only the selftests
that are failing. It seems like one of those dreaded selftest things
that fail only in particular execution order with other tests.

The only idea I have right now is to run specially configured
oe-selftest-armhost which would run only a subset (e.g. just
sstatetests) and see if it can be narrowed down from there.

I'm also tempted to set this aside for now as it has all the signs of
protracted, painful debugging slog, and push the esdk/sstate build
registry subject, so there's something to show for it soon.

Alex

