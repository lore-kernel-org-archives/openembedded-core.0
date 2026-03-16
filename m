Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B7AF53D9C
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 21:02:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61614.1773694916620178090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 14:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KQxsiKLE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b49819938so180814f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 14:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773694915; x=1774299715; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGogOBy1zANSQJhNHJ8fPWvzXNAoK+g7QVLz60QRuzo=;
        b=KQxsiKLEgJNYDR9WcJ3R+8YAJ4VTFaq/jv2z6VfW83MVInYB1onazKpGF5tvdSmsoU
         jO5uS5Z3QF2K+c4UlYD6ugE2pTNGhI7WVaMyvxozEdEtRNbMRbG3HAREr5yZKTQOLX98
         90S8ycahAlGd4bTaP8Zf8pNzQx/SPcVIB7G60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694915; x=1774299715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGogOBy1zANSQJhNHJ8fPWvzXNAoK+g7QVLz60QRuzo=;
        b=e+ECqWyTXcIt9jdJuo2SZdXlja+ZwpGrqMJEBknrsXzBF1okmruGFI/OEpy2PFooYt
         pSx23lYoshZM4YrRNgV97Oc3OCjOhz0aaC3tKFHcrLUfm9+Q7EBqhMK3ZoezxFgnGl62
         EED6p3B+vUZZROXUtVQ28laVyDlmga2/WIuaIG3CR6jRhdEDvlAYDlQd1X4RaMh+e8UC
         /tpWCMcikndm2odLQ571ENjIrEJrxp5+5+BkPslYkchLqO57ogjTrT+XxDfPfoPu72ns
         zisteMlSZIPFTWLxJVehe8V7LZ3XIwAoov0SYHB/zhVvROTiEXEtrUtmJxugQ48NLBJg
         DYJA==
X-Forwarded-Encrypted: i=1; AJvYcCXBl93igSUYy/iA2Zx9sYNYQ/TCHD37VS3Bx3zwzV8oGhTi5lh0aeM9wyVNQvwEV1fK0o4pTT8yanPNfp5A8n0nog==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWyQpnKfLKpD0gL/PE1BthYBhrD0vK8axTIW3kzxnYZSd6eKGr
	HmU95f4w4wUbSqu6a/VINa40/xhlO2LzytMdVW9LGxLJD2kRj2FH2IdNLKSucZtSlQw=
X-Gm-Gg: ATEYQzx/ogQT4fbEhOSqNursx6eWh/+wTOcZ3kaF35+ySU5BAcv4f2IMnPT8CRqzFKL
	+7lluvfIAy7dNLFpqqO9ONnBILwdwDbkxM/WAov3IBtTn6FYGCh2gw8CaZPq/1d1iDqElPHHkbE
	oevwLW11uJoP8r1Atr6ezUopS4D+SJPBYlODbTBe4b6aujGhBjjTzva8eo9mbyWXKt38pic1PLH
	eiG5C+yRBodYpgHXj4t46wifHODqpCNYTpqbapyy27IxTaNo9cejIfeFBYcN/Z/TqqpqfB2ekfR
	MvkcdzqoYCuT+SPz9mYkIsdORQCnoK9crn7kjn3e7eXnV+XdtWoRtXMpjXujm6rlT3WofN7lSY8
	FBeeBPx+w2Yy5UvnYbGROOZIPbBKL1cO3wJtnNe00O64SfG4YP/ORYFQoYfvseHJY14uZL/ktYO
	TdQ1aIOyDmKTErlck7QGcZ1zTFQX6u+Z500+jf3CyKadc5W0q6COC2UTKmSzO0OOAJLw/ANhHev
	fMqZP3q2EpP8nJQ4klaHsxjXA==
X-Received: by 2002:a05:6000:310a:b0:439:de1d:74ae with SMTP id ffacd0b85a97d-43a04d868c3mr26991776f8f.22.1773694914940;
        Mon, 16 Mar 2026 14:01:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15f8:fc87:2277:10bc? ([2001:8b0:aba:5f3c:15f8:fc87:2277:10bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm6943325f8f.12.2026.03.16.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 14:01:54 -0700 (PDT)
Message-ID: <001cd479982cd530afb67cda3051f71876e9dc32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/5] bitbake.conf: Add SDKMACHINE to
 BUILDCFG_VARS, drop TARGET_FPU
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2026 21:01:53 +0000
In-Reply-To: <fdc3ba7d-e193-4c58-885a-2f269eaf7159@linux.microsoft.com>
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
	 <20260314094758.3929192-2-richard.purdie@linuxfoundation.org>
	 <fdc3ba7d-e193-4c58-885a-2f269eaf7159@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 21:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233269

On Mon, 2026-03-16 at 10:37 -0600, Alejandro Hernandez wrote:
> What are your thoughts on including TCLIBC in BUILCFG_VARS?.
>=20
> I often find myself missing this key information, but I may be biased
> due to my particular usecase,
> hence I would like other folks opinion on how useful this may be for
> the general public, sometimes
> we get similar information from TARGET_OS / LIBCEXTENSION, but that
> isn't always the case.

We need to try and keep the information concise and not have too much
there. I'd have thought TARGET_SYS should already have the libc
information as part of the target triplet?

Also, you can customise this locally if that helps.

Cheers,

Richard

