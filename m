Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FFFC2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 09:11:50 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.136198.1719220304683314830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 02:11:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l4cLZGwr;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso24955651fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719220303; x=1719825103; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lVMKeFlDxqiRg2DAdxadXkbVs2h3vcD2qoqE3oeSyRs=;
        b=l4cLZGwru3nOXVE8zCfptU5vQQhSr22PRzxSE4egjuGwQT1IIGS29RPy326LRFtVqa
         MgpcyDThg3Wp9VLoINOo8ul0ndtFerWLdusKvfRvf2YcDHWay1e5+RSWd655T14wGaJK
         cY3ND5WVN97DHy5IhgFl5kC2ix2H00ZFt27umpYp5UfSk4RH/8QA3XxSpu3f7H8GOU2Z
         TnDgKXHMKGK9MFZoIrblqxxa1ixdveIPW3UJBplGdoGlkxWSrZFEzgRcKBcYSqJ9r+BT
         G42wZ62TDtNhKYUB3JNuMBwYy8iTcMkRIEzGm0/APab71ESoTvVaRw3cA0HvwFoRYcjv
         LJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719220303; x=1719825103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVMKeFlDxqiRg2DAdxadXkbVs2h3vcD2qoqE3oeSyRs=;
        b=UNkVb16qKgNwx7vApqAQO7NKs9g9Es9AZ+MZOrgBNa1nnZscFqB94He4QEkvlLoDnm
         Q+pHRLIkMGaVJBaFELTqUZgQKMgvUyIModXNlm5P3/HHhBZEnBwB6ieAHoVFD7FRr9ez
         GpQ40YU2CkI6Gor1AiFggTh4Wbc8PdWb3zHnT5OPmspfwSWmy38NLgrSiasU/jYddSEw
         mgeoPGna1NrYKLqrsrpNGcUt954Qk82cr7VnFmY6U77Z2UccfnzGSlfNpcgVtNOnwT+3
         OKtOJJzot0jXSjdwjmPALB987av61HKjvHUxMj9lBAQfS1kQ0ZjdCBv7qkoUXIxc8YyD
         BR8g==
X-Gm-Message-State: AOJu0YwukihfYZrU30LCk7YljZEhOTvUk/P8mYbYuNBQ9IPdfH8uRAnx
	9H1vnHgf2DHP1JoMkxt3FyoS2Gddsc+569pZzUL/IbSsfmGcBT+4gT0xEuIp0o3pyi6uV3qnEmW
	02YqHN97X70yS1OFN7DK+KTfxqf8=
X-Google-Smtp-Source: AGHT+IGpzBzmWRuPzLZPKlwL+m65mo/PdIASWjOYbkxTf9eY5Je+UC3FX+LS6sfnQ5gYyi41EoW16KpNnr5W7Was7DI=
X-Received: by 2002:a2e:83d0:0:b0:2ec:4399:9c0f with SMTP id
 38308e7fff4ca-2ec5b1b3d86mr27177851fa.0.1719220302532; Mon, 24 Jun 2024
 02:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-3XSUJ5S+ewGE9owxtd4CmOps-D=5kU+MrRXoJN0pDpw@mail.gmail.com>
 <2056.1719220048661049006@lists.openembedded.org>
In-Reply-To: <2056.1719220048661049006@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 11:11:36 +0200
Message-ID: <CANNYZj-9Ky0Rw1022XDSuTxnABHjkxg0vtJYYi6pxATwqwCGxw@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 09:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201071

On Mon, 24 Jun 2024 at 11:07, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
> This is not the case. I just built rust (without sstate, from sources)
> in two different build directories on the same machine, and indeed
>
> Thanks for sharing this... Unfortunately I couldn't see this happening during my testing. If this is the case, the issue might be there in rust.
>
> for me diff is not there...
> > diff -uNr build-b/tmp/work/core2-64-poky-linux/rust/1.75.0/image/ build-c/tmp/work/core2-64-poky-linux/rust/1.75.0/image/
> > diff build-b/tmp/work/core2-64-poky-linux/rust/1.75.0/image/usr/bin/rustdoc build-c/tmp/work/core2-64-poky-linux/rust/1.75.0/image/usr/bin/rustdoc
> > diff -uNr build-b/tmp/deploy/deb/core2-64/ build-c/tmp/deploy/deb/core2-64/

I can share the two different build directories for your further
inspection perhaps? Let me upload the tarballs somewhere public.

Alex

