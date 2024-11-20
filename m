Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929CED63931
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 11:39:13 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.11345.1732102734363012617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 03:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Is8wIN4M;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5111747cso53382481fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 03:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732102732; x=1732707532; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/emfVZ1LtMP1yARPwCRiYINAp8sGapQRj6b//rZjJw=;
        b=Is8wIN4MG7LqSw5bTlbbBVpL1n8PS5ixisyq9toIXvSpFSTG6Aj53dbaDPcr8nopHG
         InfvvPaJIGynrh83lr93Msq+9sPSLFJkoJgoQdUSEYISsya3Qqd/L1qByNFYO3wWrA3X
         xRksYWEcxCro8LJEErYJCI5k7AGbKwOmdrId3cXN5lk1J9g8miUto63+XPFHgE2vJGXA
         9So9EpfKwV9kT8gd9tbO1Dig2KvuHxsU+UaEY5wHdb2X3mVByNOmZBXzN+LSPW6neRlV
         dV7Ym7z5rb+oBMYdxvOEJPgBtjBh3LilW/5zFpJNyrThJ6e4/ZseMogNzlD3FnJQcnOX
         OhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732102732; x=1732707532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/emfVZ1LtMP1yARPwCRiYINAp8sGapQRj6b//rZjJw=;
        b=Dj8OCaRqPT2qndXybf2slza6Ryjfqp+4lToEmj7hqZ+eWQn/QepUrFKy2QghLYDvSN
         gLT3PLPr6+ESfeuH93RX4620C4zEL/9VoI2jSgjsEckx0kI8BGpi0sogeJRe0zjaG2VV
         o/SXd7NUOKZYtFdsesk9zVSrIpVdEDUKh/K0+Rxg2HGi+f0+zlXRTebLRxJXO2Zb51rr
         PzVvQX8LkbU5c3qV/hgqlbcpcCTnbx5RQz9WDAxcaltLQiURo06vzdyzY9N0kR7WKgYM
         us1357lbZnEBtPXduENKQsjZpvwwALo6hHAQG2D7hf1taUM9gvvNCn9q4YrWy4LF0Leo
         S7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVV9Y0W8Z005sb4xsfQpNPQ8V4rqdMiM53H29QCkMG/AX162nPwafxoZZ+MdzBj90mI/MgAeOPWVwM5zQ1CIDhyOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzuSeP+fWCTTsDdI+YYJ9qVHTkNZbIvb4mV9RifPTp3TW7+3gE4
	shegXifb764rhtMTbHdXlYdNhWw6eWkO4tjRi+vSDZMAsI2nI5pOyesQ2H7n3KCmFwUaKQXBkx2
	1oNPhXt42fypqjz7cxN4xfqbPEYU=
X-Google-Smtp-Source: AGHT+IFbBMjzF5uP6QEFCgCx5u6kAkC6hbhof1ylvYlgn51pTJ0Q7QSVORa1gYn8VtGWTyvI/kao3a1MakVDfgdHFtY=
X-Received: by 2002:a05:651c:895:b0:2fc:9869:2e19 with SMTP id
 38308e7fff4ca-2ff8dcdb537mr15078161fa.34.1732102732122; Wed, 20 Nov 2024
 03:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20241119184411.76770-1-schonm@gmail.com> <e3645da1364c32fcfce0ccc198f470cf1a61e4c7.camel@linuxfoundation.org>
In-Reply-To: <e3645da1364c32fcfce0ccc198f470cf1a61e4c7.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Nov 2024 12:38:38 +0100
Message-ID: <CA+chaQdFdW6pornv-wjU_+_xz8xvfJTrdJk2T-i2=rh1JavHmA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] icu: upgrade 75-1 -> 76-1
To: richard.purdie@linuxfoundation.org
Cc: schonm@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 11:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207422

https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7=
e7ea0

On Wed, Nov 20, 2024 at 11:50=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Tue, 2024-11-19 at 13:44 -0500, J. S. via lists.openembedded.org
> wrote:
> > License-Update: add JSON parsing library under MIT license.
> >
> > Drop backported patches which have been merged into the new version.
> >   ICU-22813_rise_buffer_sizes_pkgdata_PR3058.patch -
> > https://github.com/unicode-org/icu/pull/3058/commits/db70adaddcfa8050db=
6a69cdfef080a7f1423ad7
> >   fix-install-manx.patch
>
> This seems to break webkitgtk:
>
> https://valkyrie.yoctoproject.org/#/builders/59/builds/467/steps/11/logs/=
stdio
> https://valkyrie.yoctoproject.org/#/builders/6/builds/474
> https://valkyrie.yoctoproject.org/#/builders/3/builds/480
> https://valkyrie.yoctoproject.org/#/builders/17/builds/410

https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7=
e7ea0

needs to be backported (as gentoo did https://bugs.gentoo.org/943213)

