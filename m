Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573C7C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 09:30:33 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.9658.1709112627176738111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 01:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bU6r0j4O;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d21a68dd3bso69942841fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 01:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709112625; x=1709717425; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J4lv5GxA4WpaNsRPo20lt/ELhHBtJpHv8iS55QDCsJE=;
        b=bU6r0j4OmaoSOk/Oj+rHTA6e9sH7Ozmja1KJwaOYOD4vB6+euQblRhSzQoxl7Ruujv
         0/SmKI0O4HkInVEpGiI2iga+7/qbU31GjPOEGelD8u0fb4cnLhSsRzDDknoqK8bNJ3de
         UshQ1ycyhfh+M8vr38NlxrlxBIzEvxufPDyAdqhZZBm0Io0AnDru8dGyxkT6PPs68Hk4
         7YMWC1qVmtCV7gDwQRzau7iVtfhhmXxM4HPU96eSUp6gL3NzkaBGLUT63qyGhngDbCES
         vVAsUAxnxp3k48khRHXsYgM4k9HJCGzb4aKU1xGgM8D1QplpigcXcfNsznN5wiWQ+sTb
         K0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709112625; x=1709717425;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4lv5GxA4WpaNsRPo20lt/ELhHBtJpHv8iS55QDCsJE=;
        b=fYN75l2UR+cdGOGL/w8cO7Onz1wCUlKvk2sxNn6rGc3Ra3YZEIaPfnWMgX1lx8JJx4
         z6QpB6Hv+ZN0kO1SqGTG9wkXmXn8Ahk+M6AnAag8FXTcg/BC8FeiSoIR3lW2dAYIUbxE
         iT0WPs3c3oYWR8drcJYOBI5k8Wqt/Cri2CXlaBsjIEALCYHQC38HFnZMhtjwRjkFWIYh
         FuODTnlF/F0rWOHg6Jq1COaRUamImWwo+Lju6Hyo/PGzbZOJmLLj/OtGFZRJ6VAA9S06
         66nCZ8QV1zchpA24iA3Hht29ZkVcjbbbBmA5qSa4lwo9Qa0uJQNobUd7dQRAtVTOm61J
         uF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLmfLgF9KLShhH+lwBNXqQIE75jOi7NSCVDWwd+5B4roOkG7xQLxbN6JCAypV7bthyYjk8fjOnkZfq01Se3eN8HDJoH9S3JJxgdmbzlk2BEmuyQuNx6rPW
X-Gm-Message-State: AOJu0YxwTEOkHGSj8t4OjSHO/vcen+9ckYdmUNXBNOUtoocr7unw5zRd
	iD5wSZXoEZ4vM7v50pvpHQIuvTnEa6iX35j2v1iYU6+ACs1oMRGpZOtbXDHYflmEfg49qNS1HV8
	29kTDAO/MeIvj4w4Ahljmm1gI7/A=
X-Google-Smtp-Source: AGHT+IGhFQh2j4i3k2H5pM/jwnROWQbzlHBS+SLBAMRKc1GlRy5VgKi5Gx1cHmIgfIag3e1arpFitzQ50mRagqJCs60=
X-Received: by 2002:a05:651c:19a5:b0:2d2:d555:9ad8 with SMTP id
 bx37-20020a05651c19a500b002d2d5559ad8mr479895ljb.53.1709112624982; Wed, 28
 Feb 2024 01:30:24 -0800 (PST)
MIME-Version: 1.0
References: <20240227071004.2402854-1-changqing.li@windriver.com>
 <CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com> <c00dd52f-0404-4c79-b579-198426f0a772@windriver.com>
In-Reply-To: <c00dd52f-0404-4c79-b579-198426f0a772@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Feb 2024 10:30:13 +0100
Message-ID: <CANNYZj__h8Zec7qJtj35zJiogKRrszCfAfmfJ+ynfC=10DsBAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V6] rxvt-unicode: Fix installing of terminfo
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196378

On Wed, 28 Feb 2024 at 02:54, Changqing Li <changqing.li@windriver.com> wrote:

> Yes, the wrong location is the only problem. V4 patch is a way to make native tic install to  a right location.
>
> but this solution (hardcode output dir to $(DESTDIR)$(datadir)/terminfo) is rejected by upstream.
>
> if use V4 patch,  we need to make it an oe specific patch.
>
>
> upstream said that to it is better to use target tic to generate the terminfo to make sure ncurses in the
>
> target environment can get the correct terminfo. That's why I changed to use target tic. but we do will met
>
> "some targets don't support usermode" problem.
>
> So what's your suggestion about this? use V4 patch?

I would suggest this:

- recipe needs to depend on ncurses-native, otherwise we have a
floating dependency on tic executable

- drop the patch, and instead just add a manual tic invocation into
do_install:append () that places the output into correct directory in
${D}. As far as I understand, what doc/Makefile does is harmless, but
you can additionally set environment variable TIC to : or
/usr/bin/true as suggested by upstream to avoid that happening.

Alex

