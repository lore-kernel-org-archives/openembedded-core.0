Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CBCC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 07:06:05 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.29913.1658991956806339103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 00:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FzgwU5xD;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id z25so1555594lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAIgSPf0b3lToPjLCiElmZmarWyjLdZmwPYJuEB1kuI=;
        b=FzgwU5xDIaJ+z6aVjANsdK2K3ro8EOYORgJeG5N/JdKPSOWgqmdnSlQmafk/0Ne8U/
         FdCfxLGnwzrr1bsO9iGZxhzQ5mBEfquOlh9eiUsfz4WuMVaatX6RPpK7KmdgpZxlpYyo
         iTRAfIxUo0NswhZFvA4nDBMKtsDx5JGKDJ4ijginHb6WUtarbONxhJe+ue5jMzLwJWhS
         WtOnu0+aRiFnlKn6tQXbzFTnm2PtofIk/9j/xwqgXuBP0TrArG1PQ7gpQqyYwmEYYvzx
         2rzomZmylkB0t1/uNiupjstbawSDMbaevwRiwLgYMrGpr3h+tAbs0fUwzcZOs9VPo6mn
         Uvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAIgSPf0b3lToPjLCiElmZmarWyjLdZmwPYJuEB1kuI=;
        b=XHDB6rAddMnN/CQshN4GNqTvPU1ywKnPqw03Pmu8aVIyyMuUqV806dWEVa6x40otzZ
         ltSiZwkBYyZug7k3IFi4F7jHhjhdJdPNZSKORlMxc1DZxM76VRRGHUdMQgX/3VlfiTrw
         wjo+AC2Ae1uMi9ZoTSaxMsBp79W160P9+Yj9eq1YC+zdBQGThZYSR8IfgqOjrU3TSTai
         RvfQntNild1UPx716AliTWjI9evSrSkh64DCoVXexvVRQzCO7BStV1+sAbLpFwNZEy6p
         /05PJyvDdFNeEGM2vOBf16HIJkBPaAXU8ICUA4qOrbcUXDwbotvIIm4vp9FmCM/FSMcy
         Rq1g==
X-Gm-Message-State: AJIora+tJyEG6OfWINTbC3xLRifM3ujuTBoMAWmR8EpmmYWpvaXt+6+V
	/YkSR7LaoOJRXQZGcwuGpvusOrlG11NKKIbLv7Y=
X-Google-Smtp-Source: 
 AGRyM1u0Qrqdma72qdZauLLR+QRd3ozB0xIRF4HLEya9VjrCkJg93LZecS95+YaqASYdgsh7S8CieYOCMXGXk9B/iTE=
X-Received: by 2002:a05:6512:1050:b0:48a:2319:59bc with SMTP id
 c16-20020a056512105000b0048a231959bcmr9160224lfb.665.1658991954191; Thu, 28
 Jul 2022 00:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220727053939.353717-1-changqing.li@windriver.com>
 <CANNYZj--dxtiE6OvQzmUkpzKD3nQ-Zt1C5kbPLUWaBszfvqFLA@mail.gmail.com>
 <1dfde637-8448-920a-91cb-7963cda09297@windriver.com>
In-Reply-To: <1dfde637-8448-920a-91cb-7963cda09297@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Jul 2022 09:05:42 +0200
Message-ID: 
 <CANNYZj_7VOR6t9RgrfyPZVSCH8XjyfPZ=+PiSiEVSW94gX6uaQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][master][PATCH] apt: fix do_package_qa
 failure
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 07:06:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168596

On Thu, 28 Jul 2022 at 05:53, Changqing Li <changqing.li@windriver.com> wrote:
> An empty dir apt is installed under /var/log/. It should be ok to remove
> it since apt could create it when it doesn't exist.
>
> We have remove it for target. So I do the same for nativesdk. Another
> solution could be INSANE_SKIP the empty-dirs.
>
> How do you think?

That is fine, but please resend with this information in the commit message.

Alex

