Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD2FC433FE
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 19:32:43 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.81817.1638300762835323127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a6Vzh/Y+;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bi37so56501606lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 11:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sp2QsfDluv9J1m4bPicJpcmAfMlpuXLhblps/QnMGvQ=;
        b=a6Vzh/Y+MGGIswbM/4m5vmbWHYfN0IRA181916pHa0w+8EKciQbuPLbsixRBVxIaGf
         Wdq+4U1CPayWzEecTLcIFH0OCmBpGpX9JJ7d7LSzr80vYhMv15JYMuk5srZ2xpzdEwHe
         X6jcbXZn98Fi3Y2+bg0k5dw8nO2PUCcSoA6JdCT9+91InBgxsIprj4ayedO2Iy6HU3j9
         LPRQe9QVFUgHlEZ6IPd9IfCNeJY6XQU8zdKcJnbSBZZmxGoJt5tJG2CXXilLX718c3uG
         PsZcjRKxcji/X0e5WwUXhBV3D4qJXOaf2cDzCCntmWL/qy+YiARwdufS0ANxI38uMMZx
         uNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sp2QsfDluv9J1m4bPicJpcmAfMlpuXLhblps/QnMGvQ=;
        b=5cfwTPzywrx1/mtEKc4AGJcEGKrju+oalqPp5f7ytNNmqhDF4uonAksyHhpeWDMqBQ
         kW4ww+xx139tTzMlT1GwOdo+hljkUNFn0qegwftCLYSQQ5FSQ7ims4Q4xiIXDkghJVnm
         Wgx1tB0Z741FVAD+l34sldwefJFt+OoCm5lw5v7bjZt19EzM627MvFAYSrN1kkbuctUr
         5CqQw4Emyz5fnKvW+1LnHJf0DH3HZfcWvjbGBk0lGwt8hthhjKHnx8Ezy+WESIgZ7eFS
         wxyXt0gyPW9MDost9wEoqxbmFmNWiWKE3EBbyzf74/9BN6iqzADqFtMR++ZICQyozI0d
         WURQ==
X-Gm-Message-State: AOAM533B2wjzBlzyKZWGVGHplJ+n4LiNDVy8mpbxxrpgesfYtfRMoMDQ
	0iXfRDpckEAtm952mmP0LXFo7YTVfqdPhz7P0aE=
X-Google-Smtp-Source: 
 ABdhPJwuNQsrrFkA3wiR1IEq/taVrdFxA1+LNedjRRPcmEFsNNq0ND1+lHLFNrCEH4mTlx8LzM2gGp9+LGlvpth0VqI=
X-Received: by 2002:a05:6512:3182:: with SMTP id
 i2mr1085442lfe.241.1638300760811;
 Tue, 30 Nov 2021 11:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
In-Reply-To: <20211130165313.3816904-2-ross.burton@arm.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Nov 2021 11:32:24 -0800
Message-ID: 
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Ross Burton <ross@burtonini.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 19:32:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158989

On Tue, Nov 30, 2021 at 8:53 AM Ross Burton <ross@burtonini.com> wrote:
>
> Don't set an empty default value and them immediately assign to it.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-support/vim/vim.inc | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 6cdf157cb6..a0692755b6 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -67,9 +67,7 @@ do_compile() {
>      autotools_do_compile
>  }
>
> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny selinux, elfutils, nls
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG += " \
> +PACKAGECONFIG ??= "\

This isn't equivalent - it will cause a change in behaviour for anyone
using PACKAGECONFIG += "foo" from a .bbappend.

>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
>      nls \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158982): https://lists.openembedded.org/g/openembedded-core/message/158982
> Mute This Topic: https://lists.openembedded.org/mt/87406894/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

