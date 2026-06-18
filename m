Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2F8CD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 22:06:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30733.1781820369114764894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 15:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NtyiJK5y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49241a577d8so250395e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 15:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781820367; x=1782425167; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWjM1pcpPPtgS852Oo0fqjDRVJJOtF4nE7uXdUmlPjs=;
        b=NtyiJK5yreYlwy6873NdedsFGto1UUDw/lxQ+MqIybBUZOH6BGJpeFDdz8L2sw+wZy
         vrkKscxpnOlJe9L6HrGRR01Kslcyqp/ZMoYk+GF0ShEBeVBLkkjhBY8dCWi8zt2hbzo0
         43XGJXfJ9Z6Tn6UwTORufZIAe2gfcFZeuJ9Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781820367; x=1782425167;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWjM1pcpPPtgS852Oo0fqjDRVJJOtF4nE7uXdUmlPjs=;
        b=PhyOAxIqUVOdPh9exhDEdy4TnqghXlQ4H435ufW+y20cIMoX7o85KkOuh1nXro4lUe
         IN9nQA+G+lmonIcdK9WDgmDYp9MKqtIuMvpGowSHttbT1jqr9kAIh0Nsh4j5ylpt3FW/
         dlJPTR4CPv23W7gxwDIPPkCqCgG0rghWPF1C/u8izaX+GPV70cmFKhlKXtThhvuoLDuL
         4No1NIe+NmAIZ2vvlO/4cHZ427/UBxnlSFKHVLndxihSxXKA/rL5bwcbozPceoxHt6Ig
         V1D+U3q9Kz1sTa7WS104ESztroAyln89ghQGsBjOntT4xoXVLFYB2r3+r3KaI54zORN6
         n/1g==
X-Forwarded-Encrypted: i=1; AFNElJ9ZNQ+UjcLPzBYRxqEWuo1qJ8XXxmcV2MpKHLjNZeDBEJTqV8ptcZYXJ839WGi9rQs6JWWvjqJF/x93rGiCjuTRPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxwU/YN2Ek+5cCAUs2ZP5wr0m97vTiZLhtprTLbZWawhldPGNEd
	A7dYqngUrMe0kZUXjZOVevWcq9LUgIUchcyWi+nFjpzC/EK77J/cizAOVMSEK0qRzQA=
X-Gm-Gg: AfdE7ckn7hIMDuai4wtUz7dzM/UFiujiPSgyy+c9SdEmJToQJ2of8NU2FwHM8HhxF7H
	5hKMHYwgcAbkw4POGv21eF96iMF0KpRaQ3OTC3LqKozhK2ro+wiFjqsTnptqbMui0mMYgQ6KP3m
	8vaHnFOaaNaQGo9sK4cIXN9DOlTmeZpqmaak9qAoNtC8md3xNizKJmSkuxYL1uJCuLjI5F30F73
	tI8AMi6+NxuZH5H6CdjcDnRjisi9/Z2S31nYN7beuHYOIF7cOqy40RJ7JBARTflXtRx2FPZnjEC
	k2csQpz/r0iGdYJCceTma/9sq2IAUxw9tLwlNmyS5vlWRtvu2fcXv6GVtwEPCXAy8YHZb9g3dRx
	hKe2FtoA8C2NLh4N1AcaXknSu/0iegaecmydLxdK31v0d2Rc0dr/mAjFokOT7V18QC03SiqtdF0
	6aTuoHk4k7R/i/skJ4OHW45lBUt2HzXzXYxuN0wVBV8KWETGBs2bmcqUSR/33DZpp4T5uk+4uSi
	c4trF+Y+NNXnAHJ
X-Received: by 2002:a05:600c:c490:b0:490:bbc4:76a6 with SMTP id 5b1f17b1804b1-49240e7f645mr12001485e9.21.1781820367303;
        Thu, 18 Jun 2026 15:06:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:89a8:c636:4ee4:5fa5? ([2001:8b0:aba:5f3c:89a8:c636:4ee4:5fa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fcaf67asm11769715e9.0.2026.06.18.15.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:06:05 -0700 (PDT)
Message-ID: <b5ab82818c3fff23ad4a91c7269d82f341e808fc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta][PATCH] go-vendor.bbclass: Unpack into BP for
 destsuffix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: john.ripple@keysight.com, openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2026 23:06:05 +0100
In-Reply-To: <211612.1781819802325628623@lists.openembedded.org>
References: <20260618213119.2495463-1-john.ripple@keysight.com>
	 <CADkTA4MYBKZuuJ5iNHvq+SErx=mB3fz1UZq3VC1rofMemoUivw@mail.gmail.com>
	 <211612.1781819802325628623@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 22:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239112

On Thu, 2026-06-18 at 14:56 -0700, John Ripple via lists.openembedded.org w=
rote:
>=20
>=20
> > I have no particular issues with the change, but the commit log doesn't
> > tell us why this is needed. Was something breaking ? is there any risk
> > to the assumptions that other classes/recipes/layers may have made
> > about the location of the unpacked files ?
>=20
> The go-vendor class was unpacking dependencies to ${UNPACKDIR}/git
> and then needed S =3D "${UNPACKDIR}/git" to find the dependencies.=C2=A0
> Changing the S variable caused the do_qa_unpack() from insane.bbclass
> to throw an error.
> =C2=A0
> There shouldn't be any other assumptions from other classes/recipes/layer=
s
> that have been broken. The recipes I tested this change against used sour=
ces
> fetched using the go_src_uri() function, regular git fetching, and local =
files.
> There weren't any issues with moving to the go dependencies to the new
> location. As far as I know nothing in openembedded-core uses the go-vendo=
r
> class making it trickier to test against a known baseline.

It does sound a lot like we're missing some test cases as if I
understand it correctly, that class can't have worked for a while?

Cheers,

Richard

