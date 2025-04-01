Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2ADC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 10:56:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.16003.1743504980254094665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 03:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BsYIdxYE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso35342795e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743504978; x=1744109778; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O/rMfg7HqEdoLnrJAbMfjWp/hGl12Ycex6PFGfjLfNk=;
        b=BsYIdxYEbtvE6uwT2KpMVuD3o9Tm/lJCDheI+rX7yzCc/DKKSK61793LQvDGYH8iOu
         Pu+azG89Aq5k9pF+qbZb3UJf1cq75dAgYyekdP7NFdTNvyDupg9xrVULopR+NRIK/eX9
         p8WjuI6Ymm3KvV2XDA66NOMzRG6aBJ3nKgz6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743504978; x=1744109778;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/rMfg7HqEdoLnrJAbMfjWp/hGl12Ycex6PFGfjLfNk=;
        b=VJaBivO5lbXI1to+PjFQWHhNWAKbC2ZgKVGGPEkRBkMBj5YztUUs/7WThzKqrErzh+
         fvrSZFc0yfWAdKDGMgitEbOt2rQqD+ty81RuzQVQo62tvMIl7LvMTPl89u2zKX4VCXdl
         vdb550jF5B1KftzcC/w3KAHB/2iLr7CsZ/AcZQfxgqGG038AKmL0SNNdrqbk9sNxtOGu
         SvUJbxJlc1CyZNggyMCihYyDr2y/Ofx60wjeqHlS5C8lyB3wkGe9aW+EMw2AqZG9FyhT
         PwbCI3E94A3XNbRM5IzvtksZPYbdFAZ0tx4pMjjESDulnk2W3DxpRYMyZUVBEudu4j26
         v+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV44buvObE/Vs50jn+ptN4Jr+HszXeRViqLuk/8Ia4hgBy57oo00GgV+0ZB3vyzxT/6QPQEolS0Sp/tE03FlR7+RQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/ohNkn13HnVukTK6QrQV7Q7E42zu8oe9rw2FlBfONM6iNuNE0
	7YPMpHsEVsWaVzTWt9L45U08U72x9mhzGDNaQeNYxZT5DIgYIzXLEQeZ9nCIndE=
X-Gm-Gg: ASbGncvDOZtQYU77yNSqKBnN39navi0rLiv3n8cQ8lAEQ7yxzL6YSVrSH4igBKHPWfN
	y7f7WyAGYX/SeHCsq/dgfL5h1HVURaJEBOssMEZJBdTBCCS8bDqGxRO7GIHZYthVtM/SEJiaM7j
	sr0Ao7AGBGFYgaX5fWMw+aHVpba5t6O9qG+lQxJU6jYuTI3bKRTpnR+VkZB6MQdWrEiA4v2y8Q3
	Js/Plis//0dlLDzK/NdgDxWRcLlV7cW7bUZ83r9SGOgTh4qix270bzGjYR5Y1N2zt4/FGNEMcPn
	SCWh7KeWYldRil55ACHseLZf9JPko/ex8wskkFpQQ5vwRxbx/Cvs58Jl/Xm6cif5w7dUJkHgH2H
	0OY7CN/RNkxHQThvRDzk1PEneFzxV6Gy6BP4NCHlAfyFx
X-Google-Smtp-Source: AGHT+IE6QuQ5s9MiNku97/Jlx4lzG7f52e4M956c9scVl/4BlNYB+H7yzuqCgJK+k/NeE2TYEKkJkg==
X-Received: by 2002:a05:600c:4306:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-43d91017c92mr122547045e9.1.1743504978573;
        Tue, 01 Apr 2025 03:56:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:60ad:c9df:333e:6173? ([2001:8b0:aba:5f3c:60ad:c9df:333e:6173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b6dbsm199011615e9.36.2025.04.01.03.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:56:17 -0700 (PDT)
Message-ID: <5699ede6189245680e202f9a9158e8f751a43b0c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [Patch v3 01/10] gst-devtools: upgrade 1.24.12 ->
 1.26.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mathieu.dubois-briand@bootlin.com, leimaohui@fujitsu.com, Jose Quaresma
	 <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org, Joao Marcos Costa
	 <joaomarcos.costa@bootlin.com>
Date: Tue, 01 Apr 2025 11:56:16 +0100
In-Reply-To: <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
	 <D8UCORYIOR2I.1Q2YNS35P7HHS@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 10:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214014

On Mon, 2025-03-31 at 11:40 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Mon Mar 31, 2025 at 8:48 AM CEST, leimaohui via
> lists.openembedded.org wrote:
> > Disable new meson option dots_viewer
> >=20
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
>=20
> Hi Lei,
>=20
> Thanks for your patch.
>=20
> It looks like we get some new ptest issues on gstreamer when building
> on
> the autobuilder:
>=20
> Failed ptests:
> {'gstreamer1.0': ['gstreamer/elements_queue.test']}
>=20
> More details about the ptests failures can be seen here:
>=20
> https://valkyrie.yocto.io/pub/non-release/20250331-52/testresults/qemux86=
-64-ptest/core-image-ptest-gstreamer1.0/
>=20
> Can you have a look at these failures please?

My builds passed with this in so it looks like an intermittent issue :(

Not sure if it is a new one or not.

Cheers,

Richard

