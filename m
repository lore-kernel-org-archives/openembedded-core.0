Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62868C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 12:58:47 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.14648.1717592324144008186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 05:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g1UagLYe;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e96f29884dso24443741fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717592322; x=1718197122; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Iebuf/3fN3Tqi742heqEMYC9DB56+wgGb43N2Y2f1M=;
        b=g1UagLYe8xUTR2jzyAgqMGJXs1M5FzeNHVA0tlGM+Y9G9LBr/Ke9Bziw7hTLCIcgQ9
         7xp8OzYD4iyS8VhmFluovD2jxbX9X6Xea+eJE5cvDyt+2IzDlqtoegT8od43+V38Lzyj
         LkRU8VJSoA+TOR8USK/zSv6AwlCZbOqX+aZuz7dnwQI6zvAyZ0rt9YpB3+c12j1Cnjx9
         Nnx1Kxb5i4AKnYWmUcx7jfqqIVUEx4BLpgO3ukKRa3xcTXg+Va4wk12MaACSiE0bVvJa
         ijTOrI+zNyI2xVJGp1rKbvb+Kttdo4WrjQGgrFEL7pOLZMEL5XvucwJxhmwqsXOsPtwo
         m/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717592322; x=1718197122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Iebuf/3fN3Tqi742heqEMYC9DB56+wgGb43N2Y2f1M=;
        b=NCrn0Tr5HypirjLc1eDy6nd2DmkVIn1mQGC15GS5GctRllQHEMR4s6+qWIClI9W7YO
         3gY9P7tABr0IXzX0M3G46YqzmNHR5OGgTNsL82bKVfHSTV2oPDUT26DNUSbPxa2zLn7J
         KxUOyzk6vdAfmMKhwOZMlVFENY2X3I+HP0Vmzzt1062ltVs9Mq9ypKKkuf8zrz81mkDs
         EZET0dLAIqyQEeNAwa8BfAxHMbzPNl1FRl24FbI4YgLKyXs5ILnT6GSgcN1lec2jJj5U
         0eke1H/i6n5xX5M9hUn/Cr1kBzsBu/vJRS3ifGWIn89IHA59Ciqj6A4ytmz72Z+cQu/K
         nkKg==
X-Forwarded-Encrypted: i=1; AJvYcCVGJEW4AOlZgHR3Ei1j0F266WnuiqN5DthC7chQsidqyxHO+yV8/THkiiNTU5qorShWfCn0gXI4dGTOWIkjrETEV64VjpFOsJnYjeCUBpsXed1f1cLsQQru
X-Gm-Message-State: AOJu0YyOUadQ2xxyQktBcnnBraJ03VqnXuM3dxKcXINPTGu+EtzcAaQ0
	L5sgraphhN5qYDIA6Uu8khUk9TVLa4FnatiUNUU1KavD2JvJlp7U8GsETQIlRy1DrfcBQI2PN1/
	Crmj0RlEDZQ36bRA5RhOneS5gRmU=
X-Google-Smtp-Source: AGHT+IGtF4lpIcxJ031r6IYbpdH/eh3qyX+5mV4sbAqKi6g1YhF5VlMQrdaHZ6Gl0Yj+xodpUm8/POH4QJywrgobjEM=
X-Received: by 2002:a2e:9913:0:b0:2ea:7f5d:ed93 with SMTP id
 38308e7fff4ca-2eac7a6efa7mr12921151fa.50.1717592322094; Wed, 05 Jun 2024
 05:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com>
 <beedf05b-3b5e-4468-a6d1-46d7d6734246@cherry.de> <17D5C581F2EC238F.7636@lists.openembedded.org>
 <CANNYZj92YgWuYYw+ofrRSJ-TW60AHksUOyY7xeY9sneUEv8DcA@mail.gmail.com> <e59274dd-de20-4d04-8e9d-850a514066b8@cherry.de>
In-Reply-To: <e59274dd-de20-4d04-8e9d-850a514066b8@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Jun 2024 14:58:30 +0200
Message-ID: <CANNYZj-o1wT5izemxGzdBm4Uxp=AcpXhK2dC4eDZAjqkyNNoEQ@mail.gmail.com>
Subject: Re: [OE-core] mesa: build failure in CI, dependency not found
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Markus Volk <f_l_k@t-online.de>, joaomarcos.costa@bootlin.com, 
	openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Anuj Mittal <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 12:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200363

On Wed, 5 Jun 2024 at 14:25, Quentin Schulz <quentin.schulz@cherry.de> wrote:

> Additionally, Intel Vulkan driver forces libclc dependency if intel-clc
> option is not "system" (so either "enabled" or "disabled" or "auto"),
> since commit b52e25d3a8eee702ff5d21e4cdb9a4dc0736282a.
>
> Moreover, Intel Iris Gallium driver forces libclc dependency if
> intel-clc option is not "system", since commit
> 5438b1910464e4b17fe0248a96a6ed98f0280a20.

core cannot rely on meta-clang (although merging that into core is a
medium term aspiration), so I think the only feasible solution is to
drop both iris and intel_vk from default driver set. And have
meta-intel folks sort out the needed pieces in their layer, with
meta-clang dependency or whatever else that requires. It's their
silicon, so I think it's fair to say it's on them to figure out how to
support it with the yocto stack.

CC Anuj.

Alex

