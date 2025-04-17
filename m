Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F85EC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 13:03:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.8180.1744894996334546479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 06:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QhsNer5+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c266c1389so542939f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744894994; x=1745499794; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z1QP8sLvQd7IVvmLYRFEDI3s3GCTo6iXAcZxjzqShvY=;
        b=QhsNer5+o115fkHP7JZEEFkAJfSi30WQkl+NOwSZHCtIZhezXnk6D9CkkWVaW20+WK
         jkyqMJs804NU3pk1U8KcLgzhyqgf3tToE0FiCYUzmLz6P4gPf3b8OD3H7Nr4hD+10nn0
         ep3GqTusYdLp/4bNG8ltM0DvSweqU77V9h9Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894994; x=1745499794;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1QP8sLvQd7IVvmLYRFEDI3s3GCTo6iXAcZxjzqShvY=;
        b=hVZlHNACeXqnBDr7fV/GYQHSRAAfOkxPbBDuNbRh9oM0Rzobxd30KGisf6pseEX1ji
         vWN+vwuTfIm0f5rYgCQUk4b3n1izB+d+/H90HfIJKaQhdOhZCj5QNZmFjUxoKK29+3Rz
         S4yLL65PFaMozkrc31dqNSST2BxpjHA/N/uxhclMVILjjFOqzHOPqeVUqb8EtW5BcaVl
         hPFyN970dmxOAycCxsWGcMznxNdeZ5tY3zu/J9x4eml6obOu4fmxP95PaPtxs2Gal+hL
         snH3qfCfF1a8mmWK36g2ZJO+f+A9JR+GwS3sEdNJ59J5pRDdrkCz1OF4HY7Iy4tT3k1b
         fHyw==
X-Gm-Message-State: AOJu0YzpavqYokKT810+Oj2OE/oXF59wODRaLbW+PInK+LAbe6Y60W2/
	cXVlmXwdDwu8vmbXq/X7VPE/n6nS+m35vsWt/tU3etLesTxZNPz1BBJVrKqb/jQ=
X-Gm-Gg: ASbGncss9+oJyJJSFAC5sp6u+w5KOd16DxOM+0f877lW/H49HpOVWa50JFOoEQTtsrp
	HdCYuRW9aHxBBi5tuYcxFz5XSWVtnkB9y7KmDUjl9yoHVxjjTiDbRFPBYqO/eKWZ/N+IWJQtLfT
	vld0vk/DCoI5yosbG1VCPHrWQvYKVwpTmIGcmrepsjP5joXxKCsBw6LdtBA66M3LEwb0NsN/HE7
	6U8dqHWlDza3TBKW93LWsWbT10zl+Hd4KaAEnAB43jkqZVW+Bbeo0jXoNovbR9LCxYv6UpopHgU
	I/wm6uLig7EymziOLVxDTAeGrMHwQ+UAvsJqwGq1USDSf8xeUyvbbDWDvzu/1GJglNl4tjfd3Ua
	VW14cfNx6EqcvzDUZjIG77I9t99ItWg==
X-Google-Smtp-Source: AGHT+IHIr5iYPEfqdt6maTS4V9Z9RTqIIBCip6iKEKAgstX+fNIgIH15EYE4cA53U9ErszoiOMM7EQ==
X-Received: by 2002:a05:6000:4026:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39ee5b13c0cmr5376501f8f.9.1744894994091;
        Thu, 17 Apr 2025 06:03:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c08:678e:aaf2:4c3a? ([2001:8b0:aba:5f3c:2c08:678e:aaf2:4c3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce0asm20202705f8f.70.2025.04.17.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:03:13 -0700 (PDT)
Message-ID: <34381df1e0f5da0ba1e4512afc83fc1a99e9e54e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thune.a.tran@boeing.com, Chuck Wolber <chuckwolber@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "Wolber (US), Chuck"
	 <chuck.wolber@boeing.com>
Date: Thu, 17 Apr 2025 14:03:12 +0100
In-Reply-To: <SA1P110MB22506DADB11B27B51A1CC536B7BCA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
		 <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
		 <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
	 <1264db75faf2ae16362f1f05ea2b6b77e0fb7616.camel@linuxfoundation.org>
	 <SA1P110MB22506DADB11B27B51A1CC536B7BCA@SA1P110MB2250.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 13:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215077

On Thu, 2025-04-17 at 12:54 +0000, Thune Tran via lists.openembedded.org wr=
ote:
> > On Wed, 2025-04-16 at 21:39 -0700, Chuck Wolber wrote:
> > > On Wed, Apr 16, 2025 at 3:07=E2=80=AFPM Richard Purdie via
> > > lists.openembedded.org
> > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > >=20
> > > %< SNIP $<
> > > >=20
> > > > I suspect this causes some regressions in our automated testing
> > > > unfortunately:
> > > >=20
> > > > buildtools:
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/=
1
> > > > 396
> > > >=20
> > > > meta-mingw:
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1=
4
> > > > 30
> > > >=20
> > >=20
> > >=20
> > > Would it make more sense to add
> > > self.context_executor_class.default_cases
> > > to the list of paths returned by get_sdk_paths?
> >=20
> > meta/recipes-core/meta/buildtools-tarball.bb does:
> >=20
> > =C2=A0=C2=A0=C2=A0 cases_path =3D
> > os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)=
),
> > d.getVar("TESTSDK_CASES"))
> > =C2=A0=C2=A0=C2=A0 testsdk.context_executor_class.default_cases =3D cas=
es_path
> > mingw does things in a different place, setting:
> >=20
> > =C2=A0=C2=A0=C2=A0 default_cases =3D [os.path.join(os.path.abspath(os.p=
ath.dirname(__file__)),
> > 'cases')]
> >=20
> > in meta-mingw/lib/oeqa/sdkmingw/contex.py
> >=20
> > I think we need to add something which represents the name of the
> > directory for cases, i.e. "sdk", "sdkming", "sdk/buildtools-cases" and
> > then allow this to be passed into your function so regardless, it allow=
s
> > customisation within a layer.
> We can match the test directory pattern (sdk, sdkming, sdk/buildtools-cas=
es)=C2=A0=20
> found in default_cases. The test discovery will then be based on the matc=
hed pattern.
>=20

We could do that but in this case I think it might be better to improve
the code and make it a bit cleaner if we can, even if that is a little
more invasive.

This area of the code could do with simplification/cleanup...

Cheers,

Richard

