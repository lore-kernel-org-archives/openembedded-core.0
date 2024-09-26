Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D46CCFA13
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 09:58:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.39133.1727344730684229606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 02:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTPLaAGt;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f75c0b78fbso8918291fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344729; x=1727949529; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d9yy860gO7CBiqqpDHx84X1i5j7IXQEKtDO1Es2QBT0=;
        b=HTPLaAGt8dNkxmQEq0SfR1X7Yg0pr6wY4vyKBUITXam2wxuY0CtEOZYAiZhq/7Q2Nd
         O7G/f8jfUEfVo19wOmZ8Bs2/+cukRheQEWMWjjKh5L7FwOTlpm+Uc6LRuZu+yYFwCAFa
         0tGwdiqS76IcS3veK+3QhdaCOml+mcNO/FVMfXj22RLXOqWjj+QG0aFbwR24fsK/CR7t
         3imPCdx53Wa8QY2N6xOZ+pzBVjfCpTGgdO/LWwIAQ1UFq9dYZpl009wTXg1lcXJaIWMB
         Ux8q8XOilVLURiSE3HssqSD6Bm4NW8evFWxfht4bTCIColTSPLORh/PnH446X3QQ3uBd
         WrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344729; x=1727949529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9yy860gO7CBiqqpDHx84X1i5j7IXQEKtDO1Es2QBT0=;
        b=fo0GkqZo01f1P5uxmaZLIHp2a/QidJgQ1RZZCHoHXlnQZV70AMZHyZs3T6tXNXwUuJ
         M8Mkusq65IyWUXe5bmq/RsgEf+Sfyf1fVkQWZ/4hyC434XYxm/QmuA76mHmUqCiPnTvv
         JkdIhekrg2nu+nnjVpOByh9+CzKwk+y+oF92I29XES/Brh1MfmKiCzaiFQyqTlQRIBuS
         ZMrwKJwBYLfZ/sS8MkSP3Rr8F78eZVE5BL41LG6HrGoYSxE0MtcMo0cwuqrStDu0MVc7
         XOv5ikNQVHOC6wHjGTay92Bx+CnxIFSP+48lMAHgl682jCImR4ZF7r3U8Q7cY2lfeg7I
         ovVA==
X-Forwarded-Encrypted: i=1; AJvYcCWhdT8jmukoJQ0ZiQeVOuXa6XoBmo69PHQoxBW+KCv9VZOMMs1Du6IZnL2al65xhd1UH6g4S5KIhGirzsb0RG79ug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTm8DAPN1kuIyqP8ggg3BmR5cPBB+sAumCTdtEgaUPDgglu8E/
	fChpC047xlqn7/FO4Qgi2dJ7qQjk6rwpV5ttLGVkBCpEiulYczx7fwF2SIYMyJf206pF0eq4KPx
	AELANa77JksshABp4OOx63OJQ264j9DBz
X-Google-Smtp-Source: AGHT+IFpG0Py9aMeJBP5jlC9LXIQRfDQHKdxW91qt9j+eVf7/PAgi7dOtEK01Ry1/mV8qyPtD8QAkoPxbGbFtu1Q7pY=
X-Received: by 2002:a2e:f19:0:b0:2f3:eabc:d267 with SMTP id
 38308e7fff4ca-2f91b25aff4mr26875901fa.30.1727344728514; Thu, 26 Sep 2024
 02:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240813031628.1123492-1-tim.orling@konsulko.com>
 <20240814225104ed116094@mail.local> <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
 <a11cc259b50cbc7edb9daf959ae92e107f363144.camel@linuxfoundation.org> <17F87AF6EAFDA641.14701@lists.openembedded.org>
In-Reply-To: <17F87AF6EAFDA641.14701@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Sep 2024 11:58:37 +0200
Message-ID: <CANNYZj9tuf_rrJH+r86CDsxtgvkfVY1c6g13R_6PPhUJW3pXEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography{-vectors}: upgrade 42.0.8
 -> 43.0.0
To: alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org, tim.orling@konsulko.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 09:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204972

On Wed, 25 Sept 2024 at 14:01, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > So the question is what is writing that file and is it doing it based
> > on something like "ls" output which just lists the order on disk? If
> > that is true you can thrown a sort in somewhere...
>
> Note that neither is sorted. I just built this with the in-progress
> python 3.13 update, and with that the entries do seem to be sorted, so
> it seems the problem will disappear with that update.

Sadly this was a premature celebration. This was the case in my local
build, but on the autobuilder (test python 3.13 build) it again fails
in the same non-sorted way:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240925-w8kid2em/packages/diff-html/

Alex

