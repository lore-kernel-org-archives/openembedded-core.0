Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131D6D65523
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 16:45:34 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web11.51094.1732639532854814885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 08:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kOPxHRAe;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5151e429d53so844173e0c.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 08:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732639532; x=1733244332; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DJCXsj2lCSrvrCreYdbgoOjdEsBraBd4AeZOU2uut9Y=;
        b=kOPxHRAe2UZE2I2eUS6et5xK2qL4IS83MLFsVnytlwtaKEZMJYCHM2qUtvwQwLHl7X
         +DVSJFkuSOT4o3hf9fiF71wA5CRDIKzAbwgeD5wACHN1BzJBMOJYo8Mc9wHCaG4uwucC
         Gcq6kTyjzcTxgq2/MTYgO4Vk3tUVM/dLC112Kpcpqsv+KJairx1bJ2Nf70L1ZiFgy/wg
         2/swKWkoJSWgBYNQr0sf2MQuGNdN19gKHDIKM6cWvtpPDreL6BRpUP81i0qPpOrR6Fn2
         PnnYFRKBEQ/QByQ4FZrALcmokCe+GsmdJ7gqHWXt/LaPIa9+dDvJy6/6Os1IqraCReoP
         FHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732639532; x=1733244332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJCXsj2lCSrvrCreYdbgoOjdEsBraBd4AeZOU2uut9Y=;
        b=cE6fHeuhu6xKdNoyypTuiGscDdtzw17bhfawxu2r+dRXy7A78H2/Z/SD/5KlsXhKR4
         zK5UmXoOnvHKcI9vqJPJmHqjvrpZaeituexAgv6of0MfW2nflP0uQqCcvM+HQxZfYCDF
         DqunkrfS6RtuWmYAdxrmpQquacveUjvaKtE/6oZMCVr1LR+h7pPjDyPE/w1AD/bdwout
         rEY/W3HpHcyPW6KZ5RpM55aQKIpp8mP3dYDSLa74Ct8e8Hu+sOdqStasSpM4pcLrJ9S6
         Bj/1mpeL2CAQFKaSfj+HIUgClXn2tQfWMo4kB3UJaWJhwnGrQM7Awyb6670GOBrPb4Qi
         dcLA==
X-Gm-Message-State: AOJu0Yzsw8e0LROxh5OlngC1L2g+OM7BVOmzhTYVntaGIcybaqAP5Voo
	tqxvXUKm/2s+2p86qek81HE6QUPkLpVDdMyr5XtV3Bs44qtP+ubD8e3t3WiMr9YmJxdy/Yrl44x
	wk7DYwHrX2dTHLesiliWwY1ZJvmA=
X-Gm-Gg: ASbGncsTogmSrm6vd5Q5ymTbr0ESYO3EAY9uxSAxrfgKdmfKBRRZ5ZystqROlOLXDlK
	Tnw+Cbrz5AqKJoC6HebFIrVV70SyEXCkF
X-Google-Smtp-Source: AGHT+IHI7AD1KhZsS2qKH8wW2GmgvsnWATSfeG928ina3ZYc7ttv4/XBxT7KReemd7WNr9bltoU50kwclTwtUO6nYVw=
X-Received: by 2002:a05:6122:218a:b0:4f6:aa3e:aa4c with SMTP id
 71dfb90a1353d-515569abc33mr95976e0c.3.1732639531716; Tue, 26 Nov 2024
 08:45:31 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj8ir0JV+0feFkn=+oRR9evOqOEWhgDaS28i3VcdHUAw=g@mail.gmail.com>
 <180B91BA7D0ACFD7.7301@lists.openembedded.org>
In-Reply-To: <180B91BA7D0ACFD7.7301@lists.openembedded.org>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 26 Nov 2024 10:45:20 -0600
Message-ID: <CACS+7ZQmmD8G2jomCq0313=83EuYy9Ekhz=bNXrzdLDX+ktk2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: package tkinter's shared objects
To: danismostlikely@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207866

Nevermind, this didn't work, my initial optimistic test was wrong, I
had disabled the tk packageconfig again before I ran this :(
The original patch so far is the only one that I have that's working.

On Tue, 26 Nov 2024 at 10:31, Dan McGregor via lists.openembedded.org
<danismostlikely=gmail.com@lists.openembedded.org> wrote:
>
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Seems every time python is updated this gets removed. That's likely
> because the tk option can't be enabled in python3-native without
> creating a dependency loop.
>
> Instead of manually editing the manifest every time, explicitly
> add it in the recipe as suggested by Alexander Kanavin.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/python/python3_3.13.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipes-devtools/python/python3_3.13.0.bb
> index 8db5b813738..497b5fc1744 100644
> --- a/meta/recipes-devtools/python/python3_3.13.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.0.bb
> @@ -428,6 +428,7 @@ RPROVIDES:${PN}-modules = "${PN}"
>
>  FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
>  FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
> +FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
>
>  # provide python-pyvenv from python3-venv
>  RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
> --
> 2.47.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207865): https://lists.openembedded.org/g/openembedded-core/message/207865
> Mute This Topic: https://lists.openembedded.org/mt/109792213/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [danismostlikely@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

