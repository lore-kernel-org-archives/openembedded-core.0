Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C86C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:45:30 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.7465.1739439924655631204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K9ndIuPk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so195894f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739439923; x=1740044723; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Lq+wdJAgy65VtQEVXM0Xp1rH7CuE+rdiJO8OxFNGGA=;
        b=K9ndIuPk+QUSS6zGq/YFIFav+p7cJREGhKEFb/rAjJEjhjhkT5yjTwcxE49+ZBtyED
         U+Or7FmbmHZNo/83MMpe77Pt94wsrUC3sgM6uRl3uCR/baLSmavXWP0CeKmGxo+XIYBA
         Lxmgrewdkw6c0rvTNi+2T4ed1joJMFdxXveYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439923; x=1740044723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Lq+wdJAgy65VtQEVXM0Xp1rH7CuE+rdiJO8OxFNGGA=;
        b=c7ujgJz1gB2TNpRsPw0n2Cw+LfOIJ+KFkVLuL6cBBOVqUiuDAeAuN8pArYOjYShJyh
         lWKY1p9IH0WJ3vyFiiGh1QtJXT84WGZUTeQsokSW8kMTwPQ+7VyRvxfQe7f2IUwloq6n
         wtps+fsJzVJAA+2aD11qcmWGhVKlGDLriA8UPb6dQn6RUlgFE6U5ScCixqP7oQnVM727
         B22GedKJ7ufJaSSVAsqB7EVeAD5u9/OMmlgThvY60593H4kUIJ2fUlznLxFY8Szz4WW6
         RyqQu/uJfOdDaWCdmvJLYT8HJ5Z1VD4C4ab1cyeVJn5oT6AuoPQO7F+XVATBRcelYrNx
         T0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVVQY/dqcn4jMch4ABPgHftAK0vWnCYrnTt8X89Wy2Zxmbo6xahTYvg9mQ3wzybpyhH/FNYj+xCw3QToKoFcami7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzW27TB97Md66gsIJ0M+PJHkbsFso+44fNPl/MEr6esTru5RvBt
	5hRaSzMQJTRmcV7eQhKzEuGHQwonm5IEIwOZBzBeSYYtI/yGE8yWlGUVKvq43eY=
X-Gm-Gg: ASbGncsdd9MzNZH83MOo2Zsoo63tV7nBU2hSNxOy0OUWY0sWY8m32aPlLIuXsE0MQO1
	3VkB2ME/9IG9YbfiTH8dTA0i2Dt3XrZxcjMtRBlp6hec7cFMm3ZGf+BIab7mwRHMkZtoOUmsyDT
	4+pdDOaTRqdEmeWm58DlYNiAhXh5oQ/WNyN5AEq65OquLrqrMF/wvYkbvS1lkOBZi/7s+SBDaOw
	yMCcFHDHsh0hoqXolk9SbSZoH9ooiorCfszjrr2dwfDo+rPviA2nhAIfCHd7f3udF1GPu9A6bva
	85tCWSw+5MsxuUAlcP27/lvrP+4iBkN5FzlKiaqIf+NaJicr0P65ylO7tby3jyFvqVRgAAkkK/m
	9O7/g
X-Google-Smtp-Source: AGHT+IGbfkmkx4Y0Ysc6m1om3h1jevdOm5Vaebv2OcWWYrRyEX4BU4Re6YvCRWQi5yiC7DW3ovt1XQ==
X-Received: by 2002:a5d:584e:0:b0:38d:d79a:f82a with SMTP id ffacd0b85a97d-38dea256f8emr4987034f8f.7.1739439922847;
        Thu, 13 Feb 2025 01:45:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:62a1:585d:a736:8828? ([2001:8b0:aba:5f3c:62a1:585d:a736:8828])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f2591513bsm1385992f8f.55.2025.02.13.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:45:22 -0800 (PST)
Message-ID: <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal
	 <yoann.congal@smile.fr>
Cc: Yocto Mailing list <yocto@lists.yoctoproject.org>, 
 ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2025 09:45:21 +0000
In-Reply-To: <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
References: 
	<CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
	 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
	 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
	 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
	 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
	 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
	 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
	 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211309

On Thu, 2025-02-13 at 09:48 +0100, Alexander Kanavin wrote:
> On Thu, 13 Feb 2025 at 00:04, Yoann Congal <yoann.congal@smile.fr>
> wrote:
>=20
> > I did not find a magic silver bullet that would solve everything (I
> > discovered that Gitlab is way more flexible on this subject).
> > I guess we need to find a compromise between what a github user
> > sees and the effort we are willing to put into it.
>=20
> So as I understand, there are no 'settings' in github openembedded
> organization we can tweak and everything is through repos?

As I understand it.

> Then here's the plan:
> - someone with rights to manage overall
> https://github.com/openembedded=C2=A0org creates an empty .github repo an=
d
> gives Yoann rights to manage it.
> - Yoann opens pull requests to that repo, and notifies of them here
> - any needed github specific tweaks to individual repos are proposed
> and merged through the standard mailing list process.

I don't think the github repo is going to work for either YP or OE
since there are repositories in both that use pull requests and we
can't have a one size fits all message. I think that means we would
have to do this with a .github directory in the repos themselves.

Also note, the global repos probably need TSC agreement. On a per repo
basis it would fall to the maintainer.

Yoann: Thanks for looking into this!

Cheers,

Richard


