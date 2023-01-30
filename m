Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC1CC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 20:30:47 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.5699.1675110640530678330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 12:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AxWVFg4d;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id h24so20906133lfv.6
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TBB0i4MUx0osS5XGQE3qdIh+AUxPAkjbbQuco+jw/nI=;
        b=AxWVFg4dPikOTLOMVLtBoKIuO0V2b0aln53wl246umeub9Vvy7d++6F9rCIGfFlnhy
         IgzPGAQNiYB77w0UX/c7TD05v5FnDh1a819lMo18lOJcPOt7AM+ZTi1KNCWa7YlHLxE1
         CQgsevESv2iIRTrplVgYAvHbX/9aAq9KT2VTWV/uvXD9P1nfsh2fxCWEEVY7LDX65kEJ
         X+864dCRn8wEJxR4Y2tvaXLcJliaJ1v3F7cvEpPgnSozL3NX+ymgCV/pulGTZc4A46Rb
         ZBHSNqTfmSDiXr0/H861n8ozeEb1XQ8Ln7i0TurhCd9PH2oV4hhjQ+NA4V+L3G4WMbQf
         F5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBB0i4MUx0osS5XGQE3qdIh+AUxPAkjbbQuco+jw/nI=;
        b=O8fQJ0VmuiSasY3YSsWumMJ4Xpa+5qY7bL4eb1RA8UFpj1DAhTxJVvMfrUY5Rbp4be
         MY3MZOz6HivzCxyPO+FBedJ4+5AHb2/KcaSh3wkReM35gxuOdlV/VDefETsoOlVo3I+J
         gqFtvHDe4WdEdLlBp1HR76WJy5lLLTIXmrMH3+n0TXKlCiLhH5oUBqOx8yEeZYLNrlOI
         PVaXnLVhCAhN2V4gR06f2EO+nPUVvHfB4tieQsxiX0GpqS40pEbebY8RWJoUop27o6A/
         9dn6oJrhoGCMjPWEUzrM+f2dhjXvKqYTzKJKKt6LgDot7yIhlKOpI8VSWuSbgGEnN8wr
         I7UA==
X-Gm-Message-State: AFqh2kpeJAisWWBSXflRJVri8z5Q2IwcJAd3WGTZYAEFPz0Ch81+ZTs9
	5yz4v59ghCKEPwchiyGOuLUww0ui5Gc1vSbwI9U=
X-Google-Smtp-Source: AMrXdXvIwMXcuR6WuBWZXeRdQfZIAYJffDNm/kxJaFpzA68wrrBiys435kDUZ4tXMv6jmzrVESLFYVICQDRiHI0OA94=
X-Received: by 2002:a05:6512:1322:b0:4b6:f2a8:884e with SMTP id
 x34-20020a056512132200b004b6f2a8884emr6207660lfu.191.1675110638782; Mon, 30
 Jan 2023 12:30:38 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
In-Reply-To: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jan 2023 21:30:27 +0100
Message-ID: <CANNYZj9KK3UX9+HPCafp1QEYFDekBkcqEe+Ht8bUhPm3v=3RfA@mail.gmail.com>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 20:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176501

On Sun, 29 Jan 2023 at 16:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> unfs tests leave nfs server running
> ===================================
>
> After the unfs NFS test runs, we seem to leave an unfs server hanging
> around after the builds are long gone. These build up on the
> autobuilder workers.

I'm going slightly mad. The trouble occurs in stop() method in
meta/lib/oeqa/utils/qemurunner.py. The method sends SIGTERM to runqemu
proces, then runs Popen.poll() in a loop until it is not None [1]
(internally this poll() thing seems to be using waitpid()).

Runqemu needs to do significant processing in SIGTERM handler
(bringing down the nfs server cleanly), so it takes a few seconds. On
the other hand, poll() returns -15 earlier than SIGTERM hander
completes (!) and then SIGTERM handler itself seems
to be interrupted in the middle of it, leaving dangling nfsd processes behind.

The 'slightly mad' part is that assuming Popen.poll()/waitpid() do not
wait for the signal handler to complete, how to ensure that the child
process had truly exited before proceeding in the parent? Am I
completely wrong about what's happening and how to use these things
correctly, and sending me to a beginner's Unix class is in order? I'd
like to write a simple replicator showing incorrect behavior, but not
today.

[1] https://docs.python.org/3/library/subprocess.html#subprocess.Popen.poll

Alex

