Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E70C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:44:08 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.15150.1676468638403313222
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hIJJYgON;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id g28so15067010lfv.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3NCHUWs2Ky7Kv4kxKQdEorn7AcUoGanRqu5eFpJhWT8=;
        b=hIJJYgONt0srORv2vghJ6Ws2D2vjVh5DRjbdvdeZlkIbdtP9sMyj0qhYR+3gLRiSN3
         Aw7/bAgXOYgO1NZ6z3yLbqp/QpFclHkX/7emm27FX4dcsAeUS+wh95KOo/19rLlGFCY0
         6VQ5sPmjUf9wLfopyabpEfMTrOaOQqASrvcCw9PSm/zGmv2v6ykuocpAtxZ1anSG/PHS
         CSAfIH0lsl+WQsgJGUbIraZjB/xOpN9S7MtBVDheQytzmFMy3N6zZAAfOERTQHxr9g0w
         3zm1pIzpRwtKhSNFFy+CynX4ltGUm/5PGGGRqWoL3Zlquq0W29IhYqLo6sg5BWeU75kH
         ncdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NCHUWs2Ky7Kv4kxKQdEorn7AcUoGanRqu5eFpJhWT8=;
        b=XlVUjWEUO34HnMDippRCWnS0xar95NuoBFd97nzg6CxvPwQS3+Vmy1+uNA9Lq2Wm5C
         O+4hrnSnm3Ht2qMoUjgdUsKrpkwfUNgqKR4F6XPTWzgiKcczQSpXdY1KFa7j25Vyj1uK
         TQ/0KeiHMwbC0RhHTsqRPBsFQ+KwKrC3CoGjv2R87DUspXCu5khm8lf4WiSDSRSC57r0
         Pmkiuz+uWM3/X32pswmwH8Cdq6FxZ6fXc2/nVB32fi/iiHQQS2Ba8/b0FHk41+CfV6/q
         APvw/wD42IyyUVsGHRQrPYvo3ZPGuDd56RVSCZluGwRy2q9RHTtg57oB/s9NO/f1YRC4
         p7OA==
X-Gm-Message-State: AO0yUKXjT0OfjKS8NEovvTV52RxsEL/Ksu4gcxUJIVsxY98lVQw5kQem
	9Zy/RnX9TWE8ubuBlgwi/54feVirmXDzgtx3BXw=
X-Google-Smtp-Source: AK7set9yyZb0vAFvxwU0GbQF2/p1S0G+XPQGh1QSIf2KIPZOrUrNvlnYjGOUqukpn9F60GhFX74nq43Rju2ny3t9CPE=
X-Received: by 2002:a19:c215:0:b0:4d8:1c0e:bfc7 with SMTP id
 l21-20020a19c215000000b004d81c0ebfc7mr537990lfc.13.1676468636491; Wed, 15 Feb
 2023 05:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org> <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
In-Reply-To: <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Feb 2023 14:43:45 +0100
Message-ID: <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177191

On Wed, 15 Feb 2023 at 12:22, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>> Fair enough, I'm open to the idea. It would be interesting/useful to
>> see if anyone else in the community is in favour of this or not. I'm
>> sure you appreciate why we need to ask the question and why we can't
>> just add everything! :)
>>
>> The community usage does appear to be primarily phytec/ptx.
>
>
> I have used barebox in some projects in the past for multiple customers. It is a solid and commonly used bootloader. I consider U-Boot the industry standard, but Barebox is also widely used, and it makes sense to be part of OE-Core.

I do not quite understand why barebox needs to be specifically in
oe-core. There's a well maintained layer for it:
https://github.com/menschel-d/meta-barebox
so once all those meta-phytec recipes are phased out in favour of
using that layer, there's no fragmentation.

Alex

