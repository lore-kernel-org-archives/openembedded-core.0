Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E001FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 08:50:48 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15766.1777539039957166842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 01:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gmuc0q2H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-676d8582a13so1187515a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777539038; x=1778143838; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2riqeenVpmhf2Uo9n+jPYcZ4mfcs/vWjsxV/AzBeqE=;
        b=Gmuc0q2H8Z6T3NfaG1zwiC+hp+z3aEdtNsqJUP79HrjCoEy7sktnmqe2Lphxo+vvMU
         TTFHT6eug/O4/sg99OfGxB8MAe3WXkZUpsgRO6ZgGIvfLHGYBdUoiY8ut92rL0qaOgTD
         VgpsWRCfPQOxmEtVWAIhAvVuusvN5gnY38RTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777539038; x=1778143838;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X2riqeenVpmhf2Uo9n+jPYcZ4mfcs/vWjsxV/AzBeqE=;
        b=Qr1hctqp+g1lJk/Fz/b6vWxf/7Zf+caS7IKytWMqXbn0D6NjUf2VuN9KxFVoZDpihN
         KuHgccuqNPDNNwp9w/gS2/3pjdgNLtj8otyD8EaCJXncz/wchlYhbDAljiKcNZEI7eNQ
         ypUf5Om9mor9ASBV7Ible5BCvkYPp4iQMSe7oUam8wMGIYqR8YqRQBAD+M71JyX48j8X
         teTYDW5h7LiLw69/jHX8yjjAbk9Ref5nTVGhLb15PzZbys0PWSfi+s1EjDvDEKNXAhEk
         OAdTc0BOzESZMTSxyEZ/lfWAou1LOv7hiA6317QJ3l7RZRJhDW1cZ6UY74SIG6vwl1in
         3wcA==
X-Forwarded-Encrypted: i=1; AFNElJ/FjAQcqr+ZIabQP3umXd5k4LFgBgDEgoAb2bBcNZz5Q4sx8a86XhiV1lVrl1D6XPHGiDVVcarJx/qkI7qHMyysvg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyQ363dmB6N4aU93D4hk7gxfpW2fb0p1UZBDw4jySPdRUw9yYYu
	H+6iUYB+r6rOCiwg7HUmswTZHPO7yZ0p2uhX+3ZAWmDCnjyYJ+qtetuzHUpyst26kis=
X-Gm-Gg: AeBDiev7J2hw4w0LChE+Mr3cB4lX6bnJNWI3K9dKd2JC7yRvuDNMCTNKdj/iTEiYn7H
	2rkgrVm4rrnSheIlO1JBTALDikSif7UBHTe2Fjd7mpRuYQfpBFY635TqEIBtFokFF6FoTewCjAW
	toNSDYTWISH7B4dj/A6ih9Hg7urBmotZBWQZJdGSKyCvCEl8sORd1aXfN+GIO50Tfnw20LawXHq
	BXZOCGvAhoH6Uni61cPUsSRbEe4bGRAWof35f3xAlqG9XKjaZQvLiItngx5OSGwaYGCO+0p9IC7
	WFGc4TC9xXmrdBLq/ATa1rUftjlvAc+y2zWWMz8Nygr5Ki5N2LEzDjoqfQlIBlNhFqPCYL22k5g
	ubI34K60af1k/Z2M/7m4ISyxxnstLnKuiZiub5IP/RnWPhuyNlk7foemy9cRZH+mTKzEJe7sbah
	s1aE8erAh4qpH87ID660QAcaVcuKSMdO7+7DlCCaxFFWjaspqUle4bXl9HPz+v7AIvIn02EN8eY
	v2dDu+Cr7cGJcMYKvDbpKs9
X-Received: by 2002:a05:6402:1588:b0:672:a1df:9c6e with SMTP id 4fb4d7f45d1cf-67b5d8530b5mr858952a12.25.1777539038089;
        Thu, 30 Apr 2026 01:50:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c98d:ac74:daf:72a1? ([2001:8b0:aba:5f3c:c98d:ac74:daf:72a1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b22165c65sm1526960a12.21.2026.04.30.01.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:50:36 -0700 (PDT)
Message-ID: <61425f185366f8f63995cc23cd3c6473d5a5d589.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/10] bitbake add firmwaredir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, ross.burton@arm.com, 
	openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2026 09:50:35 +0100
In-Reply-To: <4a76c695-7857-4c09-a10b-60c6c5dc5c0f@cherry.de>
References: <20260429164821.3425757-1-ross.burton@arm.com>
	 <4a76c695-7857-4c09-a10b-60c6c5dc5c0f@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 08:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236148

On Wed, 2026-04-29 at 18:54 +0200, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi Ross,
>=20
> On 4/29/26 6:48 PM, Ross Burton via lists.openembedded.org wrote:
>=20
> SoB missing (I'm sure patchtest will soon complain :) ) and a sentence=
=20
> or two as motivation for this patch would be nice :)
>=20
> Also why not export like the other ones?

The exports are only really there for autotools and some makefiles.=C2=A0

They have nasty side effects for task rebuilds so no new exports unless
we really have to. I'm actually trying to remove them, or limit their
scope.

Cheers,

Richard

