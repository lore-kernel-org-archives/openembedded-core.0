Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E5C5DF87
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 13:03:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6844.1787317375219472220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 06:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o5dmxs71;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6073795e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 06:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787317373; x=1787922173; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KWsR2npolX/bOeNxVlaUy1Qk8Desqodym2UkpncT3o=;
        b=o5dmxs714f+YPrk2Cq72LGQws16Us2dNs3oDqnLI7ZlWaZumDWgZTI/URTHj6oPpNw
         LH/bAk++J5sUQciu1ZpmHupBOrJUgBNGMnZLX3xcgQQCcHitLjK6Svcsv63gr0+4gtzb
         I+M6aQgN7ibvgFPmTUouilFMW8IMUxAA3NX60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787317373; x=1787922173;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KWsR2npolX/bOeNxVlaUy1Qk8Desqodym2UkpncT3o=;
        b=eXI55pZjdFCgc9tvvVWmFo96EPlsNtZye36t3aRzUe8DAskxFPiJv3QZPRn6KR0P/0
         6r+FylYEGQDmMPdbv2vjW1cjk2XVEOgKfj/ZsUG8ZmZijOtTCPABIZ8oOjUbYTfUorUL
         6ieZpqbuGiA4xtuuDzwLMIpP/W+xjCcqkWD0nOrCXZKnBo6Do9r1b9EGHWETzzV+6sp0
         yuGpXvHtNg92bDtrc5UfYR2R4jMliAFto2At/KMUlOQh09ERbYlfet97TQT+XJrSW5T8
         PONnckz238/KpaBzQH/lbUfDs68bM5y5IfbmYCtaQbaKKkVFPI7B2HEJINjhZLEbPC7v
         dKQg==
X-Gm-Message-State: AOJu0YypulS9YNXFRknYJq4z9scBSxTX3HG/ULHpf3XlFivoRWFNG6mD
	/5IHqshbQi8DkBUZLRjujTZCPPQdixM3sFdcl7JERM7lYhW4/gbmlezIwygNcsWp3P8=
X-Gm-Gg: AR+sD11GVhixEQRFMcFqdts9X/eY3rbtMwRYokexF1E1djMZnJUH2DSQ28KBrtD7qfU
	2sEyRkf5gmiuBXhzGX+18HCFhYVtNnc4WaNBYsJT/6pUJqxnQ08TW1sSGU23Uq2357If80hgsvs
	UoW3POkwC+yUjs7aUcAlAUPS4eiO5O3MJMWWAP5v9OKhDiKbcWP+Co5mSa8oJXwUaOiQeN3zrHI
	BUH32LjVwlgaBBh6O9Uy4V45T7jUUyYR2JczrRATNPGZ8goTZ5ZPNrDW2RynpOmaqskKeo7QZ1O
	DSq1480tw7YAQDAzqn7tpK+244T1rD6xUPA8viJzXUWGG6Nvvt/Ck1hoUma325c60TjrfYAxfcw
	EHV2nM+LArFWSW19M8RGuCverKIUxMhH1vRHjy/OW5Hh4nvIkBAoRAXSK8x4rqbXlVLjpmho9nU
	x50wpAzHbdN+4b/qxbtIJ6dNPUbySPQesq+mPBPOoI8LDW6JWhnqzJhX98fxyGBeOPs97PE0IRp
	5qYEWG9VXGVvACXff4EAasIxsfJossoW9AhPPYcHuVkyfmCDCQ=
X-Received: by 2002:a05:600c:1d22:b0:499:516b:83d5 with SMTP id 5b1f17b1804b1-499b82e8512mr91588625e9.11.1787317373111;
        Fri, 21 Aug 2026 06:02:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bea71eb4sm6035865e9.2.2026.08.21.06.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:02:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Aug 2026 15:02:52 +0200
Message-Id: <DKUN4PPICY1M.2A25LSZNWZOI0@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][patch] rpcbind: Fix CVE-2026-16277
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: "Vijay Anusuri" <vanusuri@mvista.com>, <fabien.thomas@smile.fr>
X-Mailer: aerc 0.22.0
References: <20260814113323.1033135-1-vanusuri@mvista.com>
 <DKUKLAGINTTR.1W5IKJ5PRG8R7@smile.fr>
 <CANQUz192EZKJPWknMq_HYW5AXPAv_Rc3_20yLQ7Bi+4d59Gong@mail.gmail.com>
In-Reply-To: <CANQUz192EZKJPWknMq_HYW5AXPAv_Rc3_20yLQ7Bi+4d59Gong@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 13:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243940

Vijay,

Thank you for this contribution !=20
Sorry, I had missed that version bump...

I took a quick look at the upstream project.
There is only few "fix memory leak" between 1.28 and 1.29 so LGTM for
upgrading on wrynose stable. Next time but don't hesitate to explain=20
what motivates you to choose a bump over a backport.

Thanks.
--=20
Fabien Thomas
Smile ECS


