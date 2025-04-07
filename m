Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98084C36018
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 17:06:12 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.53431.1744045567233374706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMrnD8K+;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso42607846d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 10:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744045566; x=1744650366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0R0+1tJ6KsX+wb9TTcF/awxys3H8XKJV3UMbHFOgCuI=;
        b=mMrnD8K+vvKJ86I5NTizek21tIrsXnJ/m57+blTcVIGI69fJBE3Xdo+dQ94QkYfouZ
         BqetXFA8Mn5fHI4S1+hQtpY8xnekhZ4Yjz8LHMuyTU2EGuAoRWu/nR025sbha4w+lgLv
         TE761Z2Qmt7UjzIz6gcWYw6ksdKdAdaYzHIf6WsqDLxKcl8Q/SM3Ot/8iR1/LgBoe92K
         mA+STOtIoWbLjSfDuSevdxPrjRyNa0DAeKswKC2npL08X4SIMw0gUNKivzq0rSCqamcO
         JoHXzH39sx/o675LlmmweVMWPkSJ2bNOOh7cjrDwmKxd9ObxLI1hLU41oKbj+6/FqbCF
         v3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744045566; x=1744650366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R0+1tJ6KsX+wb9TTcF/awxys3H8XKJV3UMbHFOgCuI=;
        b=eOPppNXurTi6imQV+XvGH8VzO0TriemsEcQQj3yYbv9kfZm1YbHGEZ4d4gkHKyiFCw
         v7i4onEYzpilOgLYYjtyt2XPf5PnVVNVx3D+8VoSaXDFPKm7UJmW+Qz6+tB7+Se7TKu8
         BvB1ATSqDjvDQZgp4teWgLVgMNPDY7Y34nYdo2SBC3xFBXiQNDi/qNJIQP0Rr2TKjrQ4
         P6+Lr31URd46O3LClj8PhIWuaVV1dGnnhCAXH/UMROrqsF0e+p/BZbxyfMGjuqNn7Xg1
         mqIJDRCfEUtWva/orP+WmXb1JpnLIOsnTlsKTXdWqUIkMgte3OkCpnEW7RLSav2kiezP
         2EqA==
X-Gm-Message-State: AOJu0YzztLmjhlFh1qhCIfQDytr42Qx9rBVUUB6Oqa2c4W2GLHAEylvz
	rPKx5O6t2KOXYuxoSzMlUwgHeU3j3SkXZjynQsWpsc6YTfX1t6y/+Pgokz6aZ3YSah2mYt4318l
	xjXxGzyViqz6Z/lnVjJRv/rN/E3seXWiU
X-Gm-Gg: ASbGnct6I3n6vhyks/NxVk6zjr27zLAFtHYVo/cjv7oNieSL65RDNX17Bp7dbgPUoBd
	wUfGKILeNowhkBFQT5uHL3nBVm3s2OTFoC/5Gg/oQighZUdHIGTdfDVm6sOJQW1d+M28FKx0XxC
	Hv9EnVSdxregkSze3Eko0xVJT23Yl293OU2psfri24ht5Czqp/s0sZy0MZmbBp
X-Google-Smtp-Source: AGHT+IF1HqmvR/suiHRCjjm42Og9/SfYjNssMVxLsFV4no6LPkBj1KciW68nrpngX8fX6IfuI1+YUa/AQfXrTjikYNw=
X-Received: by 2002:a05:6214:1d0d:b0:6eb:2f7a:45c2 with SMTP id
 6a1803df08f44-6f064b68414mr198668626d6.43.1744045566272; Mon, 07 Apr 2025
 10:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250404075136.385270-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250404075136.385270-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Apr 2025 19:05:54 +0200
X-Gm-Features: ATxdqUGBnweN8BGlB3wJkk-yDMDU00fJ_Fdo_CZDd2eZCsfYN4plETGNTLq2rSw
Message-ID: <CANNYZj8jN5yBoHpYsAPbdMw+vM0CR9Fh9t-6Ddcqr8npDw7_dA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: set git repo branch with SRCBRANCH
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 17:06:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214469

On Fri, 4 Apr 2025 at 09:51, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Enables changing branch from "master" to "next"
> when building bleeding edge upstream versions for
> testing purposes. Now local.conf setup to
> build latest "next" version becomes:
>
> INHERIT += "poky-bleeding"
> POKY_AUTOREV_RECIPES += "u-boot"
> SRCBRANCH:pn-u-boot = "next"

But 'next' is not a bleeding edge branch. It's a fluid, and probably
forced-pushed-to testing branch which is not even on top of master,
but rather master has commits that next does not:

https://source.denx.de/u-boot/u-boot/-/branches

Is there a use case for using it in yocto builds?

Another problem is that this sets a precedent we'd rather not set. If
you want to tweak bits of SRC_URI, it's better to just reset the whole
thing.

Alex

