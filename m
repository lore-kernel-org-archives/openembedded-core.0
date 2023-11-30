Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFCCC4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 11:21:12 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.70042.1701343268538677551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 03:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OPrTyLe1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9ccf36b25so5290931fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701343267; x=1701948067; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eZr5sa22QCJUdih0EzcasDSgTvKvUJ/tmGxlpWteUPQ=;
        b=OPrTyLe1d+bqMoPqJdR5gc8KLlGuv5qRlcERT50GxoHYxRV8EhqCF+9KU8Kl2fy0/6
         pW4vcvyNr6zZqJqQsOweiB6Vwmd7wSvHXxoUvQsQV3NkJ8zj7bCaBmIePxbaHUIjsXaZ
         naR/SOCB/S2tALvcUjKx2Kp9oaKmdSgtzfHrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701343267; x=1701948067;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZr5sa22QCJUdih0EzcasDSgTvKvUJ/tmGxlpWteUPQ=;
        b=icwzFT1oPc2tLmxRa/9+rAENlMSAR/BBg4MihVgpivZzpKkjTIjIW8DvUCG6V+hrAu
         hPb7Rp7+FXw2EUUcoE963PbhZ1vXZNmzQUA1gztRB+mQYTu30sarUCoYH7brMMNTZcEg
         BWEiowEeNqpZtuFWLsn3mJol0Ye7q+1n8iYhn+yewfocsdFLGEKB3jMpFOm/Mvg9mmmw
         DC5s3DF6AP9aXs/m+Wsmbuz83+CNVXMIwQKj04LV53lMo43jkF1h7PUmlvxIbT6UUbjw
         SdNnyM1RRoZ/o9BWnk5xiMZ4deIVLuM3fG+F2xgn2y3wE4pABYNbGvk1znpOTWEKwKhU
         mmwQ==
X-Gm-Message-State: AOJu0Yx5RVv6WAMNKgfG9zZokj2XCr8N8pLoO3oGFv3tHFh3M1H5oDEl
	Nub/ViT/u0+/tGo4W3Z1NqFYYw==
X-Google-Smtp-Source: AGHT+IHHAMZZzLPNYc0XznxRRUxj1bdOcUMiXJ0/8ROId00bSLn4p4H0jQyf7k1N9h4//8OEEc0tbw==
X-Received: by 2002:a2e:87d6:0:b0:2c9:b84a:2a71 with SMTP id v22-20020a2e87d6000000b002c9b84a2a71mr5743855ljj.51.1701343266479;
        Thu, 30 Nov 2023 03:21:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf? ([2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b004094d4292aesm1671543wmg.18.2023.11.30.03.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 03:21:06 -0800 (PST)
Message-ID: <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support
 conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2023 11:21:05 +0000
In-Reply-To: <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com>
References: <179C617DA6240870.31732@lists.openembedded.org>
	 <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 11:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191498

Hi,

I saw some of this discussion on the systemd-devel list so I'm happy to
see patches to sort out the configuration on our side, thanks!

On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via lists.openembedde=
d.org wrote:
> Hi all, I sent this patch to start the conversation, but I guess
> PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES
> before this can be merged.
> I tested this with core-image-sato after enabling systemd in
> local.conf. I then started:
> $ vi
> In other terminal:
> $ kill -SEGV $(pidof vi)
> $ coredumpctl info
>=20
> Before the patch, I didn't get a call-stack with symbols. After the
> patch, I get a call-stack including function names inside
> busybox.nosuid ("read_key()").
>=20
> This is a very useful feature for debugging and/or bug reporting, so
> I think it would make sense to make it easy to enable via a
> DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO=C2=A0was not a
> DISTRO_FEATURES in the first place, and whether you would be willing
> to enable systemd-coredump via the=C2=A0MINIDEBUGINFO=C2=A0DISTRO_FEATURE=
S.

I think we should make minidebuginfo a DISTRO_FEATURE and then key all
the tweaks off that.

I was looking at your patches and thinking we might want to enable
minidebuginfo in poky or perhaps OE-Core by default too.

A test to ensure this backtracing works and stays working would be
really nice too! (whilst we have the context in our heads)

Cheers,

Richard

