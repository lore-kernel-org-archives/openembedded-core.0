Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267B0C27C76
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 21:02:39 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.58031.1674680555405297923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 13:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DCC1xYSf;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id bp15so30985497lfb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WDMgpT0vCZsJw4zKWymKTRkINpdIoI5jj6z+n6IexZk=;
        b=DCC1xYSfkp5gy0poYht4n7fOeFQMbGyx//kXMJ+wqgcB94zakbOCRczfyFy5MA6aZ2
         KY+wJdKlM6F55t7XV7y2Pa2QE8EZZiXTdLNjSqI9pIorAyvi1w52TUxKbor3fJJ6FRqB
         x9U/H+qZdwCDxHtcWcn34eONm02cIcBkl0Et8YljqkDQ4g7Yscmn+sCj57OqojQU1NgW
         Mrlmopd94GBVT64Z/ZgIfD8VONLjV5q1nQMoNnfQh/hC8vXwgjTIuc84JD5a+jd8ftKH
         PNnOve4ZniFpqF2dAq6WBrcOFFjkkM4nkCJrqTOvarGNwgRCkbTX3F3Hhc+rJiS0rwMe
         FKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDMgpT0vCZsJw4zKWymKTRkINpdIoI5jj6z+n6IexZk=;
        b=cisiu3sQFTBcNHZjzF0AXner+puFSBnR6npfXYhCY+eB0h6yrB1yn5k+0HNPWJ85EF
         +l8JUBZJb10jEGweZNcV63xq9l2a4TEEDWjGk2BjaEA3v4I0o6GfSEmgN2Dj4T0uRpoc
         SZUol1EX9uzZBxnw7fewWRMw6cC9h3pOa8RkO6cdPIxw1+AHn8pIx4Dkrf0fuDJX+28f
         yASII2A4SJSsRuCx20tuEa+qlcAgzyrtr3bhxlonxXDuYsjAwvRVaQaq4nSSrIVURVS4
         qQiHRsjnbTuYqhHPVxbAMW0H6Xiu5zzGWgxf2SSZBitA0tPjmfTWjiRnxMlApOorX1xk
         GI6A==
X-Gm-Message-State: AFqh2krkE9f3XT0wfMLQ2p60O1pCCkFk3z9+h30KvOziEiZQ7fSwpmiq
	WDNcv7o+1UXQlQcVEQwnQyyKNpt4MiPzUD8ieow=
X-Google-Smtp-Source: AMrXdXubxW94Q1KPE97DyL3hpSzh4H8eAZz66UO210lgGluYXgVaEIbX4tZ5leePP78HmmNr7/i2hnZ0GiOeWMqwiYs=
X-Received: by 2002:ac2:548a:0:b0:4cb:6bcb:de45 with SMTP id
 t10-20020ac2548a000000b004cb6bcbde45mr3798006lfk.272.1674680553424; Wed, 25
 Jan 2023 13:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com> <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
In-Reply-To: <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Jan 2023 22:02:22 +0100
Message-ID: <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 21:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176376

On Wed, 25 Jan 2023 at 15:20, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
>
> On Wed, Jan 25, 2023 at 03:02:27PM +0100, Alexander Kanavin wrote:
> > Thanks! Before this can be added I'd like to clarify two things:
> > - is execution time of 184 with or without kvm?
> It is with kvm.
> > - depending on that, you need to add the test to fast or slow list in
> > ptest-packagelists.inc, so it's actually executed in yocto CI.
> I'll add it in the slow list in ptest-packagelists.inc, I assume that is OK.

Also the newly added patch is missing Upstream-Status. Aren't you
getting a build failure with that?

Alex

