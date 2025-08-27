Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E6C8303F
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 04:02:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.7290.1756267352907990771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 21:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TynHvjwV;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f48d61ea2so3391099e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 21:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756267351; x=1756872151; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9PtaK1cf6r86OGhpKIvQ2En7ZPkfra+BtkgR8nSeIo=;
        b=TynHvjwVfIPc1B1jA7vSl8gDza2Vgznq6PK1ilGplwoaP62oXCWuItzbdF8O+v1zjl
         SakzNcThooo7y6ka2R/S29LFOu3hesaWaLTVgD7925jT4oAc0PVr7Oss1J7h362KMPUm
         GXI6uVDl3BYvyM0rLL1luzbCH4rpEjH9tN74Lr0dmhxf54cJp3iUfRcA4cNH2w/qAQFH
         UhBUtdVC4nMs5qTYtL+luV1g4YUY41u5J/V+QAt1WQi4g692/xA7bygvr9vAW9w62VUl
         OcxeMaMuZt/yWVXRf/8YdaInpsk0Mdn0YPYTmla1mS7L3BTgcF6L2PWd0tPxxMt8XNPG
         yuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756267351; x=1756872151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9PtaK1cf6r86OGhpKIvQ2En7ZPkfra+BtkgR8nSeIo=;
        b=h/sGlDFQyebVFwYao6ykkfeqwRsCB9m55EewYHVOrnAytVu6CJGBeva8gZ9jYaPlWG
         Fs/dSUhkOFcWdbJv26LrMAmuyp1BEaCGfBFMUEkmmVtXH4cjTnmHm9jGO3rFbeYxVjAA
         THt3VKw0ZElGTuEPXHFaya9NW1vgr4TM/Y9ADmbaFSfROhZxolyhnPXVG5LVxOZ5tiaZ
         yeaJSYQGMgrWutQH8NKDBIbck1B+MyHyhu+RUSpF41Kfr/KmqfIBEh6C4brn/UDdij8C
         vQWqy+JyGbDPY1VUWdZNoR+uUORLSDkBvfIQQBTot5wmx8zgn9tJ2kOgTxj7JqzNy6Cx
         EQBA==
X-Forwarded-Encrypted: i=1; AJvYcCXmG5QOZ1LiUjGUXUE+F16pi2lXBcyHQJmveZW4BQKC5w0BI7qntbqLcz+/+KvYC9u9amjUFzWv7XLQdJ0/y42aPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPFYZu/2v7zjS5+wDAMOMguONcCsTA5lcFxK7jcapTPwS4oj4K
	n89sp0ZWl9mBFyfC7Znm6tQROfKR4W7tymIzPOEHcTjvPg7XUyI5qasHqvxYUb0J2f1E/rWROgt
	2jKEKIcQxTcKp8Ysz2xKaEKL6R7n4XL8sry0a
X-Gm-Gg: ASbGncsA4uLBqhPmwrFVFkjOr4YRZ6dZyNvujE5HrrbapqfMKzSpLJnqCWWTZ/ImD7v
	EE+Gj/zUexiCHtQLVGzyYPwCHOG31XHVSxYCyDiPq5QbSsHic3X8DIVOZxVpJgklkMcTqW/r/Jl
	pgHjTgJN/KwIzY14mson3lOa+okstYJ2QzBppy0O9v2hgTh14LCn9C4yrx/y4xCJEL8vTTxHq3U
	CSelmYBk5nU+Sv4GYa89g3ocej4JUkDPA2RyPA=
X-Google-Smtp-Source: AGHT+IFkOGAOEkK9Ho3/udwUArq2fW/lkL+d6cTusUD8u1vVuhilzGgQxkRAvb+HGPtpqULLNcYelJ4VcsximCIsDvs=
X-Received: by 2002:a05:6512:158e:b0:55f:3faa:7c30 with SMTP id
 2adb3069b0e04-55f3faa8465mr4019745e87.6.1756267350455; Tue, 26 Aug 2025
 21:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250827024658.2076887-1-bruce.ashfield@gmail.com>
In-Reply-To: <20250827024658.2076887-1-bruce.ashfield@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Aug 2025 01:02:19 -0300
X-Gm-Features: Ac12FXzMopllXZMzA0AP3IqcipG1Mvw-B9FaXuw0VzOSK6JX4AsNigbcWgZcTvw
Message-ID: <CAOMZO5CtiiGcR58QckxY2MWDBwLL0JzFbiR2S-ZOq85R8xRO1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/6.16: cfg fix configuration audit warnings
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 04:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222487

On Tue, Aug 26, 2025 at 11:47=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/.:
>
> 1/1 [
>     Author: Bruce Ashfield
>     Email: bruce.ashfield@gmail.com
>     Subject: arm/6.16: remove unsettable and obsolete options
>     Date: Tue, 26 Aug 2025 22:43:01 -0400
>
>     These crypto options are only selected or have been dropped
>     from 6.16, so we drop them from our configs.

If you still want to support CHACHA20 crypto, you should remove
CONFIG_CRYPTO_CHACHA20_NEON and select CONFIG_CRYPTO_CHACHA20.

Please see this commit for a proper fix:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.17-rc3&id=3D6c9ab811871bc9a08e9cd4b96371a60667fa9ec8

