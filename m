Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B0CC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 09:56:39 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.19874.1709805394921344559
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 01:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdbgGBqG;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so7483231fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 01:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709805393; x=1710410193; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGtBHZv3k5WJ9Nvz/no79k7M4HldOSNK637hwhhW81E=;
        b=fdbgGBqGgr/9SqnDO/dI3QE03OZAmCYm2DqM7LRJ0OEjuCXPSZngX//2JQ4eK7Bvf/
         eFLv2GzVOblFcPMoiAoFherPiKes1t+eKdWISPi+HMLQFrQeDYdwvoDqLT+2Zp2iNLnF
         SJff2+/HXYCqfGiCT4Vm6yvMGuSDap/GvSLnVAGi78tv129/oVxP7AMoEaGf4pVihLtD
         ytNbkNW2N9+0EaubQgIz99rzJP1KSskkfwqx/sRBe8uvU8C8NM6DdwjjYeOLuLcQaknu
         hYLXxmhWAvlOyRsgiJdVlfjg+MA6U6G57xugtUIeQe/aNq+a2vJ0Xi1XJqtINpZZ4xTh
         4osA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709805393; x=1710410193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGtBHZv3k5WJ9Nvz/no79k7M4HldOSNK637hwhhW81E=;
        b=CO3kOjCWlYYx8jn2TQxet3nvYSqJCnO+7xViEgsSwvEbfJO9sHzkLzJN+tBDo2q7p0
         KN7tB7AyuzvsWe+UOz+ZUgSNaW4QQy5TjuEsQWaFp+AdGiaKyUwUwIyDIz2GCdHNsjOQ
         x2Ba5dp3RZnVSoGZS7b6tSyK5QSTae1dKsMj+nzKUUfmtR4W8GvbcAwfxyhwRtttnLRZ
         b8PJaMInSi0e8IajwEwHno+SdgrMFHn0ZCKLUNXpXgETz/woUvbWLzBXqP2Tb32+Rdbz
         eXrf82gqNPTyBKR6QDUbm3rIXTgslGfQ2UOKvLNohEvfF7mZPZOn52nEIolzffq79O5u
         6myQ==
X-Gm-Message-State: AOJu0Yy4mN+1OnakOzwyU44AW9EhhW35gyhXytNlTJq/zG5P5GG0nn1x
	qhaI3GRoiELvYIDqC9kCnVgp7xsjJft9W8E2gIUodA8uV+GNU6KDtlaHAbMDCoAElAYh4jswiBv
	eGlCoOw7Bst3SCU0lsd4hCi5KtkM=
X-Google-Smtp-Source: AGHT+IGVSLKUJ05CBjn5wAEywamHQBPK3QeDU0NwuopKhO91T++FPbMNV7Ov+lrp/BkFkb09G8nzjWdxnYSJ01amrG8=
X-Received: by 2002:a2e:98d4:0:b0:2d2:b929:9389 with SMTP id
 s20-20020a2e98d4000000b002d2b9299389mr952184ljj.40.1709805392860; Thu, 07 Mar
 2024 01:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20240307091925.2324637-1-changqing.li@windriver.com>
In-Reply-To: <20240307091925.2324637-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 10:56:21 +0100
Message-ID: <CANNYZj9z1LUBB4sg7Z7tOg26qHsc6VZY2Ewj+vMrep0_cPBVpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V2] dnf: remove log_lock.pid before exit
To: Changqing Li <changqing.li@eng.windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 09:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196782

On Thu, 7 Mar 2024 at 10:19, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> ++        for arg in args:
> ++            if arg.startswith("--installroot="):
> ++                root=arg.split("=")[1]
> ++                if os.path.exists(os.path.join(root, "log_lock.pid")):
> ++                    os.unlink(os.path.join(root, "log_lock.pid"))
> ++                break

Apologies, but after looking at this more carefully I have to say no
once more. The obstacle is that the code checks for existence before
removing the lock, which means the issue of why the lock is left in
place to begin with is still unresolved. This doesn't always happen,
and we need to get to the bottom of *why*.

Alex

