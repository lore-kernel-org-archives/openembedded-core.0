Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4219DC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 14:43:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.32523.1750084997922249368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 07:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=du8BI50C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so30364375e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750084996; x=1750689796; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcoCrZform5eb/m2H0pZZfXX9ePaUuWY2Tu+cBi1DqI=;
        b=du8BI50CFT1EzP5gWz/aln0GKYHHFty0Acd00xmeDJUJZm+ieiPq4yyqDm81HfTuhq
         Ve0nyqYzs5M983jgj2PE2gKYzK3e+4OCzZ3dLvS0XE9OZhaRSxd7SYCQl6A6cgnzrF4J
         n7qpmv43HCBaYui6gvEwQJzo24106KWxoIvNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084996; x=1750689796;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UcoCrZform5eb/m2H0pZZfXX9ePaUuWY2Tu+cBi1DqI=;
        b=GqU9GqJmqCILu8HJI0m85mS8eZxw4clYsuxcIRKEYW4Iqxb8pDdtrorY2XyWlyt/c9
         eHb3JfPzLDw27mgiM/P9vscIoghj8jsZtgsTHpVmIhy7oTe8ndMlTUlFuMpksF6OyBUz
         GwX+QGFeHrpaLGxljQCmPUTGAVlcN+7n1MkfCySpK2EJ5qQdaw5SryYnxSw2npfbkzVL
         11Hn8SneMPkBUnWntwuxnoXxK2WEzC/br7WntEDMTW+eqpdyYbAiu1hFLCLrLaOkiO43
         6ClFdhTxFrv/cEmt5s0vzz9W1WkM+Jzk2Qaowt5BM7794EfMJjwofpLU4G9O3zC1oNc4
         kd8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo/DgzPd8ybjOyIioQbu/JK8lD6QdnwgcrwaAMsd/w61825mr0k+uhYWYlh6mbuK7wvaKoL/Nby2vIkxY1XsO45w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwD4yWcPj408wM+J1LQ/LHE53zXrxtx6O/r8ak1H904WY+q3X6O
	iBNRD1gxXXnjH1wK/9WadzFq9mQO2Ar//+vBkLikMp+qIAuXGeQCnPExcri+i5DifHY=
X-Gm-Gg: ASbGncvlBEUlLK0jmg1Bgq2ZtQGBgHOt5VcuikOHK+BahSMI3mEs/Emhs2kdWjn1OMC
	v+oL0m+0TQ4q78uM0T7Ezu8kYS9Np/lNuLeTs4N81Hude0R6P/tXiQLhOZxU0XPVPQO3sqASRDK
	jAqekiehsk4QqmUOwmlzYWqUJ1F0yLvcG0reOdRVKKrnQ0bzBXb8yx30ut7+elWktEeRTWfnzzX
	2f5R+y8IScLd9XC3UHDByx8ugjeP/Y+oW/kw3wi6LlgPy/OfWcwB9TU6DPjs4OitxmWXWMAl+a3
	x0oVSwfiIxQLvESm7YauaucV0f+KsBb7Nhzr7cKYpNLdLm0bCgf44Q3+xAza3WlUIrF6YCJI7Wk
	KNOoc3vb5r4qr1dJk3FyxTfbBZzykYQjIuRUH7X5pjQHEjGnD
