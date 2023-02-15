Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0151C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 14:59:28 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.17088.1676473165812505126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 06:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=r6zvpLtB;
 spf=pass (domain: ossystems.com.br, ip: 209.85.161.48, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oo1-f48.google.com with SMTP id y81-20020a4a4554000000b0051a7cd153ddso1921048ooa.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 06:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCLbkuPWNu8lBSY6cH0VBmOiD9CzeRhHNag/JDYCPl0=;
        b=r6zvpLtBRqc4RUM/7sJqlXWc3b550SazzBenpzcjjOWE5rCX2Da7mBfewTjNiJcgwl
         YUBdJ3oHnXJBW62bFo+4vBDoZzWANGyAHNDBYBkpVXKboRFO/4i2CGo+T/UffbrTB2nP
         QgvyaMbwUnE+v8T0rCq6PXhGOVXLipVI6QUs2y0ICsBC+tv1GgniFQUthdolM4++0F9s
         QPNym/kqBjWP07OaeHGiuayCjuXjA2FNlIoIIxPCYwExc4IwjI8Wpoz0BqdiQXXGeNB+
         ET72X/wUSsDA8tHNL1aAYJ2pxPwflf0gkogRDojtupkLjrlphLhiuUukhAdTNlK3MbTz
         r1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oCLbkuPWNu8lBSY6cH0VBmOiD9CzeRhHNag/JDYCPl0=;
        b=0LTCfPhK1w1loM9eepqtLRw0VNWncyWrxtYlhyAGm9vHIbvfCnFMfNBxnlBtcQnXI/
         HWQIvws3ERo70AmbZZ6mbdRc0Q6+7k29gVZBzsQ1X+qbc79hTndVP72ry+KfuTtRRvp8
         9sS33pG49S6vVx5ib3rbbP2jrUJCU2MN5HoJGT6Z0w98+QKdeeTDtNd0TBwPZkku1J/+
         A0az9DM4a1v3hr6XQD0N+Te35hYzvGhZWcQWysVX6j8y5lB4wC6n7/5NmpEy+xhCs9vc
         f9gMJDVgymgWN1I+VqnwCBqHxgBmwyw2lpWKM/enKPvvlL7KBkwQ12TVdIF7efatwu7L
         l4Ww==
X-Gm-Message-State: AO0yUKX9cRe7syh+b0j+6u2Pk4lZg43HtrpZK9M2K62PeenCknSn6Cj6
	Zn0eYNCRUGQWV9mMPXNLpe/MpC/DJlHkp8ff828=
X-Google-Smtp-Source: AK7set8pBXeqJ1aQdbsllU++mlZ1fHx4I04t4aeemk3il3bj8RgX5KfooayIe7O3DOaMtVddpLrEaA==
X-Received: by 2002:a4a:2809:0:b0:51a:aeb4:3995 with SMTP id h9-20020a4a2809000000b0051aaeb43995mr1281832ooa.8.1676473164262;
        Wed, 15 Feb 2023 06:59:24 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id b15-20020a4a98cf000000b00516d4eac864sm7119796ooj.29.2023.02.15.06.59.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 06:59:23 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-16346330067so23214459fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 06:59:23 -0800 (PST)
X-Received: by 2002:a05:6870:f:b0:16d:d720:98f8 with SMTP id
 a15-20020a056870000f00b0016dd72098f8mr260575oaa.288.1676473162966; Wed, 15
 Feb 2023 06:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
 <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
 <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
 <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com> <CANNYZj_jLK-FXrGx+bF6fXrSsc-so6G_kpyZKNTpatqJKxQeRg@mail.gmail.com>
In-Reply-To: <CANNYZj_jLK-FXrGx+bF6fXrSsc-so6G_kpyZKNTpatqJKxQeRg@mail.gmail.com>
Date: Wed, 15 Feb 2023 11:59:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpNDSBSwwAwfBCFx6gJQqNEb8bPpbiQwAbFwGkn+6WfUQ@mail.gmail.com>
Message-ID: <CAP9ODKpNDSBSwwAwfBCFx6gJQqNEb8bPpbiQwAbFwGkn+6WfUQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177200

Em qua., 15 de fev. de 2023 =C3=A0s 11:11, Alexander Kanavin
<alex.kanavin@gmail.com> escreveu:
>
> On Wed, 15 Feb 2023 at 14:53, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > I think the Barebox inside OE-Core allows a bigger integration and
> > reuse of existing tooling for signing and other classes currently well
> > integrated with U-Boot. For me, a critical point for decision is if
> > Pengutronix will commit to support it.
>
> You should be well aware there's a history of people contributing
> stuff to core and even assigning themselves as maintainers, then
> disappearing. And then it falls (largely) on me to keep things
> (barely) going. What happens if ptx withdraws its commitment? Can I
> then send a commit that removes barebox from core? Imagine the angry
> lynch mob that will show up after my head.

Yes. If no one maintains, it should be removed. People will get mad
but then we'll see more commitment in future.

> Adding things to core is a decision that cannot be easily reversed, so
> I'd rather have barebox in meta-barebox for a while, with any needed
> fixing to classes and infra in core.

Sure but adding things to the core should still be possible and it is
a place to foster work sharing and contribution.
--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

