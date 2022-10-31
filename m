Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0FDFA3741
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:55:10 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.2001.1667253305754176572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P8Y1grlB;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id j14so18372775ljh.12
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 14:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rqrx7euZ7Qtqz92o3Y9GbIPlm98RAwc4EVFqLy2pizI=;
        b=P8Y1grlBoNSy0tn3m9ilRD9aPkiI3iE0N3JfaeNTxsaUcYBCSbOix5G1RbKl9NYZvZ
         s4p6WgSbaeWLvlleF/3tm7yPov5rttqZX60hjRXOIFR6qrKslGhsN3YQye8lUQwlhBRm
         Jtd6KHJ2+r977ph+fexJHdDC1GmHtlwO9Q/vrknhFhLxuH68a4Nj3dJsqsbog3LewgNZ
         9x84EObofsomIay6zYoFZO+h2pBY8zPLEdS+oDnXgqECEg3WhbwpavA2mZc5gf05OkmH
         XsfEWl6o3zba0kjzlA2gPF/ffm5R50odl4YMRo/9b4IYLo9d2C1ms1Fk/DaqY7xQP7fd
         Fk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqrx7euZ7Qtqz92o3Y9GbIPlm98RAwc4EVFqLy2pizI=;
        b=JlEUGNeFPLi4N5hWLDst0h2izRYpg6L0bpnIZYQ1LItUjIee4K4UBmAPFf5Oe2QZBA
         LcOzlwb5koveWaCNfN4qYt/n409A8jne44Q+bsLjxcxUeRMYXQGgySLttZQ8aFCu9QqY
         Gfzyso/OTgCNH1wZ71CWRiN/RLNb3GqPUgxpol8WvkNY34bkaIR+ovtVyrhGAnncRpcz
         n0IOeaSnRv6fJzLDTCewO5c35L0+MTVP9WDutnj+tzPgCJP7WlQwRdf17QG9X/z6H96b
         OfyaOA9+q47tpwnjELXhmigwZ3luuRWFQyBsM41i4On8219lJVupn+oqf2uQJaFMsA/q
         cmcw==
X-Gm-Message-State: ACrzQf2OaacKPm2hSqUq802OZ8xUt768zuLOq9+79MNZxV9UaHF4CCxO
	AJttyY+hwhR3RWTFiQRnjU9aVJy1ZMLPGwlrDCw=
X-Google-Smtp-Source: AMsMyM6G3bBKnkdzfbD6GoEQ5KBuqYJDfzzF91jq1imxTRVCxEPeSBM7YXQ0tXZkQq5pBEqs0UwB8THBho3cMk7gf0c=
X-Received: by 2002:a05:651c:23a5:b0:26d:d196:d04 with SMTP id
 bk37-20020a05651c23a500b0026dd1960d04mr53330ljb.403.1667253303905; Mon, 31
 Oct 2022 14:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221031210902.169924-1-peter@berginkonsult.se>
 <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com> <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se>
In-Reply-To: <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 22:54:51 +0100
Message-ID: <CANNYZj_A3cUHCjkys1_7DtasJU5sD5z0ruQv=WjSVCkwGKjbbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
To: Peter Bergin <peter@berginkonsult.se>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172342

On Mon, 31 Oct 2022 at 22:32, Peter Bergin <peter@berginkonsult.se> wrote:
> Sure, I can do that. My aim for override those in a bbappend is just for
> development purposes and nothing I plan to use in production or push in
> public. My way of working when I realized this was to build latest
> master of systemd that had a bunch of patches that I would like to test.
> To do that I needed to change git repo to systemd.git. When tested I
> plan to backport relevant patches that I need to add to current systemd
> version in oe-core to my local layer until next systemd release. Then I
> thought this could simplify things for more people. But I'm fine if this
> is not accepted for upstream and I can work around that.

We had a related discussion recently regarding mesa, where there is a
similar desire to 'reuse' the recipe from core as much as possible but
build from a different revision. Typically this would be done by
having some kind of common .inc file (systemd.inc in this case), and
then adding the missing parts in a custom .bb that includes the .inc
across layers (bitbake allows this). No promises about keeping things
in .inc compatible with whatever happens in custom layers though.

Another option is to use the devupstream class, and there are examples
in oe-core for it. Would that work for you?

Alex

