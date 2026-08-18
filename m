Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78324C5DF81
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 21:05:13 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19027.1787087110313242549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 14:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DjoJLOuj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495437bb891so1199945e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787087108; x=1787691908; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WSipnl8MyDvUkXO82jsrXCi+q7kD8NTCaZ3EsWedjb8=;
        b=DjoJLOujc/edx567eYVJyx831mDK+SRKNmMey/wes94qEnvWHqrUQZpkPsGzYBFwAC
         jiCtQcjrYBvk8a4O9pL3ZeSXe0aljl+QTwLaOx2Q+wShsDqVDHISnR+AwheQOa6JYGw4
         T7ufDQMrjn0idLFs2KmTWYrF/4DnPJFqv8/I4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787087108; x=1787691908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSipnl8MyDvUkXO82jsrXCi+q7kD8NTCaZ3EsWedjb8=;
        b=mOm3CoG0pSwgtS3CV0t/jM+azXBHw2NEFCsi/5w2/QP3PPw4d/ZLhFKQz0kAd8IFwk
         HOwixqxpX2+nBHsIOuYnfNOFlQWhZhOeQimsnO+k/HPHhWqUEY1k64AhJAUrw9ghyYIJ
         gCJgIGpOliuPtS2EOYl64ZBwKQD2yCuKjNffdDmHecKTiSIMxcxMilwkqgQdCpSMx8U7
         s0+hJ9x4ErcjkmdfKf0dc/j4/qH7l1tYFmXgJRHhcJ0Ypj5PE+V3RqHDc8wBGMkbDlTN
         V2OMCXVRh5olEdEXF5XK7/DVfLKzItLSkeOdmeHRVnzBPZIzjNKv44uMICCSRNT4OPis
         rO7g==
X-Forwarded-Encrypted: i=1; AHgh+RqiidXYnvotnZhxp86A37dnqTYkqiL5iY1K9SGZdiogOi9VY5/uerLrXSOFHGGYvocKjXJ2g7A8/6LFAOWW6g95Rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZQIWGYnf9qfok+d41/DZdqmyvsMJtExMTELyAgiU2wgDuY3Be
	cDhVXCES5ZNo4qw7oW0A+GOF/IJw8yRmM4UfHXKUxzTL9BTzO6EYiYXh/KzeizjMDps=
X-Gm-Gg: AR+sD13JstSJgy5oFN6ZLaIPs2qBbAbjFOkclQ0L7ze4QwtKSfk98sYK7mhVb3Mp3aE
	4NGY47t7B1EF9F30Aa5bLvOp+4Nr223yWX9ohW1vU9OXncZPRL55MtsMI3D5GL0IITYKpVnvoeX
	KrCqq+XiZN9bj4N5TdQMixZoNdi4RKvpgyOkdtmtfib7bwIHXGIaR9aKX9SuBV84ZZvPGJDALP9
	TR6S7MClzlOmpAVKLcao18OLyvwLdhuSCEfUv2GEsK0aNUNQJ9wqf+BmjjWG4a1vPrZH9TL+Fb6
	NmqS/V7wpSWbBGJ16Hxapn/rVNNQzQRWWibzmm43Lw90vq8W54XVOkPVZZU2y53pp1jYRkvomZ2
	DbYhp54OXopd16cFjj3tPA5V09B9UbIz9stjoz4we3NJfiXwAc4d7nRnzNjglkdf/qdNDiybTag
	yYCnfqPRsTIMxoSUmJb+Drc12NtVGryahDuqUBWyFj09rLPirje36v+jm6lBgMbsGnWdOLXE3vq
	l0Mw556mye4Y+o6Et0OSKXYf8+uBuJA3+YQDAnVMCH7oY0uGfKJ1Q==
X-Received: by 2002:a05:600c:19c7:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-499aa0e7cfcmr415355e9.3.1787087108475;
        Tue, 18 Aug 2026 14:05:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee4b:f6b4:d308:732d? ([2001:8b0:aba:5f3c:ee4b:f6b4:d308:732d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e8ba03sm1215895e9.11.2026.08.18.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:05:07 -0700 (PDT)
Message-ID: <9a9798bb3c537d4d1f723d450980a52e5b9b7f77.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v15 00/12] rpm: 4.20.1 -> 6.0.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
 "mathieu.dubois-briand@bootlin.com"
	 <mathieu.dubois-briand@bootlin.com>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "mattware@cisco.com" <mattware@cisco.com>, "esparlin@cisco.com"	
 <esparlin@cisco.com>, "peter.marko@siemens.com" <peter.marko@siemens.com>, 
 "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Date: Tue, 18 Aug 2026 22:05:06 +0100
In-Reply-To: <8e27d69d-7d93-48a7-96c1-4145c477cb4c@windriver.com>
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
	 <9b1d36c0af04de14a7f59695e40f513dc454d7a4.camel@linuxfoundation.org>
	 <8e27d69d-7d93-48a7-96c1-4145c477cb4c@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 21:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243694

On Tue, 2026-08-18 at 16:09 +0000, Sumanth Gavini via lists.openembedded.or=
g wrote:
> You are correct, and we should not have different dependencies between=
=20
> packages based on the selected backend.
>=20
> In RPM 4, MERGEPERFILEDEPS =3D 1 resulted in __find_requires %{nil} and
> __find_provides %{nil}, suppressing all autogenerated Requires and Provid=
es.
>=20
> In RPM 6, use_internal_dependency_generator is no longer supported for=
=20
> v6-format packages, so the fileattr-based generators always run. The=20
> only way I see to suppress dependency generation is to set the=20
> individual fileattr macros to %{nil}. We observed incorrectly generated=
=20
> pkgconfig() dependencies on autobuilder and local builds, which led to=
=20
> these changes.
>=20
> Should we also suppress all autogenerated Provides in RPM 6 to match the=
=20
> RPM 4 behavior? If so, I'll need to identify the complete list of=20
> fileattr-based provides generators that need to be disabled
>=20
> Thanks to Alex and Mathieu for their testing and support throughout this=
=20
> upgrade.

Yes, I think we need to disable them.

Before we do that, I would like to understand what information this
changes and whether there are dependencies we're going to miss out
on=C2=A0that we really need to add to do_package.

So there are two things to work out:

- What information do we lose by turning off the rpm 4 rpmdep code in
do_package? Do we need to add/find some of it differently?

- What information do we lose by turning off the RPM 6 autogenerated
dependencies and is there any of that we need to add separately to
do_package somehow?

Cheers,

Richard

