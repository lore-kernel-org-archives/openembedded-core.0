Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81599E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 12:46:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.17721.1736513207065987563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 04:46:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=drYMzOBg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43622267b2eso21987315e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736513205; x=1737118005; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BKMADq+KKm108rojT3sAuoS/RTE01Ls8Je1ZPowRBKc=;
        b=drYMzOBgrBu1P87yI2iKxJa6C6vyz5dNVAI8iWdzRi0P/omyD39LrYIohKDugHwx4G
         a6pg9J9pr5EPDVcp3DYnv8SV6JPnnsiBpCqKQkf0ACEYeHAteR0Dequmi0RC8TbJ4Npo
         Ic7Eup46bH7nnrD/SDqfr+NQQZFoMii4OxlrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736513205; x=1737118005;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKMADq+KKm108rojT3sAuoS/RTE01Ls8Je1ZPowRBKc=;
        b=hUsyoq92Jg8w6+WCre3AMR3vkvl7+GNodjCE9W5OswvKRa19K2jVVYNAU4tOnAL0RS
         NkzB3A5OhaBa/p/LHXHB415kYM+dQnBmHUyLvPTX0wK97aHoQqYzCniJJWz3ruPSH6eP
         j3VGN13fugMuQ/52t18zV/u4JJIrYPEXgtvouZR2et5h//lJpWmtpS+D2HEa/d4UvSII
         eXyasuyDv45XyuCY5LTGJHC286m4xpRc1hMTYGyZooIRWfuv0j67nyMfSZmWifvidCGN
         E45yhGUBBScD2EOcqtSeBGo8+fBWSBMqxO58ww+gfTQ6dnDg4h1vEv+eXnXAMKRMKin7
         mduw==
X-Gm-Message-State: AOJu0YxLBQ/y+NRApy/Y5cRAyWFE0c8+x9JkcihoKve1Qt4lh4AsfjnO
	LcIfbP7wLHd6x9E5cB4ra9gwZT6cY3Ds+Tvq8ymuOFFVVN/AmZJrGidLsgvgDXU=
X-Gm-Gg: ASbGncsCQAM3UbvLPCxzCxQMlvl3LY9TXStK3ammSlfEtJ7tswZRQ1Q+v7IYXP3E8h2
	qWKIokAbI2fFjkYcuPJHcbJ86Z336SDAgqvqUAy55KYvuCpjZp5MrEPCwECmrsI24w8QrW/igUg
	JOklH+irKlGLyZuPu4YfRHC9gak9c/1okI3sjgDpacMGkcwU/pOJkO/W7HSZ9aPDIjcPVCC9j+m
	ULYHHG01G5xps8JW5PPejNNZsVMVFxLVPe/azvzceW0RA+2BkY15w7b0eq9FXMK71CQpJ6pVGF3
	vh31FHnmZb5UNcbaV6nR5pVttNKKE2MrrrrShdG1O7Hxpw==
X-Google-Smtp-Source: AGHT+IG00EVR7y7t/Z46fo+UXhhz6VN8n8QjFud4JwSKGO3XT62gd1p1dDgIJE6tNFtkcqSmdz5+wg==
X-Received: by 2002:a05:600c:a44:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-436e26f0b38mr87955505e9.27.1736513205039;
        Fri, 10 Jan 2025 04:46:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d? ([2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0casm4501860f8f.11.2025.01.10.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 04:46:44 -0800 (PST)
Message-ID: <7f4a93609a5c21d6e8f3b545ce6f0d7ad4acc659.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] rsync: clean up configure/configure.sh
 fiddling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2025 12:46:43 +0000
In-Reply-To: <0C7DDCC9-98ED-4268-B74C-5B96CD823D43@arm.com>
References: <20250108154636.1431857-1-ross.burton@arm.com>
	 <b370315d6569875756feb0f98babeae2fbbc59f3.camel@linuxfoundation.org>
	 <0C7DDCC9-98ED-4268-B74C-5B96CD823D43@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 12:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209645

On Fri, 2025-01-10 at 12:18 +0000, Ross Burton wrote:
> On 10 Jan 2025, at 10:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2025-01-08 at 15:46 +0000, Ross Burton via
> > lists.openembedded.org wrote:
> > > The upstream Makefiles tell autoconf to write the generated
> > > script to
> > > configure.sh instead of the idiomatic configure.=C2=A0 We now remove
> > > all of
> > > the Makefile rules that refer to configure.sh (makefile-no-
> > > rebuild.patch)
> > > but some pieces remained, so remove them too=20
> >=20
> > "so remove them too" - was there a piece of this patch missing?
>=20
> No, I just failed to express myself clearly.=C2=A0 Embarrassingly I
> rewrote this message three times already!
>=20
> What I meant is that I removed the configure/configure.sh
> workarounds, specifically:
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${S}/configure ${S}/configure=
.sh
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp -f ${S}/configure ${S}/configure=
.sh

Thanks, I merged with a small tweak to the commit message.

Cheers,

Richard

