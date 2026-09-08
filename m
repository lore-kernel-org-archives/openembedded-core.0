Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B16BC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 16:47:30 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12440.1788886042265303492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 09:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TOm1jBkg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so38925965e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788886040; x=1789490840; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=22D9EecqBdzJlpYRgZe7IWtLtwIPfLAMnVYIAmZkJIg=;
        b=TOm1jBkg1GkXkW4GkhpfYr5glxO39K9pIsAtwMYgjc64gcl9YoNphukh7cPfnKnlfU
         wgSccg0woFYsuFw8tn/Kg0NSuffFCecrl5Qvi6QLMeE3LjipJlZVPY6IhFYQz5N0to1s
         Uy6BfHvJExMogmhv5SkSTdA4OwxB4NODMNKgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886040; x=1789490840;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22D9EecqBdzJlpYRgZe7IWtLtwIPfLAMnVYIAmZkJIg=;
        b=MUcsLsjWfQWP+ZaeInR/IgB9CS8BHig4GKSPcu9GvzPYoFlk4uteFK/bmQFY4uS7/K
         TJWKQzrsMmyvpDQWqBMy+EWAs5jdD+N2RqRyBrQxQCGjW0JmR2jo5PYleWZ/eKtBEvlf
         gtlPeFSN8UuPJqb5+cqI0iW1XoxxF8WtgbVQFYSB2hEF+DM9J7Gd7UD+fqIqq8lnxStJ
         PuMdTSWTDoKg4ITnckRJswOM7NkJAXkyO6EdvYI+Ydqq4Ad21G1/9sirkW+Q/iVSvCIP
         1fmJWay2Z3XqiSLglyka+wq29FrmEQTOkOT5e6rzUos25N5ZiTbKTGEsJi26zAkSuorS
         YaIw==
X-Gm-Message-State: AFuF++lVVHKY16PPMlyfErTNYrt5l8OykppqjntbKF0KdrrZm5vNDhkI
	455whuuCr4PLzGEvKIxLorXNCD9PWU8ok04EjaophKYt16xs52EZlmGHBMyol1EI4uM=
X-Gm-Gg: AYBFou0dZ0d0xb92I+20f5ISBs/niLg+kBFYFTcOCnB80EDnzwcAvr0tlQ5vrdbJNqd
	i8vrLgYMcOSrNMgbUuxWMHz5WmCDwpYAsXKdb7CeHPJ6zj1NgCpAvRQnWOZIRlYQ9KVzcMwfQ5C
	9C9UKjTJkYsIqhR93MfMDbgCWCvv35kcAqQKfgB+fhQ0DKhiIS1cjxWNXTbucBe52zaGwPl5QJ0
	vPo9w4iRWux0BzcFday5tKYA0uHqROeLvCX6mLiNXc4HrOmXVE5Yf3EaJ3x1rmRjySXqwgehTC9
	u9WzBWZnNNrEy1aBOawCqWdfhZ0zwtQwLyOI3EvJBQ21rZI9H+kI/y21gioCwYtt243eU/8NNH1
	hQTAUWlaY3U+N5+tYKs1WANi6h1rhZkZGAo96cEDqpRsjKZrokwY+myt6ykaYnBkCu41S6oUljX
	O2Cm8Ukb3yB4DwFXyZct1mnGDO2agznbjXxMKyGu6O6u/1oySMIKvG5meyCDgsqpdkBBqXyJEa7
	H1VVUrPcYdw8FyACw1tXi9AdOLHK25MIPpfMsV9NNGZoGaVp7TSMmqNantQjALm
X-Received: by 2002:a05:600c:4f12:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49cfc6cbfcamr267430055e9.23.1788886039940;
        Tue, 08 Sep 2026 09:47:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3b52:472d:bd88:cdf3? ([2001:8b0:aba:5f3c:3b52:472d:bd88:cdf3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm530266575e9.14.2026.09.08.09.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:47:18 -0700 (PDT)
Message-ID: <15e83ae0c193bc72601abba8abd3847588041c25.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] RFC: Semantic change to
 PYPI_PACKAGE in pypi.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Sep 2026 17:47:18 +0100
In-Reply-To: <14956EB6-0E04-4267-B7CA-AD9E92EDEFD6@arm.com>
References: <18E925A3-6509-4631-86DD-7420C1B3C18A@arm.com>
	 <14956EB6-0E04-4267-B7CA-AD9E92EDEFD6@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 16:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245383

On Tue, 2026-09-08 at 15:01 +0000, Ross Burton via lists.openembedded.org w=
rote:
> On 7 Sep 2026, at 14:09, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > I think this is the right thing to do, but one thing is niggling me
> > which is why I always stalled on finishing the series. We could say
> > that PYPI_PACKAGE is the normalised package name (so, jinja2 not
> > Jinja2, qemp-qmp not qemu.qmp) instead of the real name and that
> > would remove the need to normalise it any further.=C2=A0 The sdist is
> > based on this normalised name, the releases API uses the normalised
> > name, the homepage links work with both original and normalised
> > names, and in any future automatic dependency generation we can
> > work with normalised names anyway.
> >=20
> > I=E2=80=99m torn on this: using the real package name is =E2=80=9Ccorre=
ct=E2=80=9D and easy
> > to explain (it=E2=80=99s the name on pypi.org <http://pypi.org/>, or in=
 the
> > pyproject.toml) but using the normalised name means more recipes
> > would work without assignments. For example, with this change in
> > core we=E2=80=99d no longer need to set PYPI_PACKAGE for python3-jinja2
> > (Jinja2), python3-pysocks (PySocks), or python3-qemu-qmp
> > (qemu.qmp).
>=20
> So I added a QA check to validate the PYPI_PACKAGE against the built
> files and it triggered a _lot_ with case and hyphen mismatches.
>=20
> I=E2=80=99m starting to think we use the normalised name for PYPI_PACKAGE=
. We
> can validate that and any future generated dependencies will need to
> be normalised anyway.

I don't have any strong opinions on this but that does sound reasonable
to me FWIW.

Cheers,

Richard