X-Google-Smtp-Source: AGHT+IHyR0/7ZAX9LTxbZQxT8Wr4VKVxtpXeAyMeNzBRp0mKfuUf76JcbAqTFJ5lYfQgKEhWd/L6cg==
X-Received: by 2002:a05:600c:529b:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-4533caf5b1amr89288955e9.12.1750084996245;
        Mon, 16 Jun 2025 07:43:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2? ([2001:8b0:aba:5f3c:a03:fc99:2a4c:41a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b7741bsm11426818f8f.98.2025.06.16.07.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:43:15 -0700 (PDT)
Message-ID: <31ce7637fcb1a893be4f83ddbd6561769f9c4283.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 22/24] python3-typing-extensions: upgrade
 4.13.2 -> 4.14.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Mon, 16 Jun 2025 15:43:14 +0100
In-Reply-To: <184987666B98142D.22186@lists.openembedded.org>
References: <20250616091643.918-1-wangmy@fujitsu.com>
			 <20250616091643.918-22-wangmy@fujitsu.com>
		 <18498734D88F1AF0.22186@lists.openembedded.org>
	 <184987666B98142D.22186@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 14:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218829

On Mon, 2025-06-16 at 14:00 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2025-06-16 at 13:56 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2025-06-16 at 17:16 +0800, wangmy via
> > lists.openembedded.org
> > wrote:
> > > From: Wang Mingyu <wangmy@fujitsu.com>
> > >=20
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > > =C2=A0...extensions_4.13.2.bb =3D> python3-typing-extensions_4.14.0.b=
b}
> > > |
> > > 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > =C2=A0rename meta/recipes-devtools/python/{python3-typing-
> > > extensions_4.13.2.bb =3D> python3-typing-extensions_4.14.0.bb}
> > > (91%)
> > >=20
> > > diff --git a/meta/recipes-devtools/python/python3-typing-
> > > extensions_4.13.2.bb b/meta/recipes-devtools/python/python3-
> > > typing-
> > > extensions_4.14.0.bb
> > > similarity index 91%
> > > rename from meta/recipes-devtools/python/python3-typing-
> > > extensions_4.13.2.bb
> > > rename to meta/recipes-devtools/python/python3-typing-
> > > extensions_4.14.0.bb
> > > index 9c83ae6c61..1c03aacc10 100644
> > > --- a/meta/recipes-devtools/python/python3-typing-
> > > extensions_4.13.2.bb
> > > +++ b/meta/recipes-devtools/python/python3-typing-
> > > extensions_4.14.0.bb
> > > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3Dfcf6b249c2641540219a727f35d8d2c2"
> > > =C2=A0PYPI_PACKAGE =3D "typing_extensions"
> > > =C2=A0UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
> > > =C2=A0
> > > -SRC_URI[sha256sum] =3D
> > > "e6c81219bd689f51865d9e372991c540bda33a0379d5573cddb9a3a23f7caaef
> > > "
> > > +SRC_URI[sha256sum] =3D
> > > "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4
> > > "
> > > =C2=A0
> > > =C2=A0inherit pypi python_flit_core
> > > =C2=A0
> >=20
> > Something in this series is breaking ptests in large numbers:
> >=20
> >=20
> > stdio: WARNING: core-image-ptest-python3-xmltodict-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-cryptography-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-click-1.0-r0 do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-webcolors-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-wcwidth-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-uritools-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-trove-classifiers-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-rpds-py-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-pyyaml-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-pytz-1.0-r0 do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-pyasn1-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-pefile-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-pluggy-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-packaging-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-more-itertools-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-markupsafe-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-license-expression-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-libarchive-c-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-jinja2-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-idna-1.0-r0 do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-hypothesis-1.0-r0
> > do_testimage: There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-calver-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-bcrypt-1.0-r0
> > do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-attrs-1.0-r0 do_testimage:
> > There were failing ptests.
> > stdio: WARNING: core-image-ptest-python3-atomicwrites-1.0-r0
> > do_testimage: There were failing ptests.
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/115
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1712
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1712
>=20
> Example failure logs:
>=20
> https://valkyrie.yocto.io/pub/non-release/20250616-61/testresults/qemux86=
-64-ptest/python3-click.log
> https://valkyrie.yocto.io/pub/non-release/20250616-61/testresults/qemux86=
-64-ptest/python3-hypothesis.log
> https://valkyrie.yocto.io/pub/non-release/20250616-61/testresults/qemux86=
-64-ptest/python3-jinja2.log
>=20
> Most showing:
>=20
> ModuleNotFoundError: No module named 'pygments'

I confirmed it is the pytest upgrades that are breaking things.

Cheers,

Richard

