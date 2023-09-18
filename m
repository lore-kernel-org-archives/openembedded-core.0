Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB8DC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 12:44:24 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.50012.1695041054270521070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 05:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ekYCxfyU;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b962c226ceso72786021fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695041052; x=1695645852; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6tNliVYurHNrjMZ/P6hSrsVUHK1rgM40zfk7x0hzL+M=;
        b=ekYCxfyUla+cvJFbaPAPZaz0Q9Qk/e8gEQ38gqiHoFjjP70JiZywI6UiBNrBI42TiN
         A5pddHboDVfshvznRzT/LiRSG/isaRVWS8/QFWnE3WMgfoy7hPVvAL4tpKKEWRBC6yPD
         UAysRvr76K892fC4xeA4HMEpZYBOhT/NmnbMCP4i3QsrvWYtD7P/SfeTaVhJQqPkxSMz
         96C3Q08zEcXGgzXTtw3vabmgJuYnGouzb4ws3z9Wdj3n55IM4C529LEGUzOCeDP2ArzX
         BOcpPOD+/y5bg6mxW0s+1g0F/9QjaNhizF2+FMf+PmBSiWIf+2cXbt8iDYDS/ZOpYn15
         nlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695041052; x=1695645852;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tNliVYurHNrjMZ/P6hSrsVUHK1rgM40zfk7x0hzL+M=;
        b=uvjua/Rxjx4OvTBn9dUX1mZsUq9wnQZrw7XvZ/SQeVKNBHoQ6mKmVY8DuxPxYoaMgr
         JEM29yXpKvNN3JbYQDdrS/RFoTL7QEXghXB8VZ0S0LMdBP2e1fmqTRlLG+P19+EoNmfF
         XgZ7QnIYbMCL3U3DY32dUm/kpC0JHmiFpvV5vktaISh/Coht2WaD4XRhMMu4pRnp+CXK
         PXD6Btsbrew/fYdbBfNp/sRwNeN0EZJu0+ksmLLLjpGOXjt0BtpDb6QhigQ2XO7pac37
         8JAu6pycQJf5OF5YRhEz6uczRZS2Vx/w/gd1ud0N/xZpKz7k1blH0wCO41SbXeuO/ooj
         306Q==
X-Gm-Message-State: AOJu0YwGQ6ShCYfOew3SgMD4O9BuIhVcDk67k8urbna6xzxvlSuHVj1n
	yVlsXAkkmjSJOgyw7ncyhLIKKRVAI1j/U508OEs=
X-Google-Smtp-Source: AGHT+IGxNWIDdjdW6frHkZK0ggNr9y550Qsz//+Tv2qqM89vkGe2g3uCwfsJGDmTY33YY+UnfuHKSV9sPs80O/9JZSU=
X-Received: by 2002:a2e:2a81:0:b0:2c0:ff6:984f with SMTP id
 q123-20020a2e2a81000000b002c00ff6984fmr1527967ljq.49.1695041052094; Mon, 18
 Sep 2023 05:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230917182829.2153680-1-f_l_k@t-online.de> <64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
 <DKI61S.U4D11V8BDTPG3@t-online.de> <CANNYZj-73pCe_yRamvNM=9U2sGdv+ty9-QO8g=5QVkPD9crmdQ@mail.gmail.com>
 <1785FB5FB0D0A413.14604@lists.openembedded.org> <9UL61S.KHBD7IUK1XAU1@t-online.de>
In-Reply-To: <9UL61S.KHBD7IUK1XAU1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Sep 2023 14:44:00 +0200
Message-ID: <CANNYZj-qDMGVJVkGbY8GKbqmcb6TpRenenE75KqyNewpLBe5xg@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187831

The criteria is written in the file where ptests are separated into
fast and slow.

Alex

On Mon, 18 Sept 2023 at 14:39, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Mon, Sep 18 2023 at 01:40:25 PM +02:00:00, Markus Volk <f_l_k@t-online.de> wrote:
>
> I did that already to check if the test is working at all. It took a few minutes. Didn't focus on that but I guess its been about 1-2 Minutes.
> That is a fast one, I guess?
>
>
> Tested this again with core-image-sato and runqemu script
> Without compiling at the same time, it's also much quicker.
> total=1; passed=1; skipped=0; failed=0
> DURATION: 14
>
> But I don't have a clue as to when a ptest is considered slow

