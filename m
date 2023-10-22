Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A752EC0032E
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 11:55:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.97171.1697975701663016595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 04:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f0ALY4fT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40859dee28cso8177825e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697975700; x=1698580500; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iq2noBXDkZZLb42Zpcp02WFjKuVBcujC8PplQubDBm8=;
        b=f0ALY4fTJg62tCDTxEuFxQrvdcErdMlm52KrldH/oGTzG0BpBa5iCzZWOalY8hAk6P
         VDaAbk7qR3Lw6/X9ApTVChvi0xqTRPHPYUoxw8NAa3eVykNZ3BvHfDKkZOhL+dxqq4ye
         jvrk1ujHp2y630gsASdhVe8WkP8sUs3jDBxLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697975700; x=1698580500;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iq2noBXDkZZLb42Zpcp02WFjKuVBcujC8PplQubDBm8=;
        b=oHQUuIWkLPR3Bet7wnN+/Cf77JQM8MnMbXCaGkO9/jUM5P/ScMfCYbBAFotT4I/Cx2
         FC1uYku22Ynv+u1filnT67N3tfeK1pDzo3h7epgDh2k/sKkWc90Zog2zroaTiVOCpi18
         yRVTRshkUh0jcqewY0kMT24ZTlwrZ+6L0G9w3X9+FSyO4IG+LCoLtc4Y7/5WtIfdumnn
         bLVQJFBEW5Bvul6faZr8+zDcnFf9WKTlu8QGXYZwuG0IN/P1Ukd246OtbTW56tBAI+07
         ZZXe4WUWXJucpJP7+pVl+rcTmP4PjjceC/14m+esvR2M/2+hDkY/QG2kfWmPRFiAU2+T
         WUUQ==
X-Gm-Message-State: AOJu0YxMmhagGcxbiWhUvJwuWLhUTyKMpF6Y43MFcnSffJOtX/2co/Ah
	XUokLnR4nGFFeIOlZodu8DzU5A==
X-Google-Smtp-Source: AGHT+IGr0O1WrNXozMvyFVx+rnqoq0gQDc3fj45PRt499DSWHjNyooqYHisO7yCn3SofKjM+EaygDg==
X-Received: by 2002:a05:600c:3b9a:b0:3f5:fff8:d4f3 with SMTP id n26-20020a05600c3b9a00b003f5fff8d4f3mr5167395wms.7.1697975699966;
        Sun, 22 Oct 2023 04:54:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87e:6521:7703:5a40? ([2001:8b0:aba:5f3c:b87e:6521:7703:5a40])
        by smtp.gmail.com with ESMTPSA id je20-20020a05600c1f9400b004063ea92492sm6897406wmb.22.2023.10.22.04.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 04:54:59 -0700 (PDT)
Message-ID: <8614ecbc167a87768f710b5f1b43c26221aa3202.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Sun, 22 Oct 2023 12:54:58 +0100
In-Reply-To: <CANNYZj9psB-6JEaKp6HyBbGy2VTHxn8DQ8MsRweGYJYLo+ikfg@mail.gmail.com>
References: <20231018084652.900785-1-alex@linutronix.de>
	 <20231018193932e6cb99ef@mail.local>
	 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
	 <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
	 <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
	 <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org>
	 <17906BBEB8B5FFF5.20272@lists.openembedded.org>
	 <CANNYZj9psB-6JEaKp6HyBbGy2VTHxn8DQ8MsRweGYJYLo+ikfg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 11:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189602

On Sun, 2023-10-22 at 13:52 +0200, Alexander Kanavin wrote:
> On Sun, 22 Oct 2023 at 13:52, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > > > > I did idly wonder if we need to set the sig handler to not use
> > > > > hashequiv for these tests? I haven't checked if that would help t=
hough,
> > > > > I'm just making a wild guess.
> > > >=20
> > > > I fired it up with BB_HASHSERVE =3D "auto" set inside the test, let=
's see:
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/=
2307
> > >=20
> > > BB_SIGNATURE_HANDLER =3D "OEBasicHash"
> > >=20
> > > is the thing I had in mind FWIW but that should be ok.
> >=20
> > Seems like that ('auto') had no effect. :-(
>=20
> Hit send too quickly. Should I try with your suggestion?

It is worth a shot, yes. One causes a local hashequiv whereas the other
disables it entirely.

Cheers,

Richard

