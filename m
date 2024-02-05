Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D5FC48298
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 20:35:40 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.4886.1707165331313539982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 12:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DwWah5M2;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d09b21a8bbso943121fa.3;
        Mon, 05 Feb 2024 12:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707165329; x=1707770129; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm76o5vthT4ZCVmp/KfOXOmEVDRfwkOOhA3UihTLN9Y=;
        b=DwWah5M2zPNjVOOe/Rf8Yq2VyBk43sjDglUeuPKQFBYDDPiq68BPk/J98aHmCMGX/0
         +Bt6kMuAf8VVMuK6R/xH+iG517wscuVq4KRVTiq0DfLbmbCBEHGuHIjK5Ic7jVyr3Or9
         dHxcPmCldZIJ21tD8emyxwFihhTebtKEG3oW5NaYozJb48LdwTl0aXRxbGW1Dt6CZOTv
         KBSOziEB+qg1gbSpXOci4UkRf/xT7X515b9iY2Za9+0dACUATS5Apkz8Rhfn9M5TO+GX
         KNicjkrZxmc0CvnGiZfQP5rQ/QpdGaqQsgkK3Flvq348tgrYKqHImi0xgYlQxqtds17Q
         JsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707165329; x=1707770129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gm76o5vthT4ZCVmp/KfOXOmEVDRfwkOOhA3UihTLN9Y=;
        b=L8mEus1S5DSkQGYXVM/aNx5/vTaeyf0NaQY2KW6zo6OfLy4MNOjzAH5qY+W79OjKPN
         qkQlSKJMKBgreARSi4BqOvVl6uiOotssHvC4V/bpjT/Y1BQsm+QfcGM5Msj6fnqRVK8E
         mlwknyGWCZho7yvC5Bs5U1lH/8dVAQQKOvITqJyqtnW+Y6OpVAasdU4AmRX+RL3jJvZ+
         n9GC8lIA5yyMs0vTFMtFR4L0Y5mbnA+E086Z/uaav8T88Hxup3HyNbNmgI4YlGoSFxF5
         1o/fFUft0AQmJX2XMNxLbhl53ikU08ivMxuG6/KmnH0ffg+6+1lYVxiy5R1fuiYvL1+i
         Cqfg==
X-Gm-Message-State: AOJu0YzZimwAeFd+mK5Rj616uAtWPySvFAII9Ay9b9yg5WRL0WNX48+5
	pnFFmAlASS2AtaFzXfyTYERJf4vkRx2WuYjGTp3QiSJq72Ki2PHF7LCDBwFmU0gtlzsm4p0Twoj
	BY0uZIjDnvh7j5BPO3aHeRCPnZGsAt+QM
X-Google-Smtp-Source: AGHT+IFgGl+Utbyz9OwZpCfAb2e2IMKtmU4I2+srvDZ1MCW1/BOgP04uFtgT8zB7zMAMPoHmqgxH5UT6R7iQXj6ZoIc=
X-Received: by 2002:a2e:9113:0:b0:2d0:9e95:68e9 with SMTP id
 m19-20020a2e9113000000b002d09e9568e9mr563527ljg.11.1707165329172; Mon, 05 Feb
 2024 12:35:29 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com> <17ACA59E7A7FD97B.16230@lists.openembedded.org>
In-Reply-To: <17ACA59E7A7FD97B.16230@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Feb 2024 21:35:16 +0100
Message-ID: <CANNYZj9X5qRSup7i9S=rtRpwo5nCNHp8VJOZAuvu5JzqhLYD_g@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Joshua Watt <jpewhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 20:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194968

On Mon, 22 Jan 2024 at 11:47, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> 3. Build replicator tool.
>
> I've written a proof of concept:
> https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/sstate-for-all
>
> There was positive feedback for the idea, so next I'll add tests and
> submit it as a proper patch aiming for inclusion.

I started working on bringing this to level suitable for proper
submission, but quickly ran into two issues:

1. The bundle should include a local copy of all the layers so it can
be unpacked and set up entirely offline (and not by re-fetching all
the layers like in the proof of concept). This functionality is
available in the esdk task, but needs to be provided in plain yocto
builds as well. The plan is to add a 'local-copy' plugin to
'bitbake-layers create-layers-setup' that would utilize existing code.

2. Something that didn't occur to me until now: simply copying over
sstate to another location doesn't guarantee that it's going to be
used, if that sstate needs to be discovered via hash equivalency
database. There are two options here:

- lock down sstate signatures to what is available (esdks take this
route, and get away with it because of restricted devtool-only
functionality and hidden layers that never change)

- export the hash equivalency database into something human readable,
and placed into the bundle, and then import it back when the bundle is
unpacked and set up. As far as I understand currently there's no code
for this. I'd find it useful in general, as effects of hash
equivalency can be tricky to grasp, and being able to look at the
database in a human readable format goes a long way towards
understanding how it all fits together. There may be other use cases
where you'd want to move the content of the database between build
machines. I'd like to get Joshua's take on this, did I misunderstand
this completely?

Alex

