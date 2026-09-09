Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953F4C79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 22:40:53 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1083.1788993651599666609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 15:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TUi1Y5Bc;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so16083285e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 15:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788993650; x=1789598450; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Td22BP6npIJybLc0+OO2QX4CABeDbABZVrZ1rTW9Eds=;
        b=TUi1Y5Bc1ucosyWh84AXH8Q9n1HWg1hXYmZIE+WM26I0yAoKIax8b7dDaMqH0UgGXJ
         pSjJg1PvtECygsUa4hD9TTLhn9S+CKQawUvwyGGDBTPACyWr3wyCTbkGnAq5u4OtIvvu
         rCnCaKns/7Uu4m0ZepXUNcOWi7PxvT4B+AYQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788993650; x=1789598450;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Td22BP6npIJybLc0+OO2QX4CABeDbABZVrZ1rTW9Eds=;
        b=erOdMsnMp577I1ZByvpJCHzXpu5jdr1SQ6/6K67/jF/0eRPeNfNYwVJwYA01/OGSiE
         cM69v2Bqb2AzJyb8l64HTvWzVlxojkEhhIsjC0ZzBq24mUwJmwpxBMKMa/AP3L3WFOlt
         FQXVc6/VslbPgCYUHj5D2EuA2LO99QRnc4WN7YJukE6PQMNxZG+GMtQaPKfFeBUR543m
         2GkKrHEShZ2vN8jwxdXH/580L4JN3tuRmKaEpo7GKX9rDeqM4WtruyQZx18q6roaUWT0
         bkr+wpDyVzdwHZLmj2ZZHOXMLC0TZpBbcWg/UyzGpL0fUj6YdIgkviRB2UTHqGqr+vU3
         BQvA==
X-Forwarded-Encrypted: i=1; AKwUvBxCiNz5n9Ra041oUL8nwCcl8NZaErQwPCStb789mG/8++8Mf8xtC4qM4ZdLnU4P6xOuPiBbovgp61TmLWDQvTvKTA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lqionJ9igCXTxanc5EWfFIqfRQt9rWPT3zvuPdItxOW8xzqrjr
	FEyYtUqbxex2JG/iwmNUYqPBDqSvnqWN2sO5VLZk/8HOiDM9aEte8bBbf/g/cJZuf1I=
X-Gm-Gg: AYBFou3K1CmKNaASJ3gS433Vni89ZLROePGWwUnzKGIXycl8svTjVlz+PXpnH5+Ec16
	y2PWl5048RuVN65+wJbKiWQIg4GLHlv73ek0n/zf3xyEEBVRO8tLHcstiF0SioqGcs1HCL72FLx
	1vQ/WV88EZA7FPL9mv+doAdtuKX5FlOdAiZccZNkw2imuwJh67EbC3JkflurO9TXyA6GRTz3pgi
	015wiFKIVaUgBFjQLPdbRl1g5mVllMv3G2FrtUcNYEmgDzIJmB71fVa536sVswsnSzL5GNQij+f
	Fd07JINQhueCzqbxlZIs3+JbmpwjKQ+AXMU6k3Wdm1HqAD7PtQhCkW0pV33jRRhVol4hOD6jWBV
	0ikFhfXI8TXESOAE/S6AMgrWGjXPFcwdGvSJpfkCMSDUZKYEDLlcjnZcaKvA0JY0bL6G8fFt6WG
	4QrO+2pN7/Y4K3qZrrtkhrzAfQvtl7/ZtGeGf8CRO/YWm9IjRI2Z9j0Vh1e6vbL8SolexXq9Ysy
	Rv2unGtD90XTXjRdOL7oCoDVIQq9qZaHxlFa+61D8b6CPOUm4OfcIY8dLNjGw==
X-Received: by 2002:a05:600c:8b10:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d26dcaa22mr14457245e9.14.1788993649747;
        Wed, 09 Sep 2026 15:40:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a320:8b5c:de4:61f9? ([2001:8b0:aba:5f3c:a320:8b5c:de4:61f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm42197865e9.6.2026.09.09.15.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:40:48 -0700 (PDT)
Message-ID: <cb88917248190287dcd8ec498180258f2dcb7a5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: allow marking a cached object as in
 use without touching mtime
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.haener@siemens.com, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, Peter Marko
	 <peter.marko@siemens.com>
Date: Wed, 09 Sep 2026 23:40:46 +0100
In-Reply-To: <20260909212205.50713-1-michael.haener@siemens.com>
References: <20260909212205.50713-1-michael.haener@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 22:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245520

On Wed, 2026-09-09 at 23:22 +0200, Michael Haener via lists.openembedded.or=
g wrote:
> Every access to an object in the sstate cache is recorded with a plain
> touch, which writes both the modification time and the access time.
>=20
> Add SSTATE_ATIME_UPDATE_AFTER. When it is set, the modification time is n=
o
> longer written, and the access time is refreshed only once the existing
> one is at least that many seconds old.
>=20
> This reduces the number of write cycles a build causes on the cache, whic=
h
> matters most where many build servers share one sstate cache: each of the=
m
> would otherwise refresh the access time of every object it looks at.
>=20
> With mtime and atime kept apart, a cache can also be measured for reuse
> and age.
>=20
> When the variable is unset the behaviour is unchanged.
>=20
> Signed-off-by: Michael Haener <michael.haener@siemens.com>
> Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> Reviewed-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/classes-global/sstate.bbclass | 59 ++++++++++++++++++++++-----=
---
> =C2=A01 file changed, 43 insertions(+), 16 deletions(-)

Whilst I can understand the motivation, I can't say I'm thrilled by
complicating this code again. I'd recently tried to simplify it as the
different access patterns were causing various problems in their own
right. This adds a new variable, two implementations (shell and python)
of an algorithm and it just makes the code more complex and hard to
understand.

Cheers,

Richard

=20

