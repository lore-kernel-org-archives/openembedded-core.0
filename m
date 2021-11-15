Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB345C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:03:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.21817.1636981415484112744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rfa9BwTJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y196so13855689wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6LfYkhFsb4tJz9xoiKWB9mmyJ04ZY5X2qJaeYV5tPxo=;
        b=Rfa9BwTJXskwhVBGRV1rgN/qQmBXBLXeLuSG2nUj86LduHqnGjELRlf9bQfaOeNhyT
         wBjYiBDyj//3RA1tRBbfvvJv2E8wgHs+go3WZCet71Crj73amW9sIOTcpuUo3w+4k4wr
         aDOEjGaN1VNV/BGkKyTGBqaX0Ii5k76ytn2RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6LfYkhFsb4tJz9xoiKWB9mmyJ04ZY5X2qJaeYV5tPxo=;
        b=Yq2tByBXPZlyPkHNAyIhxDNfjj1oZFmaEs66XOCvAQKa61lOFOxW28rGBeuF6Z5+mA
         A5SZo7pcvCrqajqg7BhSJZUo1fK5ciFki7Q/2tTknr2XlQolsUvGNAHNxdRuSaoZdTaS
         fbxHnWE9lC0nguz3noETg12GYdQxDNTXNlMiiFm2Hunajwb1vDeNFkNgu1+OFM2tPi3H
         t8kgKYgYY1lDIX0N6yI4dy5e2gMBC/UNSdQUhKD9gw9w5BWjNLrXknl48JoiIUg9rsJ6
         fW6zikV0UrUE1Xk6xYLJ4SgKkTcLTMz3WsSc37emC2EwFNTvcUyYfIhWCpD6akwSljaJ
         v6XA==
X-Gm-Message-State: AOAM530VvQUc4gFi4UzaIG0hL312UaEQrDfS0LFkxs8dxdNZFXXIcplK
	8E5CS1AOY50h14ldmRqn2Q3inQ==
X-Google-Smtp-Source: 
 ABdhPJyDZ0W6LtZ6pnU1G2/kee5/FJHfews/SKpevHBvvFjFa6P/u4XMjll6T9hRua9OibiEEhk8LA==
X-Received: by 2002:a05:600c:3227:: with SMTP id
 r39mr63527583wmp.120.1636981411984;
        Mon, 15 Nov 2021 05:03:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c4af:9769:123a:c249?
 ([2001:8b0:aba:5f3c:c4af:9769:123a:c249])
        by smtp.gmail.com with ESMTPSA id
 k13sm9634241wri.6.2021.11.15.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:03:31 -0800 (PST)
Message-ID: 
 <4fe9727134f24a4368d9620000b5c2817c9d7892.camel@linuxfoundation.org>
Subject: Re: [PATCH] Fix Bug-14613
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Date: Mon, 15 Nov 2021 13:03:30 +0000
In-Reply-To: <20211115125853.123820-1-pgowda.cve@gmail.com>
References: <20211115125853.123820-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 13:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158288

On Mon, 2021-11-15 at 04:58 -0800, Pgowda wrote:
> Source:- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14613
> 
> Adds TUNE_PKGARCH to PN so that it picks correct TUNE_FEATURES.
> 

Also, the short log needs to be in the format matching our commit guidelines so
something like:

rust-cross: Replace TARGET_ARCH with TUNE_PKGARCH

and then the full log needs to describe what issues there were, why the commit
is necessary and how this fixes it. It should be readable without looking at the
bugzilla entry.

The format for a link to the bugzilla entry is:

[YOCTO #14613]

Cheers,

Richard


