Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DC2CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:44:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.54797.1697809450128050955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=huuv6/Lu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso6824715e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697809448; x=1698414248; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zaZayzHRjEW93ih4LY+AI7Yz1wpMphDYTsEpOPf+J0k=;
        b=huuv6/LuckUYrDAHAumtcH0X7TvZoJWTIRXtQyTSW8BvGEwVg/E9A4WvY7DB/CORJT
         hGwxrXrCISRKf4/3zQKCqfVjcR0h58On9tjSMlUphDOKfGFiVB22Q5SeAV6Xmyj5f31x
         l4SUVf+0Cwp+SEDaYjkTXXAFHPP9HW3PyeyrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809448; x=1698414248;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaZayzHRjEW93ih4LY+AI7Yz1wpMphDYTsEpOPf+J0k=;
        b=H2PHC+BObAvLRmIfTZbpAUx1m8DL2e77M9jyAJnCcFxRKmxVPjesaNKrGdLjAB+vBs
         YnoY8x+I5947LkIcp4i4xSs6LgOMON+j9JX5hnaTtd2uwd1mDqZlJTe/zhRHLEA5guIj
         EfSq2RyhRxuoJOVryDci6KKa3LGOkKdNjFHdKLXr3zYCa8vLsq28FURpocspbgJXWAr+
         Bnwkzr4axQZCoJuAIpe3xqdG58h1koEvJK6hWq5gpdSrHO2cOMlrWmGUgMdK07Cerp4P
         pOBScj5S7YxELC+V4+rZtG4a6qPimSZU6u4Ck39FOOwoBDp+p+sXd1RUHnJhlF1jEbhn
         llZw==
X-Gm-Message-State: AOJu0YwFlrdAXpgDpvpmVM3/xNhVhkPK1GCbfpeeWmGEujFqlQoEzMmA
	DiWzr5vg0Sxp8xVgxazkf+cBug==
X-Google-Smtp-Source: AGHT+IEwpkjlyFVInYt83VHLsX1u06pVi2X/O1vSruy0JGTntZ3+fbafD/jsAyRFjDtoldwEKtAudA==
X-Received: by 2002:a05:600c:190e:b0:408:55c3:e838 with SMTP id j14-20020a05600c190e00b0040855c3e838mr124047wmq.31.1697809448560;
        Fri, 20 Oct 2023 06:44:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id w11-20020a05600c474b00b00405959469afsm2228029wmo.3.2023.10.20.06.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:44:08 -0700 (PDT)
Message-ID: <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 20 Oct 2023 14:44:07 +0100
In-Reply-To: <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
References: <20231018084652.900785-1-alex@linutronix.de>
	 <20231018193932e6cb99ef@mail.local>
	 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189533

On Fri, 2023-10-20 at 15:12 +0200, Alexander Kanavin wrote:
> On Wed, 18 Oct 2023 at 21:39, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > ERROR: Can't find a task we're supposed to have written out? (hash: e79=
d70b9c2cc72030c1ce822525510699a1eeb1ddf5986271d3217422244366a)?
> > ERROR: Can't find a task we're supposed to have written out? (hash: 999=
250461834bf74545962a8577bc26854a3d08bb2a96140d5efe314e0ef2d63)?
>=20
> This is proving tricky to reproduce. It happens fairly reliably in
> oe-selftest-armhost, but so far never on regular oe-selftest, or in
> standalone local build on an arm host where I run only the selftests
> that are failing. It seems like one of those dreaded selftest things
> that fail only in particular execution order with other tests.
>=20
> The only idea I have right now is to run specially configured
> oe-selftest-armhost which would run only a subset (e.g. just
> sstatetests) and see if it can be narrowed down from there.
>=20
> I'm also tempted to set this aside for now as it has all the signs of
> protracted, painful debugging slog, and push the esdk/sstate build
> registry subject, so there's something to show for it soon.

I did idly wonder if we need to set the sig handler to not use
hashequiv for these tests? I haven't checked if that would help though,
I'm just making a wild guess.

Cheers,

Richard


