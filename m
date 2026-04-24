Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126DBFE51F3
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:47:04 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17441.1777024020483147556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 02:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=I1Jed6eM;
 spf=pass (domain: smile.fr, ip: 209.85.221.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-43cfd832155so5584354f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777024019; x=1777628819; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wVpdEJQEhfoxaT0OU2+i66Cw8ACYuz2xXmXcJhV0fA=;
        b=I1Jed6eMjIeTzRzDp/9DDJKo2Lt4VimP3DKbX7KY3E/9ZHHc5c90d7syb5h6iTDvFY
         j9S25Mooi2ZJcsg21780EDkwDiFwLhXJlkaLYSCZY1YAhBMWPFel9Gm0aKUkbcssadPy
         fsKyusG/oEEVFoe1S1zROrRp3cDGtzwEHPHk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024019; x=1777628819;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wVpdEJQEhfoxaT0OU2+i66Cw8ACYuz2xXmXcJhV0fA=;
        b=l/oNH1ku691WXbDxn03r+HVYNjjJqzxrw49CoFOZ39fBYrAgDrRy4cTQ7pElx9mobQ
         fQNKfDMTY5JmugSVy2HtMsLsZcmWPziF5G+3k1Mnn6nk6Eux1om7/Aee243hd9mtVfiW
         BkczV5u1lqegcrtbBW6pTF0H21ZOC5Bgdu11Vm2OFa7eYuaoM3Ns/4Fe0EBAkmdVpwQx
         mbX0ZwSx/DPaAgGPXEXxzvwfolHzy1J76Y/opkVWEQPKLgWIyjx1jDzLxpvBF7V3k/gG
         e9yIJB1SA+FOoILvUJii/eFoCb692PCaZpEoj3wisTDXo/NzBfNcGQstABalxO+Dvi2c
         Cysg==
X-Forwarded-Encrypted: i=1; AFNElJ/3qzWkbn9jC+0B0nuTAccESIMGSkJt2n3vHBSvxD3okRe5LZOsjQBD05Nv/93h+WjKUQIE/2NIHDsv5kAMjEyvFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyM5C75vjjxbVgyXORMMdPeDX5Zi5+3igIgElATs9RS6nk0S7u3
	2Kwj259bq1jDD8DW+iWs6CeWwuLK9Z6gtu/HjelKDOdat1/LSRsoaR3Duz4w0/XDbZU=
X-Gm-Gg: AeBDievrcvdo0U8axHaqZ1aYjRKMJR5NXR6FefFK6sPfrX9rsfdbzZ65CBQByAMEtDz
	u3g8tPa1H3dZHu5QoDoG1DnLKHHo/y2yfAG4KyXIgwPshUTv9Hi9a0bwjE6qnhdtenEGaXaN5Lo
	opjeZXcBmkIzvR4FIuwMHp157/pG2p/skJYxJh5bwDkTA7VIuwFWU9kjW7Qm7kZOXQQnLYwATtc
	AVlNFBFiO0vR4gm5L4Rszqy23hrAYxvEmPi0fcgDSlDTBs14Gwg0OLm2CyBUvkAYuIzKiy938xh
	XXiWoEkzQTSdjMJEnmRWi40nO3HA5eqJc0qBhmWQk5HLHIM0Nry672+ef72Apw8VqTpoZ6GXSV7
	AnuObkyC79gG+rpvlZSi1KERYPMFicWqh428Emyj2YiAMt/0EcvGQr9wh9oZ13BSP4C17LwyDJi
	Nv0u4g5gAsKnxPj3Bk3TTusSkEXg03Ejf00mbkVuyTyNVmML1XCz2YRsU/FARXK9mZ919GH6ovC
	7G9uhOSu6bBogG8upqnWn4SjA==
X-Received: by 2002:a05:6000:144d:b0:43c:fe0e:5bbc with SMTP id ffacd0b85a97d-43fe3dc59a6mr46052470f8f.19.1777024018762;
        Fri, 24 Apr 2026 02:46:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a7b4sm55131721f8f.22.2026.04.24.02.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:46:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 11:46:57 +0200
Message-Id: <DI1AFVXRJ2NI.24IWEN32PDRM9@smile.fr>
To: <calvin@wbinvd.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] Backport 'kernel-devsrc: make
 tools/Build optional'
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.20.0
References: <e2093fdff31efa8b84fa09cc62fb72a77a8cc29a.1776392062.git.calvin@wbinvd.org>
In-Reply-To: <e2093fdff31efa8b84fa09cc62fb72a77a8cc29a.1776392062.git.calvin@wbinvd.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 09:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235853

On Fri Apr 17, 2026 at 4:21 AM CEST, Calvin Owens via lists.openembedded.or=
g wrote:
> Backport a patch to fix v6.12+ kernel builds on Scarthgap:
>
>     commit 13e16e5be25f379211c7329fa1462464174c0f2d
>     Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>     Date:   Wed Nov 6 21:29:17 2024 -0500
>
>     kernel-devsrc: make tools/Build optional
>
>     kernel-devsrc fails to copy files for v6.12+ as the
>     following upstream commit has removed the file tools/build/Build:
>
>        commit ea974028a049f2cea4bb6be963ee3e3844a03f6d
>        Author: Brian Norris <briannorris@chromium.org>
>        Date:   Mon Jul 15 13:32:43 2024 -0700
>
>            tools build: Avoid circular .fixdep-in.o.cmd issues
>
>     We make the failed copy of this file non-fatal to support
>     all kernel versions.
>
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---

Hello,

I took this patch but replaced it by a direct cherry-pick of 13e16e5b. I
added you in "Suggested-by:". Ping me if you want to change this
attribution.

Thanks!

>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index 7724967151..1500aff2e2 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -156,7 +156,7 @@ do_install() {
>              # these are a few files associated with objtool, since we'll=
 need to
>              # rebuild it
>              cp -a --parents tools/build/Build.include $kerneldir/build/
> -            cp -a --parents tools/build/Build $kerneldir/build/
> +            cp -a --parents tools/build/Build $kerneldir/build/ 2>/dev/n=
ull || :
>              cp -a --parents tools/build/fixdep.c $kerneldir/build/
>              cp -a --parents tools/scripts/utilities.mak $kerneldir/build=
/
> =20


--=20
Yoann Congal
Smile ECS


