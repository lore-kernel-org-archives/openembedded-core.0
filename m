Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD08C56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 10:51:14 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17064.1786013472661110657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 03:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=skYhKBg4;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8f23e851626so11662146d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 03:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786013471; cv=none;
        d=google.com; s=arc-20260327;
        b=kW7Gz/2MtL6b0IrkOY+oOnlgEzxgq7GRjIkzWn/iKkKncq8tQJlSSuk0Q8rI6DYXH8
         YCLchzgqzxERjho2EIynJXnmU1wkTgl+7IuVFeYHNJRHvvOQi9i1Vzehb95GWwzGw5DE
         mXMt5Rt6JUY1GHMzpTaDabZG+mi+J60d7BQQG0iMAv9y12S3+stEcoxO8c7GnXNyt8aq
         jsnKhlLgLZuIh30tK5AW+FG41NPMR0B8XttyXy5yRfntlgE9ZjnEALwmJXWRoOnUEENw
         Ce5dWpEY2g0+eUI84YSZ+wJy+LH4/EPTrxcd/dT3ywzveTe5mta4jEe9KX9yl2t3OaA+
         lj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wmy7v4efWaiNG0LzBv8U3KVjEcfSomB5AqJA3vrLE34=;
        fh=mqJwaa8jVSn/wCXyes5gXUDVfEW3aQUsMvRKhMPVvMg=;
        b=PHhseYwlY+pp20C2v85w10wAUIdNbu42q1og6iMFSSi4I/qzJrKT144IRO4s3CapUa
         Ac/YFDEC94EeH7H5QwP2FphN33fDtCnEZfFtNCcsn90LRgr5VJlrHFwjbRJYiUf7klJe
         kEE53ScmVkkScKkGXFASOw0/Sz1qPOQA5frjfmf16N1KTRj9ApFJEWR1Frco9Gv7AV+d
         sdZx+SMQkeAO1YyOUp2TUdygc/r9t+fysOwWpGF/YaObYKkPLyqNCGxSGXbKudYNqnpA
         Tjv7rx6FhRYtpGT3qibN3S7NOUpImSRBANiA7RYmlqXn6t9oik6Yh0KNmKZTobe+Qxgl
         CgAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786013471; x=1786618271; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmy7v4efWaiNG0LzBv8U3KVjEcfSomB5AqJA3vrLE34=;
        b=skYhKBg4XL+UaMFsm3OHanSn+B/vGvJfoW1XrMRPLnKLT9v6KXGf8fYDIw7EtzMi/j
         SIo2VI3ZlwaKywGc62u2UrTUukWI0mCq5AfY+1X75BsNZxoZo5+ZKRdD07VcHmUqYMDt
         71f0ZQZbVhDqc8wtdCdUVZP2n7WPzB3Ce3YHCucnMD98m4VPfuflHIhz1OlUf9PZ50Of
         rwYLEjZPEg5qwZZHgkGWCiuNVFk4e1/FnppyUAZ+lvdgBJL/OGq8b/b24feEpA43+EHr
         0LNb5K5kUN0kH4fHJHVU7x52FPvn5tkn92aCTjUH8e2pO+UtGC0bt6vJeqxfEHcK8Hkd
         YcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013471; x=1786618271;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wmy7v4efWaiNG0LzBv8U3KVjEcfSomB5AqJA3vrLE34=;
        b=NV8EzIql4Q4bOpGnjHQGU/SCgQfpd1U57hJTMBcWaPqLWROc8mTu9zSORO9jJ2+UIk
         b1sAzbLEfgMpzbyAKQocxg+12QUahSQMV9LWYhW4IPD3bkHytE90MwkkzYm7DVM2h8TR
         4NrBO3m1O6+jSZ3+ntGJ2KI1GdTEU6y254uoNVaQUulERbICCI/BOylJj5Z0DYkVUvld
         mEDZIyOD9Cq6Py+2zp+u0dfL9UENZSS8ly98ZoJyoNSSFdmTWQwuJYwtB5gA2rEjPCsG
         3CjhpdiBJJq85qYtJCEensu405CU+K/PWZ7KljJauYk64QXyAgG4F0HDmWYHQp+XX3u1
         qn6w==
X-Gm-Message-State: AOJu0YzqkKV2sRQYCE868aIR8QJvqrwgQom9XZcay3V5ljOUIBw3VDB2
	stndzmlMvoaAg0Yg56R2mQP4n/fGEkD7c8PeLhiPbdvHCSpREyjMVJSO55v/7/08wKYBdmehH7H
	zfnae1DJ03bj82OHWK9suzWN3cetpPr0=
X-Gm-Gg: AR+sD117uF+rzepALIKgh+iebpOSuioKixkRjZprWCvejFK2na89XD96rG2wKOTetjz
	Hgaf1n34kWlbRYrHekFWHZbVGQbznCOLUmie99IhMNwxPpRCLtaHLrLua6wGh3BcLVXuvxUnAbs
	Ug+tfmoZPrI4RK3XCJQqpWMtMBHwGjGoTf4HiL3Cwg09cMzQZgXCIqsuw47MJYeCIrfUh5YlhX4
	pzYOKC16QI20+NpKk22UjatVijgfYmZxN71E0RaumNXhwuWncAR7LwKLgu3KPHwLEP/zfIxSG7P
	hJOVpyr7aF6kw13AJe37CfaPV3ANT2ROzzj4zMcmGQ00cVjBXV9/Ru30uNXq13RStW4wFlGh7hn
	/m9I=
X-Received: by 2002:a05:6214:5413:b0:8ff:6304:da9 with SMTP id
 6a1803df08f44-90881081a82mr164712076d6.6.1786013471507; Thu, 06 Aug 2026
 03:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb8f7Tnxyebp7o3Pkwdp2R4RbfZ2sVo-3fjh6MUGzvcESQ@mail.gmail.com>
In-Reply-To: <CAK5yBb8f7Tnxyebp7o3Pkwdp2R4RbfZ2sVo-3fjh6MUGzvcESQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Aug 2026 12:51:00 +0200
X-Gm-Features: AUfX_mxaW1bVclRhIyBkVHQhFy5kxIJGjGf45zPAKdsqlLdB3SUoFeB5hI4Fyi0
Message-ID: <CANNYZj8MbUcOadseSfWcZzGxXaSC30DxE7HM1=oGrbpz4vpj=w@mail.gmail.com>
Subject: bitbake-setup in pip (was: [OE-core] Yocto Project Status 4 August
 2026 (WW32))
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Rob Woolley <rob.woolley@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 10:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242925

On Tue, 4 Aug 2026 at 17:07, Stephen Jolley via lists.openembedded.org
<sjolley.yp.pm=gmail.com@lists.openembedded.org> wrote:
> Current Dev Position: YP 6.1 M3
>
> Next Deadline: YP 6.1 M3: w/c 2026-08-31

There was a question in the sync meeting about what people would like
to see in this cycle. I forgot to speak up: I'd like bitbake-setup
installable with pip :) I'm not 100% sure where we are with this right
now; I think all needed patches (or at least all published patches)
have merged, and what remains is the mechanics of making a release and
getting the artefacts to pypi.

The reason I'd like to see that is partly self-serving: I'm going to
talk about bitbake-setup (this time, as a released, shipped feature in
yocto) in ELC in Prague on 9 October, and it would be awesome to kick
it off with 'pip install bitbake-setup', rather than 'git clone
https://git.openembedded.org/bitbake'. But it's also good publicity
for the project to do it the former way.

So I'd like to hear from you Rob where we're at and if there's
something I could do, I'd be glad to.

Cheers,
Alex

