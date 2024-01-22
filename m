Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FC5C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:47:39 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.70797.1705920458329293766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJPaR8qy;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50ed808db11so2943885e87.2;
        Mon, 22 Jan 2024 02:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705920456; x=1706525256; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m1kckaK6ImWqtYmgVRQvpyRvs2pKp2Qdsd/7/HL0uAE=;
        b=ZJPaR8qyieNWv0bTPrk7819IU6fF3KADULBEWyxub9R70kjiyzD1yCxbLTxvRKljqH
         +2CFqhgDOCg2PowOE1cxqeUCXPzyjBCeuFRyRw2fuPW4cUxijpqw8ty8KU0uOzL/Nbnm
         ktaiVa9tJ6SRn4aIATjOylg6T1UGnTZUH5Tb+nISR2AHRCQ+ArMcoEfsQ1EzX3ZFEY9G
         QRY/Pi+05YYGf/XrI5rVdIL9xwiND3vgMUmwVAcCw/o55Vkw2dUc+LUnAHhP00zXqaZm
         iMtzmzo/eg1ylrQAFf/Kd3NOT0glOQFfO2hN+bDqZr+z3y4D2AEsk9Gk1qcKi8eE5IL0
         sy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920456; x=1706525256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1kckaK6ImWqtYmgVRQvpyRvs2pKp2Qdsd/7/HL0uAE=;
        b=fi6L31Bnmx0cBZTvpnMatfXi8GKB8zOj+M9edXrAQr23f8JhPKbMUFokOAQKtqKW/n
         BKpZpwIFZN0IpRV033LF0zjBy/ZLFBeC2+08FLDsqD2dBoFF7QZwAllgCK/G3TR87Ebz
         UJ3N1ER2DzLn5E8zo9rM0wBd/wE1HlFfvNeQS+8uSzCtt/nZCIWUnwOaD+j8BI14VDRW
         YK/Lxkw6/undIaoLqeKftNH4l6oCABb8zHnEsesDamHMYg1wkqukoDRtL6lD3GdhProf
         AohVQ6tmiIghtenUqkFF9zrjeyIFNuVWhbP47xJ7qmyX6EI4LHuubTVH0JY9OURKU70/
         3Rbw==
X-Gm-Message-State: AOJu0YyHBupVRiaQ01y8TtBgsSVKI2v+qQqL2AUjbacvAMrC2Oh8nXwS
	LgHYGExhrs12H0TnTusyD+0yvm3gyguQhsBjX3kkotdKr9zfYrV/pYqLiIVHtcQ9xrg4MYBxV9o
	iqPOxyXclsPgaVfRynsnEBA8dGUQdsfHNcnw=
X-Google-Smtp-Source: AGHT+IFg+41oGWWslCwc+oGgOEfXIvoBoEdTgZ4WsTM6573lx2Ngv/NTCpmsxarwTshCk3MZvRsJnHrurJMVa3kVZzA=
X-Received: by 2002:ac2:46e7:0:b0:50e:885d:4d1d with SMTP id
 q7-20020ac246e7000000b0050e885d4d1dmr1279325lfo.37.1705920456235; Mon, 22 Jan
 2024 02:47:36 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
In-Reply-To: <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 11:47:24 +0100
Message-ID: <CANNYZj9S76Q+qJ=cVsdv9HAS+qUx4D-hk0eheQQbXyHfZH3UKg@mail.gmail.com>
Subject: Re: Core workflow: sstate for all, bblock/bbunlock, tools for why is
 sstate not being reused?
To: openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194140

On Thu, 14 Sept 2023 at 13:52, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 12 Sept 2023 at 16:44, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote:
> > Alexander Kanavin will be working on the core workflow topic

I thought I'd write a summary of where we are with these subjects, and
make a plan for what needs to be done still:

1. Tools for figuring out what needs to be rebuilt and tests for them.

There was a large amount of corner cases to chase here, and fixing all
of that took a bit of time. I'm glad to report that all known issues
have been addressed, all patches have landed in master, and hopefully
this topic doesn't need further attention for now.

2. CDN sstate cache mirror and tests for it.

The tests for the mirror have landed as well, and there is an ongoing
issue that they expose: the CDN server isn't 100% robust. Sometimes it
returns a 5xx error, sometimes simply times out without responding.
This happens particularly with large objects, e.g. 50-60 Mb in size.
The problems are tracked in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15335 - hopefully
Michael Halstead can take a look soon-ish.

3. Build replicator tool.

I've written a proof of concept:
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/sstate-for-all

There was positive feedback for the idea, so next I'll add tests and
submit it as a proper patch aiming for inclusion.

4. Any other business.

At this point I don't have any other subjects in mind, but if you do,
please write them here. Ideas, or maybe I missed something super
important.

Appendix.

There's also the oe-setup-build tool in development, which isn't
strictly a part of the core workflow topic, but is related, and I'd
like to get it to completion as well:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/setup-layers-tweaks
I'll check if I had missed any feedback, and re-submit.

Alex


Alex

