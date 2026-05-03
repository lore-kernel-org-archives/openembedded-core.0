Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5486FF886F
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 07:23:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19653.1777792996337304712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2026 00:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RT8oNjfR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1711205f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 00:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777792995; x=1778397795; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy1aL09ua93CQepXrZ4w7fiMfg28oQgPM99xY6n7fMY=;
        b=RT8oNjfR4HNbCKyyAw3AAO4naN3Z/xjHCmtxLpjiDZtlSt6CvJKgnxJhfY7JmbMFIQ
         NDEdnqKcWIlGvz7WD/p3YFXq/9MTIR5s5zBhfDXo4qNVkP8xf8BdG45/+TZbKXnrGp8U
         2XF3QuQ4j3eXnyeDqHIPWXRJ7W6+jrtYk2C3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777792995; x=1778397795;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy1aL09ua93CQepXrZ4w7fiMfg28oQgPM99xY6n7fMY=;
        b=bd6zml4vMAUOiH6ffAAp9QNAqUukBWLuxYjXL0DnSpeC8NrM0V4qj898BaHE54z3W7
         APRv/Dgg1g3knNp9VQUzd1UxyiXlBhaoLQ23O1zcqnFlaObtgrAGgC1jpj7UJiiKQZjC
         i1OZfYkQOgILVkGjoiX1WZOsWEQRSCBQZ/EGAXcGoscHp3cSHxfHfyv/xYlC7iH9uF9o
         KHh0WA24aaTLd9EszXjt4vYYimeU6dogLao7KVI+foEMYyjjrkJHkv8Fk/aQp7WTrx/f
         7xh50bFEXptVLQEHBUbqxA+296PyERkVJmdA45BAmRXIgIGwSNvmZj0xwfrX+fAOIH97
         rNPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HiFSeL4u9a05ewyXiEg/YFCX9r7hQotVaeRvtR5rAvrHtZVQiOOYYFH7VcbvtUWk+KnshuVQbWbeTQ8O3pVLcLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx03OjJnY1GqVJflBtOjIv6ugUWSzVn6Jb3bZ8JRA3XxKHj4eO/
	H51d8K5nBanjVd104DF0wRc/8YmGOYMAPAGfEuKNzM+k3ufFOeKDqyc2veKaZwYyT7uokNBxEhq
	nFC1Q+HnBsV54tVh+AEsO+XIPu+2z5oBoZDiq/H18M23hEY92NK0d0fRfCwcOno3f1Ecbxxs9g8
	M=
X-Gm-Gg: AeBDietowlDVF2FUeWAcpY47l6Mpp+F3GjysruisFQ5VQ/TawXWjLe4EsE6j0VMM+NL
	c8h9AvRAgJ6L6jete8Ys8XIKvJQM/b2K6raFE4pXIjt5yJ4AHndx8Sykam292jtRGQUoa/a2mY0
	yfNSOhJ8RONXnG1vcA8itDYSr2WLn4RpjkJ6xDa5XlwGHZHUP5QMutI0j+NqqpTLwf2B+W8cPaz
	2VIwvdhoetCSgBbQZ+PJnry4NdI7xOBoy2PLCuL8cfvDOsAbkLepb7DRML2MhcE3KuGa/SKl0rw
	glh4fdZuuVLXOYSTQv2GkNZ6Yy5/LVqxUgFdM7vbYq5rbawpRemoGddBexsQwx5dGt9uhhaE/Ce
	H50QbAUTpkQSQzSyFWQTjDiZGN5OgT5tz1wWiNYdQtI6I+kI5FxAMQedLrzb9chU2OP9FoX+sr5
	FniX2h5JEkafWRwey5qwNlMEkKns5sRvjghSQDCYVK1P3S0YNeMjXxwWkOpXefudip9dU3AAMqk
	0dOFaulXOEPtBkusBADr4dk
X-Received: by 2002:a05:6000:2087:b0:44a:46bc:e5e2 with SMTP id ffacd0b85a97d-44bb2e2ececmr8288615f8f.9.1777792994659;
        Sun, 03 May 2026 00:23:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ca9e:55c7:784:99bc? ([2001:8b0:aba:5f3c:ca9e:55c7:784:99bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cf6asm16842885f8f.8.2026.05.03.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:23:13 -0700 (PDT)
Message-ID: <c869700fc92b611b37d5ba78fb4537fbbf3a3582.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2] vte: upgrade 0.82.2 -> 0.84.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ankur.tyagi85@gmail.com, openembedded-core@lists.openembedded.org
Date: Sun, 03 May 2026 08:23:12 +0100
In-Reply-To: <CADySD0FdwRz0h9nyrTnjHoLn1RB3Akmw9oXQd_ka_RFKs+1T9g@mail.gmail.com>
References: <20260329005804.525216-1-ankur.tyagi85@gmail.com>
	 <CADySD0FdwRz0h9nyrTnjHoLn1RB3Akmw9oXQd_ka_RFKs+1T9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 07:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236430

On Fri, 2026-05-01 at 08:31 +1200, Ankur Tyagi via lists.openembedded.org w=
rote:
> Hi Mathieu,
>=20
> Is there anything else holding this one?

We were waiting until after feature freeze and release on this one.

Cheers,

Richard

