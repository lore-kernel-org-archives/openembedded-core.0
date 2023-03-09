Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272B6C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 21:29:55 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.3610.1678397390444603603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 13:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F50iG7CN;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id t1so1806646iln.8
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 13:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678397389;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KWGD9iJ0MxO9MLN+SSpPlZb5fxEjk1hXK+qT2sP93cM=;
        b=F50iG7CNLu5EWSyNJhEQvK48Tmh+lP1Nj/Qohrc5ya4/wjeQ29InKRgQvCrSssU9YB
         JUvrKNP/mtE15N30ZKi0xu5roOnJ1vEEEvRjfeBWoCkyJz+jOU8Cf/YUqm5CF3qKkSB6
         TM+owL+STw5VF9Jk7DU4Go1JzbsBGHzpZJrgQF+hH3L8cpwBjQeSdQzGGih4/g/fo8gj
         y7ZVxHDPw/PGypXy01B/8teBpJGPhI4yd8Ph0A9ePoF+b8lcKEiuZYLDhY+kt77q87bz
         kWT+yxJjIZvV9qvkO3sZO5dtzs4XGml5oH6VW+RPYpIlN8cm9g9EVb2V7XHR07kocPnM
         RpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397389;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWGD9iJ0MxO9MLN+SSpPlZb5fxEjk1hXK+qT2sP93cM=;
        b=ON6gd88SVMKM53jVpOUQAoIsJSUTHV1dPr2c9JXO7IipgtsNULJYUFW5DLvWIoL27h
         UHAQ2jtwzaOkZw8p+abvkH9jEVi4BCfG6UqcR/0rHRe2gGRLBK9nzy/KyLM/kYZpuNhX
         90z4lGIciO2WcAP1CZGI6fjBXWTGluatYWyBn8kRVit7Xm1cTAIhMsvUWN+u1JpKeMKk
         9uU5j8gO39GgAH1WDQNTZkQD2DgJ/MVjbbbMLvB0L2Fov7RtfNLr4CoP/ADkO/57FGX8
         uph4DV7A8OFfh0Q4ttN3pXIYaD/xiEuqA2Juv5kAp2+EPzWSsu5vn17N0aowYMZDvREr
         kcAA==
X-Gm-Message-State: AO0yUKVIU859I0VfY/GyVINPd1Acpv6Hbwx7+4tyLQ+7wHrvtet1LQyW
	gtmJ4FxWpUbbz6+0d/vtwCo4OZ0DEnnN9Usd2EJsBM8mnuI=
X-Google-Smtp-Source: AK7set8r7OdBXpBhfFAnkgJFDnZyA4GUS5MXekmBaGnqPkKgTiP76wUDIaOqOfdG61tHN84IMxGsgcelXk6U+Fudr9I=
X-Received: by 2002:a05:6e02:f02:b0:316:fa49:3705 with SMTP id
 x2-20020a056e020f0200b00316fa493705mr11782188ilj.1.1678397389427; Thu, 09 Mar
 2023 13:29:49 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 9 Mar 2023 21:29:38 +0000
Message-ID: <CAO5Uq5So_k+AbgV_goP9yc6FYXQL9Z5DzNg_x-Kg9ps_qhB3gg@mail.gmail.com>
Subject: Rust 1.68
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 21:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178272

Rust 1.68 explodes in all manner of new and interesting ways (can't
find std::, compile time macros fail) when building for target... my
suspicion is its how we build libstd, where the tooling wants to build
it all at once and we separate it out.

As far as I can tell, given rust basically doesn't do shared
libraries, I'm not sure there's really any value in what we do have
with the libstd-rs?

Change is here:

https://github.com/akiernan/openembedded-core/commit/9e098599aa5247086a346bf73a087a2ce4ab640f

if anyone wants to have a poke at it.

-- 
Alex Kiernan

