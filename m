Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571FBC4332F
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 14:26:10 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.6068.1668435964725731590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 06:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BMuA2x3a;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x21so13378702ljg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 06:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C+f6tKnuQS8escxgq/JMzBvMVpVYH/ClTgYDJgQcHqc=;
        b=BMuA2x3a125rgFfTwKAe7Bb8Z40+Mj4KBmSQJwrhn2oYRXuZRAbUjV2adKUMFRMwGo
         BifTZDH0SI2Drn96jXMrCU3B422nYDNRDYLDzLIFh6/wVaQckVakR6e4CUCbCHmtmU+n
         Y8arOxoMRTYKFoF5CmTqsrpnq0UDvi4lp6IO+VxxXFmpei69CnXZzqH+ZqFHuzrDpO+0
         BwAIr7qjUwHXM4bTpJgkuryEBRK6aUnDqCIqLAsKUaAlCb271nytmLw4FS25AlCuZRJ5
         evJQGYQdOOJ+yRwKb0LQNtEwkj5eHGbhp5XjZVYm5dntvPzNNrAA6shItf8H0joR8IqV
         R5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+f6tKnuQS8escxgq/JMzBvMVpVYH/ClTgYDJgQcHqc=;
        b=rochXL51ygNZrryYsUr70cX4dnggpXUg7+gtY3VjoDh8xxKZlNSFA8v1pXHRXpOpyi
         kk8Y+qoCK/zbrxliGnByQQvHmmJ9wL3yxbLpt01OFOEzc3J9o6yzT5T+rtEnUykGLYbi
         Jy3R0+/yVdHAKYdopov4SlW44gRZ7aMMO4CMVJJc2whVWEarrqxExx4NVtDx6H+r/NS8
         5gHZzmtdY1J0SaHJEnRFvGzf1nm6K4mdJH7cDw0u6naJc92QkngTQKo6RgNp8DB+AAEQ
         wGMBXQlcWpeNxiobTB1Sj3grg/s9c49Sueto68c/etBm40bB8Lu/9UVXHAlwwHn1rFGs
         66ww==
X-Gm-Message-State: ANoB5pmrk9YpD7Qi5De+o+7dIxW2JyeYUGZpGpIYgf6fsOuUYLg71874
	PBhL9YvP0MsUI7SAMWXJDgS1wG2ZP7nY+dGlOx4=
X-Google-Smtp-Source: AA0mqf5QsdxRDSo2ZiDUVPRd6d9Hpvob2adjD9E2/vXUe5aAZK27aYwOpsPwdZWDGzAvaqXfqCq2VYrgssOQy+eGhCs=
X-Received: by 2002:a05:651c:b14:b0:277:e01:6119 with SMTP id
 b20-20020a05651c0b1400b002770e016119mr4775792ljr.33.1668435962888; Mon, 14
 Nov 2022 06:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20221114133504.2392154-1-alex@linutronix.de> <9417858a6829fc4dc81546e94a78542fea51989c.camel@linuxfoundation.org>
 <172777C031C3B2CB.6692@lists.openembedded.org>
In-Reply-To: <172777C031C3B2CB.6692@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Nov 2022 15:25:51 +0100
Message-ID: <CANNYZj-_ZYP6NUBnZu2mOgY2o4x=ZzM4aBnuURVRRehLYiwnjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: do not rely on native llvm-config in
 target sysroot
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 14:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173244

Anyway. I filed an upstream ticket:
https://github.com/llvm/llvm-project/issues/58984

Alex

On Mon, 14 Nov 2022 at 14:50, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 14 Nov 2022 at 14:41, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
> > The trouble is how many people are ever going to check whether the
> > output of llvm-config changes? We really need to work with upstream to
> > make this util cross safe...
>
> Yes, by making it a thin wrapper over pkg-config. I am completely
> baffled why many projects, llvm included, have some kind of lifetime
> allergy to pkg-config.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173243): https://lists.openembedded.org/g/openembedded-core/message/173243
> Mute This Topic: https://lists.openembedded.org/mt/95018621/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

