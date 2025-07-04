Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B68C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 16:21:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.88.1751646061634889299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 09:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IHJ5C9BO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so9542945e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751646060; x=1752250860; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Wb4B+a/0jHaKg2wA0yR/vGyW/PLwZXnW+A26TZpKJ98=;
        b=IHJ5C9BOpGzODx40dyJRwPXWR0aeYVbPesR7esavS8fd5RpiA5jTeloRhg37mNVIEC
         kUyfBW45LC8mQ68kMp2QC/nw7wGWC4Ub0SJZkXnsUg4t01hSijlhNlOOr5tP192ERbpN
         hsURMvRUEfHSqQQqlAssThVT9J0Y4YziKmDVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646060; x=1752250860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wb4B+a/0jHaKg2wA0yR/vGyW/PLwZXnW+A26TZpKJ98=;
        b=VGrRbv6Q/Ux4ltdpM4ql4PIcnJ4Jd4GVyWf41tApbCZGWGAznMFa9t1XfjIjUENmr8
         n+tBqrqgRK4JqYvwZRdV528Q420g9fKv+t8P90aUvRfJUU14tPDGlaV90hnUeBYEbtcQ
         1L007+BHb82hIcDOdse+c6OHBJ6unUl5r0KzFoeNwr1O4lA8h4DNTMeU6JTxUTyw7PPL
         uWyv69bBs0wclQGmDCRD1eWqeSr5mPdIYRwZPaNLqSg1c5rrJAbiuBMas7xJdHcTGtu1
         EfS4wwjnR0sWWRRQAKlBpHAcPMC0ZEyqZQnY/bTcVu5Hp7m0SIEOkjjLhfBlj8jyNJQu
         Meng==
X-Gm-Message-State: AOJu0YxcEja/PdUyAE8hphQZvts65dy8ttJ/b7/s6gEm4IJNOmVhGb0I
	612bbdR4EXoOuQGu3XazEm1UfhvGdMCnfJnbeYO66y74Xf2jfpKYEjTtPuH0y4oH6UE=
X-Gm-Gg: ASbGncvE9gy0sSWCZ9pqHAwmkXfJ7ZszPAehk8BFYl9W8NhMYOZGle0J5K0c6LLxya5
	sP4Kk5fDfbsPDc0r3jmWeAAkf4E72qgyeL78KH2YH3RD0tkV+KfpHK7oBVGwPQACH51XD69BrPr
	nizvyKeIicqHz5XR04ed7U/wa1mzi7RejhzQoGdhq6psBhk2xHobPSPajEPJKJ0ZAEOznSj5gzg
	xWsDzlB5HqAanaHf0nb2xhzTt0RE4iBJ1HzN3t5KV3Wtft55thePsCMwB0opzwm4dcpeuvRGtfi
	Uh/wa7al3+f+2vtyuhgVK8gtnJLnV185eYyfCeqsucNc3yfRH6ShYrVZMY8YGP4EPySqjHgR6aT
	L18yoljvaDAmRr9B8aPnNwJi1c/pbBZSBD/Ghc4tWRTmVmycnD1o=
X-Google-Smtp-Source: AGHT+IH7Mm/BJi9PvhwwXaXHsNCT4DZZpd3ppPzNisvOcOSK5Vl/dEo1FMG6lb0eOnTaavKiTCz3IA==
X-Received: by 2002:a05:600c:6092:b0:453:59c2:e4f8 with SMTP id 5b1f17b1804b1-454b4e6bc98mr25321605e9.1.1751646059877;
        Fri, 04 Jul 2025 09:20:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609? ([2001:8b0:aba:5f3c:6ff3:dcb5:7901:3609])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0af7sm2950990f8f.35.2025.07.04.09.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:20:59 -0700 (PDT)
Message-ID: <ad0656d62bfd203a2f0c984d15e683ea3ca01f46.camel@linuxfoundation.org>
Subject: Re: [PATCH] bitbake.conf: Add relative path from B to S to
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michal Sieron <michalwsieron@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Jul 2025 17:20:58 +0100
In-Reply-To: <20250704151153.286734-2-michalwsieron@gmail.com>
References: 
	<0c9426e4e7ff18ddbad4845e13f9a289e1ee9191.camel@linuxfoundation.org>
	 <20250704151153.286734-2-michalwsieron@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 16:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219949

On Fri, 2025-07-04 at 17:11 +0200, Michal Sieron wrote:
> > It gets even more strange as if you swap the build_root() to be before
> > the source_root() parameters, you see:
> >=20
> > /usr/src/debug/hello/1.0/build/../hello.c
> > 	/usr/src/debug/hello/1.0/build/../hello.c
> >=20
> > which is actually correct. You are supposed to order them from most
> > specific to least specific. That doesn't change the fact the output
> > from the other way around isn't correct.
> >=20
> > I still maintain this is a bug in gcc's handling of the prefix-maps.
>=20
> Welp, I used the same ordering as in bitbake.conf...
>=20
> Anyway, using now smaller set of flags
> =C2=A0=C2=A0=C2=A0 '-ffile-prefix-map=3D'=C2=A0 + meson.project_build_roo=
t()=C2=A0 + '=3D' + map_to,
> =C2=A0=C2=A0=C2=A0 '-ffile-prefix-map=3D'=C2=A0 + meson.project_source_ro=
ot()=C2=A0 + '=3D' + map_to,
> I tried doing the same, but now with clang:
> build_root() first: /usr/src/debug/hello/1.0/../hello.c
> source_root() first: /usr/src/debug/hello/1.0/build/../hello.c
>=20
> So I don't think your comment about this being a bug in gcc is correct.
> Unless the same bug is present in clang.
>=20
> I can't do the check in Yocto at the moment, but if you say the
> [...]/build/../hello.c variant is correct and Yocto would correctly
> populate -src package, then I would say that's the answer?
> That is, to change the order of those two flags in the bitbake.conf.

Experimenting a bit with the commands and gcc, it appears that the
first prefix remap will apply to relative paths.

My expectation was that it should add cwd and then canonicalise the
path, then apply the maps.

The problem is that if cwd changes, the file-prefix-map parameter is
wrong, so it all depends on where the command is being run from. We
can't guarantee that the command will always be run from a given
directory.

I went digging and this is the real problem:

https://git.yoctoproject.org/poky/commit/?id=3Dea00dbbcf3bacf6e115fb261d988=
0f52be25ca05


in that we removed -fcanon-prefix-map thinking it worked and it clearly
doesn't.

We *need* that option and it will need to be put back, probably gcc
specific. Copying Khem.

Cheers,

Richard

