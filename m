Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D5FCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:40:51 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.18278.1757511645376137285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WsanRsEo;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-34d1caa670eso3711531fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757511643; x=1758116443; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubfkt4/aijxo3EJj5LHI0Ncvi21JMdGiYEyDI8S0bsc=;
        b=WsanRsEo0gD7d8pQ2cv3WWCmufc1NWOAT1nvv0b/R3QOGsoC79g8qM6iC6FWhigBjr
         +vKlBnbOAEtErZAql7HaRl+K3p3ecyr7j32GPORfwAloTOr+PhOGlthtdp3Oz5nkNQ+Y
         zz3JIygGjNxlU35Z+puHkEI7vekZhpRplEaCAB3LKwIRVd7J+jGQVSYi+rtJjSvHiQW0
         6DPaJZaRHNsCjkvFv1fBixxMq/5QTKWq62h9TQEjRlc1705z83nFHBIbc1NB8NG9QKve
         X5zLZhVgmRatQKxudMaA99IWDYQuqdz6t0RIr9qYjKJShjuLciDgnR7yso1A2jVyz/1/
         Mp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511643; x=1758116443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ubfkt4/aijxo3EJj5LHI0Ncvi21JMdGiYEyDI8S0bsc=;
        b=d2rw7K6xP8JAASqwRaWQ4Z9n5xcfkl8RpxbAmuUBnqWr2+LLH3uhkwoIINy4D4pTYe
         4DGKwmn1t7YJqvCxBbI6ErRirz6LXTssgQO9ohzERZsjDKVD0/WfMN98LfWOJayVWEZ5
         GR53iDSQX5f5HbtdAw+ZeiteFHQWUJTR/BDERrt85q5ho6yIah1lz0HI/j19RJOhG5sk
         V/wkPcDpMhU8/bH4jfgduvmXBXZa1aRUCIadKory57PrS2ioys/3oGQ3Zgq1pqJfb4Qn
         3SR1KloD29kanGbY6PtB31DpEuwuT+LPcJfv1D7NT7O9TDMHsvsfC9U5xj2idFL5xTVM
         /w+w==
X-Forwarded-Encrypted: i=1; AJvYcCU4ryK4uYC93UHn13NKJ4qm61hDquXJxjTrvevRwsGjsEtw0FEQWAZrdlSG9cVFBn5JA4w3K/WmMI5u4h8uhrxfQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAjpiKcfEdD9bGKED0fzpeE32mvkKiYeBPfE2UtYXkxVaFBM1a
	GovaD/vbL7uEdNuowHPpesYPo5CLcJKzFQz1MVUycOIjrOUqJqrPkf+J2zeHMu0Uzb4=
X-Gm-Gg: ASbGncv1+35QLI6LtPt43au2ePiXO9TShkacSVXtTglgTv8R0uANRlACrcYLmkoDC+t
	OTgJ+Jx7UW+4ZkFFyvLL5Wb877FLYdasXGKzEWzLIStaBhNs3wrGNXO3zNY+I4Loc4EGgMMqQ+Q
	EXke6s4ivYdYT4upp2IhPY14fzHGHpirydvfWgK/kZ4Uxl8sfRLmTQFmt8kgHrF3I0D5fSlygXR
	aFpqkogx+p+i9YZIOMy7jM36ztycHXQ+bvb9dWyvevb+vNuV67xza8AWebppalHOMzm2JwVTQpm
	kGbMKwjNGQXBliN5ZPTixREyci5KEx65aI4X9GlaXYRBj18mQkO9Y6GhXzy0vyjEoHqSywY6Ona
	mN/PL7yoV4Vh2FyutPw4PW3RN+SIkZp+1RGaGFzh2LT4sAmiJiKH+c3Q/t9hd/uTG4P1qGxmXiL
	9E
X-Google-Smtp-Source: AGHT+IE2O8EnGmTW+4PpXEFOgB5cfq5ytFm/Iqg4wZeopb3AQM/vFwB7XRvyrcf6hhFb/P0cLti1fQ==
X-Received: by 2002:a2e:be08:0:b0:332:1720:2ec7 with SMTP id 38308e7fff4ca-33b43152824mr45958631fa.0.1757511643469;
        Wed, 10 Sep 2025 06:40:43 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c905d6sm46896871fa.20.2025.09.10.06.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:40:43 -0700 (PDT)
Date: Wed, 10 Sep 2025 16:40:41 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Subject: Re: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
Message-ID: <aMF_2evsCZZXp-Nv@nuoska>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
 <aMF8jgdGtg6M0TAj@nuoska>
 <9c6f4b6c0b3123efbd81349d6f29bacfffee5a2c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c6f4b6c0b3123efbd81349d6f29bacfffee5a2c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223212

Hi,

On Wed, Sep 10, 2025 at 02:28:55PM +0100, Richard Purdie wrote:
> On Wed, 2025-09-10 at 16:26 +0300, Mikko Rapeli wrote:
> > I missed "poky: bump default kernel reference to 6.16" from
> > emails and can't find from list archives, but it's leaving
> > "poky-altcfg" distro with 6.12 kernel. Is this the plan?
> > 
> > When building "poky-altcfg" distro, the machines can't override
> > kernel version. I would like to see genericarm64 systemd
> > builds, e.g. "poky-altcfg" distro with the new kernel.
> > 
> > Plain old "poky" sysvinit without systemd, udev etc is hard
> > to support on broad range of HW. Thus I am testing genericarm64
> > with "poky-altcfg", which can't easily update to 6.16 kernel,
> > at least without https://lists.yoctoproject.org/g/poky/message/13742
> 
> The policy has always been to test one kernel in one configuration and
> the other kernel in the other configuration so this is intentional.

Is some AB build config testing "poky" distro and the new kernel with systemd?

At least on genericarm64 this is working on the HW I have access to.

If "poky-altcfg" would not override kernel version to 6.12, basically patch
above, then some machines like genericarm64 could update to 6.16 a bit
sooner.

Cheers,

-Mikko

