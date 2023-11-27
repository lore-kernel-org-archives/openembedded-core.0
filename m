Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1996EC0755A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 16:44:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.99686.1701103471329489566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 08:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OSURgG03;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3316d09c645so2947927f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 08:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701103469; x=1701708269; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DssRdUr1j8BAu2+MqKXJh3EyrhqMoqiW39JkM67S7Dc=;
        b=OSURgG03f3LROE29LLbN0Y2AeOPLd/phLT30wLn/iObuFhq6PFqHwcYkmx4iT2IJUe
         doEPPpgJFgXZxSu0WGSSdoqLJ5I1pephWUggaT3K1Vcg5LUwlE7nGBE7MexL2Sbqg/cE
         nd/Oe1czLyKbFb1kRiHgeeafFtrXJc9GuV/6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701103469; x=1701708269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DssRdUr1j8BAu2+MqKXJh3EyrhqMoqiW39JkM67S7Dc=;
        b=ruartrpd83HJ9ZviSrTHoFaU3/X2V/vJF5IWYOR/56LtnzzDletnvMnTkOwhEHqklg
         mCvSAK+KLTYpaaKh/sdJpNdpV0oGLYjlsjD/lsv+babX6d+boAXKRlZdDcdhuGyprjCl
         00grFxm0pPkJyH02PWPkXduPeEwtYR0jF881eqFpJfg7enHIqn2Md2CSuEfqTQfNTgkN
         rBJo5IfVRr+dbqGuNsHAKz3oPZ7HcorB08g8LXe9kmNA+vBlgYRPh8L1u9biYBXtvHZU
         LJ38oeHOVvJ51pZjvsv6nUqjAloQN9lvhRvMH57OaBwrtqKfhet6mMXwgMofZ7VevD3d
         MJSw==
X-Gm-Message-State: AOJu0Yyy/6h5Q1h/tQAQdBJ1zzth4gVWk4yWs2YDCVkfobiVwHLyc+k+
	7im5kZns5aPsnPbcLnggdLGO0A==
X-Google-Smtp-Source: AGHT+IElOxpLDXRcGNDEQZTDIKnJVEznacjROdsTcBlBFM7ICIeWDo1ifcg8DME+8wITuDQLgvtc4w==
X-Received: by 2002:a5d:6786:0:b0:333:1a5:f54a with SMTP id v6-20020a5d6786000000b0033301a5f54amr2078972wru.27.1701103469514;
        Mon, 27 Nov 2023 08:44:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:430c:b470:8466:3e0? ([2001:8b0:aba:5f3c:430c:b470:8466:3e0])
        by smtp.gmail.com with ESMTPSA id t5-20020a5d49c5000000b00327b5ca093dsm12450425wrs.117.2023.11.27.08.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 08:44:28 -0800 (PST)
Message-ID: <2a2488c548bd8e967025c61b0bdbee7bc7d7f3f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 02/19] useradd.bbclass: list all needed items
 for package_setscene task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Mon, 27 Nov 2023 16:44:27 +0000
In-Reply-To: <CANNYZj_FdcvE77tJ1EHap0du8vcKLamj9zp9bqCuYHgeB_2xvQ@mail.gmail.com>
References: <20231127101751.3187950-1-alex@linutronix.de>
	 <20231127101751.3187950-2-alex@linutronix.de>
	 <9b0ccf15dab54023fba15e4c4568191130c932cc.camel@linuxfoundation.org>
	 <CANNYZj_FdcvE77tJ1EHap0du8vcKLamj9zp9bqCuYHgeB_2xvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 16:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191308

On Mon, 2023-11-27 at 12:06 +0100, Alexander Kanavin wrote:
> On Mon, 27 Nov 2023 at 11:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > FWIW I'm still leaning towards static linking for this. The setscence
> > dependencies are playing with fire and we *really* don't want to do
> > this :(
>=20
> Was there some half-done branch with that approach? I could pick that
> up once I get somewhere with the failing printdiff selftest.

https://git.yoctoproject.org/poky-contrib/commit/?h=3Drpurdie/t222&id=3Da3a=
d82f026adbe9c58f6927a4b97d2eb09c08439

(I'd just take the patch, not the branch)

Cheers,

Richard

