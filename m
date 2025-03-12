Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D8BC28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 11:42:48 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.35119.1741779766513643328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 04:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9bgZNlw;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd01781b56so72673686d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741779765; x=1742384565; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VkDphvzaAzZJCC34jrbfTxKmn3v0c8I2Rh5Daa+0ORU=;
        b=T9bgZNlwwRCLZm7xrJwa9ky4uoDFgaD4YDHVZLd9tr4AP0bEsDrrejJmd1293rdi7t
         tcHjrc8SKb2e3vg3IwJDcwC/7kuRdGvJCupyxBKT88BBOC9spxlBxUiHn0iWQwzLeaiG
         15I+EJh2YteuB6aweHxbIblXEbadHedgb9sR/jdn7o/qNu1a5hTb9yQbM2Y0ABYlnFMk
         5TJGNcogtcdYGjq1qQJY2BLJh2V9AuofRKUHHkh4NQGhwMOhEG9R2Yt4+Vz0opXrYZE7
         yJVhLeJsAqqPfQKWiNiD/MdvWOKujWxw8e1wPWUG4VZ9IiT5hb7rR2MNc0SI2D4z7dVe
         qiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779765; x=1742384565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkDphvzaAzZJCC34jrbfTxKmn3v0c8I2Rh5Daa+0ORU=;
        b=ZWIyPNeZl/d86xk0DyOya6FVFdKHn9aEUYD4Qq+YcGh1SrQplMRS7gTFyJAixB6V9j
         wQ28iidln8JAHqMFfh+p809DEgY2HgnnYa33dKo2GBRaGeEvwG8LcmEjS+rsEV1hCLlC
         c29Df29pdmuYrK23ZlnTczOCgUMZZg8LiRL4Iqpyc//mXxIGlDzCV8EPsUbE1mJhHrST
         GvOOIwJ9bxjtMBjlC1N/0KdNPkjYUEha0Rm1Wc5Mw9Iq5MBYwhc2M+if7N5iBFKGQdTJ
         G/AM5dSOeZg4/yeRV+LSRUhSODtWByhcLER5IUxW7SZYoG6Vqfx4biRh53CWKSze/CqC
         Xxnw==
X-Forwarded-Encrypted: i=1; AJvYcCXE9PT/XuxNNhgMl8CGeSx0P/9cIPYGZdB/fdd3qE0KQT4oGA/iRRjtvwuorl7Yw2nsnYkolsUrQoAQxsYi/B1Q4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHZ9I/UEwGlww4GX0/ngQPmLmlj6Ew/7PkyMhtyxp7I2x8vRgJ
	92chtoVgeU9UUFJE+Nnw/QZUABByuDNlc8tyxfwg4rTS5WaOvVkAGLX/ArRzu/qWqJ41oAKYXLa
	0IvFkQl0zwGTKJIFocMFKHAwRacQ=
X-Gm-Gg: ASbGnctWYoqchUcmbHtzwnwTd1EqgIZjtBWP9beCrfXz3siueKKtbOdABMpMveiYp4S
	KTq14dzu65mLp2aWRF+wZFrvQDpvFWFBSXQ05ZJqGCJf1i369du51RLtM0GIIq2oSn97+9Hl0Zg
	0qVcyAG7as8MOXdsYNi7slCKCv
X-Google-Smtp-Source: AGHT+IEJ9T0C9Iyjn53xYzSGAT57DjNfPO33h5YzNOGp7JIL7BLQD9KcSeVfA2aFui+REeumlteWTu+9xHkNveqLN78=
X-Received: by 2002:a05:6214:230b:b0:6e6:6a82:4989 with SMTP id
 6a1803df08f44-6e9006ad0c5mr302787896d6.44.1741779765586; Wed, 12 Mar 2025
 04:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250307163724.3459192-1-f_l_k@t-online.de> <3ebbe1b5e26f764636ec34c4acebe4d8a588386f.camel@linuxfoundation.org>
 <182B144118A90ED3.31525@lists.openembedded.org> <VAQYSS.10I1DUCUOUO4@t-online.de>
In-Reply-To: <VAQYSS.10I1DUCUOUO4@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Mar 2025 12:42:34 +0100
X-Gm-Features: AQ5f1JqqptmW85WehDwHF96CwozTMYzPlNUztoJ-Rfiyejdldd5PQrn_XL_LiFs
Message-ID: <CANNYZj_C-zmxSuh0XQRvN8SJzbEMZkP7QNm7o2QutfKjiQEO=A@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] glib-2.0: update 2.82.4 -> 2.84.0
To: f_l_k@t-online.de
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 11:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212646

On Tue, 11 Mar 2025 at 15:15, Markus Volk via lists.openembedded.org
<f_l_k=t-online.de@lists.openembedded.org> wrote:
>
> Here is what I found out after looking at the problem with the glib ptest
> I did run the ptest on my yocto-based image booted from an USB drive like this:
>
> sudo ptest-runner glib-2.0 > glib.log
>
> There were two faulty tests
>
> SUMMARY: total=291; passed=289; skipped=0; failed=2; user=233.4s; system=126.5s; maxrss=516636
> FAIL: glib/gi-compile-repository.py.test (Child process exited with code 1)
> FAIL: glib/static-link.test (Child process exited with code 1)

The autobuilder failures were different:
{'glib-2.0': ['glib/gi-inspect-typelib.py.test',
              'glib/gi-compile-repository.py.test']}

Please try to replicate what the autobuilder does, so you do not spend
time on fails that only occur in your environment :) You should set up
a qemux86-64 build, and build core-image-ptest-glib-2.0, then use -c
testimage with it.

I looked into the AB fails; one is caused by a missing utf-8 locale
setting, the other is indeed relying on .gir files installed on
target. I'll send a fixup for both in a moment.

Alex

