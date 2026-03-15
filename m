Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B046D58B0C
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 08:07:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25158.1773562018492051891
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 01:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YDj4WqOt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so360839f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773562017; x=1774166817; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ejJy7zgkXoWO1/c8LMHBOlYevluM0kXrZncEctCnqiE=;
        b=YDj4WqOtB2qKXB0RcWJ+A9n4loKBgqrr4PvCm5rmsNMrT2H6V+Cl6Z4e7n+zE8seVx
         vzrrmhR9givANSitRb44qd5ItqnreQWWDsIHFzCuX64CjbKtU7yBu90VhBB7LPoHr4jx
         H5yZfn4UXv7Y/HTeQOrAPOtYA1AGc8Z2O65Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773562017; x=1774166817;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejJy7zgkXoWO1/c8LMHBOlYevluM0kXrZncEctCnqiE=;
        b=hC5QPURkYXU/U9n0Cgh/nn8oIWGrSWZnfWd5ZWdzQ9QBdQzhMgjozX8wzEwg4SoIO0
         ROPYTutfOpqXXTHspouvfY/MWuWhNKEA6kEnGB2FAWqg4Zjf6GxBeTaRba6Qgkpzsrje
         Fv+o3v22S6o4sIwXKZkAFDiSi/yazgDwpFe8pYTNoDtq6waJzshG5ur8f11MuYyt+4Yo
         sKJS/fJxDV6Fbtjj8fIFBcLfl5mmA5nHV3N2haHZVaCWtZ8dAIBb5Z4S1C+jMG+8566G
         GqkCR8TbEtW1JrgpRnGaDYfNjkklmQnYffREFFJgXhWx6EpU0LxK4GWRNMCc28Vr8lX3
         WTCg==
X-Forwarded-Encrypted: i=1; AJvYcCVCpaWSAo+QSspW10eB7AQ1V1s2Q67hK4UP480hohHyNs4Ug56HBa6Wgzp9SZwJewcMHWt8fN628lAHMgWMa6QdoQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyNca9tdxadQXm5fceZDYrMZd6acKhrvTZ0qDqjbDN7H9Op6319
	ypgrb8dE954KggpPnHpiT0UiuYHM8P86ftU044ox4t8AxpTuISjoTvz0uW/Di5HO3w8=
X-Gm-Gg: ATEYQzwzYmSTQLf/1P2wBoWRv+kq1TJttgVSVdP6eQUjLEwdSFWf63/37owyNoj3hkA
	Iie9eC5hGSeThpIjVeCPmzu1FKuLb2cbOf2LAv+OuCfDYQknS6lQg4fAOcMvVo4MCf5A7JOQE9M
	rmKN/EI7fgc+jrfJw/G+9/lMjbl5ukDyh9c+im3zhXjItWUScTAROpeoDmdjleWyNZFpP6IFlpS
	o8SR9ZZx9Dqe0u5GmgYnvR2m2YNd5CYSU6zhaadyyBMurlbk/9VYBoG2N8lpbrb7+O1toHU2W7E
	U9gpalTVufNgsSCHTs1D1XeNtDLMYq04Yt0kn6y9K/1i3TLQo6nd4U75Nd61dpGn2A6v9CMajxr
	gaPu4kGBM0MEJ92pnBdKx52ngJyE6YASXEcTqN3fNuVB9QF+Wirv5ThkfZNP0TnVXvFLxfNJ6us
	JWLQQKln6hTpxi4UgIN5jxMSLcH56pg6JyLShhb0u4wqgcXg9+mG5aq8TT7HJBQVIGCw1bB6umU
	ZAJx8Z7oY9F/mc=
X-Received: by 2002:a05:6000:22ca:b0:439:ceca:421a with SMTP id ffacd0b85a97d-43a04d81541mr15793216f8f.9.1773562014854;
        Sun, 15 Mar 2026 01:06:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4bdd:38a4:d775:33fd? ([2001:8b0:aba:5f3c:4bdd:38a4:d775:33fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b41ff92a6sm1712949f8f.11.2026.03.15.01.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 01:06:54 -0700 (PDT)
Message-ID: <58ae4ac982fe57b72619d243f54639a6298867e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] machine/qemux86-64: Recommend extra kernel
 modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alistair23@gmail.com, ChenQi <Qi.Chen@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org, Alistair Francis
	 <alistair.francis@wdc.com>
Date: Sun, 15 Mar 2026 08:06:52 +0000
In-Reply-To: <CAKmqyKOE218MkSbGyVPHxmi-h6u9n=V+QD0-hMUYGMSXRZ=biA@mail.gmail.com>
References: <20260305053505.1632077-1-alistair.francis@wdc.com>
	 <CANNYZj9FNw4F0228tOo_BJUzrkvWFy-_5pLDv7XG=J-Z3FWP0A@mail.gmail.com>
	 <CAKmqyKP7+qWZfEsg1R8geLVeOoime8w0wAOf5kK2qp12PDZ+bw@mail.gmail.com>
	 <24cfe9bc-6bb7-484e-981d-464f059c6011@windriver.com>
	 <CAKmqyKOE218MkSbGyVPHxmi-h6u9n=V+QD0-hMUYGMSXRZ=biA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 08:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233104

On Fri, 2026-03-13 at 13:53 +1000, Alistair Francis via
lists.openembedded.org wrote:
> On Fri, Mar 13, 2026 at 1:27=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wr=
ote:
> >=20
> > IMHO, if you install all kernel modules for machines such as
> > qemux86-64,
> > which are used by a lot of people including layer maintainers to do
> > basic testing, then the problem of recipes lacking dependencies on
> > some
> > specific kernel modules will be covered up.
>=20
> Fair.
>=20
> What about adding `MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-modules"` if
> devtool kernel is used instead? Is that something we could do?

I think the kernels should behave the same for consistency.

If the developer needs this, that can add this as extra local
configuration alongside switching to the dev kernel? We could have a
configuration fragment for it if that helps people?

Cheers,

Richard

