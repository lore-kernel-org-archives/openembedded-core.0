Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE992C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 11:04:38 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.22560.1661425475236539346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G6cvcE7S;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id bx38so19039410ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 04:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=BqCZdqcF1WWde2i5+GHiuFWEef4FeZD+1yna3fzj/HU=;
        b=G6cvcE7SPC+nrxktTXeAzWWgWjtLKsXlaJzajepeQKZDIYggSnC9y7S1PixJHPHhea
         hYE9dYA9cKzP7xgXrwR0OchlhrhgDkRJmvDsBgo0X0qpQifmGL0xR6N6EId2PQySdTHv
         fMiMEro8dyIuC+WDLgO0oz39oc5ZlUyQXmNt75rlVAR2irmTXI4PJHs+hXBOKHFng7X5
         +e7HRI0S2sZznQ0PqblrjHCo9gK/XHT1z7FzVReMeffAfJp4K56U83nJhHDWMM2VzH/h
         3XtVpVRIWoDgDF9BogYW5AC+bBr2nAmilNvlFLYdvuvS+e7c6D35TBbKt2NywnH4p8sP
         mexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=BqCZdqcF1WWde2i5+GHiuFWEef4FeZD+1yna3fzj/HU=;
        b=gnKrzNbgnT1WqryJ4QmXdHx+FtdKGevIPGekAM12/jcXfohHOaeqB3bWnwEcyIDY2A
         P8eewzHmskHgxZejVHJQbGM4sQ75ookQvZMrcdal7i86qCHeVcFw6WfTCtl3Y6zwqhOf
         kJ3kdF1CRnx4hpQbCt8NNGvzWmqSqDKZykcx8SJZWAD6wE9YjKvnlfESctUHl8+PsIX7
         W4ZGwsOJaZdV3LLYEM1Ki1VkpeEU33B2w3iwQKPVODHaH1Be3X6e7esrasrC3ldPQIKW
         0DVfhEzeH4OXN4ffuUsh+7c30SA9nl4p57jkRtmKZQjXpWivqOeqV4COdDsF0kFxpQLM
         PQTQ==
X-Gm-Message-State: ACgBeo221qK75+tYoD4msvBMLKENv7CdJPbBfYps0eMGMgXAKI1XXDqc
	llHYi23O2y75SAKWQbqfYPiC/1SAOvevOYq9gus=
X-Google-Smtp-Source: 
 AA6agR4SGLKVnEsNis7FvM3xAcD+Bw7a9It5a01qV/mBCGkBFJle4OI2Dc9Q50JWlWpN5iFpCY/IQNXidnKs9CkPW4E=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr937616ljb.257.1661425473364; Thu, 25
 Aug 2022 04:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
In-Reply-To: 
 <6eac7847f432cc60d66c9afba010308818bbbb46.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Aug 2022 13:04:22 +0200
Message-ID: 
 <CANNYZj91fDezS+i1tdX7zZ1B6M_roVgn3wh5gHyNzkj=rn-BFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 11:04:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169851

On Thu, 25 Aug 2022 at 12:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The usptreamable version of the patch would probably be something which
> splits the target names in no_atomics up into components and matched on
> subsections of it rather than the whole string. My rust isn't really up
> to doing that though.
>
> I didn't really want us to maintain a separate list of targets which
> have atomics issues given it and the list in no_atomics would get out
> of sync very easily too.

But then the same patch needs to be applied to (and maintained
separately in) librsvg - and everything else that includes a copy of
crossbeam. Perhaps it's worth to at least make the above suggestion
about making it upstreamable in the patch commit message?

Alex

