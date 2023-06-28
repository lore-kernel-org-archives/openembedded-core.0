Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1FFEEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 09:39:56 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.12150.1687945189995881406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 02:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=capLSIVY;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fb8574a3a1so2691743e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687945188; x=1690537188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gLDDju+UmvsFhaxhzKb6/fdJIUeZDqj5U57WGkcO0YU=;
        b=capLSIVYfIzLVRh7mjWtlZ7GTrECYdSb5KHtm4jRlJ8QsNC6rOHkPJr64SEWUzJ6UO
         b3kZ96rXtrKgG0jogHYS7u0cbKmA3Gzmmti+jTqd3wlImCE/kQFoaJOaGXekuBd45VYK
         0ZYZQk10PNvSX6ksGmNrwvOAVuJZ+xUiH5Bm4q/+aKeW3JLGdk2tw98roasIHshEAqMg
         onWz+AQIsmI6bFIikyVupv2dh4aouJkTVpniLmnSTRXesvPN4XnWai4hT7Y6BS8gPhxD
         tRSWKUfj8hdq3uSTkg3t0uSerBmPvRuevB1mS4YXJYUdXNQE22tNPlSBu5hte7UJA6vG
         7lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687945188; x=1690537188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLDDju+UmvsFhaxhzKb6/fdJIUeZDqj5U57WGkcO0YU=;
        b=Fv1WtQRfSrz6x97x/UH9oQCgRprO+zPCzrwxpbfUXfLgoJI9LYkSHuAIz3dHwPDEFc
         qpHEh6QOLguyEB3qKQY0bmbO+qkj/UfhT9ejRGYkQkfIKWQ9+qZ/a8bvoQK1JU3clNKq
         kmWbp+KFQtFtJ1yhn6m0tSSe7NYbRyt10NEr3cbDU++hxUN0XF8Gx/WzIT0KqFAyO1ou
         1iFXWRqRecO4/iJpxyzU5Brk9Bj2PnDlEXOicbl+yWu0J909SrlrizexUAE9WxdvTNOw
         2ghv4wdUgdjd1v+EMFiVpzP3ZKVE+4byoM/DXhC7ObCU6903+6YKCkWydFpPxQrPy484
         1vrA==
X-Gm-Message-State: AC+VfDyGSG89QJHYq99a4fUA+Hy9d8ItrWXQnrl2jJLYdyJxWD3D0+Pb
	F9YcuH4BpkMlquxOIDZ36TcoS/8GL6+ryQ6jP1s=
X-Google-Smtp-Source: ACHHUZ5n1lXN39Y/5Z9VLLHp53jLpmf5cHWi6VC2YK8J6uZKi0rkLEPzbLCwYznoNmA7bEgAWzZCExkCSVGIm0Q7tpw=
X-Received: by 2002:a05:6512:b8b:b0:4fa:ad2d:6c58 with SMTP id
 b11-20020a0565120b8b00b004faad2d6c58mr8489036lfv.61.1687945187843; Wed, 28
 Jun 2023 02:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230612014135.4149961-1-raj.khem@gmail.com>
In-Reply-To: <20230612014135.4149961-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Jun 2023 11:39:36 +0200
Message-ID: <CANNYZj-R=DsgZxNzW0bVan94-kHz=5NRa09JBqGY_E8M+1tnKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] efivar: Upgrade to tip of trunk
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 09:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183549

On Mon, 12 Jun 2023 at 03:41, Khem Raj <raj.khem@gmail.com> wrote:
> +PV .= "+39+git${SRCPV}"

This broke upstream version check :(
"+39" isn't necessary here, "+git${SRCPV}" would have ensured
monotonic increase from 38.

Alex

