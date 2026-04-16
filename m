Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E3CF8D75B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 15:44:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17746.1776354251471388605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 08:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PtlHbkDL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d72875729so3342597f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 08:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776354250; x=1776959050; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7cJmH9pBWC4Rc1NU71bl803IIWFIiEfD2O4/MNaHUMQ=;
        b=PtlHbkDLn1Jx3NLBIxEArJ8lpTqbx1MGsAXoMraHN7uVSwFLgskJyESy9wX89pA0Pw
         sM9EnhfsswqE3xsjWsFYsTvFWyxlXFH7/YiTqZkVDlWl5DyJJAT+7llfaQTBeQ8xHBRJ
         haMqs40OUfCPEBFgEV3dLYiV1vtGewIxhgynU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776354250; x=1776959050;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cJmH9pBWC4Rc1NU71bl803IIWFIiEfD2O4/MNaHUMQ=;
        b=UhfknZ6N/cwaGX/K/XrwD0JMQh3iR3jSBjOdVbxscXtrE+yRpZ3w0h3b21Sxne09Or
         0oGibRkn+yhqL8Z+Sk28j7mcDKP9mrlbYpZiiqvFCMlGyb8MPnkk22I/aZeXh2p72yHc
         +x3RX+mzK+i3h4CpnaFtsqGnQGu3cLkr0+kyD9dIu/AXHAIp4Y4w5hJZ1gWqA1JJIANj
         sjenapSWCnpktmZnQXBYEeRy7iW4IE/HPRxZsM+XpMNrzstM1LAgJXRWCu/oP0LMUXpd
         0acCx1Qoh9CexTwK2dUyoQUO2dt0biYJNnspRHNiQp8XgXbL9s5XKFkjgG7QeCf27cWw
         CNFg==
X-Forwarded-Encrypted: i=1; AFNElJ9eIjfYfksyGeYOxIC46588GalGrQzsROGm6Q0IaYKgkmpYuRO85HEuCSwuF8rDIVrFq7C2/YnrXXnaZHHI74sA6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw8z+y6qUsnWJnSAVhOuWrdpiOcqi6a9PPOaMT5gV+DN2tsgeXt
	3I06htheLtbs99Rn+Gqdp2ZKD//b1XiJEJUCC5TXSfrwDJJgptVuZPlqLHHjP6wdGwM=
X-Gm-Gg: AeBDieslhyY6qTznsdPrUa0RXM27QIf/81xksrhuFJxt9WDrpsoY7kphZgQh1REwEaH
	a+R5BX7n89VD1GUrYg6e1HAb41kIqbJsiryNPHepnaZ4AZuV/QYHMzpe3IB0BfcU+SwBkU7fJz0
	OamWK4PUnDbQ1QLbF7CcSyS/xiy++vBHQLcO6fn7+XvythJG/YbVuwSukcfVYiv3V4ukja1Ql7W
	8zQCN+Sn7eKZN5TC+KZh9kyWFeZsEetTq30qtUooLEobTLNc1WChajmQwkytISYDTItUomW59gi
	sSi/udtPVcRA+PBS/I6NxnoIQT1MmWuvGZGDzH4nd3wQWS2hg5G/uCeerw6UszGw2yb/nOgUB1K
	Fl0QvWReGsgqYxJcptH7aNfWBi0xllU5SVRYvvg1pfl789pmPuvDy8AFiDcvcrI7eVG6Al37xYL
	TBL3ZkbqVnGHylacFL3ffPcjHbuFvZqI5oQ0PobzUWNYCoaWNn1WxQZYjmZGeaesgh/+QgSeAfe
	OxRaHYCuULtdzQSxOUNrYapXX4=
X-Received: by 2002:a5d:5d12:0:b0:43d:77e1:6a67 with SMTP id ffacd0b85a97d-43d77e16b06mr25661758f8f.5.1776354249404;
        Thu, 16 Apr 2026 08:44:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7? ([2001:8b0:aba:5f3c:9444:ba74:dc4b:e8c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5f06sm15158696f8f.17.2026.04.16.08.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 08:44:08 -0700 (PDT)
Message-ID: <90a47e66603ba4ccd4d44f4d4d7d9991ab2f6207.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
 Martin Jansa <martin.jansa@gmail.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
 	Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Date: Thu, 16 Apr 2026 16:44:07 +0100
In-Reply-To: <ee4be5e2-033f-436b-b847-a3c796304fab@gmail.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
	 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
	 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
	 <18A40738790ACBCC.657799@lists.openembedded.org>
	 <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
	 <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
	 <18A41C5827F22307.777565@lists.openembedded.org>
	 <ed118dea-62cd-4d29-9ee1-336367a2aae5@gmail.com>
	 <a534592e54506e5576444250023b0bed775a298d.camel@linuxfoundation.org>
	 <ee4be5e2-033f-436b-b847-a3c796304fab@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235411

On Thu, 2026-04-16 at 09:27 +0200, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> I have upgraded to tar 1.35-8.fc44 and run some build.
> This change in pseudo works properly with the newer tar build shipped
> in Fedora 44.
> FWIW, I have not tried building GNU tar from their latest git
> sources.
>=20
> Thank you very much!

Thanks for testing and reporting back, this helps and means I'll try
and get the changes merged.

Cheers,

Richard

