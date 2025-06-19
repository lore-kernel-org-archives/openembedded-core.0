Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A8CC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:54:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.83.1750341283889778669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e41fw0ax;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-453066fad06so4853435e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750341282; x=1750946082; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p9pZfnzKrwBzbbgjnbungGk7N6m/DujeHNmQB3P8vYU=;
        b=e41fw0axzBUwT68TbOU2zMLmWiTba6QDF1fCXTz0sEursw6hrZGjMivUWS2v8VL9q5
         y81Qeio08Q70R+mDhj9xQtIHFgqJxPPMjzl6sE46sTRvJ6Eb1M6cyllGSTUDZ6FWtB1Y
         kEzD3/8z5O+BFOq77BeXhJHEmj/FS9li7qZGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341282; x=1750946082;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p9pZfnzKrwBzbbgjnbungGk7N6m/DujeHNmQB3P8vYU=;
        b=IiutwyW+rMtCWYQA/lMweyHqQikWbNvwuZ1xa717/JXD2FVWWQ+gGjiFjRyb0PthfW
         NAipVUYZlWArJfIyr5OgtIv9Q9dyMCTQE6H1fBaHkCGP/YOEkQLaFoq8E59s6YI1IEai
         hyUQ8s8jN+N+q9Nen8Kxc7xYKDSf2IStUP7TFiR07GfsmuxoyLm6JD9M+m8RNNt+haS8
         iaTX0m4ezGUoatzGwGxLgomY2OK5VmOTmkYalz27WZ9I+N7LLxuBN5l9olNvhllugNCQ
         CqNNcL9t8OujkFpwj433eZ47J0pipjXI62eEKfVpMH7JhgsAhuoEPtYf7puLxGbOQo3B
         1XHA==
X-Gm-Message-State: AOJu0YxkaFzn82MqHb1UKlOKoKhVFsWt79AeluDJl9XAjzR2DLz0RHIp
	kiCNHBymfysiaOfGkmBhLxxUipDWsV92qehZMffCq1eDkLah1CG837lvQHtCXABrfpI=
X-Gm-Gg: ASbGncsqLJ3HjRW9Oqmf/7iWJByfopZO5mWhyzUsP6YDxi6sxj7IjUR1x14OYVpAzyE
	AuoernNwoiZ92RKWp3O7FFXpQvLKTL9G0WS7m4Z3wPLBsGl3JJS/nNE3Qz3V/d6+gGD7Wod4KMM
	0jtn4qqa5XPR2vPJpHA1FRaM9wDj0edzl74A0OLTgTFqml8rQJs9GJ1lS2YkDfwP3cfYTx8v5Hn
	WQSTBmEX+xJXT4QwSbF7N6ynog8lm8uvy/jklWUIN6GVkuY+g75+r6yA8uP/V+96oAFZx9SsdXW
	OowQUZ2b1Riz+PUtqrj/IxZ4QSOPo9v8ItHVlnmUMGmIYewod9czYDmhIRw5+CM17OjtPrJ13Lj
	D2tQv99gkSEquzjtbiEY50UQY5/bmjppksP23rykBHwK9dKrnYns=
X-Google-Smtp-Source: AGHT+IHUVZxTz7XRz44gSIJOxgxmlhPRRNHNQZzEbuua/2BYyUf3oWQy7+JQMSes04fuCw023nYGBQ==
X-Received: by 2002:a05:600c:1e09:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-4533cac558emr193125945e9.32.1750341281281;
        Thu, 19 Jun 2025 06:54:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b936:ac7f:15da:1d64? ([2001:8b0:aba:5f3c:b936:ac7f:15da:1d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9836dfsm30301065e9.11.2025.06.19.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:54:40 -0700 (PDT)
Message-ID: <4a1aac8047e8389316f94c3358d8f52229574a59.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/5] python3-colorama: add recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jun 2025 14:54:39 +0100
In-Reply-To: <e9f8371e-9752-4de7-9e3b-55932f3c3e3e@baylibre.com>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
	 <DC6B7B7A-BBA0-4F04-B08D-16DF23229A6F@arm.com>
	 <e9f8371e-9752-4de7-9e3b-55932f3c3e3e@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219084

On Thu, 2025-06-19 at 09:49 -0400, Trevor Gamblin via
lists.openembedded.org wrote:
>=20
> On 2025-06-19 09:31, Ross Burton wrote:
> > On 17 Jun 2025, at 16:53, Trevor Gamblin via lists.openembedded.org
> > <tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:
> > > +inherit pypi python_setuptools_build_meta
> > So this package uses a modern setuptools to build.
> >=20
> > > +DEPENDS +=3D " \
> > > + python3-hatchling-native \
> > > +"
> > So this package uses hatchling to build.
> >=20
> > One of these is wrong :)
> >=20
> > I suspect the recipe should inherit python_hatchling and not have a
> > DEPENDS?
> You may be right. Trying out a build with the change now. If it works
> I'll re-send.
>=20

I did tweak the version in master-next since I needed to retest other
things as well. I think it has tested ok...

Cheers,

Richard

