Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C557E63F07
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 17:03:46 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2022.1771175015663130445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 09:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NlsXQEim;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43591b55727so2792035f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 09:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771175014; x=1771779814; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5a/XwUQAATj75mYX1uasRlEo8pkfjAAIRrWhD2csYg=;
        b=NlsXQEimWZ4rjVx4qahb62tmeWHw/0FLys7o+YBV56UA7by7XWpSzxEcn43RBh+YIO
         rU7MG5ummchd7LzMINDfzSp7vcPuI6CySdpLGvjVpABA6/YB0seuvP7yWc+K/ikqQnnO
         hJNg5CcAnh+SQ454bE/SxWtMhHZOOx4xixFdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771175014; x=1771779814;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5a/XwUQAATj75mYX1uasRlEo8pkfjAAIRrWhD2csYg=;
        b=HKz5MeuJW0i3kWJ1CnT+5v40Ifh16tBAAQQNl9tSiYJTmgTouSI9xNgqZlGaKvkRMw
         iOUY+f8fME/yQULAWSTH/eF/b/s9SxaDnLrj1n4cj5ihE4bmvLUY9jl7oizZGFNBedV0
         e9npXJLj38uhtW4d/XLca8xa85Xcar9cbNrlLoNddkt5XCBh2C2enPGIEc2IGtplX6QD
         Z9WI93wkVBZfDxtQMJanBwuEQ5Vg0fWay74g2KxVYmBnUr0P+2hhsyyZTdyPWf6mU8OL
         mF13phFAKrsh87j2DhhTgdpp7umHq/9KhbiHQyIfrabwYYAJLWU2LJp1fZnswSfD4W+H
         AF5g==
X-Forwarded-Encrypted: i=1; AJvYcCWYnqnEb4JlkTaNj1V7VWpm9mZfG3S7TLKvLcKWCtJg9POARd4Sw/ntahxJZ8h+BnUYCPu8ccrLwDviAy1TxpDcaw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznloLEc1huDM5hJvyEelUPc1G03oXI+jSDyvIc7+9LOViC+Kc8
	hjFz9pej0ZZNOo2+bVn19b2HFuKj7m+qb/krMhd8+OLt5lQObcnEoJW8otJI/Lm+0Ik=
X-Gm-Gg: AZuq6aJFTU/Do8O0vdduZPBZEjxSMP0me810nkVygv7w6BcJ+IaOCcQPpAyCt1IuCVS
	OnBoJAmpIFWZu0FgaN3lUFq04ob6vZ4A/HiMSLXIX9iHw9Z/r01xWQ+s6TTAVp6bCWfuWOAr0xC
	pZXAyV5efms++XBN2hZgGFPCewVQfLtQ/Ha/StfWNJQGn8Y3tU8iJIdCkns7lf3M5FVyHCHMbVQ
	HvzZXTnNjdHEBryUfmHluvR631jTDAIwYD+gHmdAf7Cc82Zduqnxqo+vGLHtJNvAusEloIflB6Z
	Kz/Jx3Pvq8uvVWV1pgSIWKpnYQ7Rdy3rVYrSch5/v+eO4I7mQ05LMg37Q4PuksDdf3fQd7ZCfEA
	C+q6paPJWoUjcY9k4nlY2QAEeHU3wm8Iv7FSS+CcDXY5LKeBbMZs3PPi53nnjKTzTzUwnEUJdbz
	+wVceIXT8mDXnyZkRvZg8U0CovdtYm4rr4oO0U8/7NpqB0MZdlGT5yzCegaUnkLFg0bkdyq8hjx
	hiZOClM9A==
X-Received: by 2002:a05:6000:2906:b0:431:369:e7b with SMTP id ffacd0b85a97d-4379db61b66mr9609014f8f.18.1771175013788;
        Sun, 15 Feb 2026 09:03:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:849f:9b12:ed62:bc? ([2001:8b0:aba:5f3c:849f:9b12:ed62:bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abe3b3sm24674756f8f.18.2026.02.15.09.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 09:03:33 -0800 (PST)
Message-ID: <1671a6263c305f54398e74a0a826387f343bbe34.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: Stop supporting sysvinit
 compatibility
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Feb 2026 17:03:32 +0000
In-Reply-To: <DGFOGZFG9RCO.2210182JJUNRG@bootlin.com>
References: <20260213175618.1801591-1-richard.purdie@linuxfoundation.org>
	 <DGFOGZFG9RCO.2210182JJUNRG@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 17:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231167

Hi Mattieu,

On Sun, 2026-02-15 at 17:32 +0100, Mathieu Dubois-Briand wrote:
> On Fri Feb 13, 2026 at 6:56 PM CET, Richard Purdie via lists.openembedded=
.org wrote:
> > Systemd has worked with sysvinit compatibility but upstream plans to re=
move
> > this and hence we will no longer be able to support it. We need to remo=
ve this
> > before the LTS since the support will certainly not be there for the li=
fetime
> > of the LTS.
> >=20
> > This patch disables that usage mode and removes some of the compatibili=
ty logic.
> > There is more that can be removed, this is meant just to signal to peop=
le it is
> > no longer supported and start that process. Further cleanup can be made=
 over time
> > in later commits.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> I suspect we also want to remove the "Systemd with sysvinit compat" and
> "Sysvinit with systemd" steps from qa-extras2:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/3165
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1=
562

Yes, that is on my todo list! I knew we had a few tests to remove, I
think that is the only one I haven't patched yet. Thankfully an easy
tweak for a change.

Cheers,

Richard

