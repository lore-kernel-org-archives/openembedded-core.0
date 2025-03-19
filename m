Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADE5C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 10:30:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.4582.1742380191838845917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 03:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iJ23alNU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3507075e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742380190; x=1742984990; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OOZ6GyTOkoDHU8KYr3uQZYIZoCkh96b4P5lKFp/7jFM=;
        b=iJ23alNU2wXp6Pn7x18P8eKu82Uwpp6tcBOzYraarRNWmXoJANd7sZQ5raj68Ee4jO
         Fl+7eVmdwwlHEISk3v70XPQL9azI1kQQuApHp7j7NErp3N19R/J6wByV2+1OtHxIABrt
         ZsVBxbpFPpNOcbz8SetsV6OANjZCuGPmroecY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380190; x=1742984990;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOZ6GyTOkoDHU8KYr3uQZYIZoCkh96b4P5lKFp/7jFM=;
        b=fFULncwCCdy2NsRdSp3ETOwQJRvCcCQmmvEHwlCCh6/HNCZ30OFLxrmCAB+O32GnO9
         6jCOxkkVxmyzdWMU5/RYx8ZiNECUubvcemxK2fQsfBLlh3TIQAOPNSWsLtb75vlQgH+r
         WLwQY2DwH3oeSayxP8cT85mASZq85K92EFnxFOBOGBHJFiv3wR5/CfvWoUyPEsIqVuq3
         qypm3e5tvt1GXBzPbX95ce9VHbEVsHTiARkH6qDYefBJ0Udr9nhgtXyVSEKnWhNKomgn
         C3HGEtlBzlx2kDnX7ay3KnqC4OYhYJFfkf1sWoSB9Fk1VLFLIRKx8txwTBsD2puqrVVh
         61bA==
X-Gm-Message-State: AOJu0YwjGp+p3PkPFU1t3LRkfNHneysb7SfwIxKalEMlfsliKThl5NeE
	UHDO6iFOiIasSg3RU45zXuY//+por4qKP6qUBH4hpeqgmpuZMDQwEX79cSqptiDJcX13bi+hmHJ
	4
X-Gm-Gg: ASbGncutvshvljn523kYGyHlnZiRu0PPYDudngLUGIbE6Pk9SJqDPGwXK7dOTg+2nAD
	oxet6bwobNPRCAyb3Q90nfYOXKi+ws5ieXIpKqygASZOnEta048mN5XC3br4TmIZYJ12okrgUU9
	/ZsN/QaX9Gn9biU5zZBZcSpo3zk9iUClX6lgOFOy/GuK/AmYrGG6UoIMvoiFOz4NbERaL/yB2se
	Uk5NAthw2gqYCVFpPCCCeNwLLGCETBg272sIjE2/BNqcGRHyyf45v8h7zWN6jIlLPqJwmlkheHY
	Xa+4Fp8fxhXp0vJIqnx2/EuinS0CdabuIAXwpCaFp76LVttN4ANL5lUsO2T8RvtZXLp6x6xEqtM
	UlHKVE59zxFicbusxQ5nDYFjFuHwseCo=
X-Google-Smtp-Source: AGHT+IGN5zN0VZlBnbhE9bfkC5S/8KIFa2pJrsLGFS7PZ//ZH2x7Pakx0bkdo/fTzTeVKeyFZGWuag==
X-Received: by 2002:a05:600c:354b:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-43d43034bc6mr17295685e9.8.1742380190175;
        Wed, 19 Mar 2025 03:29:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f37847sm14825615e9.5.2025.03.19.03.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:29:49 -0700 (PDT)
Message-ID: <d5992c2c2013bf7ff5ce2d76b1b223f020764d03.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] mesa: correct download location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 19 Mar 2025 10:29:48 +0000
In-Reply-To: <CANNYZj_9RmwiA4=PDE1BR-njjX0y0FrCto8H9DTSROJwUjpZCA@mail.gmail.com>
References: <20250319100959.4102512-1-alex.kanavin@gmail.com>
	 <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
	 <CANNYZj_9RmwiA4=PDE1BR-njjX0y0FrCto8H9DTSROJwUjpZCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213322

On Wed, 2025-03-19 at 11:28 +0100, Alexander Kanavin wrote:
> On Wed, 19 Mar 2025 at 11:20, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > -SRC_URI =3D
> > > "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.xz=C2=A0\
> > > +SRC_URI =3D "https://archive.mesa3d.org/glu/glu-${PV}.tar.xz=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> >=20
> > Doesn't this have issues with the "older-versions" directory that
> > archives are moved off into?
>=20
> I suspect this is the same directory as the previous location, and
> the issue was already present there? I can't check that anymore: it's
> now 404.

I think we may need to wait for the dust to settle on the
freedesktop.org changes before we update urls...

Cheers,

Richard

