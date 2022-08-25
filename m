Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C74FECAAA2
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 23:10:12 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web09.30918.1661468991567523424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 16:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTCPo+xL;
 spf=pass (domain: gmail.com, ip: 209.85.128.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-33dce2d4bc8so19730987b3.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 16:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IX+G0H229+Ueimbj99KkMgu4WuDBv3LuNndiQXxe9ss=;
        b=mTCPo+xLw9khfLNlurDkQaUgNJ747dmQklBzy+kwsrAy61KfOlj9UecVMmSPn94q4q
         n8N6wqnZTl7z3T1MzViKOB9xFw+YZDjiUku/aSy7/afTRwsgFl5K50OpNP9uuIMPOyMv
         sxzTyT9NGdvdeZvVBkYuSEajd6HLO6nZuCLAyGrsbvjmAKEjwD03TF4hL/zso7Ay+nTJ
         v67stoGIJFATiBwxg/JoH82/s9xlZuxLNrIpg0yx71fx45gGJJtjhtoPsefzmBBlj9dd
         6eZy687LEOoZdeUeFg8oNmHxVDXJAqlIX5PRyn14f7aiNGyKE0oYsdQXrTRWmEJLRinJ
         MkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IX+G0H229+Ueimbj99KkMgu4WuDBv3LuNndiQXxe9ss=;
        b=jDj+NlEPN09ddZAY0/PAr5utPoGvpWsZrgmu4ybvn7PJ/EDZ08WtWDb4zFD144MGjQ
         crrvozGnQU1Q041I+3SSu8FUKIDapupZG/veUabqtJKZcbfd24YBMEFipwmekFlQbWp7
         lUoDKnEj2FZdZiS7Aa4IEVNbLmS2d48GK0NPxXzRw0I31ub/JTLceyogoODb61rVyE5u
         drL/KGWIdJRYujLc3CWm83ZKWhjeUpSjDEUwY0n4c772VjOzoiKPqbjtGt/Qci9/7eL6
         a9nrGwMnHgyUEXU9HWyfUPneDc5/dAlpnYBqOBdMDazbdCSabN4EFFmEVMJ5yse7p1zE
         /BxQ==
X-Gm-Message-State: ACgBeo1MPv0EAUV6wq4uPHlE0keXr3VodVDOVXwAyOVbjSjpqlTeIE1Y
	bwFosF3pgruM3mbEz7amLsmYN4rwobb7a/CHFqk=
X-Google-Smtp-Source: 
 AA6agR5/WnQfgTIfyxtPE25qrFJtYU7PPqyALC/uRERa9emxTGJECSEP8qTIMWaniDmxLWCYBY8gKAXW3+RCF3G0Vd4=
X-Received: by 2002:a81:6cd7:0:b0:33d:cd0f:123a with SMTP id
 h206-20020a816cd7000000b0033dcd0f123amr1513783ywc.422.1661468990708; Thu, 25
 Aug 2022 16:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
 <20220825104851.3258387-3-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220825104851.3258387-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2022 16:09:24 -0700
Message-ID: 
 <CAMKF1sqy_pTtgqmVkqKL_f3jCGBg5DLtcO2vkeNecmW2wygkPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] rust-target-config: Fix qemuppc target cpu
 option
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 23:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169896

On Thu, Aug 25, 2022 at 3:49 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We see a lot of warnings about incorrect processor types on qemuppc, drowning
> out anything else. Fix the option.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
> index e30eaa1da30..259cba7bbd0 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -272,7 +272,7 @@ def llvm_cpu(d):
>      trans['x86-64'] = "x86-64"
>      trans['i686'] = "i686"
>      trans['i586'] = "i586"
> -    trans['powerpc'] = "powerpc"
> +    trans['powerpc'] = "7400"

that seems to be dependent on what tune we select I guess. So it might
not work on other ppc tunes.

>      trans['mips64'] = "mips64"
>      trans['mips64el'] = "mips64"
>      trans['riscv64'] = "generic-rv64"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169846): https://lists.openembedded.org/g/openembedded-core/message/169846
> Mute This Topic: https://lists.openembedded.org/mt/93245410/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

