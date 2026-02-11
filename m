Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DA0E9E2E9
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 11:41:46 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17142.1770810102396692349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 03:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKGSLVsd;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-896fcfc591eso30554676d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770810101; cv=none;
        d=google.com; s=arc-20240605;
        b=kZvcKZwzpaxLx4+vGjSDDu1OpK5J2g7s9+h6Xo1JjzYkqKij6qheHwOYEPA6Hu2ZXK
         qiU00aQwb1D0+KHgAvCuYt3+wNEZiZGEig3fSJSRWJ1ZRvQaHNAyJ1Ca40ssGa0CVm9c
         x6KmrlGcdsD8sZ9jpDlaAtjOfrmpyXEERavDrZG6Palt3j69rbw5KxT3DKfIBnpSKQMj
         BIuMRmWm5Dw/dqC75RxrnirhIHyPwHT6F1kWz7/pQUGfa+sntWBc15OJ6tUvsogSuKxu
         NvkamQAS1fgd92+uEoE1aS7QYf1EcTpNGVio3OBvlYpVK0+tg0QLv1HUyHMimeFoPLa3
         9ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/o/4glbpqbl5DvpdOmR73y6PWAqWwdeqPFtfMFj5F6k=;
        fh=/6z8JfBIeisavXEIRpGHWCZ/bBnRYmA5DbrO0BPpR8Y=;
        b=Quuyo4CuRlgngTgtnqWdMXo6TijtKPEIBkLYtC6Q/tqqKQwW+RNN0HI+rqxwVnmGBP
         oWZNVWPgyKtG32M2+rksEjI4MkelBIHrvF0LnM/tyVQfne+CsNXItSBh2ZlI6jkDRo5d
         CwrdWsWqsOem/c04Wsr36rQPN8uSzkMQSzc6gPCCdCddEC+a+eqvlInZY7J+Ju9z9RQL
         cf2CZuraQm327yx6WRGQ5+9VO45MLU0D24svNUMNDeNajTnTDIefLjZkNxupOdNXkXOH
         UB+pFxLBYm8oszrI0vF4fBFEYHaKz//bGw9BA3TZyb+53yss10HKGEPP1LEJUbt9eBkZ
         H8sA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770810101; x=1771414901; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/o/4glbpqbl5DvpdOmR73y6PWAqWwdeqPFtfMFj5F6k=;
        b=nKGSLVsdvHh+/wumCXYx6QWeL2KgnWNYwbvTkdV4uhe5slBht8KLuqU7L/h6iRU8/s
         mi1ZgVcX2UfLnh6ePTY9jSvv8HZHmeVSdC0UBaMkpAHydG0DuRvdA9CRvzP4/OEgzuoo
         Ifr0PyEmWx79wzOwBI5Zz+CwQ1LC8IiC2fK41HY2fBrCB3ZWXRXNK4AlLgW2piMPrnNI
         +K8poFAzGAD4Lu4+lkivxAl5aFVxAmLxrIDxuSus1i8vqHeDJyWN/Wmr+jCBGN6FmzEI
         DWem1k7VsaApN5Pl10RQauNSHcsfzjQxntHQm2a1hmgqAZ01PJAMTkYpqN24KPqbMGzX
         icow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810101; x=1771414901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o/4glbpqbl5DvpdOmR73y6PWAqWwdeqPFtfMFj5F6k=;
        b=fOhxCxLz3lwbziHoS6laSjCWLBwkD/phnVAvmEwjJWJNwujzKRV7A591VcBcKFzYe1
         nrgQxA1BL7J8RBRYBexeTtp/u5kS5K/l7OldiMQ9+rQCHKx1MHvDfv7/jZlPSyas8wZ2
         YJXCCoKa5QVLCoypoC4+ZpNBagSUcWd0cNRP0DNIeZDHkSlL/GCnFWf6nLDM7xCJP4fT
         m6qm7RIxDcRJ3t27kj67tgD8VsacnHGBaGMcDBIu57ekIN//ZcCiyCFWWVegXZ4OVENL
         nsgddPijKCODBhujMdQ4Yw2O7rMpRJAlssiyqSp/7ANg6zqPYGokxJ2Uf9quQnNwg1bX
         tjLQ==
X-Gm-Message-State: AOJu0Yy09FLLYi/gKGpS4370lHx/b9DMh6hYwsWpBZinaIvTzbBqZ2qr
	K/9+lHle97NjMHzIBE2wy7woDrul4tyw6NUqHTI0JPYq+yY3FONmNHn1Yd0dyXAPKphW24PQvdN
	Hi1JmAEVKU+GRbVkbx4d5Vab8EwWZu3Q=
X-Gm-Gg: AZuq6aLxh2JW+KtI69pkt7pxjjN/VLtbOPDfmkB0xb0eqCYcHGMxH4vvSDMgIcYiVGZ
	i62yNNNKIDNDNpxoDSE97Mkk4R6Fzvnr7uQNjmP3cJpl4/gYDp9EoP+lhiHj+mxA2Etsr77i1SC
	CLmQpmXSGaN75/dPqXFT7Ws0KZwAo0To6OLi7A4Ffbvdt7CLZlZuULEztNj2iqPrODiRL8z4xrb
	tX9GfgZMJFmKqOB+EwV4zaaI7einYzoR9BeDuRF8qPEOSLufbFSVvYre4jEa7ooyNAcPgctkKIo
	8YPYoW+I5Zb7OYqvnnQyavv8Qui8Csq16XmbU51GYQ==
X-Received: by 2002:a05:6214:d66:b0:88a:2360:7f15 with SMTP id
 6a1803df08f44-8971d982915mr17101596d6.12.1770810101292; Wed, 11 Feb 2026
 03:41:41 -0800 (PST)
MIME-Version: 1.0
References: <aYtcrTmpsYQl1na9@mcrowe.com>
In-Reply-To: <aYtcrTmpsYQl1na9@mcrowe.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Feb 2026 12:41:30 +0100
X-Gm-Features: AZwV_QhLRgZAl4NnxrHCgzDH4Mk6DxMQYMeB5Z9QBRIz9qdf7arRjpHDM5HKpiI
Message-ID: <CANNYZj_-3ZRL1-TTJKENbrkSE74951i5TxN=uJ1D-k3sL7mLKQ@mail.gmail.com>
Subject: Re: [OE-core] XZ_THREADS changing do_image_cpio task hash
To: mac@mcrowe.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 11:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230977

On Tue, 10 Feb 2026 at 17:28, Mike Crowe via lists.openembedded.org
<mac=mcrowe.com@lists.openembedded.org> wrote:

> Am I missing an obvious reason why the task hash should change? Our build
> hosts and developer machines have varying numbers of CPUs and this is
> causing a lack of sstate sharing. :(

There might be a real issue in there somewhere but I need to point out
that none of the image tasks contribute anything to sstate, so if you
want to improve sstate reuse, images are the wrong place to start
looking.

Alex

