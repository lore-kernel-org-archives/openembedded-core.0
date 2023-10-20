Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4024C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 14:39:58 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.55969.1697812793229381315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 07:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y8JPmLOk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.172, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so13018701fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697812791; x=1698417591; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vC/TuVTS4fqSqKGuUiaDOLeHh2STOGSsHf45m/yGawg=;
        b=Y8JPmLOk2ntbHCKMr0UHRxmShznLmRmfj/snblRPoZN/fh85cySh7jqxaX0A6lkXZ0
         Ut+lcJbqU+D0Sv9mntWmoS+5neOPfrD/VukXVyFlYLSGuqOuimNJH90W7mJZmvwPP3fr
         p7jQdddl39nRMdvxArLwDXQsKjcKPovrORSds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697812791; x=1698417591;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vC/TuVTS4fqSqKGuUiaDOLeHh2STOGSsHf45m/yGawg=;
        b=gsEU176tOJBwQzbC3kVRk2q2VQ4qrwbTiyV7U9CH+73eOUryf28NLaHKzcAo1doUb5
         423xbCJuEDeZZlrUqNatCXNglCIcOoRwCsi+ge97Bua/CsDlmtP2nb2POXdgBo5bBtG4
         jF95dk69r5DfvN4UnVG9+xis34m6bBPwZHX1rGomobqAXbRHcB6SM90UWk52BuLqL2x5
         dkb3QY0EMKNJz/5OW7ggRegUWNjXCT/XoEmBB+kmohxGOS1eTVy7A0++9rHVOL0xYPXw
         jSUWf8ZuL70TEbkyOFKLl1RS1t6Hs9KS1VFAd2xbMyCko6qRMRTKDsav58Gca1Np1zXP
         LUaA==
X-Gm-Message-State: AOJu0Ywz87Pv+2bodEzVDkVSQXgg0EVzbs4uwqed7VdrivfML7dVOUCG
	nbkgCRXwjwu2KG5WGc13iKj5+Q==
X-Google-Smtp-Source: AGHT+IGy4Xt20PwyusR2ZII05HP/2N0mgNXZ8HGVbEvsAFuJXDcpiNtl0lQLLMqnaWGtrxtugBhd1A==
X-Received: by 2002:a05:651c:221c:b0:2c5:1ad0:c318 with SMTP id y28-20020a05651c221c00b002c51ad0c318mr1726241ljq.44.1697812791306;
        Fri, 20 Oct 2023 07:39:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id b24-20020a05600c06d800b004064e3b94afsm7081210wmn.4.2023.10.20.07.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 07:39:50 -0700 (PDT)
Message-ID: <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Fri, 20 Oct 2023 15:39:49 +0100
In-Reply-To: <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
References: <20231018084652.900785-1-alex@linutronix.de>
	 <20231018193932e6cb99ef@mail.local>
	 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
	 <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
	 <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 14:39:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189541

On Fri, 2023-10-20 at 16:34 +0200, Alexander Kanavin wrote:
> On Fri, 20 Oct 2023 at 15:44, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I did idly wonder if we need to set the sig handler to not use
> > hashequiv for these tests? I haven't checked if that would help though,
> > I'm just making a wild guess.
>=20
> I fired it up with BB_HASHSERVE =3D "auto" set inside the test, let's see=
:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2307

BB_SIGNATURE_HANDLER =3D "OEBasicHash"

is the thing I had in mind FWIW but that should be ok.

Cheers,

Richard

