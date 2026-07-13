Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C114DC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 16:00:38 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14287.1783958431009736266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 09:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sNGgfccN;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8edda5d56a5so33368826d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 09:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783958430; cv=none;
        d=google.com; s=arc-20260327;
        b=TpsalkxOqbYP51Ut6masDxsNwQOwDhoCLv8ebLgm9KYvRs69Liqm1lxjdrkIXvDGye
         aNr+FfiKq29/rraC5e4lBwkcoSDxdcyCjOF4NkpGpMuaGXxAY8mNPBnhx6heh//ftLw7
         7kQUWlPFhFdxU5MZxgs0ZOcNxmRQwQQB1JcFvi15KSnitiw7O6JsKntfLWkvzMQzU/rg
         xWIsZE7N3oWOlxGd0X1JWfBVQypiB1i6WtSYNFobBbvaY0sva5vAat8FiPi6aDOUyGld
         SrgDax5U9rxYplc8XQgf9pYgd7QEgiAIfmjfHgp3MitiMb+6NLaiFljO9DFbM3kla5Ss
         DnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zkXBQYRv7i51NXfDWlJdipJ5BugurpQ0CDpQ6naHWV4=;
        fh=9A/YJjEur8lfKjhbFPwoNIr7x3i7ldh7e2L92hTi0OA=;
        b=n5EhI+EngCMnsQLCnl2i5HdwGVvq4eCLIcHwJdQd37cSSGEV0IcvEOAxxvvOD1b3WL
         IB8kLg8MZ9xklvx2xfepNDrH0CGX/kbcac4EcuvZ1rDM2+rD9mzMWkHjv5Mn6LGac0vt
         smzvX/YzyQa28Xr735CRq6maL7RGf7DjaXwjExNLHX3h7Cdz16+lTW6yJheAUqB7Mdm7
         nlnm+C23r/65CCHt69aKn15OsGu2jrmR9R5P38djjY/UDWDMYpEM4OWuDUZdvsNS/t6b
         DqrDVWji6QK5c8zCNpUFLKZaCrJKHETKtqGsL2fzY/nugKp0jhkO/LmLfRUHx3p4m20e
         QGTw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783958430; x=1784563230; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkXBQYRv7i51NXfDWlJdipJ5BugurpQ0CDpQ6naHWV4=;
        b=sNGgfccNoZA3JJi90XMeFHn2FUvce46+nXAj9bU6N4vQ2ywI8MOLktiK2W+wJ1h2pG
         DbuZuzsMVUrpJBVdR6sJBGNeS9nb21djLFlkvyDQRTsDUOfTWOQliTlIQd4LOAReoB6g
         TFu1YqhXY6arV0EBkysalGz3HWTC+oqrj6l5iMqovO7lvn1MLMBY+VeRsI5g/reqQyJi
         QC7fMsNvDfUbmr5OMYKGU/Tx0/MLKgSrb9EehUQIwsBjlZyBIvRpa7qSpGaBbX/MSLCQ
         9igZglVZBQ7b7vLIamVnIYOkV4FjlBDfXdAjMeiLWqD7eC6LLGx20lXYgvT3xwbFmoxE
         8P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958430; x=1784563230;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zkXBQYRv7i51NXfDWlJdipJ5BugurpQ0CDpQ6naHWV4=;
        b=sHUA2nyOwrlqAgCkWtSHaesyW9VDoD0Z0DQCbzfLkzAi33BEvbgfdPGKgzg2LIIpl0
         aDq7Uxd99NqiII1rm6rVwnA40Bf9eiIpnUasqhlwvVMVUA4OWdVwV2PV/Dy7MD9do2MV
         B2qzCZ7rVIaQ+a3KSBBH+UurYqlxnN+uB0hsEzS50N9lnaOur4a+Afnik+Rv68GLoKbM
         SDyk5Z/KQCunHg00ozsVoFv4xPSbonhb8KBaNnkFwITTE54HGBQn5TkG4ZMah5i/hp8f
         19xGsbFaT4KO2myXNLOur18hhK+hvOCOWDni0NE6sG3nqhwer1lk7f3nkNFst4h+HMnn
         2XBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqze8YL/OrM2em1wkAuaAHoRa+cRvMNX4wZp3FdUaDlf6k1fpFm2/7XtXgGCNu59/8D/vtSj0yjnlrVG5J0f6o4ZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz77UJK+uIQP8ld8Nhi1SQ40n0TRcUAcCUygv156CsZIJetTHL+
	VYoL/zrx15MH1ac9jfESjb/VSbLE+QorKN/mEqBdjTlXdqZeNKOQooC204THFFnMp0DZm9yqBK4
	/LVqMeP8LWFwMLy0C1swI1hAaGLfu2Ek=
X-Gm-Gg: AfdE7cmufoHI2kauyxm/9vIClRyGePm2yFmchzwp4SQU5T0KP3tU8pSPPulGHkeSN8c
	5l8Dh+CaMMkGUVQ02r5M8MAETUyQ6fBSQqoNLsNBI0yGbjNsVSM420ea1lUNQBteT5+H+qdd5vC
	4HjPXMKTwVIG0q5W5GVDBYqRbHjS/BwVhv0REmGoaijycaMdGJkaTN9mQbV2nhTYfJWTD0nUl72
	DWqLFRQ4URkw3YJiV+8yqdx5jY81vpTobbpiKdt89egkafoq1D0rXcsaFocm22jFLnVJIM=
X-Received: by 2002:a05:6214:1253:b0:8fd:6e32:2bfe with SMTP id
 6a1803df08f44-904036542bemr114342356d6.63.1783958429722; Mon, 13 Jul 2026
 09:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
 <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
 <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
 <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
 <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr> <3a7e0892-9656-48f0-ae64-ee9ee047b6e1@windriver.com>
In-Reply-To: <3a7e0892-9656-48f0-ae64-ee9ee047b6e1@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jul 2026 18:00:18 +0200
X-Gm-Features: AUfX_myviqvHgS_sNwtH_acfZrl7kftzZyjUE7gK_J0YvP5237p-U7HFzW18rCI
Message-ID: <CANNYZj-UN-4ZR=X4KQLMawCSYoe8zpWqWmPN0xwLkVGNCDNcYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to
 support Ubuntu 26.04 on Scarthgap
To: SunilKumar.Dora@windriver.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	ccasciato@21sw.us, paul@pbarker.dev, randy.macleod@windriver.com, 
	ross.burton@arm.com, sundeep.kokkonda@windriver.com, 
	Alexander Kanavin <alex@linutronix.de>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 16:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240844

On Sat, 11 Jul 2026 at 19:57, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=windriver.com@lists.openembedded.org> wrote:
> Would it be feasible to update the workers to use a newer buildtools
> tarball, and to ensure
> that workers linking with their host ld also use a linker containing the
> PR32991 fix?

We're trying to keep the threshold for introducing buildtools high
(I'm aware I'm not always arguing for that, but in principle I agree
with RP :).

The bugzilla ticket mentions that the needed linker fix has been
backported to a lot of older binutils releases, so I'd rather ask them
to update their respective binutils packages. It would perhaps be good
to start a clear list of which distros at which versions need the fix,
which ones already have it, and which ones are covered by buildtools.
Can you look into that? Then we can consider further steps.

Alternatively, perhaps you Sunil could help Yoann to disable static
linking on older rust release which is in scarthgap, e.g. backport the
master fix to the scarthgap. I believe that might be the easiest
option. Yoann tried, but couldn't quite get it to work.

Alex

