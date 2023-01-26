Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81CEC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 20:03:05 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.84653.1674763378227004424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 12:02:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8c5Zcdw;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id b3so4782393lfv.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 12:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lEGNt4+j+7Oq1tZZGz6aL0h4DnpFY8p245QCcAwSL7g=;
        b=k8c5ZcdwbG59xMKUm9RA21xxzqOOj9NkCn/6XM+yD5GhQUPft7uobYNsd3b69v0qGK
         Pgt/rSgubNo3MbOK9JmQwDgkzT/ayDpz02m1hbSvJHqoPFtB49S6fc6C9RSMrgseL1f3
         F1xE4GCdIxxn6EsDQsGHoAvWXnhjY9Y56L37pYu4UY5wO1wZ7tdDRrByYpE64TZDo5j0
         vnbFy9Ty+fMRNLmwFfGOipnMXbkTBb4HcpJIeekEGK4CdBthP6Ujt84NmR942AcW/11f
         +r5xEl12mf0PQZyFa+tJPAOVUQ5qi/T2Sd1WapNBkHQvoEP+E1i+Hjx1wIe7N4AV0WGq
         zy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEGNt4+j+7Oq1tZZGz6aL0h4DnpFY8p245QCcAwSL7g=;
        b=GiM/X3F8GbeC5JQ0lHPvJZPg4iMZ3RcTCDkqGTY+70iUiovy/GRfdST0Z2SooO8vDJ
         85SN/Nv6OpyvACvXIE6iWDejpwBDy+cAwWEv5IySAbke9quOk4rCsZgLFzcJfdSA0UeS
         pD6JwMQl0gkQdpVECZqaR9NyXqdYRLo/QDXgUbN0zxcWW/k2Lzk5LkMqe6QgQTZl/A1r
         pnl06IgPoDbdrllcRxg0xguzoRZHTJy02r8l/OUR5qBHajjGwYWjIvzZZtxdw0Bk5qCP
         ItR9C1kczWDnpc14pNONRRWV/qUuk+mapBj4tJtvbbZ+ZPiZqlpJcD9uQVQP00ISjJO8
         uxXQ==
X-Gm-Message-State: AFqh2koUSiISRHQN3lgSsxAfJ3bzHCx131TkAfYQy5NBRuV+N/+M61p0
	1oqPnC9xUSSBTIfuwlhmPV6qPPpnDnklamMV0So=
X-Google-Smtp-Source: AMrXdXtd9rJEDEX8c4qbB5Dcwtcw7WCiF7VZqMjjYwO97O73E90yv6IEbuIz2FPOuqC3YUKVzz0mGcUX/DyleCHQMKc=
X-Received: by 2002:ac2:548a:0:b0:4cb:6bcb:de45 with SMTP id
 t10-20020ac2548a000000b004cb6bcbde45mr4397998lfk.272.1674763375938; Thu, 26
 Jan 2023 12:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20230126083752.151940-1-alex@linutronix.de> <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
 <CANNYZj-cnpyE7cbGuX+Ou465BikgwNinjAgHtOzqy-854kZ5kA@mail.gmail.com>
 <0bbeba753327c9348177349032e03f366c38d5dd.camel@linuxfoundation.org>
 <CANNYZj8FVr7_ASbMswYxWthAM_a7sS_9iF1uyP8hb-QwsU2N4g@mail.gmail.com> <fc0315e12584aabee597f70a223c67a01de5fd91.camel@linuxfoundation.org>
In-Reply-To: <fc0315e12584aabee597f70a223c67a01de5fd91.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jan 2023 21:02:44 +0100
Message-ID: <CANNYZj_bcuLsy39M5M9Z4Ju4s0A9w_-k1ZpDojUxUT_HDVB+rw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gdk-pixbuf: remove ptest support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 20:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176421

On Thu, 26 Jan 2023 at 15:54, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Lets just patch it. I'd rather keep tests, the patch isn't going to be
> complicated or that difficult to maintain.
>
> We might even just be able to force a file into the right place at the
> end of do_install?

I checked. Out of 23 tests only three require data generated at build
time by running target executables - I wrote a patch instead that
omits those three tests in cross builds, which should be acceptable
upstream.

Generating those data files in a native build and injecting them into
the target build tree can be done, but runs a risk of native vs.
target mismatch in the content, and most likely won't be liked by
upstream.

Alex

