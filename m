Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858C3CCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 10:06:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.3110.1760781962191900738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 03:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J7BGZq/a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46b303f755aso27402685e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760781960; x=1761386760; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3S3MLP1yFPZjwWfn5cPd/QzeI0LIfP2LpjxcNmdIUeg=;
        b=J7BGZq/aHrcS57J4/UCTQM4xnw+aU7GiPXDHgttbxl4SJEj92nzVqugnJkI5MUnhDd
         SX2hULrWqomTwcPJMd6xTf9Oh/RRp3jOuKyO8EQw+auX63q/yx2tD4j7EcuWMv//vHeY
         g6RIycrrEArP4H7LTfAedCW7jmaMKLTEBiy4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760781960; x=1761386760;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3S3MLP1yFPZjwWfn5cPd/QzeI0LIfP2LpjxcNmdIUeg=;
        b=o36+zwuMycH1/tC+iAsHt778hrH/7/AEgPvRTuWleGmt42OOMh6IgknIRdVXz3EDgw
         7MOxRi2HQEPoIVSwHYf0cT1MrKXJtvQdQYKAWU84H2XKMyuimBomXSxC0IQ/szadT0iP
         1zWbyGbUES9HYfx+jfowCSylFrzJ8NOhh3aNE7J3pctXC7Nqu6OVnRHWezGUQ/Xyqmdb
         sk7Gt0j43X+waRqej8g51yk60usVNiO7Djhj427wb3TbfFDK8rbBzyBjbGV3OeZIcfK7
         EdHXEdKdczarZmGvLY97ahCu09ldsBdqN1ymzXh28O3UFOZwCmmOHVXQRfZ519Gt/sgn
         kX7A==
X-Gm-Message-State: AOJu0YyJxpXWusvAIETS4wNLTtTYypV/Fl5FvJsNiNaTTGeqBw8BXow5
	itCdSqXJywU6pqT7KgNNDznhIFzLlXiQkyqyJjzuer1AArEhG9gzQbzJP6ECR4fPWls=
X-Gm-Gg: ASbGnctr/SrH707GrY9QYyde7Netn31kkLfsFQv8fE4lINgHw/86m7sdICAzE779W/2
	IHnNy0lwVzdcgMlHtPPmLtDbiHW07CHXtaE8W1qmYvotKQJIAI/H4snRRDLDF6mdY48FNE7LZwI
	do+n36kbXxJJltui9aIatrzxk8DuAquIFWDpKi5+hMqMtCXGccij5kYoLq7Y/XoHq1ge61jhMBa
	2BGYHiUrIeoPsKIQyENg2xL81gAmIegmTrLm0iz9plqZDQrp0NJpr81qifx+7rIVviMFjmOoRk1
	XOpvWt0v0+etmzATdD3j4rowKtq/rtNkwQQtJXw8WYOayrLbD3d2CWCVy+c5WMG1n6h+IeCuHfx
	C5RUcHMw7YbSUf7eN0nVXCBg7SOo0fXy/c3tdtVfMdTJz5aZbEIBc7QxYpSxv1bkcrgE2z57TFG
	93nhcmuN8TxBWHS3z66yQ4svaqTTSOsjQ5UB9Ch5wCvsifGKvuzRlw2+eyJQnWUHKf
X-Google-Smtp-Source: AGHT+IHWu97x5rjEKpiNRdb2HHGU66IpVu8sAyEz5NjM1lfW2ZEkcFwI7yNuHSr8yvdYT2bEShWUNA==
X-Received: by 2002:a05:600c:4ec6:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4711787bfe8mr50323595e9.9.1760781960518;
        Sat, 18 Oct 2025 03:06:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6eb:655d:8fc8:b6f0? ([2001:8b0:aba:5f3c:f6eb:655d:8fc8:b6f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710eeaa236sm65577555e9.4.2025.10.18.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 03:05:58 -0700 (PDT)
Message-ID: <3065c655cb09c8934022b9e9295620024eb3f94c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] ltp: upgrade 20250530 -> 20250930
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, petr.vorel@gmail.com
Cc: openembedded-core@lists.openembedded.org, Yi Zhao	
 <yi.zhao@eng.windriver.com>, Khem Raj <raj.khem@gmail.com>, Hui Min Mina
 Chou	 <minachou@andestech.com>
Date: Sat, 18 Oct 2025 11:05:57 +0100
In-Reply-To: <CANNYZj-6s0z-VgsONFkD-BW-kimhJ1R7bRLsXTJ2NQ7ANjfi4Q@mail.gmail.com>
References: <20251013185934.GA114595@pevik>
	 <59f5af6c290efef806b73ba905cbfc412c290109.camel@linuxfoundation.org>
	 <20251017164332.GA355538@pevik>
	 <CANNYZj-6s0z-VgsONFkD-BW-kimhJ1R7bRLsXTJ2NQ7ANjfi4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 10:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225073

On Fri, 2025-10-17 at 20:18 +0200, Alexander Kanavin wrote:
> On Fri, 17 Oct 2025 at 18:43, Petr Vorel via lists.openembedded.org
> <petr.vorel=3Dgmail.com@lists.openembedded.org> wrote:
> > Master branch from my fork [1] do:
> >=20
> > ... $ . oe-init-build-env
> > ./build $ bitbake ltp
> >=20
> > ERROR: Error importing OE modules: module 'bb.parse' has no attribute '=
vardepsexclude'
> > ERROR: Unable to parse /home/pvorel/install/src/openembedded/bitbake/li=
b/bb/parse/ast.py
> > Traceback (most recent call last):
> > =C2=A0 File "/home/pvorel/install/src/openembedded/bitbake/lib/bb/parse=
/ast.py", line 372, in eval
> > =C2=A0=C2=A0=C2=A0 layerid, fragment_name =3D f.split('/', 1)
> > =C2=A0=C2=A0=C2=A0 ^^^^^^^^^^^^^^^^^^^^^^
> > ValueError: not enough values to unpack (expected 2, got 1)
> >=20
> > Kind regards,
> > Petr
> >=20
> > [1] https://github.com/pevik/openembedded-core
>=20
> Which revision/branch of bitbake repo are you using? Note that bitbake
> and oe-core repositories are tightly coupled, and if branches are
> different, or branches are same but one is behind the other, you will
> get errors such as above, e.g. "ERROR: Error importing OE modules:
> module 'bb.parse' has no attribute 'vardepsexclude'" is pretty much
> saying that oe-core is expecting something bitbake on your machine
> doesn't have.

Just to be clear, try cloning git://git.yoctoproject.org/poky which
contains both OE-Core and bitbake. This does look like a bitbake/oecore
version mismatch. I am curious which bitbake version that is? Was it
distro provided?

Cheers,

Richard

