Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F37EC636CD
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 20:23:28 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.5492.1675110198806592710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 12:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+WcFg2J;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id y19so13801158ljq.7
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B881M3e5F0LsptPfNMyZXHdyircy4zVkVYvQUdNQFoU=;
        b=O+WcFg2JwQ4PRC/j29GguY2Wg3qaVzit8eusrN7uldWBCja0SOGK+BdWE4Kcm4q3vA
         dqRSgvtqqG1RkZ/hQ58AFKNb637MBMN3M+4hKGpkXPv3WN0zLVRLqaG77rYvSbmSmEmc
         8Y8uzCwepVGqd+QvnkDl2waDQp/Wk2e+qjBrLIS58dInTJdrHcOYmZhacv43ySJzNkJI
         K7mk6UW+7bu0oX6+zua3Z5/Ts7ZaH3OfHZ6DDhc8+PeR5IPfLHWwETHZEewWpv38e2k+
         eY27D3st6N5HwgOVE8zzdT49zwvo0HjBOowuGPvH8unHXuoBhNDf5k843LJKBBVd7ZEX
         BQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B881M3e5F0LsptPfNMyZXHdyircy4zVkVYvQUdNQFoU=;
        b=5pvNtGKNnLpwGzMkHHH6QO4nMlsvmUh7qxSAu9gso1X+3iusk9QUwmfarl08k8dc8q
         7M4VZK8RfVKRMee3TitPrFAFv4vJT+e9z7esvj9gNxGn8TOOrJOxV7aMggIborWdVT8K
         2ZzHXK6Snco+0p1LhIskuQ+8PDDqTzpTOf2l6eqpLxxV+7xW5clTUakCPeJS+Slec0In
         8ODcaaHw3Ehu8wAeuv+Yy9kwFSJf/mAugyMwPYtSmnJYlti2blzQX3++7Y0p9Dzc1c6Z
         kJFctfNSCG8fmyrRvnQuOHfNQnT5yqN6bS9RNnTI0bl9UNf1JrMIffGuDzVpPb4wPlAG
         69qQ==
X-Gm-Message-State: AO0yUKVX5qaw18KWC8/yGw0rq5N+uBmu6ojQ0/n55Ty7ROTbwZdg6t7F
	vuT7Xv8nYiOzY2kJoPYhUF6sPK6tDOZlBUjYuXQ=
X-Google-Smtp-Source: AK7set8MDXakHACi8rKs210sv2DXJjyimouMBWWoFElH+WFwcjNjycx5503EOWJaRe6dflpBSKVQc2qh6U9upfByPwo=
X-Received: by 2002:a2e:9d92:0:b0:290:56f9:3338 with SMTP id
 c18-20020a2e9d92000000b0029056f93338mr1104436ljj.55.1675110196888; Mon, 30
 Jan 2023 12:23:16 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
In-Reply-To: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jan 2023 21:23:05 +0100
Message-ID: <CANNYZj9EQ_CEgxYtE7jpzwpnPwtp6mLNryN6KtCYXZz4kwgtPw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 20:23:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176499

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
(which uses waitpid() .

Runqemu needs to do significant processing in SIGTERM handler
(bringing down the nfs server cleanly), so it takes a few seconds. On
the other hand, poll() returns -15 earlier than SIGTERM hander
completes (!) and SIGTERM handler itself seems
to be interrupted in the middle of it, leaving dangling nfsd processes behind.

The 'slightly mad' part is that Popen.poll() is implemented using waitpid()

[1] https://docs.python.org/3/library/subprocess.html#subprocess.Popen.poll

