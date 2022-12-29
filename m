Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E23C3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 20:49:28 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.3852.1672346961241360922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 12:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TYfmEtKV;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id s25so20454013lji.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 12:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHrBE4ee4AAR9WTTPHOF214eYKzcgbZH4+y5Xa3t2+4=;
        b=TYfmEtKVDBhyHKqON+REWISEc8Jbd02akhvm3wLuM/Oc2ByTzW1qkq86CmSIJCZEhp
         +1fp9oGAVhyZP97pRbSb25eG7iDv75MQ4SKMwVkht35x8JtdjpoXtBIt29f4kUaWzq/R
         fP8xJEQDmzckagy2gPUx61YS1csEp9zquRQaUZk5jtwUGmYLO3KD/jLh9L9hHk9uz4tH
         x2wQ5WSfN0NmdJ7ZU6M0VB7p/ax663G8tKC8HAdIz5OJRBHkWGTgoDPYiDRNd+KiXs0C
         wKdNtjJBtDzCaXslShLZzi79C6nLc5TTK1b2tqMAcPFg3Znmwu8e82X5Y+AiIQg6N3vt
         rCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHrBE4ee4AAR9WTTPHOF214eYKzcgbZH4+y5Xa3t2+4=;
        b=UCUjVK6UdxwwtYSyOSffPqBPIpCC4GX5P+cxmZvcmUR3juoBgAedta/Yd5TNHvvV+p
         IcpH6u5e8x1Nf3k/ZKIrR3slaDfRYuDHF9hmzWlP1JW5/P0WAceihzf49sMuSB+Enh/W
         a+wuiQVaf0Cf+PWjkQJ+0OQs+hHvVucJdI6D3jwgre0oTBRiIxE1hy3qfwbzxM0KnJYF
         jTR83EHTWBWnnT33EqKxSu8wExz6ak8hRJ0lqzzv4WBYiOHZvUDbyjIrx0gYLFmCQQ5b
         cafqc1Y5ckH+ySWtKtFKs1NKJ3/xg8fEuTPoe9L9bYv58imQkbtX3i4LqtEbU+6CzRES
         vziw==
X-Gm-Message-State: AFqh2kpj04tKwZHJ+4FOVZ+IxiIrtoHp6R0DRI9kGQ1rhv++n+KuACUs
	sRdkFt15Awv03eQqcykvEcv7HmnZ4i0y9hSmgAE=
X-Google-Smtp-Source: AMrXdXuct7z45ZCKujBFp7ygDBkPT3AkvNF6dIS71hRN26vZ/MtNggHlRymEM0rpKZs3RVJXcXvOmO35LgcNwNw4v8o=
X-Received: by 2002:a05:651c:168a:b0:27a:2285:411b with SMTP id
 bd10-20020a05651c168a00b0027a2285411bmr2380075ljb.33.1672346959210; Thu, 29
 Dec 2022 12:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20221229160110.255775-1-alex@linutronix.de> <8d3ef066511b1bcec928822519aa7986f0bb0184.camel@linuxfoundation.org>
In-Reply-To: <8d3ef066511b1bcec928822519aa7986f0bb0184.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Dec 2022 21:49:07 +0100
Message-ID: <CANNYZj-3r+Rwa_MN9KuhScZcqaWRw275gELeMkgjFxNu6MLwPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] devtool: process local files only for the
 main branch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 20:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175130

On Thu, 29 Dec 2022 at 18:18, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> Is there something we should be adding to the devtool tests to cover
> this issue?

There is, yes. There's a set of tests in
meta/lib/oeqa/selftest/cases/devtool.py which deal specifically with
handling local files:
test_devtool_update_recipe_local_files
test_devtool_update_recipe_local_files_2
test_devtool_update_recipe_local_files_3

I'll modify them so that they fail without the patch and pass with it.

Alex

