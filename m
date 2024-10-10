Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05A6CF07BA
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 07:17:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.37827.1728544676068701308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 00:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fv/2TsxT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d3297b7deso279180f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728544674; x=1729149474; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ju0STCYwbedrSM5E5dAxfJP6tI3JadGo2KbizMAQFrY=;
        b=fv/2TsxT0sIoLneCAJWNqeq93OY3PlBzFQD6Jb/MxoWJKF3wrEtjv6Hk8gu8fJcOmd
         95JbgeJrl0MAQ++2+tFVHlGx+xwGr8U0XFyZIPSnEKp0mPGVaglgEl5SILUO+zLKPckf
         iM0R15lLaggqrcHGVkCW0QqPmSsjaDwwR4XfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544674; x=1729149474;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ju0STCYwbedrSM5E5dAxfJP6tI3JadGo2KbizMAQFrY=;
        b=gDtdfSkHQs4tiWMslwHsXOHAAb8XS+f2wAyCFos2YO04aL8K9TuzcC75/RNoaToS0S
         Cr/7w19M8qSkkFBW7uIUOo5BqUg4mwOZBvdwyqyYpAl/6jNcSP5WC4jYGDe1bkXHAD1d
         k8DCNiWBGJCwvyhm0oH4wXeTidHXJ5Ab6GP9NsFHspvFo5MO1wrvm5QWIbvLGOX68Bi6
         Kb4ggAO1JBvASpXpZLbEhLk2NF+2t64C+0Dshxsnl7ftxn1vseLBFBAgd3T++0Ppo0OT
         JRYSeiaTbbV43F7/TlnVwdLZABoofTRmEBUK5dgMtxRQLyYxcjJy9hSRa2MFu6lqAe+9
         KG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMcfrRJx07uRuQjD9yThysPztHu35mQN+Sq6UEfwga5O3ukUtLcHXawHlhdfiCLJpdUuTs3pwUHPMW7vLvv+Viqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz4x7iEIs8kmYpoewsfQVsx8/nH1Py1SsbMBDH05e+s+D6avuT6
	YlpAQNccwcmMlkfRxpO/9U+NwHolSRrjSXeUmFqvN1IumxqBvDjLha7NNDtgOmf6LvO0XryFkoy
	M
X-Google-Smtp-Source: AGHT+IE7DmLV6GEGsoH79x6a/3LKvZ/KYqzucY5uwqmcIT2hatCxd5t7klPukhqiQ92DFwkM5fTdBA==
X-Received: by 2002:a05:6000:109:b0:37c:cdb6:6a9e with SMTP id ffacd0b85a97d-37d3a9b5242mr3515099f8f.9.1728544674312;
        Thu, 10 Oct 2024 00:17:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a? ([2001:8b0:aba:5f3c:a7cf:f342:7de0:8e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b917df3sm692413f8f.111.2024.10.10.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:17:53 -0700 (PDT)
Message-ID: <26e580e6dadced007020601689e3d7a4f2790e45.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix archiver interaction
 with kernel recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: preid@electromag.com.au, openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 10 Oct 2024 08:17:53 +0100
In-Reply-To: <20241010052529.18502-1-preid@electromag.com.au>
References: <20241010052529.18502-1-preid@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 07:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205386

On Thu, 2024-10-10 at 13:25 +0800, Phil Reid via lists.openembedded.org
wrote:
> Changes to the logic of is_work_shared where made in
> commit: 5fbb4ca8da4f4f1ea426275c45634802dcb5a575
> "archiver.bbclass: Improve work-shared checking"
>=20
> The resuled in a change of the logic (simplifed here) from:
> =C2=A0 inherits(gcc-source) or inherits(kernel) or (inherits(kernelsrc)
> and srcin(work-shared))
> to just
> =C2=A0 srcin(work-shared)
>=20
> With INHERIT +=3D "archiver" in the local.conf and a kernel recipe that
> uses
> KERNEL_PACKAGE_NAME. When KERNEL_PACKAGE_NAME is defined the kernel
> source is not placed into work-shared, but the archiver ends up
> deleting the source folder in the work dir, and the build
> subsequently fails.
>=20
> Restore the previous logic while also mainting the referenced commits
> intent
> to consider all recipes that use work-shared. Logic is now
> =C2=A0 inherits(gcc-source) or inherits(kernel) or srcin(work-shared)
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
> =C2=A0meta/classes/archiver.bbclass | 5 ++++-
> =C2=A01 file changed, 4 insertions(+), 1 deletion(-)

You're effectively reverting that commit whilst changing the logic so
it looks slightly different.

Was there a problem with gcc-source archiving as I notice the patch
adds gcc-source back too?

The commit message isn't quite accurate as gcc-source isn't something
which gets inherited.

Does this only happen with kernel recipes which use
KERNEL_PACKAGE_NAME? That might be the key missing detail which would
allow us to reproduce the failure.

Cheers,

Richard




