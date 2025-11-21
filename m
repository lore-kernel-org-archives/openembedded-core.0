Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86832CFC27C
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:34:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11544.1763732088003553800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FKifX/Gk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477770019e4so19411855e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1763732086; x=1764336886; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ax2OH2OeHyeFtwn+QQj4uxKccr0alvtHBVoodzhOXM=;
        b=FKifX/Gk4gL40Ht0IsFGPDGLje+24QjW5ppXpmesMg5TgLcZPZVg6QgMZ3KpOGLpOg
         nHpD29vIiT+Gp8fzTA4ljBVle3pv+miEvYVQDANz1DyKb1TvfZQTaiXy6wZwBmmn2QB0
         WuZGtHcMh22ZIInGuQFOR9/xeS3jaTjOsznrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732086; x=1764336886;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ax2OH2OeHyeFtwn+QQj4uxKccr0alvtHBVoodzhOXM=;
        b=QU0vJKl/gJdRLwV0AlU7pRzEZOQthyms4qNdPSYBqSlkzijX6/MtEYUXvG+dzBYv/O
         HIv5i7iNFnpMXeP8wVF8Ty7b3ahoENH3/PJAFwAJCC7GqI2zVFBbIEsHBv0rf4NOwT5t
         HnTch3uHy3m5iPS32GMcc11epWw36HOWIQm2Ab9c3tBls8vgFvTgL/+CmtGVrn6mVeVT
         976Z2BM73IeAc9dqJ+NpQ7HoDwrVEPi8MMZ5XCwI1tHwSizzhGJmw82iAc/bWEzTEPT0
         /53ZjUh/p3IOxSGVoEfHcycFJpI+QkZs2JsnDfTkghbnD3WwIakYYwvOuEZlGOBdV+O0
         vhAA==
X-Gm-Message-State: AOJu0Yz0CAnMzA5eLgILuRzFPd5qaM5v7hjmwsIjxug9hEgcYl6sdUKG
	Y/YbFau4cpCV3DdYnikZbH9oK8SfS1VCurVQEsD8ydDtVg58A6jLv+NwIrCqjdJ4IpY=
X-Gm-Gg: ASbGnctE1rKTaOF3kk59xKGjIAfgIQJyI0xSgIAZn5LpOxrCdpoZxeU23Zm3LiLTKSK
	nwdZ7t7u3JwLwsxQACHq/9H1cv6gaCfpDQWmCd2qOsJD8O5h9DgIAoILOGTzI6Eu+kofyOb8T8x
	AlSQ3gQsPSNqae/5+wFHyobv+IYTnE4Yde5kzYsuJBC/wAVXnGfMbvCjx+9YzKzw6OwUR37MT07
	CwnPZHqBxG5tYAbTvLCb0SZTVQl9Y5fEBfhxEKryLj012VFYSj9EUpkV1IjE8VNRBS5J48jpBn2
	YAxt7uso0cSUdlgdHtZSOTHihQQGgk9KpE/R9+mS33zdY4L7FvFYtGeNZxqagXgF1fl1K6zoKQy
	42TWlt/dPfZGoa9+ommOpJ3syE75zAFMFtRB/T8T3NUk1t8TZ7QVPhjASEqSgY7JmABpnro8F+V
	/EQF7dmUu/LUmGu7GO/GEltpQ5RmajOaRoJQDxncXBm48Av6QoAvRKJxBlZ9Bg1xPF81+lNFTc
X-Google-Smtp-Source: AGHT+IG5IxHb9VvJUc2linSUD3dY+rvxovk9pqixKdbRx8kTqn+0MDLkkX4t9D4wWda6RbwdfDNAVQ==
X-Received: by 2002:a05:600c:3b97:b0:477:9e8f:dae8 with SMTP id 5b1f17b1804b1-477c00efad4mr33092065e9.0.1763732086313;
        Fri, 21 Nov 2025 05:34:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a944:2a75:79dd:caf? ([2001:8b0:aba:5f3c:a944:2a75:79dd:caf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9df99d3sm83771475e9.12.2025.11.21.05.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:45 -0800 (PST)
Message-ID: <4abba13482d2a5b933d34a0eb49edf693e0d7da3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa httpserver.py: fallback for
 multiprocessing import without bitbake
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2025 13:34:44 +0000
In-Reply-To: <aSBpgnKI2iXwD78B@nuoska>
References: <20251121105951.1158626-1-mikko.rapeli@linaro.org>
	 <c3d49e5931af8e746ed25587fdd9b180497dc343.camel@linuxfoundation.org>
	 <aSBpgnKI2iXwD78B@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226685

On Fri, 2025-11-21 at 15:30 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Fri, Nov 21, 2025 at 01:27:56PM +0000, Richard Purdie wrote:
> > On Fri, 2025-11-21 at 12:59 +0200, Mikko Rapeli via
> > lists.openembedded.org wrote:
> > > When testexport.bbclass is used, then build environment and
> > > bitbake
> > > may not be available when oeqa tests run.
> > >=20
> > > Fixes oeqa test execution:
> > >=20
> > > https://ledge.validation.linaro.org/scheduler/job/123974
> > >=20
> > > ImportError: Failed to import test module: apt
> > > Traceback (most recent call last):
> > > =C2=A0 File "/usr/lib/python3.13/unittest/loader.py", line 396, in
> > > _find_test_path
> > > =C2=A0=C2=A0=C2=A0 module =3D self._get_module_from_name(name)
> > > =C2=A0 File "/usr/lib/python3.13/unittest/loader.py", line 339, in
> > > _get_module_from_name
> > > =C2=A0=C2=A0=C2=A0 __import__(name)
> > > =C2=A0=C2=A0=C2=A0 ~~~~~~~~~~^^^^^^
> > > =C2=A0 File "/lava-downloads/core-image-
> > > sato/meta/lib/oeqa/runtime/cases/apt.py", line 8, in <module>
> > > =C2=A0=C2=A0=C2=A0 from oeqa.utils.httpserver import HTTPService
> > > =C2=A0 File "/lava-downloads/core-image-
> > > sato/meta/lib/oeqa/utils/httpserver.py", line 9, in <module>
> > > =C2=A0=C2=A0=C2=A0 from bb import multiprocessing
> > > ModuleNotFoundError: No module named 'bb'
> >=20
> > Breaks with python 3.14.
>=20
> Understood but this would fix current test setups which still have
> python 3.13.

Where should we document that testexport only works if you have 3.13 or
lower and not with 3.14? Who is going to maintain these requirements?
This "not needing bb" requirement isn't really working well.

I'd rather require lib/bb be present and included in the exported test
data for example.

Cheers,

Richard




