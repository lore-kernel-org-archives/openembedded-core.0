Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B4BEB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 06:59:59 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.12461.1686812395167088206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 23:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Ny0nc4iY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so10009018e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686812393; x=1689404393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dfNBOjxgBhqv9U0SEYUU3U+8Waz6+sN6gjg4RTODOlQ=;
        b=Ny0nc4iY4BIRSayfsvvQIZYX3moPRxT9Vja44dGrlNNHZ6UmY3nV0Yp2pf4xKHsotF
         JmdXdXzFpcIavoC3fZ3+1a91/RA4wdqI85YELHpFxVdacHG+uCK0B7w/BG/xzi098eVA
         7NdUpantydYhPTgFWLcX0g0KMDtj/eKGHvH1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686812393; x=1689404393;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfNBOjxgBhqv9U0SEYUU3U+8Waz6+sN6gjg4RTODOlQ=;
        b=enSu1mI4nsE/b/1BG09KaxZSXyYqQZR7h7M/yO51eLIilv/YTTdwTm4IHtjOaOZ2Zz
         PvrYGRCHaj0ZCqyphSS+V1fh+6yM5U65dnAJYMG56UzOnle8S6DILUYoR13sRe4yLERC
         BGzSkezJUXo1F7fC4Kcv1o5tbrNRccWH8vtGQqRy9hpiwHj0YSpl6nwSN4896BCQa8I7
         nw2QmMvtrGiUTPJ1qrfBHKleqaTT54n3hgL7ivRZidIEo7Qe+T2skl5CkIwDaIWMhKva
         vw8SPN2/J3TogiXLEk65VogQ3RxCTzVwlaFYVwcCK1wxth8e0KO5YQd28rWXRp3P2/yj
         T34g==
X-Gm-Message-State: AC+VfDzNKWsSGJtv4nRzfldogA7MX3nmtCS8+65rfYei1V5mfuqoluc4
	1S8UG+95z2Q2sPBZQbcErMS5Vg==
X-Google-Smtp-Source: ACHHUZ4aurOHgffi7ULmMGXRgNqQifAd8NerH1daLqFKtcqw0diQUvRjMANSWsN8xWDsFn+NszTt3w==
X-Received: by 2002:ac2:555c:0:b0:4f6:1778:903a with SMTP id l28-20020ac2555c000000b004f61778903amr10088725lfk.7.1686812393053;
        Wed, 14 Jun 2023 23:59:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1? ([2001:8b0:aba:5f3c:441c:bff7:bd09:d1e1])
        by smtp.gmail.com with ESMTPSA id h8-20020a1ccc08000000b003f8d80ecc5asm4334411wmb.12.2023.06.14.23.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 23:59:52 -0700 (PDT)
Message-ID: <f0d0d2c8dff6107b433e868a797685fdc54cfcbd.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto/6.1: fix intermittent x86 boot hangs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2023 07:59:51 +0100
In-Reply-To: <20230615031608.29371-1-bruce.ashfield@gmail.com>
References: <20230615031608.29371-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 06:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182831

On Wed, 2023-06-14 at 23:16 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> The commit in question appeared as -stable backport in 6.1.28, which is
> where we started to see intermittent boot hangs on x86.
>=20
> Richard noted that others are seeing this is well, as can be seen in
> this thread:
>=20
>     https://lkml.org/lkml/2023/6/13/1460
>=20
> We bump our SRCREVs to pick up the revert:
>=20
>     947f660bde07 Revert "tick/common: Align tick period with the HZ tick.=
"
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>=20
> Richard,
>=20
> As requested here is the revert of the x86 clock fix that is suspect.
>=20
> You'll need to restore the other dropped linux-yocto version bumps
> to apply this patch.

Thanks!

I don't think 6.1.33 was sent out publicly and isn't in OE-Core yet.  I
couldn't see it in your public branches either, only 6.1.30 is there.

I hacked this patch to apply against 6.1.32 for testing purposes (and
included a version bump to hopefully let it build). We can work out
what I suspect is a missing patch later today, this hack is only for
testing.

Cheers,

Richard

