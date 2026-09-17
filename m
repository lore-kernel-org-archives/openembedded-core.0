Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A6A0C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 06:28:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33516.1789626509817325494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 23:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SAHLppVj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48442ea8f59so178480f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 23:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789626508; x=1790231308; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05JbHThDWpRzRz2/5hK5P8vP5vIrpS83nMjtHRnpOFI=;
        b=SAHLppVjio6Rl1sOQ4hKBD4BjyGkw040C2PVoYDloGTbFbXmUDEcR/ajWBlwYZkM4C
         2LEDZ34Ab6GA3+s02zo/28HGf/Hp/G3jf0BArG+gtwsOe5CGAlxFxHjCdDKDmuuPxHNj
         eYnt+FYLQ7jucC+5wNkRsNQ0F7Lo0oPQiJQYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789626508; x=1790231308;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05JbHThDWpRzRz2/5hK5P8vP5vIrpS83nMjtHRnpOFI=;
        b=prh8pws0LgfMV8Hxe3y0MdlrWqgFzfwFj4hVYvV/sXEdRPO/3HO8qUl256o7MaepPS
         4KzZbQokBOBUiYJVsyJqrvOVQ0z6RRR4KwEANVYUcgmvIvel3Sq5wDkuqoEGtUF4Uj56
         2CyXMVFf6xB51r5BFutOWDYh9NSQyPlZ1g3pHi3f6A8rz7AxZSNSLQIhvtJtclTCGr19
         2m1jSJZGn1rLSo/jvWJ8WE91SCgmkeEw1AYL0P8T4XvVlGQYK07RBAa80GN/v1l2C3jG
         2UDOTfvKAr803M3LTG+aigHdS7h6OPosupfYXKZxjoUV6RwaM7l3zST2P1LZGuEuuhNF
         mPkw==
X-Forwarded-Encrypted: i=1; AKwUvBzkpImhZ1Y3jEJ4QGfg1veEC2HeA5/SMpOSHDSMpZrTYQMbrxoU3HbSVcUfAJPuzVl8q1tu2TgB9VqFlZpjxlxPYg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mlrn7Jqw07B2KVmKdHe7r+w59FIkHoulWQUtD5FCQiR7heRcwP
	iN5kKWlh5gZTzY+4/9KrW1ynaEQetQmu45UrtSQsDqFk0bHQsrB8003ECky9tBUxpEg=
X-Gm-Gg: AYBFou2ZL2NU66MaVX09d82GA167shJPdTh1Z//muN0Gvts09ryL35JZVt1fOe7IUli
	JxvQ+A9Weo1pZ2l/ciYLBBC7y8nu93iypn46f5ADnAAWjFskZ5+YQt2Odrem8NCxPdN8ZEDMMSq
	yD6QDaR2cqKp535q25rawHHS5KKW3a9qybmvntKNV/9wgUTYjTijzjvAN6MR+sDogl5EilB/7v4
	oYCCuzU0v7jXLhKFcNTbvJxyGdA4wnfOa/67J8ukNjloS0cdDX7yqG0e9teeu318jXz8OmNV3MK
	NLcgQd5znYZey9g+7R6vsn19Z1JLlNN6CtLldMLvtbqA4x36hw6iuOK8ZdYJRVTkhR50OgvWT83
	bieJzQ/+Zvcl/sh3JMYVechiIzvOOuaLt9HzV1d6XikVNz+IXLihY5elJQ13UV9wn0EmuTbo46N
	syx2gwIacjG9RuZD8Glw6R/9TRGoZgF1JfP1q8bdMjhkUz1gCX6jEAXvFEkj82ED3bjoBaNHpeS
	ejFoCZuFFXQe5kDBHGQGe+NVs0M3w0LzGQmrTyISnOKiHN7mc/pVS6DYPzJ1Pcv+M2FhasPR9c=
X-Received: by 2002:a05:6000:478a:b0:487:3c8:9675 with SMTP id ffacd0b85a97d-48713c0081bmr1942121f8f.8.1789626508036;
        Wed, 16 Sep 2026 23:28:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4507:59aa:c79a:ecab? ([2001:8b0:aba:5f3c:4507:59aa:c79a:ecab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27c65sm13157718f8f.21.2026.09.16.23.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:28:27 -0700 (PDT)
Message-ID: <2fccaa28bd123ecf4fd993d6e8afd1e2e1bd7f97.camel@linuxfoundation.org>
Subject: Re: [OE-core] ASSUME_PROVIDED and pkg-config-native
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ola.x.nilsson@axis.com, openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2026 07:28:26 +0100
In-Reply-To: <jwqo6dwz98c.fsf@axis.com>
References: <jwqo6dwz98c.fsf@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 06:28:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246023

On Thu, 2026-09-17 at 08:24 +0200, Ola x Nilsson via lists.openembedded.org=
 wrote:
> It seems it's not possible to use pkg-config to find .pc files of
> all native recipes that are in the ASSUME_PROVIDED list.=C2=A0 Is this
> supposed to work and I'm doing something wrong?=C2=A0 I'd appreciate any
> pointers.=20

It isn't meant to work. The only recipe that has logic to poke into the
host's pkgconfig is qemu due to the graphics needs. We ideally keep the
needed ASSUME_PROVIDED entries small. Where libraries are needed (e.g.
libz), we tend to try and build them ourselves.

Cheers,

Richard

