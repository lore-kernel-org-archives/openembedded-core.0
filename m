Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564D4C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:01:48 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.8418.1748948501941968886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=Huk+EuIq;
 spf=pass (domain: streamunlimited.com, ip: 209.85.167.46, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5532f9ac219so6155386e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 04:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1748948499; x=1749553299; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voyhcVxDlJ5/+DucdTo2qZQ5Q8yeRjQK3qVbX4fZmXY=;
        b=Huk+EuIqaOntB6Jx5nxHK6GbiSX1PVk7fsq33k9RSGipVSB+n/t+0LQJWbeCNSCtvS
         QxlQPPV94G5JP+iB+EK15ERu+l4rISlL40Bt/o9ubVsYK5kv62SisAmmFDQ9mYtIx+KS
         l1Vzvug1p/zih4XgRVxzWoBs3w5L6XGccjVm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948499; x=1749553299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voyhcVxDlJ5/+DucdTo2qZQ5Q8yeRjQK3qVbX4fZmXY=;
        b=uG0gHrCtFeD2PZbpiEYfmj8hNx1VwRw70lTU72CZOa4RyYiab4G8FkBcxJwxyLSl0e
         MxMqv2ndEcRIL+lTAfO3zhQHfttNXpQRqJizXJl3/iNWqRLVSCsiFUiQuuEmVhpIcXhK
         qW6AMfcL5aebGhPJexnF7vksicuaVmDfpTPuz1/WqmVZ5mmGOz+6vcZI8kZyeoDtk9nu
         eqWm5Hv5CKwPYsoBvmztrv2CbpYKjo3/vLPlDErBeBmF5SIWkPUvRUfLmAb2hx8GonnS
         c5tbyDunj9ETCt4pGXJBCfzGMANFLrgv7Q02U5z/OeMr7wxXddFfQVpOyXP/qlvRAH+l
         uBKw==
X-Gm-Message-State: AOJu0YwB/m4PhmvjDay+fkVD3KE7vgKFXs79Fbpic9Gy2lqDjY2XDMea
	G3jP2EWOqPiQnhfuOqx7XwX4rJMO0tMx121xjEI6UnqQ/OPrxydw96E69Ho7ODOjGSJR1hoVNms
	k+utBt/VKsX68xbW2frWD36kM8w1giVk5TtJiABD7QQ==
X-Gm-Gg: ASbGncsZ9YhKxLrJ5JFU2HB138XLcxtBiqYPhRuywWHfR7Kwc4GXrtVik6XhUz88NMv
	OrYhfVfKLKq+4y5NtyxqlDbJPj9wYgCNJkO/7+6P+t0an5sXQPB/oiSwBOrsTP8fanJXXSLXWEd
	FWAGCS59UuEL2HOklnhbovtkuVxFEMN7vBAfTL24HCyg==
X-Google-Smtp-Source: AGHT+IG0bkEsWxmu8wFIdPAG7fFn7s0CnR4h0CWe82QJ+vWuuDe/Zb1OrzVzWt8JkiFN29OQTLLGUSd+A3Fdmtho0EE=
X-Received: by 2002:a05:6512:b88:b0:553:37e7:867a with SMTP id
 2adb3069b0e04-5533b93b66fmr4685439e87.49.1748948498866; Tue, 03 Jun 2025
 04:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
 <18457EF875184E76.9693@lists.openembedded.org> <64931a5016ab1996877df1d6764faf9e87dc51e6.camel@linuxfoundation.org>
In-Reply-To: <64931a5016ab1996877df1d6764faf9e87dc51e6.camel@linuxfoundation.org>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Tue, 3 Jun 2025 13:01:26 +0200
X-Gm-Features: AX0GCFsBQHCTd-CiGaRxQCRqHD7BnNpZsV3ClVrc00j71doauu8uWYZxJXCl7AI
Message-ID: <CACMGZgYc-31tzF8UuLLhMiuJ5kKA1_UN2t9JXzPG7DyoNJo-bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217804

On Tue, Jun 3, 2025 at 11:59=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2025-06-03 at 10:40 +0100, Richard Purdie via lists.openembedded.=
org wrote:
> > Unfortunately PN could be set differently to that, or set through class
> > extensions so I don't think this is a good way to fix the issue. It
> > does highlight that icecc probably just worked through luck anyway. It
> > would get it approximately right most of the time but I'm not sure we
> > want to rely on that.

Maybe that is why we have to disable a bunch of recipes with
ICECC_RECIPE_DISABLE.

> > To be honest, I'm more tempted to simply remove icecc since it would
> > seem not a lot of people are using it if it takes this long for fixes
> > to get sent :/.

I understand. We will keep using it internally with the above patch
because it works for our use cases and
provides noticeable speedups still.

> Just to clarify, this would then let someone maintain this in a
> separate layer as it is self contained. I appreciate we'd need to find
> that maintainer someone needs to fill that role to keep this working...
>
> Cheers,
>
> Richard

Thank you for taking a look and the quick response!

Best Regards,
Peter

