Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C612C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:04:38 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.15734.1678442671892209933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WBVAfBoM;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id z5so4728367ljc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TKEeq3Vtx1ER/qwlxQenpzWoeEmlQIyNZCtbVEn/S2k=;
        b=WBVAfBoM7YGu7HDwEUPbIlxe4joIAWGLriSh3tFn0L0V6R2W3T/UfA2P5mKCRsONFz
         ZLunLBL2f41ObNevaIxulsBSTOXBZeK2XhVQ4M9RwiC0NTST+y/Dtp/q2SjprtM89ZF5
         u8M1Gt7+qqGDrLahs+rC6Te/cjw3un0LqwgjkBChneDTpkr6uvpBrssT9yamgjMVKdlz
         8g1SB/83SpJ5y794wnx62bOvuRtBWnDUowg6QepU8wY8z0sXsG2aGTdyEImpH3huBj9V
         ddZGxeAg7zHI9jf37gTipyOgTghWncvna03ZVnx6nBD1NRcAVWFv7iqR2pg2jUdLPQg8
         8giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442670;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKEeq3Vtx1ER/qwlxQenpzWoeEmlQIyNZCtbVEn/S2k=;
        b=tRg2Wyk9a+/p78CBVMOc8U7e/FYJAPDBkN4h9YYVUQAZ4Zh87xBHbGkgnKu23P4Uh+
         pbmg5ZF9jHBC3GwaOpQcp8l/Ks+FQWX35qw2hv0DhGUo6vlGSJyaMt9JQhjAXUgZ1VXs
         0m9516Ya6G7SQ1NYyhQf07Q+eIXCATOY26shAfVyQb2Ry6mLASgjfsEU0i4eVcHsPblH
         J0VW7cXqKUSs/XyXLQpt5GRbN/M8h6XLrJzIVX98iZbAPQxY4/X+PSp6Oy9S/fJbQzik
         KLFhuLT5WdT4CLUk3VcNepNVpr72qR0htEfd99fxu4valWtlvymjluTA2ye4mSp6iq6F
         m9TA==
X-Gm-Message-State: AO0yUKXmEnrN4gMhyrbH8Sf8IWPJ6t0EewqFTX9m+1YrYS7BDrSst5/N
	VawUoYA2oG49DeedDSGHqz/fpKrUruL1SdvSI0odp0s7
X-Google-Smtp-Source: AK7set/lnvYDBG94uKWhjSqLYM3s3ZY8YHD2rU2iDVMRu80M7kZS3xqHVK449X01HpuRoJug5e4Lmv2NsFcu0k3sg/A=
X-Received: by 2002:a05:651c:336:b0:295:d632:ba25 with SMTP id
 b22-20020a05651c033600b00295d632ba25mr7680842ljp.5.1678442669610; Fri, 10 Mar
 2023 02:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20230309212354.1191371-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20230309212354.1191371-1-Randy.MacLeod@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Mar 2023 11:04:18 +0100
Message-ID: <CANNYZj-W=U=o__xw40Nm0E1QqJ4-U+J-3dQ2CEgCeyAP4exw9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: Disable drd/tests/bar_bad ptest
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178322

Ok, I'll bite. Should we just drop valgrind from ptests? It's by far,
the most brittle, finicky ptest we have, and doesn't seem to expose
actual issues, instead just giving everyone a never ending stream of
intermittent failures or tests that won't work on anything except x86
configured in a particular way.

Alex

On Thu, 9 Mar 2023 at 22:23, Randy MacLeod <randy.macleod@windriver.com> wrote:
>
> This is failing intermettently in the YP autobuilder
> so disable it until we can fix the root cause.
>
> [YOCTO #14311]
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind/remove-for-all | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> index 5d1e7ed102..e26088f3b1 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> @@ -3,6 +3,7 @@ gdbserver_tests/hginfo
>  memcheck/tests/supp_unknown
>  helgrind/tests/tls_threads
>  helgrind/tests/pth_mempcpy_false_races
> +drd/tests/bar_bad
>  drd/tests/bar_bad_xml
>  drd/tests/pth_barrier_thr_cr
>  drd/tests/std_thread2
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178271): https://lists.openembedded.org/g/openembedded-core/message/178271
> Mute This Topic: https://lists.openembedded.org/mt/97506606/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

