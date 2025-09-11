Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43CBCAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 11:43:49 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.44373.1757591023913930962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 04:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b7YEOPz+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45df7ca2955so2738455e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757591022; x=1758195822; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wORqRmpCpOQJdam1pF20WF+ZxW4MFcSGvAgPSwahzls=;
        b=b7YEOPz+XCCTlUQA0kZ72oP89y3HcRPEqr3824GEdXeS491piPjDHpTOhA0S5uLewW
         vkJ4mO2pLyYMIZoLDjvW0BGo+yetBP/7vFwbc79LLP2O+JWNOGMXPdb++YC9e0IGUF+F
         O59zzd0HVCoq51wyHx6FA2NZm7fcLSmkIaSvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757591022; x=1758195822;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wORqRmpCpOQJdam1pF20WF+ZxW4MFcSGvAgPSwahzls=;
        b=g+5r9iGD4Sti88QdSiYp36LGp1d8AfTsE6Gs350w+DPrWXahdF6Fz0+DcPM/jaRS8X
         wsxPaiJV9Ird2swh2teiVl6fIRrSHq9Q5TMD9GR84E/M5Ed4lxBAp4DNrXm62HL1l9HG
         QPOVzRUPcsA3CidPnpKSQCEGDOJNFZ+WC4uE4Ei7Ln+FByVOs/lmCc5qHOPnSkOeKJ9J
         eXrU+VaWVKX9Jpvy0Db3P1htAi6796jPLD6vZEVpWAkIUz2FNyyxpXPuY97ua7NUHEPC
         as/c5FeJhj4QoGg7OETEW3wSOzQuagFoDt9TeSF/O/QwMaWWdzRiyjdlGsPN2tlPzzG8
         Ha4w==
X-Gm-Message-State: AOJu0Yykx9WBS2Rl50btR75AtuFDPQ200+IXdSWp5zRatpGLiBTKh0x8
	YF8ZOltSjGqihtYlAokmpIsPtkJxooy2yr/XGfOZ19x9o7ysAdOqukVul3QODurpykM=
X-Gm-Gg: ASbGncufjJg0BkVXN1TzNQvyp9UrVufUDUTnuCJomnQ7wzDN1KsEk3ysyzzqXrtD6BL
	Bv3BXVb7pL+tkkPe1is9+zzEV677APk8azJ1VYM55IZ1B2L3mGP+xU96appCHkuRiezxxDJRzqJ
	mOhzS4OONdoJpq6yXmnI3IqMD7gNCx5keKNu6H8t6VeddrkcwF0K/0w23I7ysW69uyOrBOlZFMG
	oJuRweanIe1neUd0sEIc5UWHWIs1dT9Q+hJ/zoERt8GpR9oG4Mj916UxivO7of9mcPVj1ft+VBI
	rvupWTUC2aZrXj5x5LQN5DJv3rTxscIpGbQcEDRPsCAjj9NzEiAEIAUHz97JyPYyWbr3gtUdcar
	OAzezgrkjkdC4dxmctcQ46MIVUm0j7Jzn9dKDats55QT37F5pb6SkfFUx4FEkOJ8uuBq6GFIQOe
	nh2mw32SgCLN6Cf+yURzI8hQ==
X-Google-Smtp-Source: AGHT+IH2CBKHjkr15YOl6U/2Rjv8UkL9Hg4kYqlLarz4lJgx/hziF7RfIH39ar/O5OpANanJ0sDiLg==
X-Received: by 2002:a05:600c:4513:b0:45b:9afe:ad48 with SMTP id 5b1f17b1804b1-45dddec3661mr216271545e9.16.1757591021776;
        Thu, 11 Sep 2025 04:43:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7316:f64c:1097:5ef5? ([2001:8b0:aba:5f3c:7316:f64c:1097:5ef5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760786c95sm2236893f8f.17.2025.09.11.04.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:43:41 -0700 (PDT)
Message-ID: <3c290199cd4437f8dc25d19752c51ebd02cb4ab3.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto/6.16: cfg: fix audit warnings
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, Scott Murray	
 <scott.murray@konsulko.com>, Jan-Simon =?ISO-8859-1?Q?M=F6ller?=	
 <jsmoeller@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, Jon
 Mason	 <Jon.Mason@arm.com>
Date: Thu, 11 Sep 2025 12:43:40 +0100
In-Reply-To: <20250910193942.4072450-1-bruce.ashfield@gmail.com>
References: <20250910193942.4072450-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 11:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223270

On Wed, 2025-09-10 at 15:39 -0400, bruce.ashfield@gmail.com wrote:
> Apply these on top of all my previous patches.
>=20
> They fix the overly agressive DRM options I enabled and address some
> of the warnings in other configurations that had slipped through.
>=20
> There may still be some issues lurking, but this will definitely
> improve things.

Thanks, this definitely looks better.

There are still config warnings for meta-agl-core and meta-arm:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2218
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2254
(copying people)

There is also a reproducibility issue in perf:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2469
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250910-yq6y7z5s/=
packages/diff-html/

I did a bit of digging on that one and sent out a possible patch.

I've merged the current queue of 6.16 patches in since we'd be doing it
eventually and I decided it would be easier to get people to
collaborate on the remaining issues with the patches merged.

Cheers,

Richard


