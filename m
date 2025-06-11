Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232FEC677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 09:08:17 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.3191.1749632890534316075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 02:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQAAI2lU;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5f720c717so70818785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749632889; x=1750237689; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jS/u8chY01Ogfsie/Q4NMLkkQTlcdppDcTHQIBvlE4k=;
        b=EQAAI2lUJzp9iSnlZHkBHoVymNydwfMFKhE2VfW9QV+vX/3nLouf33NS0mTpnz+gfD
         W8VYdoHfkj4Y5gArVqLTY00PMKlBjGNJ+FSGlLHYX0+gJceNegZkUKsfxngwd/mswTTw
         6y1EwaUog0Hzv/mdnHSN0QtBFDEwFBlZufePBMX7OCDS8BxkGaJId1TOtg4if18F2KVz
         2RTmQXRnEmOWx2oVlAym568BYUIf2fM3gc/bWRventIG0IS/MLkL/7Jp0DwvX21rlSl5
         VZI6S0CcwlJFk+Ef8L1KLuBZ0yz6cMODn6RbtC1LboceSbqwSByr6sVOZ44JDQPIplAR
         02VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632889; x=1750237689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS/u8chY01Ogfsie/Q4NMLkkQTlcdppDcTHQIBvlE4k=;
        b=Lf75LThSCYuYLavgD/+KpoT1+KzLPGmeJbrEV33r33o9q/H4taYBeNf7mj4gabNdON
         sVAiax+yJF4MvujEiPr/WD2fdRpyd7aVbhM9Ueik59qeGhQquJq3/9cxPrS87Q8MMx48
         Go2ADHX0i3g81FU8kgngPyk+TGliBUnfeODYD4BCulUgqLTqviqvlvDxcnh0XNGLcp49
         +xot6nfx3uyICug0XV1QkC2lPcYQZfbR1/Mw7rLjwICQb+MLh+rhaW0XhqDwMy2JnuYY
         CNlwUKeVj4NnudqdP82cqjJJaqGEX9yXwOpnrnGKvOB/RWUNjiTb63cAHXml1kQmyrlJ
         md1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHvAnLLTv63XcYSQbSvEdd5wOwKC12Xpnsyys09jac4/i8ZEkW8wU/2xR31TpFywvBW6owxZ3qH0/cwJfENmc3/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwEuWwvFfeITiLeAUkGlI90lkUWsze7XnWwsFGoFgbbJw7TtVBU
	d9srvC+Rhrz6UzG2X/0d2Zwr1Zm7MJViePTSbrLi2Z3kwR1+dRGyw9mycjlm22jMRlF77z1dGmE
	wEOvglw1D25zvJXDwVxqG5tTPJWxO05w=
X-Gm-Gg: ASbGnctwnXcV5r7rVCR3dC1tqMYnSU+fHxTYpQFMOWh80gBBq2e6UdnyWjAzx7zXRs4
	frw/BCi8GK9JKHmaaWhmcynihC8TjwdlpP4WL8w1/HF+SZx4VAWV1JzahdXkZq/XHG+a6NcKk42
	O2HR+29NqPxFej9AELx27Od/UUtikuvGpppw3C15z1BP0++GwD5fQmeqY4CtLiYGyfOXSrpjzeF
	jK9T8FsXpPUdNWA
X-Google-Smtp-Source: AGHT+IGLELfzCxKpIx6cE4m39B1iWbNuQMGRUvtjmpZQYh0TYqVYmiaByyMthXaFejklu8MkkvhbtGrqOW+nFdWhQAY=
X-Received: by 2002:a05:620a:2a02:b0:7cb:de0d:ba59 with SMTP id
 af79cd13be357-7d3a8883485mr363134185a.17.1749632889335; Wed, 11 Jun 2025
 02:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-8-alex.kanavin@gmail.com> <20250610160402.888760-1-schonm@gmail.com>
In-Reply-To: <20250610160402.888760-1-schonm@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Jun 2025 11:07:58 +0200
X-Gm-Features: AX0GCFtmmyRcUfhWBRixj2uxQs1OzQtl3AcqSQe-5FjnWoCSgTRUYuWsibKGOLI
Message-ID: <CANNYZj81F-dJwN0w1d05iZC5k7O06Q6A4kwxtB416T1NbPdFWA@mail.gmail.com>
Subject: Re: [RFC PATCH 8/9] insane/do_qa_unpack: add checks that ensure S is
 set correctly
To: Jason Schonberg <schonm@gmail.com>
Cc: alex@linutronix.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 09:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218445

On Tue, 10 Jun 2025 at 18:04, Jason Schonberg <schonm@gmail.com> wrote:
> Perhaps, given the patches that you are posting, your find commands should cover the include files too?
>
>  `find . -name *.bb -o -name *.inc`

Yes, good idea. And *.bbclass too. I adjusted the commit message.

Alex

