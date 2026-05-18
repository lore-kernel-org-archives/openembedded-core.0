Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99EFCD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:18:29 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6249.1779103101071318639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OsXrV8rD;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50fb8e9a4edso30657151cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:18:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779103100; cv=none;
        d=google.com; s=arc-20240605;
        b=Kfp2WURbwm2BuvcxoSPZfJBXtsx7Kj/rr9eJT8KSRA5ZHPG5UZyH8i1XB5s6RXl6zw
         hIbaGBmJn3VAj+JMv4MEuZhdsdubJMi67ZsyrOR+xnlIXOZGgMLCYHxgCFL6AyNS1rvI
         /NptKn38pT400iAeD900ZHFJO8v+xuVZpg1ssWgUejdTH/GmSsW0xanNaFzuF7H8J80q
         bsZfvi7r126KKgeVBagApsy5NINCpa5gZ5aILYH2/lX0X7TQSUJyEzZlFqsNoY+5D2ZK
         kIsEJozX9TjXx6RQx3xzLCpZRaYk1AV9RnCIeUrTrvNCGNQ6A5XNSL8/H7uqRDDgsQcV
         RiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=00dKZ0Z80MxtGYZ+GZ6/RibORRP7hHXpXDs+7VwsDhQ=;
        fh=doo0ozA7yuRNN7b2GA6CtH0K68k6mn/orAC/LkdRLno=;
        b=isQM70kUEO3UHQKsjkUAoNvtaWUIVTXwXPCbhMczaMBjZDu07VDJDi0WRsySD5ZR4F
         j9bZESvHjetnSbDZ41eEf4cqigp4ndUGWu/DJaNVGk3s1799qyaFMcaBbO/1nK9sfI0o
         wiGv5syV4WhECReWFnVcNE2Nj66/+S2XPIHn5GE/eCrFmdlLOJmD17nif8MdqOIyyU/T
         PqueutV0S18NQdevhT7kRybbb36TKDZhN8+j5Z6Qjm1RPUgycQnHowd9El43xd9aRVtt
         I/LUNRUxMf1O34AuMZax7q9xShJeVrVcB4ZuOgjnPvrv2wiaU9NalFWAFImxEfIohNe5
         z6PA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779103100; x=1779707900; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=00dKZ0Z80MxtGYZ+GZ6/RibORRP7hHXpXDs+7VwsDhQ=;
        b=OsXrV8rDY7RW7EErxj9e+OehJKYt9czDoHr9bgyXwDIeUkZanVy5L+r/tive9gS/AH
         5I8S6Oo3UOox7D3REIFN58XoFL/Lc9khz3+e1ql4PFH7O/NRPsOjGwXeeACJs8YIxV2I
         C3FsXlMt3fQnyY2uoEq/oyDRUFECUaoegqhfOEHLGQQ019IXrj+OOtgLLFl8a/S48w+6
         ZvwtUboYasRJjYglwP2rh4HweXr8NZOYOoZFUnUXoQan2yFF74vMNAi12lfJB+Iwws8V
         IVduyRA3UjX2ZVvwcYxWyGmhR5x+BAcwvbPZu15EMZcI0QrXtAmrlqGUeIj++vr6iBsE
         SirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103100; x=1779707900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00dKZ0Z80MxtGYZ+GZ6/RibORRP7hHXpXDs+7VwsDhQ=;
        b=jdiZYi0E+7kxIoepxO3MYODyEEV5/2nlir6o8yNd6lMDi2VqeZ/+AOWVA0TC+BsnAI
         fImjiiEI2uBbaze3CwkoWy4jHqUnnMNKtjy4I5l/MsMFbyaehDJZbuzHPeW6shgEjQkX
         nE/BzH8POzgsHtAyIvlfOg7l9XNbrSQvKoodyHsQ5NIiqt5Ifpw//4Z+HkNUOK3X3//N
         PCPO0qUOuWx7DVSt4NgIDQ4sfCJ9br/QzqgqarBkPhLS7blUg+/AkbWLfuA3yXwJaMH1
         DzaKeqxRxM/GVdv44qMzZwIFyecC0SuvtN9ZbZCd2g98+zahFK3ccZuf6iM1uvmOq2IU
         WMeg==
X-Gm-Message-State: AOJu0YxM1nv7EywTItyumq0kFVS66n8UEdxF6q35mnKOYcFLbAsFVItT
	HTZwlmDDNjUGADwscZRbnCgwcIx7Xab4kTJnWU/aW5daceOTbSmHbaCywD4fR4l/C8Z6yqBi6ZC
	/U+s4LjtjAeQhFd8g8BADHG94ljneY7M=
X-Gm-Gg: Acq92OFkL58YReV9zWis1XHR+wq4hi19wBHk70S4QbDnIA0hADW3/kAoIQrlxZ2wWxh
	t8dhwlLVeVoVT4eiPKi9N3ldxC1CtyWk2mGyDJ1+OANuZXFwpNujOPSgaAdRabvSJ10DLtcnFSf
	2uuSiCoXr6Zhk3fPpbeqriP/BhcpCQ+z6l69DXPS18e791t0gwizy+Y+xWTskPcFGo7JsWG0TrJ
	wP4cMFD9nQ2wJDHRoCffr+XKmjbKundrfO+g15XOBmN/SyBKh12wRFM0LsbwUHgUbKLfsIY5MLj
	HqUrMLFpoScq/eQeSUfH+B1XkYe1iI8mKVGexq3kPLApiEMklO+/
X-Received: by 2002:ac8:578f:0:b0:50f:9c32:509d with SMTP id
 d75a77b69052e-5165a286f00mr202468741cf.60.1779103100058; Mon, 18 May 2026
 04:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260517133241.2972125-1-joaohf@gmail.com> <20260517133241.2972125-2-joaohf@gmail.com>
 <18B0A2855B095ECF.3527974@lists.openembedded.org>
In-Reply-To: <18B0A2855B095ECF.3527974@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 May 2026 13:18:09 +0200
X-Gm-Features: AVHnY4Jtv0fKw8NxmKm6lhYJzP1s1psnKXf9G_krInbi9YKE6X6hwJe8Swn7SE0
Message-ID: <CANNYZj_koZ+4tQnydKPm_ZBx0-Cx0TFSGxmNgu1ZnPLwZoodCA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] python3targetconfig: export native python paths
To: joaohf@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237234

On Mon, 18 May 2026 at 12:35, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> Redirecting to native configuration does not look right.
> python3targetconfig class is meant specifically to provide target
> python configuration, regardless of whether the build environment is
> direct yocto, or yocto sdk.
>
> You need to check why the target sysconfigdata is not found, perhaps
> by comparing how the recipe builds in plain yocto.

Sorry, I didn't quite pay attention: this is a nativesdk- recipe
build. Neverthless, it's still a cross-build,and so it can't use
native configuration.

I sent what I think is the right fix here, please check:
https://lists.openembedded.org/g/openembedded-core/message/237233

Alex

