Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5836C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 11:50:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.10188.1642420250337179843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DxErtu03;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso23723875wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=k9CiAxiBEuDAWOcZ8u0jIKEzGKdLBG1Um2aZHsIU/fo=;
        b=DxErtu03HCSpZnd8WO7p79XA58ZrU9mfCSMhw4Rt1SVtjQHoft61S7sAJ+2jUSIn/V
         gc41vR6YQssLrtlS4Xumj2sC5dJr9/u+++48ArCc+voS/pZ/IvcAvGOwXW8k75RoYtBA
         hHXlSd0xjvi9zbcjCiLKStPv2EucgAdEELNWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k9CiAxiBEuDAWOcZ8u0jIKEzGKdLBG1Um2aZHsIU/fo=;
        b=gCYk+Gju3ZIw5PaVALwTT4CAGc4dPvq3YyEZaYO6fGw/Dxag1OXvC8j6HqHWoVXje+
         lYE1ZX5rWKZokqtyHvqzTs2Xms9a8YrmmdKxJYAGNSwrBvvuvq9lY6GgNJRr3W7aee7D
         A3F/E7lkCty1q4vbKE9tykav5JluEDjAnVThBPz6r1qV8tKuxOoxF8tb2kTL2zol8qKM
         9e0mTXa8gCBxggsxeLb4bee3FLTW7z3ehlwfKv0yXZX7j4b+zPT2IRkiE0FeWTn6pLPS
         ujYe6Hz0iboNWIMqesUhh47ul3eUmP3O0jTiJdJM75juDIHCBbqK/RlDiWz/p8S+xtml
         XITQ==
X-Gm-Message-State: AOAM533C3WLE5i9V/KOv8vR+Rh3i3JbkTb7ZzrQ1hL0oFc3aLfWoNp+j
	2V3dpHoZ+oemg9ZilqHKBR4sEQ==
X-Google-Smtp-Source: 
 ABdhPJwtxqzRpyqNK4H6GUAEhFfqmzGvS78+RdLddO+8B3hQFeNmXhajewNj+y8WTTUHDWu/I9IEDQ==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr19767822wrt.371.1642420248570;
        Mon, 17 Jan 2022 03:50:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36?
 ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 a18sm4891696wmq.17.2022.01.17.03.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 03:50:48 -0800 (PST)
Message-ID: 
 <a76c827b7b5ae164942bd715c50cddfad2c3186e.camel@linuxfoundation.org>
Subject: Re: [OE-core][RFC] classes/native: Propagate dependencies to outhash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Jan 2022 11:50:45 +0000
In-Reply-To: <20220114171222.1788462-1-JPEWhacker@gmail.com>
References: <20220114171222.1788462-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 11:50:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160641

On Fri, 2022-01-14 at 11:12 -0600, Joshua Watt wrote:
> Native task outputs are directly run on the target (host) system after
> being built. Even if the output of a native recipe doesn't change, a
> change in one of its dependencies may cause a change in the output it
> generates (e.g. rpm output depends on the output of its dependent zstd
> library).
> 
> This can cause poor interactions with hash equivalence, since this
> recipes output-changing dependency is "hidden" and downstream task only
> see that this recipe has the same outhash and therefore is equivalent.
> This can result in different output in different cases.
> 
> To resolve this, unhide the output-changing dependency by adding it's
> unihash to this tasks outhash calculation. Unfortunately, don't know
> specifically know which dependencies are output-changing, so we have to
> add all of them.
> 
> [YOCTO #14685]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/native.bbclass | 31 +++++++++++++++++++++++++++++++
>  meta/lib/oe/sstatesig.py    | 10 +++++++---
>  2 files changed, 38 insertions(+), 3 deletions(-)

Thanks for this. I know it was an RFC but after testing over the weekend and
doing some checks of my own, I've merged it. I think it is the correct solution
and we don't have any other good option to fix the issue which is breaking
builds on the autobuilder.

Cheers,

Richard


