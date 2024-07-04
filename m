Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF2BC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 10:52:25 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.7634.1720090340743595351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 03:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJJc3gaX;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52e9c55febcso639820e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 03:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720090339; x=1720695139; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+QUYR0G7gL0AkxoOewQhUi/fKhY5Pfl79rex7n6jTdA=;
        b=nJJc3gaXQAMBFkSflCds7kWMg/4pEY8xOeZzFOQ7080aNraWvTDvQ+cYeDETZ7MEFl
         AFFWITUA/2fiXhtCuTxfiN5kzZF49UHOHLnX/WPiY2beqbhODT6+KC1d3gZedV0VPybu
         XNBcPp7sMEBObQDAEXnGZG+bu1p0aRuuC4x5oyyjXRyTkkpTlzyzvmHlsL7H/NSOyBzx
         gExsr56i3cLzFxVeqRTIUtAXDrz6hnnpmzkC7rL+Dw6N2Mul57Z5hdqRNMCw5TEdPN2U
         RYfctQwdY8BUlv/hKOLpHfgISQ9pplRSEPrW7XUV1soyVyTpbjYUsqNKfmX/AD96Irek
         rzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090339; x=1720695139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QUYR0G7gL0AkxoOewQhUi/fKhY5Pfl79rex7n6jTdA=;
        b=bGOhCnOi86NKU5pLnAormE6CctVffNcxLX4Stk8KvTHNhslsK9nVzyZKa3ZveagWXn
         hSU3bjnvELaj6VJuvUf68i40Odx498xaWatgsB3NMI6JurTZTb0Jp/hLc/UNm5vzWxdl
         keCirNKZj+HHA5QT/5FWiZ+ppnNoJcM7o2aqqRVqDP2iScR9zDteQfKIaYTUdUiXb2qh
         u2tmGsYWsv8t9k0ByDgoU8IzfyelZoCboxDflAJ2t2Wt/Vpb5wrkg4zjCmKXxRfOeTsj
         sp/VtoUBzaaoAAwJbBrI+PRzeJs93xGH9WYIaDh/tyYaldOJNxk5JWcJfhsS6eYL1rdP
         pTQw==
X-Gm-Message-State: AOJu0YwZ2kR0mguR4xcciv/wX+Desv2dL2DLNL6YdBfVZZrQehrtt9ub
	ILmHSo/1wty5IiozfsWUJwijGwQYr98NNEOcr5+w2qP98LG4+IjAF5xNgJR0xpZYHPUWdJaJI9J
	BWul9e/kZYqMbHp84u6DYf64ndv5y2s7n
X-Google-Smtp-Source: AGHT+IG0Er5WvpT6sayXe5CckYmOIZmqRDrY6UD6JHNYo6mysIoUgIGgfrfzHyLHY25gLbgzDA+bMktvXMpebsp9SOA=
X-Received: by 2002:ac2:4568:0:b0:52b:8ef7:bf1f with SMTP id
 2adb3069b0e04-52ea064c74amr848533e87.17.1720090338743; Thu, 04 Jul 2024
 03:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
 <20240621103414.2842509-2-alex.kanavin@gmail.com> <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com>
 <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
 <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com>
 <3bd89c381318290050137e1ab5f65bd25f94ec83.camel@linuxfoundation.org>
 <CANNYZj_o8bFtNGWj48mhDwbrisjjowV1xR_xOfWWJ-Jx3pRwbg@mail.gmail.com> <d6da4fb9ffe93b23d095b72c8310fd7bfa7ade4f.camel@linuxfoundation.org>
In-Reply-To: <d6da4fb9ffe93b23d095b72c8310fd7bfa7ade4f.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jul 2024 12:52:07 +0200
Message-ID: <CANNYZj_Ng3NZ47mnwX0A5S_BB_eh8==5HpGkLOpKKr_9s7VFMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add RECIPE_UPGRADE_FINISH_EXTRA_TASKS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 10:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201532

On Wed, 3 Jul 2024 at 15:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Sorry, I've got confused. Look at tinfoil.cooker_data.file_depends

AttributeError: TinfoilRecipeCacheAdapter instance has no attribute
'file_depends'

I had looked into the code, it seems that data is internal to bitbake,
and isn't exposed to tinfoil.

It's also placed into BBINCLUDED per-recipe, but that would require
iterating over "recipes = tinfoil.all_recipe_files(variants=False)" in
every upgrade operation, which might slow things down a bit too much.
Worth trying though?

Alex

