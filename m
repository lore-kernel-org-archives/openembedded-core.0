Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A978CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 10:04:57 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33711.1779789889588052844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 03:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U43mm8Nf;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e63771eb0so104044641cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 03:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789888; cv=none;
        d=google.com; s=arc-20240605;
        b=e44x5I1IG5BawkPWqx/CClMeA5ZGAXl3NRkarmfwPcrFc7QMdz+dzIN3ErPipMN8qe
         fj0OCo6+jwq3NfQe0nA49IngqvvoLkBQKMIYwFoIFZ/HpDYCVIg46n/flIVQoQyrtxeY
         7wCCGufVK2sl26lLtEZf9fqH/xWw5YoBQ2MoaWX6rX+N1py6nCf9u2ouRdqQhlc3yIVe
         yZjYkkhg895BZAtc/hDfvca0kix3SJ7jyxRD1HLphs1IqkEgRW/pa+B1LXOgt8vuHHld
         HxNamUqczUvNEFYZeKqmNdMiDVd0JG6qa2IyI2WGOYyok6zg4WKGk535xklgaYuy7FX5
         Wyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPo6h26TRdKYEejV73OUVD39qASIiM14JIdoZaajsSA=;
        fh=Yflg8unU9bcBi08/SVEWSmxdemOKe0RSHfZNxaY44fQ=;
        b=HRxbfVNYftMNtUYg3bIsKCCcHYYqQ/JrJByvL8NgPq5LWnyme3+7kbb8JGMeHXe4q+
         YAzwt9JZujOfr5MEDVflV0uiYAXuoXW0779b2dIBgrSTrr23ocGwR5Og5sJ4CYMExVD8
         F//fdIVAF63LC9a2ZZfvVyiscPhWEr9Dv6Fvqg0NtXgsq8SlD6bRTtvMj4f6cFG5wrRe
         c0f3SbZGXb8LwTXz//jj373o7MMbhy32WbqwB7BshXXfnQGK8pPeYzR7CopqxYvzz8/x
         M384XSohKo12Ef9hkokfXUYnyLXpIlIC2o20poR3tH/E5u2JzNoLwS/29C3GeULbV1aZ
         NyUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789888; x=1780394688; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPo6h26TRdKYEejV73OUVD39qASIiM14JIdoZaajsSA=;
        b=U43mm8Nf3xKdm1ZS52A4stXROQgJv1KjQDdB6xGB+AyNK/RYeD7SxjWXgU/msPtv2+
         o72ck1Seti2H1hS8KsRpeu0tPefTiBprVuxdQyqsFGSkJkOzD8pIOyd7T04GO5rj6Fbq
         +bE3svB7rkIOfPKMN2WzcBAbik2fOZrF8JT8+RFKFcM5XiSDHeABR8t5/tpfZAjlVU4n
         Ra9Z/Cuj7H6fHBpCjFT/A8OZvF0u7XyJYL+pwBync5vBm/2Ra+HWJQyv4ghaSlUPOUgE
         muO/qX8mFixtVkBW8i/5hP7ZKjHWivQI93bJ5JnYMpfqrru1bUE5TZy4S2XHTfiwl6NN
         QZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789888; x=1780394688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPo6h26TRdKYEejV73OUVD39qASIiM14JIdoZaajsSA=;
        b=X8mFdhC4ZvzdlEpFj19F0rjARGLtFAWndrNBCvheSH6fqgcR8paAKijOzhSWMuLYHG
         HDKNwGLsP7bPLv56NUFYyxZAUO+xagtZu1QFmJ+BxOJ1a353Ewu4XiClNBsRs+BvErVn
         XVoXJfPH3TIzNO1mupIriJzHY3SEWPtTZlLdnhmKhrT2Ruo20u8BD7wsAmXIL8+M5DE+
         UKQZFMIj4XES/t8z2d27uVSi2QQIzjmlVpL2cFgHvfCWdXvyi6oOeBx0qWM9XII2yqMu
         3+nABcwdvqlerAgU4sPQnL8Hn++qxJwF0u0P+j4vxmHftuZE3xjcKWYRWO0KAuPna2IL
         aYpw==
X-Gm-Message-State: AOJu0Yw9PER6ie1z1MLTbnmhlzYemgfumJvwuvczzmS6Nz8wNSC0lgSS
	CTSh1e1sFOkgVa0y9nOfwrhDW5wcWtQmlfz0tiCx2Qwm2i5SauwwXC3DLvkRXcrpykrUI/L15eF
	+b93Sj7ipGr/Hj4sM6mRZfOJquj2kEf4=
X-Gm-Gg: Acq92OGGCbYVHZgBaacOC3CtzcWzFWQs9mMLoWQeBnhlZqbVCutf4tR0P6gVNB9eVJ/
	9dLdLWi76znAmClYMjl8sj00/ItcB4Jdjx/P+D5dX2Tf1zBDGbawXaKBYVH21SDySSLltf9wdA6
	RglvTQXdiU2ufGwc7gv1id8/Iw0amBXMRNKBXSxovVM94pb+xJhJjitAVNHdqFwwz3FcHEpkkqm
	siOchR9ABDn80hHrDJCX/4aOqiE2uZVNjBS6x2lLyic7S5OIEXOPIuMcMP/Bvejfxd/vN/sLQjd
	1DO4tg71U2cAz1s5pHGm1R7OXt4056PCCutiTlLUGw==
X-Received: by 2002:a05:6214:212d:b0:8ca:1dc6:9e23 with SMTP id
 6a1803df08f44-8cc7b59a3fbmr309695776d6.30.1779789888524; Tue, 26 May 2026
 03:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260525013402.3744277-1-rong.fu.cn@windriver.com>
In-Reply-To: <20260525013402.3744277-1-rong.fu.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 May 2026 12:04:35 +0200
X-Gm-Features: AVHnY4IpGmE6blqB-Y4pwmR9-xlBs5cYum4oaC30WQAEYCfvee8LPvXHDlEeC18
Message-ID: <CANNYZj9RnX0Q=eGSH_6SgNPX6pS7PtE9Ri5DwfnMgQMgD7eXJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perl: Fix ptest failures
To: rong.fu.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 10:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237594

On Mon, 25 May 2026 at 03:34, Rong Fu via lists.openembedded.org
<rong.fu.cn=windriver.com@lists.openembedded.org> wrote:
> Fix ptest failures:
> /usr/lib64/perl/ptest/perl_langinfo.h:8:10: fatal error: xconfig.h: No such filey
>     8 | #include "xconfig.h"
>       |          ^~~~~~~~~~~
> compilation terminated.
>
> ../../../../reentr.h:124:16: fatal error: crypt.h: No such file or directory
>   124 | #      include <crypt.h>
>       |                ^~~~~~~~~
> compilation terminated.

Can you please explain how to reproduce and observe the issue? We do
run perl ptests on the autobuilder and they do not fail like this. Is
something enabled in your build that standard poky doesn't enable?


> --- a/meta/recipes-devtools/perl/perl_5.42.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
> @@ -104,6 +104,7 @@ do_configure:class-target() {
>      #the others in config.sh).
>
>      sed -i -e "s,${STAGING_LIBDIR},${libdir},g" config.h
> +    sed -i '/^#define.*USE_CROSS_/d' config.h

This also needs to be explained. Why is this necessary? What does it
do? Does it affect perl build in general, and how?

Alex

