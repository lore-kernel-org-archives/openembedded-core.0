Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4306AFC9EE2
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 09:52:25 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6477.1772877136504772741
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 01:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AZdUluBs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso82893755e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 01:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772877135; x=1773481935; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y53EuKtKbsC37kIHg/ES8rjxrTw40vAM5t9UrxHOc88=;
        b=AZdUluBskCfUVG8UY7mhtE7gRGCLhmZg1gf6aIs8MF2Nd3btQJ/QV+0n2qWDOMRFho
         YP/TsrGO2lVleDxii9z3omjKuxQdBQCT6unQFqSH7HMSlS3Em6hobCu2LSsbNYwVmGEN
         /6ZnXuPN2DpNLnYcXbImms9iu/Y36wM1se5+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772877135; x=1773481935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y53EuKtKbsC37kIHg/ES8rjxrTw40vAM5t9UrxHOc88=;
        b=Z2S64cyaVVIwc4O6Gta1jb2k8irzj9RKSd/URKIIKWhJzVnPvo7s5HQ6tYsrnfnDmf
         zzeq2CMhMJc7F4x4HyYgZhQyZUApj0A5jnr0TYy88lzDh3Ayd/YHADSmvPIiYC8y+rG8
         dmZzr5M9eesQuxtqBZ/QdM+Mx9pLBbEjhyxJ+iVCXZqkkbR28qtpjLcAHmjCX0eYOSoX
         8QH1YZpmsvGzmckhPHhh/o2UA+0UEvPGq8dukojVG2sMYA1u+NOaf3EUpCfW7VdQedn2
         KQO6FE4DNFy1mpeuQEn2fg46veOjNKl4joDdT1A+y3NBfVpgOlyuHBHFnnxh09TjkOKp
         cHmA==
X-Forwarded-Encrypted: i=1; AJvYcCXzwEzsO4GH82dV4wbjZ9w9mql4Jyb8+PMtGeKfIMDWcMj+xQDlQUPqpZBgU87vOqW4t9I62gqng32yNRR3e7tFPA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYvgaMLdSOaLoIrAhwP9wPB+xUJJnCjqK5HNYn9eGLGnAahvwZ
	ENKBlOQr8JOFD7y8+WooFTB9v/rGyq5tvyyIAWUge/X4PnC542NGtglXIufHj8iUzUc=
X-Gm-Gg: ATEYQzx7CeamvPLQR0S2kfoWYt4ebiPrCoLu6KqlqRSaypev8p17WyFxHwIu0KAvc0p
	qdus8DLEClHPK+UeRnPF+uM6kCFPAYXQFtn1oPvcG2Q+gj40W3gU15Y4/brXuYxqP8E0/2sAV4z
	Gi6wLVhpNBXfLzfeo6pMjZINw5ai9Fd8PcDYDq0EvAmrU77AEUUOpS4NhIlhcch5C8y4Uv64kko
	BusQ2FjgY1XOjcnNsZsyUOuKfWRDny3DkM63EMaxyiNdHYLAieH4IhMg6tM6hPrgeErEBijfzXB
	j0AONfdfjTxb/lNNglN6zFQkSnOjb7opF3yDpQvcEXjnRMVCEQaoN60HOFLBh0RLbC8h1wpJaTS
	hD0GhmjDUsuoWQEf+ghh5jokmeUiCS2Q5lq+oHOPPGY6rkjwqIouTxIBjXsDBXG+++/GfilNyFp
	mKSE4YtTRvkjpYbs2k4gp5oGMRterpFbNmOuXlCG/WT+1SmslHg5huM37B8dRyqkQ27P2NMm5sc
	HwHaQjLgVQ7lxXzJsqVKrIOcA==
X-Received: by 2002:a05:600c:45c6:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4852691d571mr80006675e9.13.1772877134754;
        Sat, 07 Mar 2026 01:52:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72? ([2001:8b0:aba:5f3c:d746:2cdc:e7ea:aa72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm11138983f8f.7.2026.03.07.01.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:52:14 -0800 (PST)
Message-ID: <b6bc0991fd5aa011365062d0f6caecfdec557273.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 2/9] wic: move sample *wks files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Murray <scott.murray@konsulko.com>
Cc: twoerner@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 07 Mar 2026 09:52:13 +0000
In-Reply-To: <c9a6374b-9aa3-07e9-3839-2e78615e46df@konsulko.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
	 <20260302003826.3995222-3-twoerner@gmail.com>
	 <08808bc90a211c8ef9550cf3a30940629bc16299.camel@linuxfoundation.org>
	 <c9a6374b-9aa3-07e9-3839-2e78615e46df@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 09:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232608

On Sat, 2026-03-07 at 03:59 -0500, Scott Murray wrote:
> On Fri, 6 Mar 2026, Richard Purdie via lists.openembedded.org wrote:
>=20
> > On Sun, 2026-03-01 at 19:38 -0500, Trevor Woerner via lists.openembedde=
d.org wrote:
> > > By convention, wic will look for a "wic" directory in the top-level
> > > of all BBLAYERS in order to find *wks files. oe-core was the only
> > > exception; it stored its *wks files in scripts/lib/wic/canned-wks.
> > > Take the *wks, *wks.in, *inc, and *cfg files that were in the canned-
> > > wks location and place them in a "wic" top-level directory in the oe-
> > > core layer, thereby following the convention of every other layer.
> >=20
> > This commit message is not strictly correct. The current code looks in
> > "wic" or "scripts/lib/wic/canned-wks" in every layer, not just oe-core.
> >=20
> > You're dropping the scripts/lib/wic/canned-wks search location for all
> > layers.
> >=20
> > I agree it is unlikely other layers are using that but the commit
> > message does need to be correct. That in turn will lead to better
> > migration notes for the release.
> >=20
> > The bigger issue is that if this isn't documented correctly, what else
> > are the patches doing which I haven't spotted? :/.
>=20
> So far in a quick ad hoc search of layers I've got cloned locally
> I've found meta-sifive, meta-qcom, and meta-phytec that are using
> scripts/lib/wic/canned-wks.=C2=A0 That suggests dropping support for
> that location does need to be clearly called out in the migration
> guide.

Thanks for that, I had assumed this kind of search had been done but
clearly not :(.

I'm guessing the removal was triggered by the aim of removing "canned"
from the name. I shouldn't have to guess but...

Taking a step back, if I was asked what the location should be, I'd
probably have said meta/files/wic, since the files directory contains
all our "misc" files. I appreciate that isn't one of the current
locations but perhaps we should just add that, leave the existing ones
and people can migrate as/when...

Cheers,

Richard

