Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0782C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:27:59 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.14507.1722335269915559167
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 03:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqDEojyf;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f04150796so7516321e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722335268; x=1722940068; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tbwBbSITtATmJlPyfXX6ARXtsX0JhXzfNFsKfdogEtE=;
        b=cqDEojyfkKQYQYiEQdoxfxarskco1qPCGl+kYl/cnomXJh6nedL/lkg6uk/mxNuaYX
         CS2kaXoSu7gbL0psCyuKVn3832uP8GJxdary6metTfs+Ti2bvDjScU7vehJCdFn7d+A6
         n625qf7w3TtfJ0D2/HGVIswJBXMebb1RmIcyM+lK3gx/z66xtSb8mk/NSh7cqmR7TxnP
         tmC9XBXweP1LqT/chS1drVIa+c0p00gnGTsdSoharg6iAgOKuHefGIwEl+GZZfbX9LSx
         wejvkX/qWSWQCS7HG8Qtr9fbPOzDbV6nEJqaxNxGCiz2aIGaEnVSCkOQhnCaPW5Clq1F
         q1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335268; x=1722940068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbwBbSITtATmJlPyfXX6ARXtsX0JhXzfNFsKfdogEtE=;
        b=NbuW8wLs3zHuwO9ft4L0GR6WV+k7FDALg6iZbbduigf3F4BRvoj+a7v8gGRP25eqSF
         0H8ZLkramBykAXTe5PXfz7Cq1d2aY4nMzWExrpKsyduyfy+EQF5H/qMIiJOhLrRE70CR
         ozSOXb3UvDmJois7Z48n4NwDPHZZmj0p0/HLSCnxPXHWMhRpXizoIaQxVQV0/bZZ2BzO
         hGFBJPsI/GqyRSbQTS5BFZ2xVVdYpB4YVbU/5hIhN5yCrt2HnpS62YuUoSq1kOToTvP4
         yb4GQGN07AYxHBBSOx0Mv/AvSa6u7ukUfWQHGk3Kcd2dj5r/ef3gJ5su5Iz0bO8nWiys
         1G+Q==
X-Gm-Message-State: AOJu0YwD4mDzICfiVGTyRCY2GI9gSL8LRY3z/9QB+AN9Yf4G7XDUgW/M
	k660qi97+IFbbvdSMJfGQUtqnMNOxjxOAY9QEQ4hf9RuCetE/H1EMuz28yHMqF9VKmO5qQaa6Fv
	9mQ72YAvU48n8vvgAatprRsnJcKK1XmxlGmE=
X-Google-Smtp-Source: AGHT+IElzxzXF4XjgWcQRSuofikyIqAHf1cotI0YE4M3l787AibgGVOQvvuqXGfGDY5lwaOy6n3czH3IeJYwPTD/4yA=
X-Received: by 2002:a19:2d5e:0:b0:52c:82fa:ef7b with SMTP id
 2adb3069b0e04-5309b2c2aadmr7033335e87.44.1722335267497; Tue, 30 Jul 2024
 03:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240729144434.153005-1-li.wang@windriver.com>
 <CANNYZj9boK0816ap5hN8LqmpeyThanWjoYjjT=FtfpEjp-9R4w@mail.gmail.com> <cd90e9bc-b6ee-405e-92fe-42507c7adb88@windriver.com>
In-Reply-To: <cd90e9bc-b6ee-405e-92fe-42507c7adb88@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jul 2024 12:27:36 +0200
Message-ID: <CANNYZj9Bf-fv+Yjmuf5M4seq1oAASGZK0rjX2dvVY4bArR2fMQ@mail.gmail.com>
Subject: Re: [OE-core] [openembedded-core V2][master][PATCH]xinetd: use
 monotonic time
To: "Wang, Li" <li.wang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 10:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202670

On Tue, 30 Jul 2024 at 04:06, Wang, Li <li.wang@windriver.com> wrote:

> >> +Upstream-Status: Pending
> > Is this patch taken from here?
> > https://github.com/openSUSE/xinetd/pull/45
> >
> > If so, it has an incorrect upstream-status. Please fix that.
>
> yes, but the upstream does not merge the patch, yet.
>
> in this situation, what should I fill the status?

Submitted [link]

You can check the definitions and expectations for upstream-status here:
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status

Alex

