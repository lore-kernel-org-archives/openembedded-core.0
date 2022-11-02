Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D09C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 10:55:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.4729.1667386545160185588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 03:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=POkBrpMS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id r186-20020a1c44c3000000b003cf4d389c41so1023679wma.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4li7n1+HfVC3kT+Y/2wHiP5P1CrlHtgDUgr9ifx4N6o=;
        b=POkBrpMS05j0DVv7pFEZ9FCQWROOePSTwsWs125/A0WXsuX0dgZf26y6rX43zQ3XXN
         CFuAHt/4oHvBQtNT3nwgTv6KmDO6/OR1oUsBWkZXoGT3qSTBG9Mq39BDdFAO+lKrNVDa
         yTwBqv2AijNZ/TlxOCd46EbJ8mApB8IDaOnwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4li7n1+HfVC3kT+Y/2wHiP5P1CrlHtgDUgr9ifx4N6o=;
        b=YgkaTRNbchvzf6zO4TlTMul5Ug6BiahnILPvzuvxJ+NFEyB0903tEFXpI3DCPGCwo4
         AXOn6zYmK0hc5DfFqaqjBwiMG03/JmkbbIvVh7KxApdfbNmga8NJBlvPqZFVeujqBCrU
         /B7ChNle3LCgkdCeWSrOun19f87tEeJ2pjhTV8dHzuLCM4hiOAYW+HISrhPlTw18bdzO
         GdsmUsF/btVH+T4pLC6+FLFTD8seT9mmEL+HlVLsf6DQmjzLqxLwOs52/auDfRwy88OF
         xiJ6cVEkbeY72JzALPZgka8+XDfkoUS2vVAQRdjWaZ3w77Zs/iHDRDE5Q89yPgNCetdm
         qqJw==
X-Gm-Message-State: ACrzQf20SmAo67IdFUBD0yYJNzvoWQNc7hhFADagUM+HvqYrlgtsPu1b
	Q1XmoexDP3ExxsllFtzuPWszXw==
X-Google-Smtp-Source: AMsMyM7cusMXPlnrZs0OGRQCxbzC1Yy5vh0P8AA9dOuIdf7ZP8r5Evh9eTtYWh9rntzZzL9avc7u6A==
X-Received: by 2002:a05:600c:4f87:b0:3cf:693b:3386 with SMTP id n7-20020a05600c4f8700b003cf693b3386mr14071722wmq.55.1667386543409;
        Wed, 02 Nov 2022 03:55:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a? ([2001:8b0:aba:5f3c:b8b1:19d6:e9d8:a61a])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b4a699ce8esm1825415wmo.6.2022.11.02.03.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 03:55:42 -0700 (PDT)
Message-ID: <bc610ce45417a57c2212c3fd20a61e57189765bb.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 2/2] archiver: avoid using machine variable
 as it breaks multiconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, Jose
	Quaresma <jose.quaresma@foundries.io>
Date: Wed, 02 Nov 2022 10:55:42 +0000
In-Reply-To: <CANPvuRntRt1e33kujzgs_=K_FSoOOj0N7KCKkyoiyrSynDJc9w@mail.gmail.com>
References: <20221014152245.243292-1-jose.quaresma@foundries.io>
	 <171DF8E2F2B472D4.2422@lists.openembedded.org>
	 <CANPvuRntRt1e33kujzgs_=K_FSoOOj0N7KCKkyoiyrSynDJc9w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 10:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172583

On Wed, 2022-11-02 at 09:42 +0000, Jose Quaresma wrote:
> Are there any issues with this patch or the=C2=A0oe-selftest in the
> previous one that=C2=A0I need to address?

When I was reviewing the patches that were queued while I was away,
this one wasn't one I could immediately look at and make a decision on.
It was therefore deferred for me to spend a bit more time on. I'm
trying to get there!

Cheers,

Richard



