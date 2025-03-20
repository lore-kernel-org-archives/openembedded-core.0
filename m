Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39A5C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 17:17:02 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.573.1742491012806093519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 10:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OZpuwDlQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so527839f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742491011; x=1743095811; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2mL6r8fQ2p6IA+cirOlQHLOUFAf0KVeJOGik0CD8tGg=;
        b=OZpuwDlQu1HbPSBSFj/vxJ0wXJf2kiTplydPrVqCr3mNFZDIx1B0iX3oq/0tK4Nx45
         057CpzPBY/tQT4Q4nVLzgiP9y01NINN+GVWyG8gIcrY9BxzLUMCmIDT+W1aYqLafyOAe
         dacUP1OEnQ/UiJ6KZCrSrxvwPhtLTw5itKonA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742491011; x=1743095811;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mL6r8fQ2p6IA+cirOlQHLOUFAf0KVeJOGik0CD8tGg=;
        b=Mpudb/+OhZXP5dE2/X4LnOBAxXEQPsOlry13rDQPyKCiyiUriUyWFL9Bob/m0jncsS
         g1uLOyqhyB0uPUkmQDYphTuT+gf/J6W2AMncMwPsv568iQ3yX55QEpMSVkeId6ufdvPX
         lozpIu5ENFd17jI3j1cChlZaG2syF9tTBJ079jt3cQOFklZ05xbmwfvhrzhrCxCMbaJO
         MGEBoV3p3Xk/hIfZLN1xddNsA92aVQuI6CcApBub2bN8RerKdMaPHBaLEP2rQI/0r6Pi
         +vagHHybhROL1BRuoIGAEnJuoVvhDN5rVD6wKw4lSacJCitRreAkxQ8mUgS8rxViDd3d
         VJ4A==
X-Gm-Message-State: AOJu0YxAb0GYaYN7wn05aRYWh4N18qNYqt/ljNy83TWFbBcA4npBgaTn
	5UNLFVQjieZYhHNPDqbcE5meGIjWubXGxD1CMsYOYkrGy4kp8Ge044xpnM0vjkQ=
X-Gm-Gg: ASbGncuMPkZ8M6CsC9bi4O0JUeHXSErtWlhudZSQuQA4FuScw7DNn0ANq+Zi9QR75Ka
	2et+51D9OqEcwwlqppIYwR1clcPnGxgeKJllgZtVIfc+urePoFjtLJve+BGFCe5QqwStakgdryA
	uHWgHhG9RulUQ3wxyn/1rdLh5c5Rw/XkGTT1ZK01Jlos8fRTQZ1tqmzMu/HJhcbf7RalX91YciA
	imeDPChlAgj6LTG3E3pMiwx2Dq2XeygZ2yzONIAFVP3v0WTFLqc3AmKvAA6FHCk4SnqKH9dAiIM
	pwo+kmNOKoSx65ZiWTssIh3A062gY+W86cqTu55bSssfUFJHmImA1U9tZPmGtdXds/IpZN/PSvY
	PiLX9tjYpNeygqyQHofS5uuKPRB4ezJKU3Q==
X-Google-Smtp-Source: AGHT+IGKO3lv2lsIy4qbfliT2GQjf2rOkOooE0SUJRf3aQqEpcG8sWch7o9DcvMxtooFa7jUybKrqw==
X-Received: by 2002:a05:6000:186b:b0:391:2bab:d2fd with SMTP id ffacd0b85a97d-3997f94d8f4mr280238f8f.37.1742491011015;
        Thu, 20 Mar 2025 10:16:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ede9:63ed:996d:ca84? ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5391sm151388f8f.56.2025.03.20.10.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 10:16:50 -0700 (PDT)
Message-ID: <d3f1a6601b2438007a963b69bf41d647672f78eb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cargo.bbclass: allow to avoid appending
 PACKAGECONFIG_CONFARGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, Jean-Pierre Geslin	
 <jarsoper@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
  Bartosz Golaszewski	 <brgl@bgdev.pl>
Date: Thu, 20 Mar 2025 17:16:49 +0000
In-Reply-To: <182E91CCE4A2B275.19116@lists.openembedded.org>
References: <20250320165517.129442-1-martin.jansa@gmail.com>
		 <182E912DEB60EF95.20788@lists.openembedded.org>
		 <CA+chaQdD7i8xjuz9iPSNMfETo-5BNxsN=LibdZPrgdTYatccfw@mail.gmail.com>
	 <182E91CCE4A2B275.19116@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 17:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213421

On Thu, 2025-03-20 at 17:06 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2025-03-20 at 17:59 +0100, Martin Jansa via
> lists.openembedded.org wrote:
> > This 2nd one was supposed to be sent only as RFC, but I forgot to
> > update subject sorry.
> >=20
> > And this version also has a typo "=3D ?=3D", will send v2 if we want to
> > do
> > something like this (reverting the
> > https://git.openembedded.org/openembedded-core/commit/?id=3D16745b20452=
de60ae2474433cc1a2fb1ed9f6a64
> > is imho better as it doesn't respect the original author from
> > https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653=
.60232-4-brgl@bgdev.pl/
> > and with CARGO_BUILD_FLAGS_PACKAGECONFIG it's imho more confusing
> > than
> > useful as the default)
>=20
> I have a strong preference for not carrying things like this. If
> there
> are existing recipes that break, we should just fix them and move on
> rather than letting the past dictate the future IMO.
>=20
> I'm trying really hard to simplify things where we can.

Martin pointed out I was misreading things.

If there are recipes using packageconfig in RUSTFLAGS then this will
break that. We probably do need to revert as I really don't like the
alternative variable mess. It does mean recipes will specifically need
to add the flags to the carbo build parameters but that is the lesser
of several evils IMO.

Cheers,

Richard

