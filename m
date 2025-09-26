Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7C2CAC5B8
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 15:21:13 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.20043.1758900067221942808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 08:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iY42TPfm;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-81efcad9c90so8266636d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 08:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758900066; x=1759504866; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gc/fbCXZzaSVu5RUJvYbDkkvtmz+L6eV8p0WjGJVCcc=;
        b=iY42TPfmTTnnK+1ps6uVOmsQPo6h2LQTGdZt1GJbnoV9oBbMcZnSeE6Lx+dQeeKMLZ
         TNzRmK1lMsZTg7/JwVq25vpPZUPirACDruu/nStdPvGyldKdRWRJtXQJ49rE5PppJ0i2
         huADTz0T6JzOzmtzlAmxdTdKKDFgvuxXQPYmG34wrZYCYWI0s0twe+rqbFFv42DjsjF6
         R/1/nngBaqfZIIE0+LmeMWaW2MsKqws1FnPpsmRtogQDeI47JUPlbmMwcqkFpnnWnzym
         fN7AJK44nHzKC3iZforKN0Dc3MyBO6gUrUBGePxNu7iFZWbTJ7U+H88HlStIQ0RF/uSp
         4Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758900066; x=1759504866;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc/fbCXZzaSVu5RUJvYbDkkvtmz+L6eV8p0WjGJVCcc=;
        b=FPNhOgcGmDxW7Q2j8flNX50aYP3+aJ6cUohMBelYTga7CZRoVCoLJDKYy86Lny4j+v
         yfKHqKeEMwzDRWq4dePAb688iW62XTDzOS6Eu9FgCjl3egsiJMZAScFdhqjMCCFvd7jV
         oOVPlNTV7lOukSV/8tGReHCW9WQniXcmxxmvmNVZ8lrAcpLqwzXmlDOlJpFn72vYJM+i
         QAdfi+woyccpu8tef4vu/HdzNLjmlNkExg7Mdtxfbe/Xl25JIZMlKxay8x8Rvke/vI8k
         L711fYNwRX4vtenqNEhySzqwHIZMDfibYqq1OkymEiX4e0tcFSDj41MG7JekStknDMxi
         OY6g==
X-Gm-Message-State: AOJu0Ywq+lqBgke4hxn67GH41w6SQYhCoyPCBJBefiwokErQ8ByRp5zy
	d9GlSg1mSHVj4KkM15i2c9RbMmxnSgWIGoX7YL/BoJeQ/4JXhJP0dasnM0kxrvUEpTGUQFs9nPQ
	0/ooV/mwY6O67wf6nO4PpuKhP558iLTY=
X-Gm-Gg: ASbGnctP/KOg9LUE2i452ch6hPnYf7nrQeTcoM+z9xvxj8PxyDBwyXphxbMFDKVBFlZ
	KvZnK2XTARnYOa04S3SJWGqJnXCWkdavj5X6SwDzCYqcDJ8Ay1MZOfGKy99sOMOKjx5379rhBen
	zGVacdWrIs+3d8TLdf+yvQRtRxp0ImFRM5lXR7sYYw6SlY8bzZVqNdlo3JVST02iOJMXM2LlH7+
	uqqHd8CF0f8aUKwcr1rCTU2IJkeqvKWGgRI3Ur90X8GgddHJOD2IwejZxdt8y4JotzPRrm65ez3
	AXDxWP5XF+9PzIrViQku/+6fHHIBSgasyZkZjcg6bMXF+9HmuZw=
X-Google-Smtp-Source: AGHT+IHoaWvfl1g/giLn669LM6YGzXVbXlIkl49FDKMHuGpA4pR1Zk5X6q/DJhQ3V3o+jDx73I6unAxATj0JxsQa1X4=
X-Received: by 2002:a05:6214:20ec:b0:78d:f7f:62ac with SMTP id
 6a1803df08f44-7fc2fd733e2mr116231806d6.25.1758900066017; Fri, 26 Sep 2025
 08:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250926145305.528133-1-yoann.congal@smile.fr>
In-Reply-To: <20250926145305.528133-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Sep 2025 17:20:54 +0200
X-Gm-Features: AS18NWDR3fDi_L6rFnSyxO4JZ7pblRA_-Szt5r7g-WlansfOynnvCn8Enzkf_wo
Message-ID: <CANNYZj_cDXSYvBi6jxyTr_ER17h2bGP5uwcUvPv4SGiXm5t3hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-build: fix dash support
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 15:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224084

Thanks, lgtm.

Alex

On Fri, 26 Sept 2025 at 16:53, Yoann Congal via lists.openembedded.org
<yoann.congal=smile.fr@lists.openembedded.org> wrote:
>
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Being minimalist, dash does not support the (non-POSIX) feature of
> passing an argument while sourcing a script. Like in
>   . <some path>/oe-init-build-env <build dir>
>
> With dash, one must instead use:
>   cd <some path>
>   set <build dir>       # puts <build dir> in $1
>   . ./oe-init-build-env # can only be called from its directory in dash
>
> oe-setup-build generate a sourcable "init-build-env" script, this script
> must use the above snippet to be used in dash.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  scripts/oe-setup-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
> index 49603d9fd1..edbcd48355 100755
> --- a/scripts/oe-setup-build
> +++ b/scripts/oe-setup-build
> @@ -89,7 +89,7 @@ def setup_build_env(args):
>      builddir = args.b if args.b else template["buildpath"]
>      no_shell = args.no_shell
>      coredir = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..'))
> -    cmd_base = ". {} {}".format(os.path.join(coredir, 'oe-init-build-env'), os.path.abspath(builddir))
> +    cmd_base = "cd {}\nset {}\n. ./oe-init-build-env\n".format(coredir, os.path.abspath(builddir))
>
>      initbuild = os.path.join(builddir, 'init-build-env')
>      if not os.path.exists(initbuild):
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224083): https://lists.openembedded.org/g/openembedded-core/message/224083
> Mute This Topic: https://lists.openembedded.org/mt/115450065/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

