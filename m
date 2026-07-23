Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1689C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 20:13:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5559.1784837582803672886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 13:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FKi07yoi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso732228f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784837581; x=1785442381; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zrE9bSIKamBvNHVJD0yunYpQ8NanGDThA7DoPox3qyc=;
        b=FKi07yoiE3ULRObcBq5/xcmUKycLPqCiSHYwAU6kM44Y0shhmhZIh/x1XZ/LQKarY4
         Qy4F/fCxTnlfNz05/UK1yKG6ScUDnDDKZ6rT8cEQo9VvHqjq9mjNy0+ueLQjlrzF9T3V
         P3079rD7Su6eehrLNWbTIgsJg3Tav9Wb/jpKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784837581; x=1785442381;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zrE9bSIKamBvNHVJD0yunYpQ8NanGDThA7DoPox3qyc=;
        b=KarftX2Vnjm7Lk99dSir13Cpnu13XzoHE3Bau5ow+MPRSJ+iO3hTxm2OcOAFHo3TaT
         p0XoH289zr8xlaa/5tE1hMQV9Fc/DQykX4FGoKd5u/w3MA/O5mxb3gaQzjxNnhdyRCmv
         +prVFGd5l1R8Oq1i7M9i887mzKsXB++iwsRjI3qryQnv6NtSZYiDsrXodHdYeAWIC6iN
         L/T+2Fu/dZfXtWVZmX2hClUluWgvZ5nrIp1n5uohMzG3dqovAiMgaRQe83YaoUEu21yI
         /Yoz2VBv2sIR/v0lmROT0ON9xb9gluuAvEf9p9kLlrXIg8HZdw7zdnAbdxh4MYgAXCVj
         jn4g==
X-Gm-Message-State: AOJu0Yxb/pOhVs3CBXsk+ikw7z5CFqQTEg1OEODQp2h0n3GxUHpqDdki
	iqdBSfK2vumL9XuzIicXvVGwQXZ9CXZVqRpJ6Mln962BjFHyd4JUDXmj2okVPGF502I=
X-Gm-Gg: AR+sD10qNL6529Uvr4RVOmKr9M00ncjMdYhUpQCQgc9GjN3h7esIYSeZMjWc8me7jvi
	IqDjyBUCkODs7Q9HYQuGXYnrl18pF0GHDcib1SudK2c18AOvX+hKUWGFJ0vMFpTtY1vPyBC+qEP
	pYzWnT5rh96f7TaHUHe+AQ6tQ/hDMnjJrjaly2ghm880wwJcg+RWC4uPeRMDLSwSoclxzwN24Sw
	NEJ59QHgcgm6cPNu3IBdhQo1CttF2okRmrjeSQwnAxKyRbn3vEnjkm4XTdDal3LGM2auAMrEVYF
	YMR0DwzmvfTJVI3CMeap/QwSh+G0PCj1ARTl6evkkB67xmY54fu07P+TkEx2GQ0e4JyqTuWd0MW
	TXSRz+Z5h8B7x7IJphy3NrHQRxXENOzyYeOyU4cIfcRNtZiTNuDXS4CpKKdhAt7Pe+gvxgm9+ad
	vCbS0MyvNJTpUAp/PN/v7WyRYlA9bu31P2OFBD+gYHp+MosSczp+U7bGpdk2DDgmG93zI=
X-Received: by 2002:a05:6000:200f:b0:47f:85a1:32ff with SMTP id ffacd0b85a97d-47f8d71c6d2mr6037885f8f.13.1784837580967;
        Thu, 23 Jul 2026 13:13:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:462a:8710:d4ff:20b9? ([2001:8b0:aba:5f3c:462a:8710:d4ff:20b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c7880dsm19130356f8f.37.2026.07.23.13.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:13:00 -0700 (PDT)
Message-ID: <d709dc9b41881ed66e10c45c4dd74ab899c9ceac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] default-distrovars: Enable minidebuginfo
 DISTRO_FEATURE by default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer	
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <ross.burton@arm.com>
Date: Thu, 23 Jul 2026 21:12:59 +0100
In-Reply-To: <CAMKF1spi9oaw3fWW290ryPd2ae-dbBHA3OvbGEE1_H5xYwgLJw@mail.gmail.com>
References: <20260723134101.864910-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1spi9oaw3fWW290ryPd2ae-dbBHA3OvbGEE1_H5xYwgLJw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 20:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241870

Hi Khem,

On Thu, 2026-07-23 at 07:48 -0700, Khem Raj wrote:
> Since default policies are generally used by derived distros,
> changing this default may have broader impacts. I wonder if the Yocto
> autobuilder issues you mentioned are commonly seen by OE users, as
> this change will embed symbols into binaries that some users may not
> expect.
>=20
> Additionally, there are alternatives that people might have already
> deployed. I would suggest seeking user feedback before enabling this
> by default in OE-core.

Our defaults tend to reflect developer usage rather than fully hardened
and given that, I still would lean to make this the default, allowing
easier debugging of issues. I suspect if you have issues with the debug
symbols, you already set your own distro features...

The original proposal was to enable it in poky, however that would
"fork" nodistro and poky sstate and I'm not sure we want to do that? We
had decided to try and keep them more compatible for better sstate
reuse and faster builds "out the box".

I'm open to opinions on what we should do if anyone else has opinions.

Cheers,

Richard

