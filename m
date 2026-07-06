Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3ACC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:10:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156146.1783357808142245272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tIwlTp1B;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c00f74baso20265945e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783357806; x=1783962606; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hokJulPn4u7TX0wZJiub9RCvykfZeKDcz2wrAe8CXdo=;
        b=tIwlTp1BdmEIjtxxq599KDju7rCy+dvkkHik+zszoRo80+HdPQbXnoRrvGQZ7YAy/L
         xuNGhqpLXGm2vekFcaHlQ5ViZc6WTSz6qGnXrVMGTuARkWmxZHwqPIL1ve5dl5dLKUXd
         FyqF7L6RZeCX1vFg7aPuoFwB9A4CllowES780=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357806; x=1783962606;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hokJulPn4u7TX0wZJiub9RCvykfZeKDcz2wrAe8CXdo=;
        b=oRd8IjkpX4EyzPzQZWtqPHxbN2x6AVyfQt01ypKtA1gEdMI0eR5eR2IJFv4DykBBjD
         AUbEcFGssUIajLtQ6wBNGNOvjhck0l+TPzyeD3BrFG04JEK2KRl1u9sIcyxl6zQf9k++
         RSxRcl6y1rSZfIZC7a+Lk7MwCB5Hu2wj6nrY3uyT/OJS/wnOw8ntLIHojEA9ZXhVCOf8
         mgqfTYXp/3Az97buoIObcEXKwqUqCdbm5VrYDYWKT0gvYbZHGLy6zvJ/cuMjJNam5Qxv
         2yDETEs70L/u+a+pA7TaK0UR61C29snfHi10UE/XnDWjp6j+2nHaPYH1htXujGiD7hNU
         hwMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrpjy1Muazz1hkpfqZ3V2tbKA0ktEaoKXD0LqDbZPTweDQ1xAKLdcyVAPanuhIFHQElmg87abIDIQSxHugu5jSI/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzroDZfYCwV0xHnz7CVtLYZqznYiw08L2F6UaTTOZ125/Mkizt8
	ixNysH2YQrtlx6AKAe6NZ+VX8ZPsnYdI7IBwRM+QzYZP2KA/L8tpScaSVHAq0zBbpvI=
X-Gm-Gg: AfdE7clsJa8n0w8c78zm1+KQEs7lddrL+Zxongfrsy2o405eVdBX5mShjkb4eE+53ZD
	2ZvFzSqFFw+bAyS2KsHJAcv4yCnQ9qe6ZIqIn+vcXASoGMhp/NpoXE3nqgeHyuXQV2ZW/pVBnef
	54nBKM35eNYwpoi+9gfZUxLJ15rNmylaP+Z+iWm4i68iX4rMUBUNlzzomCxCI4lpN1QKbu7LTnT
	tvESB0Airz/mDx7rzD1rS/sF9JM0m0XqzWUSPPKZjSYGfHZ1/gSOL3DqUS3xGFKO/JGDVGzG+zZ
	NFvtKOIA1W0AGGYV0On5hshjJM/PEzaT8sQfEkI4xEuSkpsUUl1b329efsS140YxtLbdH02uAHw
	YlxVRe5l0qFXiCwXHqeS8xDek1rFNTvdaNA5DOoyeXcxu0LLe7zpP1hWd2xHf1QolXYB2/b4IeL
	EAW1cMtICWUcc=
X-Received: by 2002:a05:600c:3e19:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-493df08ba2dmr14876155e9.11.1783357806368;
        Mon, 06 Jul 2026 10:10:06 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm494288455e9.13.2026.07.06.10.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 10:10:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 19:10:04 +0200
Message-Id: <DJRNKXABC7Z8.2LMS2YNVK56HC@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-urllib3: fix CVE-2026-44431
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jeremy.rosen@smile.fr>, <sudumbha@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260601181157.3221502-1-sudumbha@cisco.com>
 <DJ6ZX1JZMT8S.BM5LO9MCVMTJ@smile.fr>
In-Reply-To: <DJ6ZX1JZMT8S.BM5LO9MCVMTJ@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240285

On Fri Jun 12, 2026 at 12:24 PM CEST, J=C3=A9r=C3=A9my Rosen via lists.open=
embedded.org wrote:
> Hello Sudhir
>
> This CVE also affects wrynose and I could not find any submission for
> wrynose
>
> please submit for wrynose and once it is affected ping here
>
> Thanks a lot=20
> J=C3=A9r=C3=A9my

Hello Sudhir,

Gentle ping for this patch.

Regards,

>
> On Mon Jun 1, 2026 at 8:11 PM CEST, Sudhir Dumbhare via lists.openembedde=
d.org wrote:
>> From: Sudhir Dumbhare <sudumbha@cisco.com>
>>
>> Applies the upstream fix [1] referenced in [2] and addresses the
>> sensitive-header redirect handling issue in proxied low-level urllib3 re=
quests.
>>
>> [1] https://github.com/urllib3/urllib3/commit/5ec0de499b9166ca71c65ab04f=
2a7e4eb0d66fcc
>> [2] https://ubuntu.com/security/CVE-2026-44431
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-44431
>>
>> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
>> ---
>>  .../python3-urllib3/CVE-2026-44431.patch      | 163 ++++++++++++++++++
>>  .../python/python3-urllib3_2.2.2.bb           |   1 +
>>  2 files changed, 164 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-202=
6-44431.patch
>>

--=20
Yoann Congal
Smile ECS


