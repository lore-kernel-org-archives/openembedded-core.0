Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D575D1812D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 16:12:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1018.1728922320938282809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 09:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=esCJzZ8B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-430558cddbeso30016985e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728922319; x=1729527119; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hgVgbEHoC6ajUfbNjZDIGgc2Ra0odm00pOoOifA7neo=;
        b=esCJzZ8BNEq/QcU3t7gcgED+/r+jKRkRWrYd0/YrKdsG0VmK8PKqhdDFdgdSmnWPSF
         rXDYsT10rK7j5SCXRvtEXqQ8NS3fgegfXhfIFLvLwXILUktwVqabsBu8p8608xVOuCQH
         yAyYgBHnQf2TXeE6DQ+OUtWymt9A3jvvlUEUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728922319; x=1729527119;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgVgbEHoC6ajUfbNjZDIGgc2Ra0odm00pOoOifA7neo=;
        b=lcJwVqw8mRYMtrd66uym6uKwHnNW8qBwcgaYrMELx58Z3PhF46nOEQQgmd5vvXXm6Z
         Qcg5o1kudZDTYdPZ/pbfUBDUmlDe1nA5MGoLuJ7vgWUKBuvUeWuN15vLTF6x7cPSpbNy
         7ZQSp6iMI/XWUHJyOJwEOoS4by67KJ4CYCdDtP0ZCNSbqJIPPJ12JmHg8dIdCEzXmHBD
         EZH1BqBc5SHPWMwkgAWbqmXOdH+yv43t7lJrVWM2/EYkZloa/nv2RYpTmUmH1zuoAPdp
         Jk41QBUutctyQe2DIH8B4oCjcvxrgvypSbFku1TmagmKzO29A+DWQljffOQ2GpkQ1kk3
         h8eA==
X-Gm-Message-State: AOJu0YyFj7ryfOGHF3i3m4YvVSrj7ymVVxRm8t/p+22aRafF7W0qD1HW
	6cColSUm6qCoaXUcy3ZNVyrSCKuxK9RBPGbDL1H+QLEFtipULYjh58tv7qp4OAS2CtKzAPOmZvP
	G
X-Google-Smtp-Source: AGHT+IEBA5Iz/77w3gs0yCbrPjNo/CejsyNITXvuCqU3U4DmIwHE7KlAozmZoTIZ438HxDcpk43uYQ==
X-Received: by 2002:a05:600c:3ba3:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-43115a96f56mr126395935e9.4.1728922319164;
        Mon, 14 Oct 2024 09:11:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cfb35sm11646594f8f.52.2024.10.14.09.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 09:11:58 -0700 (PDT)
Message-ID: <eb5b6f2f2de5796ed7f757ef7f1680d5a2be6130.camel@linuxfoundation.org>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Mathieu
 Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, Chuck Wolber
 <chuck.wolber@boeing.com>,  Adrian Freihofer
 <adrian.freihofer@siemens.com>, Marta Rybczynska
 <marta.rybczynska@syslinbit.com>, Jon Mason <Jon.Mason@arm.com>, Michael
 Halstead <mhalstead@linuxfoundation.org>
Date: Mon, 14 Oct 2024 17:11:57 +0100
In-Reply-To: <17FE55BCAF4D83DD.4702@lists.openembedded.org>
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
	 <17FE55BCAF4D83DD.4702@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 16:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205786

On Mon, 2024-10-14 at 14:46 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> c) source mirroring failing on AB
> ---------------------------------
>=20
> https://valkyrie.yoctoproject.org//#/builders/82/builds/15
> https://valkyrie.yoctoproject.org//#/builders/82/builds/16
>=20
> Sources are still mirrored off typhoon but we've stopped that cluster
> and are running off valkyrie. This could mean sources don't appear
> "fast" in the mirror until that mirroring moves to the new NAS.
>=20
> Who/Plan: Michael to transition mirroring to run of valkyrie NAS

I talked with Michael and there is no automated rsync.=C2=A0Software has
been updated since the last one and that is why things are not
updating. As the mirroring is transitioned this issue will go away.

> f) CVE database corruption
> --------------------------
>=20
> See list discussion:
>=20
> https://lists.openembedded.org/g/openembedded-core/message/205715
>=20
> Has a bug:
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14899
>=20
> I'm at a loss on this one. Started to wonder if an rsync job is
> trampling the file. Check with Michael.
>=20
> Who/Plan: Ask Michael about rsync job

There is no issue with any rsync job. I did realise I'd not merged the
patch I thought I had though. I will do so and see if that isolates the
issue.

Cheers,

Richard


