Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0CBD2E9DE
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 11:27:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.56995.1731324455960335965
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 03:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FIDp7pTc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so55748175e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 03:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731324454; x=1731929254; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r6bQ8M6sr1zw414K7zdsenEs+tiMUGl2JU79+6sK8DY=;
        b=FIDp7pTcbw7ivtdutufx17BeWAWaj+T9aoUZGPgNlqVF8XfJbIBTFHZ6BLfPuU5m/0
         FESV+IqlKjMVpKSobMDFNweN/DNWc/maW6NSfk8i97eTti+ixYUJImqrj87Oi0bkkZr6
         LPToXng7a6/iQ7Xwflh7y4fH8W+XSFx61+j2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731324454; x=1731929254;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6bQ8M6sr1zw414K7zdsenEs+tiMUGl2JU79+6sK8DY=;
        b=bW3lWe9gKXgzXKdOwhc/KvvtCM21B2ysg6ql8Lok+3txaPO47b8ZeXXMnlYRPh1Yyl
         ykrsmTYDxSJN71XkP3IWKMZDe4Dvr1OAXOp2ims7qcBCQdLQvhN7QGWghjYCkZuXFj17
         swstW/H6/jYgmxQm1pN2wg5c5VcCTunmvBtKsuLXAN2Vbpk/N7S7pslZ/Q26w1Y/PjM5
         ztM5gyZTYSMiKuJKpovcsm8QM1NWsny3wrtTFzV+GM5dBiRcU6rRI1yzwrUGkt7EgUt8
         T2H12HlKsdcQ2gktHqSP1aL4ogbGX+c5P33GXU5h+82W9wwwhXEl5YKi4HQ+8Nralc4V
         QhOw==
X-Gm-Message-State: AOJu0YzorbMoMPDSqo4zWS4iLwXdKXbkGvzkJpyKVOP4AM0gE+WvMdf4
	t1l4jyK9PHAHWNuoSDAHYXoS2+dF1y6ae6M6RSvjc2x3T5Hszq2/9omT3FuySs0=
X-Google-Smtp-Source: AGHT+IGuw22F47lIKuqOTBTsXIsxA79UVWwkfG6g39ODlmZLdxRMjCuhevfZAv1JzFrQE/Yp/hUT4g==
X-Received: by 2002:a05:600c:468b:b0:431:b264:bad9 with SMTP id 5b1f17b1804b1-432b7505af7mr135187055e9.14.1731324454337;
        Mon, 11 Nov 2024 03:27:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ee1:3752:cc0b:60ed? ([2001:8b0:aba:5f3c:3ee1:3752:cc0b:60ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c1a13sm172261505e9.29.2024.11.11.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:27:33 -0800 (PST)
Message-ID: <b2f8c3b3a82a79c2a8f9d464fb34a1ac0920b822.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagedata.py : Fix RDEPENDS Version issue
 with AUTOINC
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2024 11:27:33 +0000
In-Reply-To: <CAFt4JuEedBeZvsi1vouzMMm+iZXTv+=nXoPVzfn7+RPgF9r6Uw@mail.gmail.com>
References: <20241024144845.43504-1-sreejith.ravi087@gmail.com>
	 <e5078dbc15b853f94edf433891fbfe21ff077576.camel@linuxfoundation.org>
	 <CAFt4JuEedBeZvsi1vouzMMm+iZXTv+=nXoPVzfn7+RPgF9r6Uw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 11:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206947

On Mon, 2024-11-11 at 10:23 +0000, Sreejith Ravi wrote:
> That was my mistake.
>=20
> I modified RDEPENDS without using expand=3DFalse before the do_package
> task, which caused the issue. The PKGV value is updated with AUTOINC
> only during the do_package task. Since we modified RDEPENDS before
> do_package, it was already set with the expanded PKGV, preventing it
> from updating with AUTOINC.
>=20
> Is there another way to handle AUTOINC? It seems that if the variable
> is expanded before the do_package task, it will not reflect the
> updated value during do_package.

There isn't another way, that is the way it is designed to work.

Cheers,

Richard

