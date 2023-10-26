Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72309C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 12:10:56 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.68824.1698322249980175653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 05:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HKllhw53;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32d9effe314so572445f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698322248; x=1698927048; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+cJq2s0SaYFYbY9bXYGWaHHK5cfnczr6i/6ekF4LaR4=;
        b=HKllhw53FLwXwLbFh6q+9OqzmADBYHQ0c3qeMEMGQU/OAwBwktzUtjaD1uMtUfHp9V
         jcxjC3mC71Hu8UqrihsGxA+A0RuW/Cb+feswCE2f3F7IOQsk6qu5fkCoKcLJLUIOchmR
         tFEF4gc50KTGVhT1yr8piltNeatmRSHEubvhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698322248; x=1698927048;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cJq2s0SaYFYbY9bXYGWaHHK5cfnczr6i/6ekF4LaR4=;
        b=lSc/lwVQuFrT1LXq6+sOz9C3oRm6ULa7Ku9pxjpx0GNcVFtVeLZbM/eOK4c8HklBG1
         e3WcFIrS4UEMtPUxBFgSvhfLsKubrrX0JWAZoSXlP3dNkiw09/MUcUtISX2UqnfBHpsI
         gUPqj0wDYV0Da9JH324wSPAJ49hfDg14/KG70XskEf/LIYIJYOwBNrKkq88FZDo3XV8K
         orpDwBiOvnKk+EHIbbZbAHGktTyd0oapKOihbZ1D2agXDKyXYC1bz3KASuhH8sDmj7b5
         M4xoLUeu93drqDzVuiiZFrBeyUsc21Xg1a5Hqs+Ts8X4DfonujdGOxFcxo12VXn0xj0Q
         Qvfg==
X-Gm-Message-State: AOJu0YwxZHrgtO58xsQxBnhgnXqiWvsJcSdZ8Dn0EVc5U2/iXFRmRX6d
	oRDtV4qoRERO9uogcNFWqF75eg==
X-Google-Smtp-Source: AGHT+IFB2RQG1cKRvx5fByzGo6ZO0UJmJuTDTUhWhxZ7Rn8LUaCXyIg8LouD7t3exlwaPqhgGPH+sg==
X-Received: by 2002:a05:6000:1183:b0:32d:9e48:faed with SMTP id g3-20020a056000118300b0032d9e48faedmr12415920wrx.25.1698322248102;
        Thu, 26 Oct 2023 05:10:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3? ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id k12-20020adff5cc000000b00326f5d0ce0asm14127201wrp.21.2023.10.26.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 05:10:47 -0700 (PDT)
Message-ID: <3e070cec102dfcb3bcd30b10f445f8b40796ba5b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] selftest/sstatetests: add a test for CDN
 sstate cache
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Thu, 26 Oct 2023 13:10:46 +0100
In-Reply-To: <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
References: <20231023110618.3525311-1-alex@linutronix.de>
	 <20231023110618.3525311-3-alex@linutronix.de>
	 <20231024103345.306b9171@booty>
	 <CANNYZj9NJs2jBKZxhDAAARcdCM+sX=d5Ztt+fzYeCh19dH4wFg@mail.gmail.com>
	 <d1592d8729869060f7226e55171ea7760672aa0d.camel@linuxfoundation.org>
	 <CANNYZj9fLzU0wT9EyWL3hYF7Xpk+F_E9n2i+OmsrWj1qmw+3FQ@mail.gmail.com>
	 <ec16e182f9a2ca5452920f6bbf8d7cdb96bfdc71.camel@linuxfoundation.org>
	 <CANNYZj8+FTOO4cDsPzE_g4Hdfw7qtHvnYvK1WwFYdRRLKhJbWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 12:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189723

On Thu, 2023-10-26 at 13:32 +0200, Alexander Kanavin wrote:
> On Thu, 26 Oct 2023 at 13:26, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > We need to think of ways to test/debug this that don't require runnin=
g a-full.
> >=20
> > We can create a separate target (builder) on the AB to just run the
> > test?
>=20
> But it needs to run just after the task (e.g. world or some other
> which should be dynamically specified) that is supposed to create the
> required objects. I guess it needs to be done with a custom branch on
> yocto-autobuilder-helper which would define that, but then how to
> trigger it through the UI?

We could run the appropriate build and then the test in the next step?
It could be a standalone builder target which just isn't triggered by
default? Not all targets have to be triggered by something day to day.

Cheers,

Richard

