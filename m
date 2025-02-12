Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836DAC0219E
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:38:45 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.11332.1739353117426582645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 01:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czdSChQ7;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e45af17a2eso192196d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 01:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739353116; x=1739957916; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ax/VPM0gAQJojqfI1ksPsGjVAyrCjPGpUb3HzHg9Tk=;
        b=czdSChQ7cW/oETgoudv4KZ0YGTRrfMSuzXvdpTCbEGAwHZ4GDIkNAwbJUP7TKydK9W
         qGF1R3tSfiCgKlNfb7oYfYWJXTP2MIVj+4BHl5DPPTpzdwnxma9KRy9wRmJbgJV6g1Kz
         G/5eXGjMqYFcr4yoXojtL4WhwrV68RE5VclDVPLs+T8tCWhwwobJ1i04igH+e64UZSI2
         g3MtHUkSYV7D3YCcAspJKL8mkY0BwZKHufhDQFe3iG3wsKC0x+ugf7jbbrUR/pfG9BDJ
         b1AxoyiT9xVvwa2ud9GZvndFGhpOGUN6iqUL+3ildmLs5GHs96+iHp1DUm2F9UsZwTfV
         44Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353116; x=1739957916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ax/VPM0gAQJojqfI1ksPsGjVAyrCjPGpUb3HzHg9Tk=;
        b=PJ5p8YcHJ+IiFOv+tnvI0FqUu+kh8IRFNXdFMppsfaGasxeWAoFjD81t/kV245FDMF
         qrXmc5RBni4rQJNfpWgmvkgsuU8t5PuL034QFPgMlbq9vqWMRgCFm2Qt2ZRmoqy05A27
         7MLN5WVTzr4GkdjtLiPz9+v5nRzVaDtQ0KBSiGvJBa4cEM5tUbA/UCmQh/yfcvEWtF3l
         xIss5mQyn1A5WK3aaYmyaT40p24rqyhITuV+5tYLeC70Cx/SjZMvugMIabgBIclJplax
         BWC3d99H2D022xfWE7oczXXRVKa1hCWpR3GpqShbr/1KhQvUL17ivgik1e1bRx3VMgR9
         g7cw==
X-Forwarded-Encrypted: i=1; AJvYcCX7E+Vl9Ab0jdeDKUIPXnOJshDYZsX44zKQsIzFQjloFovPPSNQtX/rlowBFmeyhZLONNcLVFBcvlmMTUMcxp2h4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywaa3ubF1B4KZyezYsJSLYKmQMSix/5GSzPMxQ/Ze4vWCUWx/zs
	iFH5WRKPcfpfLaRafNZjjDCQKndS64biirlS6zEnZJZKHJ31MnSBxvRFR5UN0afIVxhB3XkoATr
	ltlgz51tDxR7eF7+Prc0vYaw/A6E=
X-Gm-Gg: ASbGncuQ8+mWRSMqhFqCwvEmEaR54+164oFA034c5CN+g/R7eVoNcY2p7m89jfopBGr
	1gg4bUmWn8cQ8Yryyxj5Zy5Z6+vMBvAeeY/JZlbIUMAXOY2nxG/GssFxKYim4MkEdppxwZcseQW
	qB0uCX8zArfoRcYlkZ2OpycVIanIEyzME=
X-Google-Smtp-Source: AGHT+IFP9b+wG9R4fgq9e+3s7nnZPw1Se8c2YvTnVe3+istfcMv617bjEqT/DVlXPBEYiUv6+yfPf1iiSns6q5COS8Y=
X-Received: by 2002:a05:6214:482:b0:6e4:4484:f358 with SMTP id
 6a1803df08f44-6e46edad857mr42408156d6.33.1739353116459; Wed, 12 Feb 2025
 01:38:36 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org> <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
In-Reply-To: <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 10:38:25 +0100
X-Gm-Features: AWEUYZmrCFLBvJxisVCKQn8vMjQFb1nuK0rm34bHn3Mr2BZXbwQcx0JWJyimo30
Message-ID: <CANNYZj-ijxTudoYuU5g=_QH5D5ce4zC=EW2rNbiMKY3iBktisw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Yoann Congal <yoann.congal@smile.fr>
Cc: yocto@lists.yoctoproject.org, richard.purdie@linuxfoundation.org, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:38:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211215

On Wed, 12 Feb 2025 at 09:08, Yoann Congal <yoann.congal@smile.fr> wrote:

> We can try things to push users out of github :
> * using the PR template (the text pre-filled for the new PR description) to convey the same info

I think this is the best option, and shouldn't be hard to add as it's
a standard github setting? Once we have that, I'd take a look at
what's open, but not before.

I also do dislike that all of this discussion around creating those
mirrors happened behind closed doors, at least I have no recollection
of it.

Alex

