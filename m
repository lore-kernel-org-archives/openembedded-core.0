Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36D2C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:19:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.53463.1699276786760311476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NZOcwDZd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40842752c6eso34358325e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699276785; x=1699881585; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bg9xKPGw3pSBdnfCDc1cbyjNBMPJjzoAIz7DxkfHoIw=;
        b=NZOcwDZdbg/ROP3fHfxlJXaf570qSaPSmNti98a+lJcUADtU+2XSq7CcB2eSj2rLca
         0go/GbOhfIwKSgZ6iIKHj0AyUotjjkEFBsKYNDNKCaTr8nX7ZP7aceSlR16JF/n5ItkZ
         mTK9agd1xgDRdA1FNoNV3Hkdly8aIqosQiDkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699276785; x=1699881585;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bg9xKPGw3pSBdnfCDc1cbyjNBMPJjzoAIz7DxkfHoIw=;
        b=BflzKbN9XfCYSyLTYT29Y3Wyc20OIfeuyAxhOswSXBgyWEVoLsoT0FjEX9sgdrbsKC
         cYCpINvJQE8jLxK0mow+1TgJyZuGjZLdSsT2O2ZbJ9rHtXkOaZUbf4EqYzBU4DXPz87h
         EBXVWo1JrZu/hYUcYpFFw2TxoVXVAN60HHbaaPMJVasvOl56Cuw8TO3Ks5gOxi43B179
         cAyis7LRvbtLSLSSArfuYk7nB2vTaC42UYIOzIKHzWitbVPYLvCJuMAbyC6FailuwEzA
         1hk0HR8qG6zNgXz3TBQpvyhGnGzX5m36GXugBO/LYXpv4cR5lrxd8uH6Wb29eXklQRTz
         PqHw==
X-Gm-Message-State: AOJu0YwqwIkWk03bzd2Kwnh9eFthysnRo8A4RRURI0I8mwbhtp6MdDor
	07gMc1h0ds0Ty3zWFzNyiwLHPw==
X-Google-Smtp-Source: AGHT+IEaJOEbDuDqY3IRj7717rxkpvV6BLUnIlrBUIqP/7eo6xtcp/Oc+G0XOrxwnUOahlZJ0w6dTg==
X-Received: by 2002:a05:600c:44c:b0:408:49cd:ebf7 with SMTP id s12-20020a05600c044c00b0040849cdebf7mr23313768wmb.22.1699276785036;
        Mon, 06 Nov 2023 05:19:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id du15-20020a05600c634f00b00405959bbf4fsm11928936wmb.19.2023.11.06.05.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:19:44 -0800 (PST)
Message-ID: <c4b8b6b436edd2937e1e8f0f6ac5ab295d0ca2e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 06 Nov 2023 13:19:43 +0000
In-Reply-To: <CANNYZj__C98+yFQ54Fsr8HqNL7xaLri6AukWfL0O4CK0in8t2w@mail.gmail.com>
References: <20231026103320.2751277-1-alex@linutronix.de>
	 <984be73de92e191166e9dddf95aa9861f346ddcd.camel@linuxfoundation.org>
	 <CANNYZj__C98+yFQ54Fsr8HqNL7xaLri6AukWfL0O4CK0in8t2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 13:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190215

On Mon, 2023-11-06 at 14:07 +0100, Alexander Kanavin wrote:
> On Mon, 6 Nov 2023 at 13:48, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > This highlights two issues:
> >=20
> > a) Why is the single sstate siginfo file gone? The most likely
> > explanation is that it wasn't accessed recently and was deleted by the
> > cleanup/ageing code. This makes sense since the code in question never
> > downloads it, only checks it exists and uses that as a marker. Our
> > usage "accesses" are in a different codepath to the parsing check.
> >=20
> > b) This means -S printdiff doesn't quite do what you'd expect since it
> > doesn't skip "covered" tasks in the same way a normal build would.
> >=20
> > To reproduce the test failure you should be able to just delete that
> > siginfo file from your local sstate.
>=20
> It is tempting to then not use the 'live' AB cache, and run the tests
> against private synthetic cache like the most of the rest of
> sstatetests does. Should we?

These tests are already very very slow and slowing down builds overall
as they're taking 4000s to run. The reason is that unlike the others,
they force a full build, probably due to the hashequiv disabling.

We need these workflows to work in the real world and I think we need
to think of better ways to fix them and make them more performant if we
can too.

Cheers,

Richard

