Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D8DC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:21:39 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.3010.1742372494629688192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVdXEn69;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd1962a75bso45722196d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372493; x=1742977293; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sU8sPIenjFG3LolLWR1tvsdtThxcm4mQknAKw+MFRf4=;
        b=OVdXEn69mXhT0GXtkBLAPunsUEbXlkzQ8MaH3r4VhtioCyrViIyQ8Q5doJ+j9kOqz1
         oGXJ7UoeI48fGgpRhyMvM23AsIARx498K7Efun4jc9Ih3ByNNTgvZiZgykhLvBH8Bdxe
         oC9RzyvEnxvZkcsZayKvdN0Xxar+BbqB6RpECSifu0rhGsc/ng86BeMTNUvLVIzXEVd9
         FyD3D1wxTzQFNopSXFHElG49yn3YVJjYjQxh0D8NqhI300ZoekQ1u9x5WOPDEGiW1LLG
         E7Ef5TE/zRwbuJS42yj94RnlXDw0ZGfpBC/K7Ppw6Cj0TaZCXVa+WNjNl+bfLz1W31Hl
         HHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372493; x=1742977293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sU8sPIenjFG3LolLWR1tvsdtThxcm4mQknAKw+MFRf4=;
        b=Zyu7i5Sg1AJxlqEzJ90ITNXRwVCbVfNUNqYcxeF3TySoKoduvXsJO8zmXZf1a2PwRo
         E1VUE8eOOV4ClXi/BjfdMSPJmEHN58YRTFcFilHz79QS+xrzSckmg4EAy/4ASggcVQhb
         V9QIMmesdAYnZq5vH2hrXzQkzunk9MweTzgjJwXrIfq2LYQuIt6AzEJ042EHTnlhi8Hs
         P1rgWfsUH8vDll426MLmHkv86xxlT8YjQ8PZxFlCADOGWCdPSNhri7hPTe77f1Q9zYmw
         eTMNsm37KzPefADrdptk/HqV4X2il0eyD0peWhrkc7urWYcZojZqF8DhJhAkD01uFB24
         FjEw==
X-Gm-Message-State: AOJu0YyFWxgnpY9Q7gU1vbFIGQZaRMZZXMjnAxsN3C1XGGWgFqj8zVJY
	PyiWP/OBhBMH4gPfgEkTkpZcxScD99fzhuNadAS+HQ8+ONzKE0V/0jPNl5DEOsU+tnMDZbiWAH1
	/AXgkI050+OnrMZ2zH6CaIF9uZsM=
X-Gm-Gg: ASbGncu/NpcvKR7dBxmXFKjkcgY5NsOkYCO1spAKgfuZyvuApygvUEXdxspMjaSVAl9
	vk3I1WQoTSFMraszRhY/Eb2OtJPmQprq7FOGQqkSuGs/yPPjGrhyG3u40hULQugD+lFniUVejdQ
	dkgZVHa+uFAqNMOYW2sNNSejk6GQnLLMeGRsWdrfaPC5Ijgu/WQ9RYPjcOFnMN
X-Google-Smtp-Source: AGHT+IHvnXAR/cn0/g3LrpXM1G2pt7rZKNpvKWMYE+zuv0hqGQsrZkXxlkcO2JbeYDeqAEIo3Zt302ng2pWTq778Wi8=
X-Received: by 2002:a05:6214:20e6:b0:6e8:97d2:99a2 with SMTP id
 6a1803df08f44-6eb29489207mr19447176d6.39.1742372493593; Wed, 19 Mar 2025
 01:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250319081610.3536475-1-raj.khem@gmail.com> <20250319081610.3536475-36-raj.khem@gmail.com>
In-Reply-To: <20250319081610.3536475-36-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Mar 2025 09:21:22 +0100
X-Gm-Features: AQ5f1JpiSqZDe5ZxeniJRHdj_X0BAQhJcj_XhxyAtzGc1gV-Cy7vknY_qAStK5A
Message-ID: <CANNYZj8weyRsXkR81_SwBDuqFQAsHx0DyRR7RXaFFQtF4V8U7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 24/27] ncurses: Pin to C17 standard
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213310

Thanks, I think this is better than taking a snapshot.

Alex

On Wed, 19 Mar 2025 at 09:17, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> Newer snapshots of ncurses have the fixes but they are many needed to get
> C23 going. Until next release lets stick with C17 even while GCC 15 switches
> to C23 defaults.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 3f93550cf99..1e9ec38ceac 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -28,6 +28,9 @@ ENABLE_WIDEC ?= "true"
>  # _GNU_SOURCE is required for widec stuff and is not detected automatically
>  CPPFLAGS += "-D_GNU_SOURCE"
>
> +# Check if we still need it when next release (6.6) happens
> +CFLAGS += "-std=gnu17"
> +
>  # natives don't generally look in base_libdir
>  base_libdir:class-native = "${libdir}"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213301): https://lists.openembedded.org/g/openembedded-core/message/213301
> Mute This Topic: https://lists.openembedded.org/mt/111785532/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

