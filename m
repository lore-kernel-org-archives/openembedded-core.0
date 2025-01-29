Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E6BC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 08:49:44 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.8544.1738140582694374074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 00:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SS12KhYA;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd43aa1558so59782196d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 00:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738140582; x=1738745382; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Li8f3jOIsg4l608EzH/cbzkRkt6am+kj2ppWAQnJZc=;
        b=SS12KhYAVdUFaML04KJ0l4IuBXvxmMR4u697lQOfvBIrCaKnf4xqZeiRVOu4Z25S2t
         ISIe0PvhbqK3i0NraWo4aYlaALVTOwEMJWne0wftavU7cVBMlByVgnoysStgjslwf8rh
         AcgemmisMqdLuqch6GdSGtQ0aeVLmhU05zgQEONLBOFyqVCRw9+8c13P73aGbSIJTuqZ
         Zj4ub82JaCNyNaiOzdmod01rAjFSfhui5RosJkcHFn0POYjyj7BvYkxUP/NGKiimF/xv
         Facku07nypYTqi1Pbwhjs+8krcXeH/CJaHZHMLnxUf9B8Vk6HFQs1+x2nz0Ha2t5i1d9
         iF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738140582; x=1738745382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Li8f3jOIsg4l608EzH/cbzkRkt6am+kj2ppWAQnJZc=;
        b=XiGOD25D8owZEqYJdcxxMDK4KGDgKenZPLKVcCCggcJ4sr9Gy0E7i7Fji+7b292i7m
         edg49nK1XKCkzNSbhFv1xKbK68BIn6zKnqlqQne/QxbSw3+3qjMTpPIu8BZc6MeRp8TX
         MJuHPECNSkvhuYLQ6vptFVqCLA+/t3ls+iT0p2QAFWyCbj0FjU15J4ZJXaQAKVWnOf0Q
         WRuau5gcb5s7oH9SJ1IaDwVenD68MTY6xMO3m2Q4TmhSSsCtdb0qOkXoJvYouLDL6hoy
         fMAD6X5lzs7g8AYQrGX+TLwTVWFQJKPWIAzA1ZOp1yLXbrx8TcS4njDsBhgramCNTcFw
         6Z6g==
X-Gm-Message-State: AOJu0Yz5mkEdwTJZ7Hc9ao9PBUlSRg2E5fFNF8QZh4rT6bGUnaLDvNJ9
	OM5aMdj1ybGG6/kHpf98Oe9jgPzFkbHe27kLlPcuGlgESYv5x8HAxIFfH6hvYn2mee3z+Xt9L9K
	UAdHhm7n2GBhbaSptnFvIgtZ4D8I=
X-Gm-Gg: ASbGncv46uWx4C+AVNjgXUaYckAGj1jpISyt8Lrm3tupjILZhf+iBgdzy6lWACBEiKd
	YdyNgv2nEht8r3N82CLEY81aU5nagoFe2w1XuNFEuEPLWbNk4g8yQS+VH5Zf8fURyLKbZG/MBUl
	P6agLMhxuSqirkwOiQbs6KUtIgDLlVFvA=
X-Google-Smtp-Source: AGHT+IEOtUJOI2RkPSF2CHbcUfUsbiKjS/WKk3mEHmsLFTPeVJxGinRHJKSjqg11lyCzdMrP9Eh1R4NjwILjh+zF6G8=
X-Received: by 2002:a0c:d7c5:0:b0:6e2:43d1:5fed with SMTP id
 6a1803df08f44-6e243d16322mr25992816d6.39.1738140581729; Wed, 29 Jan 2025
 00:49:41 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com>
In-Reply-To: <20250129080902.1863054-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 09:49:30 +0100
X-Gm-Features: AWEUYZnJSeYZjYs1SHd5vC-ShAcsh52FOz-S9AttmSJJsiZuAjIGUs-tKv8wyIw
Message-ID: <CANNYZj-kk=EZMRopOVDVpEVhwzWYSAabSCWWbF7fE7atMN6bNw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] cargo.bbclass: Allow using --offline instead
 of --frozen
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210351

On Wed, 29 Jan 2025 at 09:09, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
> | error: the lock file .../Cargo.lock needs to be updated but --frozen wa=
s passed to prevent this
> | If you want to try to generate the lock file without accessing the netw=
ork, remove the --frozen flag and use --offline instead.
>
> Add a CARGO_USE_OFFLINE_FLAG =3D 0/1 flag to allow using --offline
> instead of --frozen for such cases.

If you add custom patches, you indeed need to re-generate and update
Cargo.lock. There is code to do that in cargo_common_do_patch_paths()
in cargo_common.bbclass, so please check why that isn't working for
you.

Alex

