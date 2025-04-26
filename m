Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B1C369D5
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 12:40:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.8021.1745671195201635810
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 05:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UmIu20qG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so1913321f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745671193; x=1746275993; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NRKGyXLDUnxKcaZF5/jXyAGuvTKzoumiSZtmLF6CH0=;
        b=UmIu20qGPj48oTMy7C9fwtIOkHSmIs6qFBXbhx/nXDSAlZfjdFaAY4KGmtuEqXm9Vg
         7ecxywC/k+poaJ+QmdL4RAbRxZrRdQQADowzEiKaQzdoyx2QrzSIEfiscbtyUHdGdgSi
         0vvMAavY1Kk2507EIVCAcs1xcYBxBAkSbPtGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745671193; x=1746275993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+NRKGyXLDUnxKcaZF5/jXyAGuvTKzoumiSZtmLF6CH0=;
        b=V/uKcSvZE3mE5eBXVbhBGOmcUqb/C392QIR892Wvd6HnJn/v7H//6XQ2tigQRmBqA7
         aUL9IymM68GT/g9S4Zyd1awUsXrFmf951zCte+X1WnJdg3sm0zokh/g6EroN5tVtgOaJ
         yDqeYywPqwzHQp2P60yUQCRGssXUfnoS2pBf0ExIE9ychCVK3EHePvm1A0P7x58EnhKR
         quP3GwBLYgq5mNcYGS/AyRIfCv8A90N8UZBqzhsv1ymiMnNuti1wZStG2kR13AWVo9Sc
         1Xfu5sc5oa6HPho36UCV67M5ZZmJ1xw2daKyxUWjUCO2k6ElMQ4P2BkMfClSYxVUlypD
         v6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWi80Sl5OLdh9PkHnv/gOzNvK4w25l/sjXrOTpg1qktnHCJOmqOjR3wgUoYAdOm9MON1epMm/0ZLzUBCxUdpaj76A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXKAh+CP8YQfigg/WFGCfuJg1M7q+4qIKotO/LR/7oWl11TQOL
	FH9/85lP8Ertee3wfKwq1r/6rudwtiJSf7OTpZVzeTtGrpOWMBj7dJD06sNLzts=
X-Gm-Gg: ASbGncv1qbWsIsWN68lVjKlTIVN0CjRwCmakbTWSVyJEX+cOdzBNaTcmeJCmvd3juCU
	nHoXHwj2swdGFhzaZ7J1bnVJhenYqEtH2ma71GRcNXCcdcKs62RMpQm6PWulxHf+j4+mA5mX41A
	UvMxipwtEVgK8OlOgbWNXuAtka0HK0RXsXnS0yr3AFtQbYnuulzahYyiUjAmGSZfB27I4EI+fDY
	ACN4Wn8M7FyuntICOm/8XqxCbTTYljxNsVOc22UqpisO4IAQt5D1l/LdtiX3znHZKXYHWJnQJ6z
	tvtyyKtoTst4lvzv7H9lMXiqBoo+I3bUkRwkltaiXytzhDM480Sy+D+umC2fChemDhWpE4xGSPz
	caDstA2secJQWMhRT9zpVrzUOiLPUKeeZLP4ZA+jk
X-Google-Smtp-Source: AGHT+IEYumFjQGS2OqThG9WdT9Rai7pmeChgmfPOxXpwTt/9XXlRvWam88L7XORfRpQD4iQvFizy4Q==
X-Received: by 2002:a05:6000:240b:b0:38d:d701:419c with SMTP id ffacd0b85a97d-3a074f0dca7mr4315071f8f.41.1745671193290;
        Sat, 26 Apr 2025 05:39:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:48f5:d7c5:b2b7:bd12? ([2001:8b0:aba:5f3c:48f5:d7c5:b2b7:bd12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c973sm5455412f8f.5.2025.04.26.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 05:39:52 -0700 (PDT)
Message-ID: <f0ba8f1b5f809c48e15eec8f4a89d4d2f8c114d2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2 v3] python3-numpy: fix ptests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tgamblin@baylibre.com, openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2025 13:39:51 +0100
In-Reply-To: <20250425173701.3216403-3-tgamblin@baylibre.com>
References: <20250425173701.3216403-1-tgamblin@baylibre.com>
	 <20250425173701.3216403-3-tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 12:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215518

On Fri, 2025-04-25 at 13:37 -0400, Trevor Gamblin via lists.openembedded.or=
g wrote:
> Fix the numpy ptests by doing the following:
>=20
> - Add gcc and meson as ptest RDEPENDS in the recipe;
> - Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT
> =C2=A0 to a directory inside the same path that contains the script, crea=
te
> =C2=A0 that directory, and then invoke the tests in the same manner as be=
fore
> =C2=A0 with 'python3 -c ...';
> - Add a patch to skip the test_big_arrays test, which uses a lot of
> =C2=A0 space;
> - Set 'IMAGE_ROOTFS_EXTRA_SPACE =3D "3048576"' for python3-numpy in
> =C2=A0 core-image-ptest.bb;
> - Also set 'QB_MEM:virtclass-mcextend-python3-numpy =3D "-m 4096"' in
> =C2=A0 core-image-ptest.bb;
> - Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
> =C2=A0 one.
>=20
> Results on qemux86-64:
>=20
> > =3D=3D=3D=3D 47301 passed, 4171 skipped, 33 xfailed, 5 xpassed in 148.6=
4s (0:02:28) =3D=3D=3D=3D
> > DURATION: 152
> > END: /usr/lib/python3-numpy/ptest
> > 2025-04-24T14:02
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
>=20
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
> v3 includes the 0001-lib-tests-test_io-skip-test_big_arrays.patch file, w=
hich
> was mentioned in the recipe in v2 but not committed before sending.
>=20
> v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and mes=
on),
> and also tweaks run-ptest to remove the temporary directory after the tes=
ts are
> done to save space.

Thanks, getting this working would be nice. I did try it on the autobuilder=
 but saw:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1385
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1382

i.e. failures on both x86_64 and aarch64.

Cheers,

Richard

