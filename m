Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C725C19F2A
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 16:27:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6933.1659630452699650443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 09:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TXQgCiUD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z12so286289wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=vEE1DN2fEip/D2ZE/lRKs4OQI3Dcmr11g3/SyDpapFI=;
        b=TXQgCiUDiGiJMQ0cmZpeWAD4ZwItVCg1aa8LyVivZKNVdwJLNtmNlhx54MZt05+Rck
         MxfidARbHHVG7xSUNOTM5oGcqCCKYSLRhomlzEZ47GIwqYmVKSewNytsBhLuhWTkOT/9
         jdcNsyxG4Oqe0Drz2KFo9qtnmomxMUkgvvkT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=vEE1DN2fEip/D2ZE/lRKs4OQI3Dcmr11g3/SyDpapFI=;
        b=k0tS7EXDIQ9DxS2B4EvDR/E+j6+/emZHzjhOpQsLttO5dDppC1TmDQWp9+2zOCGsoc
         f29pYDpsguJoWnauTzk9Vs6TpVVADBS49kHHZsZAV2P2Q2j+I2Gvk+Z5SFKsZ6+P6dK5
         YzRYb92S6K4OToAi/bC62QWE1ohypqBOU0m9zGd4j09p6od3Po1YdXYg6uG6BlmZDhuo
         cPQLkbkY2iXSuDVFyHTMnbYkCr0QUSJyroQZu6xbJylyu762lNUDF/OTCDmCZjAjSPOD
         BlZXyy9L8km5g74l5MORWXugzRNEVQzJ8o/AxvL9Y5RJdPDrY30gkwyhEGY2cqhBSbw/
         p05A==
X-Gm-Message-State: ACgBeo3OCSYSG39mXkmszZ2iUyFeKlOYEA6DnfDEXEx9aAAQorSQ8x1B
	iH4ytRdkvCMjFN7nsfidXiFp2Q==
X-Google-Smtp-Source: 
 AA6agR4sskEoPFicksvjpogF+mx7rm+RwhXvkyA9FgM+dQPbCHuUE8smbn3uaJxzEyfDaUg/9zohyA==
X-Received: by 2002:a05:6000:1b85:b0:21f:93d:a23d with SMTP id
 r5-20020a0560001b8500b0021f093da23dmr1920048wru.286.1659630450966;
        Thu, 04 Aug 2022 09:27:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3?
 ([2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3])
        by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b0021e74ef5ae8sm1621503wrr.21.2022.08.04.09.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 09:27:30 -0700 (PDT)
Message-ID: 
 <5cde45cec9a5aa114efce822f506502fa193c7f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] pseudo deadlock in rust via malloc backtrace
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2022 17:27:29 +0100
In-Reply-To: 
 <CAMKF1spReLumv7Hc_683PRMgYSBSdh4oYW+YEtuiGEWof0kv2w@mail.gmail.com>
References: 
	<f870b8169472e6737c99c74779e5680b935d57ed.camel@linuxfoundation.org>
	 <CAMKF1spReLumv7Hc_683PRMgYSBSdh4oYW+YEtuiGEWof0kv2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 16:27:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168861

On Thu, 2022-08-04 at 12:36 +0100, Khem Raj wrote:
>=20
>=20
> On Thu, Aug 4, 2022 at 10:05 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Just to note that where we've been seeing pseudo hangs in rust, it
> > seems jemalloc calls obtain_malloc_conf() which calls readlink()
> > which
> > pseudo intercepts and then calls malloc() which loops back to
> > jemalloc
> > which deadlocks. What fun.
> >=20
>=20
>=20
> I guess pseudo is doing this extra malloc right ?

Yes

>  Maybe disable instrumentation in jemalloc when building non target
> packages. This might avoid the issue at least=C2=A0
>=20

Sadly it doesn't help as it wants to load it isn't configuration and
the system setup from /proc too.

Cheers,

Richard

