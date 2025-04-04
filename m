Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C3DC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 17:04:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.2323.1743786274923547842
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 10:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D6lCZc8u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so20450315e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743786273; x=1744391073; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uMS5hLbAlykAmUbhIRVAEcyAFBrPSK+nqUSTSj+dXkQ=;
        b=D6lCZc8uWWDA7Iiu26jgRM5X6g8Uz7XzH3doaxra2YiYs1+Oyk/JelljI+CKLh54xe
         FOE02wsK0NdyLxAAQTVOMc7ivkF0B8RcWIPPzoONh8yR6w4Ufb6COtivbkUpnWe/Ldep
         CF+rCcJBB5eNSFdZIZWGAKKEO6jKH0FPTmNuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743786273; x=1744391073;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMS5hLbAlykAmUbhIRVAEcyAFBrPSK+nqUSTSj+dXkQ=;
        b=Hj2wsegq3cC46iPQEJgLncudCAjB7+fkwCzseRELcju/FyF7TEguKrVLUFyx/UR9xW
         m0t9MjNXkcl2royE/pGF04eegw2c4GjQZFZ7HLj90/K+bYPJuDA3CaXkwwwWUyRPaRAM
         ZPTmyJyK7sYzpc0US9VjmM30+pBCdLvWnbbwvvXnGHSoydNVwS9JECjA7Iz1gyYyZyuc
         r8ipa+mr2/woJCSMHxMrh07QIHR3SQq0tvtWVL8de/ij9aRpneLUsWFzFmypT1I9AoeA
         U0GMaRS9WLbg9GzYuAdNKa/9Fbimps5rITiPoDxjUvlfEhEMfPWL3Tp07FyuZF1SebvO
         VHtg==
X-Gm-Message-State: AOJu0YzvV1/F4DxhnGl2VS4xtJnl9YZhiQ9QbnvoeoyC3nyjfGVOZx1x
	TK9PeVSTm4JcFr6KsauwujMe8VSowwwtTpkxBT8iGZBr9hOC9nlq4ZcUzOxAB8r5QypiVZjjVDO
	1
X-Gm-Gg: ASbGncuigi8k+v68lEcIhdxS8PE3uuRY1Qwzb+0uIeQu9dJDy8UoTT31YcZ/294Nqri
	Oaj+4sEUW5cd11y0G+JhqrRT47qGftX5E5U4vCmStcavjF9g5OwQFJGPZ0/ZXQSvjnmfPjG6WrM
	p3VAMuHjLxGIp6TaSLspdN4LNvaiI0ZmppVX5m+zSeFmZ7jk3uwAoJcQoTdQBK52370IQ8y+naK
	u/bxU3C/6KCpZ+azJFpSNc8n7VT4YLlrxQLrPJzpkbQCap0wDtQkHTWK2hciR0ELs/uekKOnCIy
	P8U7/aIykX3cIfQGg4LRbTXrl8Tvk1Z3PFKaRzT+tnbQXlPcbIKcQvCFqg8lnk8ZS8AR5rSyTkc
	bOZmenAChy8CEKrOi+vUAyya4DrB/+W59efYC++3R1SMf
X-Google-Smtp-Source: AGHT+IH4rNkx7T4W7AqhWWDy93Zi2cSJ94N0vHhM7b4+hwck9h+dOutqb10j1HRNR5e1Wc+DStPquA==
X-Received: by 2002:a05:600c:32a9:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43ee0aa35bbmr861755e9.11.1743786272846;
        Fri, 04 Apr 2025 10:04:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ea58:417f:acd4:166c? ([2001:8b0:aba:5f3c:ea58:417f:acd4:166c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a75fcsm50184775e9.11.2025.04.04.10.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:04:31 -0700 (PDT)
Message-ID: <fb040e65a8a26b619c9215f61fb90d6651df66c2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] breakpseudo: Add demo of breaking pseudo with
 symlink creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>
Date: Fri, 04 Apr 2025 18:04:30 +0100
In-Reply-To: <182E37A83C59199F.9767@lists.openembedded.org>
References: <182E37A83C59199F.9767@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 17:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214364

I think I can conceptually see why pseudo is struggling with
link/renames.

The reproducer for the problems involves overwriting a given target
multiple times in parallel, i.e. ln or mv commands in parallel on the
same target file. At the end there will be one "winner" but while in
progress, you can't predict which file will eventually win.

Thankfully such scenarios are rare in our builds. They imply build
races and therefore tend to get fixed. That said, we do really want
pseudo to be robust against such scenarios.

To understand what is going on you have to understand a bit about
pseudo's internal state. When the system calls "mv A B", we have to
contact pseudo and:

a) mark both A and B as "might be deleted" in the database.
b) call the real system mv/rename function call
c) see what happened, did it succeed?
d) if so, tell pseudo B was deleted and A is no longer pending deletion
   and rename it in the database
e) if not, mark A and B as no longer pending deletion

We need to know about both pending states since something might try and
access A or B during these steps and whilst that will give us a hint of
what is happening, we don't know until the process performing the op
reports back.

We need to have these pending flags as we have to preserve the extra
info against a given path/inode and ultimately we need to know which
permissions/ownership to give the final file.

The challenge is this "pending deletion" flag in pseudo. If the
operation above completes, it clears the flags against B, even if
multiple processes have a pending deletion against a path. I think this
is where the current code breaks down, only one client has a pending
flag and in reality, multiple processes can.

The second issue is that new files clear any pending deletions against
a path. We have no guarantee that the new file hasn't actually already
been overwritten.

I can see two ways to resolve this. The first would be to separate
deletion out to a separate table, so multiple clients can have
"deletion" pending against a given path. Deletion is keyed to the
clients already (by client ID).

The second might be to make some ops block on the server side waiting
for a second operation to follow up from the same client which would
allow the situation to resolve before anything else continues.

I'm writing this down so we at least have some record of what I think
is happening, while I sort of understand it, or at least think I do.

Cheers,

Richard


