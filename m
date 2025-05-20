Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD35C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:04:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.21847.1747749887401074575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 07:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=mE0LwuKc;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442f9043f56so31199155e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747749886; x=1748354686; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+1MTvOJhzV1vPNIwhwuekxU8lX74SE2GmdVntHs35Q=;
        b=mE0LwuKckuIKmhXXWfjcePZhTl/t+IKsVIpEp7bNz69IaArCG6EVHNq+N1PlOIS4ET
         YE2tofskKRGIVkSatknoYlq6JNrv/i2IAmhq62QlNfULjDCtY13rEU5Ceot0pKojueg/
         iNUvJSvHue9Nm+tiCcnqkRAizz4S/S7BADCzRh5WjYgx62glfCKDdwayCpuhZG2mtgys
         0npdlu/YSt0XSX48BVe16OEZMB9UviSM12n+TzDrbK5dU8+Kx5sYnMKtpFX5tAG2m31j
         U5V0bxLkmmzv3QEEmonM5C/nJh59P31u6O4//Bw6WSJ8mzDIuLClf6EeFwi3cuOL+xWW
         nPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749886; x=1748354686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+1MTvOJhzV1vPNIwhwuekxU8lX74SE2GmdVntHs35Q=;
        b=MKtOKInvEPkmEDCm/tZciGMMehpW+146ofUM9E/TxBCqzPxyJGvc14nM8g/Y6GecC0
         B2Jb13i3/D+CdYOsZ5QQimEanfnsHVskr6UMkAWQs2YZwvpYGsZtCd/Iot8MRCj7y6hL
         QdNOBRrklkYwtjQEWYnU7ZLt6p7y1dCLX/7kiWiOJHgCFS/NHGPSSZxKv54K1VKXP8Hk
         mVTF3b0v9lP9c3eI/jGJwPiRUf0Y+e0SWzmufEvleoclmDDym8l+JjkU500p7YLX7XhP
         cB84aHEId3ZJhq9om4D+gnPxFe3mynvvX1T1BsmmIsl8A1ytz8Uwvy1zeLNpZsWtyZA4
         vefQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8LsxJecM92lNUvYtPHbzTq9FG3fL4kNtDS8eNrym18dP1FnXcNtPlXBYiRLsF3/fwKAUa1Qxb5PcC56t4Q5AIOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXhw3UblyXn8cwsTujiblWCRcE5D16ZWGrZCTMzBvjvsQmf5L/
	wUqX+/lcqRCyyu4nGXji0ydId/4ZKApjOEXU4yvJ/fV8QQn/gzK7vqaAHdidIM4IsGk=
X-Gm-Gg: ASbGncvxxr838/f8GYACG+9aslCo96zJ1Mgel77JX+uf5fDmUDTn57jeWv+8qjF/oRP
	fSYY0WJedqI03rncQEoXWlJgaTQZ/f23e3gV5bh92cb2Bx3WA7tBZTnZtuVleZVIuOMrIQPvm0W
	0/aFKKdTTLiRsM3qfSnH1oqko1h+oG2e8g+4DSQPt9KiR5w2Mn9IdBdcNwe+DJRMkwKJ+iKaHgg
	y8tyni6qAJgx9pvLPcUq8zGm45TdrvJqKgIjSLrOTLOf+mWAZBRrrUPxmDIW0rm+oGZza/sIpIA
	G2W4x5jvTVf+Sws9QzJi1jY/gU2Ic3FM9s5PAT/7oSpzI3kX
X-Google-Smtp-Source: AGHT+IEymIL78gZfKDhvLHIaCwjYySaWtRsUGqFWAJyHighwuw5B6YsicJKPRCBCPYnywfXFWxOm0w==
X-Received: by 2002:a05:600c:1c0a:b0:442:e03b:589d with SMTP id 5b1f17b1804b1-442fd665745mr136903015e9.24.1747749885606;
        Tue, 20 May 2025 07:04:45 -0700 (PDT)
Received: from nuoska ([62.48.241.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b29633sm34218295e9.8.2025.05.20.07.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:04:45 -0700 (PDT)
Date: Tue, 20 May 2025 15:04:43 +0100
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: qemuarm64, genericarm64 and selftests (was Re: [OE-core] [PATCH v2]
 oeqa selftest: read qemu options from TEST_RUNQEMUPARAMS )
Message-ID: <aCyL-xaFUfoswJjq@nuoska>
References: <20250423083634.137495-1-mikko.rapeli@linaro.org>
 <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
 <aCxgnSnv92n8b30e@nuoska>
 <2421d5a01486a5b15d056d480cb12026aa5024ac.camel@linuxfoundation.org>
 <aCyA6YrqUnlgEgPX@nuoska>
 <7A241F87-9B71-4207-A97E-3777C67D683C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7A241F87-9B71-4207-A97E-3777C67D683C@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216916

Hi,

On Tue, May 20, 2025 at 01:24:41PM +0000, Ross Burton wrote:
> On 20 May 2025, at 14:17, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > 
> > There are a few more but really, genericarm64 should IMO replace qemuarm64
> > since both run qemu and former also runs on various other boards and is
> > a good start for developing products on arm64/aarch64.
> 
> There’s quite a large conceptual gap between the two: qemuarm64 is a machine that is explicitly and specifically for booting inside a qemu, ideally with KVM.  genericarm64 has a much wider scope, assumes SystemReady firmware and real hardware.

qemuarm64 does have a bit odd kernel config, IMO, for pure KVM support.

And does the qemu-boot-with-KVM support really need a full machine config,
or could genericarm64 kernel and optimized images be sufficient?
For example include an initrd with plain KVM and rootfs storage backend
support, nothing generic.

We've used qemuarm64 and meta-arm side qemuarm64-secureboot machines
for userspace on a number of boards and setups without issues
but rolled out custom BSP, usually just kernel config and initrd.
genericarm64 easily replaces these. These then required a separate
build of the SystemReady firmware or support from board vendors
which frequently is there already.

> There’s also a case to be made for merging sbsa-ref (from meta-arm) and qemuarm64, but again I’d suggest not: sbsa-ref explicitly can’t do KVM whereas qemuarm64 can.  From a performance-of-testing-userspace perspective, this is an important distinction.

Thanks, I've been wondering what that machine was for.

Now back to the selftests and genericarm64. Does it make sense
to you to fix oe-core selftests to work on genericarm64?

If yes, how should the qemu firmware dependency to u-boot
be filled. Manually per build via local.conf or bitbake
command line to also build u-boot? Or something else?

Cheers,

-Mikko

