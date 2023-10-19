Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D95CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:52:10 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.26903.1697719929642172335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSeXpEOv;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so104961651fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697719928; x=1698324728; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WimQrRvJgJoDgpOg4LiPyOu9dE0EijFjM4cXz0/Q0Fc=;
        b=gSeXpEOvd/tkCYJR4ax7GHn7iH/VzuJIYNF0hoNn2ZvqLyU9gcV3KtidndXjOlUtJg
         2eyprM8fDLwyQVQwbPDSwQRkFbIff0RBUhySypqBjTs8xhKZszWZEudD1jLz6sP5m1jv
         LrYRSnVzOYXRVeVhAfdAvgWQSPd0v8WbcilZktgOBC1AmjUhFuJ3iBFYFAp/H3moyNRR
         hE2bq/KvRARmD01JNK5rPcE94vXT2wAo7AoN0359XGmLW7BP71M4fTSh/9VfiJDhC6Ai
         QQnovF2NW4i4wGxJc51f5HoX5asjs5LwRLx4MnrbB6uBYXeCrb3cJzAqpC53FO6ydZK7
         AuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719928; x=1698324728;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WimQrRvJgJoDgpOg4LiPyOu9dE0EijFjM4cXz0/Q0Fc=;
        b=d+NULy7ItAI6WVpPzJr4m61oZ2pmnZ/yDTRiPwaG4u7IBDpjYIe6i6stnfap9wwqZR
         msS488WOq/6bhmIxxYfa0Jhn0yCz5PNdwiZSiIUEevgzpHjO0YirMnHItlq0fslncKB0
         RrDPr3xBW0MIaFTyYfXs1SZLyUaE0j2q+C6qYn7tudJPfZLSQL2LU9zrqjE/vL5CBXQh
         s9sfAbsMc9aUMBq4Y5WyDZKw55kkobjcEO4udX5yI8T4xJ1UKE082HcuXo9hLBi98DJF
         FKbFIMVwQLPRLeSwv3QbUICWGaLUS0Jp5azE8PXllz3ThUyt2BS3d85uFnZgIuI+Vorb
         RRRQ==
X-Gm-Message-State: AOJu0YzSbx35NsKBGHQpqp1YHKQ10/uoMbOQp5EUUdqFIjPZbKJTxYqo
	6TN+bB467Cgf2vbhgtbwI9BD3AEo7vIr84QqN5c=
X-Google-Smtp-Source: AGHT+IFGNUM3TPUGV3NkB8mqDMUztkzbWe0k6x7Yw3bxMJglQRzwsYcGUk0Z3k0Rr8kRclAQGUAEtYhXuubHOAtPPUE=
X-Received: by 2002:a2e:a48a:0:b0:2c5:23f8:1111 with SMTP id
 h10-20020a2ea48a000000b002c523f81111mr1279283lji.41.1697719927520; Thu, 19
 Oct 2023 05:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <ZS_r0pnGHqlEg5Ru@mcrowe.com> <CAEHHSvYNpGQAE_jG2u__z9k3RrRLe2oeqXpb-bhZtrK-hG1srQ@mail.gmail.com>
 <ZTEiL700jPSsMuwA@mcrowe.com>
In-Reply-To: <ZTEiL700jPSsMuwA@mcrowe.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Oct 2023 14:51:56 +0200
Message-ID: <CANNYZj8e6Lqkb+D6RKhEtVidaMhRUgE3YKg=Jqa4kP-ghV6C9w@mail.gmail.com>
Subject: Re: [OE-core] Using devtool without an absolute path to the workspace
 in bblayers.conf
To: mac@mcrowe.com
Cc: Julien Stephan <jstephan@baylibre.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189457

On Thu, 19 Oct 2023 at 14:33, Mike Crowe via lists.openembedded.org
<mac=mcrowe.com@lists.openembedded.org> wrote:
> We do need to modify bblayers.conf from time to time to add and remove
> layers.
>
> Using templates might be possible, but it would appear that this would
> force developers to manually incorporate changes (or just wipe their
> bblayers.conf file) when the template changes. Just keeping bblayers.conf
> under version control doesn't suffer from that problem.

Generally content of build/conf/, or anything else in build/ is not
designed for being under version control. You may be able to get away
with it by coincidence, but it's neither documented nor tested, and so
any issues are your own.

I don't have a quick solution to ensure that templates and
configurations coming from them are strictly in sync, but welcome to
suggestions. People modify local.conf and bblayers.conf all the time
as well for local experiments, you're simply not supposed to lock them
down.

Alex

Alex

