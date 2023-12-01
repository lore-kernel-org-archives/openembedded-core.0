Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE80FC07E97
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 15:25:59 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2175.1701444356415045885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 07:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i3quH4G+;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50aab20e828so3088724e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 07:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701444354; x=1702049154; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/1GPj3IolxXYdj+HP2h5kZLJvGW9mW8lIkpcl5DAa4=;
        b=i3quH4G+DRG96jiBIDjq+puTajgkyBH7jkd82JopiDK+gfKLNrRi5nesbId1T2u8UQ
         Cr0eh6A4MKkQ0hm2j9rfzt8BDyQNQg4tOQ71Pg+XOxWU8IPw7HBsmd4xWj5tzBsTvBnx
         x7Swve75ac32SDR3ZuCCs8vJ1BS0+Fak9EJe9FmnM/YoVAII5KWvevz5R9cArpK4mxhi
         Os/a9wz/Vyjb8eT2Ii4NtuJJ1L8JBWEx7/N3CRDNqr2D7M17ad8Wf6PvWzDTkzkNcu1n
         YaY/ifKHDFjcY47JtjSnYo/irlIQAWXQ0iWalxu2J5ZLO44ejucLCHgFiXDuHLWt/mqj
         AtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701444354; x=1702049154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/1GPj3IolxXYdj+HP2h5kZLJvGW9mW8lIkpcl5DAa4=;
        b=gsrrqTgZyxoAi1/ZNtCqU59Bncn1fphLfmZ8a96E4y8iOjOidmnI7GQeMGZXuaursB
         ve4JCI4NYzV5hQqU/DlMB7jCDShd7qssxV+Fue4mvZGrp3B1cA80ZdEhlvuE2o0HebdB
         rGpiLSSAXO9gEwYnBbt1goF4gSsoDSmmOJlepLCJG/voV3/gLeyTBE1ZJYw78DFNvPvn
         SBCpZTRXxzDP6hF8ZRi6AaUekZCGFA9tYXTBKA5kZ8O+e+4bAXri86h6F5crc8CHLyBV
         Jrmm74xBd0SREiaudjFVAI2/E0yXhmdaDskfKH8l8ZvgJesc4TxYyh+pnCj8D9gPHYLO
         a6lQ==
X-Gm-Message-State: AOJu0YyvZ+eo9/aD5585K5cstdlPUlNvWMRain4EHwUnL+/TOhdii6Qa
	bQzQO6xjVcgFCYgyGwL1N02LVPJ7CGbdeUVqx9M=
X-Google-Smtp-Source: AGHT+IEf3rvU1CmlKMVMeAzgAHsm5Bqxh2EUBY6cDUjodO0tMx+/Ru5/SWQMB7+LZLCMUfYgo6diBDKHNmWKyUPqZEc=
X-Received: by 2002:a05:6512:21c:b0:50b:d764:64d5 with SMTP id
 a28-20020a056512021c00b0050bd76464d5mr858715lfo.138.1701444354378; Fri, 01
 Dec 2023 07:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20231201151924.874316-1-JPEWhacker@gmail.com>
In-Reply-To: <20231201151924.874316-1-JPEWhacker@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Dec 2023 16:25:43 +0100
Message-ID: <CANNYZj-hjCnn4qPbopoUD=Ly_km8o_DkrFFrWqjbrzr8s2o0Yg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes-global/insane: Skip sstate creation for do_image_qa
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 15:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191673

Please see my latest comment in the bug, I don't think recipe_qa is to
blame, and it's not going to solve the issue.

Also, we do plan to actually register the outcome of recipe_qa into
sstate, that's why there's a placeholder for it

Alex

On Fri, 1 Dec 2023 at 16:19, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> do_image_qa doens't produce any actual sstate output, so it should skip
> the sstate creation (similar to do_image_qa)
>
> [YOCTO #15289]
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-global/insane.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
> index b78bb6f445d..5ce4216f3e0 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -1556,6 +1556,7 @@ python do_recipe_qa() {
>  addtask do_recipe_qa before do_fetch do_package_qa do_build
>
>  SSTATETASKS += "do_recipe_qa"
> +SSTATE_SKIP_CREATION:task-recipe-qa = '1'
>  do_recipe_qa[sstate-inputdirs] = ""
>  do_recipe_qa[sstate-outputdirs] = ""
>  python do_recipe_qa_setscene () {
> --
> 2.34.1
>

