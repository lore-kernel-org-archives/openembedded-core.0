Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2B9C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:51:00 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.7538.1739440258620374350
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+Z1II/u;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ddcff5a823so5077036d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739440258; x=1740045058; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R3VTwUdrLCV+ynrZfHssqagIIlH45lkqhWpNfhBmz48=;
        b=H+Z1II/u+EuAcB+my2isgTHZYcveSvwEO2WorDnnxeAt9DfgtUNgUU4KJ0iXkLTHk8
         XQiJ016gF9NuDzjAH8PfK44o0QKvPzXiuP7XS0iuxaQcZP59BKfeh3bdwmKYG8NI+uKj
         DRV8xgKXzx89gS4Po64qaxKlOe8FNNOZzGIXC4zU7CyA38/h+79ZGz1HoUCkgGA6UN24
         IP8KJfNXQwytZPKommpduIrAv6THf9ZXMmADtGnHHVPI4rKbm/0X1fYgDp81rBhnuNXa
         ZKLjGA5JMHk21Onrrgl0ka53u0/bSSzmn0jjp79LDI+TI7O8riKkjVFhbHY3Vvm9/JIB
         VtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440258; x=1740045058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3VTwUdrLCV+ynrZfHssqagIIlH45lkqhWpNfhBmz48=;
        b=AAASc/d5qaH3PTT+FT9P1OVIPgfmNI95Uea455o8KJk8/UDutLO6OG9vV5U28etd7K
         YoxECcESDd7lH/KwEX58EADCOfsNh5XLR6OIclgYC/3JuVxYs6NcZUHZ74wY1JAGrFhC
         vBFaiiXv0/mS4eQbRtrCnqmd/1OdOOr7EJFh2q0lMyUpeJJBr3Hi90Ahc7vUeWmETgy+
         dghwCVLWIeXtnXcl2ZTgvG6wpljfJUuYXwePjf3WJ4OmJPX1LJgaGXczruRDOJwnthuX
         ein+G5mE2l26f1VI8kCXxicB9T79j9zczq0NM84aAm6lTd0+Ez58SbZow7JbRBYKEjlH
         JkQA==
X-Forwarded-Encrypted: i=1; AJvYcCUrXXEi53YullfIzP1D7+ymGD6PAI+atQoBKeGfZxKho342tOXUTBzFC5PDxf9kcV523Vk5a2oHhzeSIiM4Og0JHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWF3W74RJbbcBEEqA5Zoy78yCwB4EecIsUHUeN1TV9ra1UXAlo
	54OdPd/PfR9gHdRtH/cMv32xoLsO7Jp9FnG5JaT72ZVLYnWfFN+Dm9kyFNa1c1VtsU069jaxWFF
	H69N7aoOGkAvE1BPj9DtNj0IGczU=
X-Gm-Gg: ASbGncuuP83qsvLB0AHZSknYQnhwOFbzD+sV9yMgTo3Ej3uz2D2l7XNQXGxdtc7GNra
	jbYKzTYzfAADS+Vc6Pf93YlIy2NHYGYdC9C4sUkktV+6LP5avItCUwCKOI1amCwdWT86/+8rrgR
	3mhZVeozHSmO1L8Dgd9okLLdi4anfvDpA=
X-Google-Smtp-Source: AGHT+IE6oPk96o0T21m8Bx1EAI4AGf0QdgAWg5ulE0Jzg/n/6pAUXM9kHXVBJAY2uNyKElrP6YwyfaFHLd7BKBg0Vok=
X-Received: by 2002:ad4:574e:0:b0:6e6:6071:64d2 with SMTP id
 6a1803df08f44-6e660716758mr10138876d6.7.1739440257750; Thu, 13 Feb 2025
 01:50:57 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com> <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
In-Reply-To: <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2025 10:50:46 +0100
X-Gm-Features: AWEUYZmtfxQ_Cu7H5fCEGJJRhRRD9e8aKPo64KZlmHSktAh7-1w8wtYcmybEeNE
Message-ID: <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211311

On Thu, 13 Feb 2025 at 10:45, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I don't think the github repo is going to work for either YP or OE
> since there are repositories in both that use pull requests and we
> can't have a one size fits all message. I think that means we would
> have to do this with a .github directory in the repos themselves.
>
> Also note, the global repos probably need TSC agreement. On a per repo
> basis it would fall to the maintainer.
>
> Yoann: Thanks for looking into this!

Alright. Then Yoann, can you propose patches specifically to these
two, with the aim of gently pushing back against new pull
requests/redirecting them to mailing list? It doesn't need to be
perfect, just a proposal (or several proposals) that we can select
from and refine.

https://github.com/openembedded/bitbake
https://github.com/openembedded/openembedded-core

Alex

