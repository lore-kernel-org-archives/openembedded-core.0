Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35775C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:24:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.17418.1676910263939187840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kHJZ5Y8h;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id g23so2136103lfv.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LIVwSf8G70mu6rOFNpdiVRUWNgw3uyFlAKAH0MTckiM=;
        b=kHJZ5Y8h4LOUVKJT+t53ErC7GZRvOPEx4ezXyQDBRKEocnIGSKWpd7g1i5fE8sF5+9
         8oTRcF3nv9TIgYGVeGI8bC5KZfY2g+1uAmRNmFBm/I3Ovcce011Ao7EDf9ZIa59obB1f
         7lw7IVoLzsFOglQ/GnYswp1SOhO/GFovI1Ztnb1Mohsxgk9OqJYY1VSEYOQVMWuvQana
         EUpuKbLImYw7CuXR2FZZCIxl8dGpLyK64lc+O+G62wAzpSNeQU4lzyBTzxYwIpnoLnqY
         UiKP3hYhQThzxPGhpJJ/08axBgmym1ucahWjKZtTsQ0f6WSs4pjadkX1iOzOZfRrklhZ
         6+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIVwSf8G70mu6rOFNpdiVRUWNgw3uyFlAKAH0MTckiM=;
        b=wnQFyXz0/M2ZYehofILiVjENoVECZcbIathpfC6nPIj4tBlDBGJBpyv+hVog2+qVgj
         Km9igR6tSOSWUfV2WpuPBRzDJ2YfsgD3gvk+97RnN0aUgNEvumYVDUlmXvaPVfPteZ11
         FcnoiTKeNYvaW8OokxjLa9jVoX5Pyutk90rzBkknY+2AtKskJc4T/pkGVKPEt/55NYKJ
         cNfQhvbhyOJdQLPjftPLgX7/PYYiHvEZnNr/mLTIbue1HZcjUgEFWS2pPRzXbAGCM4FU
         qsxUzw2TvVUbPAenIPatBOsjjTRfiGtGQfwu7EGF4vaZ7blLpmZXtqeODntwgSYzXKTJ
         RrEA==
X-Gm-Message-State: AO0yUKV83gn/tNjIYLvq11nZHZbNx4qR9Vw5XfvolpbYDr8qZDp2DoOK
	SX6UGbU7lMEWQGV5amaPWzCi6i2N5C6P0YwdV3I=
X-Google-Smtp-Source: AK7set/Srm7R4uPZgrfmE3c0EPs3kqPSGkS39qaN9w9sezCgfzZcsGHjI0Wr76kMM/AgzAi4dubJW7Ah5akQjL2Nn74=
X-Received: by 2002:ac2:485a:0:b0:4dc:4af9:8a7 with SMTP id
 26-20020ac2485a000000b004dc4af908a7mr870295lfy.11.1676910262088; Mon, 20 Feb
 2023 08:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20230219193101.338397-1-alex@linutronix.de> <20230219193101.338397-5-alex@linutronix.de>
 <dbc204e0b3570c78e6618cdb5c4bdfbace18e45a.camel@linuxfoundation.org>
In-Reply-To: <dbc204e0b3570c78e6618cdb5c4bdfbace18e45a.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Feb 2023 17:24:10 +0100
Message-ID: <CANNYZj8jhWrridJ1g3bYHQEU5RjT4Y6B6STfTdnEEgMG2Gi5Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/39] insane.bbclass: make patch-fuzz a warning again
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177436

On Mon, 20 Feb 2023 at 16:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Should we tweak devtool to disable this check rather than disabling
> globally? I'd really prefer we stopped the fuzz issues...

I agree, I'll see if it can be tweaked via .bbappend that devtool
writes into the workspace layer.

Alex

