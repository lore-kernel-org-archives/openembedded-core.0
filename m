Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B02C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 07:18:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6837.1753168679161386731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 00:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LC0TzYuC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4563bc166a5so23666885e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753168677; x=1753773477; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AkUgTAJj3hWVG1sCVyDg7OoPVr/6eRIL+Ah8frfLHc=;
        b=LC0TzYuCBZRBN95Ssx0XPvkAkKtgiBc1GTTlNb/GhMFYwmlla5y7H2WJ9Ztnb4jJRy
         6INvXi+PxqvEco2NDpDyq4ma7vMWLZDktoziFmDofP2BPSLlJax1kRZY46xuIj/Ti781
         c3yw883F7EzkDnxkmVrgAy4HBV1bkCwQW1gBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168677; x=1753773477;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AkUgTAJj3hWVG1sCVyDg7OoPVr/6eRIL+Ah8frfLHc=;
        b=p1T5eNwMR6/cbsbj8dnG0b9748qdU8Uc2zep4xJYGYTyaTG6cgl9xTQmbGkFoNSoch
         WAcWJ7I28qR89fLnclMBfiG+i7ZCovuvvSIqBP+n15F5hlZpeNMRaolg2HF4waDdu+81
         dbIqJ8d18oCAu9MnnKUvb7CqTQPZSfIN8kcOMOKYVGLf2v+RxF28jy4wWIPo3OKT75kx
         53COKHG7XBZXauRG0/ZVA96OreD4ZIowb0gc7Z7L/QCXbYweqXBTHM9NPwv8GcyXKZFv
         NynXBGglRoUA+ayaVbcP7kl8IBk8xS/d8bt7ga/F7BZZH5j8mQMetHdn8dzRg4KNT2kv
         nwUg==
X-Forwarded-Encrypted: i=1; AJvYcCUqojQ2XwANyDS7wHYKLf6Klgs474gk2YZ1UfNM6jYwL93W2JNQbz7Gqr/Asspta4ADYCBPCkBNchfbaX3a8iyxTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyh+NPChVj4twDW/gLdnnpsm9JOYLA76jDVLrA0OK3aQImuEy4f
	DChNdDj289jYZW4DyyGGfjjiBQf5zOiD+Pb8ZrvuODjTvPE348ErRFdWoOYyf8gi6sI=
X-Gm-Gg: ASbGncsvb4YBf9aSnNq1tfAEgK1zpejMiwC+vXG3P2xyigaklFhOlnP02WcKD7c+tn/
	2lGdAblAwv8DcUZxZkpDh5rH8yBDIKUjL43wwfKHOyb5F9KrHZKgd6ZhtApZ5wi59Ao9s2LQBFQ
	6XIG2Xty6dmaWCL0A+c3AtPO2B2jRYpgy2HGruFDhsMWKrFlo37yLlz2P3WldI/aED7ANlnmxZ/
	r1CBP2Lb5wB4lraZRiKDdOGSwZyWWJZk+Odjk299hixL7cvpBRPz/QX0sNZhn1lY1+V3gemt96l
	QVu1ATQle65k9o5e5SeiEOmCJ2maejZMQy9Ms5IFDKXi12LAUVQ0nKl4p+9Zlixg+Txto1ONFVY
	ZSr8LqXP59zdfFpb14a5Cgp37g7y/Xtj2YQ5tJmVbcu/BSr2EFE0JAc8lL6rLlHYxWR1MBxWnfo
	ueIKThDLJJ
X-Google-Smtp-Source: AGHT+IHej1/t4FEj3Fd931RRTnl++1p1/k7ozX55AArqyM4csFgKCEBgb8CF26MyTWMTsLSzA3IGog==
X-Received: by 2002:a05:600c:46d1:b0:456:23e7:2568 with SMTP id 5b1f17b1804b1-45864c16535mr7328895e9.13.1753168676810;
        Tue, 22 Jul 2025 00:17:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d90:ed57:78f:a937? ([2001:8b0:aba:5f3c:7d90:ed57:78f:a937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2bc6fsm12746150f8f.28.2025.07.22.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:17:56 -0700 (PDT)
Message-ID: <70ca79e9b3c8bc151b21951d710f21b5f66dcc36.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][walnascar][scarthgap][PATCH] xserver-xorg:
 upgrade 21.1.6 -> 21.1.18
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vijay Anusuri <vanusuri@mvista.com>, 
	openembedded-core@lists.openembedded.org, Steve Sakoman <steve@sakoman.com>
Date: Tue, 22 Jul 2025 08:17:55 +0100
In-Reply-To: <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
References: <20250701103252.6703-1-vanusuri@mvista.com>
	 <CANQUz18dZfkQWXPC9ZgVc-VP86Q3-pPcpHL31K8PbTF7k-17Ng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 07:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220721

On Mon, 2025-07-21 at 12:45 +0530, Vijay Anusuri wrote:
> Any update on this ?

For some reason I didn't have the email at all. I did pull it out of
lore, testingit and it is now applied.

Cheers,

Richard

