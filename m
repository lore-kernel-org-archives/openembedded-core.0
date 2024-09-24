Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13642CF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 10:53:43 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.10918.1727175216265917859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 03:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O9xdQRQC;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f74e613a10so80318331fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727175214; x=1727780014; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ydbo2NpQU+NNIAdcqZys31itAouk5LwkHlzAQgiu7uw=;
        b=O9xdQRQC7HUE8NVjYV6U7WKCCmQQ9/4x3FgofcEGJm8bszDnr7rQgc1v2ViHcR5RjQ
         TeWXapxhyTp/ESC6+Ht3RzM+NODsRVMS4+n5agYZjuZWcsKAnpzQuz//kBEjbIhgxPB2
         YSf49kDeOjFpVG469ALq66I7fMy7Js+o8Hn9e0qoKiYx55zDQ6C2KsAMsFL5ytsqCJ7x
         hyGT6fA0WNBEy75gs9D6HFtw7Hlvz7cRFSwvXtNaBHwEhXCNuAD/hHZhnD4Hya5kxxpl
         8dMI6suA22ZrjIjx5n/HiqkFKYKc668rilxmc8DWjvmAL11TjvPTYCflqrO1HMH+jHof
         diqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727175214; x=1727780014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydbo2NpQU+NNIAdcqZys31itAouk5LwkHlzAQgiu7uw=;
        b=D9AtqOca4CNsCRgK76kaEU8B1aFbxngqU33KiYFuziUdaewq8x8r8jUfyDYsvIggOR
         6KnJoQYo0VQ0xhn0eOnCrCMDIWvdFTNZqMsQAAIRHCh8yaM90/cl3Q09R348WJHZEi1b
         AtJMcKOgVwcwavHlxZTUnOnp2AiWvGw1zGk/SMO4IY5wfMBjxlLV81ha2sXvT/Bb/nrp
         pDWsWdwy++IZ60TaMzpxBL/G4JeTwU5pWqxaAuFK/79RuJrLjiu/WxXfmOfFhqA8lto2
         W0bDY203/mNFG0ACGRX1j1eHo0EQdsYTs8+hujZot04cXnQo7aQF8AERZ5dqWBWNoVls
         Ybvg==
X-Gm-Message-State: AOJu0YyPI0F/sigjKrE+EQxCJKYCQmF2wusc7tSgiRBLfGbWyU4tS3iS
	75dWFyWcjHlRM69eR80st/k9Wd55GtvHEt9H9lMTM2l9snk9ovGRAJ0Y9LQKci3cCjIa1fQ2H3w
	hOhb0AbwuQxpFjaTOssm6qoXPd+k=
X-Google-Smtp-Source: AGHT+IGcGbmuAmh8qPpvl6bNCX3WJdEFwf+64ThhIVFBhHZc8wwz1EXwH/hcOEO7JDJVAlhExus3kNPZsbSKGGKT0h8=
X-Received: by 2002:a05:6512:3087:b0:536:741a:6bc5 with SMTP id
 2adb3069b0e04-536ac2d6aadmr11289332e87.12.1727175213882; Tue, 24 Sep 2024
 03:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240923234336.3978188-1-raj.khem@gmail.com> <CANNYZj9jZywpqjYRZhtxPZTE6g8T=G2gsF2K86MwPxNXoVdnAQ@mail.gmail.com>
 <CAMKF1srvUpsSATHsf-YPrVg8umGPJR44aPOr6bGKukFBdAXTyg@mail.gmail.com>
In-Reply-To: <CAMKF1srvUpsSATHsf-YPrVg8umGPJR44aPOr6bGKukFBdAXTyg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Sep 2024 12:53:22 +0200
Message-ID: <CANNYZj_4_YfQJi=FLcwi=g8FLMjA9y2-u9Rm5xgML3LxSc3QEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: Upgrade to 0.78.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 10:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204844

On Tue, 24 Sept 2024 at 07:27, Khem Raj <raj.khem@gmail.com> wrote:
> > How can the crash be reproduced? This must be specified. Could it be specific to your setup? Qemu usermode is pretty robust with standard poky.
> >
> It could be my setup but I could see it with clang and gcc and I left it there.
> Its a bit convoluted to reproduce since its in generated program which
> is called via another wrapper over qemu usermode,
> here is the cmdline which can be used. After do_compile task is run for vte.
> https://snips.sh/f/sREktUGD0f

I think it is your setup. I just built this update on poky qemuarm
with g-i re-enabled, and it worked (both glibc and musl). So you need
to narrow it down to something else, disabling it for everyone isn't
correct.

Alex

