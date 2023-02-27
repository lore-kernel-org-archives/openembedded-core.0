Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B44C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 22:02:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.8461.1677535343034632167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 14:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G5WTw0gU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id bv17so7768534wrb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 14:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sPcPltYGpsUZKU1rv9dG5OGf1pvrZ83oRXAwKiAKnSE=;
        b=G5WTw0gUQbw26zkcYGXM/gt8dCUCmp096uSr1C2QILP7Uupzh/iKiEFItDH210oZ4b
         AVzcTVkzwflmoy6B9CMC5Z7zTerXvgi2OO9pjNUxPUkBvBoy87gBPp2pLYYiDYL/IZg9
         K1Kjbaf4FR5G333tENZ4SQGT//wtR+Zzxhzbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sPcPltYGpsUZKU1rv9dG5OGf1pvrZ83oRXAwKiAKnSE=;
        b=rAWwwS/j0lFVfils8rEpO6OHJhvdEx8rlWUSLsLmDXWr1/pbj4jB63bePr579ltVnT
         CTFpdcEuux7bI41WNv2f8agSMa8BhLNVOmjpQb7witVHZpqSGTqSwml810pxrx2AXj94
         UKYbellUnNNvElsdfHt6QRbbyH4jjUNOhZigmsUEeJp5ikL82cWUqvaBtEYEh0zQG/uz
         hQFk1DAm4FHFq285b335nllSR5KlldHwAoyF9F4vv2uTgAp3V9gQmrwnEhUzIOXlZjfE
         RqVm5+HKXmy1ZIVW9GSiRQVUTFqGZO8DshcaMMDVcc4POZS0Z68U8kLa5L4EzsHXehK8
         zd7Q==
X-Gm-Message-State: AO0yUKWHK3duea/d++/HRSJdrKjL1OlVV7wKTxEZe46Wh/Kv2xjyYMKq
	A3z0kd3u1UvVHY2LoZzPfiCRMg==
X-Google-Smtp-Source: AK7set8iDuFkGSmW6SEq6lFXGX+7G8GrrRFKhQWvuV0whY+bw1xWeiP2AwmHONnP7g/BRd/VBwiEjA==
X-Received: by 2002:a5d:404b:0:b0:2c7:420:5d52 with SMTP id w11-20020a5d404b000000b002c704205d52mr477928wrp.62.1677535341469;
        Mon, 27 Feb 2023 14:02:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba1a:ef91:9631:3e11? ([2001:8b0:aba:5f3c:ba1a:ef91:9631:3e11])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d55ce000000b002c559405a1csm7972920wrw.20.2023.02.27.14.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 14:02:20 -0800 (PST)
Message-ID: <b746ce640228f72ad3cabcc39ae2992305dd4a0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions: ignore inapplicable
 linux-yocto CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>, Geoffrey GIRY
	 <geoffrey.giry@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Yoann Congal
	 <yoann.congal@smile.fr>
Date: Mon, 27 Feb 2023 22:02:19 +0000
In-Reply-To: <CAApg2=RSgsbVjjeepNJg_=rMZqf-n-fQwWtYPVufUgG-D74p2Q@mail.gmail.com>
References: <20230227110027.804671-1-geoffrey.giry@smile.fr>
	 <CAApg2=RSgsbVjjeepNJg_=rMZqf-n-fQwWtYPVufUgG-D74p2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 22:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177810

On Mon, 2023-02-27 at 18:49 +0100, Marta Rybczynska wrote:
> Thank you for the work. Have you contacted NVD to update the database
> instead? What did they say?

Ideally a large portion of these should be sent to NVD but we did talk
a little about the on the call last week. We agreed that it will take
time and it was better to document this and fix our reporting in the
meantime as well as share these useful details more widely. I'd suggest
that as things are submitted we could document that, hopefully we'll
also be able to remove many of these entries.

I'm sure Geoffrey can provide more status but I wanted to update on why
this was sent and why I think we should take it.

I will drop the kernel filtering so new kernel CVEs then show up in all
our metrics going forward.

Cheers,

Richard



