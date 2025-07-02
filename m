Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFAEC83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 10:37:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.20541.1751452642325738491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 03:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VSHDKZW9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d3f72391so44781165e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751452641; x=1752057441; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlJ7JgC/W/55b50ca6auxHXSxGvWL1fYKYSl9Fp/QZs=;
        b=VSHDKZW9gnowo2xEdS0ELnwwQgTmP5LnZvFRkjb+zVHqPVBDMyOjs/6KdHONg77l6P
         waFSA1RQmkgILlzHuFWZrpbI3PHgDioG3Iqqd8OF9+EfvwRsnLlxT5kzgJr8rUnkINqi
         SHwtPtDEoq7JA0oO834lw8iyBPz5Uq12ygbYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452641; x=1752057441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlJ7JgC/W/55b50ca6auxHXSxGvWL1fYKYSl9Fp/QZs=;
        b=IdRHLICUwk6mF3FF6Mcsv6p0eUpHet3XqxUVbSbuC6+G3FsKXBhZQ3ZVkApx4TVy5B
         yVnHWd3ggg6YPiDucriFUNuZ/Tr7UcqbQeKQFh0olP8MN6cbNmCUWyJfOuSStfmRWgqH
         6swJaRFpdNAqQeYDZgODIlmI1yHCCqNzFlVdZVyXhI4rxJCA8+vJI9sGK1QQGbw1cer9
         CKpw/YTG+ItHRfbg6f7DuQ4b2a7Gc+xBiQUs+wdO4p4uJCOCefRWtcgkCi/Jd5dkzsJ9
         L7t4r6MlZhYAEpn7+YGlRq8G34Q8uqFjZLsvnUdwnDhW0LrxCPRIU6JnCc81mNULqbY1
         LpRA==
X-Forwarded-Encrypted: i=1; AJvYcCUlKQw1bXZLFkvX+UwgDfIHTNmTWMhpd2kz+kuiNBM0whXOViU3sYXFFtYzG7ik6x0AWiNwg9bVElp6Nao6eynjjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywj4ndNA0wk3hV+XC1RE183Sc8Dc6HNUd4QlwzLC63y462KDjyf
	OvFHc46/8lsCFGi7ZagK9i7m+5iTfNeuEkNonQwaDt4ZWnMAyqTzKvjzH+1l1ZFb2bM=
X-Gm-Gg: ASbGncsiE16PS8BJvexJUxlURCfdLwA6HwedghqcmhReeyBYo0+oQhBv1j4aHHVl5Yu
	CqoEnHJnfS6V1XI1BuA2rWPLNb8K0gus3EGbSfH30lPN/uzP8+R9IUI1imc3jFxU/FOTDZmc1DM
	FqYibUVfoHeI0eO/NmvOfF9C2M4n7QYYXfhMukH5iOWvBDc8QZfLDarrOHLFx0Ox5/e87zSB8+L
	HnXDY2tzk7O56gzdc/Eak81qt73YMKb9j1ODRnNzwvlz2huhvONd3bMDx8WfTqL6fP+DESbZY0x
	yq1HH3Ishh0oGQGOFSIyhI7gMofeflpPFmM9B5anO0Bcmug1WpCr9Xb/m6SMo0X3rEeBdI7Vghp
	qnn+LWE8bedIE/1xBvExnnbCucW1qVfqq2Av9XvXe5BrtWC2xSSQ=
X-Google-Smtp-Source: AGHT+IF6PbX+mfNzebK4ERLrQkxNa7TdeQu/v0Ws7/03p1fPfOFfooLhVKOhbBZ+Y32rO1cPWr2u+Q==
X-Received: by 2002:a05:600c:3584:b0:453:8bc7:5e53 with SMTP id 5b1f17b1804b1-454a3b2ccfemr24024985e9.0.1751452639969;
        Wed, 02 Jul 2025 03:37:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86? ([2001:8b0:aba:5f3c:acf3:9ed8:45ec:fd86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm228073695e9.2.2025.07.02.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:37:19 -0700 (PDT)
Message-ID: <ba9c7714964d297d5d01a4096bea739f8f16d62c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 5/5] sanity/utils: Directly use gcc instead
 of BUILD_CC in host_gcc_version
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: antonin.godard@bootlin.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Jul 2025 11:37:18 +0100
In-Reply-To: <DB1I2N3JADAI.3AFKK4PYIHWQW@bootlin.com>
References: <20250702053220.4104358-1-raj.khem@gmail.com>
	 <20250702053220.4104358-5-raj.khem@gmail.com>
	 <DB1I2N3JADAI.3AFKK4PYIHWQW@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 10:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219818

On Wed, 2025-07-02 at 12:33 +0200, Antonin Godard via
lists.openembedded.org wrote:
> On Wed Jul 2, 2025 at 7:32 AM CEST, Khem Raj via
> lists.openembedded.org wrote:
> > This assumes GCC compiler, so feed it one, BUILD_CC might point to
> > clang as well in that case it fails.
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > =C2=A0meta/lib/oe/utils.py | 10 +++-------
> > =C2=A01 file changed, 3 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> > index 27d304ec72d..d31f8c3db36 100644
> > --- a/meta/lib/oe/utils.py
> > +++ b/meta/lib/oe/utils.py
> > @@ -446,21 +446,17 @@ def host_gcc_version(d,
> > taskcontextonly=3DFalse):
> > =C2=A0=C2=A0=C2=A0=C2=A0 if taskcontextonly and d.getVar('BB_WORKERCONT=
EXT') !=3D '1':
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 compiler =3D d.getVar("BUILD_CC")
> > -=C2=A0=C2=A0=C2=A0 # Get rid of ccache since it is not present when pa=
rsing.
> > -=C2=A0=C2=A0=C2=A0 if compiler.startswith('ccache '):
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiler =3D compiler[7:]
> > =C2=A0=C2=A0=C2=A0=C2=A0 try:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env =3D os.environ.cop=
y()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env["PATH"] =3D d.getV=
ar("PATH")
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output =3D subprocess.check=
_output("%s --version" %
> > compiler, \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output =3D subprocess.check=
_output("gcc --version", \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shell=3DTrue, env=3Denv=
,
> > stderr=3Dsubprocess.STDOUT).decode("utf-8")
> > =C2=A0=C2=A0=C2=A0=C2=A0 except subprocess.CalledProcessError as e:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Error running %s =
--version: %s" % (compiler,
> > e.output.decode("utf-8")))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Error running gcc=
 --version: %s" %
> > (e.output.decode("utf-8")))
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 match =3D re.match(r".* (\d+\.\d+)\.\d+.*",
> > output.split('\n')[0])
> > =C2=A0=C2=A0=C2=A0=C2=A0 if not match:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Can't get compile=
r version from %s --version
> > output" % compiler)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fatal("Can't get compile=
r version from gcc --version
> > output")
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 version =3D match.group(1)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return "-%s" % version if version in ("4.8", "=
4.9") else ""
>=20
> I can't apply this patch locally, isn't redundant with patch 4/5?

For the sanity gcc/c++ ones, go with what is in master-next as that
appears to be building ok at this point.

Cheers.

Richard

