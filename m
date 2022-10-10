Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFD7C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:21:13 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web12.4239.1665393664178635441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 02:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0a2Lojj;
 spf=pass (domain: gmail.com, ip: 209.85.166.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id r20so5377476ilt.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+0DhlMcXhgXgM/9BR1KaaoifL/aYFifir2koBcAD/h8=;
        b=W0a2Lojj2X0dh6Q9Usee810mFORNjD9esyHvLQV3sN6Hs0IG2N+UbUojAbEORMPfxH
         DBdu6Q7jaYUyWJv3FuFsd4f+5XnM5lAg4teHsIV6kixzBK0rjoqjrz1fj7zezGQ/wl0n
         plEik7TCUH8r620hb8nOQVAYqf0/z4NcuUOuDdDME7bWd6jbIvV3e3NniSvmdPddBZZY
         XtiQt2bjGaPzLIwsg1yWb9TU5cG5ZwgXUr+glXJzmToUXqWldusLID0XAMJ8a42Owa73
         L9wAo4dOAo3kKWlt+s4wrixlg5Xgcnu5wb942HRPRq5hamKdHNgojE4QnCafAu1QNNhQ
         qQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0DhlMcXhgXgM/9BR1KaaoifL/aYFifir2koBcAD/h8=;
        b=hYOmD+kRv93B6n8JgLIRy1zDraEnAjcsaNOzEDKJfbTTQZzA2PpJXIrbNmTdS1jkbI
         N52g+/6oFmInout2ISvqYJXCmHaylke/uWoS6/i+AkGvMyDF0yhDaTA6dV+pllSf8zce
         xxBhm2iZ6ywc3DrGHhABudXxYTac8hR7km6YQhoVRvNsjG5W06ay7JCReRU15gFCK5LO
         piplaKvu0nQ8W2LNhySU+11mXOJyqXROHsvvxhghMqmpPegQIboqEay9x0x19UMGj6dV
         l0z8qHxyYc0Wp9xHnZTAWlWwBRnjeTqpNCnU6YtEUwh53GUUSfAHSNTI0Ez3aWvOTyy8
         hn6w==
X-Gm-Message-State: ACrzQf23PoZ+YQgP8U7qOaE6fYy+VT0k1kQyTkqEczWbd563naq34d6G
	A4NQZnJYtk6qugnQIzXIB6T435XvYJKY6pYtFI4=
X-Google-Smtp-Source: 
 AMsMyM6JTdMY8OikuAIecBsTGZrIbEajCU8HPmPiXDOPqpUmmDq2MZovydn8mqxPutcorDXw8jiVAvtvj/dGBRxa4g4=
X-Received: by 2002:a05:6e02:17cb:b0:2f9:1fb4:ba3b with SMTP id
 z11-20020a056e0217cb00b002f91fb4ba3bmr8321764ilu.257.1665393663600; Mon, 10
 Oct 2022 02:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220622103312.1098389-1-alex@linutronix.de>
 <45013311.fMDQidcC6G@linc>
In-Reply-To: <45013311.fMDQidcC6G@linc>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Oct 2022 11:20:52 +0200
Message-ID: 
 <CANNYZj_1haAJqR0mDVNNhbiEFpUyEH7TDEh_7sGfXA5n3B25ww@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/6] (e)SDK workflow directly in a Yocto
 build
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 09:21:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171571

On Mon, 10 Oct 2022 at 10:23, Paul Eggleton
<bluelightning@bluelightning.org> wrote:
> > 2. Run:
> > $ bitbake meta-ide-support
> > $ bitbake -c populate_sysroot gtk+3
> > (or any other target or native item that the application developer would
> > need)
> > $ bitbake populate-sysroots
>
> Should this have been "build-sysroots"? "populate-sysroots" doesn't seem to be
> a valid target. It looks like this is in the SDK manual as well.

Yes, of course. It's a simple typo, I'll fix the docs.

Alex

